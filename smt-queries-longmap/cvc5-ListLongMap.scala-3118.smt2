; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43828 () Bool)

(assert start!43828)

(declare-fun b!484224 () Bool)

(declare-fun res!288524 () Bool)

(declare-fun e!285042 () Bool)

(assert (=> b!484224 (=> (not res!288524) (not e!285042))))

(declare-datatypes ((B!1134 0))(
  ( (B!1135 (val!7019 Int)) )
))
(declare-datatypes ((tuple2!9154 0))(
  ( (tuple2!9155 (_1!4588 (_ BitVec 64)) (_2!4588 B!1134)) )
))
(declare-datatypes ((List!9185 0))(
  ( (Nil!9182) (Cons!9181 (h!10037 tuple2!9154) (t!15399 List!9185)) )
))
(declare-fun l!956 () List!9185)

(declare-fun key!251 () (_ BitVec 64))

(declare-fun containsKey!385 (List!9185 (_ BitVec 64)) Bool)

(assert (=> b!484224 (= res!288524 (not (containsKey!385 l!956 key!251)))))

(declare-fun b!484225 () Bool)

(declare-fun e!285041 () Bool)

(assert (=> b!484225 (= e!285041 (containsKey!385 (t!15399 l!956) key!251))))

(declare-fun b!484226 () Bool)

(declare-fun res!288525 () Bool)

(assert (=> b!484226 (=> (not res!288525) (not e!285041))))

(declare-fun isStrictlySorted!410 (List!9185) Bool)

(assert (=> b!484226 (= res!288525 (isStrictlySorted!410 (t!15399 l!956)))))

(declare-fun b!484227 () Bool)

(assert (=> b!484227 (= e!285042 e!285041)))

(declare-fun res!288523 () Bool)

(assert (=> b!484227 (=> (not res!288523) (not e!285041))))

(assert (=> b!484227 (= res!288523 (and (is-Cons!9181 l!956) (bvslt (_1!4588 (h!10037 l!956)) key!251)))))

(declare-fun value!166 () B!1134)

(declare-fun lt!219379 () List!9185)

(declare-fun insertStrictlySorted!238 (List!9185 (_ BitVec 64) B!1134) List!9185)

(assert (=> b!484227 (= lt!219379 (insertStrictlySorted!238 l!956 key!251 value!166))))

(declare-fun b!484228 () Bool)

(declare-fun e!285040 () Bool)

(declare-fun tp_is_empty!13943 () Bool)

(declare-fun tp!43522 () Bool)

(assert (=> b!484228 (= e!285040 (and tp_is_empty!13943 tp!43522))))

(declare-fun res!288526 () Bool)

(assert (=> start!43828 (=> (not res!288526) (not e!285042))))

(assert (=> start!43828 (= res!288526 (isStrictlySorted!410 l!956))))

(assert (=> start!43828 e!285042))

(assert (=> start!43828 e!285040))

(assert (=> start!43828 true))

(assert (=> start!43828 tp_is_empty!13943))

(assert (= (and start!43828 res!288526) b!484224))

(assert (= (and b!484224 res!288524) b!484227))

(assert (= (and b!484227 res!288523) b!484226))

(assert (= (and b!484226 res!288525) b!484225))

(assert (= (and start!43828 (is-Cons!9181 l!956)) b!484228))

(declare-fun m!465147 () Bool)

(assert (=> b!484225 m!465147))

(declare-fun m!465149 () Bool)

(assert (=> b!484227 m!465149))

(declare-fun m!465151 () Bool)

(assert (=> start!43828 m!465151))

(declare-fun m!465153 () Bool)

(assert (=> b!484226 m!465153))

(declare-fun m!465155 () Bool)

(assert (=> b!484224 m!465155))

(push 1)

(assert tp_is_empty!13943)

(assert (not b!484227))

(assert (not start!43828))

(assert (not b!484228))

(assert (not b!484225))

(assert (not b!484224))

(assert (not b!484226))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!77105 () Bool)

(declare-fun res!288545 () Bool)

(declare-fun e!285061 () Bool)

(assert (=> d!77105 (=> res!288545 e!285061)))

(assert (=> d!77105 (= res!288545 (or (is-Nil!9182 l!956) (is-Nil!9182 (t!15399 l!956))))))

(assert (=> d!77105 (= (isStrictlySorted!410 l!956) e!285061)))

(declare-fun b!484247 () Bool)

(declare-fun e!285062 () Bool)

(assert (=> b!484247 (= e!285061 e!285062)))

(declare-fun res!288546 () Bool)

(assert (=> b!484247 (=> (not res!288546) (not e!285062))))

(assert (=> b!484247 (= res!288546 (bvslt (_1!4588 (h!10037 l!956)) (_1!4588 (h!10037 (t!15399 l!956)))))))

(declare-fun b!484248 () Bool)

(assert (=> b!484248 (= e!285062 (isStrictlySorted!410 (t!15399 l!956)))))

(assert (= (and d!77105 (not res!288545)) b!484247))

(assert (= (and b!484247 res!288546) b!484248))

