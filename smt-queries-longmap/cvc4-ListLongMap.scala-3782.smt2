; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51750 () Bool)

(assert start!51750)

(declare-fun b!566243 () Bool)

(declare-fun res!357214 () Bool)

(declare-fun e!325883 () Bool)

(assert (=> b!566243 (=> (not res!357214) (not e!325883))))

(declare-datatypes ((array!35558 0))(
  ( (array!35559 (arr!17078 (Array (_ BitVec 32) (_ BitVec 64))) (size!17442 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35558)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!566243 (= res!357214 (validKeyInArray!0 (select (arr!17078 a!3118) j!142)))))

(declare-fun b!566244 () Bool)

(declare-fun res!357220 () Bool)

(declare-fun e!325884 () Bool)

(assert (=> b!566244 (=> (not res!357220) (not e!325884))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5527 0))(
  ( (MissingZero!5527 (index!24335 (_ BitVec 32))) (Found!5527 (index!24336 (_ BitVec 32))) (Intermediate!5527 (undefined!6339 Bool) (index!24337 (_ BitVec 32)) (x!53196 (_ BitVec 32))) (Undefined!5527) (MissingVacant!5527 (index!24338 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35558 (_ BitVec 32)) SeekEntryResult!5527)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!566244 (= res!357220 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17078 a!3118) j!142) mask!3119) (select (arr!17078 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!17078 a!3118) i!1132 k!1914) j!142) mask!3119) (select (store (arr!17078 a!3118) i!1132 k!1914) j!142) (array!35559 (store (arr!17078 a!3118) i!1132 k!1914) (size!17442 a!3118)) mask!3119)))))

(declare-fun b!566245 () Bool)

(declare-fun res!357219 () Bool)

(assert (=> b!566245 (=> (not res!357219) (not e!325883))))

(assert (=> b!566245 (= res!357219 (and (= (size!17442 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17442 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17442 a!3118)) (not (= i!1132 j!142))))))

(declare-fun e!325882 () Bool)

(declare-fun b!566246 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35558 (_ BitVec 32)) SeekEntryResult!5527)

(assert (=> b!566246 (= e!325882 (= (seekEntryOrOpen!0 (select (arr!17078 a!3118) j!142) a!3118 mask!3119) (Found!5527 j!142)))))

(declare-fun b!566247 () Bool)

(declare-fun res!357216 () Bool)

(assert (=> b!566247 (=> (not res!357216) (not e!325883))))

(declare-fun arrayContainsKey!0 (array!35558 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!566247 (= res!357216 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!566248 () Bool)

(declare-fun res!357213 () Bool)

(assert (=> b!566248 (=> (not res!357213) (not e!325884))))

(declare-datatypes ((List!11158 0))(
  ( (Nil!11155) (Cons!11154 (h!12160 (_ BitVec 64)) (t!17386 List!11158)) )
))
(declare-fun arrayNoDuplicates!0 (array!35558 (_ BitVec 32) List!11158) Bool)

(assert (=> b!566248 (= res!357213 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11155))))

(declare-fun b!566249 () Bool)

(declare-fun res!357212 () Bool)

(assert (=> b!566249 (=> (not res!357212) (not e!325883))))

(assert (=> b!566249 (= res!357212 (validKeyInArray!0 k!1914))))

(declare-fun b!566251 () Bool)

(assert (=> b!566251 (= e!325884 (not true))))

(assert (=> b!566251 e!325882))

(declare-fun res!357218 () Bool)

(assert (=> b!566251 (=> (not res!357218) (not e!325882))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35558 (_ BitVec 32)) Bool)

(assert (=> b!566251 (= res!357218 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17756 0))(
  ( (Unit!17757) )
))
(declare-fun lt!258049 () Unit!17756)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35558 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17756)

(assert (=> b!566251 (= lt!258049 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!566252 () Bool)

(assert (=> b!566252 (= e!325883 e!325884)))

(declare-fun res!357221 () Bool)

(assert (=> b!566252 (=> (not res!357221) (not e!325884))))

(declare-fun lt!258048 () SeekEntryResult!5527)

(assert (=> b!566252 (= res!357221 (or (= lt!258048 (MissingZero!5527 i!1132)) (= lt!258048 (MissingVacant!5527 i!1132))))))

(assert (=> b!566252 (= lt!258048 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!566250 () Bool)

(declare-fun res!357217 () Bool)

(assert (=> b!566250 (=> (not res!357217) (not e!325884))))

(assert (=> b!566250 (= res!357217 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun res!357215 () Bool)

(assert (=> start!51750 (=> (not res!357215) (not e!325883))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51750 (= res!357215 (validMask!0 mask!3119))))

(assert (=> start!51750 e!325883))

(assert (=> start!51750 true))

(declare-fun array_inv!12874 (array!35558) Bool)

(assert (=> start!51750 (array_inv!12874 a!3118)))

(assert (= (and start!51750 res!357215) b!566245))

(assert (= (and b!566245 res!357219) b!566243))

(assert (= (and b!566243 res!357214) b!566249))

(assert (= (and b!566249 res!357212) b!566247))

(assert (= (and b!566247 res!357216) b!566252))

(assert (= (and b!566252 res!357221) b!566250))

(assert (= (and b!566250 res!357217) b!566248))

(assert (= (and b!566248 res!357213) b!566244))

(assert (= (and b!566244 res!357220) b!566251))

(assert (= (and b!566251 res!357218) b!566246))

(declare-fun m!544863 () Bool)

(assert (=> b!566248 m!544863))

(declare-fun m!544865 () Bool)

(assert (=> b!566252 m!544865))

(declare-fun m!544867 () Bool)

(assert (=> b!566243 m!544867))

(assert (=> b!566243 m!544867))

(declare-fun m!544869 () Bool)

(assert (=> b!566243 m!544869))

(assert (=> b!566244 m!544867))

(declare-fun m!544871 () Bool)

(assert (=> b!566244 m!544871))

(assert (=> b!566244 m!544867))

(declare-fun m!544873 () Bool)

(assert (=> b!566244 m!544873))

(declare-fun m!544875 () Bool)

(assert (=> b!566244 m!544875))

(assert (=> b!566244 m!544873))

(declare-fun m!544877 () Bool)

(assert (=> b!566244 m!544877))

(assert (=> b!566244 m!544871))

(assert (=> b!566244 m!544867))

(declare-fun m!544879 () Bool)

(assert (=> b!566244 m!544879))

(declare-fun m!544881 () Bool)

(assert (=> b!566244 m!544881))

(assert (=> b!566244 m!544873))

(assert (=> b!566244 m!544875))

(declare-fun m!544883 () Bool)

(assert (=> b!566247 m!544883))

(assert (=> b!566246 m!544867))

(assert (=> b!566246 m!544867))

(declare-fun m!544885 () Bool)

(assert (=> b!566246 m!544885))

(declare-fun m!544887 () Bool)

(assert (=> start!51750 m!544887))

(declare-fun m!544889 () Bool)

(assert (=> start!51750 m!544889))

(declare-fun m!544891 () Bool)

(assert (=> b!566249 m!544891))

(declare-fun m!544893 () Bool)

(assert (=> b!566250 m!544893))

(declare-fun m!544895 () Bool)

(assert (=> b!566251 m!544895))

(declare-fun m!544897 () Bool)

(assert (=> b!566251 m!544897))

(push 1)

