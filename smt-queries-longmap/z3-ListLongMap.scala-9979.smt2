; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117852 () Bool)

(assert start!117852)

(declare-fun b!1381351 () Bool)

(declare-fun e!783013 () Bool)

(declare-datatypes ((List!32053 0))(
  ( (Nil!32050) (Cons!32049 (h!33258 (_ BitVec 64)) (t!46747 List!32053)) )
))
(declare-fun contains!9734 (List!32053 (_ BitVec 64)) Bool)

(assert (=> b!1381351 (= e!783013 (contains!9734 Nil!32050 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1381352 () Bool)

(declare-fun e!783014 () Bool)

(assert (=> b!1381352 (= e!783014 e!783013)))

(declare-fun res!922983 () Bool)

(assert (=> b!1381352 (=> res!922983 e!783013)))

(assert (=> b!1381352 (= res!922983 (contains!9734 Nil!32050 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1381353 () Bool)

(declare-fun res!922979 () Bool)

(assert (=> b!1381353 (=> (not res!922979) (not e!783014))))

(declare-fun mask!3034 () (_ BitVec 32))

(declare-datatypes ((array!94270 0))(
  ( (array!94271 (arr!45519 (Array (_ BitVec 32) (_ BitVec 64))) (size!46069 (_ BitVec 32))) )
))
(declare-fun a!2971 () array!94270)

(declare-fun i!1094 () (_ BitVec 32))

(assert (=> b!1381353 (= res!922979 (and (= (size!46069 a!2971) (bvadd #b00000000000000000000000000000001 mask!3034)) (bvsge i!1094 #b00000000000000000000000000000000) (bvslt i!1094 (size!46069 a!2971))))))

(declare-fun b!1381354 () Bool)

(declare-fun res!922984 () Bool)

(assert (=> b!1381354 (=> (not res!922984) (not e!783014))))

(assert (=> b!1381354 (= res!922984 (and (bvsle #b00000000000000000000000000000000 (size!46069 a!2971)) (bvslt (size!46069 a!2971) #b01111111111111111111111111111111)))))

(declare-fun res!922982 () Bool)

(assert (=> start!117852 (=> (not res!922982) (not e!783014))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!117852 (= res!922982 (validMask!0 mask!3034))))

(assert (=> start!117852 e!783014))

(assert (=> start!117852 true))

(declare-fun array_inv!34547 (array!94270) Bool)

(assert (=> start!117852 (array_inv!34547 a!2971)))

(declare-fun b!1381355 () Bool)

(declare-fun res!922981 () Bool)

(assert (=> b!1381355 (=> (not res!922981) (not e!783014))))

(declare-fun noDuplicate!2592 (List!32053) Bool)

(assert (=> b!1381355 (= res!922981 (noDuplicate!2592 Nil!32050))))

(declare-fun b!1381356 () Bool)

(declare-fun res!922980 () Bool)

(assert (=> b!1381356 (=> (not res!922980) (not e!783014))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1381356 (= res!922980 (validKeyInArray!0 (select (arr!45519 a!2971) i!1094)))))

(assert (= (and start!117852 res!922982) b!1381353))

(assert (= (and b!1381353 res!922979) b!1381356))

(assert (= (and b!1381356 res!922980) b!1381354))

(assert (= (and b!1381354 res!922984) b!1381355))

(assert (= (and b!1381355 res!922981) b!1381352))

(assert (= (and b!1381352 (not res!922983)) b!1381351))

(declare-fun m!1266533 () Bool)

(assert (=> b!1381356 m!1266533))

(assert (=> b!1381356 m!1266533))

(declare-fun m!1266535 () Bool)

(assert (=> b!1381356 m!1266535))

(declare-fun m!1266537 () Bool)

(assert (=> start!117852 m!1266537))

(declare-fun m!1266539 () Bool)

(assert (=> start!117852 m!1266539))

(declare-fun m!1266541 () Bool)

(assert (=> b!1381351 m!1266541))

(declare-fun m!1266543 () Bool)

(assert (=> b!1381355 m!1266543))

(declare-fun m!1266545 () Bool)

(assert (=> b!1381352 m!1266545))

(check-sat (not b!1381356) (not b!1381351) (not b!1381352) (not b!1381355) (not start!117852))
(check-sat)
(get-model)

(declare-fun d!149071 () Bool)

(declare-fun lt!608187 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!756 (List!32053) (InoxSet (_ BitVec 64)))

(assert (=> d!149071 (= lt!608187 (select (content!756 Nil!32050) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!783029 () Bool)

(assert (=> d!149071 (= lt!608187 e!783029)))

(declare-fun res!923008 () Bool)

(assert (=> d!149071 (=> (not res!923008) (not e!783029))))

(get-info :version)

(assert (=> d!149071 (= res!923008 ((_ is Cons!32049) Nil!32050))))

(assert (=> d!149071 (= (contains!9734 Nil!32050 #b0000000000000000000000000000000000000000000000000000000000000000) lt!608187)))

(declare-fun b!1381379 () Bool)

(declare-fun e!783028 () Bool)

(assert (=> b!1381379 (= e!783029 e!783028)))

(declare-fun res!923007 () Bool)

(assert (=> b!1381379 (=> res!923007 e!783028)))

(assert (=> b!1381379 (= res!923007 (= (h!33258 Nil!32050) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1381380 () Bool)

(assert (=> b!1381380 (= e!783028 (contains!9734 (t!46747 Nil!32050) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!149071 res!923008) b!1381379))

(assert (= (and b!1381379 (not res!923007)) b!1381380))

(declare-fun m!1266561 () Bool)

(assert (=> d!149071 m!1266561))

(declare-fun m!1266563 () Bool)

(assert (=> d!149071 m!1266563))

(declare-fun m!1266565 () Bool)

(assert (=> b!1381380 m!1266565))

(assert (=> b!1381352 d!149071))

(declare-fun d!149073 () Bool)

(declare-fun lt!608188 () Bool)

(assert (=> d!149073 (= lt!608188 (select (content!756 Nil!32050) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!783031 () Bool)

(assert (=> d!149073 (= lt!608188 e!783031)))

(declare-fun res!923010 () Bool)

(assert (=> d!149073 (=> (not res!923010) (not e!783031))))

(assert (=> d!149073 (= res!923010 ((_ is Cons!32049) Nil!32050))))

(assert (=> d!149073 (= (contains!9734 Nil!32050 #b1000000000000000000000000000000000000000000000000000000000000000) lt!608188)))

(declare-fun b!1381381 () Bool)

(declare-fun e!783030 () Bool)

(assert (=> b!1381381 (= e!783031 e!783030)))

(declare-fun res!923009 () Bool)

(assert (=> b!1381381 (=> res!923009 e!783030)))

(assert (=> b!1381381 (= res!923009 (= (h!33258 Nil!32050) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1381382 () Bool)

(assert (=> b!1381382 (= e!783030 (contains!9734 (t!46747 Nil!32050) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!149073 res!923010) b!1381381))

(assert (= (and b!1381381 (not res!923009)) b!1381382))

(assert (=> d!149073 m!1266561))

(declare-fun m!1266567 () Bool)

(assert (=> d!149073 m!1266567))

(declare-fun m!1266569 () Bool)

(assert (=> b!1381382 m!1266569))

(assert (=> b!1381351 d!149073))

(declare-fun d!149075 () Bool)

(assert (=> d!149075 (= (validKeyInArray!0 (select (arr!45519 a!2971) i!1094)) (and (not (= (select (arr!45519 a!2971) i!1094) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45519 a!2971) i!1094) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1381356 d!149075))

(declare-fun d!149077 () Bool)

(declare-fun res!923015 () Bool)

(declare-fun e!783036 () Bool)

(assert (=> d!149077 (=> res!923015 e!783036)))

(assert (=> d!149077 (= res!923015 ((_ is Nil!32050) Nil!32050))))

(assert (=> d!149077 (= (noDuplicate!2592 Nil!32050) e!783036)))

(declare-fun b!1381387 () Bool)

(declare-fun e!783037 () Bool)

(assert (=> b!1381387 (= e!783036 e!783037)))

(declare-fun res!923016 () Bool)

(assert (=> b!1381387 (=> (not res!923016) (not e!783037))))

(assert (=> b!1381387 (= res!923016 (not (contains!9734 (t!46747 Nil!32050) (h!33258 Nil!32050))))))

(declare-fun b!1381388 () Bool)

(assert (=> b!1381388 (= e!783037 (noDuplicate!2592 (t!46747 Nil!32050)))))

(assert (= (and d!149077 (not res!923015)) b!1381387))

(assert (= (and b!1381387 res!923016) b!1381388))

(declare-fun m!1266571 () Bool)

(assert (=> b!1381387 m!1266571))

(declare-fun m!1266573 () Bool)

(assert (=> b!1381388 m!1266573))

(assert (=> b!1381355 d!149077))

(declare-fun d!149083 () Bool)

(assert (=> d!149083 (= (validMask!0 mask!3034) (and (or (= mask!3034 #b00000000000000000000000000000111) (= mask!3034 #b00000000000000000000000000001111) (= mask!3034 #b00000000000000000000000000011111) (= mask!3034 #b00000000000000000000000000111111) (= mask!3034 #b00000000000000000000000001111111) (= mask!3034 #b00000000000000000000000011111111) (= mask!3034 #b00000000000000000000000111111111) (= mask!3034 #b00000000000000000000001111111111) (= mask!3034 #b00000000000000000000011111111111) (= mask!3034 #b00000000000000000000111111111111) (= mask!3034 #b00000000000000000001111111111111) (= mask!3034 #b00000000000000000011111111111111) (= mask!3034 #b00000000000000000111111111111111) (= mask!3034 #b00000000000000001111111111111111) (= mask!3034 #b00000000000000011111111111111111) (= mask!3034 #b00000000000000111111111111111111) (= mask!3034 #b00000000000001111111111111111111) (= mask!3034 #b00000000000011111111111111111111) (= mask!3034 #b00000000000111111111111111111111) (= mask!3034 #b00000000001111111111111111111111) (= mask!3034 #b00000000011111111111111111111111) (= mask!3034 #b00000000111111111111111111111111) (= mask!3034 #b00000001111111111111111111111111) (= mask!3034 #b00000011111111111111111111111111) (= mask!3034 #b00000111111111111111111111111111) (= mask!3034 #b00001111111111111111111111111111) (= mask!3034 #b00011111111111111111111111111111) (= mask!3034 #b00111111111111111111111111111111)) (bvsle mask!3034 #b00111111111111111111111111111111)))))

(assert (=> start!117852 d!149083))

(declare-fun d!149093 () Bool)

(assert (=> d!149093 (= (array_inv!34547 a!2971) (bvsge (size!46069 a!2971) #b00000000000000000000000000000000))))

(assert (=> start!117852 d!149093))

(check-sat (not b!1381380) (not b!1381382) (not d!149073) (not b!1381388) (not b!1381387) (not d!149071))
(check-sat)
