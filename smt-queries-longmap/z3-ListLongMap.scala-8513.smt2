; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!103850 () Bool)

(assert start!103850)

(declare-fun res!828911 () Bool)

(declare-fun e!704771 () Bool)

(assert (=> start!103850 (=> (not res!828911) (not e!704771))))

(declare-datatypes ((array!79883 0))(
  ( (array!79884 (arr!38537 (Array (_ BitVec 32) (_ BitVec 64))) (size!39075 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!79883)

(declare-fun newFrom!287 () (_ BitVec 32))

(declare-fun from!3270 () (_ BitVec 32))

(assert (=> start!103850 (= res!828911 (and (bvslt (size!39075 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39075 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39075 a!3892))))))

(assert (=> start!103850 e!704771))

(declare-fun array_inv!29520 (array!79883) Bool)

(assert (=> start!103850 (array_inv!29520 a!3892)))

(assert (=> start!103850 true))

(declare-fun b!1243091 () Bool)

(declare-fun res!828910 () Bool)

(assert (=> b!1243091 (=> (not res!828910) (not e!704771))))

(declare-datatypes ((List!27441 0))(
  ( (Nil!27438) (Cons!27437 (h!28646 (_ BitVec 64)) (t!40901 List!27441)) )
))
(declare-fun noDuplicate!1996 (List!27441) Bool)

(assert (=> b!1243091 (= res!828910 (noDuplicate!1996 Nil!27438))))

(declare-fun b!1243092 () Bool)

(declare-fun e!704772 () Bool)

(assert (=> b!1243092 (= e!704771 e!704772)))

(declare-fun res!828912 () Bool)

(assert (=> b!1243092 (=> res!828912 e!704772)))

(declare-fun contains!7371 (List!27441 (_ BitVec 64)) Bool)

(assert (=> b!1243092 (= res!828912 (contains!7371 Nil!27438 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1243093 () Bool)

(assert (=> b!1243093 (= e!704772 (contains!7371 Nil!27438 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!103850 res!828911) b!1243091))

(assert (= (and b!1243091 res!828910) b!1243092))

(assert (= (and b!1243092 (not res!828912)) b!1243093))

(declare-fun m!1145271 () Bool)

(assert (=> start!103850 m!1145271))

(declare-fun m!1145273 () Bool)

(assert (=> b!1243091 m!1145273))

(declare-fun m!1145275 () Bool)

(assert (=> b!1243092 m!1145275))

(declare-fun m!1145277 () Bool)

(assert (=> b!1243093 m!1145277))

(check-sat (not b!1243092) (not start!103850) (not b!1243093) (not b!1243091))
(check-sat)
(get-model)

(declare-fun d!136931 () Bool)

(declare-fun lt!562143 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!607 (List!27441) (InoxSet (_ BitVec 64)))

(assert (=> d!136931 (= lt!562143 (select (content!607 Nil!27438) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!704796 () Bool)

(assert (=> d!136931 (= lt!562143 e!704796)))

(declare-fun res!828936 () Bool)

(assert (=> d!136931 (=> (not res!828936) (not e!704796))))

(get-info :version)

(assert (=> d!136931 (= res!828936 ((_ is Cons!27437) Nil!27438))))

(assert (=> d!136931 (= (contains!7371 Nil!27438 #b0000000000000000000000000000000000000000000000000000000000000000) lt!562143)))

(declare-fun b!1243116 () Bool)

(declare-fun e!704795 () Bool)

(assert (=> b!1243116 (= e!704796 e!704795)))

(declare-fun res!828935 () Bool)

(assert (=> b!1243116 (=> res!828935 e!704795)))

(assert (=> b!1243116 (= res!828935 (= (h!28646 Nil!27438) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1243117 () Bool)

(assert (=> b!1243117 (= e!704795 (contains!7371 (t!40901 Nil!27438) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!136931 res!828936) b!1243116))

(assert (= (and b!1243116 (not res!828935)) b!1243117))

(declare-fun m!1145295 () Bool)

(assert (=> d!136931 m!1145295))

(declare-fun m!1145297 () Bool)

(assert (=> d!136931 m!1145297))

(declare-fun m!1145299 () Bool)

(assert (=> b!1243117 m!1145299))

(assert (=> b!1243092 d!136931))

(declare-fun d!136933 () Bool)

(assert (=> d!136933 (= (array_inv!29520 a!3892) (bvsge (size!39075 a!3892) #b00000000000000000000000000000000))))

(assert (=> start!103850 d!136933))

(declare-fun d!136935 () Bool)

(declare-fun lt!562144 () Bool)

(assert (=> d!136935 (= lt!562144 (select (content!607 Nil!27438) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!704798 () Bool)

(assert (=> d!136935 (= lt!562144 e!704798)))

(declare-fun res!828938 () Bool)

(assert (=> d!136935 (=> (not res!828938) (not e!704798))))

(assert (=> d!136935 (= res!828938 ((_ is Cons!27437) Nil!27438))))

(assert (=> d!136935 (= (contains!7371 Nil!27438 #b1000000000000000000000000000000000000000000000000000000000000000) lt!562144)))

(declare-fun b!1243118 () Bool)

(declare-fun e!704797 () Bool)

(assert (=> b!1243118 (= e!704798 e!704797)))

(declare-fun res!828937 () Bool)

(assert (=> b!1243118 (=> res!828937 e!704797)))

(assert (=> b!1243118 (= res!828937 (= (h!28646 Nil!27438) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1243119 () Bool)

(assert (=> b!1243119 (= e!704797 (contains!7371 (t!40901 Nil!27438) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!136935 res!828938) b!1243118))

(assert (= (and b!1243118 (not res!828937)) b!1243119))

(assert (=> d!136935 m!1145295))

(declare-fun m!1145301 () Bool)

(assert (=> d!136935 m!1145301))

(declare-fun m!1145303 () Bool)

(assert (=> b!1243119 m!1145303))

(assert (=> b!1243093 d!136935))

(declare-fun d!136937 () Bool)

(declare-fun res!828943 () Bool)

(declare-fun e!704803 () Bool)

(assert (=> d!136937 (=> res!828943 e!704803)))

(assert (=> d!136937 (= res!828943 ((_ is Nil!27438) Nil!27438))))

(assert (=> d!136937 (= (noDuplicate!1996 Nil!27438) e!704803)))

(declare-fun b!1243124 () Bool)

(declare-fun e!704804 () Bool)

(assert (=> b!1243124 (= e!704803 e!704804)))

(declare-fun res!828944 () Bool)

(assert (=> b!1243124 (=> (not res!828944) (not e!704804))))

(assert (=> b!1243124 (= res!828944 (not (contains!7371 (t!40901 Nil!27438) (h!28646 Nil!27438))))))

(declare-fun b!1243125 () Bool)

(assert (=> b!1243125 (= e!704804 (noDuplicate!1996 (t!40901 Nil!27438)))))

(assert (= (and d!136937 (not res!828943)) b!1243124))

(assert (= (and b!1243124 res!828944) b!1243125))

(declare-fun m!1145305 () Bool)

(assert (=> b!1243124 m!1145305))

(declare-fun m!1145307 () Bool)

(assert (=> b!1243125 m!1145307))

(assert (=> b!1243091 d!136937))

(check-sat (not b!1243117) (not d!136935) (not b!1243125) (not b!1243119) (not b!1243124) (not d!136931))
(check-sat)
