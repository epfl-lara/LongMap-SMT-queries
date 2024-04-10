; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72152 () Bool)

(assert start!72152)

(declare-fun res!569231 () Bool)

(declare-fun e!466943 () Bool)

(assert (=> start!72152 (=> (not res!569231) (not e!466943))))

(declare-datatypes ((List!16011 0))(
  ( (Nil!16008) (Cons!16007 (h!17138 (_ BitVec 64)) (t!22382 List!16011)) )
))
(declare-fun l!404 () List!16011)

(declare-fun length!31 (List!16011) Int)

(assert (=> start!72152 (= res!569231 (< (length!31 l!404) 2147483647))))

(assert (=> start!72152 e!466943))

(assert (=> start!72152 true))

(declare-fun b!836831 () Bool)

(declare-fun res!569232 () Bool)

(assert (=> b!836831 (=> (not res!569232) (not e!466943))))

(assert (=> b!836831 (= res!569232 (is-Cons!16007 l!404))))

(declare-fun b!836832 () Bool)

(assert (=> b!836832 (= e!466943 (>= (length!31 (t!22382 l!404)) 2147483647))))

(assert (= (and start!72152 res!569231) b!836831))

(assert (= (and b!836831 res!569232) b!836832))

(declare-fun m!781933 () Bool)

(assert (=> start!72152 m!781933))

(declare-fun m!781935 () Bool)

(assert (=> b!836832 m!781935))

(push 1)

(assert (not start!72152))

(assert (not b!836832))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!107739 () Bool)

(declare-fun size!22908 (List!16011) Int)

(assert (=> d!107739 (= (length!31 l!404) (size!22908 l!404))))

(declare-fun bs!23529 () Bool)

(assert (= bs!23529 d!107739))

(declare-fun m!781945 () Bool)

(assert (=> bs!23529 m!781945))

(assert (=> start!72152 d!107739))

(declare-fun d!107743 () Bool)

(assert (=> d!107743 (= (length!31 (t!22382 l!404)) (size!22908 (t!22382 l!404)))))

(declare-fun bs!23530 () Bool)

(assert (= bs!23530 d!107743))

(declare-fun m!781947 () Bool)

(assert (=> bs!23530 m!781947))

(assert (=> b!836832 d!107743))

(push 1)

(assert (not d!107743))

(assert (not d!107739))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!107749 () Bool)

(declare-fun lt!380489 () Int)

(assert (=> d!107749 (>= lt!380489 0)))

(declare-fun e!466954 () Int)

(assert (=> d!107749 (= lt!380489 e!466954)))

(declare-fun c!91122 () Bool)

(assert (=> d!107749 (= c!91122 (is-Nil!16008 (t!22382 l!404)))))

(assert (=> d!107749 (= (size!22908 (t!22382 l!404)) lt!380489)))

(declare-fun b!836853 () Bool)

(assert (=> b!836853 (= e!466954 0)))

(declare-fun b!836854 () Bool)

(assert (=> b!836854 (= e!466954 (+ 1 (size!22908 (t!22382 (t!22382 l!404)))))))

(assert (= (and d!107749 c!91122) b!836853))

(assert (= (and d!107749 (not c!91122)) b!836854))

(declare-fun m!781953 () Bool)

(assert (=> b!836854 m!781953))

(assert (=> d!107743 d!107749))

(declare-fun d!107755 () Bool)

(declare-fun lt!380490 () Int)

(assert (=> d!107755 (>= lt!380490 0)))

(declare-fun e!466955 () Int)

(assert (=> d!107755 (= lt!380490 e!466955)))

(declare-fun c!91123 () Bool)

(assert (=> d!107755 (= c!91123 (is-Nil!16008 l!404))))

