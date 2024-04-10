; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!7578 () Bool)

(assert start!7578)

(declare-fun b!48381 () Bool)

(declare-fun res!28056 () Bool)

(declare-fun e!31045 () Bool)

(assert (=> b!48381 (=> (not res!28056) (not e!31045))))

(declare-datatypes ((B!946 0))(
  ( (B!947 (val!1093 Int)) )
))
(declare-datatypes ((tuple2!1768 0))(
  ( (tuple2!1769 (_1!895 (_ BitVec 64)) (_2!895 B!946)) )
))
(declare-datatypes ((List!1290 0))(
  ( (Nil!1287) (Cons!1286 (h!1866 tuple2!1768) (t!4318 List!1290)) )
))
(declare-fun l!1333 () List!1290)

(get-info :version)

(assert (=> b!48381 (= res!28056 (not ((_ is Nil!1287) l!1333)))))

(declare-fun res!28058 () Bool)

(assert (=> start!7578 (=> (not res!28058) (not e!31045))))

(declare-fun isStrictlySorted!257 (List!1290) Bool)

(assert (=> start!7578 (= res!28058 (isStrictlySorted!257 l!1333))))

(assert (=> start!7578 e!31045))

(declare-fun e!31044 () Bool)

(assert (=> start!7578 e!31044))

(assert (=> start!7578 true))

(declare-fun b!48383 () Bool)

(declare-fun tp_is_empty!2097 () Bool)

(declare-fun tp!6386 () Bool)

(assert (=> b!48383 (= e!31044 (and tp_is_empty!2097 tp!6386))))

(declare-fun b!48382 () Bool)

(assert (=> b!48382 (= e!31045 (not (isStrictlySorted!257 (t!4318 l!1333))))))

(declare-fun b!48380 () Bool)

(declare-fun res!28057 () Bool)

(assert (=> b!48380 (=> (not res!28057) (not e!31045))))

(declare-fun newKey!147 () (_ BitVec 64))

(declare-fun containsKey!106 (List!1290 (_ BitVec 64)) Bool)

(assert (=> b!48380 (= res!28057 (not (containsKey!106 l!1333 newKey!147)))))

(assert (= (and start!7578 res!28058) b!48380))

(assert (= (and b!48380 res!28057) b!48381))

(assert (= (and b!48381 res!28056) b!48382))

(assert (= (and start!7578 ((_ is Cons!1286) l!1333)) b!48383))

(declare-fun m!42255 () Bool)

(assert (=> start!7578 m!42255))

(declare-fun m!42257 () Bool)

(assert (=> b!48382 m!42257))

(declare-fun m!42259 () Bool)

(assert (=> b!48380 m!42259))

(check-sat (not b!48382) (not start!7578) tp_is_empty!2097 (not b!48380) (not b!48383))
(check-sat)
(get-model)

