; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72150 () Bool)

(assert start!72150)

(declare-fun res!569225 () Bool)

(declare-fun e!466940 () Bool)

(assert (=> start!72150 (=> (not res!569225) (not e!466940))))

(declare-datatypes ((List!16010 0))(
  ( (Nil!16007) (Cons!16006 (h!17137 (_ BitVec 64)) (t!22381 List!16010)) )
))
(declare-fun l!404 () List!16010)

(declare-fun length!30 (List!16010) Int)

(assert (=> start!72150 (= res!569225 (< (length!30 l!404) 2147483647))))

(assert (=> start!72150 e!466940))

(assert (=> start!72150 true))

(declare-fun b!836825 () Bool)

(declare-fun res!569226 () Bool)

(assert (=> b!836825 (=> (not res!569226) (not e!466940))))

(get-info :version)

(assert (=> b!836825 (= res!569226 ((_ is Cons!16006) l!404))))

(declare-fun b!836826 () Bool)

(assert (=> b!836826 (= e!466940 (>= (length!30 (t!22381 l!404)) 2147483647))))

(assert (= (and start!72150 res!569225) b!836825))

(assert (= (and b!836825 res!569226) b!836826))

(declare-fun m!781929 () Bool)

(assert (=> start!72150 m!781929))

(declare-fun m!781931 () Bool)

(assert (=> b!836826 m!781931))

(check-sat (not b!836826) (not start!72150))
(check-sat)
(get-model)

(declare-fun d!107737 () Bool)

(declare-fun size!22907 (List!16010) Int)

(assert (=> d!107737 (= (length!30 (t!22381 l!404)) (size!22907 (t!22381 l!404)))))

(declare-fun bs!23527 () Bool)

(assert (= bs!23527 d!107737))

(declare-fun m!781941 () Bool)

(assert (=> bs!23527 m!781941))

(assert (=> b!836826 d!107737))

(declare-fun d!107741 () Bool)

(assert (=> d!107741 (= (length!30 l!404) (size!22907 l!404))))

(declare-fun bs!23528 () Bool)

(assert (= bs!23528 d!107741))

(declare-fun m!781943 () Bool)

(assert (=> bs!23528 m!781943))

(assert (=> start!72150 d!107741))

(check-sat (not d!107737) (not d!107741))
(check-sat)
(get-model)

(declare-fun d!107747 () Bool)

(declare-fun lt!380483 () Int)

(assert (=> d!107747 (>= lt!380483 0)))

(declare-fun e!466948 () Int)

(assert (=> d!107747 (= lt!380483 e!466948)))

(declare-fun c!91116 () Bool)

(assert (=> d!107747 (= c!91116 ((_ is Nil!16007) (t!22381 l!404)))))

(assert (=> d!107747 (= (size!22907 (t!22381 l!404)) lt!380483)))

(declare-fun b!836841 () Bool)

(assert (=> b!836841 (= e!466948 0)))

(declare-fun b!836842 () Bool)

(assert (=> b!836842 (= e!466948 (+ 1 (size!22907 (t!22381 (t!22381 l!404)))))))

(assert (= (and d!107747 c!91116) b!836841))

(assert (= (and d!107747 (not c!91116)) b!836842))

(declare-fun m!781949 () Bool)

(assert (=> b!836842 m!781949))

(assert (=> d!107737 d!107747))

(declare-fun d!107751 () Bool)

(declare-fun lt!380485 () Int)

(assert (=> d!107751 (>= lt!380485 0)))

(declare-fun e!466950 () Int)

(assert (=> d!107751 (= lt!380485 e!466950)))

(declare-fun c!91118 () Bool)

(assert (=> d!107751 (= c!91118 ((_ is Nil!16007) l!404))))

(assert (=> d!107751 (= (size!22907 l!404) lt!380485)))

(declare-fun b!836845 () Bool)

(assert (=> b!836845 (= e!466950 0)))

(declare-fun b!836846 () Bool)

(assert (=> b!836846 (= e!466950 (+ 1 (size!22907 (t!22381 l!404))))))

(assert (= (and d!107751 c!91118) b!836845))

(assert (= (and d!107751 (not c!91118)) b!836846))

(assert (=> b!836846 m!781941))

(assert (=> d!107741 d!107751))

(check-sat (not b!836846) (not b!836842))
(check-sat)
