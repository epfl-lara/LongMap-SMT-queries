; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52408 () Bool)

(assert start!52408)

(declare-fun b!571919 () Bool)

(declare-fun e!328956 () Bool)

(declare-fun e!328955 () Bool)

(assert (=> b!571919 (= e!328956 e!328955)))

(declare-fun res!361436 () Bool)

(assert (=> b!571919 (=> (not res!361436) (not e!328955))))

(declare-datatypes ((array!35805 0))(
  ( (array!35806 (arr!17191 (Array (_ BitVec 32) (_ BitVec 64))) (size!17555 (_ BitVec 32))) )
))
(declare-fun lt!260878 () array!35805)

(declare-fun lt!260881 () (_ BitVec 32))

(declare-fun lt!260882 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!5640 0))(
  ( (MissingZero!5640 (index!24787 (_ BitVec 32))) (Found!5640 (index!24788 (_ BitVec 32))) (Intermediate!5640 (undefined!6452 Bool) (index!24789 (_ BitVec 32)) (x!53661 (_ BitVec 32))) (Undefined!5640) (MissingVacant!5640 (index!24790 (_ BitVec 32))) )
))
(declare-fun lt!260884 () SeekEntryResult!5640)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35805 (_ BitVec 32)) SeekEntryResult!5640)

(assert (=> b!571919 (= res!361436 (= lt!260884 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!260881 lt!260882 lt!260878 mask!3119)))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun lt!260876 () (_ BitVec 32))

(declare-fun a!3118 () array!35805)

