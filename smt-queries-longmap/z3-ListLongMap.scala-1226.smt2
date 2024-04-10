; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25892 () Bool)

(assert start!25892)

(declare-fun b!267620 () Bool)

(declare-fun res!131918 () Bool)

(declare-fun e!172997 () Bool)

(assert (=> b!267620 (=> (not res!131918) (not e!172997))))

(declare-datatypes ((array!13010 0))(
  ( (array!13011 (arr!6156 (Array (_ BitVec 32) (_ BitVec 64))) (size!6508 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13010)

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!267620 (= res!131918 (and (= (size!6508 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6508 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6508 a!3325))))))

(declare-fun res!131916 () Bool)

(assert (=> start!25892 (=> (not res!131916) (not e!172997))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25892 (= res!131916 (validMask!0 mask!3868))))

(assert (=> start!25892 e!172997))

(declare-fun array_inv!4119 (array!13010) Bool)

(assert (=> start!25892 (array_inv!4119 a!3325)))

(assert (=> start!25892 true))

(declare-fun b!267621 () Bool)

(declare-fun res!131917 () Bool)

(assert (=> b!267621 (=> (not res!131917) (not e!172997))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!267621 (= res!131917 (validKeyInArray!0 k0!2581))))

(declare-fun b!267623 () Bool)

(assert (=> b!267623 (= e!172997 (and (bvslt #b00000000000000000000000000000000 (size!6508 a!3325)) (bvsge (size!6508 a!3325) #b01111111111111111111111111111111)))))

(declare-fun b!267622 () Bool)

(declare-fun res!131919 () Bool)

(assert (=> b!267622 (=> (not res!131919) (not e!172997))))

(declare-datatypes ((List!3964 0))(
  ( (Nil!3961) (Cons!3960 (h!4627 (_ BitVec 64)) (t!9046 List!3964)) )
))
(declare-fun arrayNoDuplicates!0 (array!13010 (_ BitVec 32) List!3964) Bool)

(assert (=> b!267622 (= res!131919 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!3961))))

(assert (= (and start!25892 res!131916) b!267620))

(assert (= (and b!267620 res!131918) b!267621))

(assert (= (and b!267621 res!131917) b!267622))

(assert (= (and b!267622 res!131919) b!267623))

(declare-fun m!283949 () Bool)

(assert (=> start!25892 m!283949))

(declare-fun m!283951 () Bool)

(assert (=> start!25892 m!283951))

(declare-fun m!283953 () Bool)

(assert (=> b!267621 m!283953))

(declare-fun m!283955 () Bool)

(assert (=> b!267622 m!283955))

(check-sat (not b!267621) (not b!267622) (not start!25892))
(check-sat)
(get-model)

(declare-fun d!64389 () Bool)

(assert (=> d!64389 (= (validKeyInArray!0 k0!2581) (and (not (= k0!2581 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2581 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!267621 d!64389))

(declare-fun b!267646 () Bool)

(declare-fun e!173013 () Bool)

(declare-fun call!25342 () Bool)

(assert (=> b!267646 (= e!173013 call!25342)))

(declare-fun b!267648 () Bool)

(declare-fun e!173014 () Bool)

(assert (=> b!267648 (= e!173014 e!173013)))

(declare-fun c!45405 () Bool)

(assert (=> b!267648 (= c!45405 (validKeyInArray!0 (select (arr!6156 a!3325) #b00000000000000000000000000000000)))))

(declare-fun b!267649 () Bool)

(declare-fun e!173012 () Bool)

(declare-fun contains!1926 (List!3964 (_ BitVec 64)) Bool)

(assert (=> b!267649 (= e!173012 (contains!1926 Nil!3961 (select (arr!6156 a!3325) #b00000000000000000000000000000000)))))

(declare-fun b!267650 () Bool)

(assert (=> b!267650 (= e!173013 call!25342)))

(declare-fun bm!25339 () Bool)

(assert (=> bm!25339 (= call!25342 (arrayNoDuplicates!0 a!3325 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!45405 (Cons!3960 (select (arr!6156 a!3325) #b00000000000000000000000000000000) Nil!3961) Nil!3961)))))

(declare-fun b!267647 () Bool)

(declare-fun e!173015 () Bool)

(assert (=> b!267647 (= e!173015 e!173014)))

(declare-fun res!131940 () Bool)

(assert (=> b!267647 (=> (not res!131940) (not e!173014))))

(assert (=> b!267647 (= res!131940 (not e!173012))))

(declare-fun res!131938 () Bool)

(assert (=> b!267647 (=> (not res!131938) (not e!173012))))

(assert (=> b!267647 (= res!131938 (validKeyInArray!0 (select (arr!6156 a!3325) #b00000000000000000000000000000000)))))

(declare-fun d!64391 () Bool)

(declare-fun res!131939 () Bool)

(assert (=> d!64391 (=> res!131939 e!173015)))

(assert (=> d!64391 (= res!131939 (bvsge #b00000000000000000000000000000000 (size!6508 a!3325)))))

(assert (=> d!64391 (= (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!3961) e!173015)))

(assert (= (and d!64391 (not res!131939)) b!267647))

(assert (= (and b!267647 res!131938) b!267649))

(assert (= (and b!267647 res!131940) b!267648))

(assert (= (and b!267648 c!45405) b!267650))

(assert (= (and b!267648 (not c!45405)) b!267646))

(assert (= (or b!267650 b!267646) bm!25339))

(declare-fun m!283965 () Bool)

(assert (=> b!267648 m!283965))

(assert (=> b!267648 m!283965))

(declare-fun m!283967 () Bool)

(assert (=> b!267648 m!283967))

(assert (=> b!267649 m!283965))

(assert (=> b!267649 m!283965))

(declare-fun m!283969 () Bool)

(assert (=> b!267649 m!283969))

(assert (=> bm!25339 m!283965))

(declare-fun m!283971 () Bool)

(assert (=> bm!25339 m!283971))

(assert (=> b!267647 m!283965))

(assert (=> b!267647 m!283965))

(assert (=> b!267647 m!283967))

(assert (=> b!267622 d!64391))

(declare-fun d!64397 () Bool)

(assert (=> d!64397 (= (validMask!0 mask!3868) (and (or (= mask!3868 #b00000000000000000000000000000111) (= mask!3868 #b00000000000000000000000000001111) (= mask!3868 #b00000000000000000000000000011111) (= mask!3868 #b00000000000000000000000000111111) (= mask!3868 #b00000000000000000000000001111111) (= mask!3868 #b00000000000000000000000011111111) (= mask!3868 #b00000000000000000000000111111111) (= mask!3868 #b00000000000000000000001111111111) (= mask!3868 #b00000000000000000000011111111111) (= mask!3868 #b00000000000000000000111111111111) (= mask!3868 #b00000000000000000001111111111111) (= mask!3868 #b00000000000000000011111111111111) (= mask!3868 #b00000000000000000111111111111111) (= mask!3868 #b00000000000000001111111111111111) (= mask!3868 #b00000000000000011111111111111111) (= mask!3868 #b00000000000000111111111111111111) (= mask!3868 #b00000000000001111111111111111111) (= mask!3868 #b00000000000011111111111111111111) (= mask!3868 #b00000000000111111111111111111111) (= mask!3868 #b00000000001111111111111111111111) (= mask!3868 #b00000000011111111111111111111111) (= mask!3868 #b00000000111111111111111111111111) (= mask!3868 #b00000001111111111111111111111111) (= mask!3868 #b00000011111111111111111111111111) (= mask!3868 #b00000111111111111111111111111111) (= mask!3868 #b00001111111111111111111111111111) (= mask!3868 #b00011111111111111111111111111111) (= mask!3868 #b00111111111111111111111111111111)) (bvsle mask!3868 #b00111111111111111111111111111111)))))

(assert (=> start!25892 d!64397))

(declare-fun d!64403 () Bool)

(assert (=> d!64403 (= (array_inv!4119 a!3325) (bvsge (size!6508 a!3325) #b00000000000000000000000000000000))))

(assert (=> start!25892 d!64403))

(check-sat (not bm!25339) (not b!267649) (not b!267648) (not b!267647))
(check-sat)
