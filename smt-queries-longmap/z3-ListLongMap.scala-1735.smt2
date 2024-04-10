; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31864 () Bool)

(assert start!31864)

(declare-fun b!318602 () Bool)

(declare-fun res!173181 () Bool)

(declare-fun e!197947 () Bool)

(assert (=> b!318602 (=> (not res!173181) (not e!197947))))

(declare-datatypes ((array!16235 0))(
  ( (array!16236 (arr!7683 (Array (_ BitVec 32) (_ BitVec 64))) (size!8035 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!16235)

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!16235 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!318602 (= res!173181 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!318603 () Bool)

(declare-fun res!173187 () Bool)

(assert (=> b!318603 (=> (not res!173187) (not e!197947))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!318603 (= res!173187 (validKeyInArray!0 k0!2441))))

(declare-fun b!318604 () Bool)

(declare-fun res!173188 () Bool)

(declare-fun e!197949 () Bool)

(assert (=> b!318604 (=> (not res!173188) (not e!197949))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!318604 (= res!173188 (and (= (select (arr!7683 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!8035 a!3293))))))

(declare-fun b!318605 () Bool)

(declare-fun res!173189 () Bool)

(assert (=> b!318605 (=> (not res!173189) (not e!197947))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16235 (_ BitVec 32)) Bool)

(assert (=> b!318605 (= res!173189 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!318606 () Bool)

(declare-fun res!173183 () Bool)

(assert (=> b!318606 (=> (not res!173183) (not e!197947))))

(assert (=> b!318606 (= res!173183 (and (= (size!8035 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!8035 a!3293))))))

(declare-fun b!318607 () Bool)

(assert (=> b!318607 (= e!197947 e!197949)))

(declare-fun res!173190 () Bool)

(assert (=> b!318607 (=> (not res!173190) (not e!197949))))

(declare-datatypes ((SeekEntryResult!2823 0))(
  ( (MissingZero!2823 (index!13468 (_ BitVec 32))) (Found!2823 (index!13469 (_ BitVec 32))) (Intermediate!2823 (undefined!3635 Bool) (index!13470 (_ BitVec 32)) (x!31720 (_ BitVec 32))) (Undefined!2823) (MissingVacant!2823 (index!13471 (_ BitVec 32))) )
))
(declare-fun lt!155417 () SeekEntryResult!2823)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16235 (_ BitVec 32)) SeekEntryResult!2823)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!318607 (= res!173190 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!155417))))

(assert (=> b!318607 (= lt!155417 (Intermediate!2823 false resIndex!52 resX!52))))

(declare-fun res!173184 () Bool)

(assert (=> start!31864 (=> (not res!173184) (not e!197947))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31864 (= res!173184 (validMask!0 mask!3709))))

(assert (=> start!31864 e!197947))

(declare-fun array_inv!5646 (array!16235) Bool)

(assert (=> start!31864 (array_inv!5646 a!3293)))

(assert (=> start!31864 true))

(declare-fun b!318608 () Bool)

(declare-fun e!197946 () Bool)

(assert (=> b!318608 (= e!197949 e!197946)))

(declare-fun res!173186 () Bool)

(assert (=> b!318608 (=> (not res!173186) (not e!197946))))

(declare-fun lt!155415 () SeekEntryResult!2823)

(assert (=> b!318608 (= res!173186 (and (= lt!155415 lt!155417) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7683 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!318608 (= lt!155415 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!318609 () Bool)

(declare-fun lt!155416 () (_ BitVec 32))

(assert (=> b!318609 (= e!197946 (not (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1427) resX!52) (bvslt (bvadd #b00000000000000000000000000000001 x!1427) #b00000000000000000000000000000000) (and (bvsge lt!155416 #b00000000000000000000000000000000) (bvslt lt!155416 (size!8035 a!3293))))))))

(declare-fun e!197950 () Bool)

(assert (=> b!318609 e!197950))

(declare-fun res!173185 () Bool)

(assert (=> b!318609 (=> (not res!173185) (not e!197950))))

(assert (=> b!318609 (= res!173185 (= lt!155415 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!155416 k0!2441 a!3293 mask!3709)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!318609 (= lt!155416 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!318610 () Bool)

(declare-fun lt!155418 () array!16235)

(assert (=> b!318610 (= e!197950 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 lt!155418 mask!3709) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!155416 k0!2441 lt!155418 mask!3709)))))

(assert (=> b!318610 (= lt!155418 (array!16236 (store (arr!7683 a!3293) i!1240 k0!2441) (size!8035 a!3293)))))

(declare-fun b!318611 () Bool)

(declare-fun res!173182 () Bool)

(assert (=> b!318611 (=> (not res!173182) (not e!197947))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16235 (_ BitVec 32)) SeekEntryResult!2823)

(assert (=> b!318611 (= res!173182 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2823 i!1240)))))

(assert (= (and start!31864 res!173184) b!318606))

(assert (= (and b!318606 res!173183) b!318603))

(assert (= (and b!318603 res!173187) b!318602))

(assert (= (and b!318602 res!173181) b!318611))

(assert (= (and b!318611 res!173182) b!318605))

(assert (= (and b!318605 res!173189) b!318607))

(assert (= (and b!318607 res!173190) b!318604))

(assert (= (and b!318604 res!173188) b!318608))

(assert (= (and b!318608 res!173186) b!318609))

(assert (= (and b!318609 res!173185) b!318610))

(declare-fun m!327313 () Bool)

(assert (=> start!31864 m!327313))

(declare-fun m!327315 () Bool)

(assert (=> start!31864 m!327315))

(declare-fun m!327317 () Bool)

(assert (=> b!318608 m!327317))

(declare-fun m!327319 () Bool)

(assert (=> b!318608 m!327319))

(declare-fun m!327321 () Bool)

(assert (=> b!318605 m!327321))

(declare-fun m!327323 () Bool)

(assert (=> b!318603 m!327323))

(declare-fun m!327325 () Bool)

(assert (=> b!318607 m!327325))

(assert (=> b!318607 m!327325))

(declare-fun m!327327 () Bool)

(assert (=> b!318607 m!327327))

(declare-fun m!327329 () Bool)

(assert (=> b!318609 m!327329))

(declare-fun m!327331 () Bool)

(assert (=> b!318609 m!327331))

(declare-fun m!327333 () Bool)

(assert (=> b!318602 m!327333))

(declare-fun m!327335 () Bool)

(assert (=> b!318611 m!327335))

(declare-fun m!327337 () Bool)

(assert (=> b!318610 m!327337))

(declare-fun m!327339 () Bool)

(assert (=> b!318610 m!327339))

(declare-fun m!327341 () Bool)

(assert (=> b!318610 m!327341))

(declare-fun m!327343 () Bool)

(assert (=> b!318604 m!327343))

(check-sat (not b!318611) (not b!318608) (not b!318603) (not b!318605) (not b!318609) (not b!318607) (not b!318602) (not start!31864) (not b!318610))
(check-sat)
(get-model)

(declare-fun d!69227 () Bool)

(declare-fun res!173225 () Bool)

(declare-fun e!197970 () Bool)

(assert (=> d!69227 (=> res!173225 e!197970)))

(assert (=> d!69227 (= res!173225 (= (select (arr!7683 a!3293) #b00000000000000000000000000000000) k0!2441))))

(assert (=> d!69227 (= (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000) e!197970)))

(declare-fun b!318646 () Bool)

(declare-fun e!197971 () Bool)

(assert (=> b!318646 (= e!197970 e!197971)))

(declare-fun res!173226 () Bool)

(assert (=> b!318646 (=> (not res!173226) (not e!197971))))

(assert (=> b!318646 (= res!173226 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!8035 a!3293)))))

(declare-fun b!318647 () Bool)

(assert (=> b!318647 (= e!197971 (arrayContainsKey!0 a!3293 k0!2441 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!69227 (not res!173225)) b!318646))

(assert (= (and b!318646 res!173226) b!318647))

(declare-fun m!327377 () Bool)

(assert (=> d!69227 m!327377))

(declare-fun m!327379 () Bool)

(assert (=> b!318647 m!327379))

(assert (=> b!318602 d!69227))

(declare-fun d!69229 () Bool)

(assert (=> d!69229 (= (validKeyInArray!0 k0!2441) (and (not (= k0!2441 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2441 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!318603 d!69229))

(declare-fun d!69231 () Bool)

(assert (=> d!69231 (= (validMask!0 mask!3709) (and (or (= mask!3709 #b00000000000000000000000000000111) (= mask!3709 #b00000000000000000000000000001111) (= mask!3709 #b00000000000000000000000000011111) (= mask!3709 #b00000000000000000000000000111111) (= mask!3709 #b00000000000000000000000001111111) (= mask!3709 #b00000000000000000000000011111111) (= mask!3709 #b00000000000000000000000111111111) (= mask!3709 #b00000000000000000000001111111111) (= mask!3709 #b00000000000000000000011111111111) (= mask!3709 #b00000000000000000000111111111111) (= mask!3709 #b00000000000000000001111111111111) (= mask!3709 #b00000000000000000011111111111111) (= mask!3709 #b00000000000000000111111111111111) (= mask!3709 #b00000000000000001111111111111111) (= mask!3709 #b00000000000000011111111111111111) (= mask!3709 #b00000000000000111111111111111111) (= mask!3709 #b00000000000001111111111111111111) (= mask!3709 #b00000000000011111111111111111111) (= mask!3709 #b00000000000111111111111111111111) (= mask!3709 #b00000000001111111111111111111111) (= mask!3709 #b00000000011111111111111111111111) (= mask!3709 #b00000000111111111111111111111111) (= mask!3709 #b00000001111111111111111111111111) (= mask!3709 #b00000011111111111111111111111111) (= mask!3709 #b00000111111111111111111111111111) (= mask!3709 #b00001111111111111111111111111111) (= mask!3709 #b00011111111111111111111111111111) (= mask!3709 #b00111111111111111111111111111111)) (bvsle mask!3709 #b00111111111111111111111111111111)))))

(assert (=> start!31864 d!69231))

(declare-fun d!69239 () Bool)

(assert (=> d!69239 (= (array_inv!5646 a!3293) (bvsge (size!8035 a!3293) #b00000000000000000000000000000000))))

(assert (=> start!31864 d!69239))

(declare-fun b!318730 () Bool)

(declare-fun e!198022 () SeekEntryResult!2823)

(assert (=> b!318730 (= e!198022 (Intermediate!2823 false index!1781 x!1427))))

(declare-fun b!318731 () Bool)

(declare-fun lt!155454 () SeekEntryResult!2823)

(assert (=> b!318731 (and (bvsge (index!13470 lt!155454) #b00000000000000000000000000000000) (bvslt (index!13470 lt!155454) (size!8035 a!3293)))))

(declare-fun e!198024 () Bool)

(assert (=> b!318731 (= e!198024 (= (select (arr!7683 a!3293) (index!13470 lt!155454)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!318732 () Bool)

(assert (=> b!318732 (and (bvsge (index!13470 lt!155454) #b00000000000000000000000000000000) (bvslt (index!13470 lt!155454) (size!8035 a!3293)))))

(declare-fun res!173262 () Bool)

(assert (=> b!318732 (= res!173262 (= (select (arr!7683 a!3293) (index!13470 lt!155454)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!318732 (=> res!173262 e!198024)))

(declare-fun b!318733 () Bool)

(assert (=> b!318733 (and (bvsge (index!13470 lt!155454) #b00000000000000000000000000000000) (bvslt (index!13470 lt!155454) (size!8035 a!3293)))))

(declare-fun res!173261 () Bool)

(assert (=> b!318733 (= res!173261 (= (select (arr!7683 a!3293) (index!13470 lt!155454)) k0!2441))))

(assert (=> b!318733 (=> res!173261 e!198024)))

(declare-fun e!198025 () Bool)

(assert (=> b!318733 (= e!198025 e!198024)))

(declare-fun b!318735 () Bool)

(assert (=> b!318735 (= e!198022 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1427 #b00000000000000000000000000000001) (nextIndex!0 index!1781 x!1427 mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun b!318736 () Bool)

(declare-fun e!198026 () Bool)

(assert (=> b!318736 (= e!198026 e!198025)))

(declare-fun res!173263 () Bool)

(get-info :version)

(assert (=> b!318736 (= res!173263 (and ((_ is Intermediate!2823) lt!155454) (not (undefined!3635 lt!155454)) (bvslt (x!31720 lt!155454) #b01111111111111111111111111111110) (bvsge (x!31720 lt!155454) #b00000000000000000000000000000000) (bvsge (x!31720 lt!155454) x!1427)))))

(assert (=> b!318736 (=> (not res!173263) (not e!198025))))

(declare-fun b!318737 () Bool)

(assert (=> b!318737 (= e!198026 (bvsge (x!31720 lt!155454) #b01111111111111111111111111111110))))

(declare-fun b!318738 () Bool)

(declare-fun e!198023 () SeekEntryResult!2823)

(assert (=> b!318738 (= e!198023 (Intermediate!2823 true index!1781 x!1427))))

(declare-fun b!318734 () Bool)

(assert (=> b!318734 (= e!198023 e!198022)))

(declare-fun c!50356 () Bool)

(declare-fun lt!155453 () (_ BitVec 64))

(assert (=> b!318734 (= c!50356 (or (= lt!155453 k0!2441) (= (bvadd lt!155453 lt!155453) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!69241 () Bool)

(assert (=> d!69241 e!198026))

(declare-fun c!50358 () Bool)

(assert (=> d!69241 (= c!50358 (and ((_ is Intermediate!2823) lt!155454) (undefined!3635 lt!155454)))))

(assert (=> d!69241 (= lt!155454 e!198023)))

(declare-fun c!50357 () Bool)

(assert (=> d!69241 (= c!50357 (bvsge x!1427 #b01111111111111111111111111111110))))

(assert (=> d!69241 (= lt!155453 (select (arr!7683 a!3293) index!1781))))

(assert (=> d!69241 (validMask!0 mask!3709)))

(assert (=> d!69241 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709) lt!155454)))

(assert (= (and d!69241 c!50357) b!318738))

(assert (= (and d!69241 (not c!50357)) b!318734))

(assert (= (and b!318734 c!50356) b!318730))

(assert (= (and b!318734 (not c!50356)) b!318735))

(assert (= (and d!69241 c!50358) b!318737))

(assert (= (and d!69241 (not c!50358)) b!318736))

(assert (= (and b!318736 res!173263) b!318733))

(assert (= (and b!318733 (not res!173261)) b!318732))

(assert (= (and b!318732 (not res!173262)) b!318731))

(declare-fun m!327409 () Bool)

(assert (=> b!318732 m!327409))

(assert (=> b!318735 m!327331))

(assert (=> b!318735 m!327331))

(declare-fun m!327411 () Bool)

(assert (=> b!318735 m!327411))

(assert (=> b!318733 m!327409))

(assert (=> b!318731 m!327409))

(assert (=> d!69241 m!327317))

(assert (=> d!69241 m!327313))

(assert (=> b!318608 d!69241))

(declare-fun b!318741 () Bool)

(declare-fun e!198029 () SeekEntryResult!2823)

(assert (=> b!318741 (= e!198029 (Intermediate!2823 false lt!155416 (bvadd #b00000000000000000000000000000001 x!1427)))))

(declare-fun b!318742 () Bool)

(declare-fun lt!155456 () SeekEntryResult!2823)

(assert (=> b!318742 (and (bvsge (index!13470 lt!155456) #b00000000000000000000000000000000) (bvslt (index!13470 lt!155456) (size!8035 a!3293)))))

(declare-fun e!198031 () Bool)

(assert (=> b!318742 (= e!198031 (= (select (arr!7683 a!3293) (index!13470 lt!155456)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!318743 () Bool)

(assert (=> b!318743 (and (bvsge (index!13470 lt!155456) #b00000000000000000000000000000000) (bvslt (index!13470 lt!155456) (size!8035 a!3293)))))

(declare-fun res!173267 () Bool)

(assert (=> b!318743 (= res!173267 (= (select (arr!7683 a!3293) (index!13470 lt!155456)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!318743 (=> res!173267 e!198031)))

(declare-fun b!318744 () Bool)

(assert (=> b!318744 (and (bvsge (index!13470 lt!155456) #b00000000000000000000000000000000) (bvslt (index!13470 lt!155456) (size!8035 a!3293)))))

(declare-fun res!173266 () Bool)

(assert (=> b!318744 (= res!173266 (= (select (arr!7683 a!3293) (index!13470 lt!155456)) k0!2441))))

(assert (=> b!318744 (=> res!173266 e!198031)))

(declare-fun e!198032 () Bool)

(assert (=> b!318744 (= e!198032 e!198031)))

(declare-fun b!318746 () Bool)

(assert (=> b!318746 (= e!198029 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427 #b00000000000000000000000000000001) (nextIndex!0 lt!155416 (bvadd #b00000000000000000000000000000001 x!1427) mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun b!318747 () Bool)

(declare-fun e!198033 () Bool)

(assert (=> b!318747 (= e!198033 e!198032)))

(declare-fun res!173268 () Bool)

(assert (=> b!318747 (= res!173268 (and ((_ is Intermediate!2823) lt!155456) (not (undefined!3635 lt!155456)) (bvslt (x!31720 lt!155456) #b01111111111111111111111111111110) (bvsge (x!31720 lt!155456) #b00000000000000000000000000000000) (bvsge (x!31720 lt!155456) (bvadd #b00000000000000000000000000000001 x!1427))))))

(assert (=> b!318747 (=> (not res!173268) (not e!198032))))

(declare-fun b!318748 () Bool)

(assert (=> b!318748 (= e!198033 (bvsge (x!31720 lt!155456) #b01111111111111111111111111111110))))

(declare-fun b!318749 () Bool)

(declare-fun e!198030 () SeekEntryResult!2823)

(assert (=> b!318749 (= e!198030 (Intermediate!2823 true lt!155416 (bvadd #b00000000000000000000000000000001 x!1427)))))

(declare-fun b!318745 () Bool)

(assert (=> b!318745 (= e!198030 e!198029)))

(declare-fun c!50359 () Bool)

(declare-fun lt!155455 () (_ BitVec 64))

(assert (=> b!318745 (= c!50359 (or (= lt!155455 k0!2441) (= (bvadd lt!155455 lt!155455) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!69253 () Bool)

(assert (=> d!69253 e!198033))

(declare-fun c!50361 () Bool)

(assert (=> d!69253 (= c!50361 (and ((_ is Intermediate!2823) lt!155456) (undefined!3635 lt!155456)))))

(assert (=> d!69253 (= lt!155456 e!198030)))

(declare-fun c!50360 () Bool)

(assert (=> d!69253 (= c!50360 (bvsge (bvadd #b00000000000000000000000000000001 x!1427) #b01111111111111111111111111111110))))

(assert (=> d!69253 (= lt!155455 (select (arr!7683 a!3293) lt!155416))))

(assert (=> d!69253 (validMask!0 mask!3709)))

(assert (=> d!69253 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!155416 k0!2441 a!3293 mask!3709) lt!155456)))

(assert (= (and d!69253 c!50360) b!318749))

(assert (= (and d!69253 (not c!50360)) b!318745))

(assert (= (and b!318745 c!50359) b!318741))

(assert (= (and b!318745 (not c!50359)) b!318746))

(assert (= (and d!69253 c!50361) b!318748))

(assert (= (and d!69253 (not c!50361)) b!318747))

(assert (= (and b!318747 res!173268) b!318744))

(assert (= (and b!318744 (not res!173266)) b!318743))

(assert (= (and b!318743 (not res!173267)) b!318742))

(declare-fun m!327413 () Bool)

(assert (=> b!318743 m!327413))

(declare-fun m!327415 () Bool)

(assert (=> b!318746 m!327415))

(assert (=> b!318746 m!327415))

(declare-fun m!327417 () Bool)

(assert (=> b!318746 m!327417))

(assert (=> b!318744 m!327413))

(assert (=> b!318742 m!327413))

(declare-fun m!327419 () Bool)

(assert (=> d!69253 m!327419))

(assert (=> d!69253 m!327313))

(assert (=> b!318609 d!69253))

(declare-fun d!69255 () Bool)

(declare-fun lt!155459 () (_ BitVec 32))

(assert (=> d!69255 (and (bvsge lt!155459 #b00000000000000000000000000000000) (bvslt lt!155459 (bvadd mask!3709 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!69255 (= lt!155459 (choose!52 index!1781 x!1427 mask!3709))))

(assert (=> d!69255 (validMask!0 mask!3709)))

(assert (=> d!69255 (= (nextIndex!0 index!1781 x!1427 mask!3709) lt!155459)))

(declare-fun bs!11110 () Bool)

(assert (= bs!11110 d!69255))

(declare-fun m!327421 () Bool)

(assert (=> bs!11110 m!327421))

(assert (=> bs!11110 m!327313))

(assert (=> b!318609 d!69255))

(declare-fun b!318779 () Bool)

(declare-fun e!198054 () Bool)

(declare-fun call!26032 () Bool)

(assert (=> b!318779 (= e!198054 call!26032)))

(declare-fun d!69257 () Bool)

(declare-fun res!173284 () Bool)

(declare-fun e!198056 () Bool)

(assert (=> d!69257 (=> res!173284 e!198056)))

(assert (=> d!69257 (= res!173284 (bvsge #b00000000000000000000000000000000 (size!8035 a!3293)))))

(assert (=> d!69257 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709) e!198056)))

(declare-fun b!318780 () Bool)

(declare-fun e!198055 () Bool)

(assert (=> b!318780 (= e!198055 call!26032)))

(declare-fun b!318781 () Bool)

(assert (=> b!318781 (= e!198056 e!198054)))

(declare-fun c!50370 () Bool)

(assert (=> b!318781 (= c!50370 (validKeyInArray!0 (select (arr!7683 a!3293) #b00000000000000000000000000000000)))))

(declare-fun bm!26029 () Bool)

(assert (=> bm!26029 (= call!26032 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3293 mask!3709))))

(declare-fun b!318782 () Bool)

(assert (=> b!318782 (= e!198054 e!198055)))

(declare-fun lt!155485 () (_ BitVec 64))

(assert (=> b!318782 (= lt!155485 (select (arr!7683 a!3293) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9798 0))(
  ( (Unit!9799) )
))
(declare-fun lt!155483 () Unit!9798)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!16235 (_ BitVec 64) (_ BitVec 32)) Unit!9798)

(assert (=> b!318782 (= lt!155483 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3293 lt!155485 #b00000000000000000000000000000000))))

(assert (=> b!318782 (arrayContainsKey!0 a!3293 lt!155485 #b00000000000000000000000000000000)))

(declare-fun lt!155484 () Unit!9798)

(assert (=> b!318782 (= lt!155484 lt!155483)))

(declare-fun res!173283 () Bool)

(assert (=> b!318782 (= res!173283 (= (seekEntryOrOpen!0 (select (arr!7683 a!3293) #b00000000000000000000000000000000) a!3293 mask!3709) (Found!2823 #b00000000000000000000000000000000)))))

(assert (=> b!318782 (=> (not res!173283) (not e!198055))))

(assert (= (and d!69257 (not res!173284)) b!318781))

(assert (= (and b!318781 c!50370) b!318782))

(assert (= (and b!318781 (not c!50370)) b!318779))

(assert (= (and b!318782 res!173283) b!318780))

(assert (= (or b!318780 b!318779) bm!26029))

(assert (=> b!318781 m!327377))

(assert (=> b!318781 m!327377))

(declare-fun m!327441 () Bool)

(assert (=> b!318781 m!327441))

(declare-fun m!327443 () Bool)

(assert (=> bm!26029 m!327443))

(assert (=> b!318782 m!327377))

(declare-fun m!327445 () Bool)

(assert (=> b!318782 m!327445))

(declare-fun m!327447 () Bool)

(assert (=> b!318782 m!327447))

(assert (=> b!318782 m!327377))

(declare-fun m!327449 () Bool)

(assert (=> b!318782 m!327449))

(assert (=> b!318605 d!69257))

(declare-fun b!318783 () Bool)

(declare-fun e!198057 () SeekEntryResult!2823)

(assert (=> b!318783 (= e!198057 (Intermediate!2823 false index!1781 x!1427))))

(declare-fun b!318784 () Bool)

(declare-fun lt!155487 () SeekEntryResult!2823)

(assert (=> b!318784 (and (bvsge (index!13470 lt!155487) #b00000000000000000000000000000000) (bvslt (index!13470 lt!155487) (size!8035 lt!155418)))))

(declare-fun e!198059 () Bool)

(assert (=> b!318784 (= e!198059 (= (select (arr!7683 lt!155418) (index!13470 lt!155487)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!318785 () Bool)

(assert (=> b!318785 (and (bvsge (index!13470 lt!155487) #b00000000000000000000000000000000) (bvslt (index!13470 lt!155487) (size!8035 lt!155418)))))

(declare-fun res!173286 () Bool)

(assert (=> b!318785 (= res!173286 (= (select (arr!7683 lt!155418) (index!13470 lt!155487)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!318785 (=> res!173286 e!198059)))

(declare-fun b!318786 () Bool)

(assert (=> b!318786 (and (bvsge (index!13470 lt!155487) #b00000000000000000000000000000000) (bvslt (index!13470 lt!155487) (size!8035 lt!155418)))))

(declare-fun res!173285 () Bool)

(assert (=> b!318786 (= res!173285 (= (select (arr!7683 lt!155418) (index!13470 lt!155487)) k0!2441))))

(assert (=> b!318786 (=> res!173285 e!198059)))

(declare-fun e!198060 () Bool)

(assert (=> b!318786 (= e!198060 e!198059)))

(declare-fun b!318788 () Bool)

(assert (=> b!318788 (= e!198057 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1427 #b00000000000000000000000000000001) (nextIndex!0 index!1781 x!1427 mask!3709) k0!2441 lt!155418 mask!3709))))

(declare-fun b!318789 () Bool)

(declare-fun e!198061 () Bool)

(assert (=> b!318789 (= e!198061 e!198060)))

(declare-fun res!173287 () Bool)

(assert (=> b!318789 (= res!173287 (and ((_ is Intermediate!2823) lt!155487) (not (undefined!3635 lt!155487)) (bvslt (x!31720 lt!155487) #b01111111111111111111111111111110) (bvsge (x!31720 lt!155487) #b00000000000000000000000000000000) (bvsge (x!31720 lt!155487) x!1427)))))

(assert (=> b!318789 (=> (not res!173287) (not e!198060))))

(declare-fun b!318790 () Bool)

(assert (=> b!318790 (= e!198061 (bvsge (x!31720 lt!155487) #b01111111111111111111111111111110))))

(declare-fun b!318791 () Bool)

(declare-fun e!198058 () SeekEntryResult!2823)

(assert (=> b!318791 (= e!198058 (Intermediate!2823 true index!1781 x!1427))))

(declare-fun b!318787 () Bool)

(assert (=> b!318787 (= e!198058 e!198057)))

(declare-fun c!50371 () Bool)

(declare-fun lt!155486 () (_ BitVec 64))

(assert (=> b!318787 (= c!50371 (or (= lt!155486 k0!2441) (= (bvadd lt!155486 lt!155486) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!69271 () Bool)

(assert (=> d!69271 e!198061))

(declare-fun c!50373 () Bool)

(assert (=> d!69271 (= c!50373 (and ((_ is Intermediate!2823) lt!155487) (undefined!3635 lt!155487)))))

(assert (=> d!69271 (= lt!155487 e!198058)))

(declare-fun c!50372 () Bool)

(assert (=> d!69271 (= c!50372 (bvsge x!1427 #b01111111111111111111111111111110))))

(assert (=> d!69271 (= lt!155486 (select (arr!7683 lt!155418) index!1781))))

(assert (=> d!69271 (validMask!0 mask!3709)))

(assert (=> d!69271 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 lt!155418 mask!3709) lt!155487)))

(assert (= (and d!69271 c!50372) b!318791))

(assert (= (and d!69271 (not c!50372)) b!318787))

(assert (= (and b!318787 c!50371) b!318783))

(assert (= (and b!318787 (not c!50371)) b!318788))

(assert (= (and d!69271 c!50373) b!318790))

(assert (= (and d!69271 (not c!50373)) b!318789))

(assert (= (and b!318789 res!173287) b!318786))

(assert (= (and b!318786 (not res!173285)) b!318785))

(assert (= (and b!318785 (not res!173286)) b!318784))

(declare-fun m!327451 () Bool)

(assert (=> b!318785 m!327451))

(assert (=> b!318788 m!327331))

(assert (=> b!318788 m!327331))

(declare-fun m!327453 () Bool)

(assert (=> b!318788 m!327453))

(assert (=> b!318786 m!327451))

(assert (=> b!318784 m!327451))

(declare-fun m!327455 () Bool)

(assert (=> d!69271 m!327455))

(assert (=> d!69271 m!327313))

(assert (=> b!318610 d!69271))

(declare-fun b!318792 () Bool)

(declare-fun e!198062 () SeekEntryResult!2823)

(assert (=> b!318792 (= e!198062 (Intermediate!2823 false lt!155416 (bvadd #b00000000000000000000000000000001 x!1427)))))

(declare-fun b!318793 () Bool)

(declare-fun lt!155489 () SeekEntryResult!2823)

(assert (=> b!318793 (and (bvsge (index!13470 lt!155489) #b00000000000000000000000000000000) (bvslt (index!13470 lt!155489) (size!8035 lt!155418)))))

(declare-fun e!198064 () Bool)

(assert (=> b!318793 (= e!198064 (= (select (arr!7683 lt!155418) (index!13470 lt!155489)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!318794 () Bool)

(assert (=> b!318794 (and (bvsge (index!13470 lt!155489) #b00000000000000000000000000000000) (bvslt (index!13470 lt!155489) (size!8035 lt!155418)))))

(declare-fun res!173289 () Bool)

(assert (=> b!318794 (= res!173289 (= (select (arr!7683 lt!155418) (index!13470 lt!155489)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!318794 (=> res!173289 e!198064)))

(declare-fun b!318795 () Bool)

(assert (=> b!318795 (and (bvsge (index!13470 lt!155489) #b00000000000000000000000000000000) (bvslt (index!13470 lt!155489) (size!8035 lt!155418)))))

(declare-fun res!173288 () Bool)

(assert (=> b!318795 (= res!173288 (= (select (arr!7683 lt!155418) (index!13470 lt!155489)) k0!2441))))

(assert (=> b!318795 (=> res!173288 e!198064)))

(declare-fun e!198065 () Bool)

(assert (=> b!318795 (= e!198065 e!198064)))

(declare-fun b!318797 () Bool)

(assert (=> b!318797 (= e!198062 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427 #b00000000000000000000000000000001) (nextIndex!0 lt!155416 (bvadd #b00000000000000000000000000000001 x!1427) mask!3709) k0!2441 lt!155418 mask!3709))))

(declare-fun b!318798 () Bool)

(declare-fun e!198066 () Bool)

(assert (=> b!318798 (= e!198066 e!198065)))

(declare-fun res!173290 () Bool)

(assert (=> b!318798 (= res!173290 (and ((_ is Intermediate!2823) lt!155489) (not (undefined!3635 lt!155489)) (bvslt (x!31720 lt!155489) #b01111111111111111111111111111110) (bvsge (x!31720 lt!155489) #b00000000000000000000000000000000) (bvsge (x!31720 lt!155489) (bvadd #b00000000000000000000000000000001 x!1427))))))

(assert (=> b!318798 (=> (not res!173290) (not e!198065))))

(declare-fun b!318799 () Bool)

(assert (=> b!318799 (= e!198066 (bvsge (x!31720 lt!155489) #b01111111111111111111111111111110))))

(declare-fun b!318800 () Bool)

(declare-fun e!198063 () SeekEntryResult!2823)

(assert (=> b!318800 (= e!198063 (Intermediate!2823 true lt!155416 (bvadd #b00000000000000000000000000000001 x!1427)))))

(declare-fun b!318796 () Bool)

(assert (=> b!318796 (= e!198063 e!198062)))

(declare-fun c!50374 () Bool)

(declare-fun lt!155488 () (_ BitVec 64))

(assert (=> b!318796 (= c!50374 (or (= lt!155488 k0!2441) (= (bvadd lt!155488 lt!155488) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!69273 () Bool)

(assert (=> d!69273 e!198066))

(declare-fun c!50376 () Bool)

(assert (=> d!69273 (= c!50376 (and ((_ is Intermediate!2823) lt!155489) (undefined!3635 lt!155489)))))

(assert (=> d!69273 (= lt!155489 e!198063)))

(declare-fun c!50375 () Bool)

(assert (=> d!69273 (= c!50375 (bvsge (bvadd #b00000000000000000000000000000001 x!1427) #b01111111111111111111111111111110))))

(assert (=> d!69273 (= lt!155488 (select (arr!7683 lt!155418) lt!155416))))

(assert (=> d!69273 (validMask!0 mask!3709)))

(assert (=> d!69273 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!155416 k0!2441 lt!155418 mask!3709) lt!155489)))

(assert (= (and d!69273 c!50375) b!318800))

(assert (= (and d!69273 (not c!50375)) b!318796))

(assert (= (and b!318796 c!50374) b!318792))

(assert (= (and b!318796 (not c!50374)) b!318797))

(assert (= (and d!69273 c!50376) b!318799))

(assert (= (and d!69273 (not c!50376)) b!318798))

(assert (= (and b!318798 res!173290) b!318795))

(assert (= (and b!318795 (not res!173288)) b!318794))

(assert (= (and b!318794 (not res!173289)) b!318793))

(declare-fun m!327457 () Bool)

(assert (=> b!318794 m!327457))

(assert (=> b!318797 m!327415))

(assert (=> b!318797 m!327415))

(declare-fun m!327459 () Bool)

(assert (=> b!318797 m!327459))

(assert (=> b!318795 m!327457))

(assert (=> b!318793 m!327457))

(declare-fun m!327461 () Bool)

(assert (=> d!69273 m!327461))

(assert (=> d!69273 m!327313))

(assert (=> b!318610 d!69273))

(declare-fun e!198118 () SeekEntryResult!2823)

(declare-fun b!318891 () Bool)

(declare-fun lt!155528 () SeekEntryResult!2823)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16235 (_ BitVec 32)) SeekEntryResult!2823)

(assert (=> b!318891 (= e!198118 (seekKeyOrZeroReturnVacant!0 (x!31720 lt!155528) (index!13470 lt!155528) (index!13470 lt!155528) k0!2441 a!3293 mask!3709))))

(declare-fun b!318892 () Bool)

(declare-fun c!50415 () Bool)

(declare-fun lt!155530 () (_ BitVec 64))

(assert (=> b!318892 (= c!50415 (= lt!155530 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!198119 () SeekEntryResult!2823)

(assert (=> b!318892 (= e!198119 e!198118)))

(declare-fun b!318893 () Bool)

(assert (=> b!318893 (= e!198118 (MissingZero!2823 (index!13470 lt!155528)))))

(declare-fun b!318894 () Bool)

(declare-fun e!198117 () SeekEntryResult!2823)

(assert (=> b!318894 (= e!198117 Undefined!2823)))

(declare-fun d!69275 () Bool)

(declare-fun lt!155529 () SeekEntryResult!2823)

(assert (=> d!69275 (and (or ((_ is Undefined!2823) lt!155529) (not ((_ is Found!2823) lt!155529)) (and (bvsge (index!13469 lt!155529) #b00000000000000000000000000000000) (bvslt (index!13469 lt!155529) (size!8035 a!3293)))) (or ((_ is Undefined!2823) lt!155529) ((_ is Found!2823) lt!155529) (not ((_ is MissingZero!2823) lt!155529)) (and (bvsge (index!13468 lt!155529) #b00000000000000000000000000000000) (bvslt (index!13468 lt!155529) (size!8035 a!3293)))) (or ((_ is Undefined!2823) lt!155529) ((_ is Found!2823) lt!155529) ((_ is MissingZero!2823) lt!155529) (not ((_ is MissingVacant!2823) lt!155529)) (and (bvsge (index!13471 lt!155529) #b00000000000000000000000000000000) (bvslt (index!13471 lt!155529) (size!8035 a!3293)))) (or ((_ is Undefined!2823) lt!155529) (ite ((_ is Found!2823) lt!155529) (= (select (arr!7683 a!3293) (index!13469 lt!155529)) k0!2441) (ite ((_ is MissingZero!2823) lt!155529) (= (select (arr!7683 a!3293) (index!13468 lt!155529)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!2823) lt!155529) (= (select (arr!7683 a!3293) (index!13471 lt!155529)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!69275 (= lt!155529 e!198117)))

(declare-fun c!50414 () Bool)

(assert (=> d!69275 (= c!50414 (and ((_ is Intermediate!2823) lt!155528) (undefined!3635 lt!155528)))))

(assert (=> d!69275 (= lt!155528 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709))))

(assert (=> d!69275 (validMask!0 mask!3709)))

(assert (=> d!69275 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) lt!155529)))

(declare-fun b!318895 () Bool)

(assert (=> b!318895 (= e!198117 e!198119)))

(assert (=> b!318895 (= lt!155530 (select (arr!7683 a!3293) (index!13470 lt!155528)))))

(declare-fun c!50413 () Bool)

(assert (=> b!318895 (= c!50413 (= lt!155530 k0!2441))))

(declare-fun b!318896 () Bool)

(assert (=> b!318896 (= e!198119 (Found!2823 (index!13470 lt!155528)))))

(assert (= (and d!69275 c!50414) b!318894))

(assert (= (and d!69275 (not c!50414)) b!318895))

(assert (= (and b!318895 c!50413) b!318896))

(assert (= (and b!318895 (not c!50413)) b!318892))

(assert (= (and b!318892 c!50415) b!318893))

(assert (= (and b!318892 (not c!50415)) b!318891))

(declare-fun m!327507 () Bool)

(assert (=> b!318891 m!327507))

(assert (=> d!69275 m!327325))

(assert (=> d!69275 m!327325))

(assert (=> d!69275 m!327327))

(declare-fun m!327509 () Bool)

(assert (=> d!69275 m!327509))

(assert (=> d!69275 m!327313))

(declare-fun m!327511 () Bool)

(assert (=> d!69275 m!327511))

(declare-fun m!327513 () Bool)

(assert (=> d!69275 m!327513))

(declare-fun m!327515 () Bool)

(assert (=> b!318895 m!327515))

(assert (=> b!318611 d!69275))

(declare-fun b!318897 () Bool)

(declare-fun e!198120 () SeekEntryResult!2823)

(assert (=> b!318897 (= e!198120 (Intermediate!2823 false (toIndex!0 k0!2441 mask!3709) #b00000000000000000000000000000000))))

(declare-fun b!318898 () Bool)

(declare-fun lt!155532 () SeekEntryResult!2823)

(assert (=> b!318898 (and (bvsge (index!13470 lt!155532) #b00000000000000000000000000000000) (bvslt (index!13470 lt!155532) (size!8035 a!3293)))))

(declare-fun e!198122 () Bool)

(assert (=> b!318898 (= e!198122 (= (select (arr!7683 a!3293) (index!13470 lt!155532)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!318899 () Bool)

(assert (=> b!318899 (and (bvsge (index!13470 lt!155532) #b00000000000000000000000000000000) (bvslt (index!13470 lt!155532) (size!8035 a!3293)))))

(declare-fun res!173311 () Bool)

(assert (=> b!318899 (= res!173311 (= (select (arr!7683 a!3293) (index!13470 lt!155532)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!318899 (=> res!173311 e!198122)))

(declare-fun b!318900 () Bool)

(assert (=> b!318900 (and (bvsge (index!13470 lt!155532) #b00000000000000000000000000000000) (bvslt (index!13470 lt!155532) (size!8035 a!3293)))))

(declare-fun res!173310 () Bool)

(assert (=> b!318900 (= res!173310 (= (select (arr!7683 a!3293) (index!13470 lt!155532)) k0!2441))))

(assert (=> b!318900 (=> res!173310 e!198122)))

(declare-fun e!198123 () Bool)

(assert (=> b!318900 (= e!198123 e!198122)))

(declare-fun b!318902 () Bool)

(assert (=> b!318902 (= e!198120 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k0!2441 mask!3709) #b00000000000000000000000000000000 mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun b!318903 () Bool)

(declare-fun e!198124 () Bool)

(assert (=> b!318903 (= e!198124 e!198123)))

(declare-fun res!173312 () Bool)

(assert (=> b!318903 (= res!173312 (and ((_ is Intermediate!2823) lt!155532) (not (undefined!3635 lt!155532)) (bvslt (x!31720 lt!155532) #b01111111111111111111111111111110) (bvsge (x!31720 lt!155532) #b00000000000000000000000000000000) (bvsge (x!31720 lt!155532) #b00000000000000000000000000000000)))))

(assert (=> b!318903 (=> (not res!173312) (not e!198123))))

(declare-fun b!318904 () Bool)

(assert (=> b!318904 (= e!198124 (bvsge (x!31720 lt!155532) #b01111111111111111111111111111110))))

(declare-fun b!318905 () Bool)

(declare-fun e!198121 () SeekEntryResult!2823)

(assert (=> b!318905 (= e!198121 (Intermediate!2823 true (toIndex!0 k0!2441 mask!3709) #b00000000000000000000000000000000))))

(declare-fun b!318901 () Bool)

(assert (=> b!318901 (= e!198121 e!198120)))

(declare-fun c!50416 () Bool)

(declare-fun lt!155531 () (_ BitVec 64))

(assert (=> b!318901 (= c!50416 (or (= lt!155531 k0!2441) (= (bvadd lt!155531 lt!155531) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!69295 () Bool)

(assert (=> d!69295 e!198124))

(declare-fun c!50418 () Bool)

(assert (=> d!69295 (= c!50418 (and ((_ is Intermediate!2823) lt!155532) (undefined!3635 lt!155532)))))

(assert (=> d!69295 (= lt!155532 e!198121)))

(declare-fun c!50417 () Bool)

(assert (=> d!69295 (= c!50417 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!69295 (= lt!155531 (select (arr!7683 a!3293) (toIndex!0 k0!2441 mask!3709)))))

(assert (=> d!69295 (validMask!0 mask!3709)))

(assert (=> d!69295 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!155532)))

(assert (= (and d!69295 c!50417) b!318905))

(assert (= (and d!69295 (not c!50417)) b!318901))

(assert (= (and b!318901 c!50416) b!318897))

(assert (= (and b!318901 (not c!50416)) b!318902))

(assert (= (and d!69295 c!50418) b!318904))

(assert (= (and d!69295 (not c!50418)) b!318903))

(assert (= (and b!318903 res!173312) b!318900))

(assert (= (and b!318900 (not res!173310)) b!318899))

(assert (= (and b!318899 (not res!173311)) b!318898))

(declare-fun m!327517 () Bool)

(assert (=> b!318899 m!327517))

(assert (=> b!318902 m!327325))

(declare-fun m!327519 () Bool)

(assert (=> b!318902 m!327519))

(assert (=> b!318902 m!327519))

(declare-fun m!327521 () Bool)

(assert (=> b!318902 m!327521))

(assert (=> b!318900 m!327517))

(assert (=> b!318898 m!327517))

(assert (=> d!69295 m!327325))

(declare-fun m!327523 () Bool)

(assert (=> d!69295 m!327523))

(assert (=> d!69295 m!327313))

(assert (=> b!318607 d!69295))

(declare-fun d!69297 () Bool)

(declare-fun lt!155553 () (_ BitVec 32))

(declare-fun lt!155552 () (_ BitVec 32))

(assert (=> d!69297 (= lt!155553 (bvmul (bvxor lt!155552 (bvlshr lt!155552 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!69297 (= lt!155552 ((_ extract 31 0) (bvand (bvxor k0!2441 (bvlshr k0!2441 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!69297 (and (bvsge mask!3709 #b00000000000000000000000000000000) (let ((res!173313 (let ((h!5381 ((_ extract 31 0) (bvand (bvxor k0!2441 (bvlshr k0!2441 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!31730 (bvmul (bvxor h!5381 (bvlshr h!5381 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!31730 (bvlshr x!31730 #b00000000000000000000000000001101)) mask!3709))))) (and (bvslt res!173313 (bvadd mask!3709 #b00000000000000000000000000000001)) (bvsge res!173313 #b00000000000000000000000000000000))))))

(assert (=> d!69297 (= (toIndex!0 k0!2441 mask!3709) (bvand (bvxor lt!155553 (bvlshr lt!155553 #b00000000000000000000000000001101)) mask!3709))))

(assert (=> b!318607 d!69297))

(check-sat (not d!69255) (not b!318797) (not b!318781) (not b!318735) (not d!69271) (not b!318782) (not d!69241) (not b!318647) (not b!318788) (not bm!26029) (not b!318902) (not b!318746) (not b!318891) (not d!69253) (not d!69273) (not d!69295) (not d!69275))
(check-sat)
