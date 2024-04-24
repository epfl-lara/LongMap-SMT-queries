; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50712 () Bool)

(assert start!50712)

(declare-fun res!346420 () Bool)

(declare-fun e!319586 () Bool)

(assert (=> start!50712 (=> (not res!346420) (not e!319586))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50712 (= res!346420 (validMask!0 mask!3119))))

(assert (=> start!50712 e!319586))

(assert (=> start!50712 true))

(declare-datatypes ((array!34884 0))(
  ( (array!34885 (arr!16750 (Array (_ BitVec 32) (_ BitVec 64))) (size!17114 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34884)

(declare-fun array_inv!12609 (array!34884) Bool)

(assert (=> start!50712 (array_inv!12609 a!3118)))

(declare-fun b!554113 () Bool)

(declare-fun res!346423 () Bool)

(declare-fun e!319584 () Bool)

(assert (=> b!554113 (=> (not res!346423) (not e!319584))))

(declare-datatypes ((List!10737 0))(
  ( (Nil!10734) (Cons!10733 (h!11721 (_ BitVec 64)) (t!16957 List!10737)) )
))
(declare-fun arrayNoDuplicates!0 (array!34884 (_ BitVec 32) List!10737) Bool)

(assert (=> b!554113 (= res!346423 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10734))))

(declare-fun b!554114 () Bool)

(declare-fun res!346426 () Bool)

(assert (=> b!554114 (=> (not res!346426) (not e!319584))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34884 (_ BitVec 32)) Bool)

(assert (=> b!554114 (= res!346426 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!554115 () Bool)

(declare-fun e!319587 () Bool)

(assert (=> b!554115 (= e!319584 e!319587)))

(declare-fun res!346428 () Bool)

(assert (=> b!554115 (=> (not res!346428) (not e!319587))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun lt!251727 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5155 0))(
  ( (MissingZero!5155 (index!22847 (_ BitVec 32))) (Found!5155 (index!22848 (_ BitVec 32))) (Intermediate!5155 (undefined!5967 Bool) (index!22849 (_ BitVec 32)) (x!51920 (_ BitVec 32))) (Undefined!5155) (MissingVacant!5155 (index!22850 (_ BitVec 32))) )
))
(declare-fun lt!251728 () SeekEntryResult!5155)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34884 (_ BitVec 32)) SeekEntryResult!5155)

(assert (=> b!554115 (= res!346428 (= lt!251728 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!251727 (select (store (arr!16750 a!3118) i!1132 k0!1914) j!142) (array!34885 (store (arr!16750 a!3118) i!1132 k0!1914) (size!17114 a!3118)) mask!3119)))))

(declare-fun lt!251726 () (_ BitVec 32))

(assert (=> b!554115 (= lt!251728 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!251726 (select (arr!16750 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!554115 (= lt!251727 (toIndex!0 (select (store (arr!16750 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!554115 (= lt!251726 (toIndex!0 (select (arr!16750 a!3118) j!142) mask!3119))))

(declare-fun b!554116 () Bool)

(get-info :version)

(assert (=> b!554116 (= e!319587 (not (or (not ((_ is Intermediate!5155) lt!251728)) (undefined!5967 lt!251728) (not (= (select (arr!16750 a!3118) (index!22849 lt!251728)) (select (arr!16750 a!3118) j!142))) (bvsge mask!3119 #b00000000000000000000000000000000))))))

(declare-fun e!319583 () Bool)

(assert (=> b!554116 e!319583))

(declare-fun res!346429 () Bool)

(assert (=> b!554116 (=> (not res!346429) (not e!319583))))

(assert (=> b!554116 (= res!346429 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17155 0))(
  ( (Unit!17156) )
))
(declare-fun lt!251724 () Unit!17155)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34884 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17155)

(assert (=> b!554116 (= lt!251724 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!554117 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34884 (_ BitVec 32)) SeekEntryResult!5155)

(assert (=> b!554117 (= e!319583 (= (seekEntryOrOpen!0 (select (arr!16750 a!3118) j!142) a!3118 mask!3119) (Found!5155 j!142)))))

(declare-fun b!554118 () Bool)

(declare-fun res!346422 () Bool)

(assert (=> b!554118 (=> (not res!346422) (not e!319586))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!554118 (= res!346422 (validKeyInArray!0 k0!1914))))

(declare-fun b!554119 () Bool)

(declare-fun res!346421 () Bool)

(assert (=> b!554119 (=> (not res!346421) (not e!319586))))

(assert (=> b!554119 (= res!346421 (and (= (size!17114 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17114 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17114 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!554120 () Bool)

(assert (=> b!554120 (= e!319586 e!319584)))

(declare-fun res!346424 () Bool)

(assert (=> b!554120 (=> (not res!346424) (not e!319584))))

(declare-fun lt!251725 () SeekEntryResult!5155)

(assert (=> b!554120 (= res!346424 (or (= lt!251725 (MissingZero!5155 i!1132)) (= lt!251725 (MissingVacant!5155 i!1132))))))

(assert (=> b!554120 (= lt!251725 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!554121 () Bool)

(declare-fun res!346425 () Bool)

(assert (=> b!554121 (=> (not res!346425) (not e!319586))))

(assert (=> b!554121 (= res!346425 (validKeyInArray!0 (select (arr!16750 a!3118) j!142)))))

(declare-fun b!554122 () Bool)

(declare-fun res!346427 () Bool)

(assert (=> b!554122 (=> (not res!346427) (not e!319586))))

(declare-fun arrayContainsKey!0 (array!34884 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!554122 (= res!346427 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(assert (= (and start!50712 res!346420) b!554119))

(assert (= (and b!554119 res!346421) b!554121))

(assert (= (and b!554121 res!346425) b!554118))

(assert (= (and b!554118 res!346422) b!554122))

(assert (= (and b!554122 res!346427) b!554120))

(assert (= (and b!554120 res!346424) b!554114))

(assert (= (and b!554114 res!346426) b!554113))

(assert (= (and b!554113 res!346423) b!554115))

(assert (= (and b!554115 res!346428) b!554116))

(assert (= (and b!554116 res!346429) b!554117))

(declare-fun m!531431 () Bool)

(assert (=> b!554120 m!531431))

(declare-fun m!531433 () Bool)

(assert (=> b!554114 m!531433))

(declare-fun m!531435 () Bool)

(assert (=> b!554113 m!531435))

(declare-fun m!531437 () Bool)

(assert (=> b!554118 m!531437))

(declare-fun m!531439 () Bool)

(assert (=> b!554115 m!531439))

(declare-fun m!531441 () Bool)

(assert (=> b!554115 m!531441))

(declare-fun m!531443 () Bool)

(assert (=> b!554115 m!531443))

(declare-fun m!531445 () Bool)

(assert (=> b!554115 m!531445))

(assert (=> b!554115 m!531439))

(assert (=> b!554115 m!531443))

(assert (=> b!554115 m!531443))

(declare-fun m!531447 () Bool)

(assert (=> b!554115 m!531447))

(assert (=> b!554115 m!531439))

(declare-fun m!531449 () Bool)

(assert (=> b!554115 m!531449))

(declare-fun m!531451 () Bool)

(assert (=> b!554115 m!531451))

(assert (=> b!554121 m!531439))

(assert (=> b!554121 m!531439))

(declare-fun m!531453 () Bool)

(assert (=> b!554121 m!531453))

(declare-fun m!531455 () Bool)

(assert (=> b!554122 m!531455))

(declare-fun m!531457 () Bool)

(assert (=> b!554116 m!531457))

(assert (=> b!554116 m!531439))

(declare-fun m!531459 () Bool)

(assert (=> b!554116 m!531459))

(declare-fun m!531461 () Bool)

(assert (=> b!554116 m!531461))

(assert (=> b!554117 m!531439))

(assert (=> b!554117 m!531439))

(declare-fun m!531463 () Bool)

(assert (=> b!554117 m!531463))

(declare-fun m!531465 () Bool)

(assert (=> start!50712 m!531465))

(declare-fun m!531467 () Bool)

(assert (=> start!50712 m!531467))

(check-sat (not b!554117) (not b!554120) (not b!554116) (not b!554118) (not b!554113) (not b!554114) (not start!50712) (not b!554121) (not b!554122) (not b!554115))
(check-sat)
