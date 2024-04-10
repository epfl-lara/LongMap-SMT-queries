; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51102 () Bool)

(assert start!51102)

(declare-fun b!558553 () Bool)

(declare-fun e!321765 () Bool)

(declare-fun e!321761 () Bool)

(assert (=> b!558553 (= e!321765 e!321761)))

(declare-fun res!350417 () Bool)

(assert (=> b!558553 (=> (not res!350417) (not e!321761))))

(declare-fun j!142 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5332 0))(
  ( (MissingZero!5332 (index!23555 (_ BitVec 32))) (Found!5332 (index!23556 (_ BitVec 32))) (Intermediate!5332 (undefined!6144 Bool) (index!23557 (_ BitVec 32)) (x!52448 (_ BitVec 32))) (Undefined!5332) (MissingVacant!5332 (index!23558 (_ BitVec 32))) )
))
(declare-fun lt!253842 () SeekEntryResult!5332)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun lt!253838 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((array!35156 0))(
  ( (array!35157 (arr!16883 (Array (_ BitVec 32) (_ BitVec 64))) (size!17247 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35156)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35156 (_ BitVec 32)) SeekEntryResult!5332)

(assert (=> b!558553 (= res!350417 (= lt!253842 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!253838 (select (store (arr!16883 a!3118) i!1132 k!1914) j!142) (array!35157 (store (arr!16883 a!3118) i!1132 k!1914) (size!17247 a!3118)) mask!3119)))))

(declare-fun lt!253839 () (_ BitVec 32))

