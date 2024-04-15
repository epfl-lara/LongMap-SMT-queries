; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72120 () Bool)

(assert start!72120)

(declare-fun res!569098 () Bool)

(declare-fun e!466772 () Bool)

(assert (=> start!72120 (=> (not res!569098) (not e!466772))))

(declare-datatypes ((List!16005 0))(
  ( (Nil!16002) (Cons!16001 (h!17132 (_ BitVec 64)) (t!22367 List!16005)) )
))
(declare-fun l!632 () List!16005)

(get-info :version)

(assert (=> start!72120 (= res!569098 (and (not ((_ is Nil!16002) l!632)) (not ((_ is Nil!16002) (t!22367 l!632))) (bvslt (h!17132 l!632) (h!17132 (t!22367 l!632)))))))

(assert (=> start!72120 e!466772))

(assert (=> start!72120 true))

(declare-fun b!836553 () Bool)

(declare-fun ListPrimitiveSize!76 (List!16005) Int)

(assert (=> b!836553 (= e!466772 (>= (ListPrimitiveSize!76 (t!22367 l!632)) (ListPrimitiveSize!76 l!632)))))

(assert (= (and start!72120 res!569098) b!836553))

(declare-fun m!781153 () Bool)

(assert (=> b!836553 m!781153))

(declare-fun m!781155 () Bool)

(assert (=> b!836553 m!781155))

(check-sat (not b!836553))
(check-sat)
(get-model)

(declare-fun d!107525 () Bool)

(declare-fun lt!380239 () Int)

(assert (=> d!107525 (>= lt!380239 0)))

(declare-fun e!466783 () Int)

(assert (=> d!107525 (= lt!380239 e!466783)))

(declare-fun c!91043 () Bool)

(assert (=> d!107525 (= c!91043 ((_ is Nil!16002) (t!22367 l!632)))))

(assert (=> d!107525 (= (ListPrimitiveSize!76 (t!22367 l!632)) lt!380239)))

(declare-fun b!836568 () Bool)

(assert (=> b!836568 (= e!466783 0)))

(declare-fun b!836569 () Bool)

(assert (=> b!836569 (= e!466783 (+ 1 (ListPrimitiveSize!76 (t!22367 (t!22367 l!632)))))))

(assert (= (and d!107525 c!91043) b!836568))

(assert (= (and d!107525 (not c!91043)) b!836569))

(declare-fun m!781165 () Bool)

(assert (=> b!836569 m!781165))

(assert (=> b!836553 d!107525))

(declare-fun d!107529 () Bool)

(declare-fun lt!380240 () Int)

(assert (=> d!107529 (>= lt!380240 0)))

(declare-fun e!466784 () Int)

(assert (=> d!107529 (= lt!380240 e!466784)))

(declare-fun c!91044 () Bool)

(assert (=> d!107529 (= c!91044 ((_ is Nil!16002) l!632))))

(assert (=> d!107529 (= (ListPrimitiveSize!76 l!632) lt!380240)))

(declare-fun b!836570 () Bool)

(assert (=> b!836570 (= e!466784 0)))

(declare-fun b!836571 () Bool)

(assert (=> b!836571 (= e!466784 (+ 1 (ListPrimitiveSize!76 (t!22367 l!632))))))

(assert (= (and d!107529 c!91044) b!836570))

(assert (= (and d!107529 (not c!91044)) b!836571))

(assert (=> b!836571 m!781153))

(assert (=> b!836553 d!107529))

(check-sat (not b!836569) (not b!836571))
(check-sat)
