; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51512 () Bool)

(assert start!51512)

(declare-fun res!354678 () Bool)

(declare-fun e!324728 () Bool)

(assert (=> start!51512 (=> (not res!354678) (not e!324728))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51512 (= res!354678 (validMask!0 mask!3119))))

(assert (=> start!51512 e!324728))

(assert (=> start!51512 true))

(declare-datatypes ((array!35377 0))(
  ( (array!35378 (arr!16989 (Array (_ BitVec 32) (_ BitVec 64))) (size!17353 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35377)

(declare-fun array_inv!12785 (array!35377) Bool)

(assert (=> start!51512 (array_inv!12785 a!3118)))

(declare-fun e!324729 () Bool)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun b!563525 () Bool)

(declare-datatypes ((SeekEntryResult!5438 0))(
  ( (MissingZero!5438 (index!23979 (_ BitVec 32))) (Found!5438 (index!23980 (_ BitVec 32))) (Intermediate!5438 (undefined!6250 Bool) (index!23981 (_ BitVec 32)) (x!52869 (_ BitVec 32))) (Undefined!5438) (MissingVacant!5438 (index!23982 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35377 (_ BitVec 32)) SeekEntryResult!5438)

(assert (=> b!563525 (= e!324729 (= (seekEntryOrOpen!0 (select (arr!16989 a!3118) j!142) a!3118 mask!3119) (Found!5438 j!142)))))

(declare-fun b!563526 () Bool)

(declare-fun res!354684 () Bool)

(assert (=> b!563526 (=> (not res!354684) (not e!324728))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!35377 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!563526 (= res!354684 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!563527 () Bool)

(declare-fun res!354685 () Bool)

(assert (=> b!563527 (=> (not res!354685) (not e!324728))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!563527 (= res!354685 (validKeyInArray!0 (select (arr!16989 a!3118) j!142)))))

(declare-fun b!563528 () Bool)

(declare-fun res!354680 () Bool)

(assert (=> b!563528 (=> (not res!354680) (not e!324728))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!563528 (= res!354680 (and (= (size!17353 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17353 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17353 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!563529 () Bool)

(declare-fun res!354686 () Bool)

(declare-fun e!324727 () Bool)

(assert (=> b!563529 (=> (not res!354686) (not e!324727))))

(declare-datatypes ((List!11069 0))(
  ( (Nil!11066) (Cons!11065 (h!12068 (_ BitVec 64)) (t!17297 List!11069)) )
))
(declare-fun arrayNoDuplicates!0 (array!35377 (_ BitVec 32) List!11069) Bool)

(assert (=> b!563529 (= res!354686 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11066))))

(declare-fun b!563530 () Bool)

(assert (=> b!563530 (= e!324727 (not true))))

(assert (=> b!563530 e!324729))

(declare-fun res!354683 () Bool)

(assert (=> b!563530 (=> (not res!354683) (not e!324729))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35377 (_ BitVec 32)) Bool)

(assert (=> b!563530 (= res!354683 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17650 0))(
  ( (Unit!17651) )
))
(declare-fun lt!257251 () Unit!17650)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35377 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17650)

(assert (=> b!563530 (= lt!257251 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!563531 () Bool)

(declare-fun res!354681 () Bool)

(assert (=> b!563531 (=> (not res!354681) (not e!324728))))

(assert (=> b!563531 (= res!354681 (validKeyInArray!0 k!1914))))

(declare-fun b!563532 () Bool)

(declare-fun res!354682 () Bool)

(assert (=> b!563532 (=> (not res!354682) (not e!324727))))

(assert (=> b!563532 (= res!354682 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!563533 () Bool)

(assert (=> b!563533 (= e!324728 e!324727)))

(declare-fun res!354679 () Bool)

(assert (=> b!563533 (=> (not res!354679) (not e!324727))))

(declare-fun lt!257250 () SeekEntryResult!5438)

(assert (=> b!563533 (= res!354679 (or (= lt!257250 (MissingZero!5438 i!1132)) (= lt!257250 (MissingVacant!5438 i!1132))))))

(assert (=> b!563533 (= lt!257250 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!563534 () Bool)

(declare-fun res!354677 () Bool)

(assert (=> b!563534 (=> (not res!354677) (not e!324727))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35377 (_ BitVec 32)) SeekEntryResult!5438)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!563534 (= res!354677 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16989 a!3118) j!142) mask!3119) (select (arr!16989 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16989 a!3118) i!1132 k!1914) j!142) mask!3119) (select (store (arr!16989 a!3118) i!1132 k!1914) j!142) (array!35378 (store (arr!16989 a!3118) i!1132 k!1914) (size!17353 a!3118)) mask!3119)))))

(assert (= (and start!51512 res!354678) b!563528))

(assert (= (and b!563528 res!354680) b!563527))

(assert (= (and b!563527 res!354685) b!563531))

(assert (= (and b!563531 res!354681) b!563526))

(assert (= (and b!563526 res!354684) b!563533))

(assert (= (and b!563533 res!354679) b!563532))

(assert (= (and b!563532 res!354682) b!563529))

(assert (= (and b!563529 res!354686) b!563534))

(assert (= (and b!563534 res!354677) b!563530))

(assert (= (and b!563530 res!354683) b!563525))

(declare-fun m!541887 () Bool)

(assert (=> b!563530 m!541887))

(declare-fun m!541889 () Bool)

(assert (=> b!563530 m!541889))

(declare-fun m!541891 () Bool)

(assert (=> b!563525 m!541891))

(assert (=> b!563525 m!541891))

(declare-fun m!541893 () Bool)

(assert (=> b!563525 m!541893))

(declare-fun m!541895 () Bool)

(assert (=> start!51512 m!541895))

(declare-fun m!541897 () Bool)

(assert (=> start!51512 m!541897))

(declare-fun m!541899 () Bool)

(assert (=> b!563531 m!541899))

(assert (=> b!563534 m!541891))

(declare-fun m!541901 () Bool)

(assert (=> b!563534 m!541901))

(assert (=> b!563534 m!541891))

(declare-fun m!541903 () Bool)

(assert (=> b!563534 m!541903))

(declare-fun m!541905 () Bool)

(assert (=> b!563534 m!541905))

(assert (=> b!563534 m!541903))

(declare-fun m!541907 () Bool)

(assert (=> b!563534 m!541907))

(assert (=> b!563534 m!541901))

(assert (=> b!563534 m!541891))

(declare-fun m!541909 () Bool)

(assert (=> b!563534 m!541909))

(declare-fun m!541911 () Bool)

(assert (=> b!563534 m!541911))

(assert (=> b!563534 m!541903))

(assert (=> b!563534 m!541905))

(declare-fun m!541913 () Bool)

(assert (=> b!563533 m!541913))

(declare-fun m!541915 () Bool)

(assert (=> b!563529 m!541915))

(declare-fun m!541917 () Bool)

(assert (=> b!563532 m!541917))

(assert (=> b!563527 m!541891))

(assert (=> b!563527 m!541891))

(declare-fun m!541919 () Bool)

(assert (=> b!563527 m!541919))

(declare-fun m!541921 () Bool)

(assert (=> b!563526 m!541921))

(push 1)

