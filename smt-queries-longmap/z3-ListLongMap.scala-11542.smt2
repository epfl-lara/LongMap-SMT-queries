; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!134356 () Bool)

(assert start!134356)

(declare-fun b!1568954 () Bool)

(declare-fun res!1072416 () Bool)

(declare-fun e!874634 () Bool)

(assert (=> b!1568954 (=> (not res!1072416) (not e!874634))))

(declare-datatypes ((B!2488 0))(
  ( (B!2489 (val!19606 Int)) )
))
(declare-datatypes ((tuple2!25314 0))(
  ( (tuple2!25315 (_1!12668 (_ BitVec 64)) (_2!12668 B!2488)) )
))
(declare-datatypes ((List!36726 0))(
  ( (Nil!36723) (Cons!36722 (h!38169 tuple2!25314) (t!51634 List!36726)) )
))
(declare-fun l!750 () List!36726)

(declare-fun isStrictlySorted!999 (List!36726) Bool)

(assert (=> b!1568954 (= res!1072416 (isStrictlySorted!999 (t!51634 l!750)))))

(declare-fun b!1568955 () Bool)

(declare-fun res!1072419 () Bool)

(assert (=> b!1568955 (=> (not res!1072419) (not e!874634))))

(assert (=> b!1568955 (= res!1072419 (isStrictlySorted!999 l!750))))

(declare-fun b!1568956 () Bool)

(declare-fun res!1072418 () Bool)

(assert (=> b!1568956 (=> (not res!1072418) (not e!874634))))

(declare-fun key2!21 () (_ BitVec 64))

(declare-fun key1!37 () (_ BitVec 64))

(get-info :version)

(assert (=> b!1568956 (= res!1072418 (and ((_ is Cons!36722) l!750) (bvslt (_1!12668 (h!38169 l!750)) key1!37) (bvslt (_1!12668 (h!38169 l!750)) key2!21)))))

(declare-fun b!1568957 () Bool)

(assert (=> b!1568957 (= e!874634 (not true))))

(declare-fun v1!32 () B!2488)

(declare-fun v2!10 () B!2488)

(declare-fun insertStrictlySorted!585 (List!36726 (_ BitVec 64) B!2488) List!36726)

(assert (=> b!1568957 (= (insertStrictlySorted!585 (insertStrictlySorted!585 (t!51634 l!750) key1!37 v1!32) key2!21 v2!10) (insertStrictlySorted!585 (insertStrictlySorted!585 (t!51634 l!750) key2!21 v2!10) key1!37 v1!32))))

(declare-datatypes ((Unit!52086 0))(
  ( (Unit!52087) )
))
(declare-fun lt!673255 () Unit!52086)

(declare-fun lemmaInsertStrictlySortedCommutative!11 (List!36726 (_ BitVec 64) B!2488 (_ BitVec 64) B!2488) Unit!52086)

(assert (=> b!1568957 (= lt!673255 (lemmaInsertStrictlySortedCommutative!11 (t!51634 l!750) key1!37 v1!32 key2!21 v2!10))))

(declare-fun b!1568958 () Bool)

(declare-fun e!874633 () Bool)

(declare-fun tp_is_empty!39039 () Bool)

(declare-fun tp!114069 () Bool)

(assert (=> b!1568958 (= e!874633 (and tp_is_empty!39039 tp!114069))))

(declare-fun res!1072417 () Bool)

(assert (=> start!134356 (=> (not res!1072417) (not e!874634))))

(assert (=> start!134356 (= res!1072417 (not (= key1!37 key2!21)))))

(assert (=> start!134356 e!874634))

(assert (=> start!134356 tp_is_empty!39039))

(assert (=> start!134356 e!874633))

(assert (=> start!134356 true))

(assert (= (and start!134356 res!1072417) b!1568955))

(assert (= (and b!1568955 res!1072419) b!1568956))

(assert (= (and b!1568956 res!1072418) b!1568954))

(assert (= (and b!1568954 res!1072416) b!1568957))

(assert (= (and start!134356 ((_ is Cons!36722) l!750)) b!1568958))

(declare-fun m!1443483 () Bool)

(assert (=> b!1568954 m!1443483))

(declare-fun m!1443485 () Bool)

(assert (=> b!1568955 m!1443485))

(declare-fun m!1443487 () Bool)

(assert (=> b!1568957 m!1443487))

(assert (=> b!1568957 m!1443487))

(declare-fun m!1443489 () Bool)

(assert (=> b!1568957 m!1443489))

(declare-fun m!1443491 () Bool)

(assert (=> b!1568957 m!1443491))

(declare-fun m!1443493 () Bool)

(assert (=> b!1568957 m!1443493))

(assert (=> b!1568957 m!1443491))

(declare-fun m!1443495 () Bool)

(assert (=> b!1568957 m!1443495))

(check-sat tp_is_empty!39039 (not b!1568958) (not b!1568957) (not b!1568954) (not b!1568955))
