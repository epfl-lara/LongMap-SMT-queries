; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!137330 () Bool)

(assert start!137330)

(declare-fun b!1580934 () Bool)

(declare-fun res!1080149 () Bool)

(declare-fun e!882088 () Bool)

(assert (=> b!1580934 (=> (not res!1080149) (not e!882088))))

(declare-datatypes ((B!2690 0))(
  ( (B!2691 (val!19707 Int)) )
))
(declare-datatypes ((tuple2!25632 0))(
  ( (tuple2!25633 (_1!12827 (_ BitVec 64)) (_2!12827 B!2690)) )
))
(declare-datatypes ((List!36868 0))(
  ( (Nil!36865) (Cons!36864 (h!38408 tuple2!25632) (t!51774 List!36868)) )
))
(declare-fun l!1390 () List!36868)

(declare-fun lt!676621 () tuple2!25632)

(declare-fun contains!10454 (List!36868 tuple2!25632) Bool)

(assert (=> b!1580934 (= res!1080149 (contains!10454 (t!51774 l!1390) lt!676621))))

(declare-fun b!1580935 () Bool)

(declare-fun res!1080153 () Bool)

(assert (=> b!1580935 (=> (not res!1080153) (not e!882088))))

(declare-fun isStrictlySorted!1083 (List!36868) Bool)

(assert (=> b!1580935 (= res!1080153 (isStrictlySorted!1083 (t!51774 l!1390)))))

(declare-fun b!1580936 () Bool)

(declare-fun e!882092 () Bool)

(declare-fun tp_is_empty!39235 () Bool)

(declare-fun tp!114561 () Bool)

(assert (=> b!1580936 (= e!882092 (and tp_is_empty!39235 tp!114561))))

(declare-fun b!1580937 () Bool)

(declare-fun res!1080151 () Bool)

(assert (=> b!1580937 (=> (not res!1080151) (not e!882088))))

(declare-fun key!405 () (_ BitVec 64))

(declare-fun containsKey!929 (List!36868 (_ BitVec 64)) Bool)

(assert (=> b!1580937 (= res!1080151 (containsKey!929 (t!51774 l!1390) key!405))))

(declare-fun b!1580938 () Bool)

(declare-fun e!882089 () Bool)

(assert (=> b!1580938 (= e!882089 e!882088)))

(declare-fun res!1080147 () Bool)

(assert (=> b!1580938 (=> (not res!1080147) (not e!882088))))

(declare-fun e!882091 () Bool)

(assert (=> b!1580938 (= res!1080147 e!882091)))

(declare-fun res!1080146 () Bool)

(assert (=> b!1580938 (=> res!1080146 e!882091)))

(declare-datatypes ((tuple2!25634 0))(
  ( (tuple2!25635 (_1!12828 tuple2!25632) (_2!12828 List!36868)) )
))
(declare-datatypes ((Option!922 0))(
  ( (Some!921 (v!22428 tuple2!25634)) (None!920) )
))
(declare-fun lt!676622 () Option!922)

(declare-fun isEmpty!1182 (Option!922) Bool)

(assert (=> b!1580938 (= res!1080146 (isEmpty!1182 lt!676622))))

(declare-fun unapply!94 (List!36868) Option!922)

(assert (=> b!1580938 (= lt!676622 (unapply!94 l!1390))))

(declare-fun b!1580939 () Bool)

(declare-fun e!882090 () Bool)

(assert (=> b!1580939 (= e!882090 e!882089)))

(declare-fun res!1080145 () Bool)

(assert (=> b!1580939 (=> (not res!1080145) (not e!882089))))

(assert (=> b!1580939 (= res!1080145 (contains!10454 l!1390 lt!676621))))

(declare-fun value!194 () B!2690)

(assert (=> b!1580939 (= lt!676621 (tuple2!25633 key!405 value!194))))

(declare-fun b!1580940 () Bool)

(get-info :version)

(declare-fun get!26810 (Option!922) tuple2!25634)

