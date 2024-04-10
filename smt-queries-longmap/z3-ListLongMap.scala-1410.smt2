; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27314 () Bool)

(assert start!27314)

(declare-fun res!146152 () Bool)

(declare-fun e!179607 () Bool)

(assert (=> start!27314 (=> (not res!146152) (not e!179607))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27314 (= res!146152 (validMask!0 mask!3868))))

(assert (=> start!27314 e!179607))

(declare-datatypes ((array!14132 0))(
  ( (array!14133 (arr!6708 (Array (_ BitVec 32) (_ BitVec 64))) (size!7060 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14132)

(declare-fun array_inv!4671 (array!14132) Bool)

(assert (=> start!27314 (array_inv!4671 a!3325)))

(assert (=> start!27314 true))

(declare-fun b!283079 () Bool)

(declare-fun res!146148 () Bool)

(declare-fun e!179608 () Bool)

(assert (=> b!283079 (=> (not res!146148) (not e!179608))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14132 (_ BitVec 32)) Bool)

(assert (=> b!283079 (= res!146148 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!283080 () Bool)

(declare-fun res!146155 () Bool)

(assert (=> b!283080 (=> (not res!146155) (not e!179607))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!283080 (= res!146155 (and (= (size!7060 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7060 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7060 a!3325))))))

(declare-fun b!283081 () Bool)

(assert (=> b!283081 (= e!179607 e!179608)))

(declare-fun res!146153 () Bool)

(assert (=> b!283081 (=> (not res!146153) (not e!179608))))

(declare-datatypes ((SeekEntryResult!1866 0))(
  ( (MissingZero!1866 (index!9634 (_ BitVec 32))) (Found!1866 (index!9635 (_ BitVec 32))) (Intermediate!1866 (undefined!2678 Bool) (index!9636 (_ BitVec 32)) (x!27840 (_ BitVec 32))) (Undefined!1866) (MissingVacant!1866 (index!9637 (_ BitVec 32))) )
))
(declare-fun lt!139908 () SeekEntryResult!1866)

(assert (=> b!283081 (= res!146153 (or (= lt!139908 (MissingZero!1866 i!1267)) (= lt!139908 (MissingVacant!1866 i!1267))))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14132 (_ BitVec 32)) SeekEntryResult!1866)

(assert (=> b!283081 (= lt!139908 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!283082 () Bool)

(declare-fun e!179606 () Bool)

(assert (=> b!283082 (= e!179608 e!179606)))

(declare-fun res!146150 () Bool)

(assert (=> b!283082 (=> (not res!146150) (not e!179606))))

(assert (=> b!283082 (= res!146150 (not (= startIndex!26 i!1267)))))

(declare-fun lt!139912 () array!14132)

(assert (=> b!283082 (= lt!139912 (array!14133 (store (arr!6708 a!3325) i!1267 k0!2581) (size!7060 a!3325)))))

(declare-fun b!283083 () Bool)

(declare-fun res!146151 () Bool)

(assert (=> b!283083 (=> (not res!146151) (not e!179607))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!283083 (= res!146151 (validKeyInArray!0 k0!2581))))

(declare-fun b!283084 () Bool)

(declare-fun e!179605 () Bool)

(assert (=> b!283084 (= e!179606 (not e!179605))))

(declare-fun res!146156 () Bool)

(assert (=> b!283084 (=> res!146156 e!179605)))

(assert (=> b!283084 (= res!146156 (or (bvsge startIndex!26 (bvsub (size!7060 a!3325) #b00000000000000000000000000000001)) (bvslt (bvadd #b00000000000000000000000000000001 startIndex!26) #b00000000000000000000000000000000)))))

(assert (=> b!283084 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(declare-datatypes ((Unit!9016 0))(
  ( (Unit!9017) )
))
(declare-fun lt!139910 () Unit!9016)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!14132 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9016)

(assert (=> b!283084 (= lt!139910 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26))))

(assert (=> b!283084 (= (seekEntryOrOpen!0 (select (arr!6708 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6708 a!3325) i!1267 k0!2581) startIndex!26) lt!139912 mask!3868))))

(declare-fun lt!139909 () Unit!9016)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!14132 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!9016)

(assert (=> b!283084 (= lt!139909 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k0!2581 startIndex!26 mask!3868))))

(declare-datatypes ((List!4516 0))(
  ( (Nil!4513) (Cons!4512 (h!5182 (_ BitVec 64)) (t!9598 List!4516)) )
))
(declare-fun arrayNoDuplicates!0 (array!14132 (_ BitVec 32) List!4516) Bool)

(assert (=> b!283084 (arrayNoDuplicates!0 lt!139912 #b00000000000000000000000000000000 Nil!4513)))

(declare-fun lt!139911 () Unit!9016)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!14132 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4516) Unit!9016)

(assert (=> b!283084 (= lt!139911 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4513))))

(declare-fun b!283085 () Bool)

(assert (=> b!283085 (= e!179605 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 lt!139912 mask!3868))))

(assert (=> b!283085 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) lt!139912 mask!3868)))

(declare-fun lt!139907 () Unit!9016)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!14132 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!9016)

(assert (=> b!283085 (= lt!139907 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k0!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(declare-fun b!283086 () Bool)

(declare-fun res!146154 () Bool)

(assert (=> b!283086 (=> (not res!146154) (not e!179607))))

(assert (=> b!283086 (= res!146154 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4513))))

(declare-fun b!283087 () Bool)

(declare-fun res!146157 () Bool)

(assert (=> b!283087 (=> (not res!146157) (not e!179607))))

(declare-fun arrayContainsKey!0 (array!14132 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!283087 (= res!146157 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!283088 () Bool)

(declare-fun res!146149 () Bool)

(assert (=> b!283088 (=> (not res!146149) (not e!179606))))

(assert (=> b!283088 (= res!146149 (validKeyInArray!0 (select (arr!6708 a!3325) startIndex!26)))))

(assert (= (and start!27314 res!146152) b!283080))

(assert (= (and b!283080 res!146155) b!283083))

(assert (= (and b!283083 res!146151) b!283086))

(assert (= (and b!283086 res!146154) b!283087))

(assert (= (and b!283087 res!146157) b!283081))

(assert (= (and b!283081 res!146153) b!283079))

(assert (= (and b!283079 res!146148) b!283082))

(assert (= (and b!283082 res!146150) b!283088))

(assert (= (and b!283088 res!146149) b!283084))

(assert (= (and b!283084 (not res!146156)) b!283085))

(declare-fun m!297861 () Bool)

(assert (=> b!283086 m!297861))

(declare-fun m!297863 () Bool)

(assert (=> b!283087 m!297863))

(declare-fun m!297865 () Bool)

(assert (=> b!283088 m!297865))

(assert (=> b!283088 m!297865))

(declare-fun m!297867 () Bool)

(assert (=> b!283088 m!297867))

(declare-fun m!297869 () Bool)

(assert (=> b!283083 m!297869))

(declare-fun m!297871 () Bool)

(assert (=> b!283079 m!297871))

(declare-fun m!297873 () Bool)

(assert (=> b!283085 m!297873))

(declare-fun m!297875 () Bool)

(assert (=> b!283085 m!297875))

(declare-fun m!297877 () Bool)

(assert (=> b!283085 m!297877))

(declare-fun m!297879 () Bool)

(assert (=> start!27314 m!297879))

(declare-fun m!297881 () Bool)

(assert (=> start!27314 m!297881))

(declare-fun m!297883 () Bool)

(assert (=> b!283084 m!297883))

(declare-fun m!297885 () Bool)

(assert (=> b!283084 m!297885))

(declare-fun m!297887 () Bool)

(assert (=> b!283084 m!297887))

(assert (=> b!283084 m!297885))

(declare-fun m!297889 () Bool)

(assert (=> b!283084 m!297889))

(declare-fun m!297891 () Bool)

(assert (=> b!283084 m!297891))

(declare-fun m!297893 () Bool)

(assert (=> b!283084 m!297893))

(assert (=> b!283084 m!297865))

(declare-fun m!297895 () Bool)

(assert (=> b!283084 m!297895))

(declare-fun m!297897 () Bool)

(assert (=> b!283084 m!297897))

(assert (=> b!283084 m!297865))

(declare-fun m!297899 () Bool)

(assert (=> b!283084 m!297899))

(declare-fun m!297901 () Bool)

(assert (=> b!283081 m!297901))

(assert (=> b!283082 m!297891))

(check-sat (not b!283083) (not b!283084) (not b!283079) (not b!283085) (not b!283087) (not b!283088) (not start!27314) (not b!283086) (not b!283081))
(check-sat)
(get-model)

(declare-fun d!65255 () Bool)

(declare-fun res!146192 () Bool)

(declare-fun e!179629 () Bool)

(assert (=> d!65255 (=> res!146192 e!179629)))

(assert (=> d!65255 (= res!146192 (= (select (arr!6708 a!3325) #b00000000000000000000000000000000) k0!2581))))

(assert (=> d!65255 (= (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000) e!179629)))

(declare-fun b!283123 () Bool)

(declare-fun e!179630 () Bool)

(assert (=> b!283123 (= e!179629 e!179630)))

(declare-fun res!146193 () Bool)

(assert (=> b!283123 (=> (not res!146193) (not e!179630))))

(assert (=> b!283123 (= res!146193 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7060 a!3325)))))

(declare-fun b!283124 () Bool)

(assert (=> b!283124 (= e!179630 (arrayContainsKey!0 a!3325 k0!2581 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!65255 (not res!146192)) b!283123))

(assert (= (and b!283123 res!146193) b!283124))

(declare-fun m!297945 () Bool)

(assert (=> d!65255 m!297945))

(declare-fun m!297947 () Bool)

(assert (=> b!283124 m!297947))

(assert (=> b!283087 d!65255))

(declare-fun d!65257 () Bool)

(assert (=> d!65257 (= (validKeyInArray!0 (select (arr!6708 a!3325) startIndex!26)) (and (not (= (select (arr!6708 a!3325) startIndex!26) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!6708 a!3325) startIndex!26) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!283088 d!65257))

(declare-fun d!65259 () Bool)

(assert (=> d!65259 (= (validKeyInArray!0 k0!2581) (and (not (= k0!2581 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2581 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!283083 d!65259))

(declare-fun b!283133 () Bool)

(declare-fun e!179639 () Bool)

(declare-fun e!179638 () Bool)

(assert (=> b!283133 (= e!179639 e!179638)))

(declare-fun c!46020 () Bool)

(assert (=> b!283133 (= c!46020 (validKeyInArray!0 (select (arr!6708 lt!139912) startIndex!26)))))

(declare-fun b!283134 () Bool)

(declare-fun call!25462 () Bool)

(assert (=> b!283134 (= e!179638 call!25462)))

(declare-fun b!283135 () Bool)

(declare-fun e!179637 () Bool)

(assert (=> b!283135 (= e!179637 call!25462)))

(declare-fun d!65261 () Bool)

(declare-fun res!146198 () Bool)

(assert (=> d!65261 (=> res!146198 e!179639)))

(assert (=> d!65261 (= res!146198 (bvsge startIndex!26 (size!7060 lt!139912)))))

(assert (=> d!65261 (= (arrayForallSeekEntryOrOpenFound!0 startIndex!26 lt!139912 mask!3868) e!179639)))

(declare-fun b!283136 () Bool)

(assert (=> b!283136 (= e!179638 e!179637)))

(declare-fun lt!139939 () (_ BitVec 64))

(assert (=> b!283136 (= lt!139939 (select (arr!6708 lt!139912) startIndex!26))))

(declare-fun lt!139937 () Unit!9016)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!14132 (_ BitVec 64) (_ BitVec 32)) Unit!9016)

(assert (=> b!283136 (= lt!139937 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!139912 lt!139939 startIndex!26))))

(assert (=> b!283136 (arrayContainsKey!0 lt!139912 lt!139939 #b00000000000000000000000000000000)))

(declare-fun lt!139938 () Unit!9016)

(assert (=> b!283136 (= lt!139938 lt!139937)))

(declare-fun res!146199 () Bool)

(assert (=> b!283136 (= res!146199 (= (seekEntryOrOpen!0 (select (arr!6708 lt!139912) startIndex!26) lt!139912 mask!3868) (Found!1866 startIndex!26)))))

(assert (=> b!283136 (=> (not res!146199) (not e!179637))))

(declare-fun bm!25459 () Bool)

(assert (=> bm!25459 (= call!25462 (arrayForallSeekEntryOrOpenFound!0 (bvadd startIndex!26 #b00000000000000000000000000000001) lt!139912 mask!3868))))

(assert (= (and d!65261 (not res!146198)) b!283133))

(assert (= (and b!283133 c!46020) b!283136))

(assert (= (and b!283133 (not c!46020)) b!283134))

(assert (= (and b!283136 res!146199) b!283135))

(assert (= (or b!283135 b!283134) bm!25459))

(declare-fun m!297949 () Bool)

(assert (=> b!283133 m!297949))

(assert (=> b!283133 m!297949))

(declare-fun m!297951 () Bool)

(assert (=> b!283133 m!297951))

(assert (=> b!283136 m!297949))

(declare-fun m!297953 () Bool)

(assert (=> b!283136 m!297953))

(declare-fun m!297955 () Bool)

(assert (=> b!283136 m!297955))

(assert (=> b!283136 m!297949))

(declare-fun m!297957 () Bool)

(assert (=> b!283136 m!297957))

(declare-fun m!297959 () Bool)

(assert (=> bm!25459 m!297959))

(assert (=> b!283085 d!65261))

(declare-fun b!283137 () Bool)

(declare-fun e!179642 () Bool)

(declare-fun e!179641 () Bool)

(assert (=> b!283137 (= e!179642 e!179641)))

(declare-fun c!46021 () Bool)

(assert (=> b!283137 (= c!46021 (validKeyInArray!0 (select (arr!6708 lt!139912) (bvadd #b00000000000000000000000000000001 startIndex!26))))))

(declare-fun b!283138 () Bool)

(declare-fun call!25463 () Bool)

(assert (=> b!283138 (= e!179641 call!25463)))

(declare-fun b!283139 () Bool)

(declare-fun e!179640 () Bool)

(assert (=> b!283139 (= e!179640 call!25463)))

(declare-fun d!65263 () Bool)

(declare-fun res!146200 () Bool)

(assert (=> d!65263 (=> res!146200 e!179642)))

(assert (=> d!65263 (= res!146200 (bvsge (bvadd #b00000000000000000000000000000001 startIndex!26) (size!7060 lt!139912)))))

(assert (=> d!65263 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) lt!139912 mask!3868) e!179642)))

(declare-fun b!283140 () Bool)

(assert (=> b!283140 (= e!179641 e!179640)))

(declare-fun lt!139942 () (_ BitVec 64))

(assert (=> b!283140 (= lt!139942 (select (arr!6708 lt!139912) (bvadd #b00000000000000000000000000000001 startIndex!26)))))

(declare-fun lt!139940 () Unit!9016)

(assert (=> b!283140 (= lt!139940 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!139912 lt!139942 (bvadd #b00000000000000000000000000000001 startIndex!26)))))

(assert (=> b!283140 (arrayContainsKey!0 lt!139912 lt!139942 #b00000000000000000000000000000000)))

(declare-fun lt!139941 () Unit!9016)

(assert (=> b!283140 (= lt!139941 lt!139940)))

(declare-fun res!146201 () Bool)

(assert (=> b!283140 (= res!146201 (= (seekEntryOrOpen!0 (select (arr!6708 lt!139912) (bvadd #b00000000000000000000000000000001 startIndex!26)) lt!139912 mask!3868) (Found!1866 (bvadd #b00000000000000000000000000000001 startIndex!26))))))

(assert (=> b!283140 (=> (not res!146201) (not e!179640))))

(declare-fun bm!25460 () Bool)

(assert (=> bm!25460 (= call!25463 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26 #b00000000000000000000000000000001) lt!139912 mask!3868))))

(assert (= (and d!65263 (not res!146200)) b!283137))

(assert (= (and b!283137 c!46021) b!283140))

(assert (= (and b!283137 (not c!46021)) b!283138))

(assert (= (and b!283140 res!146201) b!283139))

(assert (= (or b!283139 b!283138) bm!25460))

(declare-fun m!297961 () Bool)

(assert (=> b!283137 m!297961))

(assert (=> b!283137 m!297961))

(declare-fun m!297963 () Bool)

(assert (=> b!283137 m!297963))

(assert (=> b!283140 m!297961))

(declare-fun m!297965 () Bool)

(assert (=> b!283140 m!297965))

(declare-fun m!297967 () Bool)

(assert (=> b!283140 m!297967))

(assert (=> b!283140 m!297961))

(declare-fun m!297969 () Bool)

(assert (=> b!283140 m!297969))

(declare-fun m!297971 () Bool)

(assert (=> bm!25460 m!297971))

(assert (=> b!283085 d!65263))

(declare-fun d!65265 () Bool)

(declare-fun e!179645 () Bool)

(assert (=> d!65265 e!179645))

(declare-fun res!146204 () Bool)

(assert (=> d!65265 (=> (not res!146204) (not e!179645))))

(assert (=> d!65265 (= res!146204 (and (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7060 a!3325))))))

(declare-fun lt!139945 () Unit!9016)

(declare-fun choose!98 (array!14132 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!9016)

(assert (=> d!65265 (= lt!139945 (choose!98 a!3325 i!1267 k0!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(assert (=> d!65265 (validMask!0 mask!3868)))

(assert (=> d!65265 (= (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k0!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868) lt!139945)))

(declare-fun b!283143 () Bool)

(assert (=> b!283143 (= e!179645 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) (array!14133 (store (arr!6708 a!3325) i!1267 k0!2581) (size!7060 a!3325)) mask!3868))))

(assert (= (and d!65265 res!146204) b!283143))

(declare-fun m!297973 () Bool)

(assert (=> d!65265 m!297973))

(assert (=> d!65265 m!297879))

(assert (=> b!283143 m!297891))

(declare-fun m!297975 () Bool)

(assert (=> b!283143 m!297975))

(assert (=> b!283085 d!65265))

(declare-fun d!65267 () Bool)

(declare-fun e!179648 () Bool)

(assert (=> d!65267 e!179648))

(declare-fun res!146207 () Bool)

(assert (=> d!65267 (=> (not res!146207) (not e!179648))))

(assert (=> d!65267 (= res!146207 (and (or (bvslt i!1267 #b00000000000000000000000000000000) (bvsge i!1267 (size!7060 a!3325)) (and (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7060 a!3325)))) (or (bvslt i!1267 #b00000000000000000000000000000000) (bvsge i!1267 (size!7060 a!3325)) (and (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7060 a!3325)))) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7060 a!3325))))))

(declare-fun lt!139948 () Unit!9016)

(declare-fun choose!83 (array!14132 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!9016)

(assert (=> d!65267 (= lt!139948 (choose!83 a!3325 i!1267 k0!2581 startIndex!26 mask!3868))))

(assert (=> d!65267 (validMask!0 mask!3868)))

(assert (=> d!65267 (= (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k0!2581 startIndex!26 mask!3868) lt!139948)))

(declare-fun b!283146 () Bool)

(assert (=> b!283146 (= e!179648 (= (seekEntryOrOpen!0 (select (arr!6708 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6708 a!3325) i!1267 k0!2581) startIndex!26) (array!14133 (store (arr!6708 a!3325) i!1267 k0!2581) (size!7060 a!3325)) mask!3868)))))

(assert (= (and d!65267 res!146207) b!283146))

(declare-fun m!297977 () Bool)

(assert (=> d!65267 m!297977))

(assert (=> d!65267 m!297879))

(assert (=> b!283146 m!297891))

(assert (=> b!283146 m!297865))

(assert (=> b!283146 m!297885))

(assert (=> b!283146 m!297865))

(assert (=> b!283146 m!297899))

(assert (=> b!283146 m!297885))

(declare-fun m!297979 () Bool)

(assert (=> b!283146 m!297979))

(assert (=> b!283084 d!65267))

(declare-fun e!179678 () SeekEntryResult!1866)

(declare-fun b!283193 () Bool)

(declare-fun lt!139973 () SeekEntryResult!1866)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14132 (_ BitVec 32)) SeekEntryResult!1866)

(assert (=> b!283193 (= e!179678 (seekKeyOrZeroReturnVacant!0 (x!27840 lt!139973) (index!9636 lt!139973) (index!9636 lt!139973) (select (arr!6708 a!3325) startIndex!26) a!3325 mask!3868))))

(declare-fun b!283194 () Bool)

(declare-fun e!179679 () SeekEntryResult!1866)

(assert (=> b!283194 (= e!179679 Undefined!1866)))

(declare-fun b!283195 () Bool)

(declare-fun c!46042 () Bool)

(declare-fun lt!139974 () (_ BitVec 64))

(assert (=> b!283195 (= c!46042 (= lt!139974 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!179677 () SeekEntryResult!1866)

(assert (=> b!283195 (= e!179677 e!179678)))

(declare-fun b!283196 () Bool)

(assert (=> b!283196 (= e!179679 e!179677)))

(assert (=> b!283196 (= lt!139974 (select (arr!6708 a!3325) (index!9636 lt!139973)))))

(declare-fun c!46040 () Bool)

(assert (=> b!283196 (= c!46040 (= lt!139974 (select (arr!6708 a!3325) startIndex!26)))))

(declare-fun b!283197 () Bool)

(assert (=> b!283197 (= e!179677 (Found!1866 (index!9636 lt!139973)))))

(declare-fun b!283198 () Bool)

(assert (=> b!283198 (= e!179678 (MissingZero!1866 (index!9636 lt!139973)))))

(declare-fun d!65279 () Bool)

(declare-fun lt!139975 () SeekEntryResult!1866)

(get-info :version)

(assert (=> d!65279 (and (or ((_ is Undefined!1866) lt!139975) (not ((_ is Found!1866) lt!139975)) (and (bvsge (index!9635 lt!139975) #b00000000000000000000000000000000) (bvslt (index!9635 lt!139975) (size!7060 a!3325)))) (or ((_ is Undefined!1866) lt!139975) ((_ is Found!1866) lt!139975) (not ((_ is MissingZero!1866) lt!139975)) (and (bvsge (index!9634 lt!139975) #b00000000000000000000000000000000) (bvslt (index!9634 lt!139975) (size!7060 a!3325)))) (or ((_ is Undefined!1866) lt!139975) ((_ is Found!1866) lt!139975) ((_ is MissingZero!1866) lt!139975) (not ((_ is MissingVacant!1866) lt!139975)) (and (bvsge (index!9637 lt!139975) #b00000000000000000000000000000000) (bvslt (index!9637 lt!139975) (size!7060 a!3325)))) (or ((_ is Undefined!1866) lt!139975) (ite ((_ is Found!1866) lt!139975) (= (select (arr!6708 a!3325) (index!9635 lt!139975)) (select (arr!6708 a!3325) startIndex!26)) (ite ((_ is MissingZero!1866) lt!139975) (= (select (arr!6708 a!3325) (index!9634 lt!139975)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1866) lt!139975) (= (select (arr!6708 a!3325) (index!9637 lt!139975)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!65279 (= lt!139975 e!179679)))

(declare-fun c!46041 () Bool)

(assert (=> d!65279 (= c!46041 (and ((_ is Intermediate!1866) lt!139973) (undefined!2678 lt!139973)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14132 (_ BitVec 32)) SeekEntryResult!1866)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!65279 (= lt!139973 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!6708 a!3325) startIndex!26) mask!3868) (select (arr!6708 a!3325) startIndex!26) a!3325 mask!3868))))

(assert (=> d!65279 (validMask!0 mask!3868)))

(assert (=> d!65279 (= (seekEntryOrOpen!0 (select (arr!6708 a!3325) startIndex!26) a!3325 mask!3868) lt!139975)))

(assert (= (and d!65279 c!46041) b!283194))

(assert (= (and d!65279 (not c!46041)) b!283196))

(assert (= (and b!283196 c!46040) b!283197))

(assert (= (and b!283196 (not c!46040)) b!283195))

(assert (= (and b!283195 c!46042) b!283198))

(assert (= (and b!283195 (not c!46042)) b!283193))

(assert (=> b!283193 m!297865))

(declare-fun m!298011 () Bool)

(assert (=> b!283193 m!298011))

(declare-fun m!298013 () Bool)

(assert (=> b!283196 m!298013))

(assert (=> d!65279 m!297879))

(declare-fun m!298015 () Bool)

(assert (=> d!65279 m!298015))

(assert (=> d!65279 m!297865))

(declare-fun m!298017 () Bool)

(assert (=> d!65279 m!298017))

(declare-fun m!298019 () Bool)

(assert (=> d!65279 m!298019))

(declare-fun m!298021 () Bool)

(assert (=> d!65279 m!298021))

(declare-fun m!298023 () Bool)

(assert (=> d!65279 m!298023))

(assert (=> d!65279 m!297865))

(assert (=> d!65279 m!298015))

(assert (=> b!283084 d!65279))

(declare-fun d!65289 () Bool)

(declare-fun e!179693 () Bool)

(assert (=> d!65289 e!179693))

(declare-fun res!146222 () Bool)

(assert (=> d!65289 (=> (not res!146222) (not e!179693))))

(assert (=> d!65289 (= res!146222 (and (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7060 a!3325))))))

(declare-fun lt!139987 () Unit!9016)

(declare-fun choose!41 (array!14132 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4516) Unit!9016)

(assert (=> d!65289 (= lt!139987 (choose!41 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4513))))

(assert (=> d!65289 (bvslt (size!7060 a!3325) #b01111111111111111111111111111111)))

(assert (=> d!65289 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4513) lt!139987)))

(declare-fun b!283221 () Bool)

(assert (=> b!283221 (= e!179693 (arrayNoDuplicates!0 (array!14133 (store (arr!6708 a!3325) i!1267 k0!2581) (size!7060 a!3325)) #b00000000000000000000000000000000 Nil!4513))))

(assert (= (and d!65289 res!146222) b!283221))

(declare-fun m!298025 () Bool)

(assert (=> d!65289 m!298025))

(assert (=> b!283221 m!297891))

(declare-fun m!298028 () Bool)

(assert (=> b!283221 m!298028))

(assert (=> b!283084 d!65289))

(declare-fun b!283228 () Bool)

(declare-fun e!179700 () Bool)

(declare-fun e!179699 () Bool)

(assert (=> b!283228 (= e!179700 e!179699)))

(declare-fun c!46054 () Bool)

(assert (=> b!283228 (= c!46054 (validKeyInArray!0 (select (arr!6708 a!3325) startIndex!26)))))

(declare-fun b!283229 () Bool)

(declare-fun call!25467 () Bool)

(assert (=> b!283229 (= e!179699 call!25467)))

(declare-fun b!283230 () Bool)

(declare-fun e!179698 () Bool)

(assert (=> b!283230 (= e!179698 call!25467)))

(declare-fun d!65291 () Bool)

(declare-fun res!146225 () Bool)

(assert (=> d!65291 (=> res!146225 e!179700)))

(assert (=> d!65291 (= res!146225 (bvsge startIndex!26 (size!7060 a!3325)))))

(assert (=> d!65291 (= (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868) e!179700)))

(declare-fun b!283231 () Bool)

(assert (=> b!283231 (= e!179699 e!179698)))

(declare-fun lt!139990 () (_ BitVec 64))

(assert (=> b!283231 (= lt!139990 (select (arr!6708 a!3325) startIndex!26))))

(declare-fun lt!139988 () Unit!9016)

(assert (=> b!283231 (= lt!139988 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3325 lt!139990 startIndex!26))))

(assert (=> b!283231 (arrayContainsKey!0 a!3325 lt!139990 #b00000000000000000000000000000000)))

(declare-fun lt!139989 () Unit!9016)

(assert (=> b!283231 (= lt!139989 lt!139988)))

(declare-fun res!146226 () Bool)

(assert (=> b!283231 (= res!146226 (= (seekEntryOrOpen!0 (select (arr!6708 a!3325) startIndex!26) a!3325 mask!3868) (Found!1866 startIndex!26)))))

(assert (=> b!283231 (=> (not res!146226) (not e!179698))))

(declare-fun bm!25464 () Bool)

(assert (=> bm!25464 (= call!25467 (arrayForallSeekEntryOrOpenFound!0 (bvadd startIndex!26 #b00000000000000000000000000000001) a!3325 mask!3868))))

(assert (= (and d!65291 (not res!146225)) b!283228))

(assert (= (and b!283228 c!46054) b!283231))

(assert (= (and b!283228 (not c!46054)) b!283229))

(assert (= (and b!283231 res!146226) b!283230))

(assert (= (or b!283230 b!283229) bm!25464))

(assert (=> b!283228 m!297865))

(assert (=> b!283228 m!297865))

(assert (=> b!283228 m!297867))

(assert (=> b!283231 m!297865))

(declare-fun m!298043 () Bool)

(assert (=> b!283231 m!298043))

(declare-fun m!298045 () Bool)

(assert (=> b!283231 m!298045))

(assert (=> b!283231 m!297865))

(assert (=> b!283231 m!297899))

(declare-fun m!298047 () Bool)

(assert (=> bm!25464 m!298047))

(assert (=> b!283084 d!65291))

(declare-fun b!283264 () Bool)

(declare-fun e!179726 () Bool)

(declare-fun call!25477 () Bool)

(assert (=> b!283264 (= e!179726 call!25477)))

(declare-fun b!283265 () Bool)

(assert (=> b!283265 (= e!179726 call!25477)))

(declare-fun d!65295 () Bool)

(declare-fun res!146247 () Bool)

(declare-fun e!179729 () Bool)

(assert (=> d!65295 (=> res!146247 e!179729)))

(assert (=> d!65295 (= res!146247 (bvsge #b00000000000000000000000000000000 (size!7060 lt!139912)))))

(assert (=> d!65295 (= (arrayNoDuplicates!0 lt!139912 #b00000000000000000000000000000000 Nil!4513) e!179729)))

(declare-fun b!283266 () Bool)

(declare-fun e!179728 () Bool)

(assert (=> b!283266 (= e!179729 e!179728)))

(declare-fun res!146245 () Bool)

(assert (=> b!283266 (=> (not res!146245) (not e!179728))))

(declare-fun e!179727 () Bool)

(assert (=> b!283266 (= res!146245 (not e!179727))))

(declare-fun res!146246 () Bool)

(assert (=> b!283266 (=> (not res!146246) (not e!179727))))

(assert (=> b!283266 (= res!146246 (validKeyInArray!0 (select (arr!6708 lt!139912) #b00000000000000000000000000000000)))))

(declare-fun bm!25474 () Bool)

(declare-fun c!46062 () Bool)

(assert (=> bm!25474 (= call!25477 (arrayNoDuplicates!0 lt!139912 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!46062 (Cons!4512 (select (arr!6708 lt!139912) #b00000000000000000000000000000000) Nil!4513) Nil!4513)))))

(declare-fun b!283267 () Bool)

(assert (=> b!283267 (= e!179728 e!179726)))

(assert (=> b!283267 (= c!46062 (validKeyInArray!0 (select (arr!6708 lt!139912) #b00000000000000000000000000000000)))))

(declare-fun b!283268 () Bool)

(declare-fun contains!1991 (List!4516 (_ BitVec 64)) Bool)

(assert (=> b!283268 (= e!179727 (contains!1991 Nil!4513 (select (arr!6708 lt!139912) #b00000000000000000000000000000000)))))

(assert (= (and d!65295 (not res!146247)) b!283266))

(assert (= (and b!283266 res!146246) b!283268))

(assert (= (and b!283266 res!146245) b!283267))

(assert (= (and b!283267 c!46062) b!283265))

(assert (= (and b!283267 (not c!46062)) b!283264))

(assert (= (or b!283265 b!283264) bm!25474))

(declare-fun m!298107 () Bool)

(assert (=> b!283266 m!298107))

(assert (=> b!283266 m!298107))

(declare-fun m!298109 () Bool)

(assert (=> b!283266 m!298109))

(assert (=> bm!25474 m!298107))

(declare-fun m!298111 () Bool)

(assert (=> bm!25474 m!298111))

(assert (=> b!283267 m!298107))

(assert (=> b!283267 m!298107))

(assert (=> b!283267 m!298109))

(assert (=> b!283268 m!298107))

(assert (=> b!283268 m!298107))

(declare-fun m!298113 () Bool)

(assert (=> b!283268 m!298113))

(assert (=> b!283084 d!65295))

(declare-fun b!283271 () Bool)

(declare-fun e!179733 () SeekEntryResult!1866)

(declare-fun lt!140014 () SeekEntryResult!1866)

(assert (=> b!283271 (= e!179733 (seekKeyOrZeroReturnVacant!0 (x!27840 lt!140014) (index!9636 lt!140014) (index!9636 lt!140014) (select (store (arr!6708 a!3325) i!1267 k0!2581) startIndex!26) lt!139912 mask!3868))))

(declare-fun b!283272 () Bool)

(declare-fun e!179734 () SeekEntryResult!1866)

(assert (=> b!283272 (= e!179734 Undefined!1866)))

(declare-fun b!283273 () Bool)

(declare-fun c!46065 () Bool)

(declare-fun lt!140015 () (_ BitVec 64))

(assert (=> b!283273 (= c!46065 (= lt!140015 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!179732 () SeekEntryResult!1866)

(assert (=> b!283273 (= e!179732 e!179733)))

(declare-fun b!283274 () Bool)

(assert (=> b!283274 (= e!179734 e!179732)))

(assert (=> b!283274 (= lt!140015 (select (arr!6708 lt!139912) (index!9636 lt!140014)))))

(declare-fun c!46063 () Bool)

(assert (=> b!283274 (= c!46063 (= lt!140015 (select (store (arr!6708 a!3325) i!1267 k0!2581) startIndex!26)))))

(declare-fun b!283275 () Bool)

(assert (=> b!283275 (= e!179732 (Found!1866 (index!9636 lt!140014)))))

(declare-fun b!283276 () Bool)

(assert (=> b!283276 (= e!179733 (MissingZero!1866 (index!9636 lt!140014)))))

(declare-fun lt!140016 () SeekEntryResult!1866)

(declare-fun d!65307 () Bool)

(assert (=> d!65307 (and (or ((_ is Undefined!1866) lt!140016) (not ((_ is Found!1866) lt!140016)) (and (bvsge (index!9635 lt!140016) #b00000000000000000000000000000000) (bvslt (index!9635 lt!140016) (size!7060 lt!139912)))) (or ((_ is Undefined!1866) lt!140016) ((_ is Found!1866) lt!140016) (not ((_ is MissingZero!1866) lt!140016)) (and (bvsge (index!9634 lt!140016) #b00000000000000000000000000000000) (bvslt (index!9634 lt!140016) (size!7060 lt!139912)))) (or ((_ is Undefined!1866) lt!140016) ((_ is Found!1866) lt!140016) ((_ is MissingZero!1866) lt!140016) (not ((_ is MissingVacant!1866) lt!140016)) (and (bvsge (index!9637 lt!140016) #b00000000000000000000000000000000) (bvslt (index!9637 lt!140016) (size!7060 lt!139912)))) (or ((_ is Undefined!1866) lt!140016) (ite ((_ is Found!1866) lt!140016) (= (select (arr!6708 lt!139912) (index!9635 lt!140016)) (select (store (arr!6708 a!3325) i!1267 k0!2581) startIndex!26)) (ite ((_ is MissingZero!1866) lt!140016) (= (select (arr!6708 lt!139912) (index!9634 lt!140016)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1866) lt!140016) (= (select (arr!6708 lt!139912) (index!9637 lt!140016)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!65307 (= lt!140016 e!179734)))

(declare-fun c!46064 () Bool)

(assert (=> d!65307 (= c!46064 (and ((_ is Intermediate!1866) lt!140014) (undefined!2678 lt!140014)))))

(assert (=> d!65307 (= lt!140014 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!6708 a!3325) i!1267 k0!2581) startIndex!26) mask!3868) (select (store (arr!6708 a!3325) i!1267 k0!2581) startIndex!26) lt!139912 mask!3868))))

(assert (=> d!65307 (validMask!0 mask!3868)))

(assert (=> d!65307 (= (seekEntryOrOpen!0 (select (store (arr!6708 a!3325) i!1267 k0!2581) startIndex!26) lt!139912 mask!3868) lt!140016)))

(assert (= (and d!65307 c!46064) b!283272))

(assert (= (and d!65307 (not c!46064)) b!283274))

(assert (= (and b!283274 c!46063) b!283275))

(assert (= (and b!283274 (not c!46063)) b!283273))

(assert (= (and b!283273 c!46065) b!283276))

(assert (= (and b!283273 (not c!46065)) b!283271))

(assert (=> b!283271 m!297885))

(declare-fun m!298115 () Bool)

(assert (=> b!283271 m!298115))

(declare-fun m!298119 () Bool)

(assert (=> b!283274 m!298119))

(assert (=> d!65307 m!297879))

(declare-fun m!298121 () Bool)

(assert (=> d!65307 m!298121))

(assert (=> d!65307 m!297885))

(declare-fun m!298125 () Bool)

(assert (=> d!65307 m!298125))

(declare-fun m!298127 () Bool)

(assert (=> d!65307 m!298127))

(declare-fun m!298129 () Bool)

(assert (=> d!65307 m!298129))

(declare-fun m!298131 () Bool)

(assert (=> d!65307 m!298131))

(assert (=> d!65307 m!297885))

(assert (=> d!65307 m!298121))

(assert (=> b!283084 d!65307))

(declare-fun d!65311 () Bool)

(assert (=> d!65311 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(declare-fun lt!140023 () Unit!9016)

(declare-fun choose!38 (array!14132 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9016)

(assert (=> d!65311 (= lt!140023 (choose!38 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26))))

(assert (=> d!65311 (validMask!0 mask!3868)))

(assert (=> d!65311 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26) lt!140023)))

(declare-fun bs!10062 () Bool)

(assert (= bs!10062 d!65311))

(assert (=> bs!10062 m!297893))

(declare-fun m!298137 () Bool)

(assert (=> bs!10062 m!298137))

(assert (=> bs!10062 m!297879))

(assert (=> b!283084 d!65311))

(declare-fun b!283281 () Bool)

(declare-fun e!179741 () Bool)

(declare-fun e!179740 () Bool)

(assert (=> b!283281 (= e!179741 e!179740)))

(declare-fun c!46066 () Bool)

(assert (=> b!283281 (= c!46066 (validKeyInArray!0 (select (arr!6708 a!3325) #b00000000000000000000000000000000)))))

(declare-fun b!283282 () Bool)

(declare-fun call!25478 () Bool)

(assert (=> b!283282 (= e!179740 call!25478)))

(declare-fun b!283283 () Bool)

(declare-fun e!179739 () Bool)

(assert (=> b!283283 (= e!179739 call!25478)))

(declare-fun d!65315 () Bool)

(declare-fun res!146254 () Bool)

(assert (=> d!65315 (=> res!146254 e!179741)))

(assert (=> d!65315 (= res!146254 (bvsge #b00000000000000000000000000000000 (size!7060 a!3325)))))

(assert (=> d!65315 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868) e!179741)))

(declare-fun b!283284 () Bool)

(assert (=> b!283284 (= e!179740 e!179739)))

(declare-fun lt!140026 () (_ BitVec 64))

(assert (=> b!283284 (= lt!140026 (select (arr!6708 a!3325) #b00000000000000000000000000000000))))

(declare-fun lt!140024 () Unit!9016)

(assert (=> b!283284 (= lt!140024 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3325 lt!140026 #b00000000000000000000000000000000))))

(assert (=> b!283284 (arrayContainsKey!0 a!3325 lt!140026 #b00000000000000000000000000000000)))

(declare-fun lt!140025 () Unit!9016)

(assert (=> b!283284 (= lt!140025 lt!140024)))

(declare-fun res!146255 () Bool)

(assert (=> b!283284 (= res!146255 (= (seekEntryOrOpen!0 (select (arr!6708 a!3325) #b00000000000000000000000000000000) a!3325 mask!3868) (Found!1866 #b00000000000000000000000000000000)))))

(assert (=> b!283284 (=> (not res!146255) (not e!179739))))

(declare-fun bm!25475 () Bool)

(assert (=> bm!25475 (= call!25478 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3325 mask!3868))))

(assert (= (and d!65315 (not res!146254)) b!283281))

(assert (= (and b!283281 c!46066) b!283284))

(assert (= (and b!283281 (not c!46066)) b!283282))

(assert (= (and b!283284 res!146255) b!283283))

(assert (= (or b!283283 b!283282) bm!25475))

(assert (=> b!283281 m!297945))

(assert (=> b!283281 m!297945))

(declare-fun m!298139 () Bool)

(assert (=> b!283281 m!298139))

(assert (=> b!283284 m!297945))

(declare-fun m!298141 () Bool)

(assert (=> b!283284 m!298141))

(declare-fun m!298143 () Bool)

(assert (=> b!283284 m!298143))

(assert (=> b!283284 m!297945))

(declare-fun m!298145 () Bool)

(assert (=> b!283284 m!298145))

(declare-fun m!298147 () Bool)

(assert (=> bm!25475 m!298147))

(assert (=> b!283079 d!65315))

(declare-fun b!283285 () Bool)

(declare-fun e!179742 () Bool)

(declare-fun call!25479 () Bool)

(assert (=> b!283285 (= e!179742 call!25479)))

(declare-fun b!283286 () Bool)

(assert (=> b!283286 (= e!179742 call!25479)))

(declare-fun d!65317 () Bool)

(declare-fun res!146258 () Bool)

(declare-fun e!179745 () Bool)

(assert (=> d!65317 (=> res!146258 e!179745)))

(assert (=> d!65317 (= res!146258 (bvsge #b00000000000000000000000000000000 (size!7060 a!3325)))))

(assert (=> d!65317 (= (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4513) e!179745)))

(declare-fun b!283287 () Bool)

(declare-fun e!179744 () Bool)

(assert (=> b!283287 (= e!179745 e!179744)))

(declare-fun res!146256 () Bool)

(assert (=> b!283287 (=> (not res!146256) (not e!179744))))

(declare-fun e!179743 () Bool)

(assert (=> b!283287 (= res!146256 (not e!179743))))

(declare-fun res!146257 () Bool)

(assert (=> b!283287 (=> (not res!146257) (not e!179743))))

(assert (=> b!283287 (= res!146257 (validKeyInArray!0 (select (arr!6708 a!3325) #b00000000000000000000000000000000)))))

(declare-fun bm!25476 () Bool)

(declare-fun c!46067 () Bool)

(assert (=> bm!25476 (= call!25479 (arrayNoDuplicates!0 a!3325 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!46067 (Cons!4512 (select (arr!6708 a!3325) #b00000000000000000000000000000000) Nil!4513) Nil!4513)))))

(declare-fun b!283288 () Bool)

(assert (=> b!283288 (= e!179744 e!179742)))

(assert (=> b!283288 (= c!46067 (validKeyInArray!0 (select (arr!6708 a!3325) #b00000000000000000000000000000000)))))

(declare-fun b!283289 () Bool)

(assert (=> b!283289 (= e!179743 (contains!1991 Nil!4513 (select (arr!6708 a!3325) #b00000000000000000000000000000000)))))

(assert (= (and d!65317 (not res!146258)) b!283287))

(assert (= (and b!283287 res!146257) b!283289))

(assert (= (and b!283287 res!146256) b!283288))

(assert (= (and b!283288 c!46067) b!283286))

(assert (= (and b!283288 (not c!46067)) b!283285))

(assert (= (or b!283286 b!283285) bm!25476))

(assert (=> b!283287 m!297945))

(assert (=> b!283287 m!297945))

(assert (=> b!283287 m!298139))

(assert (=> bm!25476 m!297945))

(declare-fun m!298149 () Bool)

(assert (=> bm!25476 m!298149))

(assert (=> b!283288 m!297945))

(assert (=> b!283288 m!297945))

(assert (=> b!283288 m!298139))

(assert (=> b!283289 m!297945))

(assert (=> b!283289 m!297945))

(declare-fun m!298151 () Bool)

(assert (=> b!283289 m!298151))

(assert (=> b!283086 d!65317))

(declare-fun lt!140027 () SeekEntryResult!1866)

(declare-fun b!283290 () Bool)

(declare-fun e!179747 () SeekEntryResult!1866)

(assert (=> b!283290 (= e!179747 (seekKeyOrZeroReturnVacant!0 (x!27840 lt!140027) (index!9636 lt!140027) (index!9636 lt!140027) k0!2581 a!3325 mask!3868))))

(declare-fun b!283291 () Bool)

(declare-fun e!179748 () SeekEntryResult!1866)

(assert (=> b!283291 (= e!179748 Undefined!1866)))

(declare-fun b!283292 () Bool)

(declare-fun c!46070 () Bool)

(declare-fun lt!140028 () (_ BitVec 64))

(assert (=> b!283292 (= c!46070 (= lt!140028 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!179746 () SeekEntryResult!1866)

(assert (=> b!283292 (= e!179746 e!179747)))

(declare-fun b!283293 () Bool)

(assert (=> b!283293 (= e!179748 e!179746)))

(assert (=> b!283293 (= lt!140028 (select (arr!6708 a!3325) (index!9636 lt!140027)))))

(declare-fun c!46068 () Bool)

(assert (=> b!283293 (= c!46068 (= lt!140028 k0!2581))))

(declare-fun b!283294 () Bool)

(assert (=> b!283294 (= e!179746 (Found!1866 (index!9636 lt!140027)))))

(declare-fun b!283295 () Bool)

(assert (=> b!283295 (= e!179747 (MissingZero!1866 (index!9636 lt!140027)))))

(declare-fun d!65319 () Bool)

(declare-fun lt!140029 () SeekEntryResult!1866)

(assert (=> d!65319 (and (or ((_ is Undefined!1866) lt!140029) (not ((_ is Found!1866) lt!140029)) (and (bvsge (index!9635 lt!140029) #b00000000000000000000000000000000) (bvslt (index!9635 lt!140029) (size!7060 a!3325)))) (or ((_ is Undefined!1866) lt!140029) ((_ is Found!1866) lt!140029) (not ((_ is MissingZero!1866) lt!140029)) (and (bvsge (index!9634 lt!140029) #b00000000000000000000000000000000) (bvslt (index!9634 lt!140029) (size!7060 a!3325)))) (or ((_ is Undefined!1866) lt!140029) ((_ is Found!1866) lt!140029) ((_ is MissingZero!1866) lt!140029) (not ((_ is MissingVacant!1866) lt!140029)) (and (bvsge (index!9637 lt!140029) #b00000000000000000000000000000000) (bvslt (index!9637 lt!140029) (size!7060 a!3325)))) (or ((_ is Undefined!1866) lt!140029) (ite ((_ is Found!1866) lt!140029) (= (select (arr!6708 a!3325) (index!9635 lt!140029)) k0!2581) (ite ((_ is MissingZero!1866) lt!140029) (= (select (arr!6708 a!3325) (index!9634 lt!140029)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1866) lt!140029) (= (select (arr!6708 a!3325) (index!9637 lt!140029)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!65319 (= lt!140029 e!179748)))

(declare-fun c!46069 () Bool)

(assert (=> d!65319 (= c!46069 (and ((_ is Intermediate!1866) lt!140027) (undefined!2678 lt!140027)))))

(assert (=> d!65319 (= lt!140027 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2581 mask!3868) k0!2581 a!3325 mask!3868))))

(assert (=> d!65319 (validMask!0 mask!3868)))

(assert (=> d!65319 (= (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868) lt!140029)))

(assert (= (and d!65319 c!46069) b!283291))

(assert (= (and d!65319 (not c!46069)) b!283293))

(assert (= (and b!283293 c!46068) b!283294))

(assert (= (and b!283293 (not c!46068)) b!283292))

(assert (= (and b!283292 c!46070) b!283295))

(assert (= (and b!283292 (not c!46070)) b!283290))

(declare-fun m!298153 () Bool)

(assert (=> b!283290 m!298153))

(declare-fun m!298155 () Bool)

(assert (=> b!283293 m!298155))

(assert (=> d!65319 m!297879))

(declare-fun m!298157 () Bool)

(assert (=> d!65319 m!298157))

(declare-fun m!298159 () Bool)

(assert (=> d!65319 m!298159))

(declare-fun m!298161 () Bool)

(assert (=> d!65319 m!298161))

(declare-fun m!298163 () Bool)

(assert (=> d!65319 m!298163))

(declare-fun m!298165 () Bool)

(assert (=> d!65319 m!298165))

(assert (=> d!65319 m!298157))

(assert (=> b!283081 d!65319))

(declare-fun d!65321 () Bool)

(assert (=> d!65321 (= (validMask!0 mask!3868) (and (or (= mask!3868 #b00000000000000000000000000000111) (= mask!3868 #b00000000000000000000000000001111) (= mask!3868 #b00000000000000000000000000011111) (= mask!3868 #b00000000000000000000000000111111) (= mask!3868 #b00000000000000000000000001111111) (= mask!3868 #b00000000000000000000000011111111) (= mask!3868 #b00000000000000000000000111111111) (= mask!3868 #b00000000000000000000001111111111) (= mask!3868 #b00000000000000000000011111111111) (= mask!3868 #b00000000000000000000111111111111) (= mask!3868 #b00000000000000000001111111111111) (= mask!3868 #b00000000000000000011111111111111) (= mask!3868 #b00000000000000000111111111111111) (= mask!3868 #b00000000000000001111111111111111) (= mask!3868 #b00000000000000011111111111111111) (= mask!3868 #b00000000000000111111111111111111) (= mask!3868 #b00000000000001111111111111111111) (= mask!3868 #b00000000000011111111111111111111) (= mask!3868 #b00000000000111111111111111111111) (= mask!3868 #b00000000001111111111111111111111) (= mask!3868 #b00000000011111111111111111111111) (= mask!3868 #b00000000111111111111111111111111) (= mask!3868 #b00000001111111111111111111111111) (= mask!3868 #b00000011111111111111111111111111) (= mask!3868 #b00000111111111111111111111111111) (= mask!3868 #b00001111111111111111111111111111) (= mask!3868 #b00011111111111111111111111111111) (= mask!3868 #b00111111111111111111111111111111)) (bvsle mask!3868 #b00111111111111111111111111111111)))))

(assert (=> start!27314 d!65321))

(declare-fun d!65335 () Bool)

(assert (=> d!65335 (= (array_inv!4671 a!3325) (bvsge (size!7060 a!3325) #b00000000000000000000000000000000))))

(assert (=> start!27314 d!65335))

(check-sat (not d!65265) (not b!283137) (not b!283136) (not b!283231) (not b!283228) (not b!283288) (not b!283284) (not b!283221) (not b!283124) (not b!283267) (not b!283287) (not b!283268) (not bm!25475) (not b!283290) (not b!283140) (not b!283193) (not d!65311) (not b!283146) (not bm!25459) (not b!283289) (not d!65319) (not bm!25464) (not b!283281) (not b!283143) (not bm!25460) (not d!65289) (not d!65307) (not d!65279) (not b!283133) (not b!283266) (not bm!25476) (not d!65267) (not b!283271) (not bm!25474))
(check-sat)
