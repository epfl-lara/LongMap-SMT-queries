; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!138404 () Bool)

(assert start!138404)

(declare-fun res!1083320 () Bool)

(declare-fun e!885800 () Bool)

(assert (=> start!138404 (=> (not res!1083320) (not e!885800))))

(declare-datatypes ((B!3032 0))(
  ( (B!3033 (val!19878 Int)) )
))
(declare-datatypes ((tuple2!25924 0))(
  ( (tuple2!25925 (_1!12973 (_ BitVec 64)) (_2!12973 B!3032)) )
))
(declare-datatypes ((List!36998 0))(
  ( (Nil!36995) (Cons!36994 (h!38537 tuple2!25924) (t!51928 List!36998)) )
))
(declare-fun l!636 () List!36998)

(declare-fun isStrictlySorted!1220 (List!36998) Bool)

(assert (=> start!138404 (= res!1083320 (isStrictlySorted!1220 l!636))))

(assert (=> start!138404 e!885800))

(declare-fun e!885801 () Bool)

(assert (=> start!138404 e!885801))

(assert (=> start!138404 true))

(declare-fun b!1586262 () Bool)

(declare-fun res!1083319 () Bool)

(assert (=> b!1586262 (=> (not res!1083319) (not e!885800))))

(declare-fun key!185 () (_ BitVec 64))

(assert (=> b!1586262 (= res!1083319 (and (or (not (is-Cons!36994 l!636)) (not (= (_1!12973 (h!38537 l!636)) key!185))) (or (not (is-Cons!36994 l!636)) (bvsle (_1!12973 (h!38537 l!636)) key!185)) (is-Cons!36994 l!636) (bvslt (_1!12973 (h!38537 l!636)) key!185)))))

(declare-fun b!1586263 () Bool)

(declare-fun ListPrimitiveSize!232 (List!36998) Int)

(assert (=> b!1586263 (= e!885800 (>= (ListPrimitiveSize!232 (t!51928 l!636)) (ListPrimitiveSize!232 l!636)))))

(declare-fun b!1586264 () Bool)

(declare-fun tp_is_empty!39565 () Bool)

(declare-fun tp!115398 () Bool)

(assert (=> b!1586264 (= e!885801 (and tp_is_empty!39565 tp!115398))))

(assert (= (and start!138404 res!1083320) b!1586262))

(assert (= (and b!1586262 res!1083319) b!1586263))

(assert (= (and start!138404 (is-Cons!36994 l!636)) b!1586264))

(declare-fun m!1454703 () Bool)

(assert (=> start!138404 m!1454703))

(declare-fun m!1454705 () Bool)

(assert (=> b!1586263 m!1454705))

(declare-fun m!1454707 () Bool)

(assert (=> b!1586263 m!1454707))

(push 1)

(assert (not start!138404))

(assert (not b!1586263))

(assert (not b!1586264))

(assert tp_is_empty!39565)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!167897 () Bool)

(declare-fun res!1083341 () Bool)

(declare-fun e!885822 () Bool)

(assert (=> d!167897 (=> res!1083341 e!885822)))

(assert (=> d!167897 (= res!1083341 (or (is-Nil!36995 l!636) (is-Nil!36995 (t!51928 l!636))))))

(assert (=> d!167897 (= (isStrictlySorted!1220 l!636) e!885822)))

(declare-fun b!1586291 () Bool)

(declare-fun e!885823 () Bool)

(assert (=> b!1586291 (= e!885822 e!885823)))

(declare-fun res!1083342 () Bool)

(assert (=> b!1586291 (=> (not res!1083342) (not e!885823))))

(assert (=> b!1586291 (= res!1083342 (bvslt (_1!12973 (h!38537 l!636)) (_1!12973 (h!38537 (t!51928 l!636)))))))

(declare-fun b!1586292 () Bool)

(assert (=> b!1586292 (= e!885823 (isStrictlySorted!1220 (t!51928 l!636)))))

(assert (= (and d!167897 (not res!1083341)) b!1586291))

(assert (= (and b!1586291 res!1083342) b!1586292))

(declare-fun m!1454721 () Bool)

(assert (=> b!1586292 m!1454721))

(assert (=> start!138404 d!167897))

(declare-fun d!167901 () Bool)

(declare-fun lt!677510 () Int)

(assert (=> d!167901 (>= lt!677510 0)))

(declare-fun e!885830 () Int)

(assert (=> d!167901 (= lt!677510 e!885830)))

(declare-fun c!147047 () Bool)

(assert (=> d!167901 (= c!147047 (is-Nil!36995 (t!51928 l!636)))))

(assert (=> d!167901 (= (ListPrimitiveSize!232 (t!51928 l!636)) lt!677510)))

(declare-fun b!1586303 () Bool)

(assert (=> b!1586303 (= e!885830 0)))

(declare-fun b!1586304 () Bool)

(assert (=> b!1586304 (= e!885830 (+ 1 (ListPrimitiveSize!232 (t!51928 (t!51928 l!636)))))))

(assert (= (and d!167901 c!147047) b!1586303))

(assert (= (and d!167901 (not c!147047)) b!1586304))

(declare-fun m!1454725 () Bool)

(assert (=> b!1586304 m!1454725))

(assert (=> b!1586263 d!167901))

(declare-fun d!167907 () Bool)

(declare-fun lt!677511 () Int)

(assert (=> d!167907 (>= lt!677511 0)))

(declare-fun e!885831 () Int)

(assert (=> d!167907 (= lt!677511 e!885831)))

(declare-fun c!147048 () Bool)

(assert (=> d!167907 (= c!147048 (is-Nil!36995 l!636))))

(assert (=> d!167907 (= (ListPrimitiveSize!232 l!636) lt!677511)))

(declare-fun b!1586305 () Bool)

(assert (=> b!1586305 (= e!885831 0)))

(declare-fun b!1586306 () Bool)

(assert (=> b!1586306 (= e!885831 (+ 1 (ListPrimitiveSize!232 (t!51928 l!636))))))

(assert (= (and d!167907 c!147048) b!1586305))

(assert (= (and d!167907 (not c!147048)) b!1586306))

(assert (=> b!1586306 m!1454705))

(assert (=> b!1586263 d!167907))

(declare-fun b!1586317 () Bool)

(declare-fun e!885836 () Bool)

(declare-fun tp!115407 () Bool)

(assert (=> b!1586317 (= e!885836 (and tp_is_empty!39565 tp!115407))))

(assert (=> b!1586264 (= tp!115398 e!885836)))

(assert (= (and b!1586264 (is-Cons!36994 (t!51928 l!636))) b!1586317))

(push 1)

(assert (not b!1586292))

(assert (not b!1586304))

(assert (not b!1586306))

(assert (not b!1586317))

(assert tp_is_empty!39565)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

