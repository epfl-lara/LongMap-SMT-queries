; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!7618 () Bool)

(assert start!7618)

(declare-fun b!48515 () Bool)

(declare-fun e!31145 () Bool)

(declare-fun tp_is_empty!2107 () Bool)

(declare-fun tp!6419 () Bool)

(assert (=> b!48515 (= e!31145 (and tp_is_empty!2107 tp!6419))))

(declare-fun b!48512 () Bool)

(declare-fun res!28175 () Bool)

(declare-fun e!31146 () Bool)

(assert (=> b!48512 (=> (not res!28175) (not e!31146))))

(declare-datatypes ((B!956 0))(
  ( (B!957 (val!1098 Int)) )
))
(declare-datatypes ((tuple2!1760 0))(
  ( (tuple2!1761 (_1!891 (_ BitVec 64)) (_2!891 B!956)) )
))
(declare-datatypes ((List!1281 0))(
  ( (Nil!1278) (Cons!1277 (h!1857 tuple2!1760) (t!4309 List!1281)) )
))
(declare-fun l!1333 () List!1281)

(declare-fun newKey!147 () (_ BitVec 64))

(declare-fun containsKey!111 (List!1281 (_ BitVec 64)) Bool)

(assert (=> b!48512 (= res!28175 (not (containsKey!111 l!1333 newKey!147)))))

(declare-fun res!28176 () Bool)

(assert (=> start!7618 (=> (not res!28176) (not e!31146))))

(declare-fun isStrictlySorted!250 (List!1281) Bool)

(assert (=> start!7618 (= res!28176 (isStrictlySorted!250 l!1333))))

(assert (=> start!7618 e!31146))

(assert (=> start!7618 e!31145))

(assert (=> start!7618 true))

(assert (=> start!7618 tp_is_empty!2107))

(declare-fun b!48513 () Bool)

(declare-fun res!28177 () Bool)

(assert (=> b!48513 (=> (not res!28177) (not e!31146))))

(get-info :version)

(assert (=> b!48513 (= res!28177 (not ((_ is Nil!1278) l!1333)))))

(declare-fun b!48514 () Bool)

(assert (=> b!48514 (= e!31146 false)))

(declare-fun newValue!147 () B!956)

(declare-datatypes ((Unit!1374 0))(
  ( (Unit!1375) )
))
(declare-fun lt!20623 () Unit!1374)

(declare-fun lemmaInsertStrictlySortedNotContainedContent!4 (List!1281 (_ BitVec 64) B!956) Unit!1374)

(assert (=> b!48514 (= lt!20623 (lemmaInsertStrictlySortedNotContainedContent!4 (t!4309 l!1333) newKey!147 newValue!147))))

(assert (= (and start!7618 res!28176) b!48512))

(assert (= (and b!48512 res!28175) b!48513))

(assert (= (and b!48513 res!28177) b!48514))

(assert (= (and start!7618 ((_ is Cons!1277) l!1333)) b!48515))

(declare-fun m!42191 () Bool)

(assert (=> b!48512 m!42191))

(declare-fun m!42193 () Bool)

(assert (=> start!7618 m!42193))

(declare-fun m!42195 () Bool)

(assert (=> b!48514 m!42195))

(check-sat (not b!48512) (not b!48514) (not b!48515) tp_is_empty!2107 (not start!7618))
(check-sat)