(assert (=> b!1580940 (= e!882091 (not ((_ is Nil!36865) (_2!12828 (get!26810 lt!676622)))))))

(declare-fun b!1580941 () Bool)

(declare-fun res!1080148 () Bool)

(assert (=> b!1580941 (=> (not res!1080148) (not e!882088))))

(assert (=> b!1580941 (= res!1080148 (and (or (not ((_ is Cons!36864) l!1390)) (not (= (_1!12827 (h!38408 l!1390)) key!405))) ((_ is Cons!36864) l!1390)))))

(declare-fun res!1080152 () Bool)

(assert (=> start!137330 (=> (not res!1080152) (not e!882090))))

(assert (=> start!137330 (= res!1080152 (isStrictlySorted!1083 l!1390))))

(assert (=> start!137330 e!882090))

(assert (=> start!137330 e!882092))

(assert (=> start!137330 true))

(assert (=> start!137330 tp_is_empty!39235))

(declare-fun b!1580942 () Bool)

(declare-fun ListPrimitiveSize!196 (List!36868) Int)

(assert (=> b!1580942 (= e!882088 (>= (ListPrimitiveSize!196 (t!51774 l!1390)) (ListPrimitiveSize!196 l!1390)))))

(declare-fun b!1580943 () Bool)

(declare-fun res!1080150 () Bool)

(assert (=> b!1580943 (=> (not res!1080150) (not e!882090))))

(assert (=> b!1580943 (= res!1080150 (containsKey!929 l!1390 key!405))))

(assert (= (and start!137330 res!1080152) b!1580943))

(assert (= (and b!1580943 res!1080150) b!1580939))

(assert (= (and b!1580939 res!1080145) b!1580938))

(assert (= (and b!1580938 (not res!1080146)) b!1580940))

(assert (= (and b!1580938 res!1080147) b!1580941))

(assert (= (and b!1580941 res!1080148) b!1580935))

(assert (= (and b!1580935 res!1080153) b!1580937))

(assert (= (and b!1580937 res!1080151) b!1580934))

(assert (= (and b!1580934 res!1080149) b!1580942))

(assert (= (and start!137330 ((_ is Cons!36864) l!1390)) b!1580936))

(declare-fun m!1451419 () Bool)

(assert (=> b!1580934 m!1451419))

(declare-fun m!1451421 () Bool)

(assert (=> b!1580940 m!1451421))

(declare-fun m!1451423 () Bool)

(assert (=> b!1580942 m!1451423))

(declare-fun m!1451425 () Bool)

(assert (=> b!1580942 m!1451425))

(declare-fun m!1451427 () Bool)

(assert (=> b!1580938 m!1451427))

(declare-fun m!1451429 () Bool)

(assert (=> b!1580938 m!1451429))

(declare-fun m!1451431 () Bool)

(assert (=> b!1580939 m!1451431))

(declare-fun m!1451433 () Bool)

(assert (=> start!137330 m!1451433))

(declare-fun m!1451435 () Bool)

(assert (=> b!1580943 m!1451435))

(declare-fun m!1451437 () Bool)

(assert (=> b!1580937 m!1451437))

(declare-fun m!1451439 () Bool)

(assert (=> b!1580935 m!1451439))

(check-sat (not b!1580935) (not b!1580938) (not b!1580940) (not b!1580942) tp_is_empty!39235 (not b!1580936) (not b!1580934) (not b!1580943) (not start!137330) (not b!1580939) (not b!1580937))
(check-sat)
(get-model)

(declare-fun d!166435 () Bool)

(declare-fun res!1080212 () Bool)

(declare-fun e!882127 () Bool)

(assert (=> d!166435 (=> res!1080212 e!882127)))

(assert (=> d!166435 (= res!1080212 (and ((_ is Cons!36864) (t!51774 l!1390)) (= (_1!12827 (h!38408 (t!51774 l!1390))) key!405)))))

(assert (=> d!166435 (= (containsKey!929 (t!51774 l!1390) key!405) e!882127)))

(declare-fun b!1581008 () Bool)

