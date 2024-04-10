; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64476 () Bool)

(assert start!64476)

(declare-fun b!725213 () Bool)

(declare-fun res!486352 () Bool)

(declare-fun e!406145 () Bool)

(assert (=> b!725213 (=> (not res!486352) (not e!406145))))

(declare-datatypes ((array!40994 0))(
  ( (array!40995 (arr!19618 (Array (_ BitVec 32) (_ BitVec 64))) (size!20039 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40994)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!725213 (= res!486352 (validKeyInArray!0 (select (arr!19618 a!3186) j!159)))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun b!725214 () Bool)

(declare-fun e!406150 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7218 0))(
  ( (MissingZero!7218 (index!31240 (_ BitVec 32))) (Found!7218 (index!31241 (_ BitVec 32))) (Intermediate!7218 (undefined!8030 Bool) (index!31242 (_ BitVec 32)) (x!62236 (_ BitVec 32))) (Undefined!7218) (MissingVacant!7218 (index!31243 (_ BitVec 32))) )
))
(declare-fun lt!321269 () SeekEntryResult!7218)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40994 (_ BitVec 32)) SeekEntryResult!7218)

(assert (=> b!725214 (= e!406150 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19618 a!3186) j!159) a!3186 mask!3328) lt!321269))))

(declare-fun b!725215 () Bool)

(declare-fun e!406148 () Bool)

(declare-fun e!406144 () Bool)

(assert (=> b!725215 (= e!406148 e!406144)))

(declare-fun res!486341 () Bool)

(assert (=> b!725215 (=> (not res!486341) (not e!406144))))

(declare-fun lt!321266 () SeekEntryResult!7218)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40994 (_ BitVec 32)) SeekEntryResult!7218)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!725215 (= res!486341 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19618 a!3186) j!159) mask!3328) (select (arr!19618 a!3186) j!159) a!3186 mask!3328) lt!321266))))

(assert (=> b!725215 (= lt!321266 (Intermediate!7218 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!725217 () Bool)

(declare-fun res!486339 () Bool)

(assert (=> b!725217 (=> (not res!486339) (not e!406145))))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!725217 (= res!486339 (validKeyInArray!0 k0!2102))))

(declare-fun b!725218 () Bool)

(declare-fun res!486348 () Bool)

(assert (=> b!725218 (=> (not res!486348) (not e!406148))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!725218 (= res!486348 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20039 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20039 a!3186))))))

(declare-fun b!725219 () Bool)

(declare-fun e!406146 () Bool)

(assert (=> b!725219 (= e!406146 (not true))))

(declare-fun e!406151 () Bool)

(assert (=> b!725219 e!406151))

(declare-fun res!486340 () Bool)

(assert (=> b!725219 (=> (not res!486340) (not e!406151))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40994 (_ BitVec 32)) Bool)

(assert (=> b!725219 (= res!486340 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24754 0))(
  ( (Unit!24755) )
))
(declare-fun lt!321267 () Unit!24754)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!40994 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24754)

