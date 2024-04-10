; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67992 () Bool)

(assert start!67992)

(declare-fun b!791096 () Bool)

(declare-fun e!439676 () Bool)

(declare-fun e!439682 () Bool)

(assert (=> b!791096 (= e!439676 e!439682)))

(declare-fun res!535889 () Bool)

(assert (=> b!791096 (=> (not res!535889) (not e!439682))))

(declare-datatypes ((array!42906 0))(
  ( (array!42907 (arr!20538 (Array (_ BitVec 32) (_ BitVec 64))) (size!20959 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42906)

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8138 0))(
  ( (MissingZero!8138 (index!34920 (_ BitVec 32))) (Found!8138 (index!34921 (_ BitVec 32))) (Intermediate!8138 (undefined!8950 Bool) (index!34922 (_ BitVec 32)) (x!65864 (_ BitVec 32))) (Undefined!8138) (MissingVacant!8138 (index!34923 (_ BitVec 32))) )
))
(declare-fun lt!353138 () SeekEntryResult!8138)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42906 (_ BitVec 32)) SeekEntryResult!8138)

(assert (=> b!791096 (= res!535889 (= (seekEntryOrOpen!0 (select (arr!20538 a!3186) j!159) a!3186 mask!3328) lt!353138))))

(assert (=> b!791096 (= lt!353138 (Found!8138 j!159))))

(declare-fun b!791097 () Bool)

(declare-fun res!535894 () Bool)

(declare-fun e!439677 () Bool)

(assert (=> b!791097 (=> (not res!535894) (not e!439677))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!791097 (= res!535894 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20959 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20959 a!3186))))))

(declare-fun e!439679 () Bool)

(declare-fun b!791098 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42906 (_ BitVec 32)) SeekEntryResult!8138)

(assert (=> b!791098 (= e!439679 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20538 a!3186) j!159) a!3186 mask!3328) (Found!8138 j!159)))))

(declare-fun b!791099 () Bool)

(declare-fun e!439680 () Bool)

(assert (=> b!791099 (= e!439677 e!439680)))

(declare-fun res!535892 () Bool)

(assert (=> b!791099 (=> (not res!535892) (not e!439680))))

(declare-fun lt!353136 () SeekEntryResult!8138)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42906 (_ BitVec 32)) SeekEntryResult!8138)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!791099 (= res!535892 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20538 a!3186) j!159) mask!3328) (select (arr!20538 a!3186) j!159) a!3186 mask!3328) lt!353136))))

