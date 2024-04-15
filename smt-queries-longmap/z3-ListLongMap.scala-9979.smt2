; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117848 () Bool)

(assert start!117848)

(declare-fun b!1381264 () Bool)

(declare-fun e!782973 () Bool)

(declare-fun e!782972 () Bool)

(assert (=> b!1381264 (= e!782973 e!782972)))

(declare-fun res!922939 () Bool)

(assert (=> b!1381264 (=> res!922939 e!782972)))

(declare-datatypes ((List!32105 0))(
  ( (Nil!32102) (Cons!32101 (h!33310 (_ BitVec 64)) (t!46791 List!32105)) )
))
(declare-fun contains!9696 (List!32105 (_ BitVec 64)) Bool)

(assert (=> b!1381264 (= res!922939 (contains!9696 Nil!32102 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1381265 () Bool)

(declare-fun res!922940 () Bool)

(assert (=> b!1381265 (=> (not res!922940) (not e!782973))))

(declare-fun noDuplicate!2613 (List!32105) Bool)

(assert (=> b!1381265 (= res!922940 (noDuplicate!2613 Nil!32102))))

(declare-fun b!1381267 () Bool)

(declare-fun res!922935 () Bool)

(assert (=> b!1381267 (=> (not res!922935) (not e!782973))))

(declare-fun mask!3034 () (_ BitVec 32))

(declare-datatypes ((array!94218 0))(
  ( (array!94219 (arr!45493 (Array (_ BitVec 32) (_ BitVec 64))) (size!46045 (_ BitVec 32))) )
))
(declare-fun a!2971 () array!94218)

(declare-fun i!1094 () (_ BitVec 32))

(assert (=> b!1381267 (= res!922935 (and (= (size!46045 a!2971) (bvadd #b00000000000000000000000000000001 mask!3034)) (bvsge i!1094 #b00000000000000000000000000000000) (bvslt i!1094 (size!46045 a!2971))))))

(declare-fun b!1381266 () Bool)

(assert (=> b!1381266 (= e!782972 (contains!9696 Nil!32102 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!922937 () Bool)

(assert (=> start!117848 (=> (not res!922937) (not e!782973))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!117848 (= res!922937 (validMask!0 mask!3034))))

(assert (=> start!117848 e!782973))

(assert (=> start!117848 true))

(declare-fun array_inv!34726 (array!94218) Bool)

(assert (=> start!117848 (array_inv!34726 a!2971)))

(declare-fun b!1381268 () Bool)

(declare-fun res!922936 () Bool)

(assert (=> b!1381268 (=> (not res!922936) (not e!782973))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1381268 (= res!922936 (validKeyInArray!0 (select (arr!45493 a!2971) i!1094)))))

(declare-fun b!1381269 () Bool)

(declare-fun res!922938 () Bool)

(assert (=> b!1381269 (=> (not res!922938) (not e!782973))))

(assert (=> b!1381269 (= res!922938 (and (bvsle #b00000000000000000000000000000000 (size!46045 a!2971)) (bvslt (size!46045 a!2971) #b01111111111111111111111111111111)))))

(assert (= (and start!117848 res!922937) b!1381267))

(assert (= (and b!1381267 res!922935) b!1381268))

(assert (= (and b!1381268 res!922936) b!1381269))

(assert (= (and b!1381269 res!922938) b!1381265))

(assert (= (and b!1381265 res!922940) b!1381264))

(assert (= (and b!1381264 (not res!922939)) b!1381266))

(declare-fun m!1266015 () Bool)

(assert (=> b!1381265 m!1266015))

(declare-fun m!1266017 () Bool)

(assert (=> b!1381266 m!1266017))

(declare-fun m!1266019 () Bool)

(assert (=> b!1381268 m!1266019))

(assert (=> b!1381268 m!1266019))

(declare-fun m!1266021 () Bool)

(assert (=> b!1381268 m!1266021))

(declare-fun m!1266023 () Bool)

(assert (=> start!117848 m!1266023))

(declare-fun m!1266025 () Bool)

(assert (=> start!117848 m!1266025))

(declare-fun m!1266027 () Bool)

(assert (=> b!1381264 m!1266027))

(check-sat (not b!1381266) (not start!117848) (not b!1381268) (not b!1381264) (not b!1381265))
(check-sat)
(get-model)

(declare-fun d!148953 () Bool)

(declare-fun lt!608003 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!752 (List!32105) (InoxSet (_ BitVec 64)))

(assert (=> d!148953 (= lt!608003 (select (content!752 Nil!32102) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!782998 () Bool)

(assert (=> d!148953 (= lt!608003 e!782998)))

(declare-fun res!922982 () Bool)

(assert (=> d!148953 (=> (not res!922982) (not e!782998))))

(get-info :version)

(assert (=> d!148953 (= res!922982 ((_ is Cons!32101) Nil!32102))))

(assert (=> d!148953 (= (contains!9696 Nil!32102 #b0000000000000000000000000000000000000000000000000000000000000000) lt!608003)))

(declare-fun b!1381310 () Bool)

(declare-fun e!782997 () Bool)

(assert (=> b!1381310 (= e!782998 e!782997)))

(declare-fun res!922981 () Bool)

(assert (=> b!1381310 (=> res!922981 e!782997)))

(assert (=> b!1381310 (= res!922981 (= (h!33310 Nil!32102) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1381311 () Bool)

(assert (=> b!1381311 (= e!782997 (contains!9696 (t!46791 Nil!32102) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!148953 res!922982) b!1381310))

(assert (= (and b!1381310 (not res!922981)) b!1381311))

(declare-fun m!1266057 () Bool)

(assert (=> d!148953 m!1266057))

(declare-fun m!1266059 () Bool)

(assert (=> d!148953 m!1266059))

(declare-fun m!1266061 () Bool)

(assert (=> b!1381311 m!1266061))

(assert (=> b!1381264 d!148953))

(declare-fun d!148955 () Bool)

(declare-fun res!922987 () Bool)

(declare-fun e!783003 () Bool)

(assert (=> d!148955 (=> res!922987 e!783003)))

(assert (=> d!148955 (= res!922987 ((_ is Nil!32102) Nil!32102))))

(assert (=> d!148955 (= (noDuplicate!2613 Nil!32102) e!783003)))

(declare-fun b!1381316 () Bool)

(declare-fun e!783004 () Bool)

(assert (=> b!1381316 (= e!783003 e!783004)))

(declare-fun res!922988 () Bool)

(assert (=> b!1381316 (=> (not res!922988) (not e!783004))))

(assert (=> b!1381316 (= res!922988 (not (contains!9696 (t!46791 Nil!32102) (h!33310 Nil!32102))))))

(declare-fun b!1381317 () Bool)

(assert (=> b!1381317 (= e!783004 (noDuplicate!2613 (t!46791 Nil!32102)))))

(assert (= (and d!148955 (not res!922987)) b!1381316))

(assert (= (and b!1381316 res!922988) b!1381317))

(declare-fun m!1266063 () Bool)

(assert (=> b!1381316 m!1266063))

(declare-fun m!1266065 () Bool)

(assert (=> b!1381317 m!1266065))

(assert (=> b!1381265 d!148955))

(declare-fun d!148959 () Bool)

(declare-fun lt!608004 () Bool)

(assert (=> d!148959 (= lt!608004 (select (content!752 Nil!32102) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!783006 () Bool)

(assert (=> d!148959 (= lt!608004 e!783006)))

(declare-fun res!922990 () Bool)

(assert (=> d!148959 (=> (not res!922990) (not e!783006))))

(assert (=> d!148959 (= res!922990 ((_ is Cons!32101) Nil!32102))))

(assert (=> d!148959 (= (contains!9696 Nil!32102 #b1000000000000000000000000000000000000000000000000000000000000000) lt!608004)))

(declare-fun b!1381318 () Bool)

(declare-fun e!783005 () Bool)

(assert (=> b!1381318 (= e!783006 e!783005)))

(declare-fun res!922989 () Bool)

(assert (=> b!1381318 (=> res!922989 e!783005)))

(assert (=> b!1381318 (= res!922989 (= (h!33310 Nil!32102) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1381319 () Bool)

(assert (=> b!1381319 (= e!783005 (contains!9696 (t!46791 Nil!32102) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!148959 res!922990) b!1381318))

(assert (= (and b!1381318 (not res!922989)) b!1381319))

(assert (=> d!148959 m!1266057))

(declare-fun m!1266067 () Bool)

(assert (=> d!148959 m!1266067))

(declare-fun m!1266069 () Bool)

(assert (=> b!1381319 m!1266069))

(assert (=> b!1381266 d!148959))

(declare-fun d!148961 () Bool)

(assert (=> d!148961 (= (validMask!0 mask!3034) (and (or (= mask!3034 #b00000000000000000000000000000111) (= mask!3034 #b00000000000000000000000000001111) (= mask!3034 #b00000000000000000000000000011111) (= mask!3034 #b00000000000000000000000000111111) (= mask!3034 #b00000000000000000000000001111111) (= mask!3034 #b00000000000000000000000011111111) (= mask!3034 #b00000000000000000000000111111111) (= mask!3034 #b00000000000000000000001111111111) (= mask!3034 #b00000000000000000000011111111111) (= mask!3034 #b00000000000000000000111111111111) (= mask!3034 #b00000000000000000001111111111111) (= mask!3034 #b00000000000000000011111111111111) (= mask!3034 #b00000000000000000111111111111111) (= mask!3034 #b00000000000000001111111111111111) (= mask!3034 #b00000000000000011111111111111111) (= mask!3034 #b00000000000000111111111111111111) (= mask!3034 #b00000000000001111111111111111111) (= mask!3034 #b00000000000011111111111111111111) (= mask!3034 #b00000000000111111111111111111111) (= mask!3034 #b00000000001111111111111111111111) (= mask!3034 #b00000000011111111111111111111111) (= mask!3034 #b00000000111111111111111111111111) (= mask!3034 #b00000001111111111111111111111111) (= mask!3034 #b00000011111111111111111111111111) (= mask!3034 #b00000111111111111111111111111111) (= mask!3034 #b00001111111111111111111111111111) (= mask!3034 #b00011111111111111111111111111111) (= mask!3034 #b00111111111111111111111111111111)) (bvsle mask!3034 #b00111111111111111111111111111111)))))

(assert (=> start!117848 d!148961))

(declare-fun d!148973 () Bool)

(assert (=> d!148973 (= (array_inv!34726 a!2971) (bvsge (size!46045 a!2971) #b00000000000000000000000000000000))))

(assert (=> start!117848 d!148973))

(declare-fun d!148977 () Bool)

(assert (=> d!148977 (= (validKeyInArray!0 (select (arr!45493 a!2971) i!1094)) (and (not (= (select (arr!45493 a!2971) i!1094) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45493 a!2971) i!1094) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1381268 d!148977))

(check-sat (not d!148959) (not b!1381319) (not b!1381317) (not b!1381316) (not b!1381311) (not d!148953))
(check-sat)
