; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65676 () Bool)

(assert start!65676)

(declare-fun b!749231 () Bool)

(declare-fun res!505219 () Bool)

(declare-fun e!418244 () Bool)

(assert (=> b!749231 (=> (not res!505219) (not e!418244))))

(declare-fun e!418240 () Bool)

(assert (=> b!749231 (= res!505219 e!418240)))

(declare-fun c!82397 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!749231 (= c!82397 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!749232 () Bool)

(declare-fun res!505209 () Bool)

(declare-fun e!418238 () Bool)

(assert (=> b!749232 (=> (not res!505209) (not e!418238))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!41719 0))(
  ( (array!41720 (arr!19969 (Array (_ BitVec 32) (_ BitVec 64))) (size!20389 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41719)

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!749232 (= res!505209 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20389 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20389 a!3186))))))

(declare-fun b!749233 () Bool)

(declare-fun res!505218 () Bool)

(declare-fun e!418242 () Bool)

(assert (=> b!749233 (=> res!505218 e!418242)))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun lt!333048 () (_ BitVec 64))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!749233 (= res!505218 (= (select (store (arr!19969 a!3186) i!1173 k0!2102) index!1321) lt!333048))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun b!749234 () Bool)

(declare-datatypes ((SeekEntryResult!7525 0))(
  ( (MissingZero!7525 (index!32468 (_ BitVec 32))) (Found!7525 (index!32469 (_ BitVec 32))) (Intermediate!7525 (undefined!8337 Bool) (index!32470 (_ BitVec 32)) (x!63567 (_ BitVec 32))) (Undefined!7525) (MissingVacant!7525 (index!32471 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41719 (_ BitVec 32)) SeekEntryResult!7525)

(assert (=> b!749234 (= e!418240 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19969 a!3186) j!159) a!3186 mask!3328) (Found!7525 j!159)))))

(declare-fun b!749235 () Bool)

(declare-fun res!505216 () Bool)

(assert (=> b!749235 (=> (not res!505216) (not e!418244))))

(assert (=> b!749235 (= res!505216 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19969 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!749236 () Bool)

(declare-fun res!505210 () Bool)

(declare-fun e!418241 () Bool)

(assert (=> b!749236 (=> (not res!505210) (not e!418241))))

(assert (=> b!749236 (= res!505210 (and (= (size!20389 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20389 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20389 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!749237 () Bool)

(declare-fun res!505217 () Bool)

(assert (=> b!749237 (=> (not res!505217) (not e!418241))))

(declare-fun arrayContainsKey!0 (array!41719 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!749237 (= res!505217 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!749238 () Bool)

(declare-fun res!505212 () Bool)

(assert (=> b!749238 (=> (not res!505212) (not e!418241))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!749238 (= res!505212 (validKeyInArray!0 (select (arr!19969 a!3186) j!159)))))

(declare-fun b!749239 () Bool)

(assert (=> b!749239 (= e!418242 true)))

(assert (=> b!749239 (= (select (store (arr!19969 a!3186) i!1173 k0!2102) index!1321) #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-datatypes ((Unit!25657 0))(
  ( (Unit!25658) )
))
(declare-fun lt!333047 () Unit!25657)

(declare-fun e!418237 () Unit!25657)

(assert (=> b!749239 (= lt!333047 e!418237)))

(declare-fun c!82396 () Bool)

(assert (=> b!749239 (= c!82396 (= (select (store (arr!19969 a!3186) i!1173 k0!2102) index!1321) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!749240 () Bool)

(assert (=> b!749240 (= e!418238 e!418244)))

(declare-fun res!505220 () Bool)

(assert (=> b!749240 (=> (not res!505220) (not e!418244))))

(declare-fun lt!333045 () SeekEntryResult!7525)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41719 (_ BitVec 32)) SeekEntryResult!7525)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!749240 (= res!505220 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19969 a!3186) j!159) mask!3328) (select (arr!19969 a!3186) j!159) a!3186 mask!3328) lt!333045))))

(assert (=> b!749240 (= lt!333045 (Intermediate!7525 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!749241 () Bool)

(assert (=> b!749241 (= e!418241 e!418238)))

(declare-fun res!505214 () Bool)

(assert (=> b!749241 (=> (not res!505214) (not e!418238))))

(declare-fun lt!333042 () SeekEntryResult!7525)

(assert (=> b!749241 (= res!505214 (or (= lt!333042 (MissingZero!7525 i!1173)) (= lt!333042 (MissingVacant!7525 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41719 (_ BitVec 32)) SeekEntryResult!7525)

(assert (=> b!749241 (= lt!333042 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun res!505208 () Bool)

(assert (=> start!65676 (=> (not res!505208) (not e!418241))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65676 (= res!505208 (validMask!0 mask!3328))))

(assert (=> start!65676 e!418241))

(assert (=> start!65676 true))

(declare-fun array_inv!15828 (array!41719) Bool)

(assert (=> start!65676 (array_inv!15828 a!3186)))

(declare-fun b!749242 () Bool)

(declare-fun res!505213 () Bool)

(assert (=> b!749242 (=> res!505213 e!418242)))

(declare-fun lt!333040 () SeekEntryResult!7525)

(assert (=> b!749242 (= res!505213 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19969 a!3186) j!159) a!3186 mask!3328) lt!333040)))))

(declare-fun e!418243 () Bool)

(declare-fun b!749243 () Bool)

(assert (=> b!749243 (= e!418243 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19969 a!3186) j!159) a!3186 mask!3328) lt!333040))))

(declare-fun b!749244 () Bool)

(assert (=> b!749244 (= e!418240 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19969 a!3186) j!159) a!3186 mask!3328) lt!333045))))

