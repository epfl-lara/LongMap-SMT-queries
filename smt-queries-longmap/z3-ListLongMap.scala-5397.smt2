; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72164 () Bool)

(assert start!72164)

(declare-fun res!569349 () Bool)

(declare-fun e!467157 () Bool)

(assert (=> start!72164 (=> (not res!569349) (not e!467157))))

(declare-datatypes ((B!1184 0))(
  ( (B!1185 (val!7674 Int)) )
))
(declare-datatypes ((tuple2!10132 0))(
  ( (tuple2!10133 (_1!5077 (_ BitVec 64)) (_2!5077 B!1184)) )
))
(declare-datatypes ((List!15883 0))(
  ( (Nil!15880) (Cons!15879 (h!17016 tuple2!10132) (t!22246 List!15883)) )
))
(declare-fun l!390 () List!15883)

(declare-fun isStrictlySorted!437 (List!15883) Bool)

(assert (=> start!72164 (= res!569349 (isStrictlySorted!437 l!390))))

(assert (=> start!72164 e!467157))

(declare-fun e!467158 () Bool)

(assert (=> start!72164 e!467158))

(declare-fun b!837224 () Bool)

(declare-fun ListPrimitiveSize!67 (List!15883) Int)

(assert (=> b!837224 (= e!467157 (< (ListPrimitiveSize!67 l!390) 0))))

(declare-fun b!837225 () Bool)

(declare-fun tp_is_empty!15253 () Bool)

(declare-fun tp!47423 () Bool)

(assert (=> b!837225 (= e!467158 (and tp_is_empty!15253 tp!47423))))

(assert (= (and start!72164 res!569349) b!837224))

(get-info :version)

(assert (= (and start!72164 ((_ is Cons!15879) l!390)) b!837225))

(declare-fun m!782947 () Bool)

(assert (=> start!72164 m!782947))

(declare-fun m!782949 () Bool)

(assert (=> b!837224 m!782949))

(check-sat (not start!72164) (not b!837224) (not b!837225) tp_is_empty!15253)
(check-sat)
(get-model)

(declare-fun d!107889 () Bool)

(declare-fun res!569364 () Bool)

(declare-fun e!467181 () Bool)

(assert (=> d!107889 (=> res!569364 e!467181)))

(assert (=> d!107889 (= res!569364 (or ((_ is Nil!15880) l!390) ((_ is Nil!15880) (t!22246 l!390))))))

(assert (=> d!107889 (= (isStrictlySorted!437 l!390) e!467181)))

(declare-fun b!837250 () Bool)

(declare-fun e!467182 () Bool)

(assert (=> b!837250 (= e!467181 e!467182)))

(declare-fun res!569365 () Bool)

(assert (=> b!837250 (=> (not res!569365) (not e!467182))))

(assert (=> b!837250 (= res!569365 (bvslt (_1!5077 (h!17016 l!390)) (_1!5077 (h!17016 (t!22246 l!390)))))))

(declare-fun b!837251 () Bool)

(assert (=> b!837251 (= e!467182 (isStrictlySorted!437 (t!22246 l!390)))))

(assert (= (and d!107889 (not res!569364)) b!837250))

(assert (= (and b!837250 res!569365) b!837251))

(declare-fun m!782959 () Bool)

(assert (=> b!837251 m!782959))

(assert (=> start!72164 d!107889))

(declare-fun d!107895 () Bool)

(declare-fun lt!380755 () Int)

(assert (=> d!107895 (>= lt!380755 0)))

(declare-fun e!467192 () Int)

(assert (=> d!107895 (= lt!380755 e!467192)))

(declare-fun c!91318 () Bool)

(assert (=> d!107895 (= c!91318 ((_ is Nil!15880) l!390))))

(assert (=> d!107895 (= (ListPrimitiveSize!67 l!390) lt!380755)))

(declare-fun b!837264 () Bool)

(assert (=> b!837264 (= e!467192 0)))

(declare-fun b!837265 () Bool)

(assert (=> b!837265 (= e!467192 (+ 1 (ListPrimitiveSize!67 (t!22246 l!390))))))

(assert (= (and d!107895 c!91318) b!837264))

(assert (= (and d!107895 (not c!91318)) b!837265))

(declare-fun m!782965 () Bool)

(assert (=> b!837265 m!782965))

(assert (=> b!837224 d!107895))

(declare-fun b!837274 () Bool)

(declare-fun e!467197 () Bool)

(declare-fun tp!47432 () Bool)

(assert (=> b!837274 (= e!467197 (and tp_is_empty!15253 tp!47432))))

(assert (=> b!837225 (= tp!47423 e!467197)))

(assert (= (and b!837225 ((_ is Cons!15879) (t!22246 l!390))) b!837274))

(check-sat (not b!837251) (not b!837265) (not b!837274) tp_is_empty!15253)
(check-sat)
