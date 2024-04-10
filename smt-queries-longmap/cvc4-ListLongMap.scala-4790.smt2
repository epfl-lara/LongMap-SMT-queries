; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65804 () Bool)

(assert start!65804)

(declare-fun b!757152 () Bool)

(declare-fun e!422177 () Bool)

(assert (=> b!757152 (= e!422177 true)))

(declare-fun e!422166 () Bool)

(assert (=> b!757152 e!422166))

(declare-fun res!512038 () Bool)

(assert (=> b!757152 (=> (not res!512038) (not e!422166))))

(declare-fun lt!337166 () (_ BitVec 64))

(assert (=> b!757152 (= res!512038 (= lt!337166 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!26188 0))(
  ( (Unit!26189) )
))
(declare-fun lt!337161 () Unit!26188)

(declare-fun e!422171 () Unit!26188)

(assert (=> b!757152 (= lt!337161 e!422171)))

(declare-fun c!82941 () Bool)

(assert (=> b!757152 (= c!82941 (= lt!337166 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!757153 () Bool)

(declare-fun e!422176 () Bool)

(declare-fun e!422169 () Bool)

(assert (=> b!757153 (= e!422176 e!422169)))

(declare-fun res!512044 () Bool)

(assert (=> b!757153 (=> (not res!512044) (not e!422169))))

(declare-datatypes ((SeekEntryResult!7702 0))(
  ( (MissingZero!7702 (index!33176 (_ BitVec 32))) (Found!7702 (index!33177 (_ BitVec 32))) (Intermediate!7702 (undefined!8514 Bool) (index!33178 (_ BitVec 32)) (x!64068 (_ BitVec 32))) (Undefined!7702) (MissingVacant!7702 (index!33179 (_ BitVec 32))) )
))
(declare-fun lt!337168 () SeekEntryResult!7702)

(declare-fun lt!337163 () SeekEntryResult!7702)

(assert (=> b!757153 (= res!512044 (= lt!337168 lt!337163))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-datatypes ((array!41977 0))(
  ( (array!41978 (arr!20102 (Array (_ BitVec 32) (_ BitVec 64))) (size!20523 (_ BitVec 32))) )
))
(declare-fun lt!337160 () array!41977)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!337165 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41977 (_ BitVec 32)) SeekEntryResult!7702)

(assert (=> b!757153 (= lt!337163 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!337165 lt!337160 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!757153 (= lt!337168 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!337165 mask!3328) lt!337165 lt!337160 mask!3328))))

(declare-fun a!3186 () array!41977)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!757153 (= lt!337165 (select (store (arr!20102 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!757153 (= lt!337160 (array!41978 (store (arr!20102 a!3186) i!1173 k!2102) (size!20523 a!3186)))))

(declare-fun b!757154 () Bool)

(declare-fun res!512032 () Bool)

(assert (=> b!757154 (=> (not res!512032) (not e!422176))))

(declare-fun e!422172 () Bool)

(assert (=> b!757154 (= res!512032 e!422172)))

(declare-fun c!82942 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!757154 (= c!82942 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!757155 () Bool)

(declare-fun res!512037 () Bool)

(assert (=> b!757155 (=> (not res!512037) (not e!422176))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!757155 (= res!512037 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20102 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!757156 () Bool)

(declare-fun res!512042 () Bool)

(declare-fun e!422173 () Bool)

(assert (=> b!757156 (=> (not res!512042) (not e!422173))))

(assert (=> b!757156 (= res!512042 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20523 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20523 a!3186))))))

(declare-fun lt!337169 () SeekEntryResult!7702)

(declare-fun b!757157 () Bool)

(assert (=> b!757157 (= e!422172 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20102 a!3186) j!159) a!3186 mask!3328) lt!337169))))

(declare-fun b!757158 () Bool)

(declare-fun res!512030 () Bool)

(declare-fun e!422175 () Bool)

(assert (=> b!757158 (=> (not res!512030) (not e!422175))))

