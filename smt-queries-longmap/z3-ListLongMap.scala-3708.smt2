; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51030 () Bool)

(assert start!51030)

(declare-fun b!557521 () Bool)

(declare-fun res!349470 () Bool)

(declare-fun e!321216 () Bool)

(assert (=> b!557521 (=> (not res!349470) (not e!321216))))

(declare-datatypes ((array!35088 0))(
  ( (array!35089 (arr!16849 (Array (_ BitVec 32) (_ BitVec 64))) (size!17213 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35088)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!557521 (= res!349470 (validKeyInArray!0 (select (arr!16849 a!3118) j!142)))))

(declare-fun b!557522 () Bool)

(declare-fun res!349464 () Bool)

(declare-fun e!321215 () Bool)

(assert (=> b!557522 (=> (not res!349464) (not e!321215))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35088 (_ BitVec 32)) Bool)

(assert (=> b!557522 (= res!349464 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!557524 () Bool)

(declare-fun res!349462 () Bool)

(assert (=> b!557524 (=> (not res!349462) (not e!321215))))

(declare-datatypes ((List!10836 0))(
  ( (Nil!10833) (Cons!10832 (h!11826 (_ BitVec 64)) (t!17056 List!10836)) )
))
(declare-fun arrayNoDuplicates!0 (array!35088 (_ BitVec 32) List!10836) Bool)

(assert (=> b!557524 (= res!349462 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10833))))

(declare-fun b!557525 () Bool)

(declare-fun res!349466 () Bool)

(assert (=> b!557525 (=> (not res!349466) (not e!321216))))

(declare-fun k0!1914 () (_ BitVec 64))

(assert (=> b!557525 (= res!349466 (validKeyInArray!0 k0!1914))))

(declare-fun b!557526 () Bool)

(assert (=> b!557526 (= e!321215 (not true))))

(declare-fun e!321213 () Bool)

(assert (=> b!557526 e!321213))

(declare-fun res!349467 () Bool)

(assert (=> b!557526 (=> (not res!349467) (not e!321213))))

(assert (=> b!557526 (= res!349467 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17353 0))(
  ( (Unit!17354) )
))
(declare-fun lt!253372 () Unit!17353)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35088 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17353)

(assert (=> b!557526 (= lt!253372 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!557527 () Bool)

(declare-fun res!349463 () Bool)

(assert (=> b!557527 (=> (not res!349463) (not e!321216))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!557527 (= res!349463 (and (= (size!17213 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17213 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17213 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!557528 () Bool)

(declare-fun res!349465 () Bool)

(assert (=> b!557528 (=> (not res!349465) (not e!321216))))

(declare-fun arrayContainsKey!0 (array!35088 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!557528 (= res!349465 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!557529 () Bool)

(declare-datatypes ((SeekEntryResult!5254 0))(
  ( (MissingZero!5254 (index!23243 (_ BitVec 32))) (Found!5254 (index!23244 (_ BitVec 32))) (Intermediate!5254 (undefined!6066 Bool) (index!23245 (_ BitVec 32)) (x!52295 (_ BitVec 32))) (Undefined!5254) (MissingVacant!5254 (index!23246 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35088 (_ BitVec 32)) SeekEntryResult!5254)

(assert (=> b!557529 (= e!321213 (= (seekEntryOrOpen!0 (select (arr!16849 a!3118) j!142) a!3118 mask!3119) (Found!5254 j!142)))))

(declare-fun b!557530 () Bool)

(assert (=> b!557530 (= e!321216 e!321215)))

(declare-fun res!349468 () Bool)

(assert (=> b!557530 (=> (not res!349468) (not e!321215))))

(declare-fun lt!253371 () SeekEntryResult!5254)

(assert (=> b!557530 (= res!349468 (or (= lt!253371 (MissingZero!5254 i!1132)) (= lt!253371 (MissingVacant!5254 i!1132))))))

(assert (=> b!557530 (= lt!253371 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!557523 () Bool)

(declare-fun res!349471 () Bool)

(assert (=> b!557523 (=> (not res!349471) (not e!321215))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35088 (_ BitVec 32)) SeekEntryResult!5254)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!557523 (= res!349471 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16849 a!3118) j!142) mask!3119) (select (arr!16849 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16849 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!16849 a!3118) i!1132 k0!1914) j!142) (array!35089 (store (arr!16849 a!3118) i!1132 k0!1914) (size!17213 a!3118)) mask!3119)))))

(declare-fun res!349469 () Bool)

(assert (=> start!51030 (=> (not res!349469) (not e!321216))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51030 (= res!349469 (validMask!0 mask!3119))))

(assert (=> start!51030 e!321216))

(assert (=> start!51030 true))

(declare-fun array_inv!12708 (array!35088) Bool)

(assert (=> start!51030 (array_inv!12708 a!3118)))

(assert (= (and start!51030 res!349469) b!557527))

(assert (= (and b!557527 res!349463) b!557521))

(assert (= (and b!557521 res!349470) b!557525))

(assert (= (and b!557525 res!349466) b!557528))

(assert (= (and b!557528 res!349465) b!557530))

(assert (= (and b!557530 res!349468) b!557522))

(assert (= (and b!557522 res!349464) b!557524))

(assert (= (and b!557524 res!349462) b!557523))

(assert (= (and b!557523 res!349471) b!557526))

(assert (= (and b!557526 res!349467) b!557529))

(declare-fun m!535553 () Bool)

(assert (=> b!557526 m!535553))

(declare-fun m!535555 () Bool)

(assert (=> b!557526 m!535555))

(declare-fun m!535557 () Bool)

(assert (=> b!557521 m!535557))

(assert (=> b!557521 m!535557))

(declare-fun m!535559 () Bool)

(assert (=> b!557521 m!535559))

(declare-fun m!535561 () Bool)

(assert (=> b!557524 m!535561))

(declare-fun m!535563 () Bool)

(assert (=> b!557528 m!535563))

(assert (=> b!557529 m!535557))

(assert (=> b!557529 m!535557))

(declare-fun m!535565 () Bool)

(assert (=> b!557529 m!535565))

(assert (=> b!557523 m!535557))

(declare-fun m!535567 () Bool)

(assert (=> b!557523 m!535567))

(assert (=> b!557523 m!535557))

(declare-fun m!535569 () Bool)

(assert (=> b!557523 m!535569))

(declare-fun m!535571 () Bool)

(assert (=> b!557523 m!535571))

(assert (=> b!557523 m!535569))

(declare-fun m!535573 () Bool)

(assert (=> b!557523 m!535573))

(assert (=> b!557523 m!535567))

(assert (=> b!557523 m!535557))

(declare-fun m!535575 () Bool)

(assert (=> b!557523 m!535575))

(declare-fun m!535577 () Bool)

(assert (=> b!557523 m!535577))

(assert (=> b!557523 m!535569))

(assert (=> b!557523 m!535571))

(declare-fun m!535579 () Bool)

(assert (=> b!557522 m!535579))

(declare-fun m!535581 () Bool)

(assert (=> start!51030 m!535581))

(declare-fun m!535583 () Bool)

(assert (=> start!51030 m!535583))

(declare-fun m!535585 () Bool)

(assert (=> b!557530 m!535585))

(declare-fun m!535587 () Bool)

(assert (=> b!557525 m!535587))

(check-sat (not b!557523) (not b!557530) (not b!557529) (not b!557521) (not b!557526) (not start!51030) (not b!557524) (not b!557522) (not b!557525) (not b!557528))
(check-sat)
