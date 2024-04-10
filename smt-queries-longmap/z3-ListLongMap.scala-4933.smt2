; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67910 () Bool)

(assert start!67910)

(declare-fun b!790251 () Bool)

(declare-fun res!535389 () Bool)

(declare-fun e!439220 () Bool)

(assert (=> b!790251 (=> (not res!535389) (not e!439220))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!42887 0))(
  ( (array!42888 (arr!20530 (Array (_ BitVec 32) (_ BitVec 64))) (size!20951 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42887)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!790251 (= res!535389 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20951 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20951 a!3186))))))

(declare-datatypes ((SeekEntryResult!8130 0))(
  ( (MissingZero!8130 (index!34888 (_ BitVec 32))) (Found!8130 (index!34889 (_ BitVec 32))) (Intermediate!8130 (undefined!8942 Bool) (index!34890 (_ BitVec 32)) (x!65823 (_ BitVec 32))) (Undefined!8130) (MissingVacant!8130 (index!34891 (_ BitVec 32))) )
))
(declare-fun lt!352783 () SeekEntryResult!8130)

(declare-fun b!790252 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun e!439219 () Bool)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42887 (_ BitVec 32)) SeekEntryResult!8130)

(assert (=> b!790252 (= e!439219 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20530 a!3186) j!159) a!3186 mask!3328) lt!352783))))

(declare-fun b!790253 () Bool)

(declare-fun res!535398 () Bool)

(declare-fun e!439218 () Bool)

