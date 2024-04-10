; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69670 () Bool)

(assert start!69670)

(declare-datatypes ((B!1168 0))(
  ( (B!1169 (val!7036 Int)) )
))
(declare-datatypes ((tuple2!9274 0))(
  ( (tuple2!9275 (_1!4648 (_ BitVec 64)) (_2!4648 B!1168)) )
))
(declare-datatypes ((List!15087 0))(
  ( (Nil!15084) (Cons!15083 (h!16212 tuple2!9274) (t!21402 List!15087)) )
))
(declare-datatypes ((ListLongMap!8097 0))(
  ( (ListLongMap!8098 (toList!4064 List!15087)) )
))
(declare-fun thiss!191 () ListLongMap!8097)

(declare-fun isStrictlySorted!439 (List!15087) Bool)

(assert (=> start!69670 (not (isStrictlySorted!439 (toList!4064 thiss!191)))))

(declare-fun e!449285 () Bool)

(declare-fun inv!25918 (ListLongMap!8097) Bool)

(assert (=> start!69670 (and (inv!25918 thiss!191) e!449285)))

(declare-fun b!811794 () Bool)

(declare-fun tp!43624 () Bool)

(assert (=> b!811794 (= e!449285 tp!43624)))

(assert (= start!69670 b!811794))

(declare-fun m!754275 () Bool)

(assert (=> start!69670 m!754275))

(declare-fun m!754277 () Bool)

(assert (=> start!69670 m!754277))

(check-sat (not start!69670) (not b!811794))
(check-sat)
(get-model)

(declare-fun d!104209 () Bool)

(declare-fun res!554842 () Bool)

(declare-fun e!449299 () Bool)

(assert (=> d!104209 (=> res!554842 e!449299)))

(get-info :version)

(assert (=> d!104209 (= res!554842 (or ((_ is Nil!15084) (toList!4064 thiss!191)) ((_ is Nil!15084) (t!21402 (toList!4064 thiss!191)))))))

(assert (=> d!104209 (= (isStrictlySorted!439 (toList!4064 thiss!191)) e!449299)))

(declare-fun b!811808 () Bool)

(declare-fun e!449300 () Bool)

(assert (=> b!811808 (= e!449299 e!449300)))

(declare-fun res!554843 () Bool)

(assert (=> b!811808 (=> (not res!554843) (not e!449300))))

(assert (=> b!811808 (= res!554843 (bvslt (_1!4648 (h!16212 (toList!4064 thiss!191))) (_1!4648 (h!16212 (t!21402 (toList!4064 thiss!191))))))))

(declare-fun b!811809 () Bool)

(assert (=> b!811809 (= e!449300 (isStrictlySorted!439 (t!21402 (toList!4064 thiss!191))))))

(assert (= (and d!104209 (not res!554842)) b!811808))

(assert (= (and b!811808 res!554843) b!811809))

(declare-fun m!754285 () Bool)

(assert (=> b!811809 m!754285))

(assert (=> start!69670 d!104209))

(declare-fun d!104217 () Bool)

(assert (=> d!104217 (= (inv!25918 thiss!191) (isStrictlySorted!439 (toList!4064 thiss!191)))))

(declare-fun bs!22472 () Bool)

(assert (= bs!22472 d!104217))

(assert (=> bs!22472 m!754275))

(assert (=> start!69670 d!104217))

(declare-fun b!811822 () Bool)

(declare-fun e!449310 () Bool)

(declare-fun tp_is_empty!13977 () Bool)

(declare-fun tp!43633 () Bool)

(assert (=> b!811822 (= e!449310 (and tp_is_empty!13977 tp!43633))))

(assert (=> b!811794 (= tp!43624 e!449310)))

(assert (= (and b!811794 ((_ is Cons!15083) (toList!4064 thiss!191))) b!811822))

(check-sat (not b!811809) (not d!104217) (not b!811822) tp_is_empty!13977)
(check-sat)
