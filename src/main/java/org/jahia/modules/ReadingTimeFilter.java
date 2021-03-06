package org.jahia.modules;

import org.jahia.services.content.JCRNodeWrapper;
import org.jahia.services.render.RenderContext;
import org.jahia.services.render.Resource;
import org.jahia.services.render.filter.AbstractFilter;
import org.jahia.services.render.filter.RenderChain;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.jcr.Node;
import javax.jcr.PropertyIterator;

/**
 * Created by pol on 25/07/2018.
 */
public class ReadingTimeFilter extends AbstractFilter {
    private static final Logger logger = LoggerFactory.getLogger(ReadingTimeFilter.class);
    @Override
    public String execute(String previousOut, RenderContext renderContext, Resource resource, RenderChain chain) throws Exception {
        final JCRNodeWrapper node = resource.getNode();
        final PropertyIterator references = node.getWeakReferences("j:bindedComponent");
        while (references.hasNext()) {
            final Node pickedNode = references.nextProperty().getParent();
            if (pickedNode.isNodeType("jnt:readingTime")) {
                logger.debug("Add reading time div for " + pickedNode.getPath());
                return String.format("<div id=\"readingtime_%s\">%s</div>", pickedNode.getIdentifier(), previousOut);
            }
        }
        return super.execute(previousOut, renderContext, resource, chain);
    }
}
