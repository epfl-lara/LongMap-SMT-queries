; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65348 () Bool)

(assert start!65348)

(declare-fun res!500317 () Bool)

(declare-fun e!415169 () Bool)

(assert (=> start!65348 (=> (not res!500317) (not e!415169))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65348 (= res!500317 (validMask!0 mask!3328))))

(assert (=> start!65348 e!415169))

(assert (=> start!65348 true))

(declare-datatypes ((array!41538 0))(
  ( (array!41539 (arr!19883 (Array (_ BitVec 32) (_ BitVec 64))) (size!20304 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41538)

(declare-fun array_inv!15766 (array!41538) Bool)

(assert (=> start!65348 (array_inv!15766 a!3186)))

(declare-fun b!743059 () Bool)

(declare-fun e!415171 () Bool)

(assert (=> b!743059 (= e!415169 e!415171)))

(declare-fun res!500319 () Bool)

(assert (=> b!743059 (=> (not res!500319) (not e!415171))))

(declare-datatypes ((SeekEntryResult!7480 0))(
  ( (MissingZero!7480 (index!32288 (_ BitVec 32))) (Found!7480 (index!32289 (_ BitVec 32))) (Intermediate!7480 (undefined!8292 Bool) (index!32290 (_ BitVec 32)) (x!63265 (_ BitVec 32))) (Undefined!7480) (MissingVacant!7480 (index!32291 (_ BitVec 32))) )
))
(declare-fun lt!329961 () SeekEntryResult!7480)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!743059 (= res!500319 (or (= lt!329961 (MissingZero!7480 i!1173)) (= lt!329961 (MissingVacant!7480 i!1173))))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41538 (_ BitVec 32)) SeekEntryResult!7480)

(assert (=> b!743059 (= lt!329961 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!743060 () Bool)

(declare-fun res!500315 () Bool)

(declare-fun e!415166 () Bool)

(assert (=> b!743060 (=> (not res!500315) (not e!415166))))

(declare-fun e!415174 () Bool)

(assert (=> b!743060 (= res!500315 e!415174)))

(declare-fun c!81759 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!743060 (= c!81759 (bvsle x!1131 resIntermediateX!5))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun b!743061 () Bool)

(declare-fun lt!329958 () SeekEntryResult!7480)

(declare-fun e!415167 () Bool)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41538 (_ BitVec 32)) SeekEntryResult!7480)

(assert (=> b!743061 (= e!415167 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19883 a!3186) j!159) a!3186 mask!3328) lt!329958))))

(declare-fun b!743062 () Bool)

(declare-fun e!415168 () Bool)

(declare-fun e!415172 () Bool)

(assert (=> b!743062 (= e!415168 (not e!415172))))

(declare-fun res!500304 () Bool)

(assert (=> b!743062 (=> res!500304 e!415172)))

(declare-fun lt!329956 () SeekEntryResult!7480)

(declare-fun index!1321 () (_ BitVec 32))

(get-info :version)

(assert (=> b!743062 (= res!500304 (or (not ((_ is Intermediate!7480) lt!329956)) (bvslt x!1131 (x!63265 lt!329956)) (not (= x!1131 (x!63265 lt!329956))) (not (= index!1321 (index!32290 lt!329956)))))))

(declare-fun e!415173 () Bool)

(assert (=> b!743062 e!415173))

(declare-fun res!500308 () Bool)

(assert (=> b!743062 (=> (not res!500308) (not e!415173))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41538 (_ BitVec 32)) Bool)

(assert (=> b!743062 (= res!500308 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25412 0))(
  ( (Unit!25413) )
))
(declare-fun lt!329962 () Unit!25412)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41538 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25412)

(assert (=> b!743062 (= lt!329962 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!743063 () Bool)

(assert (=> b!743063 (= e!415166 e!415168)))

(declare-fun res!500311 () Bool)

(assert (=> b!743063 (=> (not res!500311) (not e!415168))))

(declare-fun lt!329963 () SeekEntryResult!7480)

(assert (=> b!743063 (= res!500311 (= lt!329963 lt!329956))))

(declare-fun lt!329960 () array!41538)

(declare-fun lt!329957 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41538 (_ BitVec 32)) SeekEntryResult!7480)

(assert (=> b!743063 (= lt!329956 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!329957 lt!329960 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!743063 (= lt!329963 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!329957 mask!3328) lt!329957 lt!329960 mask!3328))))

