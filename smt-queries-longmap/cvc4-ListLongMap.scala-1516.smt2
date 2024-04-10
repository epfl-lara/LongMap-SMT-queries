; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28630 () Bool)

(assert start!28630)

(declare-fun res!153752 () Bool)

(declare-fun e!185152 () Bool)

(assert (=> start!28630 (=> (not res!153752) (not e!185152))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28630 (= res!153752 (validMask!0 mask!3809))))

(assert (=> start!28630 e!185152))

(assert (=> start!28630 true))

(declare-datatypes ((array!14809 0))(
  ( (array!14810 (arr!7027 (Array (_ BitVec 32) (_ BitVec 64))) (size!7379 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14809)

(declare-fun array_inv!4990 (array!14809) Bool)

(assert (=> start!28630 (array_inv!4990 a!3312)))

(declare-fun b!292695 () Bool)

(declare-fun res!153751 () Bool)

(declare-fun e!185151 () Bool)

(assert (=> b!292695 (=> (not res!153751) (not e!185151))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14809 (_ BitVec 32)) Bool)

(assert (=> b!292695 (= res!153751 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!292696 () Bool)

(assert (=> b!292696 (= e!185152 e!185151)))

(declare-fun res!153753 () Bool)

(assert (=> b!292696 (=> (not res!153753) (not e!185151))))

(declare-datatypes ((SeekEntryResult!2176 0))(
  ( (MissingZero!2176 (index!10874 (_ BitVec 32))) (Found!2176 (index!10875 (_ BitVec 32))) (Intermediate!2176 (undefined!2988 Bool) (index!10876 (_ BitVec 32)) (x!29055 (_ BitVec 32))) (Undefined!2176) (MissingVacant!2176 (index!10877 (_ BitVec 32))) )
))
(declare-fun lt!145014 () SeekEntryResult!2176)

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!292696 (= res!153753 (or (= lt!145014 (MissingZero!2176 i!1256)) (= lt!145014 (MissingVacant!2176 i!1256))))))

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14809 (_ BitVec 32)) SeekEntryResult!2176)

(assert (=> b!292696 (= lt!145014 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!292697 () Bool)

(assert (=> b!292697 (= e!185151 false)))

(declare-fun lt!145013 () (_ BitVec 32))

(declare-fun lt!145012 () SeekEntryResult!2176)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14809 (_ BitVec 32)) SeekEntryResult!2176)

(assert (=> b!292697 (= lt!145012 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!145013 k!2524 (array!14810 (store (arr!7027 a!3312) i!1256 k!2524) (size!7379 a!3312)) mask!3809))))

(declare-fun lt!145015 () SeekEntryResult!2176)

(assert (=> b!292697 (= lt!145015 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!145013 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!292697 (= lt!145013 (toIndex!0 k!2524 mask!3809))))

(declare-fun b!292698 () Bool)

(declare-fun res!153756 () Bool)

(assert (=> b!292698 (=> (not res!153756) (not e!185152))))

(declare-fun arrayContainsKey!0 (array!14809 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!292698 (= res!153756 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!292699 () Bool)

(declare-fun res!153754 () Bool)

(assert (=> b!292699 (=> (not res!153754) (not e!185152))))

(assert (=> b!292699 (= res!153754 (and (= (size!7379 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7379 a!3312))))))

(declare-fun b!292700 () Bool)

(declare-fun res!153755 () Bool)

(assert (=> b!292700 (=> (not res!153755) (not e!185152))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!292700 (= res!153755 (validKeyInArray!0 k!2524))))

(assert (= (and start!28630 res!153752) b!292699))

(assert (= (and b!292699 res!153754) b!292700))

(assert (= (and b!292700 res!153755) b!292698))

(assert (= (and b!292698 res!153756) b!292696))

(assert (= (and b!292696 res!153753) b!292695))

(assert (= (and b!292695 res!153751) b!292697))

(declare-fun m!306457 () Bool)

(assert (=> start!28630 m!306457))

(declare-fun m!306459 () Bool)

(assert (=> start!28630 m!306459))

(declare-fun m!306461 () Bool)

(assert (=> b!292700 m!306461))

(declare-fun m!306463 () Bool)

(assert (=> b!292698 m!306463))

(declare-fun m!306465 () Bool)

(assert (=> b!292695 m!306465))

(declare-fun m!306467 () Bool)

(assert (=> b!292697 m!306467))

(declare-fun m!306469 () Bool)

(assert (=> b!292697 m!306469))

(declare-fun m!306471 () Bool)

(assert (=> b!292697 m!306471))

(declare-fun m!306473 () Bool)

(assert (=> b!292697 m!306473))

(declare-fun m!306475 () Bool)

(assert (=> b!292696 m!306475))

(push 1)

(assert (not b!292695))

(assert (not b!292697))

(assert (not start!28630))

(assert (not b!292700))

(assert (not b!292698))

(assert (not b!292696))

(check-sat)

(pop 1)

(push 1)

