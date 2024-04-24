; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!106434 () Bool)

(assert start!106434)

(declare-fun res!842624 () Bool)

(declare-fun e!720884 () Bool)

(assert (=> start!106434 (=> (not res!842624) (not e!720884))))

(declare-datatypes ((B!1904 0))(
  ( (B!1905 (val!16287 Int)) )
))
(declare-datatypes ((tuple2!21102 0))(
  ( (tuple2!21103 (_1!10562 (_ BitVec 64)) (_2!10562 B!1904)) )
))
(declare-datatypes ((List!28315 0))(
  ( (Nil!28312) (Cons!28311 (h!29529 tuple2!21102) (t!41828 List!28315)) )
))
(declare-datatypes ((ListLongMap!18983 0))(
  ( (ListLongMap!18984 (toList!9507 List!28315)) )
))
(declare-fun lm!212 () ListLongMap!18983)

(declare-fun a1!67 () (_ BitVec 64))

(declare-fun contains!7644 (ListLongMap!18983 (_ BitVec 64)) Bool)

(assert (=> start!106434 (= res!842624 (not (contains!7644 lm!212 a1!67)))))

(assert (=> start!106434 e!720884))

(declare-fun e!720885 () Bool)

(declare-fun inv!44064 (ListLongMap!18983) Bool)

(assert (=> start!106434 (and (inv!44064 lm!212) e!720885)))

(assert (=> start!106434 true))

(declare-fun b!1265790 () Bool)

(assert (=> b!1265790 (= e!720884 false)))

(declare-fun b!1265791 () Bool)

(declare-fun tp!96194 () Bool)

(assert (=> b!1265791 (= e!720885 tp!96194)))

(assert (= (and start!106434 res!842624) b!1265790))

(assert (= start!106434 b!1265791))

(declare-fun m!1166671 () Bool)

(assert (=> start!106434 m!1166671))

(declare-fun m!1166673 () Bool)

(assert (=> start!106434 m!1166673))

(check-sat (not start!106434) (not b!1265791))
(check-sat)
