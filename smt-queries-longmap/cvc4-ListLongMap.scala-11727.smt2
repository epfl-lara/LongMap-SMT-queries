; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!137470 () Bool)

(assert start!137470)

(declare-fun res!1080631 () Bool)

(declare-fun e!882606 () Bool)

(assert (=> start!137470 (=> (not res!1080631) (not e!882606))))

(declare-datatypes ((B!2706 0))(
  ( (B!2707 (val!19715 Int)) )
))
(declare-datatypes ((tuple2!25596 0))(
  ( (tuple2!25597 (_1!12809 (_ BitVec 64)) (_2!12809 B!2706)) )
))
(declare-datatypes ((List!36835 0))(
  ( (Nil!36832) (Cons!36831 (h!38374 tuple2!25596) (t!51749 List!36835)) )
))
(declare-fun l!1390 () List!36835)

(declare-fun isStrictlySorted!1093 (List!36835) Bool)

(assert (=> start!137470 (= res!1080631 (isStrictlySorted!1093 l!1390))))

(assert (=> start!137470 e!882606))

(declare-fun e!882605 () Bool)

(assert (=> start!137470 e!882605))

(assert (=> start!137470 true))

(declare-fun tp_is_empty!39251 () Bool)

(assert (=> start!137470 tp_is_empty!39251))

(declare-fun key!405 () (_ BitVec 64))

(declare-fun value!194 () B!2706)

(declare-fun e!882608 () Bool)

(declare-fun b!1581727 () Bool)

(declare-datatypes ((Option!933 0))(
  ( (Some!932 (v!22451 B!2706)) (None!931) )
))
(declare-fun getValueByKey!825 (List!36835 (_ BitVec 64)) Option!933)

(assert (=> b!1581727 (= e!882608 (not (= (getValueByKey!825 l!1390 key!405) (Some!932 value!194))))))

(declare-fun b!1581728 () Bool)

(declare-fun e!882607 () Bool)

(declare-datatypes ((tuple2!25598 0))(
  ( (tuple2!25599 (_1!12810 tuple2!25596) (_2!12810 List!36835)) )
))
(declare-datatypes ((Option!934 0))(
  ( (Some!933 (v!22452 tuple2!25598)) (None!932) )
))
(declare-fun lt!677007 () Option!934)

(declare-fun get!26825 (Option!934) tuple2!25598)

(assert (=> b!1581728 (= e!882607 (not (is-Nil!36832 (_2!12810 (get!26825 lt!677007)))))))

(declare-fun b!1581729 () Bool)

(declare-fun res!1080630 () Bool)

(assert (=> b!1581729 (=> (not res!1080630) (not e!882608))))

(assert (=> b!1581729 (= res!1080630 (not (is-Cons!36831 l!1390)))))

(declare-fun b!1581730 () Bool)

(assert (=> b!1581730 (= e!882606 e!882608)))

(declare-fun res!1080629 () Bool)

(assert (=> b!1581730 (=> (not res!1080629) (not e!882608))))

(assert (=> b!1581730 (= res!1080629 e!882607)))

(declare-fun res!1080628 () Bool)

(assert (=> b!1581730 (=> res!1080628 e!882607)))

(declare-fun isEmpty!1186 (Option!934) Bool)

(assert (=> b!1581730 (= res!1080628 (isEmpty!1186 lt!677007))))

(declare-fun unapply!102 (List!36835) Option!934)

(assert (=> b!1581730 (= lt!677007 (unapply!102 l!1390))))

(declare-fun b!1581731 () Bool)

(declare-fun res!1080632 () Bool)

(assert (=> b!1581731 (=> (not res!1080632) (not e!882606))))

(declare-fun containsKey!939 (List!36835 (_ BitVec 64)) Bool)

(assert (=> b!1581731 (= res!1080632 (containsKey!939 l!1390 key!405))))

(declare-fun b!1581732 () Bool)

(declare-fun res!1080633 () Bool)

(assert (=> b!1581732 (=> (not res!1080633) (not e!882606))))

(declare-fun contains!10507 (List!36835 tuple2!25596) Bool)

(assert (=> b!1581732 (= res!1080633 (contains!10507 l!1390 (tuple2!25597 key!405 value!194)))))

(declare-fun b!1581733 () Bool)

(declare-fun tp!114602 () Bool)

