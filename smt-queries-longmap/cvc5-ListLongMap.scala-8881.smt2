; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107826 () Bool)

(assert start!107826)

(declare-fun res!847353 () Bool)

(declare-fun e!727497 () Bool)

(assert (=> start!107826 (=> (not res!847353) (not e!727497))))

(declare-datatypes ((B!2160 0))(
  ( (B!2161 (val!16676 Int)) )
))
(declare-datatypes ((tuple2!21510 0))(
  ( (tuple2!21511 (_1!10766 (_ BitVec 64)) (_2!10766 B!2160)) )
))
(declare-datatypes ((List!28675 0))(
  ( (Nil!28672) (Cons!28671 (h!29880 tuple2!21510) (t!42200 List!28675)) )
))
(declare-fun l!595 () List!28675)

(declare-fun isStrictlySorted!851 (List!28675) Bool)

(assert (=> start!107826 (= res!847353 (isStrictlySorted!851 l!595))))

(assert (=> start!107826 e!727497))

(declare-fun e!727499 () Bool)

(assert (=> start!107826 e!727499))

(assert (=> start!107826 true))

(declare-fun b!1274689 () Bool)

(declare-fun e!727498 () Bool)

(declare-fun key!173 () (_ BitVec 64))

(declare-fun containsKey!700 (List!28675 (_ BitVec 64)) Bool)

(assert (=> b!1274689 (= e!727498 (containsKey!700 (t!42200 l!595) key!173))))

(declare-fun b!1274688 () Bool)

(assert (=> b!1274688 (= e!727497 e!727498)))

(declare-fun res!847352 () Bool)

(assert (=> b!1274688 (=> res!847352 e!727498)))

(assert (=> b!1274688 (= res!847352 (not (isStrictlySorted!851 (t!42200 l!595))))))

(declare-fun b!1274687 () Bool)

(declare-fun res!847354 () Bool)

(assert (=> b!1274687 (=> (not res!847354) (not e!727497))))

(assert (=> b!1274687 (= res!847354 (and (is-Cons!28671 l!595) (= (_1!10766 (h!29880 l!595)) key!173)))))

(declare-fun b!1274690 () Bool)

(declare-fun tp_is_empty!33203 () Bool)

(declare-fun tp!98028 () Bool)

(assert (=> b!1274690 (= e!727499 (and tp_is_empty!33203 tp!98028))))

(assert (= (and start!107826 res!847353) b!1274687))

(assert (= (and b!1274687 res!847354) b!1274688))

(assert (= (and b!1274688 (not res!847352)) b!1274689))

(assert (= (and start!107826 (is-Cons!28671 l!595)) b!1274690))

(declare-fun m!1170845 () Bool)

(assert (=> start!107826 m!1170845))

(declare-fun m!1170847 () Bool)

(assert (=> b!1274689 m!1170847))

(declare-fun m!1170849 () Bool)

(assert (=> b!1274688 m!1170849))

(push 1)

(assert (not b!1274688))

(assert (not b!1274689))

(assert (not b!1274690))

(assert tp_is_empty!33203)

(assert (not start!107826))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!140095 () Bool)

(declare-fun res!847365 () Bool)

(declare-fun e!727510 () Bool)

(assert (=> d!140095 (=> res!847365 e!727510)))

(assert (=> d!140095 (= res!847365 (or (is-Nil!28672 l!595) (is-Nil!28672 (t!42200 l!595))))))

(assert (=> d!140095 (= (isStrictlySorted!851 l!595) e!727510)))

(declare-fun b!1274701 () Bool)

(declare-fun e!727511 () Bool)

(assert (=> b!1274701 (= e!727510 e!727511)))

(declare-fun res!847366 () Bool)

(assert (=> b!1274701 (=> (not res!847366) (not e!727511))))

(assert (=> b!1274701 (= res!847366 (bvslt (_1!10766 (h!29880 l!595)) (_1!10766 (h!29880 (t!42200 l!595)))))))

