; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72170 () Bool)

(assert start!72170)

(declare-fun res!569241 () Bool)

(declare-fun e!466964 () Bool)

(assert (=> start!72170 (=> (not res!569241) (not e!466964))))

(declare-datatypes ((List!16014 0))(
  ( (Nil!16011) (Cons!16010 (h!17141 (_ BitVec 64)) (t!22385 List!16014)) )
))
(declare-fun l!404 () List!16014)

(declare-fun length!34 (List!16014) Int)

(assert (=> start!72170 (= res!569241 (< (length!34 l!404) 2147483647))))

(assert (=> start!72170 e!466964))

(assert (=> start!72170 true))

(declare-fun b!836865 () Bool)

(declare-fun ListPrimitiveSize!81 (List!16014) Int)

(assert (=> b!836865 (= e!466964 (< (ListPrimitiveSize!81 l!404) 0))))

(assert (= (and start!72170 res!569241) b!836865))

(declare-fun m!781963 () Bool)

(assert (=> start!72170 m!781963))

(declare-fun m!781965 () Bool)

(assert (=> b!836865 m!781965))

(push 1)

(assert (not start!72170))

(assert (not b!836865))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!107760 () Bool)

(declare-fun size!22909 (List!16014) Int)

(assert (=> d!107760 (= (length!34 l!404) (size!22909 l!404))))

(declare-fun bs!23534 () Bool)

(assert (= bs!23534 d!107760))

(declare-fun m!781967 () Bool)

(assert (=> bs!23534 m!781967))

(assert (=> start!72170 d!107760))

(declare-fun d!107763 () Bool)

(declare-fun lt!380496 () Int)

(assert (=> d!107763 (>= lt!380496 0)))

(declare-fun e!466970 () Int)

(assert (=> d!107763 (= lt!380496 e!466970)))

(declare-fun c!91129 () Bool)

(assert (=> d!107763 (= c!91129 (is-Nil!16011 l!404))))

(assert (=> d!107763 (= (ListPrimitiveSize!81 l!404) lt!380496)))

(declare-fun b!836876 () Bool)

(assert (=> b!836876 (= e!466970 0)))

(declare-fun b!836877 () Bool)

(assert (=> b!836877 (= e!466970 (+ 1 (ListPrimitiveSize!81 (t!22385 l!404))))))

(assert (= (and d!107763 c!91129) b!836876))

(assert (= (and d!107763 (not c!91129)) b!836877))

(declare-fun m!781971 () Bool)

(assert (=> b!836877 m!781971))

(assert (=> b!836865 d!107763))

(push 1)

(assert (not d!107760))

(assert (not b!836877))

(check-sat)

