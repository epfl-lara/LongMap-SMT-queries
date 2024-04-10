; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72168 () Bool)

(assert start!72168)

(declare-fun res!569238 () Bool)

(declare-fun e!466961 () Bool)

(assert (=> start!72168 (=> (not res!569238) (not e!466961))))

(declare-datatypes ((List!16013 0))(
  ( (Nil!16010) (Cons!16009 (h!17140 (_ BitVec 64)) (t!22384 List!16013)) )
))
(declare-fun l!404 () List!16013)

(declare-fun length!33 (List!16013) Int)

(assert (=> start!72168 (= res!569238 (< (length!33 l!404) 2147483647))))

(assert (=> start!72168 e!466961))

(assert (=> start!72168 true))

(declare-fun b!836862 () Bool)

(declare-fun ListPrimitiveSize!80 (List!16013) Int)

(assert (=> b!836862 (= e!466961 (< (ListPrimitiveSize!80 l!404) 0))))

(assert (= (and start!72168 res!569238) b!836862))

(declare-fun m!781959 () Bool)

(assert (=> start!72168 m!781959))

(declare-fun m!781961 () Bool)

(assert (=> b!836862 m!781961))

(check-sat (not b!836862) (not start!72168))
(check-sat)
(get-model)

(declare-fun d!107765 () Bool)

(declare-fun lt!380499 () Int)

(assert (=> d!107765 (>= lt!380499 0)))

(declare-fun e!466973 () Int)

(assert (=> d!107765 (= lt!380499 e!466973)))

(declare-fun c!91132 () Bool)

(get-info :version)

(assert (=> d!107765 (= c!91132 ((_ is Nil!16010) l!404))))

(assert (=> d!107765 (= (ListPrimitiveSize!80 l!404) lt!380499)))

(declare-fun b!836882 () Bool)

(assert (=> b!836882 (= e!466973 0)))

(declare-fun b!836883 () Bool)

(assert (=> b!836883 (= e!466973 (+ 1 (ListPrimitiveSize!80 (t!22384 l!404))))))

(assert (= (and d!107765 c!91132) b!836882))

(assert (= (and d!107765 (not c!91132)) b!836883))

(declare-fun m!781975 () Bool)

