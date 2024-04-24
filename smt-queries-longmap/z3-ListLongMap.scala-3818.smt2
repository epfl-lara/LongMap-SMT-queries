; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52440 () Bool)

(assert start!52440)

(declare-fun b!571846 () Bool)

(declare-fun res!361251 () Bool)

(declare-fun e!328916 () Bool)

(assert (=> b!571846 (=> (not res!361251) (not e!328916))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!571846 (= res!361251 (validKeyInArray!0 k0!1914))))

(declare-fun b!571847 () Bool)

(declare-fun res!361249 () Bool)

(assert (=> b!571847 (=> (not res!361249) (not e!328916))))

(declare-datatypes ((array!35784 0))(
  ( (array!35785 (arr!17179 (Array (_ BitVec 32) (_ BitVec 64))) (size!17543 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35784)

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!571847 (= res!361249 (validKeyInArray!0 (select (arr!17179 a!3118) j!142)))))

(declare-fun b!571848 () Bool)

(declare-fun e!328918 () Bool)

(declare-fun e!328919 () Bool)

(assert (=> b!571848 (= e!328918 e!328919)))

(declare-fun res!361258 () Bool)

(assert (=> b!571848 (=> (not res!361258) (not e!328919))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun lt!260798 () (_ BitVec 32))

(declare-fun lt!260801 () array!35784)

(declare-fun lt!260803 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!5584 0))(
  ( (MissingZero!5584 (index!24563 (_ BitVec 32))) (Found!5584 (index!24564 (_ BitVec 32))) (Intermediate!5584 (undefined!6396 Bool) (index!24565 (_ BitVec 32)) (x!53592 (_ BitVec 32))) (Undefined!5584) (MissingVacant!5584 (index!24566 (_ BitVec 32))) )
))
(declare-fun lt!260805 () SeekEntryResult!5584)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35784 (_ BitVec 32)) SeekEntryResult!5584)

(assert (=> b!571848 (= res!361258 (= lt!260805 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!260798 lt!260803 lt!260801 mask!3119)))))

(declare-fun lt!260806 () (_ BitVec 32))

