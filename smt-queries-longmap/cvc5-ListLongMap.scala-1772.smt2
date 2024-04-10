; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32278 () Bool)

(assert start!32278)

(declare-fun b!321614 () Bool)

(declare-fun res!175742 () Bool)

(declare-fun e!199230 () Bool)

(assert (=> b!321614 (=> (not res!175742) (not e!199230))))

(declare-datatypes ((array!16468 0))(
  ( (array!16469 (arr!7793 (Array (_ BitVec 32) (_ BitVec 64))) (size!8145 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16468)

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16468 (_ BitVec 32)) Bool)

(assert (=> b!321614 (= res!175742 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!321615 () Bool)

(declare-fun e!199231 () Bool)

(assert (=> b!321615 (= e!199230 e!199231)))

(declare-fun res!175740 () Bool)

(assert (=> b!321615 (=> (not res!175740) (not e!199231))))

(declare-datatypes ((SeekEntryResult!2924 0))(
  ( (MissingZero!2924 (index!13872 (_ BitVec 32))) (Found!2924 (index!13873 (_ BitVec 32))) (Intermediate!2924 (undefined!3736 Bool) (index!13874 (_ BitVec 32)) (x!32135 (_ BitVec 32))) (Undefined!2924) (MissingVacant!2924 (index!13875 (_ BitVec 32))) )
))
(declare-fun lt!156225 () SeekEntryResult!2924)

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16468 (_ BitVec 32)) SeekEntryResult!2924)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!321615 (= res!175740 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) lt!156225))))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(assert (=> b!321615 (= lt!156225 (Intermediate!2924 false resIndex!58 resX!58))))

(declare-fun b!321616 () Bool)

(declare-fun res!175734 () Bool)

(assert (=> b!321616 (=> (not res!175734) (not e!199231))))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(assert (=> b!321616 (= res!175734 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7793 a!3305) index!1840) k!2497)) (= x!1490 resX!58) (not (= resIndex!58 index!1840)) (not (= (select (arr!7793 a!3305) index!1840) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7793 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!321617 () Bool)

(declare-fun res!175741 () Bool)

(assert (=> b!321617 (=> (not res!175741) (not e!199230))))

(declare-fun i!1250 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16468 (_ BitVec 32)) SeekEntryResult!2924)

(assert (=> b!321617 (= res!175741 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!2924 i!1250)))))

(declare-fun res!175735 () Bool)

(assert (=> start!32278 (=> (not res!175735) (not e!199230))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32278 (= res!175735 (validMask!0 mask!3777))))

(assert (=> start!32278 e!199230))

(declare-fun array_inv!5756 (array!16468) Bool)

(assert (=> start!32278 (array_inv!5756 a!3305)))

(assert (=> start!32278 true))

(declare-fun b!321618 () Bool)

(declare-fun res!175738 () Bool)

(assert (=> b!321618 (=> (not res!175738) (not e!199231))))

(assert (=> b!321618 (= res!175738 (and (= (select (arr!7793 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8145 a!3305))))))

(declare-fun b!321619 () Bool)

(assert (=> b!321619 (= e!199231 (bvslt mask!3777 #b00000000000000000000000000000000))))

(declare-fun lt!156224 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!321619 (= lt!156224 (nextIndex!0 index!1840 x!1490 mask!3777))))

(declare-fun b!321620 () Bool)

(declare-fun res!175737 () Bool)

(assert (=> b!321620 (=> (not res!175737) (not e!199230))))

(assert (=> b!321620 (= res!175737 (and (= (size!8145 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8145 a!3305))))))

(declare-fun b!321621 () Bool)

(declare-fun res!175739 () Bool)

(assert (=> b!321621 (=> (not res!175739) (not e!199231))))

(assert (=> b!321621 (= res!175739 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777) lt!156225))))

(declare-fun b!321622 () Bool)

(declare-fun res!175743 () Bool)

(assert (=> b!321622 (=> (not res!175743) (not e!199230))))

(declare-fun arrayContainsKey!0 (array!16468 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!321622 (= res!175743 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun b!321623 () Bool)

(declare-fun res!175736 () Bool)

(assert (=> b!321623 (=> (not res!175736) (not e!199230))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!321623 (= res!175736 (validKeyInArray!0 k!2497))))

(assert (= (and start!32278 res!175735) b!321620))

(assert (= (and b!321620 res!175737) b!321623))

(assert (= (and b!321623 res!175736) b!321622))

(assert (= (and b!321622 res!175743) b!321617))

(assert (= (and b!321617 res!175741) b!321614))

(assert (= (and b!321614 res!175742) b!321615))

(assert (= (and b!321615 res!175740) b!321618))

(assert (= (and b!321618 res!175738) b!321621))

(assert (= (and b!321621 res!175739) b!321616))

(assert (= (and b!321616 res!175734) b!321619))

(declare-fun m!329723 () Bool)

(assert (=> b!321623 m!329723))

(declare-fun m!329725 () Bool)

(assert (=> start!32278 m!329725))

(declare-fun m!329727 () Bool)

(assert (=> start!32278 m!329727))

(declare-fun m!329729 () Bool)

(assert (=> b!321617 m!329729))

(declare-fun m!329731 () Bool)

(assert (=> b!321614 m!329731))

(declare-fun m!329733 () Bool)

(assert (=> b!321619 m!329733))

(declare-fun m!329735 () Bool)

(assert (=> b!321615 m!329735))

(assert (=> b!321615 m!329735))

(declare-fun m!329737 () Bool)

(assert (=> b!321615 m!329737))

(declare-fun m!329739 () Bool)

(assert (=> b!321621 m!329739))

(declare-fun m!329741 () Bool)

(assert (=> b!321618 m!329741))

(declare-fun m!329743 () Bool)

(assert (=> b!321616 m!329743))

(declare-fun m!329745 () Bool)

(assert (=> b!321622 m!329745))

(push 1)

(assert (not start!32278))

(assert (not b!321623))

(assert (not b!321615))

(assert (not b!321614))

(assert (not b!321621))

(assert (not b!321622))

(assert (not b!321619))

(assert (not b!321617))

(check-sat)

(pop 1)

(push 1)

(check-sat)

