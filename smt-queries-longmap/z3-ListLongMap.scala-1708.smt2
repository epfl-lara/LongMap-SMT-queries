; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31368 () Bool)

(assert start!31368)

(declare-fun b!314261 () Bool)

(declare-fun e!195697 () Bool)

(declare-fun e!195696 () Bool)

(assert (=> b!314261 (= e!195697 e!195696)))

(declare-fun res!170163 () Bool)

(assert (=> b!314261 (=> (not res!170163) (not e!195696))))

(declare-datatypes ((array!16043 0))(
  ( (array!16044 (arr!7596 (Array (_ BitVec 32) (_ BitVec 64))) (size!7949 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!16043)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!2735 0))(
  ( (MissingZero!2735 (index!13116 (_ BitVec 32))) (Found!2735 (index!13117 (_ BitVec 32))) (Intermediate!2735 (undefined!3547 Bool) (index!13118 (_ BitVec 32)) (x!31360 (_ BitVec 32))) (Undefined!2735) (MissingVacant!2735 (index!13119 (_ BitVec 32))) )
))
(declare-fun lt!153686 () SeekEntryResult!2735)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16043 (_ BitVec 32)) SeekEntryResult!2735)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!314261 (= res!170163 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!153686))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!314261 (= lt!153686 (Intermediate!2735 false resIndex!52 resX!52))))

(declare-fun res!170158 () Bool)

(assert (=> start!31368 (=> (not res!170158) (not e!195697))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31368 (= res!170158 (validMask!0 mask!3709))))

(assert (=> start!31368 e!195697))

(declare-fun array_inv!5568 (array!16043) Bool)

(assert (=> start!31368 (array_inv!5568 a!3293)))

(assert (=> start!31368 true))

(declare-fun b!314262 () Bool)

(declare-fun res!170162 () Bool)

(assert (=> b!314262 (=> (not res!170162) (not e!195697))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16043 (_ BitVec 32)) Bool)

(assert (=> b!314262 (= res!170162 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!314263 () Bool)

(declare-fun res!170161 () Bool)

(assert (=> b!314263 (=> (not res!170161) (not e!195697))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!314263 (= res!170161 (and (= (size!7949 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7949 a!3293))))))

(declare-fun b!314264 () Bool)

(declare-fun res!170160 () Bool)

(assert (=> b!314264 (=> (not res!170160) (not e!195696))))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!314264 (= res!170160 (and (= (select (arr!7596 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7949 a!3293))))))

(declare-fun b!314265 () Bool)

(declare-fun res!170157 () Bool)

(assert (=> b!314265 (=> (not res!170157) (not e!195697))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16043 (_ BitVec 32)) SeekEntryResult!2735)

(assert (=> b!314265 (= res!170157 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2735 i!1240)))))

(declare-fun b!314266 () Bool)

(declare-fun res!170159 () Bool)

(assert (=> b!314266 (=> (not res!170159) (not e!195697))))

(declare-fun arrayContainsKey!0 (array!16043 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!314266 (= res!170159 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!314267 () Bool)

(declare-fun lt!153685 () SeekEntryResult!2735)

(assert (=> b!314267 (= e!195696 (and (= lt!153685 lt!153686) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7596 a!3293) index!1781) k0!2441)) (= x!1427 resX!52) (not (= resIndex!52 index!1781)) (or (= (select (arr!7596 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7596 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!153685 (Intermediate!2735 false index!1781 resX!52)))))))

