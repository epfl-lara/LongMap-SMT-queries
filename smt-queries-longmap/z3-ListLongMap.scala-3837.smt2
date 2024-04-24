; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52818 () Bool)

(assert start!52818)

(declare-fun b!575573 () Bool)

(declare-fun res!363884 () Bool)

(declare-fun e!331189 () Bool)

(assert (=> b!575573 (=> (not res!363884) (not e!331189))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((array!35910 0))(
  ( (array!35911 (arr!17236 (Array (_ BitVec 32) (_ BitVec 64))) (size!17600 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35910)

(assert (=> b!575573 (= res!363884 (and (= (size!17600 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17600 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17600 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!575574 () Bool)

(declare-fun e!331191 () Bool)

(declare-fun e!331193 () Bool)

(assert (=> b!575574 (= e!331191 e!331193)))

(declare-fun res!363893 () Bool)

(assert (=> b!575574 (=> res!363893 e!331193)))

(declare-datatypes ((SeekEntryResult!5641 0))(
  ( (MissingZero!5641 (index!24791 (_ BitVec 32))) (Found!5641 (index!24792 (_ BitVec 32))) (Intermediate!5641 (undefined!6453 Bool) (index!24793 (_ BitVec 32)) (x!53837 (_ BitVec 32))) (Undefined!5641) (MissingVacant!5641 (index!24794 (_ BitVec 32))) )
))
(declare-fun lt!263061 () SeekEntryResult!5641)

(declare-fun lt!263069 () (_ BitVec 64))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun lt!263063 () SeekEntryResult!5641)

(declare-fun lt!263066 () SeekEntryResult!5641)

(assert (=> b!575574 (= res!363893 (or (bvslt (index!24793 lt!263061) #b00000000000000000000000000000000) (bvsge (index!24793 lt!263061) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsgt (x!53837 lt!263061) #b01111111111111111111111111111110) (bvslt (x!53837 lt!263061) #b00000000000000000000000000000000) (not (= lt!263069 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (store (arr!17236 a!3118) i!1132 k0!1914) (index!24793 lt!263061)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!263066 lt!263063))))))

(declare-fun lt!263064 () SeekEntryResult!5641)

(declare-fun lt!263058 () SeekEntryResult!5641)

(assert (=> b!575574 (= lt!263064 lt!263058)))

(declare-fun lt!263070 () (_ BitVec 64))

(declare-fun lt!263060 () array!35910)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35910 (_ BitVec 32)) SeekEntryResult!5641)

(assert (=> b!575574 (= lt!263058 (seekKeyOrZeroReturnVacant!0 (x!53837 lt!263061) (index!24793 lt!263061) (index!24793 lt!263061) lt!263070 lt!263060 mask!3119))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35910 (_ BitVec 32)) SeekEntryResult!5641)

(assert (=> b!575574 (= lt!263064 (seekEntryOrOpen!0 lt!263070 lt!263060 mask!3119))))

(declare-fun lt!263065 () SeekEntryResult!5641)

(assert (=> b!575574 (= lt!263065 lt!263066)))

(assert (=> b!575574 (= lt!263066 (seekKeyOrZeroReturnVacant!0 (x!53837 lt!263061) (index!24793 lt!263061) (index!24793 lt!263061) (select (arr!17236 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!575575 () Bool)

(declare-fun e!331188 () Bool)

(declare-fun e!331192 () Bool)

(assert (=> b!575575 (= e!331188 e!331192)))

(declare-fun res!363894 () Bool)

(assert (=> b!575575 (=> (not res!363894) (not e!331192))))

(declare-fun lt!263071 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35910 (_ BitVec 32)) SeekEntryResult!5641)

(assert (=> b!575575 (= res!363894 (= lt!263061 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!263071 lt!263070 lt!263060 mask!3119)))))

(declare-fun lt!263068 () (_ BitVec 32))

(assert (=> b!575575 (= lt!263061 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!263068 (select (arr!17236 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!575575 (= lt!263071 (toIndex!0 lt!263070 mask!3119))))

(assert (=> b!575575 (= lt!263070 (select (store (arr!17236 a!3118) i!1132 k0!1914) j!142))))

(assert (=> b!575575 (= lt!263068 (toIndex!0 (select (arr!17236 a!3118) j!142) mask!3119))))

(assert (=> b!575575 (= lt!263060 (array!35911 (store (arr!17236 a!3118) i!1132 k0!1914) (size!17600 a!3118)))))

(declare-fun b!575576 () Bool)

(declare-fun res!363892 () Bool)

(assert (=> b!575576 (=> (not res!363892) (not e!331189))))

(declare-fun arrayContainsKey!0 (array!35910 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!575576 (= res!363892 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!575578 () Bool)

(declare-fun res!363885 () Bool)

(assert (=> b!575578 (=> (not res!363885) (not e!331189))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!575578 (= res!363885 (validKeyInArray!0 k0!1914))))

(declare-fun b!575579 () Bool)

(assert (=> b!575579 (= e!331189 e!331188)))

(declare-fun res!363889 () Bool)

(assert (=> b!575579 (=> (not res!363889) (not e!331188))))

(declare-fun lt!263059 () SeekEntryResult!5641)

(assert (=> b!575579 (= res!363889 (or (= lt!263059 (MissingZero!5641 i!1132)) (= lt!263059 (MissingVacant!5641 i!1132))))))

(assert (=> b!575579 (= lt!263059 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun res!363886 () Bool)

(assert (=> start!52818 (=> (not res!363886) (not e!331189))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52818 (= res!363886 (validMask!0 mask!3119))))

(assert (=> start!52818 e!331189))

(assert (=> start!52818 true))

(declare-fun array_inv!13095 (array!35910) Bool)

(assert (=> start!52818 (array_inv!13095 a!3118)))

(declare-fun b!575577 () Bool)

(declare-fun res!363891 () Bool)

(assert (=> b!575577 (=> (not res!363891) (not e!331188))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35910 (_ BitVec 32)) Bool)

(assert (=> b!575577 (= res!363891 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!575580 () Bool)

(declare-fun res!363895 () Bool)

(assert (=> b!575580 (=> (not res!363895) (not e!331189))))

(assert (=> b!575580 (= res!363895 (validKeyInArray!0 (select (arr!17236 a!3118) j!142)))))

(declare-fun b!575581 () Bool)

(declare-fun e!331190 () Bool)

(assert (=> b!575581 (= e!331190 e!331191)))

(declare-fun res!363887 () Bool)

(assert (=> b!575581 (=> res!363887 e!331191)))

(assert (=> b!575581 (= res!363887 (or (= lt!263069 (select (arr!17236 a!3118) j!142)) (= lt!263069 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!575581 (= lt!263069 (select (arr!17236 a!3118) (index!24793 lt!263061)))))

(declare-fun b!575582 () Bool)

(assert (=> b!575582 (= e!331192 (not e!331190))))

(declare-fun res!363890 () Bool)

(assert (=> b!575582 (=> res!363890 e!331190)))

(get-info :version)

(assert (=> b!575582 (= res!363890 (or (undefined!6453 lt!263061) (not ((_ is Intermediate!5641) lt!263061))))))

(assert (=> b!575582 (= lt!263065 lt!263063)))

(assert (=> b!575582 (= lt!263063 (Found!5641 j!142))))

(assert (=> b!575582 (= lt!263065 (seekEntryOrOpen!0 (select (arr!17236 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!575582 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!18055 0))(
  ( (Unit!18056) )
))
(declare-fun lt!263067 () Unit!18055)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35910 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18055)

(assert (=> b!575582 (= lt!263067 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!575583 () Bool)

(declare-fun res!363888 () Bool)

(assert (=> b!575583 (=> (not res!363888) (not e!331188))))

(declare-datatypes ((List!11223 0))(
  ( (Nil!11220) (Cons!11219 (h!12261 (_ BitVec 64)) (t!17443 List!11223)) )
))
(declare-fun arrayNoDuplicates!0 (array!35910 (_ BitVec 32) List!11223) Bool)

(assert (=> b!575583 (= res!363888 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11220))))

(declare-fun b!575584 () Bool)

(assert (=> b!575584 (= e!331193 true)))

(assert (=> b!575584 (= lt!263066 lt!263058)))

(declare-fun lt!263062 () Unit!18055)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!35910 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18055)

(assert (=> b!575584 (= lt!263062 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!3118 i!1132 k0!1914 j!142 (x!53837 lt!263061) (index!24793 lt!263061) (index!24793 lt!263061) mask!3119))))

(assert (= (and start!52818 res!363886) b!575573))

(assert (= (and b!575573 res!363884) b!575580))

(assert (= (and b!575580 res!363895) b!575578))

(assert (= (and b!575578 res!363885) b!575576))

(assert (= (and b!575576 res!363892) b!575579))

(assert (= (and b!575579 res!363889) b!575577))

(assert (= (and b!575577 res!363891) b!575583))

(assert (= (and b!575583 res!363888) b!575575))

(assert (= (and b!575575 res!363894) b!575582))

(assert (= (and b!575582 (not res!363890)) b!575581))

(assert (= (and b!575581 (not res!363887)) b!575574))

(assert (= (and b!575574 (not res!363893)) b!575584))

(declare-fun m!554543 () Bool)

(assert (=> start!52818 m!554543))

(declare-fun m!554545 () Bool)

(assert (=> start!52818 m!554545))

(declare-fun m!554547 () Bool)

(assert (=> b!575578 m!554547))

(declare-fun m!554549 () Bool)

(assert (=> b!575574 m!554549))

(declare-fun m!554551 () Bool)

(assert (=> b!575574 m!554551))

(assert (=> b!575574 m!554549))

(declare-fun m!554553 () Bool)

(assert (=> b!575574 m!554553))

(declare-fun m!554555 () Bool)

(assert (=> b!575574 m!554555))

(declare-fun m!554557 () Bool)

(assert (=> b!575574 m!554557))

(declare-fun m!554559 () Bool)

(assert (=> b!575574 m!554559))

(declare-fun m!554561 () Bool)

(assert (=> b!575575 m!554561))

(assert (=> b!575575 m!554549))

(declare-fun m!554563 () Bool)

(assert (=> b!575575 m!554563))

(assert (=> b!575575 m!554549))

(declare-fun m!554565 () Bool)

(assert (=> b!575575 m!554565))

(assert (=> b!575575 m!554549))

(declare-fun m!554567 () Bool)

(assert (=> b!575575 m!554567))

(assert (=> b!575575 m!554559))

(declare-fun m!554569 () Bool)

(assert (=> b!575575 m!554569))

(assert (=> b!575580 m!554549))

(assert (=> b!575580 m!554549))

(declare-fun m!554571 () Bool)

(assert (=> b!575580 m!554571))

(declare-fun m!554573 () Bool)

(assert (=> b!575579 m!554573))

(declare-fun m!554575 () Bool)

(assert (=> b!575577 m!554575))

(assert (=> b!575582 m!554549))

(assert (=> b!575582 m!554549))

(declare-fun m!554577 () Bool)

(assert (=> b!575582 m!554577))

(declare-fun m!554579 () Bool)

(assert (=> b!575582 m!554579))

(declare-fun m!554581 () Bool)

(assert (=> b!575582 m!554581))

(declare-fun m!554583 () Bool)

(assert (=> b!575584 m!554583))

(declare-fun m!554585 () Bool)

(assert (=> b!575576 m!554585))

(assert (=> b!575581 m!554549))

(declare-fun m!554587 () Bool)

(assert (=> b!575581 m!554587))

(declare-fun m!554589 () Bool)

(assert (=> b!575583 m!554589))

(check-sat (not b!575579) (not b!575582) (not b!575575) (not b!575584) (not b!575577) (not b!575580) (not b!575578) (not b!575583) (not start!52818) (not b!575574) (not b!575576))
(check-sat)
