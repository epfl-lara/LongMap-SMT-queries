; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107788 () Bool)

(assert start!107788)

(declare-fun res!847321 () Bool)

(declare-fun e!727422 () Bool)

(assert (=> start!107788 (=> (not res!847321) (not e!727422))))

(declare-datatypes ((B!2134 0))(
  ( (B!2135 (val!16663 Int)) )
))
(declare-datatypes ((tuple2!21408 0))(
  ( (tuple2!21409 (_1!10715 (_ BitVec 64)) (_2!10715 B!2134)) )
))
(declare-datatypes ((List!28589 0))(
  ( (Nil!28586) (Cons!28585 (h!29794 tuple2!21408) (t!42122 List!28589)) )
))
(declare-fun l!595 () List!28589)

(declare-fun isStrictlySorted!847 (List!28589) Bool)

(assert (=> start!107788 (= res!847321 (isStrictlySorted!847 l!595))))

(assert (=> start!107788 e!727422))

(declare-fun e!727423 () Bool)

(assert (=> start!107788 e!727423))

(assert (=> start!107788 true))

(declare-fun b!1274620 () Bool)

(declare-fun res!847320 () Bool)

(assert (=> b!1274620 (=> (not res!847320) (not e!727422))))

(declare-fun key!173 () (_ BitVec 64))

(get-info :version)

(assert (=> b!1274620 (= res!847320 (and (not (= (_1!10715 (h!29794 l!595)) key!173)) ((_ is Cons!28585) l!595)))))

(declare-fun b!1274621 () Bool)

(assert (=> b!1274621 (= e!727422 false)))

(declare-fun lt!575277 () Bool)

(declare-fun $colon$colon!662 (List!28589 tuple2!21408) List!28589)

(declare-fun removeStrictlySorted!180 (List!28589 (_ BitVec 64)) List!28589)

(assert (=> b!1274621 (= lt!575277 (isStrictlySorted!847 ($colon$colon!662 (removeStrictlySorted!180 (t!42122 l!595) key!173) (h!29794 l!595))))))

(declare-fun b!1274622 () Bool)

(declare-fun tp_is_empty!33177 () Bool)

(declare-fun tp!97979 () Bool)

(assert (=> b!1274622 (= e!727423 (and tp_is_empty!33177 tp!97979))))

(assert (= (and start!107788 res!847321) b!1274620))

(assert (= (and b!1274620 res!847320) b!1274621))

(assert (= (and start!107788 ((_ is Cons!28585) l!595)) b!1274622))

(declare-fun m!1171293 () Bool)

(assert (=> start!107788 m!1171293))

(declare-fun m!1171295 () Bool)

(assert (=> b!1274621 m!1171295))

(assert (=> b!1274621 m!1171295))

(declare-fun m!1171297 () Bool)

(assert (=> b!1274621 m!1171297))

(assert (=> b!1274621 m!1171297))

(declare-fun m!1171299 () Bool)

(assert (=> b!1274621 m!1171299))

(check-sat (not start!107788) (not b!1274621) (not b!1274622) tp_is_empty!33177)
(check-sat)
