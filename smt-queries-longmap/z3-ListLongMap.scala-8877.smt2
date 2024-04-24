; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108010 () Bool)

(assert start!108010)

(declare-fun res!847834 () Bool)

(declare-fun e!728264 () Bool)

(assert (=> start!108010 (=> (not res!847834) (not e!728264))))

(declare-datatypes ((B!2132 0))(
  ( (B!2133 (val!16662 Int)) )
))
(declare-datatypes ((tuple2!21414 0))(
  ( (tuple2!21415 (_1!10718 (_ BitVec 64)) (_2!10718 B!2132)) )
))
(declare-datatypes ((List!28616 0))(
  ( (Nil!28613) (Cons!28612 (h!29830 tuple2!21414) (t!42141 List!28616)) )
))
(declare-fun l!595 () List!28616)

(declare-fun isStrictlySorted!835 (List!28616) Bool)

(assert (=> start!108010 (= res!847834 (isStrictlySorted!835 l!595))))

(assert (=> start!108010 e!728264))

(declare-fun e!728263 () Bool)

(assert (=> start!108010 e!728263))

(assert (=> start!108010 true))

(declare-fun b!1275916 () Bool)

(declare-fun res!847835 () Bool)

(assert (=> b!1275916 (=> (not res!847835) (not e!728264))))

(declare-fun key!173 () (_ BitVec 64))

(get-info :version)

(assert (=> b!1275916 (= res!847835 (and (not (= (_1!10718 (h!29830 l!595)) key!173)) ((_ is Cons!28612) l!595)))))

(declare-fun b!1275917 () Bool)

(assert (=> b!1275917 (= e!728264 false)))

(declare-fun lt!575758 () Bool)

(declare-fun $colon$colon!660 (List!28616 tuple2!21414) List!28616)

(declare-fun removeStrictlySorted!178 (List!28616 (_ BitVec 64)) List!28616)

(assert (=> b!1275917 (= lt!575758 (isStrictlySorted!835 ($colon$colon!660 (removeStrictlySorted!178 (t!42141 l!595) key!173) (h!29830 l!595))))))

(declare-fun b!1275918 () Bool)

(declare-fun tp_is_empty!33175 () Bool)

(declare-fun tp!97976 () Bool)

(assert (=> b!1275918 (= e!728263 (and tp_is_empty!33175 tp!97976))))

(assert (= (and start!108010 res!847834) b!1275916))

(assert (= (and b!1275916 res!847835) b!1275917))

(assert (= (and start!108010 ((_ is Cons!28612) l!595)) b!1275918))

(declare-fun m!1172897 () Bool)

(assert (=> start!108010 m!1172897))

(declare-fun m!1172899 () Bool)

(assert (=> b!1275917 m!1172899))

(assert (=> b!1275917 m!1172899))

(declare-fun m!1172901 () Bool)

(assert (=> b!1275917 m!1172901))

(assert (=> b!1275917 m!1172901))

(declare-fun m!1172903 () Bool)

(assert (=> b!1275917 m!1172903))

(check-sat (not b!1275917) (not start!108010) (not b!1275918) tp_is_empty!33175)
(check-sat)
