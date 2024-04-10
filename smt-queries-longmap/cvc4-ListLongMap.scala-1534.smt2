; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!29138 () Bool)

(assert start!29138)

(declare-fun b!295606 () Bool)

(declare-fun e!186841 () Bool)

(declare-fun e!186839 () Bool)

(assert (=> b!295606 (= e!186841 e!186839)))

(declare-fun res!155417 () Bool)

(assert (=> b!295606 (=> (not res!155417) (not e!186839))))

(declare-fun lt!146590 () Bool)

(assert (=> b!295606 (= res!155417 lt!146590)))

(declare-fun lt!146595 () (_ BitVec 32))

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((array!14941 0))(
  ( (array!14942 (arr!7081 (Array (_ BitVec 32) (_ BitVec 64))) (size!7433 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14941)

(declare-datatypes ((SeekEntryResult!2230 0))(
  ( (MissingZero!2230 (index!11090 (_ BitVec 32))) (Found!2230 (index!11091 (_ BitVec 32))) (Intermediate!2230 (undefined!3042 Bool) (index!11092 (_ BitVec 32)) (x!29306 (_ BitVec 32))) (Undefined!2230) (MissingVacant!2230 (index!11093 (_ BitVec 32))) )
))
(declare-fun lt!146594 () SeekEntryResult!2230)

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14941 (_ BitVec 32)) SeekEntryResult!2230)

(assert (=> b!295606 (= lt!146594 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!146595 k!2524 (array!14942 (store (arr!7081 a!3312) i!1256 k!2524) (size!7433 a!3312)) mask!3809))))

(declare-fun lt!146593 () SeekEntryResult!2230)

(assert (=> b!295606 (= lt!146593 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!146595 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!295606 (= lt!146595 (toIndex!0 k!2524 mask!3809))))

(declare-fun b!295607 () Bool)

(declare-fun e!186838 () Bool)

(assert (=> b!295607 (= e!186838 (not true))))

(assert (=> b!295607 (and (= (select (arr!7081 a!3312) (index!11092 lt!146593)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!11092 lt!146593) i!1256))))

(declare-fun b!295608 () Bool)

(declare-fun res!155419 () Bool)

(declare-fun e!186840 () Bool)

(assert (=> b!295608 (=> (not res!155419) (not e!186840))))

(assert (=> b!295608 (= res!155419 (and (= (size!7433 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7433 a!3312))))))

(declare-fun res!155414 () Bool)

(assert (=> start!29138 (=> (not res!155414) (not e!186840))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29138 (= res!155414 (validMask!0 mask!3809))))

(assert (=> start!29138 e!186840))

(assert (=> start!29138 true))

(declare-fun array_inv!5044 (array!14941) Bool)

(assert (=> start!29138 (array_inv!5044 a!3312)))

(declare-fun b!295609 () Bool)

(declare-fun res!155415 () Bool)

(assert (=> b!295609 (=> (not res!155415) (not e!186841))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14941 (_ BitVec 32)) Bool)

(assert (=> b!295609 (= res!155415 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!295610 () Bool)

(declare-fun res!155418 () Bool)

(assert (=> b!295610 (=> (not res!155418) (not e!186840))))

(declare-fun arrayContainsKey!0 (array!14941 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!295610 (= res!155418 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!295611 () Bool)

(declare-fun res!155421 () Bool)

(assert (=> b!295611 (=> (not res!155421) (not e!186840))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!295611 (= res!155421 (validKeyInArray!0 k!2524))))

(declare-fun b!295612 () Bool)

(assert (=> b!295612 (= e!186839 e!186838)))

(declare-fun res!155420 () Bool)

(assert (=> b!295612 (=> (not res!155420) (not e!186838))))

(declare-fun lt!146592 () Bool)

(assert (=> b!295612 (= res!155420 (and (or lt!146592 (not (undefined!3042 lt!146593))) (or lt!146592 (not (= (select (arr!7081 a!3312) (index!11092 lt!146593)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or lt!146592 (not (= (select (arr!7081 a!3312) (index!11092 lt!146593)) k!2524))) (not lt!146592)))))

(assert (=> b!295612 (= lt!146592 (not (is-Intermediate!2230 lt!146593)))))

(declare-fun b!295613 () Bool)

(assert (=> b!295613 (= e!186840 e!186841)))

(declare-fun res!155416 () Bool)

(assert (=> b!295613 (=> (not res!155416) (not e!186841))))

(declare-fun lt!146591 () SeekEntryResult!2230)

(assert (=> b!295613 (= res!155416 (or lt!146590 (= lt!146591 (MissingVacant!2230 i!1256))))))

(assert (=> b!295613 (= lt!146590 (= lt!146591 (MissingZero!2230 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14941 (_ BitVec 32)) SeekEntryResult!2230)

(assert (=> b!295613 (= lt!146591 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(assert (= (and start!29138 res!155414) b!295608))

(assert (= (and b!295608 res!155419) b!295611))

(assert (= (and b!295611 res!155421) b!295610))

(assert (= (and b!295610 res!155418) b!295613))

(assert (= (and b!295613 res!155416) b!295609))

(assert (= (and b!295609 res!155415) b!295606))

(assert (= (and b!295606 res!155417) b!295612))

(assert (= (and b!295612 res!155420) b!295607))

(declare-fun m!308699 () Bool)

(assert (=> b!295611 m!308699))

(declare-fun m!308701 () Bool)

(assert (=> b!295610 m!308701))

(declare-fun m!308703 () Bool)

(assert (=> b!295607 m!308703))

(declare-fun m!308705 () Bool)

(assert (=> b!295606 m!308705))

(declare-fun m!308707 () Bool)

(assert (=> b!295606 m!308707))

(declare-fun m!308709 () Bool)

(assert (=> b!295606 m!308709))

(declare-fun m!308711 () Bool)

(assert (=> b!295606 m!308711))

(declare-fun m!308713 () Bool)

(assert (=> b!295609 m!308713))

(declare-fun m!308715 () Bool)

(assert (=> b!295613 m!308715))

(assert (=> b!295612 m!308703))

(declare-fun m!308717 () Bool)

(assert (=> start!29138 m!308717))

(declare-fun m!308719 () Bool)

(assert (=> start!29138 m!308719))

(push 1)

