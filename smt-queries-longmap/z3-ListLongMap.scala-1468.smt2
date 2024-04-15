; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28190 () Bool)

(assert start!28190)

(declare-fun b!288538 () Bool)

(declare-fun e!182678 () Bool)

(declare-fun e!182679 () Bool)

(assert (=> b!288538 (= e!182678 e!182679)))

(declare-fun res!150219 () Bool)

(assert (=> b!288538 (=> (not res!150219) (not e!182679))))

(declare-datatypes ((SeekEntryResult!2024 0))(
  ( (MissingZero!2024 (index!10266 (_ BitVec 32))) (Found!2024 (index!10267 (_ BitVec 32))) (Intermediate!2024 (undefined!2836 Bool) (index!10268 (_ BitVec 32)) (x!28500 (_ BitVec 32))) (Undefined!2024) (MissingVacant!2024 (index!10269 (_ BitVec 32))) )
))
(declare-fun lt!142088 () SeekEntryResult!2024)

(declare-datatypes ((array!14497 0))(
  ( (array!14498 (arr!6876 (Array (_ BitVec 32) (_ BitVec 64))) (size!7229 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14497)

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun lt!142087 () Bool)

(assert (=> b!288538 (= res!150219 (and (or lt!142087 (not (undefined!2836 lt!142088))) (or lt!142087 (not (= (select (arr!6876 a!3312) (index!10268 lt!142088)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or lt!142087 (not (= (select (arr!6876 a!3312) (index!10268 lt!142088)) k0!2524))) (not lt!142087)))))

(get-info :version)

(assert (=> b!288538 (= lt!142087 (not ((_ is Intermediate!2024) lt!142088)))))

(declare-fun b!288539 () Bool)

(declare-fun e!182680 () Bool)

(declare-fun e!182681 () Bool)

(assert (=> b!288539 (= e!182680 e!182681)))

(declare-fun res!150213 () Bool)

(assert (=> b!288539 (=> (not res!150213) (not e!182681))))

(declare-fun i!1256 () (_ BitVec 32))

(declare-fun lt!142085 () SeekEntryResult!2024)

(declare-fun lt!142084 () Bool)

(assert (=> b!288539 (= res!150213 (or lt!142084 (= lt!142085 (MissingVacant!2024 i!1256))))))

(assert (=> b!288539 (= lt!142084 (= lt!142085 (MissingZero!2024 i!1256)))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14497 (_ BitVec 32)) SeekEntryResult!2024)

(assert (=> b!288539 (= lt!142085 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!288540 () Bool)

(assert (=> b!288540 (= e!182681 e!182678)))

(declare-fun res!150220 () Bool)

(assert (=> b!288540 (=> (not res!150220) (not e!182678))))

(assert (=> b!288540 (= res!150220 lt!142084)))

(declare-fun lt!142089 () (_ BitVec 32))

(declare-fun lt!142086 () SeekEntryResult!2024)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14497 (_ BitVec 32)) SeekEntryResult!2024)

(assert (=> b!288540 (= lt!142086 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!142089 k0!2524 (array!14498 (store (arr!6876 a!3312) i!1256 k0!2524) (size!7229 a!3312)) mask!3809))))

(assert (=> b!288540 (= lt!142088 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!142089 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!288540 (= lt!142089 (toIndex!0 k0!2524 mask!3809))))

(declare-fun res!150218 () Bool)

(assert (=> start!28190 (=> (not res!150218) (not e!182680))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28190 (= res!150218 (validMask!0 mask!3809))))

(assert (=> start!28190 e!182680))

(assert (=> start!28190 true))

(declare-fun array_inv!4848 (array!14497) Bool)

(assert (=> start!28190 (array_inv!4848 a!3312)))

(declare-fun b!288541 () Bool)

(assert (=> b!288541 (= e!182679 (not true))))

(assert (=> b!288541 (and (= (select (arr!6876 a!3312) (index!10268 lt!142088)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!10268 lt!142088) i!1256))))

(declare-fun b!288542 () Bool)

(declare-fun res!150215 () Bool)

(assert (=> b!288542 (=> (not res!150215) (not e!182680))))

(declare-fun arrayContainsKey!0 (array!14497 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!288542 (= res!150215 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!288543 () Bool)

(declare-fun res!150216 () Bool)

(assert (=> b!288543 (=> (not res!150216) (not e!182680))))

(assert (=> b!288543 (= res!150216 (and (= (size!7229 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7229 a!3312))))))

(declare-fun b!288544 () Bool)

(declare-fun res!150217 () Bool)

(assert (=> b!288544 (=> (not res!150217) (not e!182681))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14497 (_ BitVec 32)) Bool)

(assert (=> b!288544 (= res!150217 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!288545 () Bool)

(declare-fun res!150214 () Bool)

(assert (=> b!288545 (=> (not res!150214) (not e!182680))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!288545 (= res!150214 (validKeyInArray!0 k0!2524))))

(assert (= (and start!28190 res!150218) b!288543))

(assert (= (and b!288543 res!150216) b!288545))

(assert (= (and b!288545 res!150214) b!288542))

(assert (= (and b!288542 res!150215) b!288539))

(assert (= (and b!288539 res!150213) b!288544))

(assert (= (and b!288544 res!150217) b!288540))

(assert (= (and b!288540 res!150220) b!288538))

(assert (= (and b!288538 res!150219) b!288541))

(declare-fun m!302303 () Bool)

(assert (=> b!288545 m!302303))

(declare-fun m!302305 () Bool)

(assert (=> b!288540 m!302305))

(declare-fun m!302307 () Bool)

(assert (=> b!288540 m!302307))

(declare-fun m!302309 () Bool)

(assert (=> b!288540 m!302309))

(declare-fun m!302311 () Bool)

(assert (=> b!288540 m!302311))

(declare-fun m!302313 () Bool)

(assert (=> b!288541 m!302313))

(declare-fun m!302315 () Bool)

(assert (=> b!288542 m!302315))

(declare-fun m!302317 () Bool)

(assert (=> b!288544 m!302317))

(declare-fun m!302319 () Bool)

(assert (=> start!28190 m!302319))

(declare-fun m!302321 () Bool)

(assert (=> start!28190 m!302321))

(declare-fun m!302323 () Bool)

(assert (=> b!288539 m!302323))

(assert (=> b!288538 m!302313))

(check-sat (not start!28190) (not b!288540) (not b!288544) (not b!288545) (not b!288539) (not b!288542))
(check-sat)
