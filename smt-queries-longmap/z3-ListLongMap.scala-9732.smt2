; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!115492 () Bool)

(assert start!115492)

(declare-datatypes ((List!31885 0))(
  ( (Nil!31882) (Cons!31881 (h!33099 (_ BitVec 64)) (t!46571 List!31885)) )
))
(declare-fun l!3677 () List!31885)

(declare-fun ListPrimitiveSize!169 (List!31885) Int)

(assert (=> start!115492 (< (ListPrimitiveSize!169 l!3677) 0)))

(assert (=> start!115492 true))

(declare-fun bs!39157 () Bool)

(assert (= bs!39157 start!115492))

(declare-fun m!1250917 () Bool)

(assert (=> bs!39157 m!1250917))

(check-sat (not start!115492))
(check-sat)
(get-model)

(declare-fun d!146911 () Bool)

(declare-fun lt!601565 () Int)

(assert (=> d!146911 (>= lt!601565 0)))

(declare-fun e!774702 () Int)

(assert (=> d!146911 (= lt!601565 e!774702)))

(declare-fun c!128037 () Bool)

(get-info :version)

(assert (=> d!146911 (= c!128037 ((_ is Nil!31882) l!3677))))

(assert (=> d!146911 (= (ListPrimitiveSize!169 l!3677) lt!601565)))

(declare-fun b!1365852 () Bool)

(assert (=> b!1365852 (= e!774702 0)))

(declare-fun b!1365854 () Bool)

(assert (=> b!1365854 (= e!774702 (+ 1 (ListPrimitiveSize!169 (t!46571 l!3677))))))

(assert (= (and d!146911 c!128037) b!1365852))

(assert (= (and d!146911 (not c!128037)) b!1365854))

(declare-fun m!1250923 () Bool)

(assert (=> b!1365854 m!1250923))

(assert (=> start!115492 d!146911))

(check-sat (not b!1365854))
(check-sat)
