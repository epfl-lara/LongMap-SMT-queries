; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51350 () Bool)

(assert start!51350)

(declare-fun b!560516 () Bool)

(declare-fun res!351678 () Bool)

(declare-fun e!322952 () Bool)

(assert (=> b!560516 (=> (not res!351678) (not e!322952))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!560516 (= res!351678 (validKeyInArray!0 k!1914))))

(declare-fun b!560517 () Bool)

(declare-fun e!322954 () Bool)

(declare-fun e!322955 () Bool)

(assert (=> b!560517 (= e!322954 e!322955)))

(declare-fun res!351672 () Bool)

(assert (=> b!560517 (=> res!351672 e!322955)))

(declare-datatypes ((SeekEntryResult!5357 0))(
  ( (MissingZero!5357 (index!23655 (_ BitVec 32))) (Found!5357 (index!23656 (_ BitVec 32))) (Intermediate!5357 (undefined!6169 Bool) (index!23657 (_ BitVec 32)) (x!52572 (_ BitVec 32))) (Undefined!5357) (MissingVacant!5357 (index!23658 (_ BitVec 32))) )
))
(declare-fun lt!254873 () SeekEntryResult!5357)

(assert (=> b!560517 (= res!351672 (or (undefined!6169 lt!254873) (not (is-Intermediate!5357 lt!254873))))))

(declare-fun b!560518 () Bool)

(declare-fun res!351671 () Bool)

(assert (=> b!560518 (=> (not res!351671) (not e!322952))))

