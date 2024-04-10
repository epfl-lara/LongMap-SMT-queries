; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65688 () Bool)

(assert start!65688)

(declare-fun b!753149 () Bool)

(declare-fun res!508736 () Bool)

(declare-fun e!420082 () Bool)

(assert (=> b!753149 (=> (not res!508736) (not e!420082))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!753149 (= res!508736 (validKeyInArray!0 k0!2102))))

(declare-fun b!753150 () Bool)

(declare-fun res!508739 () Bool)

(declare-fun e!420081 () Bool)

(assert (=> b!753150 (=> (not res!508739) (not e!420081))))

(declare-datatypes ((array!41861 0))(
  ( (array!41862 (arr!20044 (Array (_ BitVec 32) (_ BitVec 64))) (size!20465 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41861)

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!753150 (= res!508739 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20044 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!508740 () Bool)

(assert (=> start!65688 (=> (not res!508740) (not e!420082))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65688 (= res!508740 (validMask!0 mask!3328))))

(assert (=> start!65688 e!420082))

(assert (=> start!65688 true))

(declare-fun array_inv!15840 (array!41861) Bool)

(assert (=> start!65688 (array_inv!15840 a!3186)))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun b!753151 () Bool)

(declare-datatypes ((SeekEntryResult!7644 0))(
  ( (MissingZero!7644 (index!32944 (_ BitVec 32))) (Found!7644 (index!32945 (_ BitVec 32))) (Intermediate!7644 (undefined!8456 Bool) (index!32946 (_ BitVec 32)) (x!63858 (_ BitVec 32))) (Undefined!7644) (MissingVacant!7644 (index!32947 (_ BitVec 32))) )
))
(declare-fun lt!335074 () SeekEntryResult!7644)

(declare-fun e!420079 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41861 (_ BitVec 32)) SeekEntryResult!7644)

(assert (=> b!753151 (= e!420079 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20044 a!3186) j!159) a!3186 mask!3328) lt!335074))))

(declare-fun b!753152 () Bool)

(declare-datatypes ((Unit!25956 0))(
  ( (Unit!25957) )
))
(declare-fun e!420078 () Unit!25956)

(declare-fun Unit!25958 () Unit!25956)

(assert (=> b!753152 (= e!420078 Unit!25958)))

(declare-fun b!753153 () Bool)

(declare-fun res!508724 () Bool)

(assert (=> b!753153 (=> (not res!508724) (not e!420082))))

(assert (=> b!753153 (= res!508724 (validKeyInArray!0 (select (arr!20044 a!3186) j!159)))))

(declare-fun b!753154 () Bool)

(declare-fun e!420087 () Bool)

(declare-fun lt!335072 () SeekEntryResult!7644)

(declare-fun lt!335079 () SeekEntryResult!7644)

(assert (=> b!753154 (= e!420087 (= lt!335072 lt!335079))))

(declare-fun b!753155 () Bool)

(declare-fun e!420089 () Bool)

(declare-fun e!420084 () Bool)

(assert (=> b!753155 (= e!420089 e!420084)))

(declare-fun res!508730 () Bool)

(assert (=> b!753155 (=> res!508730 e!420084)))

(declare-fun lt!335076 () (_ BitVec 64))

(declare-fun lt!335078 () (_ BitVec 64))

