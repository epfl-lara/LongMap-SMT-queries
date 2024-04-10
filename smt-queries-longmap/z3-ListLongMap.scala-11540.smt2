; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!134326 () Bool)

(assert start!134326)

(declare-fun b!1568609 () Bool)

(declare-fun e!874454 () Bool)

(declare-fun tp_is_empty!39027 () Bool)

(declare-fun tp!114042 () Bool)

(assert (=> b!1568609 (= e!874454 (and tp_is_empty!39027 tp!114042))))

(declare-fun b!1568610 () Bool)

(declare-fun res!1072273 () Bool)

(declare-fun e!874453 () Bool)

(assert (=> b!1568610 (=> (not res!1072273) (not e!874453))))

(declare-datatypes ((B!2476 0))(
  ( (B!2477 (val!19600 Int)) )
))
(declare-datatypes ((tuple2!25302 0))(
  ( (tuple2!25303 (_1!12662 (_ BitVec 64)) (_2!12662 B!2476)) )
))
(declare-datatypes ((List!36720 0))(
  ( (Nil!36717) (Cons!36716 (h!38163 tuple2!25302) (t!51628 List!36720)) )
))
(declare-fun l!750 () List!36720)

(declare-fun key2!21 () (_ BitVec 64))

(declare-fun key1!37 () (_ BitVec 64))

(get-info :version)

(assert (=> b!1568610 (= res!1072273 (and ((_ is Cons!36716) l!750) (bvslt (_1!12662 (h!38163 l!750)) key1!37) (bvslt (_1!12662 (h!38163 l!750)) key2!21)))))

(declare-fun b!1568611 () Bool)

(declare-fun res!1072275 () Bool)

(assert (=> b!1568611 (=> (not res!1072275) (not e!874453))))

(declare-fun isStrictlySorted!993 (List!36720) Bool)

(assert (=> b!1568611 (= res!1072275 (isStrictlySorted!993 l!750))))

(declare-fun res!1072274 () Bool)

(assert (=> start!134326 (=> (not res!1072274) (not e!874453))))

(assert (=> start!134326 (= res!1072274 (not (= key1!37 key2!21)))))

(assert (=> start!134326 e!874453))

(assert (=> start!134326 tp_is_empty!39027))

(assert (=> start!134326 e!874454))

(assert (=> start!134326 true))

(declare-fun b!1568612 () Bool)

(declare-fun res!1072272 () Bool)

(assert (=> b!1568612 (=> (not res!1072272) (not e!874453))))

(assert (=> b!1568612 (= res!1072272 (isStrictlySorted!993 (t!51628 l!750)))))

(declare-fun b!1568613 () Bool)

(assert (=> b!1568613 (= e!874453 (not true))))

(declare-fun v1!32 () B!2476)

(declare-fun v2!10 () B!2476)

(declare-fun insertStrictlySorted!579 (List!36720 (_ BitVec 64) B!2476) List!36720)

(assert (=> b!1568613 (= (insertStrictlySorted!579 (insertStrictlySorted!579 (t!51628 l!750) key1!37 v1!32) key2!21 v2!10) (insertStrictlySorted!579 (insertStrictlySorted!579 (t!51628 l!750) key2!21 v2!10) key1!37 v1!32))))

(declare-datatypes ((Unit!52074 0))(
  ( (Unit!52075) )
))
(declare-fun lt!673207 () Unit!52074)

(declare-fun lemmaInsertStrictlySortedCommutative!5 (List!36720 (_ BitVec 64) B!2476 (_ BitVec 64) B!2476) Unit!52074)

(assert (=> b!1568613 (= lt!673207 (lemmaInsertStrictlySortedCommutative!5 (t!51628 l!750) key1!37 v1!32 key2!21 v2!10))))

(assert (= (and start!134326 res!1072274) b!1568611))

(assert (= (and b!1568611 res!1072275) b!1568610))

(assert (= (and b!1568610 res!1072273) b!1568612))

(assert (= (and b!1568612 res!1072272) b!1568613))

(assert (= (and start!134326 ((_ is Cons!36716) l!750)) b!1568609))

(declare-fun m!1443213 () Bool)

(assert (=> b!1568611 m!1443213))

(declare-fun m!1443215 () Bool)

(assert (=> b!1568612 m!1443215))

(declare-fun m!1443217 () Bool)

(assert (=> b!1568613 m!1443217))

(assert (=> b!1568613 m!1443217))

(declare-fun m!1443219 () Bool)

(assert (=> b!1568613 m!1443219))

(declare-fun m!1443221 () Bool)

(assert (=> b!1568613 m!1443221))

(declare-fun m!1443223 () Bool)

(assert (=> b!1568613 m!1443223))

(assert (=> b!1568613 m!1443221))

(declare-fun m!1443225 () Bool)

(assert (=> b!1568613 m!1443225))

(check-sat (not b!1568609) (not b!1568613) (not b!1568611) (not b!1568612) tp_is_empty!39027)