(assert (=> b!791099 (= lt!353136 (Intermediate!8138 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!791100 () Bool)

(declare-fun res!535885 () Bool)

(assert (=> b!791100 (=> (not res!535885) (not e!439680))))

(assert (=> b!791100 (= res!535885 e!439679)))

(declare-fun c!88018 () Bool)

(assert (=> b!791100 (= c!88018 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!791101 () Bool)

(declare-fun res!535884 () Bool)

(assert (=> b!791101 (=> (not res!535884) (not e!439677))))

(declare-datatypes ((List!14540 0))(
  ( (Nil!14537) (Cons!14536 (h!15665 (_ BitVec 64)) (t!20855 List!14540)) )
))
(declare-fun arrayNoDuplicates!0 (array!42906 (_ BitVec 32) List!14540) Bool)

(assert (=> b!791101 (= res!535884 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14537))))

(declare-fun b!791102 () Bool)

(declare-fun res!535890 () Bool)

(assert (=> b!791102 (=> (not res!535890) (not e!439677))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42906 (_ BitVec 32)) Bool)

(assert (=> b!791102 (= res!535890 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!791103 () Bool)

(declare-fun res!535895 () Bool)

(declare-fun e!439681 () Bool)

(assert (=> b!791103 (=> (not res!535895) (not e!439681))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!791103 (= res!535895 (validKeyInArray!0 k!2102))))

(declare-fun b!791104 () Bool)

(declare-fun e!439675 () Bool)

(assert (=> b!791104 (= e!439675 (not true))))

(assert (=> b!791104 e!439676))

(declare-fun res!535882 () Bool)

(assert (=> b!791104 (=> (not res!535882) (not e!439676))))

(assert (=> b!791104 (= res!535882 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!27428 0))(
  ( (Unit!27429) )
))
(declare-fun lt!353139 () Unit!27428)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42906 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27428)

(assert (=> b!791104 (= lt!353139 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!791105 () Bool)

(declare-fun res!535893 () Bool)

(assert (=> b!791105 (=> (not res!535893) (not e!439681))))

(assert (=> b!791105 (= res!535893 (validKeyInArray!0 (select (arr!20538 a!3186) j!159)))))

(declare-fun res!535883 () Bool)

(assert (=> start!67992 (=> (not res!535883) (not e!439681))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67992 (= res!535883 (validMask!0 mask!3328))))

(assert (=> start!67992 e!439681))

(assert (=> start!67992 true))

(declare-fun array_inv!16334 (array!42906) Bool)

(assert (=> start!67992 (array_inv!16334 a!3186)))

(declare-fun b!791106 () Bool)

(declare-fun res!535888 () Bool)

(assert (=> b!791106 (=> (not res!535888) (not e!439681))))

(declare-fun arrayContainsKey!0 (array!42906 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!791106 (= res!535888 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!791107 () Bool)

(assert (=> b!791107 (= e!439679 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20538 a!3186) j!159) a!3186 mask!3328) lt!353136))))

(declare-fun b!791108 () Bool)

(declare-fun res!535881 () Bool)

(assert (=> b!791108 (=> (not res!535881) (not e!439680))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!791108 (= res!535881 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20538 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!791109 () Bool)

(assert (=> b!791109 (= e!439681 e!439677)))

(declare-fun res!535891 () Bool)

(assert (=> b!791109 (=> (not res!535891) (not e!439677))))

(declare-fun lt!353140 () SeekEntryResult!8138)

(assert (=> b!791109 (= res!535891 (or (= lt!353140 (MissingZero!8138 i!1173)) (= lt!353140 (MissingVacant!8138 i!1173))))))

(assert (=> b!791109 (= lt!353140 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!791110 () Bool)

(assert (=> b!791110 (= e!439682 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20538 a!3186) j!159) a!3186 mask!3328) lt!353138))))

(declare-fun b!791111 () Bool)

(assert (=> b!791111 (= e!439680 e!439675)))

(declare-fun res!535887 () Bool)

(assert (=> b!791111 (=> (not res!535887) (not e!439675))))

(declare-fun lt!353141 () (_ BitVec 64))

(declare-fun lt!353137 () array!42906)

(assert (=> b!791111 (= res!535887 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!353141 mask!3328) lt!353141 lt!353137 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!353141 lt!353137 mask!3328)))))

(assert (=> b!791111 (= lt!353141 (select (store (arr!20538 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!791111 (= lt!353137 (array!42907 (store (arr!20538 a!3186) i!1173 k!2102) (size!20959 a!3186)))))

(declare-fun b!791112 () Bool)

(declare-fun res!535886 () Bool)

(assert (=> b!791112 (=> (not res!535886) (not e!439681))))

(assert (=> b!791112 (= res!535886 (and (= (size!20959 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20959 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20959 a!3186)) (not (= i!1173 j!159))))))

(assert (= (and start!67992 res!535883) b!791112))

(assert (= (and b!791112 res!535886) b!791105))

(assert (= (and b!791105 res!535893) b!791103))

(assert (= (and b!791103 res!535895) b!791106))

(assert (= (and b!791106 res!535888) b!791109))

(assert (= (and b!791109 res!535891) b!791102))

(assert (= (and b!791102 res!535890) b!791101))

(assert (= (and b!791101 res!535884) b!791097))

(assert (= (and b!791097 res!535894) b!791099))

(assert (= (and b!791099 res!535892) b!791108))

(assert (= (and b!791108 res!535881) b!791100))

(assert (= (and b!791100 c!88018) b!791107))

(assert (= (and b!791100 (not c!88018)) b!791098))

(assert (= (and b!791100 res!535885) b!791111))

(assert (= (and b!791111 res!535887) b!791104))

(assert (= (and b!791104 res!535882) b!791096))

(assert (= (and b!791096 res!535889) b!791110))

(declare-fun m!731867 () Bool)

(assert (=> b!791096 m!731867))

(assert (=> b!791096 m!731867))

(declare-fun m!731869 () Bool)

(assert (=> b!791096 m!731869))

(declare-fun m!731871 () Bool)

(assert (=> b!791101 m!731871))

(assert (=> b!791098 m!731867))

(assert (=> b!791098 m!731867))

(declare-fun m!731873 () Bool)

(assert (=> b!791098 m!731873))

(declare-fun m!731875 () Bool)

(assert (=> b!791102 m!731875))

(assert (=> b!791110 m!731867))

(assert (=> b!791110 m!731867))

(declare-fun m!731877 () Bool)

(assert (=> b!791110 m!731877))

(declare-fun m!731879 () Bool)

(assert (=> b!791108 m!731879))

(assert (=> b!791107 m!731867))

(assert (=> b!791107 m!731867))

(declare-fun m!731881 () Bool)

(assert (=> b!791107 m!731881))

(declare-fun m!731883 () Bool)

(assert (=> b!791104 m!731883))

(declare-fun m!731885 () Bool)

(assert (=> b!791104 m!731885))

(assert (=> b!791099 m!731867))

(assert (=> b!791099 m!731867))

(declare-fun m!731887 () Bool)

(assert (=> b!791099 m!731887))

(assert (=> b!791099 m!731887))

(assert (=> b!791099 m!731867))

(declare-fun m!731889 () Bool)

(assert (=> b!791099 m!731889))

(declare-fun m!731891 () Bool)

(assert (=> b!791106 m!731891))

(declare-fun m!731893 () Bool)

(assert (=> b!791111 m!731893))

(declare-fun m!731895 () Bool)

(assert (=> b!791111 m!731895))

(declare-fun m!731897 () Bool)

(assert (=> b!791111 m!731897))

(assert (=> b!791111 m!731897))

(declare-fun m!731899 () Bool)

(assert (=> b!791111 m!731899))

(declare-fun m!731901 () Bool)

(assert (=> b!791111 m!731901))

(declare-fun m!731903 () Bool)

(assert (=> b!791109 m!731903))

(declare-fun m!731905 () Bool)

(assert (=> start!67992 m!731905))

(declare-fun m!731907 () Bool)

(assert (=> start!67992 m!731907))

(assert (=> b!791105 m!731867))

(assert (=> b!791105 m!731867))

(declare-fun m!731909 () Bool)

(assert (=> b!791105 m!731909))

(declare-fun m!731911 () Bool)

(assert (=> b!791103 m!731911))

(push 1)

