; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107726 () Bool)

(assert start!107726)

(declare-datatypes ((B!2108 0))(
  ( (B!2109 (val!16650 Int)) )
))
(declare-datatypes ((tuple2!21382 0))(
  ( (tuple2!21383 (_1!10702 (_ BitVec 64)) (_2!10702 B!2108)) )
))
(declare-datatypes ((List!28576 0))(
  ( (Nil!28573) (Cons!28572 (h!29781 tuple2!21382) (t!42109 List!28576)) )
))
(declare-datatypes ((ListLongMap!19111 0))(
  ( (ListLongMap!19112 (toList!9571 List!28576)) )
))
(declare-fun thiss!217 () ListLongMap!19111)

(declare-fun key!129 () (_ BitVec 64))

(declare-fun inv!44699 (ListLongMap!19111) Bool)

(declare-fun removeStrictlySorted!173 (List!28576 (_ BitVec 64)) List!28576)

(assert (=> start!107726 (not (inv!44699 (ListLongMap!19112 (removeStrictlySorted!173 (toList!9571 thiss!217) key!129))))))

(declare-fun e!727246 () Bool)

(assert (=> start!107726 (and (inv!44699 thiss!217) e!727246)))

(assert (=> start!107726 true))

(declare-fun b!1274367 () Bool)

(declare-fun tp!97913 () Bool)

(assert (=> b!1274367 (= e!727246 tp!97913)))

(assert (= start!107726 b!1274367))

(declare-fun m!1171141 () Bool)

(assert (=> start!107726 m!1171141))

(declare-fun m!1171143 () Bool)

(assert (=> start!107726 m!1171143))

(declare-fun m!1171145 () Bool)

(assert (=> start!107726 m!1171145))

(push 1)

(assert (not start!107726))

(assert (not b!1274367))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!140129 () Bool)

(declare-fun isStrictlySorted!838 (List!28576) Bool)

(assert (=> d!140129 (= (inv!44699 (ListLongMap!19112 (removeStrictlySorted!173 (toList!9571 thiss!217) key!129))) (isStrictlySorted!838 (toList!9571 (ListLongMap!19112 (removeStrictlySorted!173 (toList!9571 thiss!217) key!129)))))))

(declare-fun bs!36183 () Bool)

(assert (= bs!36183 d!140129))

(declare-fun m!1171159 () Bool)

(assert (=> bs!36183 m!1171159))

(assert (=> start!107726 d!140129))

(declare-fun b!1274394 () Bool)

(declare-fun e!727267 () List!28576)

(assert (=> b!1274394 (= e!727267 (t!42109 (toList!9571 thiss!217)))))

(declare-fun b!1274395 () Bool)

(declare-fun e!727266 () Bool)

(declare-fun lt!575222 () List!28576)

(declare-fun containsKey!694 (List!28576 (_ BitVec 64)) Bool)

(assert (=> b!1274395 (= e!727266 (not (containsKey!694 lt!575222 key!129)))))

(declare-fun b!1274396 () Bool)

(declare-fun e!727265 () List!28576)

(assert (=> b!1274396 (= e!727267 e!727265)))

(declare-fun c!123834 () Bool)

(assert (=> b!1274396 (= c!123834 (and (is-Cons!28572 (toList!9571 thiss!217)) (not (= (_1!10702 (h!29781 (toList!9571 thiss!217))) key!129))))))

(declare-fun d!140133 () Bool)

(assert (=> d!140133 e!727266))

(declare-fun res!847245 () Bool)

(assert (=> d!140133 (=> (not res!847245) (not e!727266))))

(assert (=> d!140133 (= res!847245 (isStrictlySorted!838 lt!575222))))

(assert (=> d!140133 (= lt!575222 e!727267)))

(declare-fun c!123835 () Bool)

(assert (=> d!140133 (= c!123835 (and (is-Cons!28572 (toList!9571 thiss!217)) (= (_1!10702 (h!29781 (toList!9571 thiss!217))) key!129)))))

(assert (=> d!140133 (isStrictlySorted!838 (toList!9571 thiss!217))))

(assert (=> d!140133 (= (removeStrictlySorted!173 (toList!9571 thiss!217) key!129) lt!575222)))

(declare-fun b!1274397 () Bool)

(declare-fun $colon$colon!657 (List!28576 tuple2!21382) List!28576)

(assert (=> b!1274397 (= e!727265 ($colon$colon!657 (removeStrictlySorted!173 (t!42109 (toList!9571 thiss!217)) key!129) (h!29781 (toList!9571 thiss!217))))))

(declare-fun b!1274398 () Bool)

(assert (=> b!1274398 (= e!727265 Nil!28573)))

(assert (= (and d!140133 c!123835) b!1274394))

(assert (= (and d!140133 (not c!123835)) b!1274396))

(assert (= (and b!1274396 c!123834) b!1274397))

(assert (= (and b!1274396 (not c!123834)) b!1274398))

(assert (= (and d!140133 res!847245) b!1274395))

(declare-fun m!1171165 () Bool)

(assert (=> b!1274395 m!1171165))

(declare-fun m!1171167 () Bool)

(assert (=> d!140133 m!1171167))

(declare-fun m!1171169 () Bool)

(assert (=> d!140133 m!1171169))

(declare-fun m!1171171 () Bool)

(assert (=> b!1274397 m!1171171))

(assert (=> b!1274397 m!1171171))

(declare-fun m!1171173 () Bool)

(assert (=> b!1274397 m!1171173))

(assert (=> start!107726 d!140133))

(declare-fun d!140141 () Bool)

(assert (=> d!140141 (= (inv!44699 thiss!217) (isStrictlySorted!838 (toList!9571 thiss!217)))))

(declare-fun bs!36186 () Bool)

(assert (= bs!36186 d!140141))

(assert (=> bs!36186 m!1171169))

(assert (=> start!107726 d!140141))

(declare-fun b!1274412 () Bool)

(declare-fun e!727275 () Bool)

(declare-fun tp_is_empty!33151 () Bool)

(declare-fun tp!97924 () Bool)

(assert (=> b!1274412 (= e!727275 (and tp_is_empty!33151 tp!97924))))

(assert (=> b!1274367 (= tp!97913 e!727275)))

(assert (= (and b!1274367 (is-Cons!28572 (toList!9571 thiss!217))) b!1274412))

(push 1)

(assert (not b!1274397))

(assert (not b!1274412))

(assert tp_is_empty!33151)

(assert (not d!140129))

(assert (not d!140141))

(assert (not d!140133))

(assert (not b!1274395))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

