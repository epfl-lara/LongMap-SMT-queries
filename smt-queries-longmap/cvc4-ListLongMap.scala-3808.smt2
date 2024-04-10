; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52206 () Bool)

(assert start!52206)

(declare-fun res!359979 () Bool)

(declare-fun e!327802 () Bool)

(assert (=> start!52206 (=> (not res!359979) (not e!327802))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52206 (= res!359979 (validMask!0 mask!3119))))

(assert (=> start!52206 e!327802))

(assert (=> start!52206 true))

(declare-datatypes ((array!35729 0))(
  ( (array!35730 (arr!17156 (Array (_ BitVec 32) (_ BitVec 64))) (size!17520 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35729)

(declare-fun array_inv!12952 (array!35729) Bool)

(assert (=> start!52206 (array_inv!12952 a!3118)))

(declare-fun b!569957 () Bool)

(declare-fun e!327803 () Bool)

(assert (=> b!569957 (= e!327802 e!327803)))

(declare-fun res!359984 () Bool)

(assert (=> b!569957 (=> (not res!359984) (not e!327803))))

(declare-datatypes ((SeekEntryResult!5605 0))(
  ( (MissingZero!5605 (index!24647 (_ BitVec 32))) (Found!5605 (index!24648 (_ BitVec 32))) (Intermediate!5605 (undefined!6417 Bool) (index!24649 (_ BitVec 32)) (x!53512 (_ BitVec 32))) (Undefined!5605) (MissingVacant!5605 (index!24650 (_ BitVec 32))) )
))
(declare-fun lt!259809 () SeekEntryResult!5605)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!569957 (= res!359984 (or (= lt!259809 (MissingZero!5605 i!1132)) (= lt!259809 (MissingVacant!5605 i!1132))))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35729 (_ BitVec 32)) SeekEntryResult!5605)

(assert (=> b!569957 (= lt!259809 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!569958 () Bool)

(declare-fun res!359981 () Bool)

(assert (=> b!569958 (=> (not res!359981) (not e!327803))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35729 (_ BitVec 32)) SeekEntryResult!5605)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!569958 (= res!359981 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17156 a!3118) j!142) mask!3119) (select (arr!17156 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!17156 a!3118) i!1132 k!1914) j!142) mask!3119) (select (store (arr!17156 a!3118) i!1132 k!1914) j!142) (array!35730 (store (arr!17156 a!3118) i!1132 k!1914) (size!17520 a!3118)) mask!3119)))))

(declare-fun b!569959 () Bool)

(declare-fun res!359978 () Bool)

(assert (=> b!569959 (=> (not res!359978) (not e!327802))))

(assert (=> b!569959 (= res!359978 (and (= (size!17520 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17520 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17520 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!569960 () Bool)

(declare-fun res!359977 () Bool)

(assert (=> b!569960 (=> (not res!359977) (not e!327802))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!569960 (= res!359977 (validKeyInArray!0 (select (arr!17156 a!3118) j!142)))))

(declare-fun b!569961 () Bool)

(assert (=> b!569961 (= e!327803 (not true))))

(declare-fun e!327801 () Bool)

(assert (=> b!569961 e!327801))

(declare-fun res!359980 () Bool)

(assert (=> b!569961 (=> (not res!359980) (not e!327801))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35729 (_ BitVec 32)) Bool)

(assert (=> b!569961 (= res!359980 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17912 0))(
  ( (Unit!17913) )
))
(declare-fun lt!259810 () Unit!17912)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35729 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17912)

(assert (=> b!569961 (= lt!259810 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!569962 () Bool)

(assert (=> b!569962 (= e!327801 (= (seekEntryOrOpen!0 (select (arr!17156 a!3118) j!142) a!3118 mask!3119) (Found!5605 j!142)))))

(declare-fun b!569963 () Bool)

(declare-fun res!359983 () Bool)

(assert (=> b!569963 (=> (not res!359983) (not e!327803))))

(declare-datatypes ((List!11236 0))(
  ( (Nil!11233) (Cons!11232 (h!12253 (_ BitVec 64)) (t!17464 List!11236)) )
))
(declare-fun arrayNoDuplicates!0 (array!35729 (_ BitVec 32) List!11236) Bool)

(assert (=> b!569963 (= res!359983 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11233))))

(declare-fun b!569964 () Bool)

(declare-fun res!359982 () Bool)

(assert (=> b!569964 (=> (not res!359982) (not e!327802))))

(assert (=> b!569964 (= res!359982 (validKeyInArray!0 k!1914))))

(declare-fun b!569965 () Bool)

(declare-fun res!359976 () Bool)

(assert (=> b!569965 (=> (not res!359976) (not e!327802))))

(declare-fun arrayContainsKey!0 (array!35729 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!569965 (= res!359976 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!569966 () Bool)

(declare-fun res!359975 () Bool)

(assert (=> b!569966 (=> (not res!359975) (not e!327803))))

(assert (=> b!569966 (= res!359975 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(assert (= (and start!52206 res!359979) b!569959))

(assert (= (and b!569959 res!359978) b!569960))

(assert (= (and b!569960 res!359977) b!569964))

(assert (= (and b!569964 res!359982) b!569965))

(assert (= (and b!569965 res!359976) b!569957))

(assert (= (and b!569957 res!359984) b!569966))

(assert (= (and b!569966 res!359975) b!569963))

(assert (= (and b!569963 res!359983) b!569958))

(assert (= (and b!569958 res!359981) b!569961))

(assert (= (and b!569961 res!359980) b!569962))

(declare-fun m!548865 () Bool)

(assert (=> b!569960 m!548865))

(assert (=> b!569960 m!548865))

(declare-fun m!548867 () Bool)

(assert (=> b!569960 m!548867))

(assert (=> b!569958 m!548865))

(declare-fun m!548869 () Bool)

(assert (=> b!569958 m!548869))

(assert (=> b!569958 m!548865))

(declare-fun m!548871 () Bool)

(assert (=> b!569958 m!548871))

(declare-fun m!548873 () Bool)

(assert (=> b!569958 m!548873))

(assert (=> b!569958 m!548871))

(declare-fun m!548875 () Bool)

(assert (=> b!569958 m!548875))

(assert (=> b!569958 m!548869))

(assert (=> b!569958 m!548865))

(declare-fun m!548877 () Bool)

(assert (=> b!569958 m!548877))

(declare-fun m!548879 () Bool)

(assert (=> b!569958 m!548879))

(assert (=> b!569958 m!548871))

(assert (=> b!569958 m!548873))

(assert (=> b!569962 m!548865))

(assert (=> b!569962 m!548865))

(declare-fun m!548881 () Bool)

(assert (=> b!569962 m!548881))

(declare-fun m!548883 () Bool)

(assert (=> b!569961 m!548883))

(declare-fun m!548885 () Bool)

(assert (=> b!569961 m!548885))

(declare-fun m!548887 () Bool)

(assert (=> b!569966 m!548887))

(declare-fun m!548889 () Bool)

(assert (=> b!569963 m!548889))

(declare-fun m!548891 () Bool)

(assert (=> b!569964 m!548891))

(declare-fun m!548893 () Bool)

(assert (=> b!569957 m!548893))

(declare-fun m!548895 () Bool)

(assert (=> b!569965 m!548895))

(declare-fun m!548897 () Bool)

(assert (=> start!52206 m!548897))

(declare-fun m!548899 () Bool)

(assert (=> start!52206 m!548899))

(push 1)

