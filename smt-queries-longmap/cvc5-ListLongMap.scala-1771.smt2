; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32272 () Bool)

(assert start!32272)

(declare-fun b!321524 () Bool)

(declare-fun e!199204 () Bool)

(assert (=> b!321524 (= e!199204 false)))

(declare-fun lt!156207 () (_ BitVec 32))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!321524 (= lt!156207 (nextIndex!0 index!1840 x!1490 mask!3777))))

(declare-fun b!321525 () Bool)

(declare-fun res!175650 () Bool)

(assert (=> b!321525 (=> (not res!175650) (not e!199204))))

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-datatypes ((array!16462 0))(
  ( (array!16463 (arr!7790 (Array (_ BitVec 32) (_ BitVec 64))) (size!8142 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16462)

(assert (=> b!321525 (= res!175650 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7790 a!3305) index!1840) k!2497)) (= x!1490 resX!58) (not (= resIndex!58 index!1840)) (not (= (select (arr!7790 a!3305) index!1840) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7790 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!321526 () Bool)

(declare-fun res!175651 () Bool)

(declare-fun e!199202 () Bool)

(assert (=> b!321526 (=> (not res!175651) (not e!199202))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!321526 (= res!175651 (validKeyInArray!0 k!2497))))

(declare-fun b!321527 () Bool)

(declare-fun res!175646 () Bool)

(assert (=> b!321527 (=> (not res!175646) (not e!199204))))

(declare-datatypes ((SeekEntryResult!2921 0))(
  ( (MissingZero!2921 (index!13860 (_ BitVec 32))) (Found!2921 (index!13861 (_ BitVec 32))) (Intermediate!2921 (undefined!3733 Bool) (index!13862 (_ BitVec 32)) (x!32124 (_ BitVec 32))) (Undefined!2921) (MissingVacant!2921 (index!13863 (_ BitVec 32))) )
))
(declare-fun lt!156206 () SeekEntryResult!2921)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16462 (_ BitVec 32)) SeekEntryResult!2921)

(assert (=> b!321527 (= res!175646 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777) lt!156206))))

(declare-fun b!321528 () Bool)

(declare-fun res!175645 () Bool)

(assert (=> b!321528 (=> (not res!175645) (not e!199202))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16462 (_ BitVec 32)) Bool)

(assert (=> b!321528 (= res!175645 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun res!175648 () Bool)

(assert (=> start!32272 (=> (not res!175648) (not e!199202))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32272 (= res!175648 (validMask!0 mask!3777))))

(assert (=> start!32272 e!199202))

(declare-fun array_inv!5753 (array!16462) Bool)

(assert (=> start!32272 (array_inv!5753 a!3305)))

(assert (=> start!32272 true))

(declare-fun b!321529 () Bool)

(declare-fun res!175647 () Bool)

(assert (=> b!321529 (=> (not res!175647) (not e!199204))))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!321529 (= res!175647 (and (= (select (arr!7790 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8142 a!3305))))))

(declare-fun b!321530 () Bool)

(assert (=> b!321530 (= e!199202 e!199204)))

(declare-fun res!175652 () Bool)

(assert (=> b!321530 (=> (not res!175652) (not e!199204))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!321530 (= res!175652 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) lt!156206))))

(assert (=> b!321530 (= lt!156206 (Intermediate!2921 false resIndex!58 resX!58))))

(declare-fun b!321531 () Bool)

(declare-fun res!175653 () Bool)

(assert (=> b!321531 (=> (not res!175653) (not e!199202))))

(declare-fun arrayContainsKey!0 (array!16462 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!321531 (= res!175653 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun b!321532 () Bool)

(declare-fun res!175644 () Bool)

(assert (=> b!321532 (=> (not res!175644) (not e!199202))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16462 (_ BitVec 32)) SeekEntryResult!2921)

(assert (=> b!321532 (= res!175644 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!2921 i!1250)))))

(declare-fun b!321533 () Bool)

(declare-fun res!175649 () Bool)

(assert (=> b!321533 (=> (not res!175649) (not e!199202))))

(assert (=> b!321533 (= res!175649 (and (= (size!8142 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8142 a!3305))))))

(assert (= (and start!32272 res!175648) b!321533))

(assert (= (and b!321533 res!175649) b!321526))

(assert (= (and b!321526 res!175651) b!321531))

(assert (= (and b!321531 res!175653) b!321532))

(assert (= (and b!321532 res!175644) b!321528))

(assert (= (and b!321528 res!175645) b!321530))

(assert (= (and b!321530 res!175652) b!321529))

(assert (= (and b!321529 res!175647) b!321527))

(assert (= (and b!321527 res!175646) b!321525))

(assert (= (and b!321525 res!175650) b!321524))

(declare-fun m!329651 () Bool)

(assert (=> b!321532 m!329651))

(declare-fun m!329653 () Bool)

(assert (=> b!321529 m!329653))

(declare-fun m!329655 () Bool)

(assert (=> start!32272 m!329655))

(declare-fun m!329657 () Bool)

(assert (=> start!32272 m!329657))

(declare-fun m!329659 () Bool)

(assert (=> b!321526 m!329659))

(declare-fun m!329661 () Bool)

(assert (=> b!321525 m!329661))

(declare-fun m!329663 () Bool)

(assert (=> b!321531 m!329663))

(declare-fun m!329665 () Bool)

(assert (=> b!321527 m!329665))

(declare-fun m!329667 () Bool)

(assert (=> b!321528 m!329667))

(declare-fun m!329669 () Bool)

(assert (=> b!321524 m!329669))

(declare-fun m!329671 () Bool)

(assert (=> b!321530 m!329671))

(assert (=> b!321530 m!329671))

(declare-fun m!329673 () Bool)

(assert (=> b!321530 m!329673))

(push 1)

(assert (not b!321524))

(assert (not b!321532))

(assert (not b!321530))

(assert (not b!321526))

(assert (not b!321531))

(assert (not b!321528))

(assert (not start!32272))

(assert (not b!321527))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

