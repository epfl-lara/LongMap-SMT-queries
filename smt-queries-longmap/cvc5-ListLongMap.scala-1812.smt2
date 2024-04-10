; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32680 () Bool)

(assert start!32680)

(declare-fun b!326501 () Bool)

(declare-fun res!179535 () Bool)

(declare-fun e!201044 () Bool)

(assert (=> b!326501 (=> (not res!179535) (not e!201044))))

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!326501 (= res!179535 (validKeyInArray!0 k!2497))))

(declare-fun b!326502 () Bool)

(declare-fun res!179541 () Bool)

(declare-fun e!201045 () Bool)

(assert (=> b!326502 (=> (not res!179541) (not e!201045))))

(declare-datatypes ((array!16717 0))(
  ( (array!16718 (arr!7913 (Array (_ BitVec 32) (_ BitVec 64))) (size!8265 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16717)

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!326502 (= res!179541 (and (= (select (arr!7913 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8265 a!3305))))))

(declare-fun b!326503 () Bool)

(declare-fun res!179536 () Bool)

(assert (=> b!326503 (=> (not res!179536) (not e!201044))))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16717 (_ BitVec 32)) Bool)

(assert (=> b!326503 (= res!179536 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!326504 () Bool)

(declare-fun res!179534 () Bool)

(assert (=> b!326504 (=> (not res!179534) (not e!201044))))

(declare-fun arrayContainsKey!0 (array!16717 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!326504 (= res!179534 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun b!326505 () Bool)

(declare-fun res!179537 () Bool)

(assert (=> b!326505 (=> (not res!179537) (not e!201044))))

(assert (=> b!326505 (= res!179537 (and (= (size!8265 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8265 a!3305))))))

(declare-fun res!179533 () Bool)

(assert (=> start!32680 (=> (not res!179533) (not e!201044))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32680 (= res!179533 (validMask!0 mask!3777))))

(assert (=> start!32680 e!201044))

(declare-fun array_inv!5876 (array!16717) Bool)

(assert (=> start!32680 (array_inv!5876 a!3305)))

(assert (=> start!32680 true))

(declare-fun b!326506 () Bool)

(assert (=> b!326506 (= e!201044 e!201045)))

(declare-fun res!179538 () Bool)

(assert (=> b!326506 (=> (not res!179538) (not e!201045))))

(declare-datatypes ((SeekEntryResult!3044 0))(
  ( (MissingZero!3044 (index!14352 (_ BitVec 32))) (Found!3044 (index!14353 (_ BitVec 32))) (Intermediate!3044 (undefined!3856 Bool) (index!14354 (_ BitVec 32)) (x!32602 (_ BitVec 32))) (Undefined!3044) (MissingVacant!3044 (index!14355 (_ BitVec 32))) )
))
(declare-fun lt!157337 () SeekEntryResult!3044)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16717 (_ BitVec 32)) SeekEntryResult!3044)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!326506 (= res!179538 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) lt!157337))))

(assert (=> b!326506 (= lt!157337 (Intermediate!3044 false resIndex!58 resX!58))))

(declare-fun b!326507 () Bool)

(declare-fun res!179539 () Bool)

(assert (=> b!326507 (=> (not res!179539) (not e!201044))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16717 (_ BitVec 32)) SeekEntryResult!3044)

(assert (=> b!326507 (= res!179539 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!3044 i!1250)))))

(declare-fun b!326508 () Bool)

(declare-fun res!179540 () Bool)

(assert (=> b!326508 (=> (not res!179540) (not e!201045))))

(assert (=> b!326508 (= res!179540 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7913 a!3305) index!1840) k!2497)) (not (= x!1490 resX!58))))))

(declare-fun b!326509 () Bool)

(declare-fun res!179532 () Bool)

(assert (=> b!326509 (=> (not res!179532) (not e!201045))))

(assert (=> b!326509 (= res!179532 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777) lt!157337))))

(declare-fun b!326510 () Bool)

(assert (=> b!326510 (= e!201045 (and (bvsge mask!3777 #b00000000000000000000000000000000) (bvslt index!1840 (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsgt x!1490 #b01111111111111111111111111111110)))))

(declare-datatypes ((Unit!10122 0))(
  ( (Unit!10123) )
))
(declare-fun lt!157338 () Unit!10122)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 (array!16717 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!10122)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!326510 (= lt!157338 (lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 a!3305 i!1250 k!2497 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 x!1490 mask!3777) resIndex!58 resX!58 mask!3777))))

(assert (= (and start!32680 res!179533) b!326505))

(assert (= (and b!326505 res!179537) b!326501))

(assert (= (and b!326501 res!179535) b!326504))

(assert (= (and b!326504 res!179534) b!326507))

(assert (= (and b!326507 res!179539) b!326503))

(assert (= (and b!326503 res!179536) b!326506))

(assert (= (and b!326506 res!179538) b!326502))

(assert (= (and b!326502 res!179541) b!326509))

(assert (= (and b!326509 res!179532) b!326508))

(assert (= (and b!326508 res!179540) b!326510))

(declare-fun m!333041 () Bool)

(assert (=> b!326510 m!333041))

(assert (=> b!326510 m!333041))

(declare-fun m!333043 () Bool)

(assert (=> b!326510 m!333043))

(declare-fun m!333045 () Bool)

(assert (=> start!32680 m!333045))

(declare-fun m!333047 () Bool)

(assert (=> start!32680 m!333047))

(declare-fun m!333049 () Bool)

(assert (=> b!326508 m!333049))

(declare-fun m!333051 () Bool)

(assert (=> b!326507 m!333051))

(declare-fun m!333053 () Bool)

(assert (=> b!326504 m!333053))

(declare-fun m!333055 () Bool)

(assert (=> b!326503 m!333055))

(declare-fun m!333057 () Bool)

(assert (=> b!326509 m!333057))

(declare-fun m!333059 () Bool)

(assert (=> b!326502 m!333059))

(declare-fun m!333061 () Bool)

(assert (=> b!326506 m!333061))

(assert (=> b!326506 m!333061))

(declare-fun m!333063 () Bool)

(assert (=> b!326506 m!333063))

(declare-fun m!333065 () Bool)

(assert (=> b!326501 m!333065))

(push 1)

(assert (not b!326506))

(assert (not b!326509))

(assert (not b!326503))

(assert (not start!32680))

(assert (not b!326510))

(assert (not b!326507))

(assert (not b!326501))

(assert (not b!326504))

(check-sat)

(pop 1)

(push 1)

(check-sat)

