; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32070 () Bool)

(assert start!32070)

(declare-fun res!174263 () Bool)

(declare-fun e!198622 () Bool)

(assert (=> start!32070 (=> (not res!174263) (not e!198622))))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32070 (= res!174263 (validMask!0 mask!3777))))

(assert (=> start!32070 e!198622))

(assert (=> start!32070 true))

(declare-datatypes ((array!16344 0))(
  ( (array!16345 (arr!7734 (Array (_ BitVec 32) (_ BitVec 64))) (size!8086 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16344)

(declare-fun array_inv!5697 (array!16344) Bool)

(assert (=> start!32070 (array_inv!5697 a!3305)))

(declare-fun b!319950 () Bool)

(declare-fun res!174264 () Bool)

(assert (=> b!319950 (=> (not res!174264) (not e!198622))))

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun i!1250 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2865 0))(
  ( (MissingZero!2865 (index!13636 (_ BitVec 32))) (Found!2865 (index!13637 (_ BitVec 32))) (Intermediate!2865 (undefined!3677 Bool) (index!13638 (_ BitVec 32)) (x!31907 (_ BitVec 32))) (Undefined!2865) (MissingVacant!2865 (index!13639 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16344 (_ BitVec 32)) SeekEntryResult!2865)

(assert (=> b!319950 (= res!174264 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!2865 i!1250)))))

(declare-fun b!319951 () Bool)

(declare-fun res!174265 () Bool)

(assert (=> b!319951 (=> (not res!174265) (not e!198622))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!319951 (= res!174265 (validKeyInArray!0 k0!2497))))

(declare-fun b!319952 () Bool)

(declare-fun lt!155901 () (_ BitVec 32))

(assert (=> b!319952 (= e!198622 (and (bvsge mask!3777 #b00000000000000000000000000000000) (or (bvslt lt!155901 #b00000000000000000000000000000000) (bvsge lt!155901 (bvadd #b00000000000000000000000000000001 mask!3777)))))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!319952 (= lt!155901 (toIndex!0 k0!2497 mask!3777))))

(declare-fun b!319953 () Bool)

(declare-fun res!174262 () Bool)

(assert (=> b!319953 (=> (not res!174262) (not e!198622))))

(assert (=> b!319953 (= res!174262 (and (= (size!8086 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8086 a!3305))))))

(declare-fun b!319954 () Bool)

(declare-fun res!174266 () Bool)

(assert (=> b!319954 (=> (not res!174266) (not e!198622))))

(declare-fun arrayContainsKey!0 (array!16344 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!319954 (= res!174266 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!319955 () Bool)

(declare-fun res!174267 () Bool)

(assert (=> b!319955 (=> (not res!174267) (not e!198622))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16344 (_ BitVec 32)) Bool)

(assert (=> b!319955 (= res!174267 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(assert (= (and start!32070 res!174263) b!319953))

(assert (= (and b!319953 res!174262) b!319951))

(assert (= (and b!319951 res!174265) b!319954))

(assert (= (and b!319954 res!174266) b!319950))

(assert (= (and b!319950 res!174264) b!319955))

(assert (= (and b!319955 res!174267) b!319952))

(declare-fun m!328423 () Bool)

(assert (=> b!319951 m!328423))

(declare-fun m!328425 () Bool)

(assert (=> b!319952 m!328425))

(declare-fun m!328427 () Bool)

(assert (=> b!319954 m!328427))

(declare-fun m!328429 () Bool)

(assert (=> b!319950 m!328429))

(declare-fun m!328431 () Bool)

(assert (=> start!32070 m!328431))

(declare-fun m!328433 () Bool)

(assert (=> start!32070 m!328433))

(declare-fun m!328435 () Bool)

(assert (=> b!319955 m!328435))

(check-sat (not b!319955) (not b!319952) (not b!319954) (not b!319951) (not b!319950) (not start!32070))
(check-sat)
(get-model)

(declare-fun d!69389 () Bool)

(declare-fun res!174292 () Bool)

(declare-fun e!198635 () Bool)

(assert (=> d!69389 (=> res!174292 e!198635)))

(assert (=> d!69389 (= res!174292 (= (select (arr!7734 a!3305) #b00000000000000000000000000000000) k0!2497))))

(assert (=> d!69389 (= (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000) e!198635)))

(declare-fun b!319980 () Bool)

(declare-fun e!198636 () Bool)

(assert (=> b!319980 (= e!198635 e!198636)))

(declare-fun res!174293 () Bool)

(assert (=> b!319980 (=> (not res!174293) (not e!198636))))

(assert (=> b!319980 (= res!174293 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!8086 a!3305)))))

(declare-fun b!319981 () Bool)

(assert (=> b!319981 (= e!198636 (arrayContainsKey!0 a!3305 k0!2497 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!69389 (not res!174292)) b!319980))

(assert (= (and b!319980 res!174293) b!319981))

(declare-fun m!328451 () Bool)

(assert (=> d!69389 m!328451))

(declare-fun m!328453 () Bool)

(assert (=> b!319981 m!328453))

(assert (=> b!319954 d!69389))

(declare-fun b!319994 () Bool)

(declare-fun e!198647 () Bool)

(declare-fun call!26047 () Bool)

(assert (=> b!319994 (= e!198647 call!26047)))

(declare-fun b!319995 () Bool)

(declare-fun e!198649 () Bool)

(assert (=> b!319995 (= e!198649 e!198647)))

(declare-fun lt!155912 () (_ BitVec 64))

(assert (=> b!319995 (= lt!155912 (select (arr!7734 a!3305) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9818 0))(
  ( (Unit!9819) )
))
(declare-fun lt!155911 () Unit!9818)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!16344 (_ BitVec 64) (_ BitVec 32)) Unit!9818)

(assert (=> b!319995 (= lt!155911 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3305 lt!155912 #b00000000000000000000000000000000))))

(assert (=> b!319995 (arrayContainsKey!0 a!3305 lt!155912 #b00000000000000000000000000000000)))

(declare-fun lt!155913 () Unit!9818)

(assert (=> b!319995 (= lt!155913 lt!155911)))

(declare-fun res!174303 () Bool)

(assert (=> b!319995 (= res!174303 (= (seekEntryOrOpen!0 (select (arr!7734 a!3305) #b00000000000000000000000000000000) a!3305 mask!3777) (Found!2865 #b00000000000000000000000000000000)))))

(assert (=> b!319995 (=> (not res!174303) (not e!198647))))

(declare-fun d!69395 () Bool)

(declare-fun res!174302 () Bool)

(declare-fun e!198648 () Bool)

(assert (=> d!69395 (=> res!174302 e!198648)))

(assert (=> d!69395 (= res!174302 (bvsge #b00000000000000000000000000000000 (size!8086 a!3305)))))

(assert (=> d!69395 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777) e!198648)))

(declare-fun b!319996 () Bool)

(assert (=> b!319996 (= e!198648 e!198649)))

(declare-fun c!50469 () Bool)

(assert (=> b!319996 (= c!50469 (validKeyInArray!0 (select (arr!7734 a!3305) #b00000000000000000000000000000000)))))

(declare-fun b!319997 () Bool)

(assert (=> b!319997 (= e!198649 call!26047)))

(declare-fun bm!26044 () Bool)

(assert (=> bm!26044 (= call!26047 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3305 mask!3777))))

(assert (= (and d!69395 (not res!174302)) b!319996))

(assert (= (and b!319996 c!50469) b!319995))

(assert (= (and b!319996 (not c!50469)) b!319997))

(assert (= (and b!319995 res!174303) b!319994))

(assert (= (or b!319994 b!319997) bm!26044))

(assert (=> b!319995 m!328451))

(declare-fun m!328459 () Bool)

(assert (=> b!319995 m!328459))

(declare-fun m!328461 () Bool)

(assert (=> b!319995 m!328461))

(assert (=> b!319995 m!328451))

(declare-fun m!328463 () Bool)

(assert (=> b!319995 m!328463))

(assert (=> b!319996 m!328451))

(assert (=> b!319996 m!328451))

(declare-fun m!328465 () Bool)

(assert (=> b!319996 m!328465))

(declare-fun m!328467 () Bool)

(assert (=> bm!26044 m!328467))

(assert (=> b!319955 d!69395))

(declare-fun b!320022 () Bool)

(declare-fun c!50481 () Bool)

(declare-fun lt!155936 () (_ BitVec 64))

(assert (=> b!320022 (= c!50481 (= lt!155936 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!198665 () SeekEntryResult!2865)

(declare-fun e!198666 () SeekEntryResult!2865)

(assert (=> b!320022 (= e!198665 e!198666)))

(declare-fun b!320023 () Bool)

(declare-fun e!198667 () SeekEntryResult!2865)

(assert (=> b!320023 (= e!198667 e!198665)))

(declare-fun lt!155935 () SeekEntryResult!2865)

(assert (=> b!320023 (= lt!155936 (select (arr!7734 a!3305) (index!13638 lt!155935)))))

(declare-fun c!50480 () Bool)

(assert (=> b!320023 (= c!50480 (= lt!155936 k0!2497))))

(declare-fun b!320024 () Bool)

(assert (=> b!320024 (= e!198665 (Found!2865 (index!13638 lt!155935)))))

(declare-fun b!320025 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16344 (_ BitVec 32)) SeekEntryResult!2865)

(assert (=> b!320025 (= e!198666 (seekKeyOrZeroReturnVacant!0 (x!31907 lt!155935) (index!13638 lt!155935) (index!13638 lt!155935) k0!2497 a!3305 mask!3777))))

(declare-fun b!320026 () Bool)

(assert (=> b!320026 (= e!198667 Undefined!2865)))

(declare-fun b!320027 () Bool)

(assert (=> b!320027 (= e!198666 (MissingZero!2865 (index!13638 lt!155935)))))

(declare-fun d!69403 () Bool)

(declare-fun lt!155937 () SeekEntryResult!2865)

(get-info :version)

(assert (=> d!69403 (and (or ((_ is Undefined!2865) lt!155937) (not ((_ is Found!2865) lt!155937)) (and (bvsge (index!13637 lt!155937) #b00000000000000000000000000000000) (bvslt (index!13637 lt!155937) (size!8086 a!3305)))) (or ((_ is Undefined!2865) lt!155937) ((_ is Found!2865) lt!155937) (not ((_ is MissingZero!2865) lt!155937)) (and (bvsge (index!13636 lt!155937) #b00000000000000000000000000000000) (bvslt (index!13636 lt!155937) (size!8086 a!3305)))) (or ((_ is Undefined!2865) lt!155937) ((_ is Found!2865) lt!155937) ((_ is MissingZero!2865) lt!155937) (not ((_ is MissingVacant!2865) lt!155937)) (and (bvsge (index!13639 lt!155937) #b00000000000000000000000000000000) (bvslt (index!13639 lt!155937) (size!8086 a!3305)))) (or ((_ is Undefined!2865) lt!155937) (ite ((_ is Found!2865) lt!155937) (= (select (arr!7734 a!3305) (index!13637 lt!155937)) k0!2497) (ite ((_ is MissingZero!2865) lt!155937) (= (select (arr!7734 a!3305) (index!13636 lt!155937)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!2865) lt!155937) (= (select (arr!7734 a!3305) (index!13639 lt!155937)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!69403 (= lt!155937 e!198667)))

(declare-fun c!50479 () Bool)

(assert (=> d!69403 (= c!50479 (and ((_ is Intermediate!2865) lt!155935) (undefined!3677 lt!155935)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16344 (_ BitVec 32)) SeekEntryResult!2865)

(assert (=> d!69403 (= lt!155935 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777))))

(assert (=> d!69403 (validMask!0 mask!3777)))

(assert (=> d!69403 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) lt!155937)))

(assert (= (and d!69403 c!50479) b!320026))

(assert (= (and d!69403 (not c!50479)) b!320023))

(assert (= (and b!320023 c!50480) b!320024))

(assert (= (and b!320023 (not c!50480)) b!320022))

(assert (= (and b!320022 c!50481) b!320027))

(assert (= (and b!320022 (not c!50481)) b!320025))

(declare-fun m!328481 () Bool)

(assert (=> b!320023 m!328481))

(declare-fun m!328483 () Bool)

(assert (=> b!320025 m!328483))

(declare-fun m!328485 () Bool)

(assert (=> d!69403 m!328485))

(assert (=> d!69403 m!328425))

(assert (=> d!69403 m!328431))

(declare-fun m!328487 () Bool)

(assert (=> d!69403 m!328487))

(assert (=> d!69403 m!328425))

(declare-fun m!328489 () Bool)

(assert (=> d!69403 m!328489))

(declare-fun m!328491 () Bool)

(assert (=> d!69403 m!328491))

(assert (=> b!319950 d!69403))

(declare-fun d!69413 () Bool)

(assert (=> d!69413 (= (validKeyInArray!0 k0!2497) (and (not (= k0!2497 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2497 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!319951 d!69413))

(declare-fun d!69415 () Bool)

(declare-fun lt!155958 () (_ BitVec 32))

(declare-fun lt!155957 () (_ BitVec 32))

(assert (=> d!69415 (= lt!155958 (bvmul (bvxor lt!155957 (bvlshr lt!155957 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!69415 (= lt!155957 ((_ extract 31 0) (bvand (bvxor k0!2497 (bvlshr k0!2497 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!69415 (and (bvsge mask!3777 #b00000000000000000000000000000000) (let ((res!174311 (let ((h!5383 ((_ extract 31 0) (bvand (bvxor k0!2497 (bvlshr k0!2497 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!31910 (bvmul (bvxor h!5383 (bvlshr h!5383 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!31910 (bvlshr x!31910 #b00000000000000000000000000001101)) mask!3777))))) (and (bvslt res!174311 (bvadd mask!3777 #b00000000000000000000000000000001)) (bvsge res!174311 #b00000000000000000000000000000000))))))

(assert (=> d!69415 (= (toIndex!0 k0!2497 mask!3777) (bvand (bvxor lt!155958 (bvlshr lt!155958 #b00000000000000000000000000001101)) mask!3777))))

(assert (=> b!319952 d!69415))

(declare-fun d!69419 () Bool)

(assert (=> d!69419 (= (validMask!0 mask!3777) (and (or (= mask!3777 #b00000000000000000000000000000111) (= mask!3777 #b00000000000000000000000000001111) (= mask!3777 #b00000000000000000000000000011111) (= mask!3777 #b00000000000000000000000000111111) (= mask!3777 #b00000000000000000000000001111111) (= mask!3777 #b00000000000000000000000011111111) (= mask!3777 #b00000000000000000000000111111111) (= mask!3777 #b00000000000000000000001111111111) (= mask!3777 #b00000000000000000000011111111111) (= mask!3777 #b00000000000000000000111111111111) (= mask!3777 #b00000000000000000001111111111111) (= mask!3777 #b00000000000000000011111111111111) (= mask!3777 #b00000000000000000111111111111111) (= mask!3777 #b00000000000000001111111111111111) (= mask!3777 #b00000000000000011111111111111111) (= mask!3777 #b00000000000000111111111111111111) (= mask!3777 #b00000000000001111111111111111111) (= mask!3777 #b00000000000011111111111111111111) (= mask!3777 #b00000000000111111111111111111111) (= mask!3777 #b00000000001111111111111111111111) (= mask!3777 #b00000000011111111111111111111111) (= mask!3777 #b00000000111111111111111111111111) (= mask!3777 #b00000001111111111111111111111111) (= mask!3777 #b00000011111111111111111111111111) (= mask!3777 #b00000111111111111111111111111111) (= mask!3777 #b00001111111111111111111111111111) (= mask!3777 #b00011111111111111111111111111111) (= mask!3777 #b00111111111111111111111111111111)) (bvsle mask!3777 #b00111111111111111111111111111111)))))

(assert (=> start!32070 d!69419))

(declare-fun d!69425 () Bool)

(assert (=> d!69425 (= (array_inv!5697 a!3305) (bvsge (size!8086 a!3305) #b00000000000000000000000000000000))))

(assert (=> start!32070 d!69425))

(check-sat (not b!319981) (not b!320025) (not b!319996) (not b!319995) (not d!69403) (not bm!26044))
(check-sat)