(declare-fun b!749245 () Bool)

(declare-fun res!505215 () Bool)

(assert (=> b!749245 (=> (not res!505215) (not e!418238))))

(declare-datatypes ((List!13878 0))(
  ( (Nil!13875) (Cons!13874 (h!14952 (_ BitVec 64)) (t!20185 List!13878)) )
))
(declare-fun arrayNoDuplicates!0 (array!41719 (_ BitVec 32) List!13878) Bool)

(assert (=> b!749245 (= res!505215 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13875))))

(declare-fun b!749246 () Bool)

(declare-fun e!418245 () Bool)

(assert (=> b!749246 (= e!418244 e!418245)))

(declare-fun res!505206 () Bool)

(assert (=> b!749246 (=> (not res!505206) (not e!418245))))

(declare-fun lt!333039 () SeekEntryResult!7525)

(declare-fun lt!333044 () SeekEntryResult!7525)

(assert (=> b!749246 (= res!505206 (= lt!333039 lt!333044))))

(declare-fun lt!333046 () array!41719)

(assert (=> b!749246 (= lt!333044 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!333048 lt!333046 mask!3328))))

(assert (=> b!749246 (= lt!333039 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!333048 mask!3328) lt!333048 lt!333046 mask!3328))))

(assert (=> b!749246 (= lt!333048 (select (store (arr!19969 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!749246 (= lt!333046 (array!41720 (store (arr!19969 a!3186) i!1173 k0!2102) (size!20389 a!3186)))))

(declare-fun b!749247 () Bool)

(declare-fun res!505221 () Bool)

(assert (=> b!749247 (=> (not res!505221) (not e!418241))))

(assert (=> b!749247 (= res!505221 (validKeyInArray!0 k0!2102))))

(declare-fun b!749248 () Bool)

(declare-fun Unit!25659 () Unit!25657)

(assert (=> b!749248 (= e!418237 Unit!25659)))

(assert (=> b!749248 false))

(declare-fun b!749249 () Bool)

(declare-fun Unit!25660 () Unit!25657)

(assert (=> b!749249 (= e!418237 Unit!25660)))

(declare-fun b!749250 () Bool)

(declare-fun res!505222 () Bool)

(assert (=> b!749250 (=> (not res!505222) (not e!418238))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41719 (_ BitVec 32)) Bool)

(assert (=> b!749250 (= res!505222 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!749251 () Bool)

(assert (=> b!749251 (= e!418245 (not e!418242))))

(declare-fun res!505207 () Bool)

(assert (=> b!749251 (=> res!505207 e!418242)))

(get-info :version)

(assert (=> b!749251 (= res!505207 (or (not ((_ is Intermediate!7525) lt!333044)) (bvslt x!1131 (x!63567 lt!333044)) (not (= x!1131 (x!63567 lt!333044))) (not (= index!1321 (index!32470 lt!333044)))))))

(assert (=> b!749251 e!418243))

(declare-fun res!505211 () Bool)

(assert (=> b!749251 (=> (not res!505211) (not e!418243))))

(declare-fun lt!333041 () SeekEntryResult!7525)

(assert (=> b!749251 (= res!505211 (= lt!333041 lt!333040))))

(assert (=> b!749251 (= lt!333040 (Found!7525 j!159))))

(assert (=> b!749251 (= lt!333041 (seekEntryOrOpen!0 (select (arr!19969 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!749251 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!333043 () Unit!25657)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41719 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25657)

(assert (=> b!749251 (= lt!333043 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(assert (= (and start!65676 res!505208) b!749236))

(assert (= (and b!749236 res!505210) b!749238))

(assert (= (and b!749238 res!505212) b!749247))

(assert (= (and b!749247 res!505221) b!749237))

(assert (= (and b!749237 res!505217) b!749241))

(assert (= (and b!749241 res!505214) b!749250))

(assert (= (and b!749250 res!505222) b!749245))

(assert (= (and b!749245 res!505215) b!749232))

(assert (= (and b!749232 res!505209) b!749240))

(assert (= (and b!749240 res!505220) b!749235))

(assert (= (and b!749235 res!505216) b!749231))

(assert (= (and b!749231 c!82397) b!749244))

(assert (= (and b!749231 (not c!82397)) b!749234))

(assert (= (and b!749231 res!505219) b!749246))

(assert (= (and b!749246 res!505206) b!749251))

(assert (= (and b!749251 res!505211) b!749243))

(assert (= (and b!749251 (not res!505207)) b!749242))

(assert (= (and b!749242 (not res!505213)) b!749233))

(assert (= (and b!749233 (not res!505218)) b!749239))

(assert (= (and b!749239 c!82396) b!749248))

(assert (= (and b!749239 (not c!82396)) b!749249))

(declare-fun m!699477 () Bool)

(assert (=> b!749238 m!699477))

(assert (=> b!749238 m!699477))

(declare-fun m!699479 () Bool)

(assert (=> b!749238 m!699479))

(assert (=> b!749243 m!699477))

(assert (=> b!749243 m!699477))

(declare-fun m!699481 () Bool)

(assert (=> b!749243 m!699481))

(declare-fun m!699483 () Bool)

(assert (=> b!749237 m!699483))

(declare-fun m!699485 () Bool)

(assert (=> b!749233 m!699485))

(declare-fun m!699487 () Bool)

(assert (=> b!749233 m!699487))

(declare-fun m!699489 () Bool)

(assert (=> b!749250 m!699489))

(assert (=> b!749251 m!699477))

(assert (=> b!749251 m!699477))

(declare-fun m!699491 () Bool)

(assert (=> b!749251 m!699491))

(declare-fun m!699493 () Bool)

(assert (=> b!749251 m!699493))

(declare-fun m!699495 () Bool)

(assert (=> b!749251 m!699495))

(declare-fun m!699497 () Bool)

(assert (=> b!749235 m!699497))

(assert (=> b!749239 m!699485))

(assert (=> b!749239 m!699487))

(declare-fun m!699499 () Bool)

(assert (=> b!749245 m!699499))

(assert (=> b!749234 m!699477))

(assert (=> b!749234 m!699477))

(declare-fun m!699501 () Bool)

(assert (=> b!749234 m!699501))

(declare-fun m!699503 () Bool)

(assert (=> b!749247 m!699503))

(declare-fun m!699505 () Bool)

(assert (=> b!749246 m!699505))

(assert (=> b!749246 m!699485))

(declare-fun m!699507 () Bool)

(assert (=> b!749246 m!699507))

(declare-fun m!699509 () Bool)

(assert (=> b!749246 m!699509))

(assert (=> b!749246 m!699507))

(declare-fun m!699511 () Bool)

(assert (=> b!749246 m!699511))

(assert (=> b!749240 m!699477))

(assert (=> b!749240 m!699477))

(declare-fun m!699513 () Bool)

(assert (=> b!749240 m!699513))

(assert (=> b!749240 m!699513))

(assert (=> b!749240 m!699477))

(declare-fun m!699515 () Bool)

(assert (=> b!749240 m!699515))

(declare-fun m!699517 () Bool)

(assert (=> b!749241 m!699517))

(declare-fun m!699519 () Bool)

(assert (=> start!65676 m!699519))

(declare-fun m!699521 () Bool)

(assert (=> start!65676 m!699521))

(assert (=> b!749244 m!699477))

(assert (=> b!749244 m!699477))

(declare-fun m!699523 () Bool)

(assert (=> b!749244 m!699523))

(assert (=> b!749242 m!699477))

(assert (=> b!749242 m!699477))

(assert (=> b!749242 m!699501))

(check-sat (not b!749242) (not b!749241) (not b!749237) (not b!749246) (not b!749247) (not b!749251) (not b!749240) (not b!749245) (not b!749238) (not b!749244) (not b!749234) (not b!749243) (not start!65676) (not b!749250))
(check-sat)
