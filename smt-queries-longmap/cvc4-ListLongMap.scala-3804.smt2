; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52182 () Bool)

(assert start!52182)

(declare-fun b!569616 () Bool)

(declare-fun res!359635 () Bool)

(declare-fun e!327660 () Bool)

(assert (=> b!569616 (=> (not res!359635) (not e!327660))))

(declare-datatypes ((array!35705 0))(
  ( (array!35706 (arr!17144 (Array (_ BitVec 32) (_ BitVec 64))) (size!17508 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35705)

(declare-datatypes ((List!11224 0))(
  ( (Nil!11221) (Cons!11220 (h!12241 (_ BitVec 64)) (t!17452 List!11224)) )
))
(declare-fun arrayNoDuplicates!0 (array!35705 (_ BitVec 32) List!11224) Bool)

(assert (=> b!569616 (= res!359635 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11221))))

(declare-fun b!569617 () Bool)

(declare-fun res!359637 () Bool)

(declare-fun e!327658 () Bool)

(assert (=> b!569617 (=> (not res!359637) (not e!327658))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!569617 (= res!359637 (and (= (size!17508 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17508 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17508 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!569618 () Bool)

(declare-fun res!359640 () Bool)

(assert (=> b!569618 (=> (not res!359640) (not e!327658))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!569618 (= res!359640 (validKeyInArray!0 (select (arr!17144 a!3118) j!142)))))

(declare-fun b!569619 () Bool)

(assert (=> b!569619 (= e!327658 e!327660)))

(declare-fun res!359638 () Bool)

(assert (=> b!569619 (=> (not res!359638) (not e!327660))))

(declare-datatypes ((SeekEntryResult!5593 0))(
  ( (MissingZero!5593 (index!24599 (_ BitVec 32))) (Found!5593 (index!24600 (_ BitVec 32))) (Intermediate!5593 (undefined!6405 Bool) (index!24601 (_ BitVec 32)) (x!53468 (_ BitVec 32))) (Undefined!5593) (MissingVacant!5593 (index!24602 (_ BitVec 32))) )
))
(declare-fun lt!259664 () SeekEntryResult!5593)

(assert (=> b!569619 (= res!359638 (or (= lt!259664 (MissingZero!5593 i!1132)) (= lt!259664 (MissingVacant!5593 i!1132))))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35705 (_ BitVec 32)) SeekEntryResult!5593)

(assert (=> b!569619 (= lt!259664 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!569620 () Bool)

(declare-fun res!359642 () Bool)

(assert (=> b!569620 (=> (not res!359642) (not e!327658))))

(declare-fun arrayContainsKey!0 (array!35705 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!569620 (= res!359642 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!569621 () Bool)

(declare-fun e!327657 () Bool)

(assert (=> b!569621 (= e!327660 e!327657)))

(declare-fun res!359636 () Bool)

(assert (=> b!569621 (=> (not res!359636) (not e!327657))))

(declare-fun lt!259665 () SeekEntryResult!5593)

(declare-fun lt!259663 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35705 (_ BitVec 32)) SeekEntryResult!5593)

(assert (=> b!569621 (= res!359636 (= lt!259665 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!259663 (select (store (arr!17144 a!3118) i!1132 k!1914) j!142) (array!35706 (store (arr!17144 a!3118) i!1132 k!1914) (size!17508 a!3118)) mask!3119)))))

(declare-fun lt!259666 () (_ BitVec 32))

(assert (=> b!569621 (= lt!259665 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!259666 (select (arr!17144 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!569621 (= lt!259663 (toIndex!0 (select (store (arr!17144 a!3118) i!1132 k!1914) j!142) mask!3119))))

(assert (=> b!569621 (= lt!259666 (toIndex!0 (select (arr!17144 a!3118) j!142) mask!3119))))

(declare-fun b!569622 () Bool)

(declare-fun res!359641 () Bool)

(assert (=> b!569622 (=> (not res!359641) (not e!327660))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35705 (_ BitVec 32)) Bool)

(assert (=> b!569622 (= res!359641 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!569623 () Bool)

(declare-fun res!359634 () Bool)

(assert (=> b!569623 (=> (not res!359634) (not e!327658))))

(assert (=> b!569623 (= res!359634 (validKeyInArray!0 k!1914))))

(declare-fun b!569624 () Bool)

(assert (=> b!569624 (= e!327657 (not true))))

(declare-fun lt!259662 () SeekEntryResult!5593)

(assert (=> b!569624 (and (= lt!259662 (Found!5593 j!142)) (or (undefined!6405 lt!259665) (not (is-Intermediate!5593 lt!259665)) (= (select (arr!17144 a!3118) (index!24601 lt!259665)) (select (arr!17144 a!3118) j!142)) (not (= (select (arr!17144 a!3118) (index!24601 lt!259665)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= lt!259662 (MissingZero!5593 (index!24601 lt!259665)))))))

(assert (=> b!569624 (= lt!259662 (seekEntryOrOpen!0 (select (arr!17144 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!569624 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17888 0))(
  ( (Unit!17889) )
))
(declare-fun lt!259661 () Unit!17888)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35705 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17888)

(assert (=> b!569624 (= lt!259661 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun res!359639 () Bool)

(assert (=> start!52182 (=> (not res!359639) (not e!327658))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52182 (= res!359639 (validMask!0 mask!3119))))

(assert (=> start!52182 e!327658))

(assert (=> start!52182 true))

(declare-fun array_inv!12940 (array!35705) Bool)

(assert (=> start!52182 (array_inv!12940 a!3118)))

(assert (= (and start!52182 res!359639) b!569617))

(assert (= (and b!569617 res!359637) b!569618))

(assert (= (and b!569618 res!359640) b!569623))

(assert (= (and b!569623 res!359634) b!569620))

(assert (= (and b!569620 res!359642) b!569619))

(assert (= (and b!569619 res!359638) b!569622))

(assert (= (and b!569622 res!359641) b!569616))

(assert (= (and b!569616 res!359635) b!569621))

(assert (= (and b!569621 res!359636) b!569624))

(declare-fun m!548419 () Bool)

(assert (=> b!569620 m!548419))

(declare-fun m!548421 () Bool)

(assert (=> b!569619 m!548421))

(declare-fun m!548423 () Bool)

(assert (=> b!569623 m!548423))

(declare-fun m!548425 () Bool)

(assert (=> b!569621 m!548425))

(declare-fun m!548427 () Bool)

(assert (=> b!569621 m!548427))

(assert (=> b!569621 m!548425))

(declare-fun m!548429 () Bool)

(assert (=> b!569621 m!548429))

(declare-fun m!548431 () Bool)

(assert (=> b!569621 m!548431))

(assert (=> b!569621 m!548425))

(declare-fun m!548433 () Bool)

(assert (=> b!569621 m!548433))

(assert (=> b!569621 m!548429))

(declare-fun m!548435 () Bool)

(assert (=> b!569621 m!548435))

(assert (=> b!569621 m!548429))

(declare-fun m!548437 () Bool)

(assert (=> b!569621 m!548437))

(declare-fun m!548439 () Bool)

(assert (=> b!569622 m!548439))

(declare-fun m!548441 () Bool)

(assert (=> start!52182 m!548441))

(declare-fun m!548443 () Bool)

(assert (=> start!52182 m!548443))

(declare-fun m!548445 () Bool)

(assert (=> b!569616 m!548445))

(assert (=> b!569618 m!548425))

(assert (=> b!569618 m!548425))

(declare-fun m!548447 () Bool)

(assert (=> b!569618 m!548447))

(assert (=> b!569624 m!548425))

(declare-fun m!548449 () Bool)

(assert (=> b!569624 m!548449))

(declare-fun m!548451 () Bool)

(assert (=> b!569624 m!548451))

(declare-fun m!548453 () Bool)

(assert (=> b!569624 m!548453))

(assert (=> b!569624 m!548425))

(declare-fun m!548455 () Bool)

(assert (=> b!569624 m!548455))

(push 1)

