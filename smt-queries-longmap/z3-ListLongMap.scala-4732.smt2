; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65432 () Bool)

(assert start!65432)

(declare-fun b!745413 () Bool)

(declare-fun e!416308 () Bool)

(declare-fun e!416305 () Bool)

(assert (=> b!745413 (= e!416308 e!416305)))

(declare-fun res!502409 () Bool)

(assert (=> b!745413 (=> (not res!502409) (not e!416305))))

(declare-datatypes ((array!41622 0))(
  ( (array!41623 (arr!19925 (Array (_ BitVec 32) (_ BitVec 64))) (size!20346 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41622)

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7522 0))(
  ( (MissingZero!7522 (index!32456 (_ BitVec 32))) (Found!7522 (index!32457 (_ BitVec 32))) (Intermediate!7522 (undefined!8334 Bool) (index!32458 (_ BitVec 32)) (x!63419 (_ BitVec 32))) (Undefined!7522) (MissingVacant!7522 (index!32459 (_ BitVec 32))) )
))
(declare-fun lt!331048 () SeekEntryResult!7522)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41622 (_ BitVec 32)) SeekEntryResult!7522)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!745413 (= res!502409 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19925 a!3186) j!159) mask!3328) (select (arr!19925 a!3186) j!159) a!3186 mask!3328) lt!331048))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!745413 (= lt!331048 (Intermediate!7522 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!745414 () Bool)

(declare-fun res!502410 () Bool)

(declare-fun e!416307 () Bool)

(assert (=> b!745414 (=> (not res!502410) (not e!416307))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!41622 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!745414 (= res!502410 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!745415 () Bool)

(declare-fun res!502417 () Bool)

(assert (=> b!745415 (=> (not res!502417) (not e!416305))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!745415 (= res!502417 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19925 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!745416 () Bool)

(declare-fun res!502408 () Bool)

(assert (=> b!745416 (=> (not res!502408) (not e!416308))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!745416 (= res!502408 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20346 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20346 a!3186))))))

(declare-fun e!416301 () Bool)

(declare-fun b!745418 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41622 (_ BitVec 32)) SeekEntryResult!7522)

(assert (=> b!745418 (= e!416301 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19925 a!3186) j!159) a!3186 mask!3328) (Found!7522 j!159)))))

(declare-fun b!745419 () Bool)

(declare-fun res!502412 () Bool)

(assert (=> b!745419 (=> (not res!502412) (not e!416308))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41622 (_ BitVec 32)) Bool)

(assert (=> b!745419 (= res!502412 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!745420 () Bool)

(declare-fun res!502406 () Bool)

(assert (=> b!745420 (=> (not res!502406) (not e!416308))))

(declare-datatypes ((List!13966 0))(
  ( (Nil!13963) (Cons!13962 (h!15034 (_ BitVec 64)) (t!20272 List!13966)) )
))
(declare-fun arrayNoDuplicates!0 (array!41622 (_ BitVec 32) List!13966) Bool)

(assert (=> b!745420 (= res!502406 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13963))))

(declare-fun b!745421 () Bool)

(declare-fun res!502404 () Bool)

(assert (=> b!745421 (=> (not res!502404) (not e!416307))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!745421 (= res!502404 (validKeyInArray!0 (select (arr!19925 a!3186) j!159)))))

(declare-fun b!745422 () Bool)

(assert (=> b!745422 (= e!416301 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19925 a!3186) j!159) a!3186 mask!3328) lt!331048))))

(declare-fun b!745423 () Bool)

(declare-fun e!416303 () Bool)

(assert (=> b!745423 (= e!416305 e!416303)))

(declare-fun res!502416 () Bool)

(assert (=> b!745423 (=> (not res!502416) (not e!416303))))

(declare-fun lt!331049 () SeekEntryResult!7522)

(declare-fun lt!331052 () SeekEntryResult!7522)

(assert (=> b!745423 (= res!502416 (= lt!331049 lt!331052))))

(declare-fun lt!331054 () array!41622)

(declare-fun lt!331051 () (_ BitVec 64))

(assert (=> b!745423 (= lt!331052 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!331051 lt!331054 mask!3328))))

(assert (=> b!745423 (= lt!331049 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!331051 mask!3328) lt!331051 lt!331054 mask!3328))))

