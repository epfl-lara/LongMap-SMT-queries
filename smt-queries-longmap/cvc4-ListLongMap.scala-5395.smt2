; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71972 () Bool)

(assert start!71972)

(declare-datatypes ((B!1176 0))(
  ( (B!1177 (val!7670 Int)) )
))
(declare-datatypes ((tuple2!10200 0))(
  ( (tuple2!10201 (_1!5111 (_ BitVec 64)) (_2!5111 B!1176)) )
))
(declare-datatypes ((List!15975 0))(
  ( (Nil!15972) (Cons!15971 (h!17102 tuple2!10200) (t!22346 List!15975)) )
))
(declare-datatypes ((ListLongMap!9011 0))(
  ( (ListLongMap!9012 (toList!4521 List!15975)) )
))
(declare-fun thiss!193 () ListLongMap!9011)

(declare-fun isStrictlySorted!445 (List!15975) Bool)

(assert (=> start!71972 (not (isStrictlySorted!445 (toList!4521 thiss!193)))))

(declare-fun e!466494 () Bool)

(declare-fun inv!27242 (ListLongMap!9011) Bool)

(assert (=> start!71972 (and (inv!27242 thiss!193) e!466494)))

(declare-fun b!836222 () Bool)

(declare-fun tp!47393 () Bool)

(assert (=> b!836222 (= e!466494 tp!47393)))

(assert (= start!71972 b!836222))

(declare-fun m!781629 () Bool)

(assert (=> start!71972 m!781629))

(declare-fun m!781631 () Bool)

(assert (=> start!71972 m!781631))

(push 1)

(assert (not start!71972))

(assert (not b!836222))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!107541 () Bool)

(declare-fun res!568957 () Bool)

(declare-fun e!466511 () Bool)

(assert (=> d!107541 (=> res!568957 e!466511)))

(assert (=> d!107541 (= res!568957 (or (is-Nil!15972 (toList!4521 thiss!193)) (is-Nil!15972 (t!22346 (toList!4521 thiss!193)))))))

(assert (=> d!107541 (= (isStrictlySorted!445 (toList!4521 thiss!193)) e!466511)))

(declare-fun b!836239 () Bool)

(declare-fun e!466512 () Bool)

(assert (=> b!836239 (= e!466511 e!466512)))

(declare-fun res!568958 () Bool)

(assert (=> b!836239 (=> (not res!568958) (not e!466512))))

(assert (=> b!836239 (= res!568958 (bvslt (_1!5111 (h!17102 (toList!4521 thiss!193))) (_1!5111 (h!17102 (t!22346 (toList!4521 thiss!193))))))))

(declare-fun b!836240 () Bool)

(assert (=> b!836240 (= e!466512 (isStrictlySorted!445 (t!22346 (toList!4521 thiss!193))))))

(assert (= (and d!107541 (not res!568957)) b!836239))

(assert (= (and b!836239 res!568958) b!836240))

(declare-fun m!781637 () Bool)

(assert (=> b!836240 m!781637))

(assert (=> start!71972 d!107541))

(declare-fun d!107547 () Bool)

(assert (=> d!107547 (= (inv!27242 thiss!193) (isStrictlySorted!445 (toList!4521 thiss!193)))))

(declare-fun bs!23473 () Bool)

