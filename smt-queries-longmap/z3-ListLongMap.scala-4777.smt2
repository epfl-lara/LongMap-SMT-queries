; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65850 () Bool)

(assert start!65850)

(declare-fun b!755067 () Bool)

(declare-fun res!510008 () Bool)

(declare-fun e!421168 () Bool)

(assert (=> b!755067 (=> (not res!510008) (not e!421168))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!41893 0))(
  ( (array!41894 (arr!20056 (Array (_ BitVec 32) (_ BitVec 64))) (size!20476 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41893)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!755067 (= res!510008 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20056 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!421175 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!755068 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7612 0))(
  ( (MissingZero!7612 (index!32816 (_ BitVec 32))) (Found!7612 (index!32817 (_ BitVec 32))) (Intermediate!7612 (undefined!8424 Bool) (index!32818 (_ BitVec 32)) (x!63886 (_ BitVec 32))) (Undefined!7612) (MissingVacant!7612 (index!32819 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41893 (_ BitVec 32)) SeekEntryResult!7612)

(assert (=> b!755068 (= e!421175 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20056 a!3186) j!159) a!3186 mask!3328) (Found!7612 j!159)))))

(declare-fun b!755069 () Bool)

(declare-fun e!421174 () Bool)

(declare-fun lt!336002 () SeekEntryResult!7612)

(declare-fun lt!336003 () SeekEntryResult!7612)

(assert (=> b!755069 (= e!421174 (= lt!336002 lt!336003))))

(declare-fun b!755070 () Bool)

(declare-fun res!510006 () Bool)

(declare-fun e!421176 () Bool)

(assert (=> b!755070 (=> (not res!510006) (not e!421176))))

(declare-datatypes ((List!13965 0))(
  ( (Nil!13962) (Cons!13961 (h!15039 (_ BitVec 64)) (t!20272 List!13965)) )
))
(declare-fun arrayNoDuplicates!0 (array!41893 (_ BitVec 32) List!13965) Bool)

(assert (=> b!755070 (= res!510006 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13962))))

(declare-fun b!755071 () Bool)

(assert (=> b!755071 (= e!421176 e!421168)))

(declare-fun res!510002 () Bool)

(assert (=> b!755071 (=> (not res!510002) (not e!421168))))

(declare-fun lt!335995 () SeekEntryResult!7612)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41893 (_ BitVec 32)) SeekEntryResult!7612)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!755071 (= res!510002 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20056 a!3186) j!159) mask!3328) (select (arr!20056 a!3186) j!159) a!3186 mask!3328) lt!335995))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!755071 (= lt!335995 (Intermediate!7612 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun e!421169 () Bool)

(declare-fun lt!336006 () SeekEntryResult!7612)

(declare-fun b!755072 () Bool)

(assert (=> b!755072 (= e!421169 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20056 a!3186) j!159) a!3186 mask!3328) lt!336006))))

(declare-fun b!755073 () Bool)

(declare-fun res!510003 () Bool)

(assert (=> b!755073 (=> (not res!510003) (not e!421176))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41893 (_ BitVec 32)) Bool)