(assert (=> b!725219 (= lt!321267 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!725220 () Bool)

(declare-fun res!486349 () Bool)

(assert (=> b!725220 (=> (not res!486349) (not e!406145))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!725220 (= res!486349 (and (= (size!20039 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20039 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20039 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!725221 () Bool)

(assert (=> b!725221 (= e!406151 e!406150)))

(declare-fun res!486347 () Bool)

(assert (=> b!725221 (=> (not res!486347) (not e!406150))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40994 (_ BitVec 32)) SeekEntryResult!7218)

(assert (=> b!725221 (= res!486347 (= (seekEntryOrOpen!0 (select (arr!19618 a!3186) j!159) a!3186 mask!3328) lt!321269))))

(assert (=> b!725221 (= lt!321269 (Found!7218 j!159))))

(declare-fun b!725222 () Bool)

(assert (=> b!725222 (= e!406144 e!406146)))

(declare-fun res!486346 () Bool)

(assert (=> b!725222 (=> (not res!486346) (not e!406146))))

(declare-fun lt!321268 () (_ BitVec 64))

(declare-fun lt!321264 () array!40994)

(assert (=> b!725222 (= res!486346 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!321268 mask!3328) lt!321268 lt!321264 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!321268 lt!321264 mask!3328)))))

(assert (=> b!725222 (= lt!321268 (select (store (arr!19618 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!725222 (= lt!321264 (array!40995 (store (arr!19618 a!3186) i!1173 k0!2102) (size!20039 a!3186)))))

(declare-fun e!406149 () Bool)

(declare-fun b!725223 () Bool)

(assert (=> b!725223 (= e!406149 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19618 a!3186) j!159) a!3186 mask!3328) lt!321266))))

(declare-fun b!725224 () Bool)

(declare-fun res!486342 () Bool)

(assert (=> b!725224 (=> (not res!486342) (not e!406145))))

(declare-fun arrayContainsKey!0 (array!40994 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!725224 (= res!486342 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!725225 () Bool)

(declare-fun res!486353 () Bool)

(assert (=> b!725225 (=> (not res!486353) (not e!406148))))

(declare-datatypes ((List!13620 0))(
  ( (Nil!13617) (Cons!13616 (h!14673 (_ BitVec 64)) (t!19935 List!13620)) )
))
(declare-fun arrayNoDuplicates!0 (array!40994 (_ BitVec 32) List!13620) Bool)

(assert (=> b!725225 (= res!486353 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13617))))

(declare-fun b!725226 () Bool)

(assert (=> b!725226 (= e!406149 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19618 a!3186) j!159) a!3186 mask!3328) (Found!7218 j!159)))))

(declare-fun b!725227 () Bool)

(declare-fun res!486345 () Bool)

(assert (=> b!725227 (=> (not res!486345) (not e!406148))))

(assert (=> b!725227 (= res!486345 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!725216 () Bool)

(declare-fun res!486344 () Bool)

(assert (=> b!725216 (=> (not res!486344) (not e!406144))))

(assert (=> b!725216 (= res!486344 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19618 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!486351 () Bool)

(assert (=> start!64476 (=> (not res!486351) (not e!406145))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64476 (= res!486351 (validMask!0 mask!3328))))

(assert (=> start!64476 e!406145))

(assert (=> start!64476 true))

(declare-fun array_inv!15414 (array!40994) Bool)

(assert (=> start!64476 (array_inv!15414 a!3186)))

(declare-fun b!725228 () Bool)

(declare-fun res!486350 () Bool)

(assert (=> b!725228 (=> (not res!486350) (not e!406144))))

(assert (=> b!725228 (= res!486350 e!406149)))

(declare-fun c!79810 () Bool)

(assert (=> b!725228 (= c!79810 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!725229 () Bool)

(assert (=> b!725229 (= e!406145 e!406148)))

(declare-fun res!486343 () Bool)

(assert (=> b!725229 (=> (not res!486343) (not e!406148))))

(declare-fun lt!321265 () SeekEntryResult!7218)

(assert (=> b!725229 (= res!486343 (or (= lt!321265 (MissingZero!7218 i!1173)) (= lt!321265 (MissingVacant!7218 i!1173))))))

(assert (=> b!725229 (= lt!321265 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(assert (= (and start!64476 res!486351) b!725220))

(assert (= (and b!725220 res!486349) b!725213))

(assert (= (and b!725213 res!486352) b!725217))

(assert (= (and b!725217 res!486339) b!725224))

(assert (= (and b!725224 res!486342) b!725229))

(assert (= (and b!725229 res!486343) b!725227))

(assert (= (and b!725227 res!486345) b!725225))

(assert (= (and b!725225 res!486353) b!725218))

(assert (= (and b!725218 res!486348) b!725215))

(assert (= (and b!725215 res!486341) b!725216))

(assert (= (and b!725216 res!486344) b!725228))

(assert (= (and b!725228 c!79810) b!725223))

(assert (= (and b!725228 (not c!79810)) b!725226))

(assert (= (and b!725228 res!486350) b!725222))

(assert (= (and b!725222 res!486346) b!725219))

(assert (= (and b!725219 res!486340) b!725221))

(assert (= (and b!725221 res!486347) b!725214))

(declare-fun m!679397 () Bool)

(assert (=> b!725229 m!679397))

(declare-fun m!679399 () Bool)

(assert (=> b!725221 m!679399))

(assert (=> b!725221 m!679399))

(declare-fun m!679401 () Bool)

(assert (=> b!725221 m!679401))

(declare-fun m!679403 () Bool)

(assert (=> b!725216 m!679403))

(assert (=> b!725223 m!679399))

(assert (=> b!725223 m!679399))

(declare-fun m!679405 () Bool)

(assert (=> b!725223 m!679405))

(assert (=> b!725215 m!679399))

(assert (=> b!725215 m!679399))

(declare-fun m!679407 () Bool)

(assert (=> b!725215 m!679407))

(assert (=> b!725215 m!679407))

(assert (=> b!725215 m!679399))

(declare-fun m!679409 () Bool)

(assert (=> b!725215 m!679409))

(declare-fun m!679411 () Bool)

(assert (=> b!725217 m!679411))

(declare-fun m!679413 () Bool)

(assert (=> b!725227 m!679413))

(declare-fun m!679415 () Bool)

(assert (=> start!64476 m!679415))

(declare-fun m!679417 () Bool)

(assert (=> start!64476 m!679417))

(declare-fun m!679419 () Bool)

(assert (=> b!725219 m!679419))

(declare-fun m!679421 () Bool)

(assert (=> b!725219 m!679421))

(declare-fun m!679423 () Bool)

(assert (=> b!725225 m!679423))

(assert (=> b!725213 m!679399))

(assert (=> b!725213 m!679399))

(declare-fun m!679425 () Bool)

(assert (=> b!725213 m!679425))

(assert (=> b!725214 m!679399))

(assert (=> b!725214 m!679399))

(declare-fun m!679427 () Bool)

(assert (=> b!725214 m!679427))

(assert (=> b!725226 m!679399))

(assert (=> b!725226 m!679399))

(declare-fun m!679429 () Bool)

(assert (=> b!725226 m!679429))

(declare-fun m!679431 () Bool)

(assert (=> b!725224 m!679431))

(declare-fun m!679433 () Bool)

(assert (=> b!725222 m!679433))

(declare-fun m!679435 () Bool)

(assert (=> b!725222 m!679435))

(declare-fun m!679437 () Bool)

(assert (=> b!725222 m!679437))

(declare-fun m!679439 () Bool)

(assert (=> b!725222 m!679439))

(assert (=> b!725222 m!679435))

(declare-fun m!679441 () Bool)

(assert (=> b!725222 m!679441))

(check-sat (not b!725222) (not b!725215) (not b!725224) (not b!725226) (not b!725214) (not b!725213) (not b!725225) (not b!725217) (not b!725219) (not b!725221) (not b!725229) (not start!64476) (not b!725227) (not b!725223))
(check-sat)
