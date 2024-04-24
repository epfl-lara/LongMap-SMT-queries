; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52236 () Bool)

(assert start!52236)

(declare-fun b!569924 () Bool)

(declare-fun res!359839 () Bool)

(declare-fun e!327837 () Bool)

(assert (=> b!569924 (=> (not res!359839) (not e!327837))))

(declare-datatypes ((array!35706 0))(
  ( (array!35707 (arr!17143 (Array (_ BitVec 32) (_ BitVec 64))) (size!17507 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35706)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35706 (_ BitVec 32)) Bool)

(assert (=> b!569924 (= res!359839 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!569925 () Bool)

(declare-fun res!359845 () Bool)

(declare-fun e!327835 () Bool)

(assert (=> b!569925 (=> (not res!359845) (not e!327835))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!569925 (= res!359845 (validKeyInArray!0 k0!1914))))

(declare-fun b!569926 () Bool)

(declare-fun res!359840 () Bool)

(assert (=> b!569926 (=> (not res!359840) (not e!327835))))

(declare-fun arrayContainsKey!0 (array!35706 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!569926 (= res!359840 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!569927 () Bool)

(declare-fun e!327836 () Bool)

(assert (=> b!569927 (= e!327836 (not true))))

(declare-datatypes ((SeekEntryResult!5548 0))(
  ( (MissingZero!5548 (index!24419 (_ BitVec 32))) (Found!5548 (index!24420 (_ BitVec 32))) (Intermediate!5548 (undefined!6360 Bool) (index!24421 (_ BitVec 32)) (x!53442 (_ BitVec 32))) (Undefined!5548) (MissingVacant!5548 (index!24422 (_ BitVec 32))) )
))
(declare-fun lt!259844 () SeekEntryResult!5548)

(declare-fun lt!259848 () SeekEntryResult!5548)

(declare-fun j!142 () (_ BitVec 32))

(get-info :version)

(assert (=> b!569927 (and (= lt!259844 (Found!5548 j!142)) (or (undefined!6360 lt!259848) (not ((_ is Intermediate!5548) lt!259848)) (= (select (arr!17143 a!3118) (index!24421 lt!259848)) (select (arr!17143 a!3118) j!142)) (not (= (select (arr!17143 a!3118) (index!24421 lt!259848)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= lt!259844 (MissingZero!5548 (index!24421 lt!259848)))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35706 (_ BitVec 32)) SeekEntryResult!5548)

(assert (=> b!569927 (= lt!259844 (seekEntryOrOpen!0 (select (arr!17143 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!569927 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17869 0))(
  ( (Unit!17870) )
))
(declare-fun lt!259849 () Unit!17869)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35706 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17869)

(assert (=> b!569927 (= lt!259849 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!569928 () Bool)

(declare-fun res!359841 () Bool)

(assert (=> b!569928 (=> (not res!359841) (not e!327837))))

(declare-datatypes ((List!11130 0))(
  ( (Nil!11127) (Cons!11126 (h!12150 (_ BitVec 64)) (t!17350 List!11130)) )
))
(declare-fun arrayNoDuplicates!0 (array!35706 (_ BitVec 32) List!11130) Bool)

(assert (=> b!569928 (= res!359841 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11127))))

(declare-fun b!569929 () Bool)

(declare-fun res!359837 () Bool)

(assert (=> b!569929 (=> (not res!359837) (not e!327835))))

(assert (=> b!569929 (= res!359837 (validKeyInArray!0 (select (arr!17143 a!3118) j!142)))))

(declare-fun b!569931 () Bool)

(declare-fun res!359844 () Bool)

(assert (=> b!569931 (=> (not res!359844) (not e!327835))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!569931 (= res!359844 (and (= (size!17507 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17507 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17507 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!569932 () Bool)

(assert (=> b!569932 (= e!327837 e!327836)))

(declare-fun res!359838 () Bool)

(assert (=> b!569932 (=> (not res!359838) (not e!327836))))

(declare-fun lt!259847 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35706 (_ BitVec 32)) SeekEntryResult!5548)

(assert (=> b!569932 (= res!359838 (= lt!259848 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!259847 (select (store (arr!17143 a!3118) i!1132 k0!1914) j!142) (array!35707 (store (arr!17143 a!3118) i!1132 k0!1914) (size!17507 a!3118)) mask!3119)))))

(declare-fun lt!259846 () (_ BitVec 32))

(assert (=> b!569932 (= lt!259848 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!259846 (select (arr!17143 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!569932 (= lt!259847 (toIndex!0 (select (store (arr!17143 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!569932 (= lt!259846 (toIndex!0 (select (arr!17143 a!3118) j!142) mask!3119))))

(declare-fun res!359842 () Bool)

(assert (=> start!52236 (=> (not res!359842) (not e!327835))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52236 (= res!359842 (validMask!0 mask!3119))))

(assert (=> start!52236 e!327835))

(assert (=> start!52236 true))

(declare-fun array_inv!13002 (array!35706) Bool)

(assert (=> start!52236 (array_inv!13002 a!3118)))

(declare-fun b!569930 () Bool)

(assert (=> b!569930 (= e!327835 e!327837)))

(declare-fun res!359843 () Bool)

(assert (=> b!569930 (=> (not res!359843) (not e!327837))))

(declare-fun lt!259845 () SeekEntryResult!5548)

(assert (=> b!569930 (= res!359843 (or (= lt!259845 (MissingZero!5548 i!1132)) (= lt!259845 (MissingVacant!5548 i!1132))))))

(assert (=> b!569930 (= lt!259845 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(assert (= (and start!52236 res!359842) b!569931))

(assert (= (and b!569931 res!359844) b!569929))

(assert (= (and b!569929 res!359837) b!569925))

(assert (= (and b!569925 res!359845) b!569926))

(assert (= (and b!569926 res!359840) b!569930))

(assert (= (and b!569930 res!359843) b!569924))

(assert (= (and b!569924 res!359839) b!569928))

(assert (= (and b!569928 res!359841) b!569932))

(assert (= (and b!569932 res!359838) b!569927))

(declare-fun m!548909 () Bool)

(assert (=> b!569928 m!548909))

(declare-fun m!548911 () Bool)

(assert (=> b!569924 m!548911))

(declare-fun m!548913 () Bool)

(assert (=> b!569932 m!548913))

(declare-fun m!548915 () Bool)

(assert (=> b!569932 m!548915))

(assert (=> b!569932 m!548913))

(declare-fun m!548917 () Bool)

(assert (=> b!569932 m!548917))

(declare-fun m!548919 () Bool)

(assert (=> b!569932 m!548919))

(assert (=> b!569932 m!548913))

(declare-fun m!548921 () Bool)

(assert (=> b!569932 m!548921))

(assert (=> b!569932 m!548917))

(declare-fun m!548923 () Bool)

(assert (=> b!569932 m!548923))

(assert (=> b!569932 m!548917))

(declare-fun m!548925 () Bool)

(assert (=> b!569932 m!548925))

(declare-fun m!548927 () Bool)

(assert (=> b!569930 m!548927))

(declare-fun m!548929 () Bool)

(assert (=> b!569926 m!548929))

(declare-fun m!548931 () Bool)

(assert (=> start!52236 m!548931))

(declare-fun m!548933 () Bool)

(assert (=> start!52236 m!548933))

(declare-fun m!548935 () Bool)

(assert (=> b!569925 m!548935))

(assert (=> b!569929 m!548913))

(assert (=> b!569929 m!548913))

(declare-fun m!548937 () Bool)

(assert (=> b!569929 m!548937))

(declare-fun m!548939 () Bool)

(assert (=> b!569927 m!548939))

(assert (=> b!569927 m!548913))

(declare-fun m!548941 () Bool)

(assert (=> b!569927 m!548941))

(declare-fun m!548943 () Bool)

(assert (=> b!569927 m!548943))

(assert (=> b!569927 m!548913))

(declare-fun m!548945 () Bool)

(assert (=> b!569927 m!548945))

(check-sat (not b!569932) (not b!569930) (not start!52236) (not b!569924) (not b!569927) (not b!569925) (not b!569926) (not b!569929) (not b!569928))
(check-sat)
