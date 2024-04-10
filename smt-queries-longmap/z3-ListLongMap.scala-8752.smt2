; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!106212 () Bool)

(assert start!106212)

(declare-fun res!842107 () Bool)

(declare-fun e!720043 () Bool)

(assert (=> start!106212 (=> (not res!842107) (not e!720043))))

(declare-datatypes ((B!1906 0))(
  ( (B!1907 (val!16288 Int)) )
))
(declare-datatypes ((tuple2!21094 0))(
  ( (tuple2!21095 (_1!10558 (_ BitVec 64)) (_2!10558 B!1906)) )
))
(declare-datatypes ((List!28280 0))(
  ( (Nil!28277) (Cons!28276 (h!29485 tuple2!21094) (t!41801 List!28280)) )
))
(declare-datatypes ((ListLongMap!18967 0))(
  ( (ListLongMap!18968 (toList!9499 List!28280)) )
))
(declare-fun lm!212 () ListLongMap!18967)

(declare-fun a1!67 () (_ BitVec 64))

(declare-fun contains!7620 (ListLongMap!18967 (_ BitVec 64)) Bool)

(assert (=> start!106212 (= res!842107 (not (contains!7620 lm!212 a1!67)))))

(assert (=> start!106212 e!720043))

(declare-fun e!720044 () Bool)

(declare-fun inv!44065 (ListLongMap!18967) Bool)

(assert (=> start!106212 (and (inv!44065 lm!212) e!720044)))

(assert (=> start!106212 true))

(declare-fun b!1264491 () Bool)

(assert (=> b!1264491 (= e!720043 false)))

(declare-fun b!1264492 () Bool)

(declare-fun tp!96197 () Bool)

(assert (=> b!1264492 (= e!720044 tp!96197)))

(assert (= (and start!106212 res!842107) b!1264491))

(assert (= start!106212 b!1264492))

(declare-fun m!1165063 () Bool)

(assert (=> start!106212 m!1165063))

(declare-fun m!1165065 () Bool)

(assert (=> start!106212 m!1165065))

(check-sat (not start!106212) (not b!1264492))
(check-sat)
