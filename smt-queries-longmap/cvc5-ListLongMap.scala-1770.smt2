; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32266 () Bool)

(assert start!32266)

(declare-fun b!321441 () Bool)

(declare-fun res!175563 () Bool)

(declare-fun e!199175 () Bool)

(assert (=> b!321441 (=> (not res!175563) (not e!199175))))

(declare-datatypes ((array!16456 0))(
  ( (array!16457 (arr!7787 (Array (_ BitVec 32) (_ BitVec 64))) (size!8139 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16456)

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun i!1250 () (_ BitVec 32))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2918 0))(
  ( (MissingZero!2918 (index!13848 (_ BitVec 32))) (Found!2918 (index!13849 (_ BitVec 32))) (Intermediate!2918 (undefined!3730 Bool) (index!13850 (_ BitVec 32)) (x!32113 (_ BitVec 32))) (Undefined!2918) (MissingVacant!2918 (index!13851 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16456 (_ BitVec 32)) SeekEntryResult!2918)

(assert (=> b!321441 (= res!175563 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!2918 i!1250)))))

(declare-fun b!321442 () Bool)

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun e!199176 () Bool)

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(assert (=> b!321442 (= e!199176 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7787 a!3305) index!1840) k!2497)) (= x!1490 resX!58) (not (= resIndex!58 index!1840)) (not (= (select (arr!7787 a!3305) index!1840) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7787 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge mask!3777 #b00000000000000000000000000000000) (bvslt index!1840 (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsgt x!1490 #b01111111111111111111111111111110)))))

(declare-fun b!321443 () Bool)

(declare-fun res!175562 () Bool)

(assert (=> b!321443 (=> (not res!175562) (not e!199176))))

(declare-fun lt!156195 () SeekEntryResult!2918)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16456 (_ BitVec 32)) SeekEntryResult!2918)

(assert (=> b!321443 (= res!175562 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777) lt!156195))))

(declare-fun b!321444 () Bool)

(declare-fun res!175565 () Bool)

(assert (=> b!321444 (=> (not res!175565) (not e!199175))))

(assert (=> b!321444 (= res!175565 (and (= (size!8139 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8139 a!3305))))))

(declare-fun res!175564 () Bool)

(assert (=> start!32266 (=> (not res!175564) (not e!199175))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32266 (= res!175564 (validMask!0 mask!3777))))

(assert (=> start!32266 e!199175))

(declare-fun array_inv!5750 (array!16456) Bool)

(assert (=> start!32266 (array_inv!5750 a!3305)))

(assert (=> start!32266 true))

(declare-fun b!321445 () Bool)

(declare-fun res!175561 () Bool)

(assert (=> b!321445 (=> (not res!175561) (not e!199175))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!321445 (= res!175561 (validKeyInArray!0 k!2497))))

(declare-fun b!321446 () Bool)

(assert (=> b!321446 (= e!199175 e!199176)))

(declare-fun res!175567 () Bool)

(assert (=> b!321446 (=> (not res!175567) (not e!199176))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!321446 (= res!175567 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) lt!156195))))

(assert (=> b!321446 (= lt!156195 (Intermediate!2918 false resIndex!58 resX!58))))

(declare-fun b!321447 () Bool)

(declare-fun res!175569 () Bool)

(assert (=> b!321447 (=> (not res!175569) (not e!199176))))

(assert (=> b!321447 (= res!175569 (and (= (select (arr!7787 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8139 a!3305))))))

(declare-fun b!321448 () Bool)

(declare-fun res!175566 () Bool)

(assert (=> b!321448 (=> (not res!175566) (not e!199175))))

(declare-fun arrayContainsKey!0 (array!16456 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!321448 (= res!175566 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun b!321449 () Bool)

(declare-fun res!175568 () Bool)

(assert (=> b!321449 (=> (not res!175568) (not e!199175))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16456 (_ BitVec 32)) Bool)

(assert (=> b!321449 (= res!175568 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(assert (= (and start!32266 res!175564) b!321444))

(assert (= (and b!321444 res!175565) b!321445))

(assert (= (and b!321445 res!175561) b!321448))

(assert (= (and b!321448 res!175566) b!321441))

(assert (= (and b!321441 res!175563) b!321449))

(assert (= (and b!321449 res!175568) b!321446))

(assert (= (and b!321446 res!175567) b!321447))

(assert (= (and b!321447 res!175569) b!321443))

(assert (= (and b!321443 res!175562) b!321442))

(declare-fun m!329585 () Bool)

(assert (=> b!321442 m!329585))

(declare-fun m!329587 () Bool)

(assert (=> start!32266 m!329587))

(declare-fun m!329589 () Bool)

(assert (=> start!32266 m!329589))

(declare-fun m!329591 () Bool)

(assert (=> b!321449 m!329591))

(declare-fun m!329593 () Bool)

(assert (=> b!321443 m!329593))

(declare-fun m!329595 () Bool)

(assert (=> b!321445 m!329595))

(declare-fun m!329597 () Bool)

(assert (=> b!321447 m!329597))

(declare-fun m!329599 () Bool)

(assert (=> b!321448 m!329599))

(declare-fun m!329601 () Bool)

(assert (=> b!321441 m!329601))

(declare-fun m!329603 () Bool)

(assert (=> b!321446 m!329603))

(assert (=> b!321446 m!329603))

(declare-fun m!329605 () Bool)

(assert (=> b!321446 m!329605))

(push 1)

