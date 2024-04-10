; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28164 () Bool)

(assert start!28164)

(declare-fun b!288325 () Bool)

(declare-fun res!149950 () Bool)

(declare-fun e!182558 () Bool)

(assert (=> b!288325 (=> (not res!149950) (not e!182558))))

(declare-datatypes ((array!14478 0))(
  ( (array!14479 (arr!6866 (Array (_ BitVec 32) (_ BitVec 64))) (size!7218 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14478)

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!14478 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!288325 (= res!149950 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!288326 () Bool)

(declare-fun res!149954 () Bool)

(assert (=> b!288326 (=> (not res!149954) (not e!182558))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!288326 (= res!149954 (validKeyInArray!0 k!2524))))

(declare-fun b!288327 () Bool)

(declare-fun e!182555 () Bool)

(assert (=> b!288327 (= e!182555 (not true))))

(declare-datatypes ((SeekEntryResult!2015 0))(
  ( (MissingZero!2015 (index!10230 (_ BitVec 32))) (Found!2015 (index!10231 (_ BitVec 32))) (Intermediate!2015 (undefined!2827 Bool) (index!10232 (_ BitVec 32)) (x!28452 (_ BitVec 32))) (Undefined!2015) (MissingVacant!2015 (index!10233 (_ BitVec 32))) )
))
(declare-fun lt!141997 () SeekEntryResult!2015)

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!288327 (and (= (select (arr!6866 a!3312) (index!10232 lt!141997)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!10232 lt!141997) i!1256))))

(declare-fun b!288328 () Bool)

(declare-fun e!182556 () Bool)

(declare-fun e!182554 () Bool)

(assert (=> b!288328 (= e!182556 e!182554)))

(declare-fun res!149953 () Bool)

(assert (=> b!288328 (=> (not res!149953) (not e!182554))))

(declare-fun lt!141998 () Bool)

(assert (=> b!288328 (= res!149953 lt!141998)))

(declare-fun lt!141999 () (_ BitVec 32))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun lt!142000 () SeekEntryResult!2015)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14478 (_ BitVec 32)) SeekEntryResult!2015)

(assert (=> b!288328 (= lt!142000 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!141999 k!2524 (array!14479 (store (arr!6866 a!3312) i!1256 k!2524) (size!7218 a!3312)) mask!3809))))

(assert (=> b!288328 (= lt!141997 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!141999 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!288328 (= lt!141999 (toIndex!0 k!2524 mask!3809))))

(declare-fun b!288329 () Bool)

(assert (=> b!288329 (= e!182554 e!182555)))

(declare-fun res!149955 () Bool)

(assert (=> b!288329 (=> (not res!149955) (not e!182555))))

(declare-fun lt!141995 () Bool)

(assert (=> b!288329 (= res!149955 (and (or lt!141995 (not (undefined!2827 lt!141997))) (or lt!141995 (not (= (select (arr!6866 a!3312) (index!10232 lt!141997)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or lt!141995 (not (= (select (arr!6866 a!3312) (index!10232 lt!141997)) k!2524))) (not lt!141995)))))

(assert (=> b!288329 (= lt!141995 (not (is-Intermediate!2015 lt!141997)))))

(declare-fun res!149952 () Bool)

(assert (=> start!28164 (=> (not res!149952) (not e!182558))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28164 (= res!149952 (validMask!0 mask!3809))))

(assert (=> start!28164 e!182558))

(assert (=> start!28164 true))

(declare-fun array_inv!4829 (array!14478) Bool)

(assert (=> start!28164 (array_inv!4829 a!3312)))

(declare-fun b!288330 () Bool)

(declare-fun res!149951 () Bool)

(assert (=> b!288330 (=> (not res!149951) (not e!182556))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14478 (_ BitVec 32)) Bool)

(assert (=> b!288330 (= res!149951 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!288331 () Bool)

(assert (=> b!288331 (= e!182558 e!182556)))

(declare-fun res!149949 () Bool)

(assert (=> b!288331 (=> (not res!149949) (not e!182556))))

(declare-fun lt!141996 () SeekEntryResult!2015)

(assert (=> b!288331 (= res!149949 (or lt!141998 (= lt!141996 (MissingVacant!2015 i!1256))))))

(assert (=> b!288331 (= lt!141998 (= lt!141996 (MissingZero!2015 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14478 (_ BitVec 32)) SeekEntryResult!2015)

(assert (=> b!288331 (= lt!141996 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!288332 () Bool)

(declare-fun res!149948 () Bool)

(assert (=> b!288332 (=> (not res!149948) (not e!182558))))

(assert (=> b!288332 (= res!149948 (and (= (size!7218 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7218 a!3312))))))

(assert (= (and start!28164 res!149952) b!288332))

(assert (= (and b!288332 res!149948) b!288326))

(assert (= (and b!288326 res!149954) b!288325))

(assert (= (and b!288325 res!149950) b!288331))

(assert (= (and b!288331 res!149949) b!288330))

(assert (= (and b!288330 res!149951) b!288328))

(assert (= (and b!288328 res!149953) b!288329))

(assert (= (and b!288329 res!149955) b!288327))

(declare-fun m!302565 () Bool)

(assert (=> b!288326 m!302565))

(declare-fun m!302567 () Bool)

(assert (=> b!288331 m!302567))

(declare-fun m!302569 () Bool)

(assert (=> b!288330 m!302569))

(declare-fun m!302571 () Bool)

(assert (=> b!288328 m!302571))

(declare-fun m!302573 () Bool)

(assert (=> b!288328 m!302573))

(declare-fun m!302575 () Bool)

(assert (=> b!288328 m!302575))

(declare-fun m!302577 () Bool)

(assert (=> b!288328 m!302577))

(declare-fun m!302579 () Bool)

(assert (=> b!288325 m!302579))

(declare-fun m!302581 () Bool)

(assert (=> start!28164 m!302581))

(declare-fun m!302583 () Bool)

(assert (=> start!28164 m!302583))

(declare-fun m!302585 () Bool)

(assert (=> b!288329 m!302585))

(assert (=> b!288327 m!302585))

(push 1)