(assert (=> b!314267 (= lt!153685 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!314268 () Bool)

(declare-fun res!170156 () Bool)

(assert (=> b!314268 (=> (not res!170156) (not e!195697))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!314268 (= res!170156 (validKeyInArray!0 k0!2441))))

(assert (= (and start!31368 res!170158) b!314263))

(assert (= (and b!314263 res!170161) b!314268))

(assert (= (and b!314268 res!170156) b!314266))

(assert (= (and b!314266 res!170159) b!314265))

(assert (= (and b!314265 res!170157) b!314262))

(assert (= (and b!314262 res!170162) b!314261))

(assert (= (and b!314261 res!170163) b!314264))

(assert (= (and b!314264 res!170160) b!314267))

(declare-fun m!323347 () Bool)

(assert (=> b!314267 m!323347))

(declare-fun m!323349 () Bool)

(assert (=> b!314267 m!323349))

(declare-fun m!323351 () Bool)

(assert (=> b!314266 m!323351))

(declare-fun m!323353 () Bool)

(assert (=> start!31368 m!323353))

(declare-fun m!323355 () Bool)

(assert (=> start!31368 m!323355))

(declare-fun m!323357 () Bool)

(assert (=> b!314264 m!323357))

(declare-fun m!323359 () Bool)

(assert (=> b!314261 m!323359))

(assert (=> b!314261 m!323359))

(declare-fun m!323361 () Bool)

(assert (=> b!314261 m!323361))

(declare-fun m!323363 () Bool)

(assert (=> b!314268 m!323363))

(declare-fun m!323365 () Bool)

(assert (=> b!314265 m!323365))

(declare-fun m!323367 () Bool)

(assert (=> b!314262 m!323367))

(check-sat (not b!314268) (not b!314261) (not b!314267) (not b!314266) (not b!314265) (not b!314262) (not start!31368))
(check-sat)
(get-model)

(declare-fun b!314335 () Bool)

(declare-fun lt!153703 () SeekEntryResult!2735)

(assert (=> b!314335 (and (bvsge (index!13118 lt!153703) #b00000000000000000000000000000000) (bvslt (index!13118 lt!153703) (size!7949 a!3293)))))

(declare-fun res!170218 () Bool)

(assert (=> b!314335 (= res!170218 (= (select (arr!7596 a!3293) (index!13118 lt!153703)) k0!2441))))

(declare-fun e!195729 () Bool)

(assert (=> b!314335 (=> res!170218 e!195729)))

(declare-fun e!195728 () Bool)

(assert (=> b!314335 (= e!195728 e!195729)))

(declare-fun b!314336 () Bool)

(assert (=> b!314336 (and (bvsge (index!13118 lt!153703) #b00000000000000000000000000000000) (bvslt (index!13118 lt!153703) (size!7949 a!3293)))))

(assert (=> b!314336 (= e!195729 (= (select (arr!7596 a!3293) (index!13118 lt!153703)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!314337 () Bool)

(declare-fun e!195727 () SeekEntryResult!2735)

(assert (=> b!314337 (= e!195727 (Intermediate!2735 true (toIndex!0 k0!2441 mask!3709) #b00000000000000000000000000000000))))

(declare-fun b!314338 () Bool)

(assert (=> b!314338 (and (bvsge (index!13118 lt!153703) #b00000000000000000000000000000000) (bvslt (index!13118 lt!153703) (size!7949 a!3293)))))

(declare-fun res!170220 () Bool)

(assert (=> b!314338 (= res!170220 (= (select (arr!7596 a!3293) (index!13118 lt!153703)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!314338 (=> res!170220 e!195729)))

(declare-fun b!314339 () Bool)

(declare-fun e!195731 () SeekEntryResult!2735)

(assert (=> b!314339 (= e!195731 (Intermediate!2735 false (toIndex!0 k0!2441 mask!3709) #b00000000000000000000000000000000))))

(declare-fun b!314340 () Bool)

(assert (=> b!314340 (= e!195727 e!195731)))

(declare-fun c!49671 () Bool)

(declare-fun lt!153704 () (_ BitVec 64))

(assert (=> b!314340 (= c!49671 (or (= lt!153704 k0!2441) (= (bvadd lt!153704 lt!153704) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!314341 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!314341 (= e!195731 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k0!2441 mask!3709) #b00000000000000000000000000000000 mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun b!314342 () Bool)

(declare-fun e!195730 () Bool)

(assert (=> b!314342 (= e!195730 (bvsge (x!31360 lt!153703) #b01111111111111111111111111111110))))

(declare-fun d!68565 () Bool)

(assert (=> d!68565 e!195730))

(declare-fun c!49672 () Bool)

(get-info :version)

(assert (=> d!68565 (= c!49672 (and ((_ is Intermediate!2735) lt!153703) (undefined!3547 lt!153703)))))

(assert (=> d!68565 (= lt!153703 e!195727)))

(declare-fun c!49673 () Bool)

(assert (=> d!68565 (= c!49673 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!68565 (= lt!153704 (select (arr!7596 a!3293) (toIndex!0 k0!2441 mask!3709)))))

(assert (=> d!68565 (validMask!0 mask!3709)))

(assert (=> d!68565 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!153703)))

(declare-fun b!314343 () Bool)

(assert (=> b!314343 (= e!195730 e!195728)))

(declare-fun res!170219 () Bool)

(assert (=> b!314343 (= res!170219 (and ((_ is Intermediate!2735) lt!153703) (not (undefined!3547 lt!153703)) (bvslt (x!31360 lt!153703) #b01111111111111111111111111111110) (bvsge (x!31360 lt!153703) #b00000000000000000000000000000000) (bvsge (x!31360 lt!153703) #b00000000000000000000000000000000)))))

(assert (=> b!314343 (=> (not res!170219) (not e!195728))))

(assert (= (and d!68565 c!49673) b!314337))

(assert (= (and d!68565 (not c!49673)) b!314340))

(assert (= (and b!314340 c!49671) b!314339))

(assert (= (and b!314340 (not c!49671)) b!314341))

(assert (= (and d!68565 c!49672) b!314342))

(assert (= (and d!68565 (not c!49672)) b!314343))

(assert (= (and b!314343 res!170219) b!314335))

(assert (= (and b!314335 (not res!170218)) b!314338))

(assert (= (and b!314338 (not res!170220)) b!314336))

(declare-fun m!323413 () Bool)

(assert (=> b!314336 m!323413))

(assert (=> d!68565 m!323359))

(declare-fun m!323415 () Bool)

(assert (=> d!68565 m!323415))

(assert (=> d!68565 m!323353))

(assert (=> b!314338 m!323413))

(assert (=> b!314335 m!323413))

(assert (=> b!314341 m!323359))

(declare-fun m!323417 () Bool)

(assert (=> b!314341 m!323417))

(assert (=> b!314341 m!323417))

(declare-fun m!323419 () Bool)

(assert (=> b!314341 m!323419))

(assert (=> b!314261 d!68565))

(declare-fun d!68571 () Bool)

(declare-fun lt!153710 () (_ BitVec 32))

(declare-fun lt!153709 () (_ BitVec 32))

(assert (=> d!68571 (= lt!153710 (bvmul (bvxor lt!153709 (bvlshr lt!153709 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!68571 (= lt!153709 ((_ extract 31 0) (bvand (bvxor k0!2441 (bvlshr k0!2441 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!68571 (and (bvsge mask!3709 #b00000000000000000000000000000000) (let ((res!170221 (let ((h!5329 ((_ extract 31 0) (bvand (bvxor k0!2441 (bvlshr k0!2441 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!31364 (bvmul (bvxor h!5329 (bvlshr h!5329 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!31364 (bvlshr x!31364 #b00000000000000000000000000001101)) mask!3709))))) (and (bvslt res!170221 (bvadd mask!3709 #b00000000000000000000000000000001)) (bvsge res!170221 #b00000000000000000000000000000000))))))

(assert (=> d!68571 (= (toIndex!0 k0!2441 mask!3709) (bvand (bvxor lt!153710 (bvlshr lt!153710 #b00000000000000000000000000001101)) mask!3709))))

(assert (=> b!314261 d!68571))

(declare-fun d!68573 () Bool)

(declare-fun res!170232 () Bool)

(declare-fun e!195746 () Bool)

(assert (=> d!68573 (=> res!170232 e!195746)))

(assert (=> d!68573 (= res!170232 (= (select (arr!7596 a!3293) #b00000000000000000000000000000000) k0!2441))))

(assert (=> d!68573 (= (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000) e!195746)))

(declare-fun b!314366 () Bool)

(declare-fun e!195747 () Bool)

(assert (=> b!314366 (= e!195746 e!195747)))

(declare-fun res!170233 () Bool)

(assert (=> b!314366 (=> (not res!170233) (not e!195747))))

(assert (=> b!314366 (= res!170233 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7949 a!3293)))))

(declare-fun b!314367 () Bool)

(assert (=> b!314367 (= e!195747 (arrayContainsKey!0 a!3293 k0!2441 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!68573 (not res!170232)) b!314366))

(assert (= (and b!314366 res!170233) b!314367))

(declare-fun m!323421 () Bool)

(assert (=> d!68573 m!323421))

(declare-fun m!323423 () Bool)

(assert (=> b!314367 m!323423))

(assert (=> b!314266 d!68573))

(declare-fun b!314419 () Bool)

(declare-fun e!195780 () SeekEntryResult!2735)

(declare-fun e!195779 () SeekEntryResult!2735)

(assert (=> b!314419 (= e!195780 e!195779)))

(declare-fun lt!153738 () (_ BitVec 64))

(declare-fun lt!153737 () SeekEntryResult!2735)

(assert (=> b!314419 (= lt!153738 (select (arr!7596 a!3293) (index!13118 lt!153737)))))

(declare-fun c!49698 () Bool)

(assert (=> b!314419 (= c!49698 (= lt!153738 k0!2441))))

(declare-fun b!314420 () Bool)

(declare-fun e!195778 () SeekEntryResult!2735)

(assert (=> b!314420 (= e!195778 (MissingZero!2735 (index!13118 lt!153737)))))

(declare-fun b!314422 () Bool)

(assert (=> b!314422 (= e!195780 Undefined!2735)))

(declare-fun b!314423 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16043 (_ BitVec 32)) SeekEntryResult!2735)

(assert (=> b!314423 (= e!195778 (seekKeyOrZeroReturnVacant!0 (x!31360 lt!153737) (index!13118 lt!153737) (index!13118 lt!153737) k0!2441 a!3293 mask!3709))))

(declare-fun b!314424 () Bool)

(assert (=> b!314424 (= e!195779 (Found!2735 (index!13118 lt!153737)))))

(declare-fun d!68579 () Bool)

(declare-fun lt!153736 () SeekEntryResult!2735)

(assert (=> d!68579 (and (or ((_ is Undefined!2735) lt!153736) (not ((_ is Found!2735) lt!153736)) (and (bvsge (index!13117 lt!153736) #b00000000000000000000000000000000) (bvslt (index!13117 lt!153736) (size!7949 a!3293)))) (or ((_ is Undefined!2735) lt!153736) ((_ is Found!2735) lt!153736) (not ((_ is MissingZero!2735) lt!153736)) (and (bvsge (index!13116 lt!153736) #b00000000000000000000000000000000) (bvslt (index!13116 lt!153736) (size!7949 a!3293)))) (or ((_ is Undefined!2735) lt!153736) ((_ is Found!2735) lt!153736) ((_ is MissingZero!2735) lt!153736) (not ((_ is MissingVacant!2735) lt!153736)) (and (bvsge (index!13119 lt!153736) #b00000000000000000000000000000000) (bvslt (index!13119 lt!153736) (size!7949 a!3293)))) (or ((_ is Undefined!2735) lt!153736) (ite ((_ is Found!2735) lt!153736) (= (select (arr!7596 a!3293) (index!13117 lt!153736)) k0!2441) (ite ((_ is MissingZero!2735) lt!153736) (= (select (arr!7596 a!3293) (index!13116 lt!153736)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!2735) lt!153736) (= (select (arr!7596 a!3293) (index!13119 lt!153736)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!68579 (= lt!153736 e!195780)))

(declare-fun c!49699 () Bool)

(assert (=> d!68579 (= c!49699 (and ((_ is Intermediate!2735) lt!153737) (undefined!3547 lt!153737)))))

(assert (=> d!68579 (= lt!153737 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709))))

(assert (=> d!68579 (validMask!0 mask!3709)))

(assert (=> d!68579 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) lt!153736)))

(declare-fun b!314421 () Bool)

(declare-fun c!49700 () Bool)

(assert (=> b!314421 (= c!49700 (= lt!153738 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!314421 (= e!195779 e!195778)))

(assert (= (and d!68579 c!49699) b!314422))

(assert (= (and d!68579 (not c!49699)) b!314419))

(assert (= (and b!314419 c!49698) b!314424))

(assert (= (and b!314419 (not c!49698)) b!314421))

(assert (= (and b!314421 c!49700) b!314420))

(assert (= (and b!314421 (not c!49700)) b!314423))

(declare-fun m!323443 () Bool)

(assert (=> b!314419 m!323443))

(declare-fun m!323445 () Bool)

(assert (=> b!314423 m!323445))

(declare-fun m!323447 () Bool)

(assert (=> d!68579 m!323447))

(assert (=> d!68579 m!323353))

(assert (=> d!68579 m!323359))

(declare-fun m!323449 () Bool)

(assert (=> d!68579 m!323449))

(assert (=> d!68579 m!323359))

(assert (=> d!68579 m!323361))

(declare-fun m!323451 () Bool)

(assert (=> d!68579 m!323451))

(assert (=> b!314265 d!68579))

(declare-fun d!68585 () Bool)

(assert (=> d!68585 (= (validMask!0 mask!3709) (and (or (= mask!3709 #b00000000000000000000000000000111) (= mask!3709 #b00000000000000000000000000001111) (= mask!3709 #b00000000000000000000000000011111) (= mask!3709 #b00000000000000000000000000111111) (= mask!3709 #b00000000000000000000000001111111) (= mask!3709 #b00000000000000000000000011111111) (= mask!3709 #b00000000000000000000000111111111) (= mask!3709 #b00000000000000000000001111111111) (= mask!3709 #b00000000000000000000011111111111) (= mask!3709 #b00000000000000000000111111111111) (= mask!3709 #b00000000000000000001111111111111) (= mask!3709 #b00000000000000000011111111111111) (= mask!3709 #b00000000000000000111111111111111) (= mask!3709 #b00000000000000001111111111111111) (= mask!3709 #b00000000000000011111111111111111) (= mask!3709 #b00000000000000111111111111111111) (= mask!3709 #b00000000000001111111111111111111) (= mask!3709 #b00000000000011111111111111111111) (= mask!3709 #b00000000000111111111111111111111) (= mask!3709 #b00000000001111111111111111111111) (= mask!3709 #b00000000011111111111111111111111) (= mask!3709 #b00000000111111111111111111111111) (= mask!3709 #b00000001111111111111111111111111) (= mask!3709 #b00000011111111111111111111111111) (= mask!3709 #b00000111111111111111111111111111) (= mask!3709 #b00001111111111111111111111111111) (= mask!3709 #b00011111111111111111111111111111) (= mask!3709 #b00111111111111111111111111111111)) (bvsle mask!3709 #b00111111111111111111111111111111)))))

(assert (=> start!31368 d!68585))

(declare-fun d!68601 () Bool)

(assert (=> d!68601 (= (array_inv!5568 a!3293) (bvsge (size!7949 a!3293) #b00000000000000000000000000000000))))

(assert (=> start!31368 d!68601))

(declare-fun d!68603 () Bool)

(assert (=> d!68603 (= (validKeyInArray!0 k0!2441) (and (not (= k0!2441 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2441 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!314268 d!68603))

(declare-fun b!314460 () Bool)

(declare-fun e!195804 () Bool)

(declare-fun e!195803 () Bool)

(assert (=> b!314460 (= e!195804 e!195803)))

(declare-fun c!49712 () Bool)

(assert (=> b!314460 (= c!49712 (validKeyInArray!0 (select (arr!7596 a!3293) #b00000000000000000000000000000000)))))

(declare-fun b!314461 () Bool)

(declare-fun e!195802 () Bool)

(assert (=> b!314461 (= e!195803 e!195802)))

(declare-fun lt!153763 () (_ BitVec 64))

(assert (=> b!314461 (= lt!153763 (select (arr!7596 a!3293) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9655 0))(
  ( (Unit!9656) )
))
(declare-fun lt!153765 () Unit!9655)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!16043 (_ BitVec 64) (_ BitVec 32)) Unit!9655)

(assert (=> b!314461 (= lt!153765 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3293 lt!153763 #b00000000000000000000000000000000))))

(assert (=> b!314461 (arrayContainsKey!0 a!3293 lt!153763 #b00000000000000000000000000000000)))

(declare-fun lt!153764 () Unit!9655)

(assert (=> b!314461 (= lt!153764 lt!153765)))

(declare-fun res!170264 () Bool)

(assert (=> b!314461 (= res!170264 (= (seekEntryOrOpen!0 (select (arr!7596 a!3293) #b00000000000000000000000000000000) a!3293 mask!3709) (Found!2735 #b00000000000000000000000000000000)))))

(assert (=> b!314461 (=> (not res!170264) (not e!195802))))

(declare-fun b!314462 () Bool)

(declare-fun call!25952 () Bool)

(assert (=> b!314462 (= e!195802 call!25952)))

(declare-fun d!68605 () Bool)

(declare-fun res!170265 () Bool)

(assert (=> d!68605 (=> res!170265 e!195804)))

(assert (=> d!68605 (= res!170265 (bvsge #b00000000000000000000000000000000 (size!7949 a!3293)))))

(assert (=> d!68605 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709) e!195804)))

(declare-fun bm!25949 () Bool)

(assert (=> bm!25949 (= call!25952 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3293 mask!3709))))

(declare-fun b!314463 () Bool)

(assert (=> b!314463 (= e!195803 call!25952)))

(assert (= (and d!68605 (not res!170265)) b!314460))

(assert (= (and b!314460 c!49712) b!314461))

(assert (= (and b!314460 (not c!49712)) b!314463))

(assert (= (and b!314461 res!170264) b!314462))

(assert (= (or b!314462 b!314463) bm!25949))

(assert (=> b!314460 m!323421))

(assert (=> b!314460 m!323421))

(declare-fun m!323475 () Bool)

(assert (=> b!314460 m!323475))

(assert (=> b!314461 m!323421))

(declare-fun m!323477 () Bool)

(assert (=> b!314461 m!323477))

(declare-fun m!323479 () Bool)

(assert (=> b!314461 m!323479))

(assert (=> b!314461 m!323421))

(declare-fun m!323481 () Bool)

(assert (=> b!314461 m!323481))

(declare-fun m!323483 () Bool)

(assert (=> bm!25949 m!323483))

(assert (=> b!314262 d!68605))

(declare-fun b!314464 () Bool)

(declare-fun lt!153766 () SeekEntryResult!2735)

(assert (=> b!314464 (and (bvsge (index!13118 lt!153766) #b00000000000000000000000000000000) (bvslt (index!13118 lt!153766) (size!7949 a!3293)))))

(declare-fun res!170266 () Bool)

(assert (=> b!314464 (= res!170266 (= (select (arr!7596 a!3293) (index!13118 lt!153766)) k0!2441))))

(declare-fun e!195807 () Bool)

(assert (=> b!314464 (=> res!170266 e!195807)))

(declare-fun e!195806 () Bool)

(assert (=> b!314464 (= e!195806 e!195807)))

(declare-fun b!314465 () Bool)

(assert (=> b!314465 (and (bvsge (index!13118 lt!153766) #b00000000000000000000000000000000) (bvslt (index!13118 lt!153766) (size!7949 a!3293)))))

(assert (=> b!314465 (= e!195807 (= (select (arr!7596 a!3293) (index!13118 lt!153766)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!314466 () Bool)

(declare-fun e!195805 () SeekEntryResult!2735)

(assert (=> b!314466 (= e!195805 (Intermediate!2735 true index!1781 x!1427))))

(declare-fun b!314467 () Bool)

(assert (=> b!314467 (and (bvsge (index!13118 lt!153766) #b00000000000000000000000000000000) (bvslt (index!13118 lt!153766) (size!7949 a!3293)))))

(declare-fun res!170268 () Bool)

(assert (=> b!314467 (= res!170268 (= (select (arr!7596 a!3293) (index!13118 lt!153766)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!314467 (=> res!170268 e!195807)))

(declare-fun b!314468 () Bool)

(declare-fun e!195809 () SeekEntryResult!2735)

(assert (=> b!314468 (= e!195809 (Intermediate!2735 false index!1781 x!1427))))

(declare-fun b!314469 () Bool)

(assert (=> b!314469 (= e!195805 e!195809)))

(declare-fun c!49713 () Bool)

(declare-fun lt!153767 () (_ BitVec 64))

(assert (=> b!314469 (= c!49713 (or (= lt!153767 k0!2441) (= (bvadd lt!153767 lt!153767) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!314470 () Bool)

(assert (=> b!314470 (= e!195809 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1427 #b00000000000000000000000000000001) (nextIndex!0 index!1781 x!1427 mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun b!314471 () Bool)

(declare-fun e!195808 () Bool)

(assert (=> b!314471 (= e!195808 (bvsge (x!31360 lt!153766) #b01111111111111111111111111111110))))

(declare-fun d!68607 () Bool)

(assert (=> d!68607 e!195808))

(declare-fun c!49714 () Bool)

(assert (=> d!68607 (= c!49714 (and ((_ is Intermediate!2735) lt!153766) (undefined!3547 lt!153766)))))

(assert (=> d!68607 (= lt!153766 e!195805)))

(declare-fun c!49715 () Bool)

(assert (=> d!68607 (= c!49715 (bvsge x!1427 #b01111111111111111111111111111110))))

(assert (=> d!68607 (= lt!153767 (select (arr!7596 a!3293) index!1781))))

(assert (=> d!68607 (validMask!0 mask!3709)))

(assert (=> d!68607 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709) lt!153766)))

(declare-fun b!314472 () Bool)

(assert (=> b!314472 (= e!195808 e!195806)))

(declare-fun res!170267 () Bool)

(assert (=> b!314472 (= res!170267 (and ((_ is Intermediate!2735) lt!153766) (not (undefined!3547 lt!153766)) (bvslt (x!31360 lt!153766) #b01111111111111111111111111111110) (bvsge (x!31360 lt!153766) #b00000000000000000000000000000000) (bvsge (x!31360 lt!153766) x!1427)))))

(assert (=> b!314472 (=> (not res!170267) (not e!195806))))

(assert (= (and d!68607 c!49715) b!314466))

(assert (= (and d!68607 (not c!49715)) b!314469))

(assert (= (and b!314469 c!49713) b!314468))

(assert (= (and b!314469 (not c!49713)) b!314470))

(assert (= (and d!68607 c!49714) b!314471))

(assert (= (and d!68607 (not c!49714)) b!314472))

(assert (= (and b!314472 res!170267) b!314464))

(assert (= (and b!314464 (not res!170266)) b!314467))

(assert (= (and b!314467 (not res!170268)) b!314465))

(declare-fun m!323485 () Bool)

(assert (=> b!314465 m!323485))

(assert (=> d!68607 m!323347))

(assert (=> d!68607 m!323353))

(assert (=> b!314467 m!323485))

(assert (=> b!314464 m!323485))

(declare-fun m!323487 () Bool)

(assert (=> b!314470 m!323487))

(assert (=> b!314470 m!323487))

(declare-fun m!323489 () Bool)

(assert (=> b!314470 m!323489))

(assert (=> b!314267 d!68607))

(check-sat (not b!314461) (not d!68579) (not b!314423) (not d!68607) (not b!314470) (not d!68565) (not b!314367) (not bm!25949) (not b!314341) (not b!314460))
(check-sat)