(assert (=> b!571848 (= lt!260805 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!260806 (select (arr!17179 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!571848 (= lt!260798 (toIndex!0 lt!260803 mask!3119))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!571848 (= lt!260803 (select (store (arr!17179 a!3118) i!1132 k0!1914) j!142))))

(assert (=> b!571848 (= lt!260806 (toIndex!0 (select (arr!17179 a!3118) j!142) mask!3119))))

(assert (=> b!571848 (= lt!260801 (array!35785 (store (arr!17179 a!3118) i!1132 k0!1914) (size!17543 a!3118)))))

(declare-fun res!361254 () Bool)

(assert (=> start!52440 (=> (not res!361254) (not e!328916))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52440 (= res!361254 (validMask!0 mask!3119))))

(assert (=> start!52440 e!328916))

(assert (=> start!52440 true))

(declare-fun array_inv!13038 (array!35784) Bool)

(assert (=> start!52440 (array_inv!13038 a!3118)))

(declare-fun b!571849 () Bool)

(declare-fun e!328920 () Bool)

(declare-fun e!328923 () Bool)

(assert (=> b!571849 (= e!328920 e!328923)))

(declare-fun res!361253 () Bool)

(assert (=> b!571849 (=> (not res!361253) (not e!328923))))

(declare-fun lt!260799 () SeekEntryResult!5584)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35784 (_ BitVec 32)) SeekEntryResult!5584)

(assert (=> b!571849 (= res!361253 (= lt!260799 (seekKeyOrZeroReturnVacant!0 (x!53592 lt!260805) (index!24565 lt!260805) (index!24565 lt!260805) (select (arr!17179 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!571850 () Bool)

(assert (=> b!571850 (= e!328916 e!328918)))

(declare-fun res!361255 () Bool)

(assert (=> b!571850 (=> (not res!361255) (not e!328918))))

(declare-fun lt!260802 () SeekEntryResult!5584)

(assert (=> b!571850 (= res!361255 (or (= lt!260802 (MissingZero!5584 i!1132)) (= lt!260802 (MissingVacant!5584 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35784 (_ BitVec 32)) SeekEntryResult!5584)

(assert (=> b!571850 (= lt!260802 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!571851 () Bool)

(declare-fun res!361256 () Bool)

(assert (=> b!571851 (=> (not res!361256) (not e!328916))))

(assert (=> b!571851 (= res!361256 (and (= (size!17543 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17543 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17543 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!571852 () Bool)

(declare-fun e!328917 () Bool)

(assert (=> b!571852 (= e!328917 e!328920)))

(declare-fun res!361252 () Bool)

(assert (=> b!571852 (=> res!361252 e!328920)))

(declare-fun lt!260804 () (_ BitVec 64))

(assert (=> b!571852 (= res!361252 (or (= lt!260804 (select (arr!17179 a!3118) j!142)) (= lt!260804 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!571852 (= lt!260804 (select (arr!17179 a!3118) (index!24565 lt!260805)))))

(declare-fun b!571853 () Bool)

(declare-fun res!361250 () Bool)

(assert (=> b!571853 (=> (not res!361250) (not e!328918))))

(declare-datatypes ((List!11166 0))(
  ( (Nil!11163) (Cons!11162 (h!12192 (_ BitVec 64)) (t!17386 List!11166)) )
))
(declare-fun arrayNoDuplicates!0 (array!35784 (_ BitVec 32) List!11166) Bool)

(assert (=> b!571853 (= res!361250 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11163))))

(declare-fun b!571854 () Bool)

(declare-fun res!361261 () Bool)

(assert (=> b!571854 (=> (not res!361261) (not e!328916))))

(declare-fun arrayContainsKey!0 (array!35784 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!571854 (= res!361261 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!571855 () Bool)

(assert (=> b!571855 (= e!328923 (= (seekEntryOrOpen!0 lt!260803 lt!260801 mask!3119) (seekKeyOrZeroReturnVacant!0 (x!53592 lt!260805) (index!24565 lt!260805) (index!24565 lt!260805) lt!260803 lt!260801 mask!3119)))))

(declare-fun b!571856 () Bool)

(declare-fun res!361259 () Bool)

(assert (=> b!571856 (=> (not res!361259) (not e!328918))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35784 (_ BitVec 32)) Bool)

(assert (=> b!571856 (= res!361259 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!571857 () Bool)

(declare-fun e!328922 () Bool)

(assert (=> b!571857 (= e!328922 e!328917)))

(declare-fun res!361257 () Bool)

(assert (=> b!571857 (=> res!361257 e!328917)))

(get-info :version)

(assert (=> b!571857 (= res!361257 (or (undefined!6396 lt!260805) (not ((_ is Intermediate!5584) lt!260805))))))

(declare-fun b!571858 () Bool)

(assert (=> b!571858 (= e!328919 (not true))))

(assert (=> b!571858 e!328922))

(declare-fun res!361260 () Bool)

(assert (=> b!571858 (=> (not res!361260) (not e!328922))))

(assert (=> b!571858 (= res!361260 (= lt!260799 (Found!5584 j!142)))))

(assert (=> b!571858 (= lt!260799 (seekEntryOrOpen!0 (select (arr!17179 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!571858 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17941 0))(
  ( (Unit!17942) )
))
(declare-fun lt!260800 () Unit!17941)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35784 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17941)

(assert (=> b!571858 (= lt!260800 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(assert (= (and start!52440 res!361254) b!571851))

(assert (= (and b!571851 res!361256) b!571847))

(assert (= (and b!571847 res!361249) b!571846))

(assert (= (and b!571846 res!361251) b!571854))

(assert (= (and b!571854 res!361261) b!571850))

(assert (= (and b!571850 res!361255) b!571856))

(assert (= (and b!571856 res!361259) b!571853))

(assert (= (and b!571853 res!361250) b!571848))

(assert (= (and b!571848 res!361258) b!571858))

(assert (= (and b!571858 res!361260) b!571857))

(assert (= (and b!571857 (not res!361257)) b!571852))

(assert (= (and b!571852 (not res!361252)) b!571849))

(assert (= (and b!571849 res!361253) b!571855))

(declare-fun m!550859 () Bool)

(assert (=> b!571853 m!550859))

(declare-fun m!550861 () Bool)

(assert (=> b!571850 m!550861))

(declare-fun m!550863 () Bool)

(assert (=> start!52440 m!550863))

(declare-fun m!550865 () Bool)

(assert (=> start!52440 m!550865))

(declare-fun m!550867 () Bool)

(assert (=> b!571854 m!550867))

(declare-fun m!550869 () Bool)

(assert (=> b!571846 m!550869))

(declare-fun m!550871 () Bool)

(assert (=> b!571847 m!550871))

(assert (=> b!571847 m!550871))

(declare-fun m!550873 () Bool)

(assert (=> b!571847 m!550873))

(assert (=> b!571858 m!550871))

(assert (=> b!571858 m!550871))

(declare-fun m!550875 () Bool)

(assert (=> b!571858 m!550875))

(declare-fun m!550877 () Bool)

(assert (=> b!571858 m!550877))

(declare-fun m!550879 () Bool)

(assert (=> b!571858 m!550879))

(declare-fun m!550881 () Bool)

(assert (=> b!571856 m!550881))

(assert (=> b!571852 m!550871))

(declare-fun m!550883 () Bool)

(assert (=> b!571852 m!550883))

(declare-fun m!550885 () Bool)

(assert (=> b!571855 m!550885))

(declare-fun m!550887 () Bool)

(assert (=> b!571855 m!550887))

(assert (=> b!571849 m!550871))

(assert (=> b!571849 m!550871))

(declare-fun m!550889 () Bool)

(assert (=> b!571849 m!550889))

(declare-fun m!550891 () Bool)

(assert (=> b!571848 m!550891))

(assert (=> b!571848 m!550871))

(declare-fun m!550893 () Bool)

(assert (=> b!571848 m!550893))

(assert (=> b!571848 m!550871))

(declare-fun m!550895 () Bool)

(assert (=> b!571848 m!550895))

(declare-fun m!550897 () Bool)

(assert (=> b!571848 m!550897))

(assert (=> b!571848 m!550871))

(declare-fun m!550899 () Bool)

(assert (=> b!571848 m!550899))

(declare-fun m!550901 () Bool)

(assert (=> b!571848 m!550901))

(check-sat (not b!571856) (not start!52440) (not b!571853) (not b!571848) (not b!571854) (not b!571846) (not b!571858) (not b!571847) (not b!571855) (not b!571849) (not b!571850))
(check-sat)
