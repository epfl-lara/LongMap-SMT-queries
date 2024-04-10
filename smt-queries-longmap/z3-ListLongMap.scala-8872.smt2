; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107710 () Bool)

(assert start!107710)

(declare-datatypes ((B!2104 0))(
  ( (B!2105 (val!16648 Int)) )
))
(declare-datatypes ((tuple2!21378 0))(
  ( (tuple2!21379 (_1!10700 (_ BitVec 64)) (_2!10700 B!2104)) )
))
(declare-datatypes ((List!28574 0))(
  ( (Nil!28571) (Cons!28570 (h!29779 tuple2!21378) (t!42107 List!28574)) )
))
(declare-datatypes ((ListLongMap!19107 0))(
  ( (ListLongMap!19108 (toList!9569 List!28574)) )
))
(declare-fun thiss!217 () ListLongMap!19107)

(declare-fun isStrictlySorted!836 (List!28574) Bool)

(assert (=> start!107710 (not (isStrictlySorted!836 (toList!9569 thiss!217)))))

(declare-fun e!727213 () Bool)

(declare-fun inv!44692 (ListLongMap!19107) Bool)

(assert (=> start!107710 (and (inv!44692 thiss!217) e!727213)))

(declare-fun b!1274328 () Bool)

(declare-fun tp!97898 () Bool)

(assert (=> b!1274328 (= e!727213 tp!97898)))

(assert (= start!107710 b!1274328))

(declare-fun m!1171127 () Bool)

(assert (=> start!107710 m!1171127))

(declare-fun m!1171129 () Bool)

(assert (=> start!107710 m!1171129))

(check-sat (not start!107710) (not b!1274328))
(check-sat)
(get-model)

(declare-fun d!140117 () Bool)

(declare-fun res!847233 () Bool)

(declare-fun e!727229 () Bool)

(assert (=> d!140117 (=> res!847233 e!727229)))

(get-info :version)

(assert (=> d!140117 (= res!847233 (or ((_ is Nil!28571) (toList!9569 thiss!217)) ((_ is Nil!28571) (t!42107 (toList!9569 thiss!217)))))))

(assert (=> d!140117 (= (isStrictlySorted!836 (toList!9569 thiss!217)) e!727229)))

(declare-fun b!1274346 () Bool)

(declare-fun e!727230 () Bool)

(assert (=> b!1274346 (= e!727229 e!727230)))

(declare-fun res!847234 () Bool)

(assert (=> b!1274346 (=> (not res!847234) (not e!727230))))

(assert (=> b!1274346 (= res!847234 (bvslt (_1!10700 (h!29779 (toList!9569 thiss!217))) (_1!10700 (h!29779 (t!42107 (toList!9569 thiss!217))))))))

(declare-fun b!1274347 () Bool)

(assert (=> b!1274347 (= e!727230 (isStrictlySorted!836 (t!42107 (toList!9569 thiss!217))))))

(assert (= (and d!140117 (not res!847233)) b!1274346))

(assert (= (and b!1274346 res!847234) b!1274347))

(declare-fun m!1171137 () Bool)

(assert (=> b!1274347 m!1171137))

(assert (=> start!107710 d!140117))

(declare-fun d!140123 () Bool)

(assert (=> d!140123 (= (inv!44692 thiss!217) (isStrictlySorted!836 (toList!9569 thiss!217)))))

(declare-fun bs!36178 () Bool)

(assert (= bs!36178 d!140123))

(assert (=> bs!36178 m!1171127))

(assert (=> start!107710 d!140123))

(declare-fun b!1274357 () Bool)

(declare-fun e!727238 () Bool)

(declare-fun tp_is_empty!33147 () Bool)

(declare-fun tp!97907 () Bool)

(assert (=> b!1274357 (= e!727238 (and tp_is_empty!33147 tp!97907))))

(assert (=> b!1274328 (= tp!97898 e!727238)))

(assert (= (and b!1274328 ((_ is Cons!28570) (toList!9569 thiss!217))) b!1274357))

(check-sat (not d!140123) (not b!1274347) (not b!1274357) tp_is_empty!33147)
(check-sat)