(assert (=> b!757158 (= res!512030 (and (= (size!20523 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20523 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20523 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!757159 () Bool)

(declare-fun res!512048 () Bool)

(assert (=> b!757159 (=> (not res!512048) (not e!422175))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!757159 (= res!512048 (validKeyInArray!0 k!2102))))

(declare-fun res!512046 () Bool)

(assert (=> start!65804 (=> (not res!512046) (not e!422175))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65804 (= res!512046 (validMask!0 mask!3328))))

(assert (=> start!65804 e!422175))

(assert (=> start!65804 true))

(declare-fun array_inv!15898 (array!41977) Bool)

(assert (=> start!65804 (array_inv!15898 a!3186)))

(declare-fun b!757151 () Bool)

(declare-fun res!512034 () Bool)

(assert (=> b!757151 (=> (not res!512034) (not e!422175))))

(assert (=> b!757151 (= res!512034 (validKeyInArray!0 (select (arr!20102 a!3186) j!159)))))

(declare-fun b!757160 () Bool)

(declare-fun e!422167 () Bool)

(declare-fun e!422168 () Bool)

(assert (=> b!757160 (= e!422167 e!422168)))

(declare-fun res!512043 () Bool)

(assert (=> b!757160 (=> res!512043 e!422168)))

(declare-fun lt!337162 () SeekEntryResult!7702)

(declare-fun lt!337164 () SeekEntryResult!7702)

(assert (=> b!757160 (= res!512043 (not (= lt!337162 lt!337164)))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41977 (_ BitVec 32)) SeekEntryResult!7702)

(assert (=> b!757160 (= lt!337162 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20102 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!757161 () Bool)

(declare-fun res!512031 () Bool)

(assert (=> b!757161 (=> (not res!512031) (not e!422166))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41977 (_ BitVec 32)) SeekEntryResult!7702)

(assert (=> b!757161 (= res!512031 (= (seekEntryOrOpen!0 lt!337165 lt!337160 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!337165 lt!337160 mask!3328)))))

(declare-fun b!757162 () Bool)

(assert (=> b!757162 (= e!422175 e!422173)))

(declare-fun res!512045 () Bool)

(assert (=> b!757162 (=> (not res!512045) (not e!422173))))

(declare-fun lt!337159 () SeekEntryResult!7702)

(assert (=> b!757162 (= res!512045 (or (= lt!337159 (MissingZero!7702 i!1173)) (= lt!337159 (MissingVacant!7702 i!1173))))))

(assert (=> b!757162 (= lt!337159 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!757163 () Bool)

(declare-fun res!512036 () Bool)

(assert (=> b!757163 (=> (not res!512036) (not e!422173))))

(declare-datatypes ((List!14104 0))(
  ( (Nil!14101) (Cons!14100 (h!15172 (_ BitVec 64)) (t!20419 List!14104)) )
))
(declare-fun arrayNoDuplicates!0 (array!41977 (_ BitVec 32) List!14104) Bool)

(assert (=> b!757163 (= res!512036 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14101))))

(declare-fun b!757164 () Bool)

(assert (=> b!757164 (= e!422173 e!422176)))

(declare-fun res!512041 () Bool)

(assert (=> b!757164 (=> (not res!512041) (not e!422176))))

(assert (=> b!757164 (= res!512041 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20102 a!3186) j!159) mask!3328) (select (arr!20102 a!3186) j!159) a!3186 mask!3328) lt!337169))))

(assert (=> b!757164 (= lt!337169 (Intermediate!7702 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!757165 () Bool)

(assert (=> b!757165 (= e!422172 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20102 a!3186) j!159) a!3186 mask!3328) (Found!7702 j!159)))))

(declare-fun e!422174 () Bool)

(declare-fun b!757166 () Bool)

(assert (=> b!757166 (= e!422174 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20102 a!3186) j!159) a!3186 mask!3328) lt!337164))))

(declare-fun b!757167 () Bool)

(declare-fun res!512039 () Bool)

(assert (=> b!757167 (=> (not res!512039) (not e!422175))))

