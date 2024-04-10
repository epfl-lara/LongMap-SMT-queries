; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72186 () Bool)

(assert start!72186)

(declare-fun res!569252 () Bool)

(declare-fun e!466979 () Bool)

(assert (=> start!72186 (=> (not res!569252) (not e!466979))))

(declare-datatypes ((List!16016 0))(
  ( (Nil!16013) (Cons!16012 (h!17143 (_ BitVec 64)) (t!22387 List!16016)) )
))
(declare-fun l!404 () List!16016)

(declare-fun length!36 (List!16016) Int)

(assert (=> start!72186 (= res!569252 (< (length!36 l!404) 2147483647))))

(assert (=> start!72186 e!466979))

(assert (=> start!72186 true))

(declare-fun b!836894 () Bool)

(declare-fun res!569253 () Bool)

(assert (=> b!836894 (=> (not res!569253) (not e!466979))))

(get-info :version)

(assert (=> b!836894 (= res!569253 ((_ is Cons!16012) l!404))))

(declare-fun b!836895 () Bool)

(declare-fun ListPrimitiveSize!83 (List!16016) Int)

(assert (=> b!836895 (= e!466979 (>= (ListPrimitiveSize!83 (t!22387 l!404)) (ListPrimitiveSize!83 l!404)))))

(assert (= (and start!72186 res!569252) b!836894))

(assert (= (and b!836894 res!569253) b!836895))

(declare-fun m!781985 () Bool)

(assert (=> start!72186 m!781985))

(declare-fun m!781987 () Bool)

(assert (=> b!836895 m!781987))

(declare-fun m!781989 () Bool)

(assert (=> b!836895 m!781989))

(check-sat (not b!836895) (not start!72186))
(check-sat)
(get-model)

(declare-fun d!107773 () Bool)

(declare-fun lt!380504 () Int)

(assert (=> d!107773 (>= lt!380504 0)))

(declare-fun e!466987 () Int)

(assert (=> d!107773 (= lt!380504 e!466987)))

(declare-fun c!91137 () Bool)

(assert (=> d!107773 (= c!91137 ((_ is Nil!16013) (t!22387 l!404)))))

(assert (=> d!107773 (= (ListPrimitiveSize!83 (t!22387 l!404)) lt!380504)))

(declare-fun b!836910 () Bool)

(assert (=> b!836910 (= e!466987 0)))

(declare-fun b!836911 () Bool)

(assert (=> b!836911 (= e!466987 (+ 1 (ListPrimitiveSize!83 (t!22387 (t!22387 l!404)))))))

(assert (= (and d!107773 c!91137) b!836910))

(assert (= (and d!107773 (not c!91137)) b!836911))

(declare-fun m!781997 () Bool)

(assert (=> b!836911 m!781997))

(assert (=> b!836895 d!107773))

(declare-fun d!107777 () Bool)

(declare-fun lt!380505 () Int)

(assert (=> d!107777 (>= lt!380505 0)))

(declare-fun e!466988 () Int)

(assert (=> d!107777 (= lt!380505 e!466988)))

(declare-fun c!91138 () Bool)

(assert (=> d!107777 (= c!91138 ((_ is Nil!16013) l!404))))

(assert (=> d!107777 (= (ListPrimitiveSize!83 l!404) lt!380505)))

(declare-fun b!836912 () Bool)

(assert (=> b!836912 (= e!466988 0)))

(declare-fun b!836913 () Bool)

(assert (=> b!836913 (= e!466988 (+ 1 (ListPrimitiveSize!83 (t!22387 l!404))))))

(assert (= (and d!107777 c!91138) b!836912))

(assert (= (and d!107777 (not c!91138)) b!836913))

(assert (=> b!836913 m!781987))

(assert (=> b!836895 d!107777))

(declare-fun d!107779 () Bool)

(declare-fun size!22911 (List!16016) Int)

(assert (=> d!107779 (= (length!36 l!404) (size!22911 l!404))))

(declare-fun bs!23540 () Bool)

(assert (= bs!23540 d!107779))

(declare-fun m!782001 () Bool)

(assert (=> bs!23540 m!782001))

(assert (=> start!72186 d!107779))

(check-sat (not b!836913) (not d!107779) (not b!836911))
(check-sat)
