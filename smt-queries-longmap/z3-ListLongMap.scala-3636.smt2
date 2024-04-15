; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50180 () Bool)

(assert start!50180)

(declare-fun b!549083 () Bool)

(declare-fun e!317131 () Bool)

(declare-fun e!317132 () Bool)

(assert (=> b!549083 (= e!317131 e!317132)))

(declare-fun res!342372 () Bool)

(assert (=> b!549083 (=> (not res!342372) (not e!317132))))

(declare-datatypes ((SeekEntryResult!5083 0))(
  ( (MissingZero!5083 (index!22559 (_ BitVec 32))) (Found!5083 (index!22560 (_ BitVec 32))) (Intermediate!5083 (undefined!5895 Bool) (index!22561 (_ BitVec 32)) (x!51504 (_ BitVec 32))) (Undefined!5083) (MissingVacant!5083 (index!22562 (_ BitVec 32))) )
))
(declare-fun lt!249867 () SeekEntryResult!5083)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!549083 (= res!342372 (or (= lt!249867 (MissingZero!5083 i!1132)) (= lt!249867 (MissingVacant!5083 i!1132))))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-datatypes ((array!34642 0))(
  ( (array!34643 (arr!16637 (Array (_ BitVec 32) (_ BitVec 64))) (size!17002 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34642)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34642 (_ BitVec 32)) SeekEntryResult!5083)

(assert (=> b!549083 (= lt!249867 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!549084 () Bool)

(declare-fun res!342376 () Bool)

(assert (=> b!549084 (=> (not res!342376) (not e!317131))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!549084 (= res!342376 (validKeyInArray!0 (select (arr!16637 a!3118) j!142)))))

(declare-fun b!549085 () Bool)

(declare-fun res!342369 () Bool)

(assert (=> b!549085 (=> (not res!342369) (not e!317131))))

(assert (=> b!549085 (= res!342369 (and (= (size!17002 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17002 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17002 a!3118)) (not (= i!1132 j!142))))))

(declare-fun res!342371 () Bool)

(assert (=> start!50180 (=> (not res!342371) (not e!317131))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50180 (= res!342371 (validMask!0 mask!3119))))

(assert (=> start!50180 e!317131))

(assert (=> start!50180 true))

(declare-fun array_inv!12520 (array!34642) Bool)

(assert (=> start!50180 (array_inv!12520 a!3118)))

(declare-fun b!549086 () Bool)

(declare-fun res!342370 () Bool)

(assert (=> b!549086 (=> (not res!342370) (not e!317132))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34642 (_ BitVec 32)) Bool)

(assert (=> b!549086 (= res!342370 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!549087 () Bool)

(declare-fun e!317130 () Bool)

(assert (=> b!549087 (= e!317132 e!317130)))

(declare-fun res!342377 () Bool)

(assert (=> b!549087 (=> (not res!342377) (not e!317130))))

(declare-fun lt!249868 () (_ BitVec 32))

(assert (=> b!549087 (= res!342377 (and (bvsge mask!3119 #b00000000000000000000000000000000) (bvsge lt!249868 #b00000000000000000000000000000000) (bvslt lt!249868 (bvadd #b00000000000000000000000000000001 mask!3119))))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!549087 (= lt!249868 (toIndex!0 (select (store (arr!16637 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(declare-fun b!549088 () Bool)

(declare-fun res!342375 () Bool)

(assert (=> b!549088 (=> (not res!342375) (not e!317132))))

(declare-datatypes ((List!10756 0))(
  ( (Nil!10753) (Cons!10752 (h!11725 (_ BitVec 64)) (t!16975 List!10756)) )
))
(declare-fun arrayNoDuplicates!0 (array!34642 (_ BitVec 32) List!10756) Bool)

(assert (=> b!549088 (= res!342375 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10753))))

(declare-fun b!549089 () Bool)

(declare-fun res!342373 () Bool)

(assert (=> b!549089 (=> (not res!342373) (not e!317131))))

(declare-fun arrayContainsKey!0 (array!34642 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!549089 (= res!342373 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!549090 () Bool)

(declare-fun res!342374 () Bool)

(assert (=> b!549090 (=> (not res!342374) (not e!317131))))

(assert (=> b!549090 (= res!342374 (validKeyInArray!0 k0!1914))))

(declare-fun b!549091 () Bool)

(assert (=> b!549091 (= e!317130 (not (validKeyInArray!0 (select (store (arr!16637 a!3118) i!1132 k0!1914) j!142))))))

(assert (= (and start!50180 res!342371) b!549085))

(assert (= (and b!549085 res!342369) b!549084))

(assert (= (and b!549084 res!342376) b!549090))

(assert (= (and b!549090 res!342374) b!549089))

(assert (= (and b!549089 res!342373) b!549083))

(assert (= (and b!549083 res!342372) b!549086))

(assert (= (and b!549086 res!342370) b!549088))

(assert (= (and b!549088 res!342375) b!549087))

(assert (= (and b!549087 res!342377) b!549091))

(declare-fun m!525431 () Bool)

(assert (=> b!549090 m!525431))

(declare-fun m!525433 () Bool)

(assert (=> b!549087 m!525433))

(declare-fun m!525435 () Bool)

(assert (=> b!549087 m!525435))

(assert (=> b!549087 m!525435))

(declare-fun m!525437 () Bool)

(assert (=> b!549087 m!525437))

(declare-fun m!525439 () Bool)

(assert (=> b!549088 m!525439))

(declare-fun m!525441 () Bool)

(assert (=> b!549089 m!525441))

(declare-fun m!525443 () Bool)

(assert (=> b!549086 m!525443))

(assert (=> b!549091 m!525433))

(assert (=> b!549091 m!525435))

(assert (=> b!549091 m!525435))

(declare-fun m!525445 () Bool)

(assert (=> b!549091 m!525445))

(declare-fun m!525447 () Bool)

(assert (=> b!549083 m!525447))

(declare-fun m!525449 () Bool)

(assert (=> start!50180 m!525449))

(declare-fun m!525451 () Bool)

(assert (=> start!50180 m!525451))

(declare-fun m!525453 () Bool)

(assert (=> b!549084 m!525453))

(assert (=> b!549084 m!525453))

(declare-fun m!525455 () Bool)

(assert (=> b!549084 m!525455))

(check-sat (not start!50180) (not b!549089) (not b!549088) (not b!549086) (not b!549084) (not b!549091) (not b!549087) (not b!549083) (not b!549090))
(check-sat)