(declare-fun arrayContainsKey!0 (array!41977 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!757167 (= res!512039 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!757168 () Bool)

(declare-fun Unit!26190 () Unit!26188)

(assert (=> b!757168 (= e!422171 Unit!26190)))

(declare-fun b!757169 () Bool)

(assert (=> b!757169 (= e!422168 e!422177)))

(declare-fun res!512035 () Bool)

(assert (=> b!757169 (=> res!512035 e!422177)))

(assert (=> b!757169 (= res!512035 (= lt!337166 lt!337165))))

(assert (=> b!757169 (= lt!337166 (select (store (arr!20102 a!3186) i!1173 k!2102) index!1321))))

(declare-fun b!757170 () Bool)

(declare-fun Unit!26191 () Unit!26188)

(assert (=> b!757170 (= e!422171 Unit!26191)))

(assert (=> b!757170 false))

(declare-fun b!757171 () Bool)

(declare-fun lt!337158 () SeekEntryResult!7702)

(assert (=> b!757171 (= e!422166 (= lt!337158 lt!337162))))

(declare-fun b!757172 () Bool)

(declare-fun res!512047 () Bool)

(assert (=> b!757172 (=> (not res!512047) (not e!422173))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41977 (_ BitVec 32)) Bool)

(assert (=> b!757172 (= res!512047 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!757173 () Bool)

(assert (=> b!757173 (= e!422169 (not e!422167))))

(declare-fun res!512033 () Bool)

(assert (=> b!757173 (=> res!512033 e!422167)))

(assert (=> b!757173 (= res!512033 (or (not (is-Intermediate!7702 lt!337163)) (bvslt x!1131 (x!64068 lt!337163)) (not (= x!1131 (x!64068 lt!337163))) (not (= index!1321 (index!33178 lt!337163)))))))

(assert (=> b!757173 e!422174))

(declare-fun res!512040 () Bool)

(assert (=> b!757173 (=> (not res!512040) (not e!422174))))

(assert (=> b!757173 (= res!512040 (= lt!337158 lt!337164))))

(assert (=> b!757173 (= lt!337164 (Found!7702 j!159))))

(assert (=> b!757173 (= lt!337158 (seekEntryOrOpen!0 (select (arr!20102 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!757173 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!337167 () Unit!26188)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41977 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26188)

(assert (=> b!757173 (= lt!337167 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(assert (= (and start!65804 res!512046) b!757158))

(assert (= (and b!757158 res!512030) b!757151))

(assert (= (and b!757151 res!512034) b!757159))

(assert (= (and b!757159 res!512048) b!757167))

(assert (= (and b!757167 res!512039) b!757162))

(assert (= (and b!757162 res!512045) b!757172))

(assert (= (and b!757172 res!512047) b!757163))

(assert (= (and b!757163 res!512036) b!757156))

(assert (= (and b!757156 res!512042) b!757164))

(assert (= (and b!757164 res!512041) b!757155))

(assert (= (and b!757155 res!512037) b!757154))

(assert (= (and b!757154 c!82942) b!757157))

(assert (= (and b!757154 (not c!82942)) b!757165))

(assert (= (and b!757154 res!512032) b!757153))

(assert (= (and b!757153 res!512044) b!757173))

(assert (= (and b!757173 res!512040) b!757166))

(assert (= (and b!757173 (not res!512033)) b!757160))

(assert (= (and b!757160 (not res!512043)) b!757169))

(assert (= (and b!757169 (not res!512035)) b!757152))

(assert (= (and b!757152 c!82941) b!757170))

(assert (= (and b!757152 (not c!82941)) b!757168))

(assert (= (and b!757152 res!512038) b!757161))

(assert (= (and b!757161 res!512031) b!757171))

(declare-fun m!704931 () Bool)

(assert (=> b!757165 m!704931))

(assert (=> b!757165 m!704931))

(declare-fun m!704933 () Bool)

(assert (=> b!757165 m!704933))

(declare-fun m!704935 () Bool)

(assert (=> b!757172 m!704935))

(declare-fun m!704937 () Bool)

(assert (=> b!757153 m!704937))

(declare-fun m!704939 () Bool)

(assert (=> b!757153 m!704939))

(declare-fun m!704941 () Bool)

(assert (=> b!757153 m!704941))

(declare-fun m!704943 () Bool)

(assert (=> b!757153 m!704943))

(declare-fun m!704945 () Bool)

(assert (=> b!757153 m!704945))

(assert (=> b!757153 m!704937))

(declare-fun m!704947 () Bool)

(assert (=> b!757162 m!704947))

(assert (=> b!757157 m!704931))

(assert (=> b!757157 m!704931))

(declare-fun m!704949 () Bool)

(assert (=> b!757157 m!704949))

(declare-fun m!704951 () Bool)

(assert (=> b!757155 m!704951))

(assert (=> b!757169 m!704943))

(declare-fun m!704953 () Bool)

(assert (=> b!757169 m!704953))

(declare-fun m!704955 () Bool)

(assert (=> b!757161 m!704955))

(declare-fun m!704957 () Bool)

(assert (=> b!757161 m!704957))

(assert (=> b!757166 m!704931))

(assert (=> b!757166 m!704931))

(declare-fun m!704959 () Bool)

(assert (=> b!757166 m!704959))

(declare-fun m!704961 () Bool)

(assert (=> b!757163 m!704961))

(assert (=> b!757164 m!704931))

(assert (=> b!757164 m!704931))

(declare-fun m!704963 () Bool)

(assert (=> b!757164 m!704963))

(assert (=> b!757164 m!704963))

(assert (=> b!757164 m!704931))

(declare-fun m!704965 () Bool)

(assert (=> b!757164 m!704965))

(declare-fun m!704967 () Bool)

(assert (=> b!757159 m!704967))

(declare-fun m!704969 () Bool)

(assert (=> b!757167 m!704969))

(assert (=> b!757151 m!704931))

(assert (=> b!757151 m!704931))

(declare-fun m!704971 () Bool)

(assert (=> b!757151 m!704971))

(declare-fun m!704973 () Bool)

(assert (=> start!65804 m!704973))

(declare-fun m!704975 () Bool)

(assert (=> start!65804 m!704975))

(assert (=> b!757160 m!704931))

(assert (=> b!757160 m!704931))

(assert (=> b!757160 m!704933))

(assert (=> b!757173 m!704931))

(assert (=> b!757173 m!704931))

(declare-fun m!704977 () Bool)

(assert (=> b!757173 m!704977))

(declare-fun m!704979 () Bool)

(assert (=> b!757173 m!704979))

(declare-fun m!704981 () Bool)

(assert (=> b!757173 m!704981))

(push 1)

