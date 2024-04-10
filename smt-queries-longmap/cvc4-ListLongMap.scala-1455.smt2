; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28072 () Bool)

(assert start!28072)

(declare-fun b!287673 () Bool)

(declare-fun e!182184 () Bool)

(declare-fun e!182186 () Bool)

(assert (=> b!287673 (= e!182184 e!182186)))

(declare-fun res!149440 () Bool)

(assert (=> b!287673 (=> (not res!149440) (not e!182186))))

(declare-datatypes ((SeekEntryResult!1993 0))(
  ( (MissingZero!1993 (index!10142 (_ BitVec 32))) (Found!1993 (index!10143 (_ BitVec 32))) (Intermediate!1993 (undefined!2805 Bool) (index!10144 (_ BitVec 32)) (x!28360 (_ BitVec 32))) (Undefined!1993) (MissingVacant!1993 (index!10145 (_ BitVec 32))) )
))
(declare-fun lt!141616 () SeekEntryResult!1993)

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!287673 (= res!149440 (or (= lt!141616 (MissingZero!1993 i!1256)) (= lt!141616 (MissingVacant!1993 i!1256))))))

(declare-datatypes ((array!14431 0))(
  ( (array!14432 (arr!6844 (Array (_ BitVec 32) (_ BitVec 64))) (size!7196 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14431)

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14431 (_ BitVec 32)) SeekEntryResult!1993)

(assert (=> b!287673 (= lt!141616 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!287674 () Bool)

(declare-fun res!149437 () Bool)

(assert (=> b!287674 (=> (not res!149437) (not e!182184))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!287674 (= res!149437 (validKeyInArray!0 k!2524))))

(declare-fun b!287675 () Bool)

(assert (=> b!287675 (= e!182186 false)))

(declare-fun lt!141615 () SeekEntryResult!1993)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14431 (_ BitVec 32)) SeekEntryResult!1993)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!287675 (= lt!141615 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2524 mask!3809) k!2524 a!3312 mask!3809))))

(declare-fun b!287676 () Bool)

(declare-fun res!149438 () Bool)

(assert (=> b!287676 (=> (not res!149438) (not e!182184))))

(assert (=> b!287676 (= res!149438 (and (= (size!7196 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7196 a!3312))))))

(declare-fun b!287677 () Bool)

(declare-fun res!149441 () Bool)

(assert (=> b!287677 (=> (not res!149441) (not e!182184))))

(declare-fun arrayContainsKey!0 (array!14431 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!287677 (= res!149441 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun res!149442 () Bool)

(assert (=> start!28072 (=> (not res!149442) (not e!182184))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28072 (= res!149442 (validMask!0 mask!3809))))

(assert (=> start!28072 e!182184))

(assert (=> start!28072 true))

(declare-fun array_inv!4807 (array!14431) Bool)

(assert (=> start!28072 (array_inv!4807 a!3312)))

(declare-fun b!287678 () Bool)

(declare-fun res!149439 () Bool)

(assert (=> b!287678 (=> (not res!149439) (not e!182186))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14431 (_ BitVec 32)) Bool)

(assert (=> b!287678 (= res!149439 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(assert (= (and start!28072 res!149442) b!287676))

(assert (= (and b!287676 res!149438) b!287674))

(assert (= (and b!287674 res!149437) b!287677))

(assert (= (and b!287677 res!149441) b!287673))

(assert (= (and b!287673 res!149440) b!287678))

(assert (= (and b!287678 res!149439) b!287675))

(declare-fun m!302009 () Bool)

(assert (=> b!287673 m!302009))

(declare-fun m!302011 () Bool)

(assert (=> b!287675 m!302011))

(assert (=> b!287675 m!302011))

(declare-fun m!302013 () Bool)

(assert (=> b!287675 m!302013))

(declare-fun m!302015 () Bool)

(assert (=> b!287677 m!302015))

(declare-fun m!302017 () Bool)

(assert (=> b!287674 m!302017))

(declare-fun m!302019 () Bool)

(assert (=> start!28072 m!302019))

(declare-fun m!302021 () Bool)

(assert (=> start!28072 m!302021))

(declare-fun m!302023 () Bool)

(assert (=> b!287678 m!302023))

(push 1)

(assert (not b!287677))

(assert (not b!287674))

(assert (not b!287678))

(assert (not start!28072))

(assert (not b!287673))