(assert (=> b!755073 (= res!510003 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!755074 () Bool)

(declare-datatypes ((Unit!26005 0))(
  ( (Unit!26006) )
))
(declare-fun e!421170 () Unit!26005)

(declare-fun Unit!26007 () Unit!26005)

(assert (=> b!755074 (= e!421170 Unit!26007)))

(declare-fun b!755075 () Bool)

(declare-fun e!421177 () Bool)

(declare-fun e!421171 () Bool)

(assert (=> b!755075 (= e!421177 e!421171)))

(declare-fun res!510016 () Bool)

(assert (=> b!755075 (=> res!510016 e!421171)))

(declare-fun lt!335997 () (_ BitVec 64))

(declare-fun lt!335998 () (_ BitVec 64))

(assert (=> b!755075 (= res!510016 (= lt!335997 lt!335998))))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!755075 (= lt!335997 (select (store (arr!20056 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!755076 () Bool)

(assert (=> b!755076 (= e!421171 true)))

(assert (=> b!755076 e!421174))

(declare-fun res!510001 () Bool)

(assert (=> b!755076 (=> (not res!510001) (not e!421174))))

(assert (=> b!755076 (= res!510001 (= lt!335997 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!336001 () Unit!26005)

(assert (=> b!755076 (= lt!336001 e!421170)))

(declare-fun c!82919 () Bool)

(assert (=> b!755076 (= c!82919 (= lt!335997 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!755077 () Bool)

(assert (=> b!755077 (= e!421175 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20056 a!3186) j!159) a!3186 mask!3328) lt!335995))))

(declare-fun b!755078 () Bool)

(declare-fun res!510005 () Bool)

(assert (=> b!755078 (=> (not res!510005) (not e!421174))))

(declare-fun lt!336005 () array!41893)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41893 (_ BitVec 32)) SeekEntryResult!7612)

(assert (=> b!755078 (= res!510005 (= (seekEntryOrOpen!0 lt!335998 lt!336005 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!335998 lt!336005 mask!3328)))))

(declare-fun b!755079 () Bool)

(declare-fun e!421173 () Bool)

(assert (=> b!755079 (= e!421173 e!421176)))

(declare-fun res!510015 () Bool)

(assert (=> b!755079 (=> (not res!510015) (not e!421176))))

(declare-fun lt!335996 () SeekEntryResult!7612)

(assert (=> b!755079 (= res!510015 (or (= lt!335996 (MissingZero!7612 i!1173)) (= lt!335996 (MissingVacant!7612 i!1173))))))

(assert (=> b!755079 (= lt!335996 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!755080 () Bool)

(declare-fun e!421172 () Bool)

(declare-fun e!421178 () Bool)

(assert (=> b!755080 (= e!421172 (not e!421178))))

(declare-fun res!510011 () Bool)

(assert (=> b!755080 (=> res!510011 e!421178)))

(declare-fun lt!335999 () SeekEntryResult!7612)

(get-info :version)

(assert (=> b!755080 (= res!510011 (or (not ((_ is Intermediate!7612) lt!335999)) (bvslt x!1131 (x!63886 lt!335999)) (not (= x!1131 (x!63886 lt!335999))) (not (= index!1321 (index!32818 lt!335999)))))))

(assert (=> b!755080 e!421169))

(declare-fun res!510007 () Bool)

(assert (=> b!755080 (=> (not res!510007) (not e!421169))))

(assert (=> b!755080 (= res!510007 (= lt!336002 lt!336006))))

(assert (=> b!755080 (= lt!336006 (Found!7612 j!159))))

(assert (=> b!755080 (= lt!336002 (seekEntryOrOpen!0 (select (arr!20056 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!755080 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!336000 () Unit!26005)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41893 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26005)

(assert (=> b!755080 (= lt!336000 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!755081 () Bool)

(assert (=> b!755081 (= e!421178 e!421177)))

(declare-fun res!510013 () Bool)

(assert (=> b!755081 (=> res!510013 e!421177)))

(assert (=> b!755081 (= res!510013 (not (= lt!336003 lt!336006)))))

(assert (=> b!755081 (= lt!336003 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20056 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!755082 () Bool)

(declare-fun res!509998 () Bool)

(assert (=> b!755082 (=> (not res!509998) (not e!421173))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!755082 (= res!509998 (validKeyInArray!0 k0!2102))))

(declare-fun b!755083 () Bool)

(assert (=> b!755083 (= e!421168 e!421172)))

(declare-fun res!509999 () Bool)

(assert (=> b!755083 (=> (not res!509999) (not e!421172))))

(declare-fun lt!336004 () SeekEntryResult!7612)

(assert (=> b!755083 (= res!509999 (= lt!336004 lt!335999))))

(assert (=> b!755083 (= lt!335999 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!335998 lt!336005 mask!3328))))

(assert (=> b!755083 (= lt!336004 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!335998 mask!3328) lt!335998 lt!336005 mask!3328))))

(assert (=> b!755083 (= lt!335998 (select (store (arr!20056 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!755083 (= lt!336005 (array!41894 (store (arr!20056 a!3186) i!1173 k0!2102) (size!20476 a!3186)))))

(declare-fun b!755084 () Bool)

(declare-fun res!510000 () Bool)

(assert (=> b!755084 (=> (not res!510000) (not e!421173))))

(assert (=> b!755084 (= res!510000 (validKeyInArray!0 (select (arr!20056 a!3186) j!159)))))

(declare-fun b!755086 () Bool)

(declare-fun res!510009 () Bool)

(assert (=> b!755086 (=> (not res!510009) (not e!421173))))

(declare-fun arrayContainsKey!0 (array!41893 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!755086 (= res!510009 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!755087 () Bool)

(declare-fun Unit!26008 () Unit!26005)

(assert (=> b!755087 (= e!421170 Unit!26008)))

(assert (=> b!755087 false))

(declare-fun b!755085 () Bool)

(declare-fun res!510014 () Bool)

(assert (=> b!755085 (=> (not res!510014) (not e!421176))))

(assert (=> b!755085 (= res!510014 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20476 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20476 a!3186))))))

(declare-fun res!510004 () Bool)

(assert (=> start!65850 (=> (not res!510004) (not e!421173))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65850 (= res!510004 (validMask!0 mask!3328))))

(assert (=> start!65850 e!421173))

(assert (=> start!65850 true))

(declare-fun array_inv!15915 (array!41893) Bool)

(assert (=> start!65850 (array_inv!15915 a!3186)))

(declare-fun b!755088 () Bool)

(declare-fun res!510010 () Bool)

(assert (=> b!755088 (=> (not res!510010) (not e!421173))))

(assert (=> b!755088 (= res!510010 (and (= (size!20476 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20476 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20476 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!755089 () Bool)

(declare-fun res!510012 () Bool)

(assert (=> b!755089 (=> (not res!510012) (not e!421168))))

(assert (=> b!755089 (= res!510012 e!421175)))

(declare-fun c!82918 () Bool)

(assert (=> b!755089 (= c!82918 (bvsle x!1131 resIntermediateX!5))))

(assert (= (and start!65850 res!510004) b!755088))

(assert (= (and b!755088 res!510010) b!755084))

(assert (= (and b!755084 res!510000) b!755082))

(assert (= (and b!755082 res!509998) b!755086))

(assert (= (and b!755086 res!510009) b!755079))

(assert (= (and b!755079 res!510015) b!755073))

(assert (= (and b!755073 res!510003) b!755070))

(assert (= (and b!755070 res!510006) b!755085))

(assert (= (and b!755085 res!510014) b!755071))

(assert (= (and b!755071 res!510002) b!755067))

(assert (= (and b!755067 res!510008) b!755089))

(assert (= (and b!755089 c!82918) b!755077))

(assert (= (and b!755089 (not c!82918)) b!755068))

(assert (= (and b!755089 res!510012) b!755083))

(assert (= (and b!755083 res!509999) b!755080))

(assert (= (and b!755080 res!510007) b!755072))

(assert (= (and b!755080 (not res!510011)) b!755081))

(assert (= (and b!755081 (not res!510013)) b!755075))

(assert (= (and b!755075 (not res!510016)) b!755076))

(assert (= (and b!755076 c!82919) b!755087))

(assert (= (and b!755076 (not c!82919)) b!755074))

(assert (= (and b!755076 res!510001) b!755078))

(assert (= (and b!755078 res!510005) b!755069))

(declare-fun m!703959 () Bool)

(assert (=> b!755084 m!703959))

(assert (=> b!755084 m!703959))

(declare-fun m!703961 () Bool)

(assert (=> b!755084 m!703961))

(declare-fun m!703963 () Bool)

(assert (=> b!755073 m!703963))

(declare-fun m!703965 () Bool)

(assert (=> start!65850 m!703965))

(declare-fun m!703967 () Bool)

(assert (=> start!65850 m!703967))

(assert (=> b!755072 m!703959))

(assert (=> b!755072 m!703959))

(declare-fun m!703969 () Bool)

(assert (=> b!755072 m!703969))

(declare-fun m!703971 () Bool)

(assert (=> b!755078 m!703971))

(declare-fun m!703973 () Bool)

(assert (=> b!755078 m!703973))

(declare-fun m!703975 () Bool)

(assert (=> b!755067 m!703975))

(declare-fun m!703977 () Bool)

(assert (=> b!755083 m!703977))

(declare-fun m!703979 () Bool)

(assert (=> b!755083 m!703979))

(declare-fun m!703981 () Bool)

(assert (=> b!755083 m!703981))

(declare-fun m!703983 () Bool)

(assert (=> b!755083 m!703983))

(declare-fun m!703985 () Bool)

(assert (=> b!755083 m!703985))

(assert (=> b!755083 m!703981))

(assert (=> b!755080 m!703959))

(assert (=> b!755080 m!703959))

(declare-fun m!703987 () Bool)

(assert (=> b!755080 m!703987))

(declare-fun m!703989 () Bool)

(assert (=> b!755080 m!703989))

(declare-fun m!703991 () Bool)

(assert (=> b!755080 m!703991))

(declare-fun m!703993 () Bool)

(assert (=> b!755070 m!703993))

(assert (=> b!755081 m!703959))

(assert (=> b!755081 m!703959))

(declare-fun m!703995 () Bool)

(assert (=> b!755081 m!703995))

(assert (=> b!755077 m!703959))

(assert (=> b!755077 m!703959))

(declare-fun m!703997 () Bool)

(assert (=> b!755077 m!703997))

(assert (=> b!755068 m!703959))

(assert (=> b!755068 m!703959))

(assert (=> b!755068 m!703995))

(declare-fun m!703999 () Bool)

(assert (=> b!755082 m!703999))

(declare-fun m!704001 () Bool)

(assert (=> b!755079 m!704001))

(assert (=> b!755075 m!703979))

(declare-fun m!704003 () Bool)

(assert (=> b!755075 m!704003))

(assert (=> b!755071 m!703959))

(assert (=> b!755071 m!703959))

(declare-fun m!704005 () Bool)

(assert (=> b!755071 m!704005))

(assert (=> b!755071 m!704005))

(assert (=> b!755071 m!703959))

(declare-fun m!704007 () Bool)

(assert (=> b!755071 m!704007))

(declare-fun m!704009 () Bool)

(assert (=> b!755086 m!704009))

(check-sat (not b!755082) (not b!755068) (not b!755079) (not b!755070) (not b!755072) (not b!755080) (not b!755071) (not b!755083) (not b!755078) (not b!755084) (not start!65850) (not b!755073) (not b!755086) (not b!755081) (not b!755077))
(check-sat)
