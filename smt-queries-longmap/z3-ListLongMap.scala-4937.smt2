; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67976 () Bool)

(assert start!67976)

(declare-fun b!790999 () Bool)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!42909 0))(
  ( (array!42910 (arr!20540 (Array (_ BitVec 32) (_ BitVec 64))) (size!20961 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42909)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun e!439600 () Bool)

(declare-datatypes ((SeekEntryResult!8137 0))(
  ( (MissingZero!8137 (index!34916 (_ BitVec 32))) (Found!8137 (index!34917 (_ BitVec 32))) (Intermediate!8137 (undefined!8949 Bool) (index!34918 (_ BitVec 32)) (x!65866 (_ BitVec 32))) (Undefined!8137) (MissingVacant!8137 (index!34919 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42909 (_ BitVec 32)) SeekEntryResult!8137)

(assert (=> b!790999 (= e!439600 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20540 a!3186) j!159) a!3186 mask!3328) (Found!8137 j!159)))))

(declare-fun b!791000 () Bool)

(declare-fun res!535912 () Bool)

(declare-fun e!439597 () Bool)

(assert (=> b!791000 (=> (not res!535912) (not e!439597))))

(declare-datatypes ((List!14581 0))(
  ( (Nil!14578) (Cons!14577 (h!15706 (_ BitVec 64)) (t!20887 List!14581)) )
))
(declare-fun arrayNoDuplicates!0 (array!42909 (_ BitVec 32) List!14581) Bool)

(assert (=> b!791000 (= res!535912 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14578))))

(declare-fun b!791001 () Bool)

(declare-fun res!535919 () Bool)

(declare-fun e!439599 () Bool)

(assert (=> b!791001 (=> (not res!535919) (not e!439599))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!42909 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!791001 (= res!535919 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun e!439594 () Bool)

(declare-fun lt!352952 () SeekEntryResult!8137)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun b!791002 () Bool)

(assert (=> b!791002 (= e!439594 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20540 a!3186) j!159) a!3186 mask!3328) lt!352952))))

(declare-fun b!791003 () Bool)

(declare-fun res!535917 () Bool)

(assert (=> b!791003 (=> (not res!535917) (not e!439597))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42909 (_ BitVec 32)) Bool)

(assert (=> b!791003 (= res!535917 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!791004 () Bool)

(declare-fun res!535910 () Bool)

(assert (=> b!791004 (=> (not res!535910) (not e!439597))))

(assert (=> b!791004 (= res!535910 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20961 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20961 a!3186))))))

(declare-fun b!791005 () Bool)

(declare-fun res!535908 () Bool)

(assert (=> b!791005 (=> (not res!535908) (not e!439599))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!791005 (= res!535908 (validKeyInArray!0 (select (arr!20540 a!3186) j!159)))))

(declare-fun b!791006 () Bool)

(declare-fun e!439596 () Bool)

(assert (=> b!791006 (= e!439596 (not true))))

(declare-fun e!439595 () Bool)

(assert (=> b!791006 e!439595))

(declare-fun res!535911 () Bool)

(assert (=> b!791006 (=> (not res!535911) (not e!439595))))

(assert (=> b!791006 (= res!535911 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!27398 0))(
  ( (Unit!27399) )
))
(declare-fun lt!352953 () Unit!27398)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42909 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27398)

(assert (=> b!791006 (= lt!352953 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!791007 () Bool)

(declare-fun res!535915 () Bool)

(assert (=> b!791007 (=> (not res!535915) (not e!439599))))

(assert (=> b!791007 (= res!535915 (validKeyInArray!0 k0!2102))))

(declare-fun b!791009 () Bool)

(declare-fun res!535909 () Bool)

(declare-fun e!439593 () Bool)

(assert (=> b!791009 (=> (not res!535909) (not e!439593))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!791009 (= res!535909 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20540 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!791010 () Bool)

(declare-fun lt!352955 () SeekEntryResult!8137)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42909 (_ BitVec 32)) SeekEntryResult!8137)

(assert (=> b!791010 (= e!439600 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20540 a!3186) j!159) a!3186 mask!3328) lt!352955))))

(declare-fun b!791011 () Bool)

(declare-fun res!535918 () Bool)

(assert (=> b!791011 (=> (not res!535918) (not e!439599))))