(declare-fun e!882128 () Bool)

(assert (=> b!1581008 (= e!882127 e!882128)))

(declare-fun res!1080213 () Bool)

(assert (=> b!1581008 (=> (not res!1080213) (not e!882128))))

(assert (=> b!1581008 (= res!1080213 (and (or (not ((_ is Cons!36864) (t!51774 l!1390))) (bvsle (_1!12827 (h!38408 (t!51774 l!1390))) key!405)) ((_ is Cons!36864) (t!51774 l!1390)) (bvslt (_1!12827 (h!38408 (t!51774 l!1390))) key!405)))))

(declare-fun b!1581009 () Bool)

(assert (=> b!1581009 (= e!882128 (containsKey!929 (t!51774 (t!51774 l!1390)) key!405))))

(assert (= (and d!166435 (not res!1080212)) b!1581008))

(assert (= (and b!1581008 res!1080213) b!1581009))

(declare-fun m!1451485 () Bool)

(assert (=> b!1581009 m!1451485))

(assert (=> b!1580937 d!166435))

(declare-fun d!166439 () Bool)

(declare-fun lt!676639 () Int)

(assert (=> d!166439 (>= lt!676639 0)))

(declare-fun e!882135 () Int)

(assert (=> d!166439 (= lt!676639 e!882135)))

(declare-fun c!146492 () Bool)

(assert (=> d!166439 (= c!146492 ((_ is Nil!36865) (t!51774 l!1390)))))

(assert (=> d!166439 (= (ListPrimitiveSize!196 (t!51774 l!1390)) lt!676639)))

(declare-fun b!1581018 () Bool)

(assert (=> b!1581018 (= e!882135 0)))

(declare-fun b!1581019 () Bool)

(assert (=> b!1581019 (= e!882135 (+ 1 (ListPrimitiveSize!196 (t!51774 (t!51774 l!1390)))))))

(assert (= (and d!166439 c!146492) b!1581018))

(assert (= (and d!166439 (not c!146492)) b!1581019))

(declare-fun m!1451487 () Bool)

(assert (=> b!1581019 m!1451487))

(assert (=> b!1580942 d!166439))

(declare-fun d!166443 () Bool)

(declare-fun lt!676640 () Int)

(assert (=> d!166443 (>= lt!676640 0)))

(declare-fun e!882136 () Int)

(assert (=> d!166443 (= lt!676640 e!882136)))

(declare-fun c!146493 () Bool)

(assert (=> d!166443 (= c!146493 ((_ is Nil!36865) l!1390))))

(assert (=> d!166443 (= (ListPrimitiveSize!196 l!1390) lt!676640)))

(declare-fun b!1581020 () Bool)

(assert (=> b!1581020 (= e!882136 0)))

(declare-fun b!1581021 () Bool)

(assert (=> b!1581021 (= e!882136 (+ 1 (ListPrimitiveSize!196 (t!51774 l!1390))))))

(assert (= (and d!166443 c!146493) b!1581020))

(assert (= (and d!166443 (not c!146493)) b!1581021))

(assert (=> b!1581021 m!1451423))

(assert (=> b!1580942 d!166443))

(declare-fun d!166445 () Bool)

(declare-fun res!1080220 () Bool)

(declare-fun e!882139 () Bool)

(assert (=> d!166445 (=> res!1080220 e!882139)))

(assert (=> d!166445 (= res!1080220 (and ((_ is Cons!36864) l!1390) (= (_1!12827 (h!38408 l!1390)) key!405)))))

(assert (=> d!166445 (= (containsKey!929 l!1390 key!405) e!882139)))

(declare-fun b!1581024 () Bool)

(declare-fun e!882140 () Bool)

(assert (=> b!1581024 (= e!882139 e!882140)))

(declare-fun res!1080221 () Bool)

(assert (=> b!1581024 (=> (not res!1080221) (not e!882140))))

