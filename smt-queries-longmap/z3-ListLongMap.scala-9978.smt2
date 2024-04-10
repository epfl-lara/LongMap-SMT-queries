; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117822 () Bool)

(assert start!117822)

(declare-fun res!922915 () Bool)

(declare-fun e!782972 () Bool)

(assert (=> start!117822 (=> (not res!922915) (not e!782972))))

(declare-fun mask!3034 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!117822 (= res!922915 (validMask!0 mask!3034))))

(assert (=> start!117822 e!782972))

(assert (=> start!117822 true))

(declare-datatypes ((array!94261 0))(
  ( (array!94262 (arr!45516 (Array (_ BitVec 32) (_ BitVec 64))) (size!46066 (_ BitVec 32))) )
))
(declare-fun a!2971 () array!94261)

(declare-fun array_inv!34544 (array!94261) Bool)

(assert (=> start!117822 (array_inv!34544 a!2971)))

(declare-fun b!1381287 () Bool)

(declare-fun res!922916 () Bool)

(assert (=> b!1381287 (=> (not res!922916) (not e!782972))))

(declare-fun i!1094 () (_ BitVec 32))

(assert (=> b!1381287 (= res!922916 (and (= (size!46066 a!2971) (bvadd #b00000000000000000000000000000001 mask!3034)) (bvsge i!1094 #b00000000000000000000000000000000) (bvslt i!1094 (size!46066 a!2971))))))

(declare-fun b!1381289 () Bool)

(declare-fun res!922918 () Bool)

(assert (=> b!1381289 (=> (not res!922918) (not e!782972))))

(assert (=> b!1381289 (= res!922918 (and (bvsle #b00000000000000000000000000000000 (size!46066 a!2971)) (bvslt (size!46066 a!2971) #b01111111111111111111111111111111)))))

(declare-fun b!1381288 () Bool)

(declare-fun res!922917 () Bool)

(assert (=> b!1381288 (=> (not res!922917) (not e!782972))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1381288 (= res!922917 (validKeyInArray!0 (select (arr!45516 a!2971) i!1094)))))

(declare-fun b!1381290 () Bool)

(declare-datatypes ((List!32050 0))(
  ( (Nil!32047) (Cons!32046 (h!33255 (_ BitVec 64)) (t!46744 List!32050)) )
))
(declare-fun noDuplicate!2589 (List!32050) Bool)

(assert (=> b!1381290 (= e!782972 (not (noDuplicate!2589 Nil!32047)))))

(assert (= (and start!117822 res!922915) b!1381287))

(assert (= (and b!1381287 res!922916) b!1381288))

(assert (= (and b!1381288 res!922917) b!1381289))

(assert (= (and b!1381289 res!922918) b!1381290))

(declare-fun m!1266487 () Bool)

(assert (=> start!117822 m!1266487))

(declare-fun m!1266489 () Bool)

(assert (=> start!117822 m!1266489))

(declare-fun m!1266491 () Bool)

(assert (=> b!1381288 m!1266491))

(assert (=> b!1381288 m!1266491))

(declare-fun m!1266493 () Bool)

(assert (=> b!1381288 m!1266493))

(declare-fun m!1266495 () Bool)

(assert (=> b!1381290 m!1266495))

(check-sat (not b!1381290) (not start!117822) (not b!1381288))
(check-sat)
(get-model)

(declare-fun d!149045 () Bool)

(declare-fun res!922935 () Bool)

(declare-fun e!782983 () Bool)

(assert (=> d!149045 (=> res!922935 e!782983)))

(get-info :version)

(assert (=> d!149045 (= res!922935 ((_ is Nil!32047) Nil!32047))))

(assert (=> d!149045 (= (noDuplicate!2589 Nil!32047) e!782983)))

(declare-fun b!1381307 () Bool)

(declare-fun e!782984 () Bool)

(assert (=> b!1381307 (= e!782983 e!782984)))

(declare-fun res!922936 () Bool)

(assert (=> b!1381307 (=> (not res!922936) (not e!782984))))

(declare-fun contains!9731 (List!32050 (_ BitVec 64)) Bool)

(assert (=> b!1381307 (= res!922936 (not (contains!9731 (t!46744 Nil!32047) (h!33255 Nil!32047))))))

(declare-fun b!1381308 () Bool)

(assert (=> b!1381308 (= e!782984 (noDuplicate!2589 (t!46744 Nil!32047)))))

(assert (= (and d!149045 (not res!922935)) b!1381307))

(assert (= (and b!1381307 res!922936) b!1381308))

(declare-fun m!1266507 () Bool)

(assert (=> b!1381307 m!1266507))

(declare-fun m!1266509 () Bool)

(assert (=> b!1381308 m!1266509))

(assert (=> b!1381290 d!149045))

(declare-fun d!149047 () Bool)

(assert (=> d!149047 (= (validMask!0 mask!3034) (and (or (= mask!3034 #b00000000000000000000000000000111) (= mask!3034 #b00000000000000000000000000001111) (= mask!3034 #b00000000000000000000000000011111) (= mask!3034 #b00000000000000000000000000111111) (= mask!3034 #b00000000000000000000000001111111) (= mask!3034 #b00000000000000000000000011111111) (= mask!3034 #b00000000000000000000000111111111) (= mask!3034 #b00000000000000000000001111111111) (= mask!3034 #b00000000000000000000011111111111) (= mask!3034 #b00000000000000000000111111111111) (= mask!3034 #b00000000000000000001111111111111) (= mask!3034 #b00000000000000000011111111111111) (= mask!3034 #b00000000000000000111111111111111) (= mask!3034 #b00000000000000001111111111111111) (= mask!3034 #b00000000000000011111111111111111) (= mask!3034 #b00000000000000111111111111111111) (= mask!3034 #b00000000000001111111111111111111) (= mask!3034 #b00000000000011111111111111111111) (= mask!3034 #b00000000000111111111111111111111) (= mask!3034 #b00000000001111111111111111111111) (= mask!3034 #b00000000011111111111111111111111) (= mask!3034 #b00000000111111111111111111111111) (= mask!3034 #b00000001111111111111111111111111) (= mask!3034 #b00000011111111111111111111111111) (= mask!3034 #b00000111111111111111111111111111) (= mask!3034 #b00001111111111111111111111111111) (= mask!3034 #b00011111111111111111111111111111) (= mask!3034 #b00111111111111111111111111111111)) (bvsle mask!3034 #b00111111111111111111111111111111)))))

(assert (=> start!117822 d!149047))

(declare-fun d!149059 () Bool)

(assert (=> d!149059 (= (array_inv!34544 a!2971) (bvsge (size!46066 a!2971) #b00000000000000000000000000000000))))

(assert (=> start!117822 d!149059))

(declare-fun d!149061 () Bool)

(assert (=> d!149061 (= (validKeyInArray!0 (select (arr!45516 a!2971) i!1094)) (and (not (= (select (arr!45516 a!2971) i!1094) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45516 a!2971) i!1094) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1381288 d!149061))

(check-sat (not b!1381308) (not b!1381307))
(check-sat)