(assert (=> b!791011 (= res!535918 (and (= (size!20961 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20961 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20961 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!791012 () Bool)

(assert (=> b!791012 (= e!439599 e!439597)))

(declare-fun res!535914 () Bool)

(assert (=> b!791012 (=> (not res!535914) (not e!439597))))

(declare-fun lt!352954 () SeekEntryResult!8137)

(assert (=> b!791012 (= res!535914 (or (= lt!352954 (MissingZero!8137 i!1173)) (= lt!352954 (MissingVacant!8137 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42909 (_ BitVec 32)) SeekEntryResult!8137)

(assert (=> b!791012 (= lt!352954 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!791013 () Bool)

(declare-fun res!535907 () Bool)

(assert (=> b!791013 (=> (not res!535907) (not e!439593))))

(assert (=> b!791013 (= res!535907 e!439600)))

(declare-fun c!87957 () Bool)

(assert (=> b!791013 (= c!87957 (bvsle x!1131 resIntermediateX!5))))

(declare-fun res!535913 () Bool)

(assert (=> start!67976 (=> (not res!535913) (not e!439599))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67976 (= res!535913 (validMask!0 mask!3328))))

(assert (=> start!67976 e!439599))

(assert (=> start!67976 true))

(declare-fun array_inv!16423 (array!42909) Bool)

(assert (=> start!67976 (array_inv!16423 a!3186)))

(declare-fun b!791008 () Bool)

(assert (=> b!791008 (= e!439593 e!439596)))

(declare-fun res!535920 () Bool)

(assert (=> b!791008 (=> (not res!535920) (not e!439596))))

(declare-fun lt!352950 () array!42909)

(declare-fun lt!352951 () (_ BitVec 64))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!791008 (= res!535920 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!352951 mask!3328) lt!352951 lt!352950 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!352951 lt!352950 mask!3328)))))

(assert (=> b!791008 (= lt!352951 (select (store (arr!20540 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!791008 (= lt!352950 (array!42910 (store (arr!20540 a!3186) i!1173 k0!2102) (size!20961 a!3186)))))

(declare-fun b!791014 () Bool)

(assert (=> b!791014 (= e!439597 e!439593)))

(declare-fun res!535906 () Bool)

(assert (=> b!791014 (=> (not res!535906) (not e!439593))))

(assert (=> b!791014 (= res!535906 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20540 a!3186) j!159) mask!3328) (select (arr!20540 a!3186) j!159) a!3186 mask!3328) lt!352955))))

(assert (=> b!791014 (= lt!352955 (Intermediate!8137 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!791015 () Bool)

(assert (=> b!791015 (= e!439595 e!439594)))

(declare-fun res!535916 () Bool)

(assert (=> b!791015 (=> (not res!535916) (not e!439594))))

(assert (=> b!791015 (= res!535916 (= (seekEntryOrOpen!0 (select (arr!20540 a!3186) j!159) a!3186 mask!3328) lt!352952))))

(assert (=> b!791015 (= lt!352952 (Found!8137 j!159))))

(assert (= (and start!67976 res!535913) b!791011))

(assert (= (and b!791011 res!535918) b!791005))

(assert (= (and b!791005 res!535908) b!791007))

(assert (= (and b!791007 res!535915) b!791001))

(assert (= (and b!791001 res!535919) b!791012))

(assert (= (and b!791012 res!535914) b!791003))

(assert (= (and b!791003 res!535917) b!791000))

(assert (= (and b!791000 res!535912) b!791004))

(assert (= (and b!791004 res!535910) b!791014))

(assert (= (and b!791014 res!535906) b!791009))

(assert (= (and b!791009 res!535909) b!791013))

(assert (= (and b!791013 c!87957) b!791010))

(assert (= (and b!791013 (not c!87957)) b!790999))

(assert (= (and b!791013 res!535907) b!791008))

(assert (= (and b!791008 res!535920) b!791006))

(assert (= (and b!791006 res!535911) b!791015))

(assert (= (and b!791015 res!535916) b!791002))

(declare-fun m!731247 () Bool)

(assert (=> b!791006 m!731247))

(declare-fun m!731249 () Bool)

(assert (=> b!791006 m!731249))

(declare-fun m!731251 () Bool)

(assert (=> b!791002 m!731251))

(assert (=> b!791002 m!731251))

(declare-fun m!731253 () Bool)

(assert (=> b!791002 m!731253))

(assert (=> b!791010 m!731251))

(assert (=> b!791010 m!731251))

(declare-fun m!731255 () Bool)

(assert (=> b!791010 m!731255))

(declare-fun m!731257 () Bool)

(assert (=> b!791008 m!731257))

(declare-fun m!731259 () Bool)

(assert (=> b!791008 m!731259))

(declare-fun m!731261 () Bool)

(assert (=> b!791008 m!731261))

(assert (=> b!791008 m!731259))

(declare-fun m!731263 () Bool)

(assert (=> b!791008 m!731263))

(declare-fun m!731265 () Bool)

(assert (=> b!791008 m!731265))

(declare-fun m!731267 () Bool)

(assert (=> b!791000 m!731267))

(assert (=> b!790999 m!731251))

(assert (=> b!790999 m!731251))

(declare-fun m!731269 () Bool)

(assert (=> b!790999 m!731269))

(declare-fun m!731271 () Bool)

(assert (=> b!791001 m!731271))

(declare-fun m!731273 () Bool)

(assert (=> b!791003 m!731273))

(assert (=> b!791014 m!731251))

(assert (=> b!791014 m!731251))

(declare-fun m!731275 () Bool)

(assert (=> b!791014 m!731275))

(assert (=> b!791014 m!731275))

(assert (=> b!791014 m!731251))

(declare-fun m!731277 () Bool)

(assert (=> b!791014 m!731277))

(declare-fun m!731279 () Bool)

(assert (=> b!791009 m!731279))

(assert (=> b!791015 m!731251))

(assert (=> b!791015 m!731251))

(declare-fun m!731281 () Bool)

(assert (=> b!791015 m!731281))

(declare-fun m!731283 () Bool)

(assert (=> b!791007 m!731283))

(assert (=> b!791005 m!731251))

(assert (=> b!791005 m!731251))

(declare-fun m!731285 () Bool)

(assert (=> b!791005 m!731285))

(declare-fun m!731287 () Bool)

(assert (=> start!67976 m!731287))

(declare-fun m!731289 () Bool)

(assert (=> start!67976 m!731289))

(declare-fun m!731291 () Bool)

(assert (=> b!791012 m!731291))

(check-sat (not b!791014) (not b!791010) (not b!791002) (not start!67976) (not b!790999) (not b!791015) (not b!791008) (not b!791006) (not b!791001) (not b!791003) (not b!791005) (not b!791000) (not b!791012) (not b!791007))
(check-sat)