(assert (=> b!1581733 (= e!882605 (and tp_is_empty!39251 tp!114602))))

(assert (= (and start!137470 res!1080631) b!1581731))

(assert (= (and b!1581731 res!1080632) b!1581732))

(assert (= (and b!1581732 res!1080633) b!1581730))

(assert (= (and b!1581730 (not res!1080628)) b!1581728))

(assert (= (and b!1581730 res!1080629) b!1581729))

(assert (= (and b!1581729 res!1080630) b!1581727))

(assert (= (and start!137470 (is-Cons!36831 l!1390)) b!1581733))

(declare-fun m!1452573 () Bool)

(assert (=> start!137470 m!1452573))

(declare-fun m!1452575 () Bool)

(assert (=> b!1581731 m!1452575))

(declare-fun m!1452577 () Bool)

(assert (=> b!1581727 m!1452577))

(declare-fun m!1452579 () Bool)

(assert (=> b!1581732 m!1452579))

(declare-fun m!1452581 () Bool)

(assert (=> b!1581728 m!1452581))

(declare-fun m!1452583 () Bool)

(assert (=> b!1581730 m!1452583))

(declare-fun m!1452585 () Bool)

(assert (=> b!1581730 m!1452585))

(push 1)

(assert (not b!1581727))

(assert (not b!1581731))

(assert (not b!1581732))

(assert (not b!1581730))

(assert (not b!1581728))

(assert (not b!1581733))

(assert tp_is_empty!39251)

(assert (not start!137470))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!166817 () Bool)

(declare-fun res!1080638 () Bool)

(declare-fun e!882619 () Bool)

(assert (=> d!166817 (=> res!1080638 e!882619)))

(assert (=> d!166817 (= res!1080638 (and (is-Cons!36831 l!1390) (= (_1!12809 (h!38374 l!1390)) key!405)))))

(assert (=> d!166817 (= (containsKey!939 l!1390 key!405) e!882619)))

(declare-fun b!1581750 () Bool)

(declare-fun e!882620 () Bool)

(assert (=> b!1581750 (= e!882619 e!882620)))

(declare-fun res!1080639 () Bool)

(assert (=> b!1581750 (=> (not res!1080639) (not e!882620))))

(assert (=> b!1581750 (= res!1080639 (and (or (not (is-Cons!36831 l!1390)) (bvsle (_1!12809 (h!38374 l!1390)) key!405)) (is-Cons!36831 l!1390) (bvslt (_1!12809 (h!38374 l!1390)) key!405)))))

(declare-fun b!1581751 () Bool)

(assert (=> b!1581751 (= e!882620 (containsKey!939 (t!51749 l!1390) key!405))))

(assert (= (and d!166817 (not res!1080638)) b!1581750))

(assert (= (and b!1581750 res!1080639) b!1581751))

(declare-fun m!1452589 () Bool)

(assert (=> b!1581751 m!1452589))

(assert (=> b!1581731 d!166817))

(declare-fun lt!677013 () Bool)

(declare-fun d!166825 () Bool)

(declare-fun content!852 (List!36835) (Set tuple2!25596))

(assert (=> d!166825 (= lt!677013 (member (tuple2!25597 key!405 value!194) (content!852 l!1390)))))

(declare-fun e!882635 () Bool)

(assert (=> d!166825 (= lt!677013 e!882635)))

(declare-fun res!1080655 () Bool)

(assert (=> d!166825 (=> (not res!1080655) (not e!882635))))

(assert (=> d!166825 (= res!1080655 (is-Cons!36831 l!1390))))

(assert (=> d!166825 (= (contains!10507 l!1390 (tuple2!25597 key!405 value!194)) lt!677013)))

(declare-fun b!1581766 () Bool)

(declare-fun e!882636 () Bool)

(assert (=> b!1581766 (= e!882635 e!882636)))

(declare-fun res!1080654 () Bool)

(assert (=> b!1581766 (=> res!1080654 e!882636)))

(assert (=> b!1581766 (= res!1080654 (= (h!38374 l!1390) (tuple2!25597 key!405 value!194)))))

(declare-fun b!1581767 () Bool)

(assert (=> b!1581767 (= e!882636 (contains!10507 (t!51749 l!1390) (tuple2!25597 key!405 value!194)))))

(assert (= (and d!166825 res!1080655) b!1581766))

(assert (= (and b!1581766 (not res!1080654)) b!1581767))