(assert (=> b!571919 (= lt!260884 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!260876 (select (arr!17191 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!571919 (= lt!260881 (toIndex!0 lt!260882 mask!3119))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!571919 (= lt!260882 (select (store (arr!17191 a!3118) i!1132 k0!1914) j!142))))

(assert (=> b!571919 (= lt!260876 (toIndex!0 (select (arr!17191 a!3118) j!142) mask!3119))))

(assert (=> b!571919 (= lt!260878 (array!35806 (store (arr!17191 a!3118) i!1132 k0!1914) (size!17555 a!3118)))))

(declare-fun res!361434 () Bool)

(declare-fun e!328961 () Bool)

(assert (=> start!52408 (=> (not res!361434) (not e!328961))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52408 (= res!361434 (validMask!0 mask!3119))))

(assert (=> start!52408 e!328961))

(assert (=> start!52408 true))

(declare-fun array_inv!12987 (array!35805) Bool)

(assert (=> start!52408 (array_inv!12987 a!3118)))

(declare-fun b!571920 () Bool)

(assert (=> b!571920 (= e!328961 e!328956)))

(declare-fun res!361428 () Bool)

(assert (=> b!571920 (=> (not res!361428) (not e!328956))))

(declare-fun lt!260879 () SeekEntryResult!5640)

(assert (=> b!571920 (= res!361428 (or (= lt!260879 (MissingZero!5640 i!1132)) (= lt!260879 (MissingVacant!5640 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35805 (_ BitVec 32)) SeekEntryResult!5640)

(assert (=> b!571920 (= lt!260879 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!571921 () Bool)

(declare-fun e!328957 () Bool)

(declare-fun e!328962 () Bool)

(assert (=> b!571921 (= e!328957 e!328962)))

(declare-fun res!361430 () Bool)

(assert (=> b!571921 (=> res!361430 e!328962)))

(get-info :version)

(assert (=> b!571921 (= res!361430 (or (undefined!6452 lt!260884) (not ((_ is Intermediate!5640) lt!260884))))))

(declare-fun b!571922 () Bool)

(declare-fun res!361438 () Bool)

(assert (=> b!571922 (=> (not res!361438) (not e!328956))))

(declare-datatypes ((List!11271 0))(
  ( (Nil!11268) (Cons!11267 (h!12294 (_ BitVec 64)) (t!17499 List!11271)) )
))
(declare-fun arrayNoDuplicates!0 (array!35805 (_ BitVec 32) List!11271) Bool)

(assert (=> b!571922 (= res!361438 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11268))))

(declare-fun b!571923 () Bool)

(assert (=> b!571923 (= e!328955 (not true))))

(assert (=> b!571923 e!328957))

(declare-fun res!361427 () Bool)

(assert (=> b!571923 (=> (not res!361427) (not e!328957))))

(declare-fun lt!260877 () SeekEntryResult!5640)

(assert (=> b!571923 (= res!361427 (= lt!260877 (Found!5640 j!142)))))

(assert (=> b!571923 (= lt!260877 (seekEntryOrOpen!0 (select (arr!17191 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35805 (_ BitVec 32)) Bool)

(assert (=> b!571923 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17982 0))(
  ( (Unit!17983) )
))
(declare-fun lt!260880 () Unit!17982)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35805 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17982)

(assert (=> b!571923 (= lt!260880 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!571924 () Bool)

(declare-fun e!328958 () Bool)

(assert (=> b!571924 (= e!328962 e!328958)))

(declare-fun res!361433 () Bool)

(assert (=> b!571924 (=> res!361433 e!328958)))

(declare-fun lt!260883 () (_ BitVec 64))

(assert (=> b!571924 (= res!361433 (or (= lt!260883 (select (arr!17191 a!3118) j!142)) (= lt!260883 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!571924 (= lt!260883 (select (arr!17191 a!3118) (index!24789 lt!260884)))))

(declare-fun b!571925 () Bool)

(declare-fun res!361431 () Bool)

(assert (=> b!571925 (=> (not res!361431) (not e!328961))))

(declare-fun arrayContainsKey!0 (array!35805 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!571925 (= res!361431 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!571926 () Bool)

(declare-fun res!361439 () Bool)

(assert (=> b!571926 (=> (not res!361439) (not e!328961))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!571926 (= res!361439 (validKeyInArray!0 (select (arr!17191 a!3118) j!142)))))

(declare-fun b!571927 () Bool)

(declare-fun e!328959 () Bool)

(assert (=> b!571927 (= e!328958 e!328959)))

(declare-fun res!361432 () Bool)

(assert (=> b!571927 (=> (not res!361432) (not e!328959))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35805 (_ BitVec 32)) SeekEntryResult!5640)

(assert (=> b!571927 (= res!361432 (= lt!260877 (seekKeyOrZeroReturnVacant!0 (x!53661 lt!260884) (index!24789 lt!260884) (index!24789 lt!260884) (select (arr!17191 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!571928 () Bool)

(declare-fun res!361437 () Bool)

(assert (=> b!571928 (=> (not res!361437) (not e!328961))))

(assert (=> b!571928 (= res!361437 (and (= (size!17555 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17555 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17555 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!571929 () Bool)

(assert (=> b!571929 (= e!328959 (= (seekEntryOrOpen!0 lt!260882 lt!260878 mask!3119) (seekKeyOrZeroReturnVacant!0 (x!53661 lt!260884) (index!24789 lt!260884) (index!24789 lt!260884) lt!260882 lt!260878 mask!3119)))))

(declare-fun b!571930 () Bool)

(declare-fun res!361429 () Bool)

(assert (=> b!571930 (=> (not res!361429) (not e!328956))))

(assert (=> b!571930 (= res!361429 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!571931 () Bool)

(declare-fun res!361435 () Bool)

(assert (=> b!571931 (=> (not res!361435) (not e!328961))))

(assert (=> b!571931 (= res!361435 (validKeyInArray!0 k0!1914))))

(assert (= (and start!52408 res!361434) b!571928))

(assert (= (and b!571928 res!361437) b!571926))

(assert (= (and b!571926 res!361439) b!571931))

(assert (= (and b!571931 res!361435) b!571925))

(assert (= (and b!571925 res!361431) b!571920))

(assert (= (and b!571920 res!361428) b!571930))

(assert (= (and b!571930 res!361429) b!571922))

(assert (= (and b!571922 res!361438) b!571919))

(assert (= (and b!571919 res!361436) b!571923))

(assert (= (and b!571923 res!361427) b!571921))

(assert (= (and b!571921 (not res!361430)) b!571924))

(assert (= (and b!571924 (not res!361433)) b!571927))

(assert (= (and b!571927 res!361432) b!571929))

(declare-fun m!550829 () Bool)

(assert (=> b!571926 m!550829))

(assert (=> b!571926 m!550829))

(declare-fun m!550831 () Bool)

(assert (=> b!571926 m!550831))

(assert (=> b!571919 m!550829))

(declare-fun m!550833 () Bool)

(assert (=> b!571919 m!550833))

(assert (=> b!571919 m!550829))

(declare-fun m!550835 () Bool)

(assert (=> b!571919 m!550835))

(declare-fun m!550837 () Bool)

(assert (=> b!571919 m!550837))

(declare-fun m!550839 () Bool)

(assert (=> b!571919 m!550839))

(assert (=> b!571919 m!550829))

(declare-fun m!550841 () Bool)

(assert (=> b!571919 m!550841))

(declare-fun m!550843 () Bool)

(assert (=> b!571919 m!550843))

(assert (=> b!571923 m!550829))

(assert (=> b!571923 m!550829))

(declare-fun m!550845 () Bool)

(assert (=> b!571923 m!550845))

(declare-fun m!550847 () Bool)

(assert (=> b!571923 m!550847))

(declare-fun m!550849 () Bool)

(assert (=> b!571923 m!550849))

(declare-fun m!550851 () Bool)

(assert (=> b!571920 m!550851))

(declare-fun m!550853 () Bool)

(assert (=> start!52408 m!550853))

(declare-fun m!550855 () Bool)

(assert (=> start!52408 m!550855))

(assert (=> b!571927 m!550829))

(assert (=> b!571927 m!550829))

(declare-fun m!550857 () Bool)

(assert (=> b!571927 m!550857))

(declare-fun m!550859 () Bool)

(assert (=> b!571925 m!550859))

(declare-fun m!550861 () Bool)

(assert (=> b!571922 m!550861))

(assert (=> b!571924 m!550829))

(declare-fun m!550863 () Bool)

(assert (=> b!571924 m!550863))

(declare-fun m!550865 () Bool)

(assert (=> b!571929 m!550865))

(declare-fun m!550867 () Bool)

(assert (=> b!571929 m!550867))

(declare-fun m!550869 () Bool)

(assert (=> b!571930 m!550869))

(declare-fun m!550871 () Bool)

(assert (=> b!571931 m!550871))

(check-sat (not b!571922) (not start!52408) (not b!571923) (not b!571926) (not b!571929) (not b!571931) (not b!571920) (not b!571925) (not b!571930) (not b!571919) (not b!571927))
(check-sat)
