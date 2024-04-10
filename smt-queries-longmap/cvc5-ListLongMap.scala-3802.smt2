; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52166 () Bool)

(assert start!52166)

(declare-fun b!569401 () Bool)

(declare-fun res!359418 () Bool)

(declare-fun e!327564 () Bool)

(assert (=> b!569401 (=> (not res!359418) (not e!327564))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((array!35689 0))(
  ( (array!35690 (arr!17136 (Array (_ BitVec 32) (_ BitVec 64))) (size!17500 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35689)

(assert (=> b!569401 (= res!359418 (and (= (size!17500 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17500 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17500 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!569402 () Bool)

(declare-fun res!359419 () Bool)

(declare-fun e!327562 () Bool)

(assert (=> b!569402 (=> (not res!359419) (not e!327562))))

(declare-datatypes ((List!11216 0))(
  ( (Nil!11213) (Cons!11212 (h!12233 (_ BitVec 64)) (t!17444 List!11216)) )
))
(declare-fun arrayNoDuplicates!0 (array!35689 (_ BitVec 32) List!11216) Bool)

(assert (=> b!569402 (= res!359419 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11213))))

(declare-fun b!569403 () Bool)

(declare-fun res!359421 () Bool)

(assert (=> b!569403 (=> (not res!359421) (not e!327564))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!569403 (= res!359421 (validKeyInArray!0 (select (arr!17136 a!3118) j!142)))))

(declare-fun b!569404 () Bool)

(declare-fun res!359426 () Bool)

(assert (=> b!569404 (=> (not res!359426) (not e!327564))))

(declare-fun k!1914 () (_ BitVec 64))

(assert (=> b!569404 (= res!359426 (validKeyInArray!0 k!1914))))

(declare-fun b!569400 () Bool)

(declare-fun e!327563 () Bool)

(assert (=> b!569400 (= e!327563 (not true))))

(declare-datatypes ((SeekEntryResult!5585 0))(
  ( (MissingZero!5585 (index!24567 (_ BitVec 32))) (Found!5585 (index!24568 (_ BitVec 32))) (Intermediate!5585 (undefined!6397 Bool) (index!24569 (_ BitVec 32)) (x!53444 (_ BitVec 32))) (Undefined!5585) (MissingVacant!5585 (index!24570 (_ BitVec 32))) )
))
(declare-fun lt!259520 () SeekEntryResult!5585)

(declare-fun lt!259518 () SeekEntryResult!5585)

(assert (=> b!569400 (and (= lt!259520 (Found!5585 j!142)) (or (undefined!6397 lt!259518) (not (is-Intermediate!5585 lt!259518)) (= (select (arr!17136 a!3118) (index!24569 lt!259518)) (select (arr!17136 a!3118) j!142)) (not (= (select (arr!17136 a!3118) (index!24569 lt!259518)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= lt!259520 (MissingZero!5585 (index!24569 lt!259518)))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35689 (_ BitVec 32)) SeekEntryResult!5585)

(assert (=> b!569400 (= lt!259520 (seekEntryOrOpen!0 (select (arr!17136 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35689 (_ BitVec 32)) Bool)

(assert (=> b!569400 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17872 0))(
  ( (Unit!17873) )
))
(declare-fun lt!259522 () Unit!17872)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35689 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17872)

(assert (=> b!569400 (= lt!259522 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun res!359425 () Bool)

(assert (=> start!52166 (=> (not res!359425) (not e!327564))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52166 (= res!359425 (validMask!0 mask!3119))))

(assert (=> start!52166 e!327564))

(assert (=> start!52166 true))

(declare-fun array_inv!12932 (array!35689) Bool)

(assert (=> start!52166 (array_inv!12932 a!3118)))

(declare-fun b!569405 () Bool)

(declare-fun res!359422 () Bool)

(assert (=> b!569405 (=> (not res!359422) (not e!327564))))

(declare-fun arrayContainsKey!0 (array!35689 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!569405 (= res!359422 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!569406 () Bool)

(declare-fun res!359424 () Bool)

(assert (=> b!569406 (=> (not res!359424) (not e!327562))))

(assert (=> b!569406 (= res!359424 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!569407 () Bool)

(assert (=> b!569407 (= e!327562 e!327563)))

(declare-fun res!359420 () Bool)

(assert (=> b!569407 (=> (not res!359420) (not e!327563))))

(declare-fun lt!259521 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35689 (_ BitVec 32)) SeekEntryResult!5585)

(assert (=> b!569407 (= res!359420 (= lt!259518 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!259521 (select (store (arr!17136 a!3118) i!1132 k!1914) j!142) (array!35690 (store (arr!17136 a!3118) i!1132 k!1914) (size!17500 a!3118)) mask!3119)))))

(declare-fun lt!259517 () (_ BitVec 32))

(assert (=> b!569407 (= lt!259518 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!259517 (select (arr!17136 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!569407 (= lt!259521 (toIndex!0 (select (store (arr!17136 a!3118) i!1132 k!1914) j!142) mask!3119))))

(assert (=> b!569407 (= lt!259517 (toIndex!0 (select (arr!17136 a!3118) j!142) mask!3119))))

(declare-fun b!569408 () Bool)

(assert (=> b!569408 (= e!327564 e!327562)))

(declare-fun res!359423 () Bool)

(assert (=> b!569408 (=> (not res!359423) (not e!327562))))

(declare-fun lt!259519 () SeekEntryResult!5585)

(assert (=> b!569408 (= res!359423 (or (= lt!259519 (MissingZero!5585 i!1132)) (= lt!259519 (MissingVacant!5585 i!1132))))))

(assert (=> b!569408 (= lt!259519 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(assert (= (and start!52166 res!359425) b!569401))

(assert (= (and b!569401 res!359418) b!569403))

(assert (= (and b!569403 res!359421) b!569404))

(assert (= (and b!569404 res!359426) b!569405))

(assert (= (and b!569405 res!359422) b!569408))

(assert (= (and b!569408 res!359423) b!569406))

(assert (= (and b!569406 res!359424) b!569402))

(assert (= (and b!569402 res!359419) b!569407))

(assert (= (and b!569407 res!359420) b!569400))

(declare-fun m!548115 () Bool)

(assert (=> b!569406 m!548115))

(declare-fun m!548117 () Bool)

(assert (=> b!569407 m!548117))

(declare-fun m!548119 () Bool)

(assert (=> b!569407 m!548119))

(assert (=> b!569407 m!548117))

(declare-fun m!548121 () Bool)

(assert (=> b!569407 m!548121))

(declare-fun m!548123 () Bool)

(assert (=> b!569407 m!548123))

(declare-fun m!548125 () Bool)

(assert (=> b!569407 m!548125))

(assert (=> b!569407 m!548117))

(assert (=> b!569407 m!548123))

(declare-fun m!548127 () Bool)

(assert (=> b!569407 m!548127))

(assert (=> b!569407 m!548123))

(declare-fun m!548129 () Bool)

(assert (=> b!569407 m!548129))

(declare-fun m!548131 () Bool)

(assert (=> start!52166 m!548131))

(declare-fun m!548133 () Bool)

(assert (=> start!52166 m!548133))

(declare-fun m!548135 () Bool)

(assert (=> b!569405 m!548135))

(declare-fun m!548137 () Bool)

(assert (=> b!569400 m!548137))

(assert (=> b!569400 m!548117))

(declare-fun m!548139 () Bool)

(assert (=> b!569400 m!548139))

(declare-fun m!548141 () Bool)

(assert (=> b!569400 m!548141))

(assert (=> b!569400 m!548117))

(declare-fun m!548143 () Bool)

(assert (=> b!569400 m!548143))

(declare-fun m!548145 () Bool)

(assert (=> b!569404 m!548145))

(declare-fun m!548147 () Bool)

(assert (=> b!569408 m!548147))

(declare-fun m!548149 () Bool)

(assert (=> b!569402 m!548149))

(assert (=> b!569403 m!548117))

(assert (=> b!569403 m!548117))

(declare-fun m!548151 () Bool)

(assert (=> b!569403 m!548151))

(push 1)

