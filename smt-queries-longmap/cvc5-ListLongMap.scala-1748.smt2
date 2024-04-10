; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32008 () Bool)

(assert start!32008)

(declare-fun res!173992 () Bool)

(declare-fun e!198471 () Bool)

(assert (=> start!32008 (=> (not res!173992) (not e!198471))))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32008 (= res!173992 (validMask!0 mask!3777))))

(assert (=> start!32008 e!198471))

(assert (=> start!32008 true))

(declare-datatypes ((array!16315 0))(
  ( (array!16316 (arr!7721 (Array (_ BitVec 32) (_ BitVec 64))) (size!8073 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16315)

(declare-fun array_inv!5684 (array!16315) Bool)

(assert (=> start!32008 (array_inv!5684 a!3305)))

(declare-fun b!319608 () Bool)

(declare-fun res!173996 () Bool)

(assert (=> b!319608 (=> (not res!173996) (not e!198471))))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!319608 (= res!173996 (and (= (size!8073 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8073 a!3305))))))

(declare-fun b!319609 () Bool)

(assert (=> b!319609 (= e!198471 (and (bvsge mask!3777 #b00000000000000000000000000000000) (bvsgt mask!3777 #b00111111111111111111111111111111)))))

(declare-fun b!319610 () Bool)

(declare-fun res!173995 () Bool)

(assert (=> b!319610 (=> (not res!173995) (not e!198471))))

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!16315 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!319610 (= res!173995 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun b!319611 () Bool)

(declare-fun res!173997 () Bool)

(assert (=> b!319611 (=> (not res!173997) (not e!198471))))

(declare-datatypes ((SeekEntryResult!2852 0))(
  ( (MissingZero!2852 (index!13584 (_ BitVec 32))) (Found!2852 (index!13585 (_ BitVec 32))) (Intermediate!2852 (undefined!3664 Bool) (index!13586 (_ BitVec 32)) (x!31862 (_ BitVec 32))) (Undefined!2852) (MissingVacant!2852 (index!13587 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16315 (_ BitVec 32)) SeekEntryResult!2852)

(assert (=> b!319611 (= res!173997 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!2852 i!1250)))))

(declare-fun b!319612 () Bool)

(declare-fun res!173993 () Bool)

(assert (=> b!319612 (=> (not res!173993) (not e!198471))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!319612 (= res!173993 (validKeyInArray!0 k!2497))))

(declare-fun b!319613 () Bool)

(declare-fun res!173994 () Bool)

(assert (=> b!319613 (=> (not res!173994) (not e!198471))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16315 (_ BitVec 32)) Bool)

(assert (=> b!319613 (= res!173994 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(assert (= (and start!32008 res!173992) b!319608))

(assert (= (and b!319608 res!173996) b!319612))

(assert (= (and b!319612 res!173993) b!319610))

(assert (= (and b!319610 res!173995) b!319611))

(assert (= (and b!319611 res!173997) b!319613))

(assert (= (and b!319613 res!173994) b!319609))

(declare-fun m!328163 () Bool)

(assert (=> b!319613 m!328163))

(declare-fun m!328165 () Bool)

(assert (=> b!319611 m!328165))

(declare-fun m!328167 () Bool)

(assert (=> b!319610 m!328167))

(declare-fun m!328169 () Bool)

(assert (=> start!32008 m!328169))

(declare-fun m!328171 () Bool)

(assert (=> start!32008 m!328171))

(declare-fun m!328173 () Bool)

(assert (=> b!319612 m!328173))

(push 1)

(assert (not b!319613))

(assert (not start!32008))

(assert (not b!319610))

(assert (not b!319611))

(assert (not b!319612))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!319698 () Bool)

(declare-fun e!198518 () SeekEntryResult!2852)

(declare-fun lt!155839 () SeekEntryResult!2852)

(assert (=> b!319698 (= e!198518 (MissingZero!2852 (index!13586 lt!155839)))))

(declare-fun b!319700 () Bool)

(declare-fun c!50451 () Bool)

(declare-fun lt!155841 () (_ BitVec 64))

(assert (=> b!319700 (= c!50451 (= lt!155841 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!198519 () SeekEntryResult!2852)

(assert (=> b!319700 (= e!198519 e!198518)))

(declare-fun b!319702 () Bool)

(declare-fun e!198517 () SeekEntryResult!2852)

(assert (=> b!319702 (= e!198517 e!198519)))

(assert (=> b!319702 (= lt!155841 (select (arr!7721 a!3305) (index!13586 lt!155839)))))

(declare-fun c!50450 () Bool)

(assert (=> b!319702 (= c!50450 (= lt!155841 k!2497))))

(declare-fun b!319704 () Bool)

(assert (=> b!319704 (= e!198519 (Found!2852 (index!13586 lt!155839)))))

(declare-fun b!319705 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16315 (_ BitVec 32)) SeekEntryResult!2852)

(assert (=> b!319705 (= e!198518 (seekKeyOrZeroReturnVacant!0 (x!31862 lt!155839) (index!13586 lt!155839) (index!13586 lt!155839) k!2497 a!3305 mask!3777))))

(declare-fun b!319703 () Bool)

(assert (=> b!319703 (= e!198517 Undefined!2852)))

(declare-fun d!69347 () Bool)

(declare-fun lt!155840 () SeekEntryResult!2852)

(assert (=> d!69347 (and (or (is-Undefined!2852 lt!155840) (not (is-Found!2852 lt!155840)) (and (bvsge (index!13585 lt!155840) #b00000000000000000000000000000000) (bvslt (index!13585 lt!155840) (size!8073 a!3305)))) (or (is-Undefined!2852 lt!155840) (is-Found!2852 lt!155840) (not (is-MissingZero!2852 lt!155840)) (and (bvsge (index!13584 lt!155840) #b00000000000000000000000000000000) (bvslt (index!13584 lt!155840) (size!8073 a!3305)))) (or (is-Undefined!2852 lt!155840) (is-Found!2852 lt!155840) (is-MissingZero!2852 lt!155840) (not (is-MissingVacant!2852 lt!155840)) (and (bvsge (index!13587 lt!155840) #b00000000000000000000000000000000) (bvslt (index!13587 lt!155840) (size!8073 a!3305)))) (or (is-Undefined!2852 lt!155840) (ite (is-Found!2852 lt!155840) (= (select (arr!7721 a!3305) (index!13585 lt!155840)) k!2497) (ite (is-MissingZero!2852 lt!155840) (= (select (arr!7721 a!3305) (index!13584 lt!155840)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!2852 lt!155840) (= (select (arr!7721 a!3305) (index!13587 lt!155840)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!69347 (= lt!155840 e!198517)))

(declare-fun c!50449 () Bool)

(assert (=> d!69347 (= c!50449 (and (is-Intermediate!2852 lt!155839) (undefined!3664 lt!155839)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16315 (_ BitVec 32)) SeekEntryResult!2852)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!69347 (= lt!155839 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777))))

(assert (=> d!69347 (validMask!0 mask!3777)))

(assert (=> d!69347 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) lt!155840)))

(assert (= (and d!69347 c!50449) b!319703))

(assert (= (and d!69347 (not c!50449)) b!319702))

(assert (= (and b!319702 c!50450) b!319704))

(assert (= (and b!319702 (not c!50450)) b!319700))

(assert (= (and b!319700 c!50451) b!319698))

(assert (= (and b!319700 (not c!50451)) b!319705))

(declare-fun m!328229 () Bool)

(assert (=> b!319702 m!328229))

(declare-fun m!328231 () Bool)

(assert (=> b!319705 m!328231))

(declare-fun m!328233 () Bool)

(assert (=> d!69347 m!328233))

(declare-fun m!328235 () Bool)

(assert (=> d!69347 m!328235))

(declare-fun m!328237 () Bool)

(assert (=> d!69347 m!328237))

(assert (=> d!69347 m!328169))

(declare-fun m!328239 () Bool)

(assert (=> d!69347 m!328239))

(declare-fun m!328241 () Bool)

(assert (=> d!69347 m!328241))

(assert (=> d!69347 m!328233))

(assert (=> b!319611 d!69347))

(declare-fun d!69361 () Bool)

(assert (=> d!69361 (= (validKeyInArray!0 k!2497) (and (not (= k!2497 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2497 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!319612 d!69361))

(declare-fun d!69367 () Bool)

(assert (=> d!69367 (= (validMask!0 mask!3777) (and (or (= mask!3777 #b00000000000000000000000000000111) (= mask!3777 #b00000000000000000000000000001111) (= mask!3777 #b00000000000000000000000000011111) (= mask!3777 #b00000000000000000000000000111111) (= mask!3777 #b00000000000000000000000001111111) (= mask!3777 #b00000000000000000000000011111111) (= mask!3777 #b00000000000000000000000111111111) (= mask!3777 #b00000000000000000000001111111111) (= mask!3777 #b00000000000000000000011111111111) (= mask!3777 #b00000000000000000000111111111111) (= mask!3777 #b00000000000000000001111111111111) (= mask!3777 #b00000000000000000011111111111111) (= mask!3777 #b00000000000000000111111111111111) (= mask!3777 #b00000000000000001111111111111111) (= mask!3777 #b00000000000000011111111111111111) (= mask!3777 #b00000000000000111111111111111111) (= mask!3777 #b00000000000001111111111111111111) (= mask!3777 #b00000000000011111111111111111111) (= mask!3777 #b00000000000111111111111111111111) (= mask!3777 #b00000000001111111111111111111111) (= mask!3777 #b00000000011111111111111111111111) (= mask!3777 #b00000000111111111111111111111111) (= mask!3777 #b00000001111111111111111111111111) (= mask!3777 #b00000011111111111111111111111111) (= mask!3777 #b00000111111111111111111111111111) (= mask!3777 #b00001111111111111111111111111111) (= mask!3777 #b00011111111111111111111111111111) (= mask!3777 #b00111111111111111111111111111111)) (bvsle mask!3777 #b00111111111111111111111111111111)))))

(assert (=> start!32008 d!69367))

(declare-fun d!69373 () Bool)

(assert (=> d!69373 (= (array_inv!5684 a!3305) (bvsge (size!8073 a!3305) #b00000000000000000000000000000000))))

(assert (=> start!32008 d!69373))

(declare-fun bm!26041 () Bool)

(declare-fun call!26044 () Bool)

(assert (=> bm!26041 (= call!26044 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3305 mask!3777))))

(declare-fun b!319748 () Bool)

(declare-fun e!198548 () Bool)

(assert (=> b!319748 (= e!198548 call!26044)))

(declare-fun b!319749 () Bool)

(declare-fun e!198550 () Bool)

(assert (=> b!319749 (= e!198550 e!198548)))

(declare-fun lt!155868 () (_ BitVec 64))

(assert (=> b!319749 (= lt!155868 (select (arr!7721 a!3305) #b00000000000000000000000000000000))))

