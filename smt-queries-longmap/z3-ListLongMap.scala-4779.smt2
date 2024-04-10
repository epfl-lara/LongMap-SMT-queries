; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65736 () Bool)

(assert start!65736)

(declare-fun b!754805 () Bool)

(declare-fun e!420951 () Bool)

(declare-fun e!420950 () Bool)

(assert (=> b!754805 (= e!420951 e!420950)))

(declare-fun res!510103 () Bool)

(assert (=> b!754805 (=> (not res!510103) (not e!420950))))

(declare-datatypes ((SeekEntryResult!7668 0))(
  ( (MissingZero!7668 (index!33040 (_ BitVec 32))) (Found!7668 (index!33041 (_ BitVec 32))) (Intermediate!7668 (undefined!8480 Bool) (index!33042 (_ BitVec 32)) (x!63946 (_ BitVec 32))) (Undefined!7668) (MissingVacant!7668 (index!33043 (_ BitVec 32))) )
))
(declare-fun lt!335939 () SeekEntryResult!7668)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!754805 (= res!510103 (or (= lt!335939 (MissingZero!7668 i!1173)) (= lt!335939 (MissingVacant!7668 i!1173))))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((array!41909 0))(
  ( (array!41910 (arr!20068 (Array (_ BitVec 32) (_ BitVec 64))) (size!20489 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41909)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41909 (_ BitVec 32)) SeekEntryResult!7668)

(assert (=> b!754805 (= lt!335939 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!754806 () Bool)

(declare-fun e!420943 () Bool)

(declare-fun lt!335935 () SeekEntryResult!7668)

(declare-fun lt!335944 () SeekEntryResult!7668)

(assert (=> b!754806 (= e!420943 (= lt!335935 lt!335944))))

(declare-fun b!754807 () Bool)

(declare-fun res!510095 () Bool)

(assert (=> b!754807 (=> (not res!510095) (not e!420951))))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!754807 (= res!510095 (and (= (size!20489 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20489 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20489 a!3186)) (not (= i!1173 j!159))))))

(declare-fun res!510097 () Bool)

(assert (=> start!65736 (=> (not res!510097) (not e!420951))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65736 (= res!510097 (validMask!0 mask!3328))))

(assert (=> start!65736 e!420951))

(assert (=> start!65736 true))

(declare-fun array_inv!15864 (array!41909) Bool)

(assert (=> start!65736 (array_inv!15864 a!3186)))

(declare-fun b!754808 () Bool)

(declare-fun e!420946 () Bool)

(declare-fun e!420949 () Bool)

(assert (=> b!754808 (= e!420946 e!420949)))

(declare-fun res!510110 () Bool)

(assert (=> b!754808 (=> res!510110 e!420949)))

(declare-fun lt!335937 () (_ BitVec 64))

(declare-fun lt!335943 () (_ BitVec 64))

(assert (=> b!754808 (= res!510110 (= lt!335937 lt!335943))))

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!754808 (= lt!335937 (select (store (arr!20068 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!754809 () Bool)

(assert (=> b!754809 (= e!420949 true)))

(assert (=> b!754809 e!420943))

(declare-fun res!510094 () Bool)

(assert (=> b!754809 (=> (not res!510094) (not e!420943))))

(assert (=> b!754809 (= res!510094 (= lt!335937 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!26052 0))(
  ( (Unit!26053) )
))
(declare-fun lt!335941 () Unit!26052)

(declare-fun e!420953 () Unit!26052)

(assert (=> b!754809 (= lt!335941 e!420953)))

(declare-fun c!82738 () Bool)

(assert (=> b!754809 (= c!82738 (= lt!335937 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!754810 () Bool)

(declare-fun res!510096 () Bool)

(assert (=> b!754810 (=> (not res!510096) (not e!420950))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!754810 (= res!510096 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20489 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20489 a!3186))))))

(declare-fun b!754811 () Bool)

(declare-fun e!420944 () Bool)

(declare-fun e!420945 () Bool)

(assert (=> b!754811 (= e!420944 (not e!420945))))

(declare-fun res!510101 () Bool)

(assert (=> b!754811 (=> res!510101 e!420945)))

(declare-fun lt!335938 () SeekEntryResult!7668)

(get-info :version)

(assert (=> b!754811 (= res!510101 (or (not ((_ is Intermediate!7668) lt!335938)) (bvslt x!1131 (x!63946 lt!335938)) (not (= x!1131 (x!63946 lt!335938))) (not (= index!1321 (index!33042 lt!335938)))))))

(declare-fun e!420947 () Bool)

(assert (=> b!754811 e!420947))

(declare-fun res!510109 () Bool)

(assert (=> b!754811 (=> (not res!510109) (not e!420947))))

(declare-fun lt!335936 () SeekEntryResult!7668)

(assert (=> b!754811 (= res!510109 (= lt!335935 lt!335936))))

(assert (=> b!754811 (= lt!335936 (Found!7668 j!159))))

(assert (=> b!754811 (= lt!335935 (seekEntryOrOpen!0 (select (arr!20068 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41909 (_ BitVec 32)) Bool)

(assert (=> b!754811 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!335934 () Unit!26052)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41909 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26052)

(assert (=> b!754811 (= lt!335934 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!754812 () Bool)

(declare-fun Unit!26054 () Unit!26052)

(assert (=> b!754812 (= e!420953 Unit!26054)))

(declare-fun b!754813 () Bool)

(declare-fun res!510092 () Bool)

(declare-fun e!420942 () Bool)

(assert (=> b!754813 (=> (not res!510092) (not e!420942))))

(assert (=> b!754813 (= res!510092 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20068 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!754814 () Bool)

(declare-fun Unit!26055 () Unit!26052)

(assert (=> b!754814 (= e!420953 Unit!26055)))

(assert (=> b!754814 false))

(declare-fun b!754815 () Bool)

(declare-fun res!510108 () Bool)

(assert (=> b!754815 (=> (not res!510108) (not e!420951))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!754815 (= res!510108 (validKeyInArray!0 k0!2102))))

(declare-fun e!420948 () Bool)

(declare-fun b!754816 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41909 (_ BitVec 32)) SeekEntryResult!7668)

(assert (=> b!754816 (= e!420948 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20068 a!3186) j!159) a!3186 mask!3328) (Found!7668 j!159)))))

(declare-fun lt!335942 () SeekEntryResult!7668)

(declare-fun b!754817 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41909 (_ BitVec 32)) SeekEntryResult!7668)

(assert (=> b!754817 (= e!420948 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20068 a!3186) j!159) a!3186 mask!3328) lt!335942))))

(declare-fun b!754818 () Bool)

(declare-fun res!510107 () Bool)

(assert (=> b!754818 (=> (not res!510107) (not e!420942))))

(assert (=> b!754818 (= res!510107 e!420948)))

(declare-fun c!82737 () Bool)

(assert (=> b!754818 (= c!82737 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!754819 () Bool)

(declare-fun res!510098 () Bool)

(assert (=> b!754819 (=> (not res!510098) (not e!420951))))

(assert (=> b!754819 (= res!510098 (validKeyInArray!0 (select (arr!20068 a!3186) j!159)))))

(declare-fun b!754820 () Bool)

(assert (=> b!754820 (= e!420950 e!420942)))

(declare-fun res!510105 () Bool)

(assert (=> b!754820 (=> (not res!510105) (not e!420942))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!754820 (= res!510105 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20068 a!3186) j!159) mask!3328) (select (arr!20068 a!3186) j!159) a!3186 mask!3328) lt!335942))))

