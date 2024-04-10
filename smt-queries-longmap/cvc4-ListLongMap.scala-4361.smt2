; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60198 () Bool)

(assert start!60198)

(declare-fun b!673354 () Bool)

(declare-fun res!439922 () Bool)

(declare-fun e!384530 () Bool)

(assert (=> b!673354 (=> (not res!439922) (not e!384530))))

(declare-datatypes ((array!39245 0))(
  ( (array!39246 (arr!18815 (Array (_ BitVec 32) (_ BitVec 64))) (size!19179 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39245)

(declare-fun from!3004 () (_ BitVec 32))

(declare-datatypes ((List!12856 0))(
  ( (Nil!12853) (Cons!12852 (h!13897 (_ BitVec 64)) (t!19084 List!12856)) )
))
(declare-fun acc!681 () List!12856)

(declare-fun arrayNoDuplicates!0 (array!39245 (_ BitVec 32) List!12856) Bool)

(assert (=> b!673354 (= res!439922 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!673355 () Bool)

(declare-datatypes ((Unit!23672 0))(
  ( (Unit!23673) )
))
(declare-fun e!384536 () Unit!23672)

(declare-fun Unit!23674 () Unit!23672)

(assert (=> b!673355 (= e!384536 Unit!23674)))

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!39245 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!673355 (arrayContainsKey!0 a!3626 k!2843 from!3004)))

(declare-fun lt!312454 () Unit!23672)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39245 (_ BitVec 64) (_ BitVec 32)) Unit!23672)

(assert (=> b!673355 (= lt!312454 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!673355 false))

(declare-fun b!673356 () Bool)

(declare-fun e!384527 () Bool)

(declare-fun contains!3433 (List!12856 (_ BitVec 64)) Bool)

(assert (=> b!673356 (= e!384527 (contains!3433 acc!681 k!2843))))

(declare-fun b!673357 () Bool)

(declare-fun res!439915 () Bool)

(assert (=> b!673357 (=> (not res!439915) (not e!384530))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!673357 (= res!439915 (validKeyInArray!0 (select (arr!18815 a!3626) from!3004)))))

(declare-fun b!673358 () Bool)

(declare-fun res!439921 () Bool)

(declare-fun e!384534 () Bool)

(assert (=> b!673358 (=> (not res!439921) (not e!384534))))

(declare-fun lt!312452 () List!12856)

(assert (=> b!673358 (= res!439921 (not (contains!3433 lt!312452 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!673359 () Bool)

(declare-fun res!439928 () Bool)

(assert (=> b!673359 (=> (not res!439928) (not e!384530))))

(declare-fun e!384535 () Bool)

(assert (=> b!673359 (= res!439928 e!384535)))

(declare-fun res!439914 () Bool)

(assert (=> b!673359 (=> res!439914 e!384535)))

(assert (=> b!673359 (= res!439914 e!384527)))

(declare-fun res!439910 () Bool)

(assert (=> b!673359 (=> (not res!439910) (not e!384527))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!673359 (= res!439910 (bvsgt from!3004 i!1382))))

(declare-fun b!673360 () Bool)

(declare-fun e!384529 () Bool)

(assert (=> b!673360 (= e!384530 e!384529)))

(declare-fun res!439917 () Bool)

(assert (=> b!673360 (=> (not res!439917) (not e!384529))))

(assert (=> b!673360 (= res!439917 (not (= (select (arr!18815 a!3626) from!3004) k!2843)))))

(declare-fun lt!312451 () Unit!23672)

(assert (=> b!673360 (= lt!312451 e!384536)))

(declare-fun c!77090 () Bool)

(assert (=> b!673360 (= c!77090 (= (select (arr!18815 a!3626) from!3004) k!2843))))

(declare-fun res!439929 () Bool)

(assert (=> start!60198 (=> (not res!439929) (not e!384530))))

(assert (=> start!60198 (= res!439929 (and (bvslt (size!19179 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19179 a!3626))))))

(assert (=> start!60198 e!384530))

(assert (=> start!60198 true))

(declare-fun array_inv!14611 (array!39245) Bool)

(assert (=> start!60198 (array_inv!14611 a!3626)))

(declare-fun b!673361 () Bool)

(declare-fun res!439911 () Bool)

(assert (=> b!673361 (=> (not res!439911) (not e!384530))))

(declare-fun noDuplicate!680 (List!12856) Bool)

(assert (=> b!673361 (= res!439911 (noDuplicate!680 acc!681))))

(declare-fun b!673362 () Bool)

(assert (=> b!673362 (= e!384534 false)))

(declare-fun lt!312453 () Bool)

(assert (=> b!673362 (= lt!312453 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!312452))))

(declare-fun b!673363 () Bool)

(declare-fun res!439920 () Bool)

(assert (=> b!673363 (=> (not res!439920) (not e!384534))))

(assert (=> b!673363 (= res!439920 (not (contains!3433 lt!312452 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!673364 () Bool)

(declare-fun e!384528 () Bool)

(assert (=> b!673364 (= e!384528 (not (contains!3433 acc!681 k!2843)))))

(declare-fun b!673365 () Bool)

(assert (=> b!673365 (= e!384529 e!384534)))

(declare-fun res!439919 () Bool)

(assert (=> b!673365 (=> (not res!439919) (not e!384534))))

(assert (=> b!673365 (= res!439919 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!283 (List!12856 (_ BitVec 64)) List!12856)

(assert (=> b!673365 (= lt!312452 ($colon$colon!283 acc!681 (select (arr!18815 a!3626) from!3004)))))

(declare-fun b!673366 () Bool)

(declare-fun Unit!23675 () Unit!23672)

(assert (=> b!673366 (= e!384536 Unit!23675)))

(declare-fun b!673367 () Bool)

(declare-fun e!384537 () Bool)

(declare-fun e!384531 () Bool)

(assert (=> b!673367 (= e!384537 e!384531)))

(declare-fun res!439931 () Bool)

(assert (=> b!673367 (=> (not res!439931) (not e!384531))))

(assert (=> b!673367 (= res!439931 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!673368 () Bool)

(declare-fun res!439926 () Bool)

(assert (=> b!673368 (=> (not res!439926) (not e!384534))))

(assert (=> b!673368 (= res!439926 e!384537)))

(declare-fun res!439912 () Bool)

(assert (=> b!673368 (=> res!439912 e!384537)))

(declare-fun e!384533 () Bool)

(assert (=> b!673368 (= res!439912 e!384533)))

(declare-fun res!439923 () Bool)

(assert (=> b!673368 (=> (not res!439923) (not e!384533))))

(assert (=> b!673368 (= res!439923 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!673369 () Bool)

(declare-fun res!439916 () Bool)

(assert (=> b!673369 (=> (not res!439916) (not e!384530))))

(assert (=> b!673369 (= res!439916 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!673370 () Bool)

(assert (=> b!673370 (= e!384535 e!384528)))

(declare-fun res!439924 () Bool)

(assert (=> b!673370 (=> (not res!439924) (not e!384528))))

(assert (=> b!673370 (= res!439924 (bvsle from!3004 i!1382))))

(declare-fun b!673371 () Bool)

(declare-fun res!439930 () Bool)

(assert (=> b!673371 (=> (not res!439930) (not e!384530))))

(assert (=> b!673371 (= res!439930 (not (contains!3433 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!673372 () Bool)

(declare-fun res!439925 () Bool)

(assert (=> b!673372 (=> (not res!439925) (not e!384530))))

(assert (=> b!673372 (= res!439925 (not (contains!3433 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!673373 () Bool)

(declare-fun res!439913 () Bool)

(assert (=> b!673373 (=> (not res!439913) (not e!384530))))

(assert (=> b!673373 (= res!439913 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12853))))

(declare-fun b!673374 () Bool)

(assert (=> b!673374 (= e!384533 (contains!3433 lt!312452 k!2843))))

(declare-fun b!673375 () Bool)

(declare-fun res!439909 () Bool)

(assert (=> b!673375 (=> (not res!439909) (not e!384530))))

(assert (=> b!673375 (= res!439909 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19179 a!3626))))))

(declare-fun b!673376 () Bool)

(declare-fun res!439908 () Bool)

(assert (=> b!673376 (=> (not res!439908) (not e!384530))))

(assert (=> b!673376 (= res!439908 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19179 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!673377 () Bool)

(declare-fun res!439927 () Bool)

(assert (=> b!673377 (=> (not res!439927) (not e!384534))))

(assert (=> b!673377 (= res!439927 (noDuplicate!680 lt!312452))))

(declare-fun b!673378 () Bool)

(assert (=> b!673378 (= e!384531 (not (contains!3433 lt!312452 k!2843)))))

(declare-fun b!673379 () Bool)

(declare-fun res!439918 () Bool)

(assert (=> b!673379 (=> (not res!439918) (not e!384530))))

(assert (=> b!673379 (= res!439918 (validKeyInArray!0 k!2843))))

(assert (= (and start!60198 res!439929) b!673361))

(assert (= (and b!673361 res!439911) b!673372))

(assert (= (and b!673372 res!439925) b!673371))

(assert (= (and b!673371 res!439930) b!673359))

(assert (= (and b!673359 res!439910) b!673356))

(assert (= (and b!673359 (not res!439914)) b!673370))

(assert (= (and b!673370 res!439924) b!673364))

(assert (= (and b!673359 res!439928) b!673373))

(assert (= (and b!673373 res!439913) b!673354))

(assert (= (and b!673354 res!439922) b!673375))

(assert (= (and b!673375 res!439909) b!673379))

(assert (= (and b!673379 res!439918) b!673369))

(assert (= (and b!673369 res!439916) b!673376))

(assert (= (and b!673376 res!439908) b!673357))

(assert (= (and b!673357 res!439915) b!673360))

(assert (= (and b!673360 c!77090) b!673355))

(assert (= (and b!673360 (not c!77090)) b!673366))

(assert (= (and b!673360 res!439917) b!673365))

(assert (= (and b!673365 res!439919) b!673377))

(assert (= (and b!673377 res!439927) b!673358))

(assert (= (and b!673358 res!439921) b!673363))

(assert (= (and b!673363 res!439920) b!673368))

(assert (= (and b!673368 res!439923) b!673374))

(assert (= (and b!673368 (not res!439912)) b!673367))

(assert (= (and b!673367 res!439931) b!673378))

(assert (= (and b!673368 res!439926) b!673362))

(declare-fun m!641847 () Bool)

(assert (=> b!673360 m!641847))

(declare-fun m!641849 () Bool)

(assert (=> start!60198 m!641849))

(declare-fun m!641851 () Bool)

(assert (=> b!673361 m!641851))

(declare-fun m!641853 () Bool)

(assert (=> b!673354 m!641853))

(declare-fun m!641855 () Bool)

(assert (=> b!673378 m!641855))

(declare-fun m!641857 () Bool)

(assert (=> b!673371 m!641857))

(declare-fun m!641859 () Bool)

(assert (=> b!673372 m!641859))

(declare-fun m!641861 () Bool)

(assert (=> b!673373 m!641861))

(declare-fun m!641863 () Bool)

(assert (=> b!673358 m!641863))

(assert (=> b!673374 m!641855))

(declare-fun m!641865 () Bool)

(assert (=> b!673356 m!641865))

(declare-fun m!641867 () Bool)

(assert (=> b!673377 m!641867))

(declare-fun m!641869 () Bool)

(assert (=> b!673355 m!641869))

(declare-fun m!641871 () Bool)

(assert (=> b!673355 m!641871))

(declare-fun m!641873 () Bool)

(assert (=> b!673379 m!641873))

(declare-fun m!641875 () Bool)

(assert (=> b!673362 m!641875))

(assert (=> b!673357 m!641847))

(assert (=> b!673357 m!641847))

(declare-fun m!641877 () Bool)

(assert (=> b!673357 m!641877))

(assert (=> b!673365 m!641847))

(assert (=> b!673365 m!641847))

(declare-fun m!641879 () Bool)

(assert (=> b!673365 m!641879))

(declare-fun m!641881 () Bool)

(assert (=> b!673363 m!641881))

(declare-fun m!641883 () Bool)

(assert (=> b!673369 m!641883))

(assert (=> b!673364 m!641865))

(push 1)

