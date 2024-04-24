; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!106428 () Bool)

(assert start!106428)

(declare-fun res!842615 () Bool)

(declare-fun e!720866 () Bool)

(assert (=> start!106428 (=> (not res!842615) (not e!720866))))

(declare-datatypes ((B!1898 0))(
  ( (B!1899 (val!16284 Int)) )
))
(declare-datatypes ((tuple2!21096 0))(
  ( (tuple2!21097 (_1!10559 (_ BitVec 64)) (_2!10559 B!1898)) )
))
(declare-datatypes ((List!28312 0))(
  ( (Nil!28309) (Cons!28308 (h!29526 tuple2!21096) (t!41825 List!28312)) )
))
(declare-datatypes ((ListLongMap!18977 0))(
  ( (ListLongMap!18978 (toList!9504 List!28312)) )
))
(declare-fun lm!212 () ListLongMap!18977)

(declare-fun a1!67 () (_ BitVec 64))

(declare-fun contains!7641 (ListLongMap!18977 (_ BitVec 64)) Bool)

(assert (=> start!106428 (= res!842615 (not (contains!7641 lm!212 a1!67)))))

(assert (=> start!106428 e!720866))

(declare-fun e!720867 () Bool)

(declare-fun inv!44056 (ListLongMap!18977) Bool)

(assert (=> start!106428 (and (inv!44056 lm!212) e!720867)))

(assert (=> start!106428 true))

(declare-fun b!1265772 () Bool)

(assert (=> b!1265772 (= e!720866 false)))

(declare-fun b!1265773 () Bool)

(declare-fun tp!96185 () Bool)

(assert (=> b!1265773 (= e!720867 tp!96185)))

(assert (= (and start!106428 res!842615) b!1265772))

(assert (= start!106428 b!1265773))

(declare-fun m!1166659 () Bool)

(assert (=> start!106428 m!1166659))

(declare-fun m!1166661 () Bool)

(assert (=> start!106428 m!1166661))

(check-sat (not start!106428) (not b!1265773))
(check-sat)