(assert (=> b!558553 (= lt!253842 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!253839 (select (arr!16883 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!558553 (= lt!253838 (toIndex!0 (select (store (arr!16883 a!3118) i!1132 k!1914) j!142) mask!3119))))

(assert (=> b!558553 (= lt!253839 (toIndex!0 (select (arr!16883 a!3118) j!142) mask!3119))))

(declare-fun b!558554 () Bool)

(declare-fun res!350420 () Bool)

(declare-fun e!321760 () Bool)

(assert (=> b!558554 (=> (not res!350420) (not e!321760))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!558554 (= res!350420 (validKeyInArray!0 (select (arr!16883 a!3118) j!142)))))

(declare-fun b!558555 () Bool)

(declare-fun e!321762 () Bool)

(declare-fun e!321764 () Bool)

(assert (=> b!558555 (= e!321762 e!321764)))

(declare-fun res!350422 () Bool)

(assert (=> b!558555 (=> res!350422 e!321764)))

(assert (=> b!558555 (= res!350422 (or (undefined!6144 lt!253842) (not (is-Intermediate!5332 lt!253842)) (= (select (arr!16883 a!3118) (index!23557 lt!253842)) (select (arr!16883 a!3118) j!142)) (= (select (arr!16883 a!3118) (index!23557 lt!253842)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!558556 () Bool)

(declare-fun res!350416 () Bool)

(assert (=> b!558556 (=> (not res!350416) (not e!321760))))

(declare-fun arrayContainsKey!0 (array!35156 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!558556 (= res!350416 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun res!350425 () Bool)

(assert (=> start!51102 (=> (not res!350425) (not e!321760))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51102 (= res!350425 (validMask!0 mask!3119))))

(assert (=> start!51102 e!321760))

(assert (=> start!51102 true))

(declare-fun array_inv!12679 (array!35156) Bool)

(assert (=> start!51102 (array_inv!12679 a!3118)))

(declare-fun b!558557 () Bool)

(declare-fun res!350426 () Bool)

(assert (=> b!558557 (=> (not res!350426) (not e!321765))))

(declare-datatypes ((List!10963 0))(
  ( (Nil!10960) (Cons!10959 (h!11953 (_ BitVec 64)) (t!17191 List!10963)) )
))
(declare-fun arrayNoDuplicates!0 (array!35156 (_ BitVec 32) List!10963) Bool)

(assert (=> b!558557 (= res!350426 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10960))))

(declare-fun b!558558 () Bool)

(declare-fun res!350418 () Bool)

(assert (=> b!558558 (=> (not res!350418) (not e!321760))))

(assert (=> b!558558 (= res!350418 (validKeyInArray!0 k!1914))))

(declare-fun b!558559 () Bool)

(declare-fun res!350421 () Bool)

(assert (=> b!558559 (=> (not res!350421) (not e!321765))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35156 (_ BitVec 32)) Bool)

(assert (=> b!558559 (= res!350421 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun lt!253841 () SeekEntryResult!5332)

(declare-fun b!558560 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35156 (_ BitVec 32)) SeekEntryResult!5332)

(assert (=> b!558560 (= e!321764 (= lt!253841 (seekKeyOrZeroReturnVacant!0 (x!52448 lt!253842) (index!23557 lt!253842) (index!23557 lt!253842) (select (arr!16883 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!558561 () Bool)

(declare-fun res!350424 () Bool)

(assert (=> b!558561 (=> (not res!350424) (not e!321760))))

(assert (=> b!558561 (= res!350424 (and (= (size!17247 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17247 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17247 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!558562 () Bool)

(assert (=> b!558562 (= e!321760 e!321765)))

(declare-fun res!350423 () Bool)

(assert (=> b!558562 (=> (not res!350423) (not e!321765))))

(declare-fun lt!253843 () SeekEntryResult!5332)

(assert (=> b!558562 (= res!350423 (or (= lt!253843 (MissingZero!5332 i!1132)) (= lt!253843 (MissingVacant!5332 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35156 (_ BitVec 32)) SeekEntryResult!5332)

(assert (=> b!558562 (= lt!253843 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!558563 () Bool)

(assert (=> b!558563 (= e!321761 (not true))))

(assert (=> b!558563 e!321762))

(declare-fun res!350419 () Bool)

(assert (=> b!558563 (=> (not res!350419) (not e!321762))))

(assert (=> b!558563 (= res!350419 (= lt!253841 (Found!5332 j!142)))))

(assert (=> b!558563 (= lt!253841 (seekEntryOrOpen!0 (select (arr!16883 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!558563 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17438 0))(
  ( (Unit!17439) )
))
(declare-fun lt!253840 () Unit!17438)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35156 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17438)

(assert (=> b!558563 (= lt!253840 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(assert (= (and start!51102 res!350425) b!558561))

(assert (= (and b!558561 res!350424) b!558554))

(assert (= (and b!558554 res!350420) b!558558))

(assert (= (and b!558558 res!350418) b!558556))

(assert (= (and b!558556 res!350416) b!558562))

(assert (= (and b!558562 res!350423) b!558559))

(assert (= (and b!558559 res!350421) b!558557))

(assert (= (and b!558557 res!350426) b!558553))

(assert (= (and b!558553 res!350417) b!558563))

(assert (= (and b!558563 res!350419) b!558555))

(assert (= (and b!558555 (not res!350422)) b!558560))

(declare-fun m!536555 () Bool)

(assert (=> b!558556 m!536555))

(declare-fun m!536557 () Bool)

(assert (=> b!558553 m!536557))

(declare-fun m!536559 () Bool)

(assert (=> b!558553 m!536559))

(assert (=> b!558553 m!536557))

(declare-fun m!536561 () Bool)

(assert (=> b!558553 m!536561))

(assert (=> b!558553 m!536561))

(declare-fun m!536563 () Bool)

(assert (=> b!558553 m!536563))

(assert (=> b!558553 m!536557))

(declare-fun m!536565 () Bool)

(assert (=> b!558553 m!536565))

(declare-fun m!536567 () Bool)

(assert (=> b!558553 m!536567))

(assert (=> b!558553 m!536561))

(declare-fun m!536569 () Bool)

(assert (=> b!558553 m!536569))

(declare-fun m!536571 () Bool)

(assert (=> start!51102 m!536571))

(declare-fun m!536573 () Bool)

(assert (=> start!51102 m!536573))

(declare-fun m!536575 () Bool)

(assert (=> b!558557 m!536575))

(declare-fun m!536577 () Bool)

(assert (=> b!558562 m!536577))

(declare-fun m!536579 () Bool)

(assert (=> b!558559 m!536579))

(assert (=> b!558563 m!536557))

(assert (=> b!558563 m!536557))

(declare-fun m!536581 () Bool)

(assert (=> b!558563 m!536581))

(declare-fun m!536583 () Bool)

(assert (=> b!558563 m!536583))

(declare-fun m!536585 () Bool)

(assert (=> b!558563 m!536585))

(assert (=> b!558560 m!536557))

(assert (=> b!558560 m!536557))

(declare-fun m!536587 () Bool)

(assert (=> b!558560 m!536587))

(declare-fun m!536589 () Bool)

(assert (=> b!558555 m!536589))

(assert (=> b!558555 m!536557))

(assert (=> b!558554 m!536557))

(assert (=> b!558554 m!536557))

(declare-fun m!536591 () Bool)

(assert (=> b!558554 m!536591))

(declare-fun m!536593 () Bool)

(assert (=> b!558558 m!536593))

(push 1)

