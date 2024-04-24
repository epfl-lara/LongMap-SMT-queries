; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67846 () Bool)

(assert start!67846)

(declare-fun b!786473 () Bool)

(declare-fun res!532270 () Bool)

(declare-fun e!437281 () Bool)

(assert (=> b!786473 (=> (not res!532270) (not e!437281))))

(declare-datatypes ((array!42766 0))(
  ( (array!42767 (arr!20467 (Array (_ BitVec 32) (_ BitVec 64))) (size!20887 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42766)

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!42766 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!786473 (= res!532270 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!786474 () Bool)

(declare-fun e!437278 () Bool)

(declare-datatypes ((SeekEntryResult!8023 0))(
  ( (MissingZero!8023 (index!34460 (_ BitVec 32))) (Found!8023 (index!34461 (_ BitVec 32))) (Intermediate!8023 (undefined!8835 Bool) (index!34462 (_ BitVec 32)) (x!65566 (_ BitVec 32))) (Undefined!8023) (MissingVacant!8023 (index!34463 (_ BitVec 32))) )
))
(declare-fun lt!350692 () SeekEntryResult!8023)

(declare-fun lt!350682 () SeekEntryResult!8023)

(assert (=> b!786474 (= e!437278 (= lt!350692 lt!350682))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!786475 () Bool)

(declare-fun e!437280 () Bool)

(declare-fun lt!350688 () SeekEntryResult!8023)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42766 (_ BitVec 32)) SeekEntryResult!8023)

(assert (=> b!786475 (= e!437280 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20467 a!3186) j!159) a!3186 mask!3328) lt!350688))))

(declare-fun b!786476 () Bool)

(declare-fun e!437274 () Bool)

(declare-fun e!437276 () Bool)

(assert (=> b!786476 (= e!437274 e!437276)))

(declare-fun res!532257 () Bool)

(assert (=> b!786476 (=> res!532257 e!437276)))

(declare-fun lt!350690 () (_ BitVec 64))

(declare-fun lt!350691 () (_ BitVec 64))