(declare-datatypes ((array!35215 0))(
  ( (array!35216 (arr!16908 (Array (_ BitVec 32) (_ BitVec 64))) (size!17272 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35215)

(declare-fun arrayContainsKey!0 (array!35215 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!560518 (= res!351671 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!560519 () Bool)

(declare-fun e!322956 () Bool)

(assert (=> b!560519 (= e!322956 (not true))))

(assert (=> b!560519 e!322954))

(declare-fun res!351677 () Bool)

(assert (=> b!560519 (=> (not res!351677) (not e!322954))))

(declare-fun lt!254876 () SeekEntryResult!5357)

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!560519 (= res!351677 (= lt!254876 (Found!5357 j!142)))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35215 (_ BitVec 32)) SeekEntryResult!5357)

(assert (=> b!560519 (= lt!254876 (seekEntryOrOpen!0 (select (arr!16908 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35215 (_ BitVec 32)) Bool)

(assert (=> b!560519 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17488 0))(
  ( (Unit!17489) )
))
(declare-fun lt!254872 () Unit!17488)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35215 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17488)

(assert (=> b!560519 (= lt!254872 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!560520 () Bool)

(declare-fun lt!254877 () (_ BitVec 64))

(declare-fun e!322959 () Bool)

(declare-fun lt!254875 () array!35215)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35215 (_ BitVec 32)) SeekEntryResult!5357)

(assert (=> b!560520 (= e!322959 (= (seekEntryOrOpen!0 lt!254877 lt!254875 mask!3119) (seekKeyOrZeroReturnVacant!0 (x!52572 lt!254873) (index!23657 lt!254873) (index!23657 lt!254873) lt!254877 lt!254875 mask!3119)))))

(declare-fun b!560521 () Bool)

(declare-fun e!322957 () Bool)

(assert (=> b!560521 (= e!322955 e!322957)))

(declare-fun res!351675 () Bool)

(assert (=> b!560521 (=> res!351675 e!322957)))

(declare-fun lt!254871 () (_ BitVec 64))

(assert (=> b!560521 (= res!351675 (or (= lt!254871 (select (arr!16908 a!3118) j!142)) (= lt!254871 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!560521 (= lt!254871 (select (arr!16908 a!3118) (index!23657 lt!254873)))))

(declare-fun b!560523 () Bool)

(declare-fun e!322958 () Bool)

(assert (=> b!560523 (= e!322952 e!322958)))

(declare-fun res!351669 () Bool)

(assert (=> b!560523 (=> (not res!351669) (not e!322958))))

(declare-fun lt!254870 () SeekEntryResult!5357)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!560523 (= res!351669 (or (= lt!254870 (MissingZero!5357 i!1132)) (= lt!254870 (MissingVacant!5357 i!1132))))))

(assert (=> b!560523 (= lt!254870 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!560524 () Bool)

(declare-fun res!351670 () Bool)

(assert (=> b!560524 (=> (not res!351670) (not e!322952))))

(assert (=> b!560524 (= res!351670 (and (= (size!17272 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17272 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17272 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!560525 () Bool)

(declare-fun res!351674 () Bool)

(assert (=> b!560525 (=> (not res!351674) (not e!322958))))

(declare-datatypes ((List!10988 0))(
  ( (Nil!10985) (Cons!10984 (h!11987 (_ BitVec 64)) (t!17216 List!10988)) )
))
(declare-fun arrayNoDuplicates!0 (array!35215 (_ BitVec 32) List!10988) Bool)

(assert (=> b!560525 (= res!351674 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10985))))

(declare-fun b!560526 () Bool)

(declare-fun res!351680 () Bool)

(assert (=> b!560526 (=> (not res!351680) (not e!322952))))

(assert (=> b!560526 (= res!351680 (validKeyInArray!0 (select (arr!16908 a!3118) j!142)))))

(declare-fun b!560527 () Bool)

(assert (=> b!560527 (= e!322958 e!322956)))

(declare-fun res!351676 () Bool)

(assert (=> b!560527 (=> (not res!351676) (not e!322956))))

(declare-fun lt!254878 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35215 (_ BitVec 32)) SeekEntryResult!5357)

(assert (=> b!560527 (= res!351676 (= lt!254873 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!254878 lt!254877 lt!254875 mask!3119)))))

(declare-fun lt!254874 () (_ BitVec 32))

(assert (=> b!560527 (= lt!254873 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!254874 (select (arr!16908 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!560527 (= lt!254878 (toIndex!0 lt!254877 mask!3119))))

(assert (=> b!560527 (= lt!254877 (select (store (arr!16908 a!3118) i!1132 k!1914) j!142))))

(assert (=> b!560527 (= lt!254874 (toIndex!0 (select (arr!16908 a!3118) j!142) mask!3119))))

(assert (=> b!560527 (= lt!254875 (array!35216 (store (arr!16908 a!3118) i!1132 k!1914) (size!17272 a!3118)))))

(declare-fun b!560528 () Bool)

(declare-fun res!351668 () Bool)

(assert (=> b!560528 (=> (not res!351668) (not e!322958))))

(assert (=> b!560528 (= res!351668 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!560522 () Bool)

(assert (=> b!560522 (= e!322957 e!322959)))

(declare-fun res!351679 () Bool)

(assert (=> b!560522 (=> (not res!351679) (not e!322959))))

(assert (=> b!560522 (= res!351679 (= lt!254876 (seekKeyOrZeroReturnVacant!0 (x!52572 lt!254873) (index!23657 lt!254873) (index!23657 lt!254873) (select (arr!16908 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun res!351673 () Bool)

(assert (=> start!51350 (=> (not res!351673) (not e!322952))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51350 (= res!351673 (validMask!0 mask!3119))))

(assert (=> start!51350 e!322952))

(assert (=> start!51350 true))

(declare-fun array_inv!12704 (array!35215) Bool)

(assert (=> start!51350 (array_inv!12704 a!3118)))

(assert (= (and start!51350 res!351673) b!560524))

(assert (= (and b!560524 res!351670) b!560526))

(assert (= (and b!560526 res!351680) b!560516))

(assert (= (and b!560516 res!351678) b!560518))

(assert (= (and b!560518 res!351671) b!560523))

(assert (= (and b!560523 res!351669) b!560528))

(assert (= (and b!560528 res!351668) b!560525))

(assert (= (and b!560525 res!351674) b!560527))

(assert (= (and b!560527 res!351676) b!560519))

(assert (= (and b!560519 res!351677) b!560517))

(assert (= (and b!560517 (not res!351672)) b!560521))

(assert (= (and b!560521 (not res!351675)) b!560522))

(assert (= (and b!560522 res!351679) b!560520))

(declare-fun m!538293 () Bool)

(assert (=> b!560516 m!538293))

(declare-fun m!538295 () Bool)

(assert (=> b!560521 m!538295))

(declare-fun m!538297 () Bool)

(assert (=> b!560521 m!538297))

(assert (=> b!560519 m!538295))

(assert (=> b!560519 m!538295))

(declare-fun m!538299 () Bool)

(assert (=> b!560519 m!538299))

(declare-fun m!538301 () Bool)

(assert (=> b!560519 m!538301))

(declare-fun m!538303 () Bool)

(assert (=> b!560519 m!538303))

(assert (=> b!560527 m!538295))

(declare-fun m!538305 () Bool)

(assert (=> b!560527 m!538305))

(assert (=> b!560527 m!538295))

(declare-fun m!538307 () Bool)

(assert (=> b!560527 m!538307))

(declare-fun m!538309 () Bool)

(assert (=> b!560527 m!538309))

(declare-fun m!538311 () Bool)

(assert (=> b!560527 m!538311))

(declare-fun m!538313 () Bool)

(assert (=> b!560527 m!538313))

(assert (=> b!560527 m!538295))

(declare-fun m!538315 () Bool)

(assert (=> b!560527 m!538315))

(declare-fun m!538317 () Bool)

(assert (=> b!560520 m!538317))

(declare-fun m!538319 () Bool)

(assert (=> b!560520 m!538319))

(declare-fun m!538321 () Bool)

(assert (=> start!51350 m!538321))

(declare-fun m!538323 () Bool)

(assert (=> start!51350 m!538323))

(declare-fun m!538325 () Bool)

(assert (=> b!560525 m!538325))

(declare-fun m!538327 () Bool)

(assert (=> b!560518 m!538327))

(declare-fun m!538329 () Bool)

(assert (=> b!560528 m!538329))

(assert (=> b!560522 m!538295))

(assert (=> b!560522 m!538295))

(declare-fun m!538331 () Bool)

(assert (=> b!560522 m!538331))

(assert (=> b!560526 m!538295))

(assert (=> b!560526 m!538295))

(declare-fun m!538333 () Bool)

(assert (=> b!560526 m!538333))

(declare-fun m!538335 () Bool)

(assert (=> b!560523 m!538335))

(push 1)