(assert (=> b!754820 (= lt!335942 (Intermediate!7668 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!754821 () Bool)

(assert (=> b!754821 (= e!420942 e!420944)))

(declare-fun res!510106 () Bool)

(assert (=> b!754821 (=> (not res!510106) (not e!420944))))

(declare-fun lt!335945 () SeekEntryResult!7668)

(assert (=> b!754821 (= res!510106 (= lt!335945 lt!335938))))

(declare-fun lt!335940 () array!41909)

(assert (=> b!754821 (= lt!335938 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!335943 lt!335940 mask!3328))))

(assert (=> b!754821 (= lt!335945 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!335943 mask!3328) lt!335943 lt!335940 mask!3328))))

(assert (=> b!754821 (= lt!335943 (select (store (arr!20068 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!754821 (= lt!335940 (array!41910 (store (arr!20068 a!3186) i!1173 k0!2102) (size!20489 a!3186)))))

(declare-fun b!754822 () Bool)

(declare-fun res!510099 () Bool)

(assert (=> b!754822 (=> (not res!510099) (not e!420943))))

(assert (=> b!754822 (= res!510099 (= (seekEntryOrOpen!0 lt!335943 lt!335940 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!335943 lt!335940 mask!3328)))))

(declare-fun b!754823 () Bool)

(assert (=> b!754823 (= e!420945 e!420946)))

(declare-fun res!510104 () Bool)

(assert (=> b!754823 (=> res!510104 e!420946)))

(assert (=> b!754823 (= res!510104 (not (= lt!335944 lt!335936)))))

(assert (=> b!754823 (= lt!335944 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20068 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!754824 () Bool)

(assert (=> b!754824 (= e!420947 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20068 a!3186) j!159) a!3186 mask!3328) lt!335936))))

(declare-fun b!754825 () Bool)

(declare-fun res!510102 () Bool)

(assert (=> b!754825 (=> (not res!510102) (not e!420950))))

(declare-datatypes ((List!14070 0))(
  ( (Nil!14067) (Cons!14066 (h!15138 (_ BitVec 64)) (t!20385 List!14070)) )
))
(declare-fun arrayNoDuplicates!0 (array!41909 (_ BitVec 32) List!14070) Bool)

(assert (=> b!754825 (= res!510102 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14067))))

(declare-fun b!754826 () Bool)

(declare-fun res!510093 () Bool)

(assert (=> b!754826 (=> (not res!510093) (not e!420951))))

(declare-fun arrayContainsKey!0 (array!41909 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!754826 (= res!510093 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!754827 () Bool)

(declare-fun res!510100 () Bool)

(assert (=> b!754827 (=> (not res!510100) (not e!420950))))

(assert (=> b!754827 (= res!510100 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(assert (= (and start!65736 res!510097) b!754807))

(assert (= (and b!754807 res!510095) b!754819))

(assert (= (and b!754819 res!510098) b!754815))

(assert (= (and b!754815 res!510108) b!754826))

(assert (= (and b!754826 res!510093) b!754805))

(assert (= (and b!754805 res!510103) b!754827))

(assert (= (and b!754827 res!510100) b!754825))

(assert (= (and b!754825 res!510102) b!754810))

(assert (= (and b!754810 res!510096) b!754820))

(assert (= (and b!754820 res!510105) b!754813))

(assert (= (and b!754813 res!510092) b!754818))

(assert (= (and b!754818 c!82737) b!754817))

(assert (= (and b!754818 (not c!82737)) b!754816))

(assert (= (and b!754818 res!510107) b!754821))

(assert (= (and b!754821 res!510106) b!754811))

(assert (= (and b!754811 res!510109) b!754824))

(assert (= (and b!754811 (not res!510101)) b!754823))

(assert (= (and b!754823 (not res!510104)) b!754808))

(assert (= (and b!754808 (not res!510110)) b!754809))

(assert (= (and b!754809 c!82738) b!754814))

(assert (= (and b!754809 (not c!82738)) b!754812))

(assert (= (and b!754809 res!510094) b!754822))

(assert (= (and b!754822 res!510099) b!754806))

(declare-fun m!703163 () Bool)

(assert (=> b!754808 m!703163))

(declare-fun m!703165 () Bool)

(assert (=> b!754808 m!703165))

(declare-fun m!703167 () Bool)

(assert (=> b!754817 m!703167))

(assert (=> b!754817 m!703167))

(declare-fun m!703169 () Bool)

(assert (=> b!754817 m!703169))

(assert (=> b!754819 m!703167))

(assert (=> b!754819 m!703167))

(declare-fun m!703171 () Bool)

(assert (=> b!754819 m!703171))

(declare-fun m!703173 () Bool)

(assert (=> b!754822 m!703173))

(declare-fun m!703175 () Bool)

(assert (=> b!754822 m!703175))

(declare-fun m!703177 () Bool)

(assert (=> b!754821 m!703177))

(declare-fun m!703179 () Bool)

(assert (=> b!754821 m!703179))

(declare-fun m!703181 () Bool)

(assert (=> b!754821 m!703181))

(declare-fun m!703183 () Bool)

(assert (=> b!754821 m!703183))

(assert (=> b!754821 m!703181))

(assert (=> b!754821 m!703163))

(declare-fun m!703185 () Bool)

(assert (=> b!754827 m!703185))

(assert (=> b!754811 m!703167))

(assert (=> b!754811 m!703167))

(declare-fun m!703187 () Bool)

(assert (=> b!754811 m!703187))

(declare-fun m!703189 () Bool)

(assert (=> b!754811 m!703189))

(declare-fun m!703191 () Bool)

(assert (=> b!754811 m!703191))

(declare-fun m!703193 () Bool)

(assert (=> b!754826 m!703193))

(assert (=> b!754820 m!703167))

(assert (=> b!754820 m!703167))

(declare-fun m!703195 () Bool)

(assert (=> b!754820 m!703195))

(assert (=> b!754820 m!703195))

(assert (=> b!754820 m!703167))

(declare-fun m!703197 () Bool)

(assert (=> b!754820 m!703197))

(assert (=> b!754816 m!703167))

(assert (=> b!754816 m!703167))

(declare-fun m!703199 () Bool)

(assert (=> b!754816 m!703199))

(declare-fun m!703201 () Bool)

(assert (=> start!65736 m!703201))

(declare-fun m!703203 () Bool)

(assert (=> start!65736 m!703203))

(declare-fun m!703205 () Bool)

(assert (=> b!754805 m!703205))

(assert (=> b!754823 m!703167))

(assert (=> b!754823 m!703167))

(assert (=> b!754823 m!703199))

(declare-fun m!703207 () Bool)

(assert (=> b!754813 m!703207))

(declare-fun m!703209 () Bool)

(assert (=> b!754825 m!703209))

(assert (=> b!754824 m!703167))

(assert (=> b!754824 m!703167))

(declare-fun m!703211 () Bool)

(assert (=> b!754824 m!703211))

(declare-fun m!703213 () Bool)

(assert (=> b!754815 m!703213))

(check-sat (not start!65736) (not b!754821) (not b!754805) (not b!754826) (not b!754823) (not b!754816) (not b!754822) (not b!754824) (not b!754817) (not b!754820) (not b!754827) (not b!754825) (not b!754819) (not b!754811) (not b!754815))
(check-sat)
