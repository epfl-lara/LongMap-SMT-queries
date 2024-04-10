; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!29894 () Bool)

(assert start!29894)

(declare-fun b!300555 () Bool)

(declare-fun res!158450 () Bool)

(declare-fun e!189781 () Bool)

(assert (=> b!300555 (=> (not res!158450) (not e!189781))))

(declare-datatypes ((array!15172 0))(
  ( (array!15173 (arr!7180 (Array (_ BitVec 32) (_ BitVec 64))) (size!7532 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!15172)

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15172 (_ BitVec 32)) Bool)

(assert (=> b!300555 (= res!158450 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!300556 () Bool)

(declare-fun res!158446 () Bool)

(declare-fun e!189779 () Bool)

(assert (=> b!300556 (=> (not res!158446) (not e!189779))))

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!300556 (= res!158446 (validKeyInArray!0 k!2524))))

(declare-fun b!300557 () Bool)

(assert (=> b!300557 (= e!189779 e!189781)))

(declare-fun res!158451 () Bool)

(assert (=> b!300557 (=> (not res!158451) (not e!189781))))

(declare-datatypes ((SeekEntryResult!2329 0))(
  ( (MissingZero!2329 (index!11492 (_ BitVec 32))) (Found!2329 (index!11493 (_ BitVec 32))) (Intermediate!2329 (undefined!3141 Bool) (index!11494 (_ BitVec 32)) (x!29747 (_ BitVec 32))) (Undefined!2329) (MissingVacant!2329 (index!11495 (_ BitVec 32))) )
))
(declare-fun lt!149512 () SeekEntryResult!2329)

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!300557 (= res!158451 (or (= lt!149512 (MissingZero!2329 i!1256)) (= lt!149512 (MissingVacant!2329 i!1256))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15172 (_ BitVec 32)) SeekEntryResult!2329)

(assert (=> b!300557 (= lt!149512 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!300558 () Bool)

(assert (=> b!300558 (= e!189781 false)))

(declare-fun lt!149513 () (_ BitVec 32))

(declare-fun lt!149511 () SeekEntryResult!2329)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15172 (_ BitVec 32)) SeekEntryResult!2329)

(assert (=> b!300558 (= lt!149511 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!149513 k!2524 (array!15173 (store (arr!7180 a!3312) i!1256 k!2524) (size!7532 a!3312)) mask!3809))))

(declare-fun lt!149514 () SeekEntryResult!2329)

(assert (=> b!300558 (= lt!149514 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!149513 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!300558 (= lt!149513 (toIndex!0 k!2524 mask!3809))))

(declare-fun b!300559 () Bool)

(declare-fun res!158447 () Bool)

(assert (=> b!300559 (=> (not res!158447) (not e!189779))))

(assert (=> b!300559 (= res!158447 (and (= (size!7532 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7532 a!3312))))))

(declare-fun b!300560 () Bool)

(declare-fun res!158449 () Bool)

(assert (=> b!300560 (=> (not res!158449) (not e!189779))))

(declare-fun arrayContainsKey!0 (array!15172 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!300560 (= res!158449 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun res!158448 () Bool)

(assert (=> start!29894 (=> (not res!158448) (not e!189779))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29894 (= res!158448 (validMask!0 mask!3809))))

(assert (=> start!29894 e!189779))

(assert (=> start!29894 true))

(declare-fun array_inv!5143 (array!15172) Bool)

(assert (=> start!29894 (array_inv!5143 a!3312)))

(assert (= (and start!29894 res!158448) b!300559))

(assert (= (and b!300559 res!158447) b!300556))

(assert (= (and b!300556 res!158446) b!300560))

(assert (= (and b!300560 res!158449) b!300557))

(assert (= (and b!300557 res!158451) b!300555))

(assert (= (and b!300555 res!158450) b!300558))

(declare-fun m!312529 () Bool)

(assert (=> b!300560 m!312529))

(declare-fun m!312531 () Bool)

(assert (=> start!29894 m!312531))

(declare-fun m!312533 () Bool)

(assert (=> start!29894 m!312533))

(declare-fun m!312535 () Bool)

(assert (=> b!300557 m!312535))

(declare-fun m!312537 () Bool)

(assert (=> b!300555 m!312537))

(declare-fun m!312539 () Bool)

(assert (=> b!300558 m!312539))

(declare-fun m!312541 () Bool)

(assert (=> b!300558 m!312541))

(declare-fun m!312543 () Bool)

(assert (=> b!300558 m!312543))

(declare-fun m!312545 () Bool)

(assert (=> b!300558 m!312545))

(declare-fun m!312547 () Bool)

(assert (=> b!300556 m!312547))

(push 1)

(assert (not b!300556))

(assert (not b!300558))

(assert (not start!29894))

(assert (not b!300560))

(assert (not b!300557))

(assert (not b!300555))

(check-sat)

