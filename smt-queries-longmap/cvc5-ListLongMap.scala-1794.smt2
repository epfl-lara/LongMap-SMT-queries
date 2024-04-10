; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32464 () Bool)

(assert start!32464)

(declare-fun b!324413 () Bool)

(declare-fun res!177748 () Bool)

(declare-fun e!200272 () Bool)

(assert (=> b!324413 (=> (not res!177748) (not e!200272))))

(declare-datatypes ((array!16603 0))(
  ( (array!16604 (arr!7859 (Array (_ BitVec 32) (_ BitVec 64))) (size!8211 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16603)

(declare-fun index!1840 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2990 0))(
  ( (MissingZero!2990 (index!14136 (_ BitVec 32))) (Found!2990 (index!14137 (_ BitVec 32))) (Intermediate!2990 (undefined!3802 Bool) (index!14138 (_ BitVec 32)) (x!32386 (_ BitVec 32))) (Undefined!2990) (MissingVacant!2990 (index!14139 (_ BitVec 32))) )
))
(declare-fun lt!156798 () SeekEntryResult!2990)

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16603 (_ BitVec 32)) SeekEntryResult!2990)

(assert (=> b!324413 (= res!177748 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777) lt!156798))))

(declare-fun b!324414 () Bool)

(declare-fun res!177745 () Bool)

(declare-fun e!200271 () Bool)

(assert (=> b!324414 (=> (not res!177745) (not e!200271))))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!324414 (= res!177745 (and (= (size!8211 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8211 a!3305))))))

(declare-fun b!324415 () Bool)

(declare-fun res!177744 () Bool)

(assert (=> b!324415 (=> (not res!177744) (not e!200271))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16603 (_ BitVec 32)) SeekEntryResult!2990)

(assert (=> b!324415 (= res!177744 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!2990 i!1250)))))

(declare-fun b!324416 () Bool)

(assert (=> b!324416 (= e!200272 false)))

(declare-fun lt!156797 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!324416 (= lt!156797 (nextIndex!0 index!1840 x!1490 mask!3777))))

(declare-fun b!324417 () Bool)

(declare-fun res!177752 () Bool)

(assert (=> b!324417 (=> (not res!177752) (not e!200272))))

(declare-fun resX!58 () (_ BitVec 32))

(assert (=> b!324417 (= res!177752 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7859 a!3305) index!1840) k!2497)) (not (= x!1490 resX!58))))))

(declare-fun b!324418 () Bool)

(declare-fun res!177746 () Bool)

(assert (=> b!324418 (=> (not res!177746) (not e!200271))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!324418 (= res!177746 (validKeyInArray!0 k!2497))))

(declare-fun b!324419 () Bool)

(assert (=> b!324419 (= e!200271 e!200272)))

(declare-fun res!177751 () Bool)

(assert (=> b!324419 (=> (not res!177751) (not e!200272))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!324419 (= res!177751 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) lt!156798))))

(declare-fun resIndex!58 () (_ BitVec 32))

(assert (=> b!324419 (= lt!156798 (Intermediate!2990 false resIndex!58 resX!58))))

(declare-fun b!324420 () Bool)

(declare-fun res!177750 () Bool)

(assert (=> b!324420 (=> (not res!177750) (not e!200271))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16603 (_ BitVec 32)) Bool)

(assert (=> b!324420 (= res!177750 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun res!177747 () Bool)

(assert (=> start!32464 (=> (not res!177747) (not e!200271))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32464 (= res!177747 (validMask!0 mask!3777))))

(assert (=> start!32464 e!200271))

(declare-fun array_inv!5822 (array!16603) Bool)

(assert (=> start!32464 (array_inv!5822 a!3305)))

(assert (=> start!32464 true))

(declare-fun b!324421 () Bool)

(declare-fun res!177753 () Bool)

(assert (=> b!324421 (=> (not res!177753) (not e!200271))))

(declare-fun arrayContainsKey!0 (array!16603 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!324421 (= res!177753 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun b!324422 () Bool)

(declare-fun res!177749 () Bool)

(assert (=> b!324422 (=> (not res!177749) (not e!200272))))

(assert (=> b!324422 (= res!177749 (and (= (select (arr!7859 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8211 a!3305))))))

(assert (= (and start!32464 res!177747) b!324414))

(assert (= (and b!324414 res!177745) b!324418))

(assert (= (and b!324418 res!177746) b!324421))

(assert (= (and b!324421 res!177753) b!324415))

(assert (= (and b!324415 res!177744) b!324420))

(assert (= (and b!324420 res!177750) b!324419))

(assert (= (and b!324419 res!177751) b!324422))

(assert (= (and b!324422 res!177749) b!324413))

(assert (= (and b!324413 res!177748) b!324417))

(assert (= (and b!324417 res!177752) b!324416))

(declare-fun m!331463 () Bool)

(assert (=> b!324416 m!331463))

(declare-fun m!331465 () Bool)

(assert (=> b!324422 m!331465))

(declare-fun m!331467 () Bool)

(assert (=> b!324420 m!331467))

(declare-fun m!331469 () Bool)

(assert (=> b!324418 m!331469))

(declare-fun m!331471 () Bool)

(assert (=> start!32464 m!331471))

(declare-fun m!331473 () Bool)

(assert (=> start!32464 m!331473))

(declare-fun m!331475 () Bool)

(assert (=> b!324421 m!331475))

(declare-fun m!331477 () Bool)

(assert (=> b!324415 m!331477))

(declare-fun m!331479 () Bool)

(assert (=> b!324419 m!331479))

(assert (=> b!324419 m!331479))

(declare-fun m!331481 () Bool)

(assert (=> b!324419 m!331481))

(declare-fun m!331483 () Bool)

(assert (=> b!324413 m!331483))

(declare-fun m!331485 () Bool)

(assert (=> b!324417 m!331485))

(push 1)