(assert (=> b!1581024 (= res!1080221 (and (or (not ((_ is Cons!36864) l!1390)) (bvsle (_1!12827 (h!38408 l!1390)) key!405)) ((_ is Cons!36864) l!1390) (bvslt (_1!12827 (h!38408 l!1390)) key!405)))))

(declare-fun b!1581025 () Bool)

(assert (=> b!1581025 (= e!882140 (containsKey!929 (t!51774 l!1390) key!405))))

(assert (= (and d!166445 (not res!1080220)) b!1581024))

(assert (= (and b!1581024 res!1080221) b!1581025))

(assert (=> b!1581025 m!1451437))

(assert (=> b!1580943 d!166445))

(declare-fun d!166447 () Bool)

(declare-fun lt!676646 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!838 (List!36868) (InoxSet tuple2!25632))

(assert (=> d!166447 (= lt!676646 (select (content!838 (t!51774 l!1390)) lt!676621))))

(declare-fun e!882161 () Bool)

(assert (=> d!166447 (= lt!676646 e!882161)))

(declare-fun res!1080242 () Bool)

(assert (=> d!166447 (=> (not res!1080242) (not e!882161))))

(assert (=> d!166447 (= res!1080242 ((_ is Cons!36864) (t!51774 l!1390)))))

(assert (=> d!166447 (= (contains!10454 (t!51774 l!1390) lt!676621) lt!676646)))

(declare-fun b!1581046 () Bool)

(declare-fun e!882162 () Bool)

(assert (=> b!1581046 (= e!882161 e!882162)))

(declare-fun res!1080243 () Bool)

(assert (=> b!1581046 (=> res!1080243 e!882162)))

(assert (=> b!1581046 (= res!1080243 (= (h!38408 (t!51774 l!1390)) lt!676621))))

(declare-fun b!1581047 () Bool)

(assert (=> b!1581047 (= e!882162 (contains!10454 (t!51774 (t!51774 l!1390)) lt!676621))))

(assert (= (and d!166447 res!1080242) b!1581046))

(assert (= (and b!1581046 (not res!1080243)) b!1581047))

(declare-fun m!1451497 () Bool)

(assert (=> d!166447 m!1451497))

(declare-fun m!1451499 () Bool)

(assert (=> d!166447 m!1451499))

(declare-fun m!1451501 () Bool)

(assert (=> b!1581047 m!1451501))

(assert (=> b!1580934 d!166447))

(declare-fun d!166455 () Bool)

(declare-fun res!1080250 () Bool)

(declare-fun e!882173 () Bool)

(assert (=> d!166455 (=> res!1080250 e!882173)))

(assert (=> d!166455 (= res!1080250 (or ((_ is Nil!36865) (t!51774 l!1390)) ((_ is Nil!36865) (t!51774 (t!51774 l!1390)))))))

(assert (=> d!166455 (= (isStrictlySorted!1083 (t!51774 l!1390)) e!882173)))

(declare-fun b!1581062 () Bool)

(declare-fun e!882174 () Bool)

(assert (=> b!1581062 (= e!882173 e!882174)))

(declare-fun res!1080251 () Bool)

(assert (=> b!1581062 (=> (not res!1080251) (not e!882174))))

(assert (=> b!1581062 (= res!1080251 (bvslt (_1!12827 (h!38408 (t!51774 l!1390))) (_1!12827 (h!38408 (t!51774 (t!51774 l!1390))))))))

(declare-fun b!1581063 () Bool)

(assert (=> b!1581063 (= e!882174 (isStrictlySorted!1083 (t!51774 (t!51774 l!1390))))))

(assert (= (and d!166455 (not res!1080250)) b!1581062))

(assert (= (and b!1581062 res!1080251) b!1581063))

(declare-fun m!1451511 () Bool)

(assert (=> b!1581063 m!1451511))

(assert (=> b!1580935 d!166455))

(declare-fun d!166465 () Bool)

(declare-fun res!1080252 () Bool)

(declare-fun e!882175 () Bool)

(assert (=> d!166465 (=> res!1080252 e!882175)))

