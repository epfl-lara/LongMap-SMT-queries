; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107842 () Bool)

(assert start!107842)

(declare-fun res!847434 () Bool)

(declare-fun e!727591 () Bool)

(assert (=> start!107842 (=> (not res!847434) (not e!727591))))

(declare-datatypes ((B!2164 0))(
  ( (B!2165 (val!16678 Int)) )
))
(declare-datatypes ((tuple2!21438 0))(
  ( (tuple2!21439 (_1!10730 (_ BitVec 64)) (_2!10730 B!2164)) )
))
(declare-datatypes ((List!28604 0))(
  ( (Nil!28601) (Cons!28600 (h!29809 tuple2!21438) (t!42137 List!28604)) )
))
(declare-fun l!595 () List!28604)

(declare-fun isStrictlySorted!856 (List!28604) Bool)

(assert (=> start!107842 (= res!847434 (isStrictlySorted!856 l!595))))

(assert (=> start!107842 e!727591))

(declare-fun e!727590 () Bool)

(assert (=> start!107842 e!727590))

(assert (=> start!107842 true))

(declare-fun b!1274827 () Bool)

(declare-fun res!847435 () Bool)

(assert (=> b!1274827 (=> (not res!847435) (not e!727591))))

(declare-fun key!173 () (_ BitVec 64))

(get-info :version)

(assert (=> b!1274827 (= res!847435 (and (not (= (_1!10730 (h!29809 l!595)) key!173)) ((_ is Cons!28600) l!595)))))

(declare-fun b!1274828 () Bool)

(declare-fun ListPrimitiveSize!167 (List!28604) Int)

(assert (=> b!1274828 (= e!727591 (>= (ListPrimitiveSize!167 (t!42137 l!595)) (ListPrimitiveSize!167 l!595)))))

(declare-fun b!1274829 () Bool)

(declare-fun tp_is_empty!33207 () Bool)

(declare-fun tp!98042 () Bool)

(assert (=> b!1274829 (= e!727590 (and tp_is_empty!33207 tp!98042))))

(assert (= (and start!107842 res!847434) b!1274827))

(assert (= (and b!1274827 res!847435) b!1274828))

(assert (= (and start!107842 ((_ is Cons!28600) l!595)) b!1274829))

(declare-fun m!1171369 () Bool)

(assert (=> start!107842 m!1171369))

(declare-fun m!1171371 () Bool)

(assert (=> b!1274828 m!1171371))

(declare-fun m!1171373 () Bool)

(assert (=> b!1274828 m!1171373))

(check-sat (not start!107842) (not b!1274828) (not b!1274829) tp_is_empty!33207)
(check-sat)
(get-model)

(declare-fun d!140225 () Bool)

(declare-fun res!847446 () Bool)

(declare-fun e!727602 () Bool)

(assert (=> d!140225 (=> res!847446 e!727602)))

(assert (=> d!140225 (= res!847446 (or ((_ is Nil!28601) l!595) ((_ is Nil!28601) (t!42137 l!595))))))

(assert (=> d!140225 (= (isStrictlySorted!856 l!595) e!727602)))

(declare-fun b!1274843 () Bool)

(declare-fun e!727603 () Bool)

(assert (=> b!1274843 (= e!727602 e!727603)))

(declare-fun res!847447 () Bool)

(assert (=> b!1274843 (=> (not res!847447) (not e!727603))))

(assert (=> b!1274843 (= res!847447 (bvslt (_1!10730 (h!29809 l!595)) (_1!10730 (h!29809 (t!42137 l!595)))))))

(declare-fun b!1274844 () Bool)

(assert (=> b!1274844 (= e!727603 (isStrictlySorted!856 (t!42137 l!595)))))

(assert (= (and d!140225 (not res!847446)) b!1274843))

(assert (= (and b!1274843 res!847447) b!1274844))

(declare-fun m!1171381 () Bool)

(assert (=> b!1274844 m!1171381))

(assert (=> start!107842 d!140225))

(declare-fun d!140229 () Bool)

(declare-fun lt!575292 () Int)

(assert (=> d!140229 (>= lt!575292 0)))

(declare-fun e!727612 () Int)

(assert (=> d!140229 (= lt!575292 e!727612)))

(declare-fun c!123882 () Bool)

(assert (=> d!140229 (= c!123882 ((_ is Nil!28601) (t!42137 l!595)))))

(assert (=> d!140229 (= (ListPrimitiveSize!167 (t!42137 l!595)) lt!575292)))

(declare-fun b!1274855 () Bool)

(assert (=> b!1274855 (= e!727612 0)))

(declare-fun b!1274856 () Bool)

(assert (=> b!1274856 (= e!727612 (+ 1 (ListPrimitiveSize!167 (t!42137 (t!42137 l!595)))))))

(assert (= (and d!140229 c!123882) b!1274855))

(assert (= (and d!140229 (not c!123882)) b!1274856))

(declare-fun m!1171385 () Bool)

(assert (=> b!1274856 m!1171385))

(assert (=> b!1274828 d!140229))

(declare-fun d!140235 () Bool)

(declare-fun lt!575293 () Int)

(assert (=> d!140235 (>= lt!575293 0)))

(declare-fun e!727613 () Int)

(assert (=> d!140235 (= lt!575293 e!727613)))

(declare-fun c!123883 () Bool)

(assert (=> d!140235 (= c!123883 ((_ is Nil!28601) l!595))))

(assert (=> d!140235 (= (ListPrimitiveSize!167 l!595) lt!575293)))

(declare-fun b!1274857 () Bool)

(assert (=> b!1274857 (= e!727613 0)))

(declare-fun b!1274858 () Bool)

(assert (=> b!1274858 (= e!727613 (+ 1 (ListPrimitiveSize!167 (t!42137 l!595))))))

(assert (= (and d!140235 c!123883) b!1274857))

(assert (= (and d!140235 (not c!123883)) b!1274858))

(assert (=> b!1274858 m!1171371))

(assert (=> b!1274828 d!140235))

(declare-fun b!1274867 () Bool)

(declare-fun e!727618 () Bool)

(declare-fun tp!98048 () Bool)

(assert (=> b!1274867 (= e!727618 (and tp_is_empty!33207 tp!98048))))

(assert (=> b!1274829 (= tp!98042 e!727618)))

(assert (= (and b!1274829 ((_ is Cons!28600) (t!42137 l!595))) b!1274867))

(check-sat (not b!1274844) (not b!1274867) tp_is_empty!33207 (not b!1274858) (not b!1274856))
(check-sat)
