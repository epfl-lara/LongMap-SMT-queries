; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28642 () Bool)

(assert start!28642)

(declare-fun res!153860 () Bool)

(declare-fun e!185205 () Bool)

(assert (=> start!28642 (=> (not res!153860) (not e!185205))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28642 (= res!153860 (validMask!0 mask!3809))))

(assert (=> start!28642 e!185205))

(assert (=> start!28642 true))

(declare-datatypes ((array!14821 0))(
  ( (array!14822 (arr!7033 (Array (_ BitVec 32) (_ BitVec 64))) (size!7385 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14821)

(declare-fun array_inv!4996 (array!14821) Bool)

(assert (=> start!28642 (array_inv!4996 a!3312)))

(declare-fun b!292803 () Bool)

(declare-fun res!153864 () Bool)

(assert (=> b!292803 (=> (not res!153864) (not e!185205))))

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!292803 (= res!153864 (and (= (size!7385 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7385 a!3312))))))

(declare-fun b!292804 () Bool)

(declare-fun e!185207 () Bool)

(assert (=> b!292804 (= e!185207 false)))

(declare-fun k!2524 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!2182 0))(
  ( (MissingZero!2182 (index!10898 (_ BitVec 32))) (Found!2182 (index!10899 (_ BitVec 32))) (Intermediate!2182 (undefined!2994 Bool) (index!10900 (_ BitVec 32)) (x!29077 (_ BitVec 32))) (Undefined!2182) (MissingVacant!2182 (index!10901 (_ BitVec 32))) )
))
(declare-fun lt!145086 () SeekEntryResult!2182)

(declare-fun lt!145085 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14821 (_ BitVec 32)) SeekEntryResult!2182)

(assert (=> b!292804 (= lt!145086 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!145085 k!2524 (array!14822 (store (arr!7033 a!3312) i!1256 k!2524) (size!7385 a!3312)) mask!3809))))

(declare-fun lt!145087 () SeekEntryResult!2182)

(assert (=> b!292804 (= lt!145087 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!145085 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!292804 (= lt!145085 (toIndex!0 k!2524 mask!3809))))

(declare-fun b!292805 () Bool)

(declare-fun res!153863 () Bool)

(assert (=> b!292805 (=> (not res!153863) (not e!185205))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!292805 (= res!153863 (validKeyInArray!0 k!2524))))

(declare-fun b!292806 () Bool)

(assert (=> b!292806 (= e!185205 e!185207)))

(declare-fun res!153861 () Bool)

(assert (=> b!292806 (=> (not res!153861) (not e!185207))))

(declare-fun lt!145084 () SeekEntryResult!2182)

(assert (=> b!292806 (= res!153861 (or (= lt!145084 (MissingZero!2182 i!1256)) (= lt!145084 (MissingVacant!2182 i!1256))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14821 (_ BitVec 32)) SeekEntryResult!2182)

(assert (=> b!292806 (= lt!145084 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!292807 () Bool)

(declare-fun res!153859 () Bool)

(assert (=> b!292807 (=> (not res!153859) (not e!185207))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14821 (_ BitVec 32)) Bool)

(assert (=> b!292807 (= res!153859 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!292808 () Bool)

(declare-fun res!153862 () Bool)

(assert (=> b!292808 (=> (not res!153862) (not e!185205))))

(declare-fun arrayContainsKey!0 (array!14821 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!292808 (= res!153862 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(assert (= (and start!28642 res!153860) b!292803))

(assert (= (and b!292803 res!153864) b!292805))

(assert (= (and b!292805 res!153863) b!292808))

(assert (= (and b!292808 res!153862) b!292806))

(assert (= (and b!292806 res!153861) b!292807))

(assert (= (and b!292807 res!153859) b!292804))

(declare-fun m!306577 () Bool)

(assert (=> b!292805 m!306577))

(declare-fun m!306579 () Bool)

(assert (=> b!292806 m!306579))

(declare-fun m!306581 () Bool)

(assert (=> b!292807 m!306581))

(declare-fun m!306583 () Bool)

(assert (=> b!292808 m!306583))

(declare-fun m!306585 () Bool)

(assert (=> start!28642 m!306585))

(declare-fun m!306587 () Bool)

(assert (=> start!28642 m!306587))

(declare-fun m!306589 () Bool)

(assert (=> b!292804 m!306589))

(declare-fun m!306591 () Bool)

(assert (=> b!292804 m!306591))

(declare-fun m!306593 () Bool)

(assert (=> b!292804 m!306593))

(declare-fun m!306595 () Bool)

(assert (=> b!292804 m!306595))

(push 1)

(assert (not b!292805))

(assert (not b!292804))

(assert (not b!292807))

(assert (not b!292806))

(assert (not start!28642))

(assert (not b!292808))

(check-sat)

(pop 1)

