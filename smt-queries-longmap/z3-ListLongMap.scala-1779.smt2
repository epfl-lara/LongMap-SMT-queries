; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32360 () Bool)

(assert start!32360)

(declare-fun b!322527 () Bool)

(declare-fun res!176441 () Bool)

(declare-fun e!199579 () Bool)

(assert (=> b!322527 (=> (not res!176441) (not e!199579))))

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!322527 (= res!176441 (validKeyInArray!0 k0!2497))))

(declare-fun b!322528 () Bool)

(assert (=> b!322528 false))

(declare-datatypes ((Unit!9840 0))(
  ( (Unit!9841) )
))
(declare-fun e!199580 () Unit!9840)

(declare-fun Unit!9842 () Unit!9840)

(assert (=> b!322528 (= e!199580 Unit!9842)))

(declare-fun b!322529 () Bool)

(declare-fun res!176444 () Bool)

(declare-fun e!199577 () Bool)

(assert (=> b!322529 (=> (not res!176444) (not e!199577))))

(declare-datatypes ((array!16512 0))(
  ( (array!16513 (arr!7813 (Array (_ BitVec 32) (_ BitVec 64))) (size!8165 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16512)

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!322529 (= res!176444 (and (= (select (arr!7813 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8165 a!3305))))))

(declare-fun b!322530 () Bool)

(declare-fun e!199576 () Unit!9840)

(declare-fun Unit!9843 () Unit!9840)

(assert (=> b!322530 (= e!199576 Unit!9843)))

(declare-fun b!322531 () Bool)

(assert (=> b!322531 (= e!199579 e!199577)))

(declare-fun res!176438 () Bool)

(assert (=> b!322531 (=> (not res!176438) (not e!199577))))

(declare-datatypes ((SeekEntryResult!2909 0))(
  ( (MissingZero!2909 (index!13812 (_ BitVec 32))) (Found!2909 (index!13813 (_ BitVec 32))) (Intermediate!2909 (undefined!3721 Bool) (index!13814 (_ BitVec 32)) (x!32182 (_ BitVec 32))) (Undefined!2909) (MissingVacant!2909 (index!13815 (_ BitVec 32))) )
))
(declare-fun lt!156493 () SeekEntryResult!2909)

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16512 (_ BitVec 32)) SeekEntryResult!2909)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!322531 (= res!176438 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!156493))))

(assert (=> b!322531 (= lt!156493 (Intermediate!2909 false resIndex!58 resX!58))))

(declare-fun b!322532 () Bool)

(declare-fun res!176445 () Bool)

(assert (=> b!322532 (=> (not res!176445) (not e!199579))))

(assert (=> b!322532 (= res!176445 (and (= (size!8165 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8165 a!3305))))))

(declare-fun b!322533 () Bool)

(declare-fun res!176439 () Bool)

(assert (=> b!322533 (=> (not res!176439) (not e!199579))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16512 (_ BitVec 32)) SeekEntryResult!2909)

(assert (=> b!322533 (= res!176439 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!2909 i!1250)))))

(declare-fun b!322534 () Bool)

(declare-fun Unit!9844 () Unit!9840)

(assert (=> b!322534 (= e!199576 Unit!9844)))

(assert (=> b!322534 false))

(declare-fun res!176436 () Bool)

(assert (=> start!32360 (=> (not res!176436) (not e!199579))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32360 (= res!176436 (validMask!0 mask!3777))))

(assert (=> start!32360 e!199579))

(declare-fun array_inv!5763 (array!16512) Bool)

(assert (=> start!32360 (array_inv!5763 a!3305)))

(assert (=> start!32360 true))

(declare-fun b!322535 () Bool)

(declare-fun res!176440 () Bool)

(assert (=> b!322535 (=> (not res!176440) (not e!199577))))

(assert (=> b!322535 (= res!176440 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!156493))))

(declare-fun b!322536 () Bool)

(declare-fun res!176437 () Bool)

(assert (=> b!322536 (=> (not res!176437) (not e!199577))))

(assert (=> b!322536 (= res!176437 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7813 a!3305) index!1840) k0!2497)) (= x!1490 resX!58)))))

(declare-fun b!322537 () Bool)

(assert (=> b!322537 false))