(assert (=> b!790253 (=> (not res!535398) (not e!439218))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!790253 (= res!535398 (and (= (size!20951 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20951 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20951 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!790254 () Bool)

(declare-fun e!439217 () Bool)

(declare-fun e!439222 () Bool)

(assert (=> b!790254 (= e!439217 e!439222)))

(declare-fun res!535399 () Bool)

(assert (=> b!790254 (=> res!535399 e!439222)))

(assert (=> b!790254 (= res!535399 (or (not (= (select (arr!20530 a!3186) index!1321) #b1000000000000000000000000000000000000000000000000000000000000000)) (= index!1321 resIntermediateIndex!5)))))

(declare-fun lt!352780 () SeekEntryResult!8130)

(declare-fun lt!352777 () SeekEntryResult!8130)

(declare-fun lt!352773 () SeekEntryResult!8130)

(declare-fun lt!352774 () SeekEntryResult!8130)

(assert (=> b!790254 (and (= lt!352774 lt!352780) (= lt!352773 lt!352777))))

(declare-fun lt!352782 () array!42887)

(declare-fun lt!352786 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42887 (_ BitVec 32)) SeekEntryResult!8130)

(assert (=> b!790254 (= lt!352780 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!352786 lt!352782 mask!3328))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42887 (_ BitVec 32)) SeekEntryResult!8130)

(assert (=> b!790254 (= lt!352774 (seekEntryOrOpen!0 lt!352786 lt!352782 mask!3328))))

(declare-fun lt!352785 () (_ BitVec 64))

(assert (=> b!790254 (= lt!352785 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-datatypes ((Unit!27408 0))(
  ( (Unit!27409) )
))
(declare-fun lt!352778 () Unit!27408)

(declare-fun e!439226 () Unit!27408)

(assert (=> b!790254 (= lt!352778 e!439226)))

(declare-fun c!87844 () Bool)

(assert (=> b!790254 (= c!87844 (= lt!352785 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!790255 () Bool)

(assert (=> b!790255 (= e!439219 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20530 a!3186) j!159) a!3186 mask!3328) (Found!8130 j!159)))))

(declare-fun b!790256 () Bool)

(declare-fun res!535391 () Bool)

(assert (=> b!790256 (=> (not res!535391) (not e!439220))))

(declare-datatypes ((List!14532 0))(
  ( (Nil!14529) (Cons!14528 (h!15654 (_ BitVec 64)) (t!20847 List!14532)) )
))
(declare-fun arrayNoDuplicates!0 (array!42887 (_ BitVec 32) List!14532) Bool)

(assert (=> b!790256 (= res!535391 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14529))))

(declare-fun b!790257 () Bool)

(declare-fun res!535392 () Bool)

(assert (=> b!790257 (=> (not res!535392) (not e!439218))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!790257 (= res!535392 (validKeyInArray!0 k0!2102))))

(declare-fun b!790258 () Bool)

(declare-fun e!439224 () Bool)

(declare-fun e!439215 () Bool)

(assert (=> b!790258 (= e!439224 (not e!439215))))

(declare-fun res!535396 () Bool)

(assert (=> b!790258 (=> res!535396 e!439215)))

(declare-fun lt!352781 () SeekEntryResult!8130)

(get-info :version)

(assert (=> b!790258 (= res!535396 (or (not ((_ is Intermediate!8130) lt!352781)) (bvslt x!1131 (x!65823 lt!352781)) (not (= x!1131 (x!65823 lt!352781))) (not (= index!1321 (index!34890 lt!352781)))))))

(declare-fun e!439216 () Bool)

(assert (=> b!790258 e!439216))

(declare-fun res!535393 () Bool)

(assert (=> b!790258 (=> (not res!535393) (not e!439216))))

(declare-fun lt!352787 () SeekEntryResult!8130)

(assert (=> b!790258 (= res!535393 (= lt!352773 lt!352787))))

(assert (=> b!790258 (= lt!352787 (Found!8130 j!159))))

(assert (=> b!790258 (= lt!352773 (seekEntryOrOpen!0 (select (arr!20530 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42887 (_ BitVec 32)) Bool)

(assert (=> b!790258 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!352784 () Unit!27408)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42887 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27408)

(assert (=> b!790258 (= lt!352784 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!790259 () Bool)

(declare-fun res!535397 () Bool)

(assert (=> b!790259 (=> (not res!535397) (not e!439220))))

(assert (=> b!790259 (= res!535397 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!790260 () Bool)

(declare-fun res!535395 () Bool)

(declare-fun e!439221 () Bool)

(assert (=> b!790260 (=> (not res!535395) (not e!439221))))

(assert (=> b!790260 (= res!535395 e!439219)))

(declare-fun c!87843 () Bool)

(assert (=> b!790260 (= c!87843 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!790261 () Bool)

(assert (=> b!790261 (= e!439216 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20530 a!3186) j!159) a!3186 mask!3328) lt!352787))))

(declare-fun b!790262 () Bool)

(declare-fun e!439225 () Bool)

(assert (=> b!790262 (= e!439225 e!439217)))

(declare-fun res!535385 () Bool)

(assert (=> b!790262 (=> res!535385 e!439217)))

(assert (=> b!790262 (= res!535385 (= lt!352785 lt!352786))))

(assert (=> b!790262 (= lt!352785 (select (store (arr!20530 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!790263 () Bool)

(declare-fun res!535387 () Bool)

(assert (=> b!790263 (=> (not res!535387) (not e!439218))))

(declare-fun arrayContainsKey!0 (array!42887 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!790263 (= res!535387 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!790264 () Bool)

(assert (=> b!790264 (= e!439220 e!439221)))

(declare-fun res!535383 () Bool)

(assert (=> b!790264 (=> (not res!535383) (not e!439221))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!790264 (= res!535383 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20530 a!3186) j!159) mask!3328) (select (arr!20530 a!3186) j!159) a!3186 mask!3328) lt!352783))))

(assert (=> b!790264 (= lt!352783 (Intermediate!8130 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!790265 () Bool)

(assert (=> b!790265 (= e!439222 (= lt!352774 lt!352787))))

(assert (=> b!790265 (= lt!352780 lt!352777)))

(declare-fun lt!352775 () Unit!27408)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!42887 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27408)

(assert (=> b!790265 (= lt!352775 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3186 i!1173 k0!2102 j!159 index!1321 x!1131 resIntermediateIndex!5 index!1321 mask!3328))))

(declare-fun b!790266 () Bool)

(declare-fun res!535386 () Bool)

(assert (=> b!790266 (=> (not res!535386) (not e!439221))))

(assert (=> b!790266 (= res!535386 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20530 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!790267 () Bool)

(declare-fun Unit!27410 () Unit!27408)

(assert (=> b!790267 (= e!439226 Unit!27410)))

(assert (=> b!790267 false))

(declare-fun b!790268 () Bool)

(declare-fun Unit!27411 () Unit!27408)

(assert (=> b!790268 (= e!439226 Unit!27411)))

(declare-fun b!790269 () Bool)

(declare-fun res!535390 () Bool)

(assert (=> b!790269 (=> (not res!535390) (not e!439218))))

(assert (=> b!790269 (= res!535390 (validKeyInArray!0 (select (arr!20530 a!3186) j!159)))))

(declare-fun b!790270 () Bool)

(assert (=> b!790270 (= e!439221 e!439224)))

(declare-fun res!535384 () Bool)

(assert (=> b!790270 (=> (not res!535384) (not e!439224))))

(declare-fun lt!352776 () SeekEntryResult!8130)

(assert (=> b!790270 (= res!535384 (= lt!352776 lt!352781))))

(assert (=> b!790270 (= lt!352781 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!352786 lt!352782 mask!3328))))

(assert (=> b!790270 (= lt!352776 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!352786 mask!3328) lt!352786 lt!352782 mask!3328))))

(assert (=> b!790270 (= lt!352786 (select (store (arr!20530 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!790270 (= lt!352782 (array!42888 (store (arr!20530 a!3186) i!1173 k0!2102) (size!20951 a!3186)))))

(declare-fun res!535394 () Bool)

(assert (=> start!67910 (=> (not res!535394) (not e!439218))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67910 (= res!535394 (validMask!0 mask!3328))))

(assert (=> start!67910 e!439218))

(assert (=> start!67910 true))

(declare-fun array_inv!16326 (array!42887) Bool)

(assert (=> start!67910 (array_inv!16326 a!3186)))

(declare-fun b!790271 () Bool)

(assert (=> b!790271 (= e!439215 e!439225)))

(declare-fun res!535388 () Bool)

(assert (=> b!790271 (=> res!535388 e!439225)))

(assert (=> b!790271 (= res!535388 (not (= lt!352777 lt!352787)))))

(assert (=> b!790271 (= lt!352777 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20530 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!790272 () Bool)

(assert (=> b!790272 (= e!439218 e!439220)))

(declare-fun res!535400 () Bool)

(assert (=> b!790272 (=> (not res!535400) (not e!439220))))

(declare-fun lt!352779 () SeekEntryResult!8130)

(assert (=> b!790272 (= res!535400 (or (= lt!352779 (MissingZero!8130 i!1173)) (= lt!352779 (MissingVacant!8130 i!1173))))))

(assert (=> b!790272 (= lt!352779 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(assert (= (and start!67910 res!535394) b!790253))

(assert (= (and b!790253 res!535398) b!790269))

(assert (= (and b!790269 res!535390) b!790257))

(assert (= (and b!790257 res!535392) b!790263))

(assert (= (and b!790263 res!535387) b!790272))

(assert (= (and b!790272 res!535400) b!790259))

(assert (= (and b!790259 res!535397) b!790256))

(assert (= (and b!790256 res!535391) b!790251))

(assert (= (and b!790251 res!535389) b!790264))

(assert (= (and b!790264 res!535383) b!790266))

(assert (= (and b!790266 res!535386) b!790260))

(assert (= (and b!790260 c!87843) b!790252))

(assert (= (and b!790260 (not c!87843)) b!790255))

(assert (= (and b!790260 res!535395) b!790270))

(assert (= (and b!790270 res!535384) b!790258))

(assert (= (and b!790258 res!535393) b!790261))

(assert (= (and b!790258 (not res!535396)) b!790271))

(assert (= (and b!790271 (not res!535388)) b!790262))

(assert (= (and b!790262 (not res!535385)) b!790254))

(assert (= (and b!790254 c!87844) b!790267))

(assert (= (and b!790254 (not c!87844)) b!790268))

(assert (= (and b!790254 (not res!535399)) b!790265))

(declare-fun m!731197 () Bool)

(assert (=> b!790261 m!731197))

(assert (=> b!790261 m!731197))

(declare-fun m!731199 () Bool)

(assert (=> b!790261 m!731199))

(declare-fun m!731201 () Bool)

(assert (=> b!790270 m!731201))

(declare-fun m!731203 () Bool)

(assert (=> b!790270 m!731203))

(declare-fun m!731205 () Bool)

(assert (=> b!790270 m!731205))

(declare-fun m!731207 () Bool)

(assert (=> b!790270 m!731207))

(assert (=> b!790270 m!731203))

(declare-fun m!731209 () Bool)

(assert (=> b!790270 m!731209))

(assert (=> b!790258 m!731197))

(assert (=> b!790258 m!731197))

(declare-fun m!731211 () Bool)

(assert (=> b!790258 m!731211))

(declare-fun m!731213 () Bool)

(assert (=> b!790258 m!731213))

(declare-fun m!731215 () Bool)

(assert (=> b!790258 m!731215))

(assert (=> b!790271 m!731197))

(assert (=> b!790271 m!731197))

(declare-fun m!731217 () Bool)

(assert (=> b!790271 m!731217))

(declare-fun m!731219 () Bool)

(assert (=> b!790257 m!731219))

(declare-fun m!731221 () Bool)

(assert (=> start!67910 m!731221))

(declare-fun m!731223 () Bool)

(assert (=> start!67910 m!731223))

(declare-fun m!731225 () Bool)

(assert (=> b!790254 m!731225))

(declare-fun m!731227 () Bool)

(assert (=> b!790254 m!731227))

(declare-fun m!731229 () Bool)

(assert (=> b!790254 m!731229))

(assert (=> b!790269 m!731197))

(assert (=> b!790269 m!731197))

(declare-fun m!731231 () Bool)

(assert (=> b!790269 m!731231))

(declare-fun m!731233 () Bool)

(assert (=> b!790256 m!731233))

(assert (=> b!790252 m!731197))

(assert (=> b!790252 m!731197))

(declare-fun m!731235 () Bool)

(assert (=> b!790252 m!731235))

(assert (=> b!790255 m!731197))

(assert (=> b!790255 m!731197))

(assert (=> b!790255 m!731217))

(declare-fun m!731237 () Bool)

(assert (=> b!790259 m!731237))

(declare-fun m!731239 () Bool)

(assert (=> b!790272 m!731239))

(assert (=> b!790262 m!731205))

(declare-fun m!731241 () Bool)

(assert (=> b!790262 m!731241))

(declare-fun m!731243 () Bool)

(assert (=> b!790266 m!731243))

(assert (=> b!790264 m!731197))

(assert (=> b!790264 m!731197))

(declare-fun m!731245 () Bool)

(assert (=> b!790264 m!731245))

(assert (=> b!790264 m!731245))

(assert (=> b!790264 m!731197))

(declare-fun m!731247 () Bool)

(assert (=> b!790264 m!731247))

(declare-fun m!731249 () Bool)

(assert (=> b!790263 m!731249))

(declare-fun m!731251 () Bool)

(assert (=> b!790265 m!731251))

(check-sat (not b!790255) (not b!790258) (not b!790269) (not b!790256) (not start!67910) (not b!790252) (not b!790259) (not b!790254) (not b!790270) (not b!790272) (not b!790264) (not b!790263) (not b!790271) (not b!790257) (not b!790265) (not b!790261))
(check-sat)
