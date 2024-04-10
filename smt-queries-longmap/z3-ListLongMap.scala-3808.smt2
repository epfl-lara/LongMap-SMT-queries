; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52204 () Bool)

(assert start!52204)

(declare-fun b!569927 () Bool)

(declare-fun res!359953 () Bool)

(declare-fun e!327792 () Bool)

(assert (=> b!569927 (=> (not res!359953) (not e!327792))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!569927 (= res!359953 (validKeyInArray!0 k0!1914))))

(declare-fun b!569928 () Bool)

(declare-fun res!359954 () Bool)

(declare-fun e!327789 () Bool)

(assert (=> b!569928 (=> (not res!359954) (not e!327789))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((array!35727 0))(
  ( (array!35728 (arr!17155 (Array (_ BitVec 32) (_ BitVec 64))) (size!17519 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35727)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5604 0))(
  ( (MissingZero!5604 (index!24643 (_ BitVec 32))) (Found!5604 (index!24644 (_ BitVec 32))) (Intermediate!5604 (undefined!6416 Bool) (index!24645 (_ BitVec 32)) (x!53511 (_ BitVec 32))) (Undefined!5604) (MissingVacant!5604 (index!24646 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35727 (_ BitVec 32)) SeekEntryResult!5604)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!569928 (= res!359954 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17155 a!3118) j!142) mask!3119) (select (arr!17155 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!17155 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!17155 a!3118) i!1132 k0!1914) j!142) (array!35728 (store (arr!17155 a!3118) i!1132 k0!1914) (size!17519 a!3118)) mask!3119)))))

(declare-fun res!359947 () Bool)

(assert (=> start!52204 (=> (not res!359947) (not e!327792))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52204 (= res!359947 (validMask!0 mask!3119))))

(assert (=> start!52204 e!327792))

(assert (=> start!52204 true))

(declare-fun array_inv!12951 (array!35727) Bool)

(assert (=> start!52204 (array_inv!12951 a!3118)))

(declare-fun b!569929 () Bool)

(assert (=> b!569929 (= e!327792 e!327789)))

(declare-fun res!359949 () Bool)

(assert (=> b!569929 (=> (not res!359949) (not e!327789))))

(declare-fun lt!259803 () SeekEntryResult!5604)

(assert (=> b!569929 (= res!359949 (or (= lt!259803 (MissingZero!5604 i!1132)) (= lt!259803 (MissingVacant!5604 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35727 (_ BitVec 32)) SeekEntryResult!5604)

(assert (=> b!569929 (= lt!259803 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!569930 () Bool)

(declare-fun res!359950 () Bool)

(assert (=> b!569930 (=> (not res!359950) (not e!327789))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35727 (_ BitVec 32)) Bool)

(assert (=> b!569930 (= res!359950 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!569931 () Bool)

(declare-fun res!359952 () Bool)

(assert (=> b!569931 (=> (not res!359952) (not e!327792))))

(declare-fun arrayContainsKey!0 (array!35727 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!569931 (= res!359952 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!569932 () Bool)

(declare-fun res!359945 () Bool)

(assert (=> b!569932 (=> (not res!359945) (not e!327789))))

(declare-datatypes ((List!11235 0))(
  ( (Nil!11232) (Cons!11231 (h!12252 (_ BitVec 64)) (t!17463 List!11235)) )
))
(declare-fun arrayNoDuplicates!0 (array!35727 (_ BitVec 32) List!11235) Bool)

(assert (=> b!569932 (= res!359945 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11232))))

(declare-fun b!569933 () Bool)

(declare-fun res!359951 () Bool)

(assert (=> b!569933 (=> (not res!359951) (not e!327792))))

(assert (=> b!569933 (= res!359951 (and (= (size!17519 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17519 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17519 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!569934 () Bool)

(declare-fun e!327790 () Bool)

(assert (=> b!569934 (= e!327790 (= (seekEntryOrOpen!0 (select (arr!17155 a!3118) j!142) a!3118 mask!3119) (Found!5604 j!142)))))

(declare-fun b!569935 () Bool)

(declare-fun res!359948 () Bool)

(assert (=> b!569935 (=> (not res!359948) (not e!327792))))

(assert (=> b!569935 (= res!359948 (validKeyInArray!0 (select (arr!17155 a!3118) j!142)))))

(declare-fun b!569936 () Bool)

(assert (=> b!569936 (= e!327789 (not true))))

(assert (=> b!569936 e!327790))

(declare-fun res!359946 () Bool)

(assert (=> b!569936 (=> (not res!359946) (not e!327790))))

(assert (=> b!569936 (= res!359946 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17910 0))(
  ( (Unit!17911) )
))
(declare-fun lt!259804 () Unit!17910)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35727 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17910)

(assert (=> b!569936 (= lt!259804 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(assert (= (and start!52204 res!359947) b!569933))

(assert (= (and b!569933 res!359951) b!569935))

(assert (= (and b!569935 res!359948) b!569927))

(assert (= (and b!569927 res!359953) b!569931))

(assert (= (and b!569931 res!359952) b!569929))

(assert (= (and b!569929 res!359949) b!569930))

(assert (= (and b!569930 res!359950) b!569932))

(assert (= (and b!569932 res!359945) b!569928))

(assert (= (and b!569928 res!359954) b!569936))

(assert (= (and b!569936 res!359946) b!569934))

(declare-fun m!548829 () Bool)

(assert (=> b!569936 m!548829))

(declare-fun m!548831 () Bool)

(assert (=> b!569936 m!548831))

(declare-fun m!548833 () Bool)

(assert (=> b!569929 m!548833))

(declare-fun m!548835 () Bool)

(assert (=> b!569931 m!548835))

(declare-fun m!548837 () Bool)

(assert (=> b!569932 m!548837))

(declare-fun m!548839 () Bool)

(assert (=> b!569935 m!548839))

(assert (=> b!569935 m!548839))

(declare-fun m!548841 () Bool)

(assert (=> b!569935 m!548841))

(declare-fun m!548843 () Bool)

(assert (=> b!569927 m!548843))

(declare-fun m!548845 () Bool)

(assert (=> b!569930 m!548845))

(assert (=> b!569928 m!548839))

(declare-fun m!548847 () Bool)

(assert (=> b!569928 m!548847))

(assert (=> b!569928 m!548839))

(declare-fun m!548849 () Bool)

(assert (=> b!569928 m!548849))

(declare-fun m!548851 () Bool)

(assert (=> b!569928 m!548851))

(assert (=> b!569928 m!548849))

(declare-fun m!548853 () Bool)

(assert (=> b!569928 m!548853))

(assert (=> b!569928 m!548847))

(assert (=> b!569928 m!548839))

(declare-fun m!548855 () Bool)

(assert (=> b!569928 m!548855))

(declare-fun m!548857 () Bool)

(assert (=> b!569928 m!548857))

(assert (=> b!569928 m!548849))

(assert (=> b!569928 m!548851))

(declare-fun m!548859 () Bool)

(assert (=> start!52204 m!548859))

(declare-fun m!548861 () Bool)

(assert (=> start!52204 m!548861))

(assert (=> b!569934 m!548839))

(assert (=> b!569934 m!548839))

(declare-fun m!548863 () Bool)

(assert (=> b!569934 m!548863))

(check-sat (not b!569930) (not b!569929) (not b!569932) (not b!569927) (not start!52204) (not b!569928) (not b!569934) (not b!569936) (not b!569931) (not b!569935))
(check-sat)
