; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72184 () Bool)

(assert start!72184)

(declare-fun res!569246 () Bool)

(declare-fun e!466976 () Bool)

(assert (=> start!72184 (=> (not res!569246) (not e!466976))))

(declare-datatypes ((List!16015 0))(
  ( (Nil!16012) (Cons!16011 (h!17142 (_ BitVec 64)) (t!22386 List!16015)) )
))
(declare-fun l!404 () List!16015)

(declare-fun length!35 (List!16015) Int)

(assert (=> start!72184 (= res!569246 (< (length!35 l!404) 2147483647))))

(assert (=> start!72184 e!466976))

(assert (=> start!72184 true))

(declare-fun b!836888 () Bool)

(declare-fun res!569247 () Bool)

(assert (=> b!836888 (=> (not res!569247) (not e!466976))))

(assert (=> b!836888 (= res!569247 (is-Cons!16011 l!404))))

(declare-fun b!836889 () Bool)

(declare-fun ListPrimitiveSize!82 (List!16015) Int)

(assert (=> b!836889 (= e!466976 (>= (ListPrimitiveSize!82 (t!22386 l!404)) (ListPrimitiveSize!82 l!404)))))

(assert (= (and start!72184 res!569246) b!836888))

(assert (= (and b!836888 res!569247) b!836889))

(declare-fun m!781979 () Bool)

(assert (=> start!72184 m!781979))

(declare-fun m!781981 () Bool)

(assert (=> b!836889 m!781981))

(declare-fun m!781983 () Bool)

(assert (=> b!836889 m!781983))

(push 1)

(assert (not b!836889))

(assert (not start!72184))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!107775 () Bool)

(declare-fun lt!380506 () Int)

(assert (=> d!107775 (>= lt!380506 0)))

(declare-fun e!466989 () Int)

(assert (=> d!107775 (= lt!380506 e!466989)))

(declare-fun c!91139 () Bool)

(assert (=> d!107775 (= c!91139 (is-Nil!16012 (t!22386 l!404)))))

(assert (=> d!107775 (= (ListPrimitiveSize!82 (t!22386 l!404)) lt!380506)))

(declare-fun b!836914 () Bool)

(assert (=> b!836914 (= e!466989 0)))

(declare-fun b!836915 () Bool)

(assert (=> b!836915 (= e!466989 (+ 1 (ListPrimitiveSize!82 (t!22386 (t!22386 l!404)))))))

(assert (= (and d!107775 c!91139) b!836914))

(assert (= (and d!107775 (not c!91139)) b!836915))

(declare-fun m!781999 () Bool)

(assert (=> b!836915 m!781999))

(assert (=> b!836889 d!107775))

(declare-fun d!107781 () Bool)

(declare-fun lt!380507 () Int)

(assert (=> d!107781 (>= lt!380507 0)))

(declare-fun e!466990 () Int)

(assert (=> d!107781 (= lt!380507 e!466990)))

(declare-fun c!91140 () Bool)

(assert (=> d!107781 (= c!91140 (is-Nil!16012 l!404))))

(assert (=> d!107781 (= (ListPrimitiveSize!82 l!404) lt!380507)))

(declare-fun b!836916 () Bool)

(assert (=> b!836916 (= e!466990 0)))

(declare-fun b!836917 () Bool)

(assert (=> b!836917 (= e!466990 (+ 1 (ListPrimitiveSize!82 (t!22386 l!404))))))

(assert (= (and d!107781 c!91140) b!836916))

(assert (= (and d!107781 (not c!91140)) b!836917))

(assert (=> b!836917 m!781981))

(assert (=> b!836889 d!107781))

(declare-fun d!107783 () Bool)

(declare-fun size!22912 (List!16015) Int)

(assert (=> d!107783 (= (length!35 l!404) (size!22912 l!404))))

(declare-fun bs!23541 () Bool)

(assert (= bs!23541 d!107783))

(declare-fun m!782003 () Bool)

(assert (=> bs!23541 m!782003))

(assert (=> start!72184 d!107783))

(push 1)