(assert (=> d!166465 (= res!1080252 (or ((_ is Nil!36865) l!1390) ((_ is Nil!36865) (t!51774 l!1390))))))

(assert (=> d!166465 (= (isStrictlySorted!1083 l!1390) e!882175)))

(declare-fun b!1581064 () Bool)

(declare-fun e!882176 () Bool)

(assert (=> b!1581064 (= e!882175 e!882176)))

(declare-fun res!1080253 () Bool)

(assert (=> b!1581064 (=> (not res!1080253) (not e!882176))))

(assert (=> b!1581064 (= res!1080253 (bvslt (_1!12827 (h!38408 l!1390)) (_1!12827 (h!38408 (t!51774 l!1390)))))))

(declare-fun b!1581065 () Bool)

(assert (=> b!1581065 (= e!882176 (isStrictlySorted!1083 (t!51774 l!1390)))))

(assert (= (and d!166465 (not res!1080252)) b!1581064))

(assert (= (and b!1581064 res!1080253) b!1581065))

(assert (=> b!1581065 m!1451439))

(assert (=> start!137330 d!166465))

(declare-fun d!166467 () Bool)

(assert (=> d!166467 (= (get!26810 lt!676622) (v!22428 lt!676622))))

(assert (=> b!1580940 d!166467))

(declare-fun d!166469 () Bool)

(assert (=> d!166469 (= (isEmpty!1182 lt!676622) (not ((_ is Some!921) lt!676622)))))

(assert (=> b!1580938 d!166469))

(declare-fun d!166471 () Bool)

(assert (=> d!166471 (= (unapply!94 l!1390) (ite ((_ is Nil!36865) l!1390) None!920 (Some!921 (tuple2!25635 (h!38408 l!1390) (t!51774 l!1390)))))))

(assert (=> b!1580938 d!166471))

(declare-fun d!166475 () Bool)

(declare-fun lt!676652 () Bool)

(assert (=> d!166475 (= lt!676652 (select (content!838 l!1390) lt!676621))))

(declare-fun e!882189 () Bool)

(assert (=> d!166475 (= lt!676652 e!882189)))

(declare-fun res!1080266 () Bool)

(assert (=> d!166475 (=> (not res!1080266) (not e!882189))))

(assert (=> d!166475 (= res!1080266 ((_ is Cons!36864) l!1390))))

(assert (=> d!166475 (= (contains!10454 l!1390 lt!676621) lt!676652)))

(declare-fun b!1581078 () Bool)

(declare-fun e!882190 () Bool)

(assert (=> b!1581078 (= e!882189 e!882190)))

(declare-fun res!1080267 () Bool)

(assert (=> b!1581078 (=> res!1080267 e!882190)))

(assert (=> b!1581078 (= res!1080267 (= (h!38408 l!1390) lt!676621))))

(declare-fun b!1581079 () Bool)

(assert (=> b!1581079 (= e!882190 (contains!10454 (t!51774 l!1390) lt!676621))))

(assert (= (and d!166475 res!1080266) b!1581078))

(assert (= (and b!1581078 (not res!1080267)) b!1581079))

(declare-fun m!1451513 () Bool)

(assert (=> d!166475 m!1451513))

(declare-fun m!1451515 () Bool)

(assert (=> d!166475 m!1451515))

(assert (=> b!1581079 m!1451419))

(assert (=> b!1580939 d!166475))

(declare-fun b!1581090 () Bool)

(declare-fun e!882197 () Bool)

(declare-fun tp!114570 () Bool)

(assert (=> b!1581090 (= e!882197 (and tp_is_empty!39235 tp!114570))))

(assert (=> b!1580936 (= tp!114561 e!882197)))

(assert (= (and b!1580936 ((_ is Cons!36864) (t!51774 l!1390))) b!1581090))

(check-sat (not b!1581019) (not b!1581025) (not b!1581047) (not b!1581079) (not b!1581063) (not d!166475) (not b!1581021) (not d!166447) (not b!1581090) (not b!1581065) (not b!1581009) tp_is_empty!39235)
(check-sat)