(assert (=> b!484248 m!465153))

(assert (=> start!43828 d!77105))

(declare-fun bm!31099 () Bool)

(declare-fun call!31103 () List!9185)

(declare-fun call!31104 () List!9185)

(assert (=> bm!31099 (= call!31103 call!31104)))

(declare-fun b!484321 () Bool)

(declare-fun res!288563 () Bool)

(declare-fun e!285102 () Bool)

(assert (=> b!484321 (=> (not res!288563) (not e!285102))))

(declare-fun lt!219387 () List!9185)

(assert (=> b!484321 (= res!288563 (containsKey!385 lt!219387 key!251))))

(declare-fun b!484322 () Bool)

(declare-fun e!285103 () List!9185)

(assert (=> b!484322 (= e!285103 (insertStrictlySorted!238 (t!15399 l!956) key!251 value!166))))

(declare-fun c!58211 () Bool)

(declare-fun bm!31100 () Bool)

(declare-fun $colon$colon!117 (List!9185 tuple2!9154) List!9185)

(assert (=> bm!31100 (= call!31104 ($colon$colon!117 e!285103 (ite c!58211 (h!10037 l!956) (tuple2!9155 key!251 value!166))))))

(declare-fun c!58213 () Bool)

(assert (=> bm!31100 (= c!58213 c!58211)))

(declare-fun b!484324 () Bool)

(declare-fun contains!2655 (List!9185 tuple2!9154) Bool)

(assert (=> b!484324 (= e!285102 (contains!2655 lt!219387 (tuple2!9155 key!251 value!166)))))

(declare-fun b!484325 () Bool)

(declare-fun e!285101 () List!9185)

(declare-fun call!31102 () List!9185)

(assert (=> b!484325 (= e!285101 call!31102)))

(declare-fun c!58212 () Bool)

(declare-fun c!58210 () Bool)

(declare-fun b!484326 () Bool)

(assert (=> b!484326 (= e!285103 (ite c!58212 (t!15399 l!956) (ite c!58210 (Cons!9181 (h!10037 l!956) (t!15399 l!956)) Nil!9182)))))

(declare-fun bm!31101 () Bool)

(assert (=> bm!31101 (= call!31102 call!31103)))

(declare-fun b!484327 () Bool)

(assert (=> b!484327 (= c!58210 (and (is-Cons!9181 l!956) (bvsgt (_1!4588 (h!10037 l!956)) key!251)))))

(declare-fun e!285100 () List!9185)

(assert (=> b!484327 (= e!285100 e!285101)))

(declare-fun b!484328 () Bool)

(declare-fun e!285104 () List!9185)

(assert (=> b!484328 (= e!285104 call!31104)))

(declare-fun b!484329 () Bool)

(assert (=> b!484329 (= e!285101 call!31102)))

(declare-fun b!484330 () Bool)

(assert (=> b!484330 (= e!285104 e!285100)))

(assert (=> b!484330 (= c!58212 (and (is-Cons!9181 l!956) (= (_1!4588 (h!10037 l!956)) key!251)))))

(declare-fun d!77111 () Bool)

(assert (=> d!77111 e!285102))

(declare-fun res!288564 () Bool)

(assert (=> d!77111 (=> (not res!288564) (not e!285102))))

(assert (=> d!77111 (= res!288564 (isStrictlySorted!410 lt!219387))))

(assert (=> d!77111 (= lt!219387 e!285104)))

(assert (=> d!77111 (= c!58211 (and (is-Cons!9181 l!956) (bvslt (_1!4588 (h!10037 l!956)) key!251)))))

(assert (=> d!77111 (isStrictlySorted!410 l!956)))

(assert (=> d!77111 (= (insertStrictlySorted!238 l!956 key!251 value!166) lt!219387)))

(declare-fun b!484323 () Bool)

(assert (=> b!484323 (= e!285100 call!31103)))

(assert (= (and d!77111 c!58211) b!484328))

(assert (= (and d!77111 (not c!58211)) b!484330))

(assert (= (and b!484330 c!58212) b!484323))

(assert (= (and b!484330 (not c!58212)) b!484327))

(assert (= (and b!484327 c!58210) b!484325))

(assert (= (and b!484327 (not c!58210)) b!484329))

(assert (= (or b!484325 b!484329) bm!31101))

(assert (= (or b!484323 bm!31101) bm!31099))

(assert (= (or b!484328 bm!31099) bm!31100))

(assert (= (and bm!31100 c!58213) b!484322))

(assert (= (and bm!31100 (not c!58213)) b!484326))

(assert (= (and d!77111 res!288564) b!484321))

(assert (= (and b!484321 res!288563) b!484324))

(declare-fun m!465171 () Bool)

(assert (=> b!484322 m!465171))

(declare-fun m!465173 () Bool)

(assert (=> b!484324 m!465173))

(declare-fun m!465175 () Bool)

(assert (=> d!77111 m!465175))

(assert (=> d!77111 m!465151))

(declare-fun m!465177 () Bool)

(assert (=> bm!31100 m!465177))