(declare-fun lt!156494 () Unit!9840)

(assert (=> b!322537 (= lt!156494 e!199576)))

(declare-fun c!50674 () Bool)

(get-info :version)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!322537 (= c!50674 ((_ is Intermediate!2909) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 (bvadd #b00000000000000000000000000000001 x!1490) mask!3777) k0!2497 a!3305 mask!3777)))))

(declare-fun Unit!9845 () Unit!9840)

(assert (=> b!322537 (= e!199580 Unit!9845)))

(declare-fun b!322538 () Bool)

(declare-fun e!199578 () Unit!9840)

(declare-fun Unit!9846 () Unit!9840)

(assert (=> b!322538 (= e!199578 Unit!9846)))

(declare-fun b!322539 () Bool)

(assert (=> b!322539 (= e!199578 e!199580)))

(declare-fun c!50675 () Bool)

(assert (=> b!322539 (= c!50675 (or (= (select (arr!7813 a!3305) index!1840) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7813 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!322540 () Bool)

(declare-fun res!176442 () Bool)

(assert (=> b!322540 (=> (not res!176442) (not e!199579))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16512 (_ BitVec 32)) Bool)

(assert (=> b!322540 (= res!176442 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!322541 () Bool)

(declare-fun res!176443 () Bool)

(assert (=> b!322541 (=> (not res!176443) (not e!199579))))

(declare-fun arrayContainsKey!0 (array!16512 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!322541 (= res!176443 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!322542 () Bool)

(assert (=> b!322542 (= e!199577 (not true))))

(assert (=> b!322542 (= index!1840 resIndex!58)))

(declare-fun lt!156495 () Unit!9840)

(assert (=> b!322542 (= lt!156495 e!199578)))

(declare-fun c!50673 () Bool)

(assert (=> b!322542 (= c!50673 (not (= resIndex!58 index!1840)))))

(assert (= (and start!32360 res!176436) b!322532))

(assert (= (and b!322532 res!176445) b!322527))

(assert (= (and b!322527 res!176441) b!322541))

(assert (= (and b!322541 res!176443) b!322533))

(assert (= (and b!322533 res!176439) b!322540))

(assert (= (and b!322540 res!176442) b!322531))

(assert (= (and b!322531 res!176438) b!322529))

(assert (= (and b!322529 res!176444) b!322535))

(assert (= (and b!322535 res!176440) b!322536))

(assert (= (and b!322536 res!176437) b!322542))

(assert (= (and b!322542 c!50673) b!322539))

(assert (= (and b!322542 (not c!50673)) b!322538))

(assert (= (and b!322539 c!50675) b!322528))

(assert (= (and b!322539 (not c!50675)) b!322537))

(assert (= (and b!322537 c!50674) b!322530))

(assert (= (and b!322537 (not c!50674)) b!322534))

(declare-fun m!330535 () Bool)

(assert (=> b!322539 m!330535))

(declare-fun m!330537 () Bool)

(assert (=> b!322535 m!330537))

(assert (=> b!322536 m!330535))

(declare-fun m!330539 () Bool)

(assert (=> b!322527 m!330539))

(declare-fun m!330541 () Bool)

(assert (=> b!322531 m!330541))

(assert (=> b!322531 m!330541))

(declare-fun m!330543 () Bool)

(assert (=> b!322531 m!330543))

(declare-fun m!330545 () Bool)

(assert (=> b!322537 m!330545))

(assert (=> b!322537 m!330545))

(declare-fun m!330547 () Bool)

(assert (=> b!322537 m!330547))

(declare-fun m!330549 () Bool)

(assert (=> start!32360 m!330549))

(declare-fun m!330551 () Bool)

(assert (=> start!32360 m!330551))

(declare-fun m!330553 () Bool)

(assert (=> b!322529 m!330553))

(declare-fun m!330555 () Bool)

(assert (=> b!322540 m!330555))

(declare-fun m!330557 () Bool)

(assert (=> b!322533 m!330557))

(declare-fun m!330559 () Bool)

(assert (=> b!322541 m!330559))

(check-sat (not b!322541) (not b!322537) (not b!322533) (not b!322531) (not start!32360) (not b!322540) (not b!322527) (not b!322535))
(check-sat)
