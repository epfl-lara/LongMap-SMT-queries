; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50586 () Bool)

(assert start!50586)

(declare-fun b!552703 () Bool)

(declare-fun res!345120 () Bool)

(declare-fun e!318929 () Bool)

(assert (=> b!552703 (=> (not res!345120) (not e!318929))))

(declare-datatypes ((array!34811 0))(
  ( (array!34812 (arr!16715 (Array (_ BitVec 32) (_ BitVec 64))) (size!17079 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34811)

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34811 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!552703 (= res!345120 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!552704 () Bool)

(declare-fun res!345119 () Bool)

(assert (=> b!552704 (=> (not res!345119) (not e!318929))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!552704 (= res!345119 (validKeyInArray!0 (select (arr!16715 a!3118) j!142)))))

(declare-fun b!552705 () Bool)

(declare-fun res!345116 () Bool)

(declare-fun e!318930 () Bool)

(assert (=> b!552705 (=> (not res!345116) (not e!318930))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34811 (_ BitVec 32)) Bool)

(assert (=> b!552705 (= res!345116 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!552706 () Bool)

(declare-fun e!318928 () Bool)

(assert (=> b!552706 (= e!318930 e!318928)))

(declare-fun res!345124 () Bool)

(assert (=> b!552706 (=> (not res!345124) (not e!318928))))

(declare-fun lt!251259 () (_ BitVec 32))

(declare-fun lt!251258 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5164 0))(
  ( (MissingZero!5164 (index!22883 (_ BitVec 32))) (Found!5164 (index!22884 (_ BitVec 32))) (Intermediate!5164 (undefined!5976 Bool) (index!22885 (_ BitVec 32)) (x!51814 (_ BitVec 32))) (Undefined!5164) (MissingVacant!5164 (index!22886 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34811 (_ BitVec 32)) SeekEntryResult!5164)

(assert (=> b!552706 (= res!345124 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!251259 (select (arr!16715 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!251258 (select (store (arr!16715 a!3118) i!1132 k!1914) j!142) (array!34812 (store (arr!16715 a!3118) i!1132 k!1914) (size!17079 a!3118)) mask!3119)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!552706 (= lt!251258 (toIndex!0 (select (store (arr!16715 a!3118) i!1132 k!1914) j!142) mask!3119))))

(assert (=> b!552706 (= lt!251259 (toIndex!0 (select (arr!16715 a!3118) j!142) mask!3119))))

(declare-fun res!345122 () Bool)

(assert (=> start!50586 (=> (not res!345122) (not e!318929))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50586 (= res!345122 (validMask!0 mask!3119))))

(assert (=> start!50586 e!318929))

(assert (=> start!50586 true))

(declare-fun array_inv!12511 (array!34811) Bool)

(assert (=> start!50586 (array_inv!12511 a!3118)))

(declare-fun b!552707 () Bool)

(declare-fun e!318925 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34811 (_ BitVec 32)) SeekEntryResult!5164)

(assert (=> b!552707 (= e!318925 (= (seekEntryOrOpen!0 (select (arr!16715 a!3118) j!142) a!3118 mask!3119) (Found!5164 j!142)))))

(declare-fun b!552708 () Bool)

(declare-fun res!345115 () Bool)

(assert (=> b!552708 (=> (not res!345115) (not e!318930))))

(declare-datatypes ((List!10795 0))(
  ( (Nil!10792) (Cons!10791 (h!11776 (_ BitVec 64)) (t!17023 List!10795)) )
))
(declare-fun arrayNoDuplicates!0 (array!34811 (_ BitVec 32) List!10795) Bool)

(assert (=> b!552708 (= res!345115 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10792))))

(declare-fun b!552709 () Bool)

(declare-fun res!345123 () Bool)

(assert (=> b!552709 (=> (not res!345123) (not e!318929))))

(assert (=> b!552709 (= res!345123 (validKeyInArray!0 k!1914))))

(declare-fun b!552710 () Bool)

(declare-fun e!318927 () Bool)

(assert (=> b!552710 (= e!318928 (not e!318927))))

(declare-fun res!345121 () Bool)

(assert (=> b!552710 (=> res!345121 e!318927)))

(assert (=> b!552710 (= res!345121 (or (bvslt mask!3119 #b00000000000000000000000000000000) (bvslt lt!251258 #b00000000000000000000000000000000) (bvsge lt!251258 (bvadd #b00000000000000000000000000000001 mask!3119))))))

(assert (=> b!552710 e!318925))

(declare-fun res!345117 () Bool)

(assert (=> b!552710 (=> (not res!345117) (not e!318925))))

(assert (=> b!552710 (= res!345117 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17102 0))(
  ( (Unit!17103) )
))
(declare-fun lt!251257 () Unit!17102)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34811 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17102)

(assert (=> b!552710 (= lt!251257 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!552711 () Bool)

(assert (=> b!552711 (= e!318929 e!318930)))

(declare-fun res!345125 () Bool)

(assert (=> b!552711 (=> (not res!345125) (not e!318930))))

(declare-fun lt!251260 () SeekEntryResult!5164)

(assert (=> b!552711 (= res!345125 (or (= lt!251260 (MissingZero!5164 i!1132)) (= lt!251260 (MissingVacant!5164 i!1132))))))

(assert (=> b!552711 (= lt!251260 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!552712 () Bool)

(declare-fun res!345118 () Bool)

(assert (=> b!552712 (=> (not res!345118) (not e!318929))))

(assert (=> b!552712 (= res!345118 (and (= (size!17079 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17079 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17079 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!552713 () Bool)

(assert (=> b!552713 (= e!318927 (validKeyInArray!0 (select (store (arr!16715 a!3118) i!1132 k!1914) j!142)))))

(assert (= (and start!50586 res!345122) b!552712))

(assert (= (and b!552712 res!345118) b!552704))

(assert (= (and b!552704 res!345119) b!552709))

(assert (= (and b!552709 res!345123) b!552703))

(assert (= (and b!552703 res!345120) b!552711))

(assert (= (and b!552711 res!345125) b!552705))

(assert (= (and b!552705 res!345116) b!552708))

(assert (= (and b!552708 res!345115) b!552706))

(assert (= (and b!552706 res!345124) b!552710))

(assert (= (and b!552710 res!345117) b!552707))

(assert (= (and b!552710 (not res!345121)) b!552713))

(declare-fun m!529639 () Bool)

(assert (=> b!552706 m!529639))

(declare-fun m!529641 () Bool)

(assert (=> b!552706 m!529641))

(assert (=> b!552706 m!529639))

(declare-fun m!529643 () Bool)

(assert (=> b!552706 m!529643))

(assert (=> b!552706 m!529643))

(declare-fun m!529645 () Bool)

(assert (=> b!552706 m!529645))

(assert (=> b!552706 m!529639))

(declare-fun m!529647 () Bool)

(assert (=> b!552706 m!529647))

(declare-fun m!529649 () Bool)

(assert (=> b!552706 m!529649))

(assert (=> b!552706 m!529643))

(declare-fun m!529651 () Bool)

(assert (=> b!552706 m!529651))

(declare-fun m!529653 () Bool)

(assert (=> start!50586 m!529653))

(declare-fun m!529655 () Bool)

(assert (=> start!50586 m!529655))

(assert (=> b!552704 m!529639))

(assert (=> b!552704 m!529639))

(declare-fun m!529657 () Bool)

(assert (=> b!552704 m!529657))

(declare-fun m!529659 () Bool)

(assert (=> b!552705 m!529659))

(declare-fun m!529661 () Bool)

(assert (=> b!552711 m!529661))

(declare-fun m!529663 () Bool)

(assert (=> b!552709 m!529663))

(assert (=> b!552707 m!529639))

(assert (=> b!552707 m!529639))

(declare-fun m!529665 () Bool)

(assert (=> b!552707 m!529665))

(assert (=> b!552713 m!529649))

(assert (=> b!552713 m!529643))

(assert (=> b!552713 m!529643))

(declare-fun m!529667 () Bool)

(assert (=> b!552713 m!529667))

(declare-fun m!529669 () Bool)

(assert (=> b!552710 m!529669))

(declare-fun m!529671 () Bool)

(assert (=> b!552710 m!529671))

(declare-fun m!529673 () Bool)

(assert (=> b!552703 m!529673))

(declare-fun m!529675 () Bool)

(assert (=> b!552708 m!529675))

(push 1)