(declare-fun m!465179 () Bool)

(assert (=> b!484321 m!465179))

(assert (=> b!484227 d!77111))

(declare-fun d!77117 () Bool)

(declare-fun res!288577 () Bool)

(declare-fun e!285123 () Bool)

(assert (=> d!77117 (=> res!288577 e!285123)))

(assert (=> d!77117 (= res!288577 (and (is-Cons!9181 (t!15399 l!956)) (= (_1!4588 (h!10037 (t!15399 l!956))) key!251)))))

(assert (=> d!77117 (= (containsKey!385 (t!15399 l!956) key!251) e!285123)))

(declare-fun b!484356 () Bool)

(declare-fun e!285124 () Bool)

(assert (=> b!484356 (= e!285123 e!285124)))

(declare-fun res!288578 () Bool)

(assert (=> b!484356 (=> (not res!288578) (not e!285124))))

(assert (=> b!484356 (= res!288578 (and (or (not (is-Cons!9181 (t!15399 l!956))) (bvsle (_1!4588 (h!10037 (t!15399 l!956))) key!251)) (is-Cons!9181 (t!15399 l!956)) (bvslt (_1!4588 (h!10037 (t!15399 l!956))) key!251)))))

(declare-fun b!484357 () Bool)

(assert (=> b!484357 (= e!285124 (containsKey!385 (t!15399 (t!15399 l!956)) key!251))))

(assert (= (and d!77117 (not res!288577)) b!484356))

(assert (= (and b!484356 res!288578) b!484357))

(declare-fun m!465193 () Bool)

(assert (=> b!484357 m!465193))

(assert (=> b!484225 d!77117))

(declare-fun d!77123 () Bool)

(declare-fun res!288579 () Bool)

(declare-fun e!285125 () Bool)

(assert (=> d!77123 (=> res!288579 e!285125)))

(assert (=> d!77123 (= res!288579 (or (is-Nil!9182 (t!15399 l!956)) (is-Nil!9182 (t!15399 (t!15399 l!956)))))))

(assert (=> d!77123 (= (isStrictlySorted!410 (t!15399 l!956)) e!285125)))

(declare-fun b!484358 () Bool)

(declare-fun e!285126 () Bool)

(assert (=> b!484358 (= e!285125 e!285126)))

(declare-fun res!288580 () Bool)

(assert (=> b!484358 (=> (not res!288580) (not e!285126))))

(assert (=> b!484358 (= res!288580 (bvslt (_1!4588 (h!10037 (t!15399 l!956))) (_1!4588 (h!10037 (t!15399 (t!15399 l!956))))))))

(declare-fun b!484359 () Bool)

(assert (=> b!484359 (= e!285126 (isStrictlySorted!410 (t!15399 (t!15399 l!956))))))

(assert (= (and d!77123 (not res!288579)) b!484358))

(assert (= (and b!484358 res!288580) b!484359))

(declare-fun m!465195 () Bool)

(assert (=> b!484359 m!465195))

(assert (=> b!484226 d!77123))

(declare-fun d!77125 () Bool)

(declare-fun res!288581 () Bool)

(declare-fun e!285127 () Bool)

(assert (=> d!77125 (=> res!288581 e!285127)))

(assert (=> d!77125 (= res!288581 (and (is-Cons!9181 l!956) (= (_1!4588 (h!10037 l!956)) key!251)))))

(assert (=> d!77125 (= (containsKey!385 l!956 key!251) e!285127)))

(declare-fun b!484360 () Bool)

(declare-fun e!285128 () Bool)

(assert (=> b!484360 (= e!285127 e!285128)))

(declare-fun res!288582 () Bool)

(assert (=> b!484360 (=> (not res!288582) (not e!285128))))

(assert (=> b!484360 (= res!288582 (and (or (not (is-Cons!9181 l!956)) (bvsle (_1!4588 (h!10037 l!956)) key!251)) (is-Cons!9181 l!956) (bvslt (_1!4588 (h!10037 l!956)) key!251)))))

(declare-fun b!484361 () Bool)

(assert (=> b!484361 (= e!285128 (containsKey!385 (t!15399 l!956) key!251))))

(assert (= (and d!77125 (not res!288581)) b!484360))

(assert (= (and b!484360 res!288582) b!484361))

(assert (=> b!484361 m!465147))

(assert (=> b!484224 d!77125))

(declare-fun b!484366 () Bool)

(declare-fun e!285131 () Bool)

(declare-fun tp!43528 () Bool)

(assert (=> b!484366 (= e!285131 (and tp_is_empty!13943 tp!43528))))

(assert (=> b!484228 (= tp!43522 e!285131)))

(assert (= (and b!484228 (is-Cons!9181 (t!15399 l!956))) b!484366))

(push 1)

(assert (not b!484324))

(assert (not b!484357))

(assert tp_is_empty!13943)

(assert (not b!484359))

(assert (not b!484248))

(assert (not b!484366))

(assert (not d!77111))

(assert (not b!484321))

(assert (not b!484361))

(assert (not b!484322))

(assert (not bm!31100))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

