; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72134 () Bool)

(assert start!72134)

(declare-datatypes ((B!1172 0))(
  ( (B!1173 (val!7668 Int)) )
))
(declare-datatypes ((tuple2!10120 0))(
  ( (tuple2!10121 (_1!5071 (_ BitVec 64)) (_2!5071 B!1172)) )
))
(declare-datatypes ((List!15877 0))(
  ( (Nil!15874) (Cons!15873 (h!17010 tuple2!10120) (t!22240 List!15877)) )
))
(declare-datatypes ((ListLongMap!8933 0))(
  ( (ListLongMap!8934 (toList!4482 List!15877)) )
))
(declare-fun thiss!193 () ListLongMap!8933)

(declare-fun isStrictlySorted!431 (List!15877) Bool)

(assert (=> start!72134 (not (isStrictlySorted!431 (toList!4482 thiss!193)))))

(declare-fun e!467068 () Bool)

(declare-fun inv!27240 (ListLongMap!8933) Bool)

(assert (=> start!72134 (and (inv!27240 thiss!193) e!467068)))

(declare-fun b!837114 () Bool)

(declare-fun tp!47387 () Bool)

(assert (=> b!837114 (= e!467068 tp!47387)))

(assert (= start!72134 b!837114))

(declare-fun m!782911 () Bool)

(assert (=> start!72134 m!782911))

(declare-fun m!782913 () Bool)

(assert (=> start!72134 m!782913))

(check-sat (not start!72134) (not b!837114))
(check-sat)
(get-model)

(declare-fun d!107861 () Bool)

(declare-fun res!569303 () Bool)

(declare-fun e!467091 () Bool)

(assert (=> d!107861 (=> res!569303 e!467091)))

(get-info :version)

(assert (=> d!107861 (= res!569303 (or ((_ is Nil!15874) (toList!4482 thiss!193)) ((_ is Nil!15874) (t!22240 (toList!4482 thiss!193)))))))

(assert (=> d!107861 (= (isStrictlySorted!431 (toList!4482 thiss!193)) e!467091)))

(declare-fun b!837137 () Bool)

(declare-fun e!467092 () Bool)

(assert (=> b!837137 (= e!467091 e!467092)))

(declare-fun res!569304 () Bool)

(assert (=> b!837137 (=> (not res!569304) (not e!467092))))

(assert (=> b!837137 (= res!569304 (bvslt (_1!5071 (h!17010 (toList!4482 thiss!193))) (_1!5071 (h!17010 (t!22240 (toList!4482 thiss!193))))))))

(declare-fun b!837138 () Bool)

(assert (=> b!837138 (= e!467092 (isStrictlySorted!431 (t!22240 (toList!4482 thiss!193))))))

(assert (= (and d!107861 (not res!569303)) b!837137))

(assert (= (and b!837137 res!569304) b!837138))

(declare-fun m!782927 () Bool)

(assert (=> b!837138 m!782927))

(assert (=> start!72134 d!107861))

(declare-fun d!107871 () Bool)

(assert (=> d!107871 (= (inv!27240 thiss!193) (isStrictlySorted!431 (toList!4482 thiss!193)))))

(declare-fun bs!23487 () Bool)

(assert (= bs!23487 d!107871))

(assert (=> bs!23487 m!782911))

(assert (=> start!72134 d!107871))

(declare-fun b!837152 () Bool)

(declare-fun e!467101 () Bool)

(declare-fun tp_is_empty!15245 () Bool)

(declare-fun tp!47401 () Bool)

(assert (=> b!837152 (= e!467101 (and tp_is_empty!15245 tp!47401))))

(assert (=> b!837114 (= tp!47387 e!467101)))

(assert (= (and b!837114 ((_ is Cons!15873) (toList!4482 thiss!193))) b!837152))

(check-sat (not b!837138) (not d!107871) (not b!837152) tp_is_empty!15245)
(check-sat)