(declare-fun m!1452597 () Bool)

(assert (=> d!166825 m!1452597))

(declare-fun m!1452599 () Bool)

(assert (=> d!166825 m!1452599))

(declare-fun m!1452601 () Bool)

(assert (=> b!1581767 m!1452601))

(assert (=> b!1581732 d!166825))

(declare-fun d!166831 () Bool)

(declare-fun res!1080662 () Bool)

(declare-fun e!882647 () Bool)

(assert (=> d!166831 (=> res!1080662 e!882647)))

(assert (=> d!166831 (= res!1080662 (or (is-Nil!36832 l!1390) (is-Nil!36832 (t!51749 l!1390))))))

(assert (=> d!166831 (= (isStrictlySorted!1093 l!1390) e!882647)))

(declare-fun b!1581782 () Bool)

(declare-fun e!882648 () Bool)

(assert (=> b!1581782 (= e!882647 e!882648)))

(declare-fun res!1080663 () Bool)

(assert (=> b!1581782 (=> (not res!1080663) (not e!882648))))

(assert (=> b!1581782 (= res!1080663 (bvslt (_1!12809 (h!38374 l!1390)) (_1!12809 (h!38374 (t!51749 l!1390)))))))

(declare-fun b!1581783 () Bool)

(assert (=> b!1581783 (= e!882648 (isStrictlySorted!1093 (t!51749 l!1390)))))

(assert (= (and d!166831 (not res!1080662)) b!1581782))

(assert (= (and b!1581782 res!1080663) b!1581783))

(declare-fun m!1452605 () Bool)

(assert (=> b!1581783 m!1452605))

(assert (=> start!137470 d!166831))

(declare-fun b!1581803 () Bool)

(declare-fun e!882661 () Option!933)

(declare-fun e!882662 () Option!933)

(assert (=> b!1581803 (= e!882661 e!882662)))

(declare-fun c!146632 () Bool)

(assert (=> b!1581803 (= c!146632 (and (is-Cons!36831 l!1390) (not (= (_1!12809 (h!38374 l!1390)) key!405))))))

(declare-fun b!1581805 () Bool)

(assert (=> b!1581805 (= e!882662 None!931)))

(declare-fun b!1581802 () Bool)

(assert (=> b!1581802 (= e!882661 (Some!932 (_2!12809 (h!38374 l!1390))))))

(declare-fun b!1581804 () Bool)

(assert (=> b!1581804 (= e!882662 (getValueByKey!825 (t!51749 l!1390) key!405))))

(declare-fun d!166835 () Bool)

(declare-fun c!146631 () Bool)

(assert (=> d!166835 (= c!146631 (and (is-Cons!36831 l!1390) (= (_1!12809 (h!38374 l!1390)) key!405)))))

(assert (=> d!166835 (= (getValueByKey!825 l!1390 key!405) e!882661)))

(assert (= (and d!166835 c!146631) b!1581802))

(assert (= (and d!166835 (not c!146631)) b!1581803))

(assert (= (and b!1581803 c!146632) b!1581804))

(assert (= (and b!1581803 (not c!146632)) b!1581805))

(declare-fun m!1452611 () Bool)

(assert (=> b!1581804 m!1452611))

(assert (=> b!1581727 d!166835))

(declare-fun d!166841 () Bool)

(assert (=> d!166841 (= (get!26825 lt!677007) (v!22452 lt!677007))))

(assert (=> b!1581728 d!166841))

(declare-fun d!166843 () Bool)

(assert (=> d!166843 (= (isEmpty!1186 lt!677007) (not (is-Some!933 lt!677007)))))

(assert (=> b!1581730 d!166843))

(declare-fun d!166845 () Bool)

(assert (=> d!166845 (= (unapply!102 l!1390) (ite (is-Nil!36832 l!1390) None!932 (Some!933 (tuple2!25599 (h!38374 l!1390) (t!51749 l!1390)))))))

(assert (=> b!1581730 d!166845))

(declare-fun b!1581820 () Bool)

(declare-fun e!882675 () Bool)

(declare-fun tp!114605 () Bool)

(assert (=> b!1581820 (= e!882675 (and tp_is_empty!39251 tp!114605))))

(assert (=> b!1581733 (= tp!114602 e!882675)))

(assert (= (and b!1581733 (is-Cons!36831 (t!51749 l!1390))) b!1581820))

(push 1)

