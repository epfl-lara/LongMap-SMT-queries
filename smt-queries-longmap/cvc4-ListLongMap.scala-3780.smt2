; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51738 () Bool)

(assert start!51738)

(declare-fun b!566063 () Bool)

(declare-fun e!325812 () Bool)

(assert (=> b!566063 (= e!325812 (not true))))

(declare-fun e!325810 () Bool)

(assert (=> b!566063 e!325810))

(declare-fun res!357041 () Bool)

(assert (=> b!566063 (=> (not res!357041) (not e!325810))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-datatypes ((array!35546 0))(
  ( (array!35547 (arr!17072 (Array (_ BitVec 32) (_ BitVec 64))) (size!17436 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35546)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35546 (_ BitVec 32)) Bool)

(assert (=> b!566063 (= res!357041 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17744 0))(
  ( (Unit!17745) )
))
(declare-fun lt!258012 () Unit!17744)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35546 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17744)

(assert (=> b!566063 (= lt!258012 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!566064 () Bool)

(declare-fun res!357034 () Bool)

(declare-fun e!325811 () Bool)

(assert (=> b!566064 (=> (not res!357034) (not e!325811))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!566064 (= res!357034 (validKeyInArray!0 (select (arr!17072 a!3118) j!142)))))

(declare-fun b!566065 () Bool)

(declare-fun res!357038 () Bool)

(assert (=> b!566065 (=> (not res!357038) (not e!325812))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5521 0))(
  ( (MissingZero!5521 (index!24311 (_ BitVec 32))) (Found!5521 (index!24312 (_ BitVec 32))) (Intermediate!5521 (undefined!6333 Bool) (index!24313 (_ BitVec 32)) (x!53174 (_ BitVec 32))) (Undefined!5521) (MissingVacant!5521 (index!24314 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35546 (_ BitVec 32)) SeekEntryResult!5521)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!566065 (= res!357038 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17072 a!3118) j!142) mask!3119) (select (arr!17072 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!17072 a!3118) i!1132 k!1914) j!142) mask!3119) (select (store (arr!17072 a!3118) i!1132 k!1914) j!142) (array!35547 (store (arr!17072 a!3118) i!1132 k!1914) (size!17436 a!3118)) mask!3119)))))

(declare-fun b!566066 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35546 (_ BitVec 32)) SeekEntryResult!5521)

(assert (=> b!566066 (= e!325810 (= (seekEntryOrOpen!0 (select (arr!17072 a!3118) j!142) a!3118 mask!3119) (Found!5521 j!142)))))

(declare-fun res!357037 () Bool)

(assert (=> start!51738 (=> (not res!357037) (not e!325811))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51738 (= res!357037 (validMask!0 mask!3119))))

(assert (=> start!51738 e!325811))

(assert (=> start!51738 true))

(declare-fun array_inv!12868 (array!35546) Bool)

(assert (=> start!51738 (array_inv!12868 a!3118)))

(declare-fun b!566067 () Bool)

(declare-fun res!357040 () Bool)

(assert (=> b!566067 (=> (not res!357040) (not e!325812))))

(assert (=> b!566067 (= res!357040 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!566068 () Bool)

(assert (=> b!566068 (= e!325811 e!325812)))

(declare-fun res!357036 () Bool)

(assert (=> b!566068 (=> (not res!357036) (not e!325812))))

(declare-fun lt!258013 () SeekEntryResult!5521)

(assert (=> b!566068 (= res!357036 (or (= lt!258013 (MissingZero!5521 i!1132)) (= lt!258013 (MissingVacant!5521 i!1132))))))

(assert (=> b!566068 (= lt!258013 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!566069 () Bool)

(declare-fun res!357032 () Bool)

(assert (=> b!566069 (=> (not res!357032) (not e!325811))))

(assert (=> b!566069 (= res!357032 (and (= (size!17436 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17436 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17436 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!566070 () Bool)

(declare-fun res!357035 () Bool)

(assert (=> b!566070 (=> (not res!357035) (not e!325812))))

(declare-datatypes ((List!11152 0))(
  ( (Nil!11149) (Cons!11148 (h!12154 (_ BitVec 64)) (t!17380 List!11152)) )
))
(declare-fun arrayNoDuplicates!0 (array!35546 (_ BitVec 32) List!11152) Bool)

(assert (=> b!566070 (= res!357035 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11149))))

(declare-fun b!566071 () Bool)

(declare-fun res!357033 () Bool)

(assert (=> b!566071 (=> (not res!357033) (not e!325811))))

(declare-fun arrayContainsKey!0 (array!35546 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!566071 (= res!357033 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!566072 () Bool)

(declare-fun res!357039 () Bool)

(assert (=> b!566072 (=> (not res!357039) (not e!325811))))

(assert (=> b!566072 (= res!357039 (validKeyInArray!0 k!1914))))

(assert (= (and start!51738 res!357037) b!566069))

(assert (= (and b!566069 res!357032) b!566064))

(assert (= (and b!566064 res!357034) b!566072))

(assert (= (and b!566072 res!357039) b!566071))

(assert (= (and b!566071 res!357033) b!566068))

(assert (= (and b!566068 res!357036) b!566067))

(assert (= (and b!566067 res!357040) b!566070))

(assert (= (and b!566070 res!357035) b!566065))

(assert (= (and b!566065 res!357038) b!566063))

(assert (= (and b!566063 res!357041) b!566066))

(declare-fun m!544647 () Bool)

(assert (=> b!566063 m!544647))

(declare-fun m!544649 () Bool)

(assert (=> b!566063 m!544649))

(declare-fun m!544651 () Bool)

(assert (=> b!566064 m!544651))

(assert (=> b!566064 m!544651))

(declare-fun m!544653 () Bool)

(assert (=> b!566064 m!544653))

(declare-fun m!544655 () Bool)

(assert (=> b!566067 m!544655))

(declare-fun m!544657 () Bool)

(assert (=> b!566072 m!544657))

(assert (=> b!566066 m!544651))

(assert (=> b!566066 m!544651))

(declare-fun m!544659 () Bool)

(assert (=> b!566066 m!544659))

(declare-fun m!544661 () Bool)

(assert (=> b!566071 m!544661))

(declare-fun m!544663 () Bool)

(assert (=> b!566070 m!544663))

(assert (=> b!566065 m!544651))

(declare-fun m!544665 () Bool)

(assert (=> b!566065 m!544665))

(assert (=> b!566065 m!544651))

(declare-fun m!544667 () Bool)

(assert (=> b!566065 m!544667))

(declare-fun m!544669 () Bool)

(assert (=> b!566065 m!544669))

(assert (=> b!566065 m!544667))

(declare-fun m!544671 () Bool)

(assert (=> b!566065 m!544671))

(assert (=> b!566065 m!544665))

(assert (=> b!566065 m!544651))

(declare-fun m!544673 () Bool)

(assert (=> b!566065 m!544673))

(declare-fun m!544675 () Bool)

(assert (=> b!566065 m!544675))

(assert (=> b!566065 m!544667))

(assert (=> b!566065 m!544669))

(declare-fun m!544677 () Bool)

(assert (=> start!51738 m!544677))

(declare-fun m!544679 () Bool)

(assert (=> start!51738 m!544679))

(declare-fun m!544681 () Bool)

(assert (=> b!566068 m!544681))

(push 1)

