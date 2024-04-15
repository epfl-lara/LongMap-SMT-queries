; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107840 () Bool)

(assert start!107840)

(declare-fun res!847401 () Bool)

(declare-fun e!727556 () Bool)

(assert (=> start!107840 (=> (not res!847401) (not e!727556))))

(declare-datatypes ((B!2162 0))(
  ( (B!2163 (val!16677 Int)) )
))
(declare-datatypes ((tuple2!21512 0))(
  ( (tuple2!21513 (_1!10767 (_ BitVec 64)) (_2!10767 B!2162)) )
))
(declare-datatypes ((List!28676 0))(
  ( (Nil!28673) (Cons!28672 (h!29881 tuple2!21512) (t!42201 List!28676)) )
))
(declare-fun l!595 () List!28676)

(declare-fun isStrictlySorted!852 (List!28676) Bool)

(assert (=> start!107840 (= res!847401 (isStrictlySorted!852 l!595))))

(assert (=> start!107840 e!727556))

(declare-fun e!727555 () Bool)

(assert (=> start!107840 e!727555))

(assert (=> start!107840 true))

(declare-fun b!1274754 () Bool)

(declare-fun res!847402 () Bool)

(assert (=> b!1274754 (=> (not res!847402) (not e!727556))))

(declare-fun key!173 () (_ BitVec 64))

(get-info :version)

(assert (=> b!1274754 (= res!847402 (and (not (= (_1!10767 (h!29881 l!595)) key!173)) ((_ is Cons!28672) l!595)))))

(declare-fun b!1274755 () Bool)

(declare-fun ListPrimitiveSize!166 (List!28676) Int)

(assert (=> b!1274755 (= e!727556 (>= (ListPrimitiveSize!166 (t!42201 l!595)) (ListPrimitiveSize!166 l!595)))))

(declare-fun b!1274756 () Bool)

(declare-fun tp_is_empty!33205 () Bool)

(declare-fun tp!98040 () Bool)

(assert (=> b!1274756 (= e!727555 (and tp_is_empty!33205 tp!98040))))

(assert (= (and start!107840 res!847401) b!1274754))

(assert (= (and b!1274754 res!847402) b!1274755))

(assert (= (and start!107840 ((_ is Cons!28672) l!595)) b!1274756))

(declare-fun m!1170863 () Bool)

(assert (=> start!107840 m!1170863))

(declare-fun m!1170865 () Bool)

(assert (=> b!1274755 m!1170865))

(declare-fun m!1170867 () Bool)

(assert (=> b!1274755 m!1170867))

(check-sat (not b!1274755) (not start!107840) (not b!1274756) tp_is_empty!33205)
(check-sat)
(get-model)

(declare-fun d!140113 () Bool)

(declare-fun lt!575118 () Int)

(assert (=> d!140113 (>= lt!575118 0)))

(declare-fun e!727573 () Int)

(assert (=> d!140113 (= lt!575118 e!727573)))

(declare-fun c!123868 () Bool)

(assert (=> d!140113 (= c!123868 ((_ is Nil!28673) (t!42201 l!595)))))

(assert (=> d!140113 (= (ListPrimitiveSize!166 (t!42201 l!595)) lt!575118)))

(declare-fun b!1274787 () Bool)

(assert (=> b!1274787 (= e!727573 0)))

(declare-fun b!1274788 () Bool)

(assert (=> b!1274788 (= e!727573 (+ 1 (ListPrimitiveSize!166 (t!42201 (t!42201 l!595)))))))

(assert (= (and d!140113 c!123868) b!1274787))

(assert (= (and d!140113 (not c!123868)) b!1274788))

(declare-fun m!1170881 () Bool)

(assert (=> b!1274788 m!1170881))

(assert (=> b!1274755 d!140113))

(declare-fun d!140119 () Bool)

(declare-fun lt!575119 () Int)

(assert (=> d!140119 (>= lt!575119 0)))

(declare-fun e!727576 () Int)

(assert (=> d!140119 (= lt!575119 e!727576)))

(declare-fun c!123871 () Bool)

(assert (=> d!140119 (= c!123871 ((_ is Nil!28673) l!595))))

(assert (=> d!140119 (= (ListPrimitiveSize!166 l!595) lt!575119)))

(declare-fun b!1274789 () Bool)

(assert (=> b!1274789 (= e!727576 0)))

(declare-fun b!1274790 () Bool)

(assert (=> b!1274790 (= e!727576 (+ 1 (ListPrimitiveSize!166 (t!42201 l!595))))))

(assert (= (and d!140119 c!123871) b!1274789))

(assert (= (and d!140119 (not c!123871)) b!1274790))

(assert (=> b!1274790 m!1170865))

(assert (=> b!1274755 d!140119))

(declare-fun d!140121 () Bool)

(declare-fun res!847425 () Bool)

(declare-fun e!727591 () Bool)

(assert (=> d!140121 (=> res!847425 e!727591)))

(assert (=> d!140121 (= res!847425 (or ((_ is Nil!28673) l!595) ((_ is Nil!28673) (t!42201 l!595))))))

(assert (=> d!140121 (= (isStrictlySorted!852 l!595) e!727591)))

(declare-fun b!1274807 () Bool)

(declare-fun e!727592 () Bool)

(assert (=> b!1274807 (= e!727591 e!727592)))

(declare-fun res!847426 () Bool)

(assert (=> b!1274807 (=> (not res!847426) (not e!727592))))

(assert (=> b!1274807 (= res!847426 (bvslt (_1!10767 (h!29881 l!595)) (_1!10767 (h!29881 (t!42201 l!595)))))))

(declare-fun b!1274809 () Bool)

(assert (=> b!1274809 (= e!727592 (isStrictlySorted!852 (t!42201 l!595)))))

(assert (= (and d!140121 (not res!847425)) b!1274807))

(assert (= (and b!1274807 res!847426) b!1274809))

(declare-fun m!1170887 () Bool)

(assert (=> b!1274809 m!1170887))

(assert (=> start!107840 d!140121))

(declare-fun b!1274819 () Bool)

(declare-fun e!727599 () Bool)

(declare-fun tp!98049 () Bool)

(assert (=> b!1274819 (= e!727599 (and tp_is_empty!33205 tp!98049))))

(assert (=> b!1274756 (= tp!98040 e!727599)))

(assert (= (and b!1274756 ((_ is Cons!28672) (t!42201 l!595))) b!1274819))

(check-sat tp_is_empty!33205 (not b!1274809) (not b!1274790) (not b!1274788) (not b!1274819))
(check-sat)
