; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43764 () Bool)

(assert start!43764)

(declare-fun res!288318 () Bool)

(declare-fun e!284790 () Bool)

(assert (=> start!43764 (=> (not res!288318) (not e!284790))))

(declare-datatypes ((B!1106 0))(
  ( (B!1107 (val!7005 Int)) )
))
(declare-datatypes ((tuple2!9126 0))(
  ( (tuple2!9127 (_1!4574 (_ BitVec 64)) (_2!4574 B!1106)) )
))
(declare-datatypes ((List!9171 0))(
  ( (Nil!9168) (Cons!9167 (h!10023 tuple2!9126) (t!15385 List!9171)) )
))
(declare-fun l!956 () List!9171)

(declare-fun isStrictlySorted!396 (List!9171) Bool)

(assert (=> start!43764 (= res!288318 (isStrictlySorted!396 l!956))))

(assert (=> start!43764 e!284790))

(declare-fun e!284789 () Bool)

(assert (=> start!43764 e!284789))

(assert (=> start!43764 true))

(declare-fun tp_is_empty!13915 () Bool)

(assert (=> start!43764 tp_is_empty!13915))

(declare-fun b!483857 () Bool)

(declare-fun res!288319 () Bool)

(assert (=> b!483857 (=> (not res!288319) (not e!284790))))

(declare-fun key!251 () (_ BitVec 64))

(declare-fun containsKey!371 (List!9171 (_ BitVec 64)) Bool)

(assert (=> b!483857 (= res!288319 (not (containsKey!371 l!956 key!251)))))

(declare-fun b!483858 () Bool)

(assert (=> b!483858 (= e!284790 false)))

(declare-fun lt!219328 () List!9171)

(declare-fun value!166 () B!1106)

(declare-fun insertStrictlySorted!227 (List!9171 (_ BitVec 64) B!1106) List!9171)

(assert (=> b!483858 (= lt!219328 (insertStrictlySorted!227 l!956 key!251 value!166))))

(declare-fun b!483859 () Bool)

(declare-fun tp!43462 () Bool)

(assert (=> b!483859 (= e!284789 (and tp_is_empty!13915 tp!43462))))

(assert (= (and start!43764 res!288318) b!483857))

(assert (= (and b!483857 res!288319) b!483858))

(get-info :version)

(assert (= (and start!43764 ((_ is Cons!9167) l!956)) b!483859))

(declare-fun m!464989 () Bool)

(assert (=> start!43764 m!464989))

(declare-fun m!464991 () Bool)

(assert (=> b!483857 m!464991))

(declare-fun m!464993 () Bool)

(assert (=> b!483858 m!464993))

(check-sat (not b!483859) tp_is_empty!13915 (not start!43764) (not b!483857) (not b!483858))
(check-sat)