(declare-fun b!1274702 () Bool)

(assert (=> b!1274702 (= e!727511 (isStrictlySorted!851 (t!42200 l!595)))))

(assert (= (and d!140095 (not res!847365)) b!1274701))

(assert (= (and b!1274701 res!847366) b!1274702))

(assert (=> b!1274702 m!1170849))

(assert (=> start!107826 d!140095))

(declare-fun d!140101 () Bool)

(declare-fun res!847387 () Bool)

(declare-fun e!727532 () Bool)

(assert (=> d!140101 (=> res!847387 e!727532)))

(assert (=> d!140101 (= res!847387 (and (is-Cons!28671 (t!42200 l!595)) (= (_1!10766 (h!29880 (t!42200 l!595))) key!173)))))

(assert (=> d!140101 (= (containsKey!700 (t!42200 l!595) key!173) e!727532)))

(declare-fun b!1274723 () Bool)

(declare-fun e!727533 () Bool)

(assert (=> b!1274723 (= e!727532 e!727533)))

(declare-fun res!847388 () Bool)

(assert (=> b!1274723 (=> (not res!847388) (not e!727533))))

(assert (=> b!1274723 (= res!847388 (and (or (not (is-Cons!28671 (t!42200 l!595))) (bvsle (_1!10766 (h!29880 (t!42200 l!595))) key!173)) (is-Cons!28671 (t!42200 l!595)) (bvslt (_1!10766 (h!29880 (t!42200 l!595))) key!173)))))

(declare-fun b!1274724 () Bool)

(assert (=> b!1274724 (= e!727533 (containsKey!700 (t!42200 (t!42200 l!595)) key!173))))

(assert (= (and d!140101 (not res!847387)) b!1274723))

(assert (= (and b!1274723 res!847388) b!1274724))

(declare-fun m!1170857 () Bool)

(assert (=> b!1274724 m!1170857))

(assert (=> b!1274689 d!140101))

(declare-fun d!140107 () Bool)

(declare-fun res!847391 () Bool)

(declare-fun e!727536 () Bool)

(assert (=> d!140107 (=> res!847391 e!727536)))

(assert (=> d!140107 (= res!847391 (or (is-Nil!28672 (t!42200 l!595)) (is-Nil!28672 (t!42200 (t!42200 l!595)))))))

(assert (=> d!140107 (= (isStrictlySorted!851 (t!42200 l!595)) e!727536)))

(declare-fun b!1274727 () Bool)

(declare-fun e!727537 () Bool)

(assert (=> b!1274727 (= e!727536 e!727537)))

(declare-fun res!847392 () Bool)

(assert (=> b!1274727 (=> (not res!847392) (not e!727537))))

(assert (=> b!1274727 (= res!847392 (bvslt (_1!10766 (h!29880 (t!42200 l!595))) (_1!10766 (h!29880 (t!42200 (t!42200 l!595))))))))

(declare-fun b!1274728 () Bool)

(assert (=> b!1274728 (= e!727537 (isStrictlySorted!851 (t!42200 (t!42200 l!595))))))

(assert (= (and d!140107 (not res!847391)) b!1274727))

(assert (= (and b!1274727 res!847392) b!1274728))

(declare-fun m!1170859 () Bool)

(assert (=> b!1274728 m!1170859))

(assert (=> b!1274688 d!140107))

(declare-fun b!1274742 () Bool)

(declare-fun e!727547 () Bool)

(declare-fun tp!98034 () Bool)

(assert (=> b!1274742 (= e!727547 (and tp_is_empty!33203 tp!98034))))

(assert (=> b!1274690 (= tp!98028 e!727547)))

(assert (= (and b!1274690 (is-Cons!28671 (t!42200 l!595))) b!1274742))

(push 1)

(assert (not b!1274742))

(assert (not b!1274724))

(assert (not b!1274728))

(assert tp_is_empty!33203)

(assert (not b!1274702))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

