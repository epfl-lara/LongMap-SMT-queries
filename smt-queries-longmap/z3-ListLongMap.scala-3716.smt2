; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51080 () Bool)

(assert start!51080)

(declare-fun b!558117 () Bool)

(declare-fun res!350128 () Bool)

(declare-fun e!321498 () Bool)

(assert (=> b!558117 (=> (not res!350128) (not e!321498))))

(declare-datatypes ((array!35143 0))(
  ( (array!35144 (arr!16877 (Array (_ BitVec 32) (_ BitVec 64))) (size!17242 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35143)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35143 (_ BitVec 32)) Bool)

(assert (=> b!558117 (= res!350128 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!558118 () Bool)

(declare-fun e!321500 () Bool)

(assert (=> b!558118 (= e!321500 e!321498)))

(declare-fun res!350129 () Bool)

(assert (=> b!558118 (=> (not res!350129) (not e!321498))))

(declare-datatypes ((SeekEntryResult!5323 0))(
  ( (MissingZero!5323 (index!23519 (_ BitVec 32))) (Found!5323 (index!23520 (_ BitVec 32))) (Intermediate!5323 (undefined!6135 Bool) (index!23521 (_ BitVec 32)) (x!52426 (_ BitVec 32))) (Undefined!5323) (MissingVacant!5323 (index!23522 (_ BitVec 32))) )
))
(declare-fun lt!253516 () SeekEntryResult!5323)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!558118 (= res!350129 (or (= lt!253516 (MissingZero!5323 i!1132)) (= lt!253516 (MissingVacant!5323 i!1132))))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35143 (_ BitVec 32)) SeekEntryResult!5323)

(assert (=> b!558118 (= lt!253516 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!558120 () Bool)

(declare-fun e!321499 () Bool)

(declare-fun e!321501 () Bool)

(assert (=> b!558120 (= e!321499 e!321501)))

(declare-fun res!350132 () Bool)

(assert (=> b!558120 (=> res!350132 e!321501)))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun lt!253517 () SeekEntryResult!5323)

(get-info :version)

(assert (=> b!558120 (= res!350132 (or (undefined!6135 lt!253517) (not ((_ is Intermediate!5323) lt!253517)) (= (select (arr!16877 a!3118) (index!23521 lt!253517)) (select (arr!16877 a!3118) j!142)) (= (select (arr!16877 a!3118) (index!23521 lt!253517)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!558121 () Bool)

(declare-fun res!350131 () Bool)

(assert (=> b!558121 (=> (not res!350131) (not e!321500))))

(assert (=> b!558121 (= res!350131 (and (= (size!17242 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17242 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17242 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!558122 () Bool)

(declare-fun res!350124 () Bool)

(assert (=> b!558122 (=> (not res!350124) (not e!321500))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!558122 (= res!350124 (validKeyInArray!0 k0!1914))))

(declare-fun e!321496 () Bool)

(declare-fun b!558123 () Bool)

(assert (=> b!558123 (= e!321496 (not (or (undefined!6135 lt!253517) (not ((_ is Intermediate!5323) lt!253517)) (= (select (arr!16877 a!3118) (index!23521 lt!253517)) (select (arr!16877 a!3118) j!142)) (= (select (arr!16877 a!3118) (index!23521 lt!253517)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge mask!3119 #b00000000000000000000000000000000))))))

(assert (=> b!558123 e!321499))

(declare-fun res!350126 () Bool)

(assert (=> b!558123 (=> (not res!350126) (not e!321499))))

(declare-fun lt!253518 () SeekEntryResult!5323)

(assert (=> b!558123 (= res!350126 (= lt!253518 (Found!5323 j!142)))))

(assert (=> b!558123 (= lt!253518 (seekEntryOrOpen!0 (select (arr!16877 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!558123 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17406 0))(
  ( (Unit!17407) )
))
(declare-fun lt!253514 () Unit!17406)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35143 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17406)

(assert (=> b!558123 (= lt!253514 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!558124 () Bool)

(assert (=> b!558124 (= e!321498 e!321496)))

(declare-fun res!350125 () Bool)

(assert (=> b!558124 (=> (not res!350125) (not e!321496))))

(declare-fun lt!253515 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35143 (_ BitVec 32)) SeekEntryResult!5323)

(assert (=> b!558124 (= res!350125 (= lt!253517 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!253515 (select (store (arr!16877 a!3118) i!1132 k0!1914) j!142) (array!35144 (store (arr!16877 a!3118) i!1132 k0!1914) (size!17242 a!3118)) mask!3119)))))

(declare-fun lt!253519 () (_ BitVec 32))

(assert (=> b!558124 (= lt!253517 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!253519 (select (arr!16877 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!558124 (= lt!253515 (toIndex!0 (select (store (arr!16877 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!558124 (= lt!253519 (toIndex!0 (select (arr!16877 a!3118) j!142) mask!3119))))

(declare-fun b!558125 () Bool)

(declare-fun res!350123 () Bool)

(assert (=> b!558125 (=> (not res!350123) (not e!321500))))

(assert (=> b!558125 (= res!350123 (validKeyInArray!0 (select (arr!16877 a!3118) j!142)))))

(declare-fun b!558126 () Bool)

(declare-fun res!350127 () Bool)

(assert (=> b!558126 (=> (not res!350127) (not e!321500))))

(declare-fun arrayContainsKey!0 (array!35143 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!558126 (= res!350127 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!558127 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35143 (_ BitVec 32)) SeekEntryResult!5323)

(assert (=> b!558127 (= e!321501 (= lt!253518 (seekKeyOrZeroReturnVacant!0 (x!52426 lt!253517) (index!23521 lt!253517) (index!23521 lt!253517) (select (arr!16877 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!558119 () Bool)

(declare-fun res!350122 () Bool)

(assert (=> b!558119 (=> (not res!350122) (not e!321498))))

(declare-datatypes ((List!10996 0))(
  ( (Nil!10993) (Cons!10992 (h!11986 (_ BitVec 64)) (t!17215 List!10996)) )
))
(declare-fun arrayNoDuplicates!0 (array!35143 (_ BitVec 32) List!10996) Bool)

(assert (=> b!558119 (= res!350122 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10993))))

(declare-fun res!350130 () Bool)

(assert (=> start!51080 (=> (not res!350130) (not e!321500))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51080 (= res!350130 (validMask!0 mask!3119))))

(assert (=> start!51080 e!321500))

(assert (=> start!51080 true))

(declare-fun array_inv!12760 (array!35143) Bool)

(assert (=> start!51080 (array_inv!12760 a!3118)))

(assert (= (and start!51080 res!350130) b!558121))

(assert (= (and b!558121 res!350131) b!558125))

(assert (= (and b!558125 res!350123) b!558122))

(assert (= (and b!558122 res!350124) b!558126))

(assert (= (and b!558126 res!350127) b!558118))

(assert (= (and b!558118 res!350129) b!558117))

(assert (= (and b!558117 res!350128) b!558119))

(assert (= (and b!558119 res!350122) b!558124))

(assert (= (and b!558124 res!350125) b!558123))

(assert (= (and b!558123 res!350126) b!558120))

(assert (= (and b!558120 (not res!350132)) b!558127))

(declare-fun m!535583 () Bool)

(assert (=> start!51080 m!535583))

(declare-fun m!535585 () Bool)

(assert (=> start!51080 m!535585))

(declare-fun m!535587 () Bool)

(assert (=> b!558125 m!535587))

(assert (=> b!558125 m!535587))

(declare-fun m!535589 () Bool)

(assert (=> b!558125 m!535589))

(declare-fun m!535591 () Bool)

(assert (=> b!558120 m!535591))

(assert (=> b!558120 m!535587))

(declare-fun m!535593 () Bool)

(assert (=> b!558117 m!535593))

(assert (=> b!558124 m!535587))

(declare-fun m!535595 () Bool)

(assert (=> b!558124 m!535595))

(declare-fun m!535597 () Bool)

(assert (=> b!558124 m!535597))

(assert (=> b!558124 m!535587))

(declare-fun m!535599 () Bool)

(assert (=> b!558124 m!535599))

(declare-fun m!535601 () Bool)

(assert (=> b!558124 m!535601))

(assert (=> b!558124 m!535597))

(declare-fun m!535603 () Bool)

(assert (=> b!558124 m!535603))

(assert (=> b!558124 m!535597))

(declare-fun m!535605 () Bool)

(assert (=> b!558124 m!535605))

(assert (=> b!558124 m!535587))

(declare-fun m!535607 () Bool)

(assert (=> b!558119 m!535607))

(declare-fun m!535609 () Bool)

(assert (=> b!558126 m!535609))

(assert (=> b!558123 m!535587))

(declare-fun m!535611 () Bool)

(assert (=> b!558123 m!535611))

(declare-fun m!535613 () Bool)

(assert (=> b!558123 m!535613))

(assert (=> b!558123 m!535591))

(assert (=> b!558123 m!535587))

(declare-fun m!535615 () Bool)

(assert (=> b!558123 m!535615))

(declare-fun m!535617 () Bool)

(assert (=> b!558122 m!535617))

(assert (=> b!558127 m!535587))

(assert (=> b!558127 m!535587))

(declare-fun m!535619 () Bool)

(assert (=> b!558127 m!535619))

(declare-fun m!535621 () Bool)

(assert (=> b!558118 m!535621))

(check-sat (not b!558117) (not b!558123) (not b!558118) (not b!558126) (not b!558124) (not b!558122) (not start!51080) (not b!558127) (not b!558119) (not b!558125))
(check-sat)
