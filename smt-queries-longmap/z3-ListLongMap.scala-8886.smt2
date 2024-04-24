; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108136 () Bool)

(assert start!108136)

(declare-fun b!1276502 () Bool)

(declare-fun e!728730 () Bool)

(declare-fun e!728731 () Bool)

(assert (=> b!1276502 (= e!728730 e!728731)))

(declare-fun res!848171 () Bool)

(assert (=> b!1276502 (=> res!848171 e!728731)))

(declare-datatypes ((B!2186 0))(
  ( (B!2187 (val!16689 Int)) )
))
(declare-datatypes ((tuple2!21468 0))(
  ( (tuple2!21469 (_1!10745 (_ BitVec 64)) (_2!10745 B!2186)) )
))
(declare-datatypes ((List!28643 0))(
  ( (Nil!28640) (Cons!28639 (h!29857 tuple2!21468) (t!42171 List!28643)) )
))
(declare-fun lt!575809 () List!28643)

(declare-fun isStrictlySorted!856 (List!28643) Bool)

(assert (=> b!1276502 (= res!848171 (not (isStrictlySorted!856 lt!575809)))))

(declare-fun err!126 () List!28643)

(assert (=> b!1276502 (= lt!575809 err!126)))

(assert (=> b!1276502 true))

(declare-fun e!728732 () Bool)

(assert (=> b!1276502 e!728732))

(declare-fun b!1276503 () Bool)

(declare-fun res!848169 () Bool)

(assert (=> b!1276503 (=> (not res!848169) (not e!728730))))

(declare-fun l!595 () List!28643)

(declare-fun key!173 () (_ BitVec 64))

(get-info :version)

(assert (=> b!1276503 (= res!848169 (and (or (not ((_ is Cons!28639) l!595)) (not (= (_1!10745 (h!29857 l!595)) key!173))) (or (not ((_ is Cons!28639) l!595)) (= (_1!10745 (h!29857 l!595)) key!173)) (not ((_ is Nil!28640) l!595))))))

(declare-fun b!1276504 () Bool)

(declare-fun e!728729 () Bool)

(declare-fun tp_is_empty!33229 () Bool)

(declare-fun tp!98107 () Bool)

(assert (=> b!1276504 (= e!728729 (and tp_is_empty!33229 tp!98107))))

(declare-fun b!1276505 () Bool)

(declare-fun tp!98108 () Bool)

(assert (=> b!1276505 (= e!728732 (and tp_is_empty!33229 tp!98108))))

(declare-fun b!1276506 () Bool)

(declare-fun containsKey!709 (List!28643 (_ BitVec 64)) Bool)

(assert (=> b!1276506 (= e!728731 (containsKey!709 lt!575809 key!173))))

(declare-fun res!848170 () Bool)

(assert (=> start!108136 (=> (not res!848170) (not e!728730))))

(assert (=> start!108136 (= res!848170 (isStrictlySorted!856 l!595))))

(assert (=> start!108136 e!728730))

(assert (=> start!108136 e!728729))

(assert (=> start!108136 true))

(assert (= (and start!108136 res!848170) b!1276503))

(assert (= (and b!1276503 res!848169) b!1276502))

(assert (= (and b!1276502 ((_ is Cons!28639) err!126)) b!1276505))

(assert (= (and b!1276502 (not res!848171)) b!1276506))

(assert (= (and start!108136 ((_ is Cons!28639) l!595)) b!1276504))

(declare-fun m!1173161 () Bool)

(assert (=> b!1276502 m!1173161))

(declare-fun m!1173163 () Bool)

(assert (=> b!1276506 m!1173163))

(declare-fun m!1173165 () Bool)

(assert (=> start!108136 m!1173165))

(check-sat (not b!1276502) (not b!1276506) (not start!108136) (not b!1276504) (not b!1276505) tp_is_empty!33229)
(check-sat)
