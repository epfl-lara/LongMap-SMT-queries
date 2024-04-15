; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107786 () Bool)

(assert start!107786)

(declare-fun res!847287 () Bool)

(declare-fun e!727388 () Bool)

(assert (=> start!107786 (=> (not res!847287) (not e!727388))))

(declare-datatypes ((B!2132 0))(
  ( (B!2133 (val!16662 Int)) )
))
(declare-datatypes ((tuple2!21482 0))(
  ( (tuple2!21483 (_1!10752 (_ BitVec 64)) (_2!10752 B!2132)) )
))
(declare-datatypes ((List!28661 0))(
  ( (Nil!28658) (Cons!28657 (h!29866 tuple2!21482) (t!42186 List!28661)) )
))
(declare-fun l!595 () List!28661)

(declare-fun isStrictlySorted!843 (List!28661) Bool)

(assert (=> start!107786 (= res!847287 (isStrictlySorted!843 l!595))))

(assert (=> start!107786 e!727388))

(declare-fun e!727387 () Bool)

(assert (=> start!107786 e!727387))

(assert (=> start!107786 true))

(declare-fun b!1274547 () Bool)

(declare-fun res!847288 () Bool)

(assert (=> b!1274547 (=> (not res!847288) (not e!727388))))

(declare-fun key!173 () (_ BitVec 64))

(get-info :version)

(assert (=> b!1274547 (= res!847288 (and (not (= (_1!10752 (h!29866 l!595)) key!173)) ((_ is Cons!28657) l!595)))))

(declare-fun b!1274548 () Bool)

(assert (=> b!1274548 (= e!727388 false)))

(declare-fun lt!575096 () Bool)

(declare-fun $colon$colon!663 (List!28661 tuple2!21482) List!28661)

(declare-fun removeStrictlySorted!179 (List!28661 (_ BitVec 64)) List!28661)

(assert (=> b!1274548 (= lt!575096 (isStrictlySorted!843 ($colon$colon!663 (removeStrictlySorted!179 (t!42186 l!595) key!173) (h!29866 l!595))))))

(declare-fun b!1274549 () Bool)

(declare-fun tp_is_empty!33175 () Bool)

(declare-fun tp!97977 () Bool)

(assert (=> b!1274549 (= e!727387 (and tp_is_empty!33175 tp!97977))))

(assert (= (and start!107786 res!847287) b!1274547))

(assert (= (and b!1274547 res!847288) b!1274548))

(assert (= (and start!107786 ((_ is Cons!28657) l!595)) b!1274549))

(declare-fun m!1170785 () Bool)

(assert (=> start!107786 m!1170785))

(declare-fun m!1170787 () Bool)

(assert (=> b!1274548 m!1170787))

(assert (=> b!1274548 m!1170787))

(declare-fun m!1170789 () Bool)

(assert (=> b!1274548 m!1170789))

(assert (=> b!1274548 m!1170789))

(declare-fun m!1170791 () Bool)

(assert (=> b!1274548 m!1170791))

(check-sat (not b!1274548) (not start!107786) (not b!1274549) tp_is_empty!33175)
(check-sat)