(assert (=> b!743063 (= lt!329957 (select (store (arr!19883 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!743063 (= lt!329960 (array!41539 (store (arr!19883 a!3186) i!1173 k0!2102) (size!20304 a!3186)))))

(declare-fun b!743064 () Bool)

(declare-fun res!500307 () Bool)

(assert (=> b!743064 (=> (not res!500307) (not e!415169))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!743064 (= res!500307 (validKeyInArray!0 (select (arr!19883 a!3186) j!159)))))

(declare-fun b!743065 () Bool)

(declare-fun res!500303 () Bool)

(assert (=> b!743065 (=> (not res!500303) (not e!415169))))

(assert (=> b!743065 (= res!500303 (validKeyInArray!0 k0!2102))))

(declare-fun b!743066 () Bool)

(declare-fun lt!329959 () SeekEntryResult!7480)

(assert (=> b!743066 (= e!415174 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19883 a!3186) j!159) a!3186 mask!3328) lt!329959))))

(declare-fun b!743067 () Bool)

(declare-fun res!500302 () Bool)

(assert (=> b!743067 (=> (not res!500302) (not e!415171))))

(declare-datatypes ((List!13924 0))(
  ( (Nil!13921) (Cons!13920 (h!14992 (_ BitVec 64)) (t!20230 List!13924)) )
))
(declare-fun arrayNoDuplicates!0 (array!41538 (_ BitVec 32) List!13924) Bool)

(assert (=> b!743067 (= res!500302 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13921))))

(declare-fun b!743068 () Bool)

(declare-fun res!500312 () Bool)

(assert (=> b!743068 (=> (not res!500312) (not e!415171))))

(assert (=> b!743068 (= res!500312 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20304 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20304 a!3186))))))

(declare-fun b!743069 () Bool)

(declare-fun res!500310 () Bool)

(assert (=> b!743069 (=> (not res!500310) (not e!415166))))

(assert (=> b!743069 (= res!500310 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19883 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!743070 () Bool)

(declare-fun res!500314 () Bool)

(assert (=> b!743070 (=> (not res!500314) (not e!415171))))

(assert (=> b!743070 (= res!500314 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!743071 () Bool)

(assert (=> b!743071 (= e!415173 e!415167)))

(declare-fun res!500318 () Bool)

(assert (=> b!743071 (=> (not res!500318) (not e!415167))))

(assert (=> b!743071 (= res!500318 (= (seekEntryOrOpen!0 (select (arr!19883 a!3186) j!159) a!3186 mask!3328) lt!329958))))

(assert (=> b!743071 (= lt!329958 (Found!7480 j!159))))

(declare-fun b!743072 () Bool)

(declare-fun res!500309 () Bool)

(assert (=> b!743072 (=> res!500309 e!415172)))

(assert (=> b!743072 (= res!500309 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19883 a!3186) j!159) a!3186 mask!3328) (Found!7480 j!159))))))

(declare-fun b!743073 () Bool)

(assert (=> b!743073 (= e!415171 e!415166)))

(declare-fun res!500306 () Bool)

(assert (=> b!743073 (=> (not res!500306) (not e!415166))))

(assert (=> b!743073 (= res!500306 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19883 a!3186) j!159) mask!3328) (select (arr!19883 a!3186) j!159) a!3186 mask!3328) lt!329959))))

