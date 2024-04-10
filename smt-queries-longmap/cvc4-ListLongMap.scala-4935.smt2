; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67990 () Bool)

(assert start!67990)

(declare-fun b!791045 () Bool)

(declare-fun res!535849 () Bool)

(declare-fun e!439655 () Bool)

(assert (=> b!791045 (=> (not res!535849) (not e!439655))))

(declare-datatypes ((array!42904 0))(
  ( (array!42905 (arr!20537 (Array (_ BitVec 32) (_ BitVec 64))) (size!20958 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42904)

(declare-datatypes ((List!14539 0))(
  ( (Nil!14536) (Cons!14535 (h!15664 (_ BitVec 64)) (t!20854 List!14539)) )
))
(declare-fun arrayNoDuplicates!0 (array!42904 (_ BitVec 32) List!14539) Bool)

(assert (=> b!791045 (= res!535849 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14536))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun e!439651 () Bool)

(declare-datatypes ((SeekEntryResult!8137 0))(
  ( (MissingZero!8137 (index!34916 (_ BitVec 32))) (Found!8137 (index!34917 (_ BitVec 32))) (Intermediate!8137 (undefined!8949 Bool) (index!34918 (_ BitVec 32)) (x!65855 (_ BitVec 32))) (Undefined!8137) (MissingVacant!8137 (index!34919 (_ BitVec 32))) )
))
(declare-fun lt!353118 () SeekEntryResult!8137)

(declare-fun b!791046 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42904 (_ BitVec 32)) SeekEntryResult!8137)

(assert (=> b!791046 (= e!439651 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20537 a!3186) j!159) a!3186 mask!3328) lt!353118))))

(declare-fun b!791047 () Bool)

(declare-fun e!439658 () Bool)

(assert (=> b!791047 (= e!439658 (not true))))

(declare-fun e!439654 () Bool)

(assert (=> b!791047 e!439654))

(declare-fun res!535850 () Bool)

(assert (=> b!791047 (=> (not res!535850) (not e!439654))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42904 (_ BitVec 32)) Bool)

(assert (=> b!791047 (= res!535850 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!27426 0))(
  ( (Unit!27427) )
))
(declare-fun lt!353123 () Unit!27426)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42904 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27426)

(assert (=> b!791047 (= lt!353123 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!791048 () Bool)

(declare-fun res!535837 () Bool)

(declare-fun e!439653 () Bool)

(assert (=> b!791048 (=> (not res!535837) (not e!439653))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!791048 (= res!535837 (and (= (size!20958 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20958 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20958 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!791049 () Bool)

(declare-fun res!535843 () Bool)

(assert (=> b!791049 (=> (not res!535843) (not e!439653))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!42904 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!791049 (= res!535843 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!791050 () Bool)

(declare-fun lt!353119 () SeekEntryResult!8137)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun e!439656 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42904 (_ BitVec 32)) SeekEntryResult!8137)

(assert (=> b!791050 (= e!439656 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20537 a!3186) j!159) a!3186 mask!3328) lt!353119))))

(declare-fun b!791051 () Bool)

(declare-fun res!535841 () Bool)

(declare-fun e!439657 () Bool)

(assert (=> b!791051 (=> (not res!535841) (not e!439657))))

(assert (=> b!791051 (= res!535841 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20537 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!791052 () Bool)

(assert (=> b!791052 (= e!439655 e!439657)))

(declare-fun res!535836 () Bool)

(assert (=> b!791052 (=> (not res!535836) (not e!439657))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!791052 (= res!535836 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20537 a!3186) j!159) mask!3328) (select (arr!20537 a!3186) j!159) a!3186 mask!3328) lt!353119))))