(assert (=> b!753155 (= res!508730 (= lt!335076 lt!335078))))

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!753155 (= lt!335076 (select (store (arr!20044 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!753156 () Bool)

(declare-fun e!420080 () Bool)

(declare-fun e!420088 () Bool)

(assert (=> b!753156 (= e!420080 (not e!420088))))

(declare-fun res!508734 () Bool)

(assert (=> b!753156 (=> res!508734 e!420088)))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun lt!335070 () SeekEntryResult!7644)

(get-info :version)

(assert (=> b!753156 (= res!508734 (or (not ((_ is Intermediate!7644) lt!335070)) (bvslt x!1131 (x!63858 lt!335070)) (not (= x!1131 (x!63858 lt!335070))) (not (= index!1321 (index!32946 lt!335070)))))))

(assert (=> b!753156 e!420079))

(declare-fun res!508741 () Bool)

(assert (=> b!753156 (=> (not res!508741) (not e!420079))))

(assert (=> b!753156 (= res!508741 (= lt!335072 lt!335074))))

(assert (=> b!753156 (= lt!335074 (Found!7644 j!159))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41861 (_ BitVec 32)) SeekEntryResult!7644)

(assert (=> b!753156 (= lt!335072 (seekEntryOrOpen!0 (select (arr!20044 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41861 (_ BitVec 32)) Bool)

(assert (=> b!753156 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!335073 () Unit!25956)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41861 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25956)

(assert (=> b!753156 (= lt!335073 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!753157 () Bool)

(declare-fun res!508728 () Bool)

(assert (=> b!753157 (=> (not res!508728) (not e!420087))))

(declare-fun lt!335081 () array!41861)

(assert (=> b!753157 (= res!508728 (= (seekEntryOrOpen!0 lt!335078 lt!335081 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!335078 lt!335081 mask!3328)))))

(declare-fun b!753158 () Bool)

(assert (=> b!753158 (= e!420088 e!420089)))

(declare-fun res!508727 () Bool)

(assert (=> b!753158 (=> res!508727 e!420089)))

(assert (=> b!753158 (= res!508727 (not (= lt!335079 lt!335074)))))

(assert (=> b!753158 (= lt!335079 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20044 a!3186) j!159) a!3186 mask!3328))))

(declare-fun e!420086 () Bool)

(declare-fun b!753159 () Bool)

(assert (=> b!753159 (= e!420086 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20044 a!3186) j!159) a!3186 mask!3328) (Found!7644 j!159)))))

(declare-fun b!753160 () Bool)

(declare-fun res!508738 () Bool)

(assert (=> b!753160 (=> (not res!508738) (not e!420082))))

(declare-fun arrayContainsKey!0 (array!41861 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!753160 (= res!508738 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!753161 () Bool)

(declare-fun res!508737 () Bool)

(declare-fun e!420085 () Bool)

(assert (=> b!753161 (=> (not res!508737) (not e!420085))))

(assert (=> b!753161 (= res!508737 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!753162 () Bool)

(declare-fun res!508725 () Bool)

(assert (=> b!753162 (=> (not res!508725) (not e!420085))))

(assert (=> b!753162 (= res!508725 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20465 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20465 a!3186))))))

(declare-fun b!753163 () Bool)

(assert (=> b!753163 (= e!420084 true)))

(assert (=> b!753163 e!420087))

(declare-fun res!508742 () Bool)

(assert (=> b!753163 (=> (not res!508742) (not e!420087))))

(assert (=> b!753163 (= res!508742 (= lt!335076 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!335077 () Unit!25956)

(assert (=> b!753163 (= lt!335077 e!420078)))

(declare-fun c!82594 () Bool)

(assert (=> b!753163 (= c!82594 (= lt!335076 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!753164 () Bool)

(declare-fun Unit!25959 () Unit!25956)

(assert (=> b!753164 (= e!420078 Unit!25959)))

(assert (=> b!753164 false))

(declare-fun lt!335071 () SeekEntryResult!7644)

(declare-fun b!753165 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41861 (_ BitVec 32)) SeekEntryResult!7644)

(assert (=> b!753165 (= e!420086 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20044 a!3186) j!159) a!3186 mask!3328) lt!335071))))

(declare-fun b!753166 () Bool)

(declare-fun res!508729 () Bool)

(assert (=> b!753166 (=> (not res!508729) (not e!420082))))

(assert (=> b!753166 (= res!508729 (and (= (size!20465 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20465 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20465 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!753167 () Bool)

(declare-fun res!508731 () Bool)

(assert (=> b!753167 (=> (not res!508731) (not e!420085))))

(declare-datatypes ((List!14046 0))(
  ( (Nil!14043) (Cons!14042 (h!15114 (_ BitVec 64)) (t!20361 List!14046)) )
))
(declare-fun arrayNoDuplicates!0 (array!41861 (_ BitVec 32) List!14046) Bool)

(assert (=> b!753167 (= res!508731 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14043))))

(declare-fun b!753168 () Bool)

(assert (=> b!753168 (= e!420082 e!420085)))

(declare-fun res!508726 () Bool)

(assert (=> b!753168 (=> (not res!508726) (not e!420085))))

(declare-fun lt!335080 () SeekEntryResult!7644)

(assert (=> b!753168 (= res!508726 (or (= lt!335080 (MissingZero!7644 i!1173)) (= lt!335080 (MissingVacant!7644 i!1173))))))

(assert (=> b!753168 (= lt!335080 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!753169 () Bool)

(assert (=> b!753169 (= e!420081 e!420080)))

(declare-fun res!508735 () Bool)

(assert (=> b!753169 (=> (not res!508735) (not e!420080))))

(declare-fun lt!335075 () SeekEntryResult!7644)

(assert (=> b!753169 (= res!508735 (= lt!335075 lt!335070))))

(assert (=> b!753169 (= lt!335070 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!335078 lt!335081 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!753169 (= lt!335075 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!335078 mask!3328) lt!335078 lt!335081 mask!3328))))

(assert (=> b!753169 (= lt!335078 (select (store (arr!20044 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!753169 (= lt!335081 (array!41862 (store (arr!20044 a!3186) i!1173 k0!2102) (size!20465 a!3186)))))

(declare-fun b!753170 () Bool)

(declare-fun res!508732 () Bool)

(assert (=> b!753170 (=> (not res!508732) (not e!420081))))

(assert (=> b!753170 (= res!508732 e!420086)))

(declare-fun c!82593 () Bool)

(assert (=> b!753170 (= c!82593 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!753171 () Bool)

(assert (=> b!753171 (= e!420085 e!420081)))

(declare-fun res!508733 () Bool)

(assert (=> b!753171 (=> (not res!508733) (not e!420081))))

(assert (=> b!753171 (= res!508733 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20044 a!3186) j!159) mask!3328) (select (arr!20044 a!3186) j!159) a!3186 mask!3328) lt!335071))))

(assert (=> b!753171 (= lt!335071 (Intermediate!7644 false resIntermediateIndex!5 resIntermediateX!5))))

(assert (= (and start!65688 res!508740) b!753166))

(assert (= (and b!753166 res!508729) b!753153))

(assert (= (and b!753153 res!508724) b!753149))

(assert (= (and b!753149 res!508736) b!753160))

(assert (= (and b!753160 res!508738) b!753168))

(assert (= (and b!753168 res!508726) b!753161))

(assert (= (and b!753161 res!508737) b!753167))

(assert (= (and b!753167 res!508731) b!753162))

(assert (= (and b!753162 res!508725) b!753171))

(assert (= (and b!753171 res!508733) b!753150))

(assert (= (and b!753150 res!508739) b!753170))

(assert (= (and b!753170 c!82593) b!753165))

(assert (= (and b!753170 (not c!82593)) b!753159))

(assert (= (and b!753170 res!508732) b!753169))

(assert (= (and b!753169 res!508735) b!753156))

(assert (= (and b!753156 res!508741) b!753151))

(assert (= (and b!753156 (not res!508734)) b!753158))

(assert (= (and b!753158 (not res!508727)) b!753155))

(assert (= (and b!753155 (not res!508730)) b!753163))

(assert (= (and b!753163 c!82594) b!753164))

(assert (= (and b!753163 (not c!82594)) b!753152))

(assert (= (and b!753163 res!508742) b!753157))

(assert (= (and b!753157 res!508728) b!753154))

(declare-fun m!701915 () Bool)

(assert (=> b!753158 m!701915))

(assert (=> b!753158 m!701915))

(declare-fun m!701917 () Bool)

(assert (=> b!753158 m!701917))

(assert (=> b!753159 m!701915))

(assert (=> b!753159 m!701915))

(assert (=> b!753159 m!701917))

(declare-fun m!701919 () Bool)

(assert (=> b!753161 m!701919))

(assert (=> b!753151 m!701915))

(assert (=> b!753151 m!701915))

(declare-fun m!701921 () Bool)

(assert (=> b!753151 m!701921))

(assert (=> b!753165 m!701915))

(assert (=> b!753165 m!701915))

(declare-fun m!701923 () Bool)

(assert (=> b!753165 m!701923))

(declare-fun m!701925 () Bool)

(assert (=> b!753157 m!701925))

(declare-fun m!701927 () Bool)

(assert (=> b!753157 m!701927))

(declare-fun m!701929 () Bool)

(assert (=> b!753167 m!701929))

(declare-fun m!701931 () Bool)

(assert (=> b!753150 m!701931))

(declare-fun m!701933 () Bool)

(assert (=> b!753168 m!701933))

(declare-fun m!701935 () Bool)

(assert (=> b!753149 m!701935))

(declare-fun m!701937 () Bool)

(assert (=> start!65688 m!701937))

(declare-fun m!701939 () Bool)

(assert (=> start!65688 m!701939))

(assert (=> b!753171 m!701915))

(assert (=> b!753171 m!701915))

(declare-fun m!701941 () Bool)

(assert (=> b!753171 m!701941))

(assert (=> b!753171 m!701941))

(assert (=> b!753171 m!701915))

(declare-fun m!701943 () Bool)

(assert (=> b!753171 m!701943))

(declare-fun m!701945 () Bool)

(assert (=> b!753155 m!701945))

(declare-fun m!701947 () Bool)

(assert (=> b!753155 m!701947))

(assert (=> b!753153 m!701915))

(assert (=> b!753153 m!701915))

(declare-fun m!701949 () Bool)

(assert (=> b!753153 m!701949))

(declare-fun m!701951 () Bool)

(assert (=> b!753160 m!701951))

(assert (=> b!753156 m!701915))

(assert (=> b!753156 m!701915))

(declare-fun m!701953 () Bool)

(assert (=> b!753156 m!701953))

(declare-fun m!701955 () Bool)

(assert (=> b!753156 m!701955))

(declare-fun m!701957 () Bool)

(assert (=> b!753156 m!701957))

(declare-fun m!701959 () Bool)

(assert (=> b!753169 m!701959))

(declare-fun m!701961 () Bool)

(assert (=> b!753169 m!701961))

(declare-fun m!701963 () Bool)

(assert (=> b!753169 m!701963))

(assert (=> b!753169 m!701945))

(declare-fun m!701965 () Bool)

(assert (=> b!753169 m!701965))

(assert (=> b!753169 m!701959))

(check-sat (not b!753156) (not b!753160) (not b!753171) (not b!753161) (not b!753153) (not b!753159) (not b!753165) (not b!753169) (not b!753157) (not start!65688) (not b!753167) (not b!753168) (not b!753151) (not b!753149) (not b!753158))
(check-sat)
