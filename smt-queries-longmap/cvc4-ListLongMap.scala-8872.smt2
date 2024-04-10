; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107712 () Bool)

(assert start!107712)

(declare-datatypes ((B!2106 0))(
  ( (B!2107 (val!16649 Int)) )
))
(declare-datatypes ((tuple2!21380 0))(
  ( (tuple2!21381 (_1!10701 (_ BitVec 64)) (_2!10701 B!2106)) )
))
(declare-datatypes ((List!28575 0))(
  ( (Nil!28572) (Cons!28571 (h!29780 tuple2!21380) (t!42108 List!28575)) )
))
(declare-datatypes ((ListLongMap!19109 0))(
  ( (ListLongMap!19110 (toList!9570 List!28575)) )
))
(declare-fun thiss!217 () ListLongMap!19109)

(declare-fun isStrictlySorted!837 (List!28575) Bool)

(assert (=> start!107712 (not (isStrictlySorted!837 (toList!9570 thiss!217)))))

(declare-fun e!727216 () Bool)

(declare-fun inv!44693 (ListLongMap!19109) Bool)

(assert (=> start!107712 (and (inv!44693 thiss!217) e!727216)))

(declare-fun b!1274331 () Bool)

(declare-fun tp!97901 () Bool)

(assert (=> b!1274331 (= e!727216 tp!97901)))

(assert (= start!107712 b!1274331))

(declare-fun m!1171131 () Bool)

(assert (=> start!107712 m!1171131))

(declare-fun m!1171133 () Bool)

(assert (=> start!107712 m!1171133))

(push 1)

(assert (not start!107712))

(assert (not b!1274331))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!140119 () Bool)

(declare-fun res!847239 () Bool)

(declare-fun e!727239 () Bool)

(assert (=> d!140119 (=> res!847239 e!727239)))

(assert (=> d!140119 (= res!847239 (or (is-Nil!28572 (toList!9570 thiss!217)) (is-Nil!28572 (t!42108 (toList!9570 thiss!217)))))))

(assert (=> d!140119 (= (isStrictlySorted!837 (toList!9570 thiss!217)) e!727239)))

(declare-fun b!1274358 () Bool)

(declare-fun e!727240 () Bool)

(assert (=> b!1274358 (= e!727239 e!727240)))

(declare-fun res!847240 () Bool)

(assert (=> b!1274358 (=> (not res!847240) (not e!727240))))

(assert (=> b!1274358 (= res!847240 (bvslt (_1!10701 (h!29780 (toList!9570 thiss!217))) (_1!10701 (h!29780 (t!42108 (toList!9570 thiss!217))))))))

(declare-fun b!1274359 () Bool)

(assert (=> b!1274359 (= e!727240 (isStrictlySorted!837 (t!42108 (toList!9570 thiss!217))))))

(assert (= (and d!140119 (not res!847239)) b!1274358))

(assert (= (and b!1274358 res!847240) b!1274359))

(declare-fun m!1171139 () Bool)

(assert (=> b!1274359 m!1171139))

