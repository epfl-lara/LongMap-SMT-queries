; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!2230 () Bool)

(assert start!2230)

(declare-fun b!14928 () Bool)

(assert (=> b!14928 true))

(declare-fun b!14926 () Bool)

(declare-fun e!8989 () Bool)

(declare-fun e!8987 () Bool)

(assert (=> b!14926 (= e!8989 e!8987)))

(declare-fun c!1409 () Bool)

(declare-datatypes ((B!570 0))(
  ( (B!571 (val!383 Int)) )
))
(declare-datatypes ((tuple2!566 0))(
  ( (tuple2!567 (_1!283 (_ BitVec 64)) (_2!283 B!570)) )
))
(declare-datatypes ((List!438 0))(
  ( (Nil!435) (Cons!434 (h!1000 tuple2!566) (t!2840 List!438)) )
))
(declare-fun l!522 () List!438)

(declare-fun isEmpty!110 (List!438) Bool)

(assert (=> b!14926 (= c!1409 (isEmpty!110 l!522))))

(declare-fun res!11440 () Bool)

(declare-fun e!8985 () Bool)

(assert (=> start!2230 (=> (not res!11440) (not e!8985))))

(declare-fun isStrictlySorted!125 (List!438) Bool)

(assert (=> start!2230 (= res!11440 (isStrictlySorted!125 l!522))))

(assert (=> start!2230 e!8985))

(declare-fun e!8988 () Bool)

(assert (=> start!2230 e!8988))

(declare-fun tp_is_empty!749 () Bool)

(assert (=> start!2230 tp_is_empty!749))

(declare-fun b!14927 () Bool)

(declare-fun e!8986 () Bool)

(declare-fun tp!2404 () Bool)

(assert (=> b!14927 (= e!8986 (and tp_is_empty!749 tp!2404))))

(declare-fun res!11438 () Bool)

(assert (=> b!14928 (=> res!11438 e!8989)))

(declare-fun lt!3636 () List!438)

(declare-fun lambda!191 () Int)

(declare-fun forall!103 (List!438 Int) Bool)

(assert (=> b!14928 (= res!11438 (not (forall!103 lt!3636 lambda!191)))))

(declare-fun b!14929 () Bool)

(declare-fun res!11436 () Bool)

(assert (=> b!14929 (=> (not res!11436) (not e!8985))))

(declare-fun value!159 () B!570)

(assert (=> b!14929 (= res!11436 (and (or (not (is-Cons!434 l!522)) (not (= (_2!283 (h!1000 l!522)) value!159))) (or (not (is-Cons!434 l!522)) (= (_2!283 (h!1000 l!522)) value!159)) (not (is-Nil!435 l!522))))))

(declare-fun bm!455 () Bool)

(declare-fun call!458 () Bool)

(assert (=> bm!455 (= call!458 (isEmpty!110 lt!3636))))

(declare-fun b!14930 () Bool)

(declare-fun e!8990 () Bool)

(declare-fun head!799 (List!438) tuple2!566)

(assert (=> b!14930 (= e!8990 (bvslt (_1!283 (head!799 lt!3636)) (_1!283 (head!799 l!522))))))

(declare-fun b!14931 () Bool)

(assert (=> b!14931 (= e!8987 (not call!458))))

(declare-fun b!14932 () Bool)

(assert (=> b!14932 (= e!8985 e!8989)))

(declare-fun res!11437 () Bool)

(assert (=> b!14932 (=> res!11437 e!8989)))

(assert (=> b!14932 (= res!11437 (not (isStrictlySorted!125 lt!3636)))))

(declare-fun err!35 () List!438)

(assert (=> b!14932 (= lt!3636 err!35)))

(assert (=> b!14932 true))

(assert (=> b!14932 e!8986))

(declare-fun b!14933 () Bool)

(assert (=> b!14933 (= e!8987 e!8990)))

(declare-fun res!11439 () Bool)

(assert (=> b!14933 (= res!11439 (not call!458))))

(assert (=> b!14933 (=> (not res!11439) (not e!8990))))

(declare-fun b!14934 () Bool)

(declare-fun tp!2405 () Bool)

(assert (=> b!14934 (= e!8988 (and tp_is_empty!749 tp!2405))))

(assert (= (and start!2230 res!11440) b!14929))

(assert (= (and b!14929 res!11436) b!14932))

(assert (= (and b!14932 (is-Cons!434 err!35)) b!14927))

(assert (= (and b!14932 (not res!11437)) b!14928))

(assert (= (and b!14928 (not res!11438)) b!14926))

(assert (= (and b!14926 c!1409) b!14931))

(assert (= (and b!14926 (not c!1409)) b!14933))

(assert (= (and b!14933 res!11439) b!14930))

(assert (= (or b!14931 b!14933) bm!455))

(assert (= (and start!2230 (is-Cons!434 l!522)) b!14934))

(declare-fun m!9933 () Bool)

(assert (=> b!14932 m!9933))

(declare-fun m!9935 () Bool)

(assert (=> bm!455 m!9935))

(declare-fun m!9937 () Bool)

(assert (=> b!14930 m!9937))

(declare-fun m!9939 () Bool)

(assert (=> b!14930 m!9939))

(declare-fun m!9941 () Bool)

(assert (=> b!14926 m!9941))

(declare-fun m!9943 () Bool)

(assert (=> start!2230 m!9943))

(declare-fun m!9945 () Bool)

(assert (=> b!14928 m!9945))

(push 1)

(assert (not b!14930))

(assert (not start!2230))

(assert (not b!14926))