(assert (=> b!745423 (= lt!331051 (select (store (arr!19925 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!745423 (= lt!331054 (array!41623 (store (arr!19925 a!3186) i!1173 k0!2102) (size!20346 a!3186)))))

(declare-fun b!745424 () Bool)

(declare-fun res!502413 () Bool)

(assert (=> b!745424 (=> (not res!502413) (not e!416307))))

(assert (=> b!745424 (= res!502413 (and (= (size!20346 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20346 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20346 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!745425 () Bool)

(assert (=> b!745425 (= e!416307 e!416308)))

(declare-fun res!502411 () Bool)

(assert (=> b!745425 (=> (not res!502411) (not e!416308))))

(declare-fun lt!331055 () SeekEntryResult!7522)

(assert (=> b!745425 (= res!502411 (or (= lt!331055 (MissingZero!7522 i!1173)) (= lt!331055 (MissingVacant!7522 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41622 (_ BitVec 32)) SeekEntryResult!7522)

(assert (=> b!745425 (= lt!331055 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun lt!331046 () SeekEntryResult!7522)

(declare-fun b!745417 () Bool)

(declare-fun e!416300 () Bool)

(assert (=> b!745417 (= e!416300 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19925 a!3186) j!159) a!3186 mask!3328) lt!331046))))

(declare-fun res!502418 () Bool)

(assert (=> start!65432 (=> (not res!502418) (not e!416307))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65432 (= res!502418 (validMask!0 mask!3328))))

(assert (=> start!65432 e!416307))

(assert (=> start!65432 true))

(declare-fun array_inv!15808 (array!41622) Bool)

(assert (=> start!65432 (array_inv!15808 a!3186)))

(declare-fun b!745426 () Bool)

(declare-fun e!416304 () Bool)

(assert (=> b!745426 (= e!416304 true)))

(declare-fun lt!331047 () SeekEntryResult!7522)

(declare-fun lt!331050 () SeekEntryResult!7522)

(assert (=> b!745426 (= lt!331047 lt!331050)))

(declare-fun b!745427 () Bool)

(declare-fun res!502414 () Bool)

(assert (=> b!745427 (=> (not res!502414) (not e!416305))))

(assert (=> b!745427 (= res!502414 e!416301)))

(declare-fun c!81885 () Bool)

(assert (=> b!745427 (= c!81885 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!745428 () Bool)

(declare-fun e!416306 () Bool)

(assert (=> b!745428 (= e!416303 (not e!416306))))

(declare-fun res!502405 () Bool)

(assert (=> b!745428 (=> res!502405 e!416306)))

(get-info :version)

(assert (=> b!745428 (= res!502405 (or (not ((_ is Intermediate!7522) lt!331052)) (bvslt x!1131 (x!63419 lt!331052)) (not (= x!1131 (x!63419 lt!331052))) (not (= index!1321 (index!32458 lt!331052)))))))

(assert (=> b!745428 e!416300))

(declare-fun res!502407 () Bool)

(assert (=> b!745428 (=> (not res!502407) (not e!416300))))

(assert (=> b!745428 (= res!502407 (= lt!331047 lt!331046))))

(assert (=> b!745428 (= lt!331046 (Found!7522 j!159))))

(assert (=> b!745428 (= lt!331047 (seekEntryOrOpen!0 (select (arr!19925 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!745428 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!25496 0))(
  ( (Unit!25497) )
))
(declare-fun lt!331053 () Unit!25496)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41622 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25496)

(assert (=> b!745428 (= lt!331053 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!745429 () Bool)

(declare-fun res!502419 () Bool)

(assert (=> b!745429 (=> (not res!502419) (not e!416307))))

(assert (=> b!745429 (= res!502419 (validKeyInArray!0 k0!2102))))

(declare-fun b!745430 () Bool)

(assert (=> b!745430 (= e!416306 e!416304)))

(declare-fun res!502415 () Bool)

(assert (=> b!745430 (=> res!502415 e!416304)))

(assert (=> b!745430 (= res!502415 (or (not (= lt!331050 lt!331046)) (= (select (store (arr!19925 a!3186) i!1173 k0!2102) index!1321) lt!331051) (not (= (select (store (arr!19925 a!3186) i!1173 k0!2102) index!1321) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!745430 (= lt!331050 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19925 a!3186) j!159) a!3186 mask!3328))))

(assert (= (and start!65432 res!502418) b!745424))

(assert (= (and b!745424 res!502413) b!745421))

(assert (= (and b!745421 res!502404) b!745429))

(assert (= (and b!745429 res!502419) b!745414))

(assert (= (and b!745414 res!502410) b!745425))

(assert (= (and b!745425 res!502411) b!745419))

(assert (= (and b!745419 res!502412) b!745420))

(assert (= (and b!745420 res!502406) b!745416))

(assert (= (and b!745416 res!502408) b!745413))

(assert (= (and b!745413 res!502409) b!745415))

(assert (= (and b!745415 res!502417) b!745427))

(assert (= (and b!745427 c!81885) b!745422))

(assert (= (and b!745427 (not c!81885)) b!745418))

(assert (= (and b!745427 res!502414) b!745423))

(assert (= (and b!745423 res!502416) b!745428))

(assert (= (and b!745428 res!502407) b!745417))

(assert (= (and b!745428 (not res!502405)) b!745430))

(assert (= (and b!745430 (not res!502415)) b!745426))

(declare-fun m!695249 () Bool)

(assert (=> b!745414 m!695249))

(declare-fun m!695251 () Bool)

(assert (=> b!745421 m!695251))

(assert (=> b!745421 m!695251))

(declare-fun m!695253 () Bool)

(assert (=> b!745421 m!695253))

(assert (=> b!745418 m!695251))

(assert (=> b!745418 m!695251))

(declare-fun m!695255 () Bool)

(assert (=> b!745418 m!695255))

(declare-fun m!695257 () Bool)

(assert (=> b!745425 m!695257))

(assert (=> b!745428 m!695251))

(assert (=> b!745428 m!695251))

(declare-fun m!695259 () Bool)

(assert (=> b!745428 m!695259))

(declare-fun m!695261 () Bool)

(assert (=> b!745428 m!695261))

(declare-fun m!695263 () Bool)

(assert (=> b!745428 m!695263))

(assert (=> b!745422 m!695251))

(assert (=> b!745422 m!695251))

(declare-fun m!695265 () Bool)

(assert (=> b!745422 m!695265))

(declare-fun m!695267 () Bool)

(assert (=> b!745419 m!695267))

(declare-fun m!695269 () Bool)

(assert (=> start!65432 m!695269))

(declare-fun m!695271 () Bool)

(assert (=> start!65432 m!695271))

(declare-fun m!695273 () Bool)

(assert (=> b!745420 m!695273))

(declare-fun m!695275 () Bool)

(assert (=> b!745430 m!695275))

(declare-fun m!695277 () Bool)

(assert (=> b!745430 m!695277))

(assert (=> b!745430 m!695251))

(assert (=> b!745430 m!695251))

(assert (=> b!745430 m!695255))

(assert (=> b!745413 m!695251))

(assert (=> b!745413 m!695251))

(declare-fun m!695279 () Bool)

(assert (=> b!745413 m!695279))

(assert (=> b!745413 m!695279))

(assert (=> b!745413 m!695251))

(declare-fun m!695281 () Bool)

(assert (=> b!745413 m!695281))

(assert (=> b!745417 m!695251))

(assert (=> b!745417 m!695251))

(declare-fun m!695283 () Bool)

(assert (=> b!745417 m!695283))

(declare-fun m!695285 () Bool)

(assert (=> b!745415 m!695285))

(declare-fun m!695287 () Bool)

(assert (=> b!745429 m!695287))

(assert (=> b!745423 m!695275))

(declare-fun m!695289 () Bool)

(assert (=> b!745423 m!695289))

(declare-fun m!695291 () Bool)

(assert (=> b!745423 m!695291))

(declare-fun m!695293 () Bool)

(assert (=> b!745423 m!695293))

(declare-fun m!695295 () Bool)

(assert (=> b!745423 m!695295))

(assert (=> b!745423 m!695291))

(check-sat (not start!65432) (not b!745422) (not b!745421) (not b!745423) (not b!745417) (not b!745425) (not b!745414) (not b!745419) (not b!745418) (not b!745428) (not b!745430) (not b!745420) (not b!745429) (not b!745413))
(check-sat)