(assert (=> b!786476 (= res!532257 (= lt!350690 lt!350691))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!786476 (= lt!350690 (select (store (arr!20467 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!786477 () Bool)

(declare-fun res!532271 () Bool)

(declare-fun e!437275 () Bool)

(assert (=> b!786477 (=> (not res!532271) (not e!437275))))

(assert (=> b!786477 (= res!532271 e!437280)))

(declare-fun c!87521 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!786477 (= c!87521 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!786478 () Bool)

(declare-fun e!437284 () Bool)

(assert (=> b!786478 (= e!437284 e!437274)))

(declare-fun res!532259 () Bool)

(assert (=> b!786478 (=> res!532259 e!437274)))

(declare-fun lt!350684 () SeekEntryResult!8023)

(assert (=> b!786478 (= res!532259 (not (= lt!350682 lt!350684)))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42766 (_ BitVec 32)) SeekEntryResult!8023)

(assert (=> b!786478 (= lt!350682 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20467 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!786479 () Bool)

(declare-fun e!437282 () Bool)

(assert (=> b!786479 (= e!437282 e!437275)))

(declare-fun res!532266 () Bool)

(assert (=> b!786479 (=> (not res!532266) (not e!437275))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!786479 (= res!532266 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20467 a!3186) j!159) mask!3328) (select (arr!20467 a!3186) j!159) a!3186 mask!3328) lt!350688))))

(assert (=> b!786479 (= lt!350688 (Intermediate!8023 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!786480 () Bool)

(declare-fun res!532268 () Bool)

(assert (=> b!786480 (=> (not res!532268) (not e!437281))))

(assert (=> b!786480 (= res!532268 (and (= (size!20887 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20887 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20887 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!786481 () Bool)

(assert (=> b!786481 (= e!437276 true)))

(assert (=> b!786481 e!437278))

(declare-fun res!532263 () Bool)

(assert (=> b!786481 (=> (not res!532263) (not e!437278))))

(assert (=> b!786481 (= res!532263 (= lt!350690 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!27157 0))(
  ( (Unit!27158) )
))
(declare-fun lt!350689 () Unit!27157)

(declare-fun e!437277 () Unit!27157)

(assert (=> b!786481 (= lt!350689 e!437277)))

(declare-fun c!87520 () Bool)

(assert (=> b!786481 (= c!87520 (= lt!350690 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!786482 () Bool)

(declare-fun res!532254 () Bool)

(assert (=> b!786482 (=> (not res!532254) (not e!437281))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!786482 (= res!532254 (validKeyInArray!0 k0!2102))))

(declare-fun b!786483 () Bool)

(declare-fun Unit!27159 () Unit!27157)

(assert (=> b!786483 (= e!437277 Unit!27159)))

(assert (=> b!786483 false))

(declare-fun b!786484 () Bool)

(declare-fun res!532260 () Bool)

(assert (=> b!786484 (=> (not res!532260) (not e!437281))))

(assert (=> b!786484 (= res!532260 (validKeyInArray!0 (select (arr!20467 a!3186) j!159)))))

(declare-fun b!786485 () Bool)

(declare-fun Unit!27160 () Unit!27157)

(assert (=> b!786485 (= e!437277 Unit!27160)))

(declare-fun b!786486 () Bool)

(assert (=> b!786486 (= e!437281 e!437282)))

(declare-fun res!532267 () Bool)

(assert (=> b!786486 (=> (not res!532267) (not e!437282))))

(declare-fun lt!350681 () SeekEntryResult!8023)

(assert (=> b!786486 (= res!532267 (or (= lt!350681 (MissingZero!8023 i!1173)) (= lt!350681 (MissingVacant!8023 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42766 (_ BitVec 32)) SeekEntryResult!8023)

(assert (=> b!786486 (= lt!350681 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!786487 () Bool)

(declare-fun res!532272 () Bool)

(assert (=> b!786487 (=> (not res!532272) (not e!437282))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42766 (_ BitVec 32)) Bool)

(assert (=> b!786487 (= res!532272 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun res!532261 () Bool)

(assert (=> start!67846 (=> (not res!532261) (not e!437281))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67846 (= res!532261 (validMask!0 mask!3328))))

(assert (=> start!67846 e!437281))

(assert (=> start!67846 true))

(declare-fun array_inv!16326 (array!42766) Bool)

(assert (=> start!67846 (array_inv!16326 a!3186)))

(declare-fun b!786488 () Bool)

(declare-fun res!532264 () Bool)

(assert (=> b!786488 (=> (not res!532264) (not e!437275))))

(assert (=> b!786488 (= res!532264 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20467 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!786489 () Bool)

(declare-fun res!532265 () Bool)

(assert (=> b!786489 (=> (not res!532265) (not e!437282))))

(declare-datatypes ((List!14376 0))(
  ( (Nil!14373) (Cons!14372 (h!15501 (_ BitVec 64)) (t!20683 List!14376)) )
))
(declare-fun arrayNoDuplicates!0 (array!42766 (_ BitVec 32) List!14376) Bool)

(assert (=> b!786489 (= res!532265 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14373))))

(declare-fun b!786490 () Bool)

(assert (=> b!786490 (= e!437280 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20467 a!3186) j!159) a!3186 mask!3328) (Found!8023 j!159)))))

(declare-fun b!786491 () Bool)

(declare-fun e!437273 () Bool)

(assert (=> b!786491 (= e!437273 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20467 a!3186) j!159) a!3186 mask!3328) lt!350684))))

(declare-fun b!786492 () Bool)

(declare-fun e!437283 () Bool)

(assert (=> b!786492 (= e!437275 e!437283)))

(declare-fun res!532258 () Bool)

(assert (=> b!786492 (=> (not res!532258) (not e!437283))))

(declare-fun lt!350687 () SeekEntryResult!8023)

(declare-fun lt!350683 () SeekEntryResult!8023)

(assert (=> b!786492 (= res!532258 (= lt!350687 lt!350683))))

(declare-fun lt!350685 () array!42766)

(assert (=> b!786492 (= lt!350683 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!350691 lt!350685 mask!3328))))

(assert (=> b!786492 (= lt!350687 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!350691 mask!3328) lt!350691 lt!350685 mask!3328))))

(assert (=> b!786492 (= lt!350691 (select (store (arr!20467 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!786492 (= lt!350685 (array!42767 (store (arr!20467 a!3186) i!1173 k0!2102) (size!20887 a!3186)))))

(declare-fun b!786493 () Bool)

(declare-fun res!532256 () Bool)

(assert (=> b!786493 (=> (not res!532256) (not e!437282))))

(assert (=> b!786493 (= res!532256 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20887 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20887 a!3186))))))

(declare-fun b!786494 () Bool)

(assert (=> b!786494 (= e!437283 (not e!437284))))

(declare-fun res!532255 () Bool)

(assert (=> b!786494 (=> res!532255 e!437284)))

(get-info :version)

(assert (=> b!786494 (= res!532255 (or (not ((_ is Intermediate!8023) lt!350683)) (bvslt x!1131 (x!65566 lt!350683)) (not (= x!1131 (x!65566 lt!350683))) (not (= index!1321 (index!34462 lt!350683)))))))

(assert (=> b!786494 e!437273))

(declare-fun res!532269 () Bool)

(assert (=> b!786494 (=> (not res!532269) (not e!437273))))

(assert (=> b!786494 (= res!532269 (= lt!350692 lt!350684))))

(assert (=> b!786494 (= lt!350684 (Found!8023 j!159))))

(assert (=> b!786494 (= lt!350692 (seekEntryOrOpen!0 (select (arr!20467 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!786494 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!350686 () Unit!27157)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42766 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27157)

(assert (=> b!786494 (= lt!350686 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!786495 () Bool)

(declare-fun res!532262 () Bool)

(assert (=> b!786495 (=> (not res!532262) (not e!437278))))

(assert (=> b!786495 (= res!532262 (= (seekEntryOrOpen!0 lt!350691 lt!350685 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!350691 lt!350685 mask!3328)))))

(assert (= (and start!67846 res!532261) b!786480))

(assert (= (and b!786480 res!532268) b!786484))

(assert (= (and b!786484 res!532260) b!786482))

(assert (= (and b!786482 res!532254) b!786473))

(assert (= (and b!786473 res!532270) b!786486))

(assert (= (and b!786486 res!532267) b!786487))

(assert (= (and b!786487 res!532272) b!786489))

(assert (= (and b!786489 res!532265) b!786493))

(assert (= (and b!786493 res!532256) b!786479))

(assert (= (and b!786479 res!532266) b!786488))

(assert (= (and b!786488 res!532264) b!786477))

(assert (= (and b!786477 c!87521) b!786475))

(assert (= (and b!786477 (not c!87521)) b!786490))

(assert (= (and b!786477 res!532271) b!786492))

(assert (= (and b!786492 res!532258) b!786494))

(assert (= (and b!786494 res!532269) b!786491))

(assert (= (and b!786494 (not res!532255)) b!786478))

(assert (= (and b!786478 (not res!532259)) b!786476))

(assert (= (and b!786476 (not res!532257)) b!786481))

(assert (= (and b!786481 c!87520) b!786483))

(assert (= (and b!786481 (not c!87520)) b!786485))

(assert (= (and b!786481 res!532263) b!786495))

(assert (= (and b!786495 res!532262) b!786474))

(declare-fun m!728867 () Bool)

(assert (=> b!786484 m!728867))

(assert (=> b!786484 m!728867))

(declare-fun m!728869 () Bool)

(assert (=> b!786484 m!728869))

(declare-fun m!728871 () Bool)

(assert (=> b!786473 m!728871))

(declare-fun m!728873 () Bool)

(assert (=> b!786492 m!728873))

(declare-fun m!728875 () Bool)

(assert (=> b!786492 m!728875))

(declare-fun m!728877 () Bool)

(assert (=> b!786492 m!728877))

(declare-fun m!728879 () Bool)

(assert (=> b!786492 m!728879))

(declare-fun m!728881 () Bool)

(assert (=> b!786492 m!728881))

(assert (=> b!786492 m!728873))

(declare-fun m!728883 () Bool)

(assert (=> b!786486 m!728883))

(declare-fun m!728885 () Bool)

(assert (=> b!786495 m!728885))

(declare-fun m!728887 () Bool)

(assert (=> b!786495 m!728887))

(declare-fun m!728889 () Bool)

(assert (=> b!786482 m!728889))

(assert (=> b!786476 m!728879))

(declare-fun m!728891 () Bool)

(assert (=> b!786476 m!728891))

(assert (=> b!786494 m!728867))

(assert (=> b!786494 m!728867))

(declare-fun m!728893 () Bool)

(assert (=> b!786494 m!728893))

(declare-fun m!728895 () Bool)

(assert (=> b!786494 m!728895))

(declare-fun m!728897 () Bool)

(assert (=> b!786494 m!728897))

(assert (=> b!786491 m!728867))

(assert (=> b!786491 m!728867))

(declare-fun m!728899 () Bool)

(assert (=> b!786491 m!728899))

(declare-fun m!728901 () Bool)

(assert (=> b!786488 m!728901))

(assert (=> b!786478 m!728867))

(assert (=> b!786478 m!728867))

(declare-fun m!728903 () Bool)

(assert (=> b!786478 m!728903))

(declare-fun m!728905 () Bool)

(assert (=> b!786489 m!728905))

(declare-fun m!728907 () Bool)

(assert (=> start!67846 m!728907))

(declare-fun m!728909 () Bool)

(assert (=> start!67846 m!728909))

(declare-fun m!728911 () Bool)

(assert (=> b!786487 m!728911))

(assert (=> b!786475 m!728867))

(assert (=> b!786475 m!728867))

(declare-fun m!728913 () Bool)

(assert (=> b!786475 m!728913))

(assert (=> b!786490 m!728867))

(assert (=> b!786490 m!728867))

(assert (=> b!786490 m!728903))

(assert (=> b!786479 m!728867))

(assert (=> b!786479 m!728867))

(declare-fun m!728915 () Bool)

(assert (=> b!786479 m!728915))

(assert (=> b!786479 m!728915))

(assert (=> b!786479 m!728867))

(declare-fun m!728917 () Bool)

(assert (=> b!786479 m!728917))

(check-sat (not b!786494) (not b!786473) (not b!786484) (not b!786486) (not b!786490) (not b!786495) (not start!67846) (not b!786475) (not b!786489) (not b!786478) (not b!786482) (not b!786492) (not b!786479) (not b!786487) (not b!786491))
(check-sat)