(assert (=> b!791052 (= lt!353119 (Intermediate!8137 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!791054 () Bool)

(assert (=> b!791054 (= e!439653 e!439655)))

(declare-fun res!535847 () Bool)

(assert (=> b!791054 (=> (not res!535847) (not e!439655))))

(declare-fun lt!353122 () SeekEntryResult!8137)

(assert (=> b!791054 (= res!535847 (or (= lt!353122 (MissingZero!8137 i!1173)) (= lt!353122 (MissingVacant!8137 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42904 (_ BitVec 32)) SeekEntryResult!8137)

(assert (=> b!791054 (= lt!353122 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!791055 () Bool)

(assert (=> b!791055 (= e!439654 e!439651)))

(declare-fun res!535839 () Bool)

(assert (=> b!791055 (=> (not res!535839) (not e!439651))))

(assert (=> b!791055 (= res!535839 (= (seekEntryOrOpen!0 (select (arr!20537 a!3186) j!159) a!3186 mask!3328) lt!353118))))

(assert (=> b!791055 (= lt!353118 (Found!8137 j!159))))

(declare-fun b!791056 () Bool)

(declare-fun res!535846 () Bool)

(assert (=> b!791056 (=> (not res!535846) (not e!439653))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!791056 (= res!535846 (validKeyInArray!0 (select (arr!20537 a!3186) j!159)))))

(declare-fun b!791057 () Bool)

(assert (=> b!791057 (= e!439657 e!439658)))

(declare-fun res!535844 () Bool)

(assert (=> b!791057 (=> (not res!535844) (not e!439658))))

(declare-fun lt!353120 () (_ BitVec 64))

(declare-fun lt!353121 () array!42904)

(assert (=> b!791057 (= res!535844 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!353120 mask!3328) lt!353120 lt!353121 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!353120 lt!353121 mask!3328)))))

(assert (=> b!791057 (= lt!353120 (select (store (arr!20537 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!791057 (= lt!353121 (array!42905 (store (arr!20537 a!3186) i!1173 k!2102) (size!20958 a!3186)))))

(declare-fun b!791058 () Bool)

(declare-fun res!535842 () Bool)

(assert (=> b!791058 (=> (not res!535842) (not e!439655))))

(assert (=> b!791058 (= res!535842 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20958 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20958 a!3186))))))

(declare-fun b!791059 () Bool)

(assert (=> b!791059 (= e!439656 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20537 a!3186) j!159) a!3186 mask!3328) (Found!8137 j!159)))))

(declare-fun res!535838 () Bool)

(assert (=> start!67990 (=> (not res!535838) (not e!439653))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67990 (= res!535838 (validMask!0 mask!3328))))

(assert (=> start!67990 e!439653))

(assert (=> start!67990 true))

(declare-fun array_inv!16333 (array!42904) Bool)

(assert (=> start!67990 (array_inv!16333 a!3186)))

(declare-fun b!791053 () Bool)

(declare-fun res!535848 () Bool)

(assert (=> b!791053 (=> (not res!535848) (not e!439653))))

(assert (=> b!791053 (= res!535848 (validKeyInArray!0 k!2102))))

(declare-fun b!791060 () Bool)

(declare-fun res!535840 () Bool)

(assert (=> b!791060 (=> (not res!535840) (not e!439655))))

(assert (=> b!791060 (= res!535840 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!791061 () Bool)

(declare-fun res!535845 () Bool)

(assert (=> b!791061 (=> (not res!535845) (not e!439657))))

(assert (=> b!791061 (= res!535845 e!439656)))

(declare-fun c!88015 () Bool)

(assert (=> b!791061 (= c!88015 (bvsle x!1131 resIntermediateX!5))))

(assert (= (and start!67990 res!535838) b!791048))

(assert (= (and b!791048 res!535837) b!791056))

(assert (= (and b!791056 res!535846) b!791053))

(assert (= (and b!791053 res!535848) b!791049))

(assert (= (and b!791049 res!535843) b!791054))

(assert (= (and b!791054 res!535847) b!791060))

(assert (= (and b!791060 res!535840) b!791045))

(assert (= (and b!791045 res!535849) b!791058))

(assert (= (and b!791058 res!535842) b!791052))

(assert (= (and b!791052 res!535836) b!791051))

(assert (= (and b!791051 res!535841) b!791061))

(assert (= (and b!791061 c!88015) b!791050))

(assert (= (and b!791061 (not c!88015)) b!791059))

(assert (= (and b!791061 res!535845) b!791057))

(assert (= (and b!791057 res!535844) b!791047))

(assert (= (and b!791047 res!535850) b!791055))

(assert (= (and b!791055 res!535839) b!791046))

(declare-fun m!731821 () Bool)

(assert (=> b!791050 m!731821))

(assert (=> b!791050 m!731821))

(declare-fun m!731823 () Bool)

(assert (=> b!791050 m!731823))

(declare-fun m!731825 () Bool)

(assert (=> b!791054 m!731825))

(declare-fun m!731827 () Bool)

(assert (=> b!791045 m!731827))

(declare-fun m!731829 () Bool)

(assert (=> b!791053 m!731829))

(declare-fun m!731831 () Bool)

(assert (=> b!791049 m!731831))

(assert (=> b!791052 m!731821))

(assert (=> b!791052 m!731821))

(declare-fun m!731833 () Bool)

(assert (=> b!791052 m!731833))

(assert (=> b!791052 m!731833))

(assert (=> b!791052 m!731821))

(declare-fun m!731835 () Bool)

(assert (=> b!791052 m!731835))

(declare-fun m!731837 () Bool)

(assert (=> start!67990 m!731837))

(declare-fun m!731839 () Bool)

(assert (=> start!67990 m!731839))

(declare-fun m!731841 () Bool)

(assert (=> b!791051 m!731841))

(assert (=> b!791056 m!731821))

(assert (=> b!791056 m!731821))

(declare-fun m!731843 () Bool)

(assert (=> b!791056 m!731843))

(assert (=> b!791059 m!731821))

(assert (=> b!791059 m!731821))

(declare-fun m!731845 () Bool)

(assert (=> b!791059 m!731845))

(declare-fun m!731847 () Bool)

(assert (=> b!791057 m!731847))

(declare-fun m!731849 () Bool)

(assert (=> b!791057 m!731849))

(declare-fun m!731851 () Bool)

(assert (=> b!791057 m!731851))

(declare-fun m!731853 () Bool)

(assert (=> b!791057 m!731853))

(assert (=> b!791057 m!731853))

(declare-fun m!731855 () Bool)

(assert (=> b!791057 m!731855))

(assert (=> b!791046 m!731821))

(assert (=> b!791046 m!731821))

(declare-fun m!731857 () Bool)

(assert (=> b!791046 m!731857))

(declare-fun m!731859 () Bool)

(assert (=> b!791047 m!731859))

(declare-fun m!731861 () Bool)

(assert (=> b!791047 m!731861))

(assert (=> b!791055 m!731821))

(assert (=> b!791055 m!731821))

(declare-fun m!731863 () Bool)

(assert (=> b!791055 m!731863))

(declare-fun m!731865 () Bool)

(assert (=> b!791060 m!731865))

(push 1)