(assert (=> b!743073 (= lt!329959 (Intermediate!7480 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!743074 () Bool)

(declare-fun res!500316 () Bool)

(assert (=> b!743074 (=> (not res!500316) (not e!415169))))

(declare-fun arrayContainsKey!0 (array!41538 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!743074 (= res!500316 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!743075 () Bool)

(assert (=> b!743075 (= e!415172 true)))

(declare-fun lt!329955 () SeekEntryResult!7480)

(assert (=> b!743075 (= lt!329955 (seekEntryOrOpen!0 lt!329957 lt!329960 mask!3328))))

(declare-fun b!743076 () Bool)

(declare-fun res!500313 () Bool)

(assert (=> b!743076 (=> (not res!500313) (not e!415169))))

(assert (=> b!743076 (= res!500313 (and (= (size!20304 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20304 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20304 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!743077 () Bool)

(declare-fun res!500305 () Bool)

(assert (=> b!743077 (=> res!500305 e!415172)))

(assert (=> b!743077 (= res!500305 (or (not (= (select (store (arr!19883 a!3186) i!1173 k0!2102) index!1321) lt!329957)) (undefined!8292 lt!329956)))))

(declare-fun b!743078 () Bool)

(assert (=> b!743078 (= e!415174 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19883 a!3186) j!159) a!3186 mask!3328) (Found!7480 j!159)))))

(assert (= (and start!65348 res!500317) b!743076))

(assert (= (and b!743076 res!500313) b!743064))

(assert (= (and b!743064 res!500307) b!743065))

(assert (= (and b!743065 res!500303) b!743074))

(assert (= (and b!743074 res!500316) b!743059))

(assert (= (and b!743059 res!500319) b!743070))

(assert (= (and b!743070 res!500314) b!743067))

(assert (= (and b!743067 res!500302) b!743068))

(assert (= (and b!743068 res!500312) b!743073))

(assert (= (and b!743073 res!500306) b!743069))

(assert (= (and b!743069 res!500310) b!743060))

(assert (= (and b!743060 c!81759) b!743066))

(assert (= (and b!743060 (not c!81759)) b!743078))

(assert (= (and b!743060 res!500315) b!743063))

(assert (= (and b!743063 res!500311) b!743062))

(assert (= (and b!743062 res!500308) b!743071))

(assert (= (and b!743071 res!500318) b!743061))

(assert (= (and b!743062 (not res!500304)) b!743072))

(assert (= (and b!743072 (not res!500309)) b!743077))

(assert (= (and b!743077 (not res!500305)) b!743075))

(declare-fun m!693263 () Bool)

(assert (=> b!743066 m!693263))

(assert (=> b!743066 m!693263))

(declare-fun m!693265 () Bool)

(assert (=> b!743066 m!693265))

(declare-fun m!693267 () Bool)

(assert (=> b!743063 m!693267))

(declare-fun m!693269 () Bool)

(assert (=> b!743063 m!693269))

(declare-fun m!693271 () Bool)

(assert (=> b!743063 m!693271))

(declare-fun m!693273 () Bool)

(assert (=> b!743063 m!693273))

(declare-fun m!693275 () Bool)

(assert (=> b!743063 m!693275))

(assert (=> b!743063 m!693267))

(assert (=> b!743061 m!693263))

(assert (=> b!743061 m!693263))

(declare-fun m!693277 () Bool)

(assert (=> b!743061 m!693277))

(declare-fun m!693279 () Bool)

(assert (=> b!743059 m!693279))

(declare-fun m!693281 () Bool)

(assert (=> b!743065 m!693281))

(declare-fun m!693283 () Bool)

(assert (=> b!743074 m!693283))

(declare-fun m!693285 () Bool)

(assert (=> b!743070 m!693285))

(declare-fun m!693287 () Bool)

(assert (=> b!743069 m!693287))

(declare-fun m!693289 () Bool)

(assert (=> start!65348 m!693289))

(declare-fun m!693291 () Bool)

(assert (=> start!65348 m!693291))

(assert (=> b!743077 m!693271))

(declare-fun m!693293 () Bool)

(assert (=> b!743077 m!693293))

(declare-fun m!693295 () Bool)

(assert (=> b!743062 m!693295))

(declare-fun m!693297 () Bool)

(assert (=> b!743062 m!693297))

(assert (=> b!743072 m!693263))

(assert (=> b!743072 m!693263))

(declare-fun m!693299 () Bool)

(assert (=> b!743072 m!693299))

(assert (=> b!743073 m!693263))

(assert (=> b!743073 m!693263))

(declare-fun m!693301 () Bool)

(assert (=> b!743073 m!693301))

(assert (=> b!743073 m!693301))

(assert (=> b!743073 m!693263))

(declare-fun m!693303 () Bool)

(assert (=> b!743073 m!693303))

(assert (=> b!743064 m!693263))

(assert (=> b!743064 m!693263))

(declare-fun m!693305 () Bool)

(assert (=> b!743064 m!693305))

(declare-fun m!693307 () Bool)

(assert (=> b!743067 m!693307))

(assert (=> b!743078 m!693263))

(assert (=> b!743078 m!693263))

(assert (=> b!743078 m!693299))

(declare-fun m!693309 () Bool)

(assert (=> b!743075 m!693309))

(assert (=> b!743071 m!693263))

(assert (=> b!743071 m!693263))

(declare-fun m!693311 () Bool)

(assert (=> b!743071 m!693311))

(check-sat (not b!743072) (not b!743067) (not b!743075) (not b!743064) (not b!743073) (not b!743065) (not start!65348) (not b!743063) (not b!743061) (not b!743070) (not b!743074) (not b!743071) (not b!743062) (not b!743059) (not b!743078) (not b!743066))
(check-sat)
