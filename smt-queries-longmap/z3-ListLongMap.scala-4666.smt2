; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64914 () Bool)

(assert start!64914)

(declare-fun b!732464 () Bool)

(declare-fun e!409878 () Bool)

(declare-fun e!409875 () Bool)

(assert (=> b!732464 (= e!409878 e!409875)))

(declare-fun res!492060 () Bool)

(assert (=> b!732464 (=> (not res!492060) (not e!409875))))

(declare-datatypes ((array!41225 0))(
  ( (array!41226 (arr!19729 (Array (_ BitVec 32) (_ BitVec 64))) (size!20150 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41225)

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7329 0))(
  ( (MissingZero!7329 (index!31684 (_ BitVec 32))) (Found!7329 (index!31685 (_ BitVec 32))) (Intermediate!7329 (undefined!8141 Bool) (index!31686 (_ BitVec 32)) (x!62679 (_ BitVec 32))) (Undefined!7329) (MissingVacant!7329 (index!31687 (_ BitVec 32))) )
))
(declare-fun lt!324584 () SeekEntryResult!7329)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41225 (_ BitVec 32)) SeekEntryResult!7329)

(assert (=> b!732464 (= res!492060 (= (seekEntryOrOpen!0 (select (arr!19729 a!3186) j!159) a!3186 mask!3328) lt!324584))))

(assert (=> b!732464 (= lt!324584 (Found!7329 j!159))))

(declare-fun b!732465 () Bool)

(declare-fun e!409877 () Bool)

(declare-fun e!409873 () Bool)

(assert (=> b!732465 (= e!409877 e!409873)))

(declare-fun res!492054 () Bool)

(assert (=> b!732465 (=> (not res!492054) (not e!409873))))

(declare-fun lt!324583 () SeekEntryResult!7329)

(declare-fun lt!324589 () SeekEntryResult!7329)

(assert (=> b!732465 (= res!492054 (= lt!324583 lt!324589))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun lt!324585 () (_ BitVec 64))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!324587 () array!41225)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41225 (_ BitVec 32)) SeekEntryResult!7329)

(assert (=> b!732465 (= lt!324589 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!324585 lt!324587 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!732465 (= lt!324583 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!324585 mask!3328) lt!324585 lt!324587 mask!3328))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!732465 (= lt!324585 (select (store (arr!19729 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!732465 (= lt!324587 (array!41226 (store (arr!19729 a!3186) i!1173 k0!2102) (size!20150 a!3186)))))

(declare-fun b!732466 () Bool)

(declare-fun e!409872 () Bool)

(assert (=> b!732466 (= e!409873 (not e!409872))))

(declare-fun res!492051 () Bool)

(assert (=> b!732466 (=> res!492051 e!409872)))

(get-info :version)

(assert (=> b!732466 (= res!492051 (or (not ((_ is Intermediate!7329) lt!324589)) (bvsge x!1131 (x!62679 lt!324589))))))

(assert (=> b!732466 e!409878))

(declare-fun res!492052 () Bool)

(assert (=> b!732466 (=> (not res!492052) (not e!409878))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41225 (_ BitVec 32)) Bool)

(assert (=> b!732466 (= res!492052 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24976 0))(
  ( (Unit!24977) )
))
(declare-fun lt!324582 () Unit!24976)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41225 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24976)

(assert (=> b!732466 (= lt!324582 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!732467 () Bool)

(declare-fun lt!324586 () SeekEntryResult!7329)

(declare-fun e!409880 () Bool)

(assert (=> b!732467 (= e!409880 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19729 a!3186) j!159) a!3186 mask!3328) lt!324586))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun b!732468 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41225 (_ BitVec 32)) SeekEntryResult!7329)

(assert (=> b!732468 (= e!409880 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19729 a!3186) j!159) a!3186 mask!3328) (Found!7329 j!159)))))

(declare-fun e!409879 () Bool)

(declare-fun b!732469 () Bool)

(declare-fun lt!324588 () (_ BitVec 32))

(assert (=> b!732469 (= e!409879 (or (bvslt mask!3328 #b00000000000000000000000000000000) (bvslt lt!324588 #b00000000000000000000000000000000) (bvsge lt!324588 (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (bvadd #b00000000000000000000000000000001 mask!3328))))))

(declare-fun b!732470 () Bool)

(declare-fun e!409871 () Bool)

(assert (=> b!732470 (= e!409871 e!409877)))

(declare-fun res!492068 () Bool)

(assert (=> b!732470 (=> (not res!492068) (not e!409877))))

(assert (=> b!732470 (= res!492068 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19729 a!3186) j!159) mask!3328) (select (arr!19729 a!3186) j!159) a!3186 mask!3328) lt!324586))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!732470 (= lt!324586 (Intermediate!7329 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!732471 () Bool)

(assert (=> b!732471 (= e!409875 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19729 a!3186) j!159) a!3186 mask!3328) lt!324584))))

(declare-fun res!492066 () Bool)

(declare-fun e!409876 () Bool)

(assert (=> start!64914 (=> (not res!492066) (not e!409876))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64914 (= res!492066 (validMask!0 mask!3328))))

(assert (=> start!64914 e!409876))

(assert (=> start!64914 true))

(declare-fun array_inv!15525 (array!41225) Bool)

(assert (=> start!64914 (array_inv!15525 a!3186)))

(declare-fun b!732472 () Bool)

(assert (=> b!732472 (= e!409876 e!409871)))

(declare-fun res!492055 () Bool)

(assert (=> b!732472 (=> (not res!492055) (not e!409871))))

(declare-fun lt!324590 () SeekEntryResult!7329)

(assert (=> b!732472 (= res!492055 (or (= lt!324590 (MissingZero!7329 i!1173)) (= lt!324590 (MissingVacant!7329 i!1173))))))

(assert (=> b!732472 (= lt!324590 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!732473 () Bool)

(declare-fun res!492064 () Bool)

(assert (=> b!732473 (=> (not res!492064) (not e!409876))))

(assert (=> b!732473 (= res!492064 (and (= (size!20150 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20150 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20150 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!732474 () Bool)

(declare-fun res!492062 () Bool)

(assert (=> b!732474 (=> (not res!492062) (not e!409877))))

(assert (=> b!732474 (= res!492062 e!409880)))

(declare-fun c!80584 () Bool)

(assert (=> b!732474 (= c!80584 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!732475 () Bool)

(declare-fun res!492057 () Bool)

(assert (=> b!732475 (=> (not res!492057) (not e!409871))))

(declare-datatypes ((List!13731 0))(
  ( (Nil!13728) (Cons!13727 (h!14793 (_ BitVec 64)) (t!20046 List!13731)) )
))
(declare-fun arrayNoDuplicates!0 (array!41225 (_ BitVec 32) List!13731) Bool)

(assert (=> b!732475 (= res!492057 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13728))))

(declare-fun b!732476 () Bool)

(declare-fun res!492063 () Bool)

(assert (=> b!732476 (=> (not res!492063) (not e!409871))))

(assert (=> b!732476 (= res!492063 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20150 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20150 a!3186))))))

(declare-fun b!732477 () Bool)

(declare-fun res!492067 () Bool)

(assert (=> b!732477 (=> (not res!492067) (not e!409876))))

(declare-fun arrayContainsKey!0 (array!41225 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!732477 (= res!492067 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!732478 () Bool)

(declare-fun res!492053 () Bool)

(assert (=> b!732478 (=> (not res!492053) (not e!409877))))

(assert (=> b!732478 (= res!492053 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19729 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!732479 () Bool)

(declare-fun res!492061 () Bool)

(assert (=> b!732479 (=> (not res!492061) (not e!409876))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!732479 (= res!492061 (validKeyInArray!0 k0!2102))))

(declare-fun b!732480 () Bool)

(declare-fun res!492058 () Bool)

(assert (=> b!732480 (=> (not res!492058) (not e!409876))))

(assert (=> b!732480 (= res!492058 (validKeyInArray!0 (select (arr!19729 a!3186) j!159)))))

(declare-fun b!732481 () Bool)

(assert (=> b!732481 (= e!409872 e!409879)))

(declare-fun res!492065 () Bool)

(assert (=> b!732481 (=> res!492065 e!409879)))

(assert (=> b!732481 (= res!492065 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!732481 (= lt!324588 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!732482 () Bool)

(declare-fun res!492059 () Bool)

(assert (=> b!732482 (=> res!492059 e!409879)))

(assert (=> b!732482 (= res!492059 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19729 a!3186) j!159) a!3186 mask!3328) (Found!7329 j!159))))))

(declare-fun b!732483 () Bool)

(declare-fun res!492056 () Bool)

(assert (=> b!732483 (=> (not res!492056) (not e!409871))))

(assert (=> b!732483 (= res!492056 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(assert (= (and start!64914 res!492066) b!732473))

(assert (= (and b!732473 res!492064) b!732480))

(assert (= (and b!732480 res!492058) b!732479))

(assert (= (and b!732479 res!492061) b!732477))

(assert (= (and b!732477 res!492067) b!732472))

(assert (= (and b!732472 res!492055) b!732483))

(assert (= (and b!732483 res!492056) b!732475))

(assert (= (and b!732475 res!492057) b!732476))

(assert (= (and b!732476 res!492063) b!732470))

(assert (= (and b!732470 res!492068) b!732478))

(assert (= (and b!732478 res!492053) b!732474))

(assert (= (and b!732474 c!80584) b!732467))

(assert (= (and b!732474 (not c!80584)) b!732468))

(assert (= (and b!732474 res!492062) b!732465))

(assert (= (and b!732465 res!492054) b!732466))

(assert (= (and b!732466 res!492052) b!732464))

(assert (= (and b!732464 res!492060) b!732471))

(assert (= (and b!732466 (not res!492051)) b!732481))

(assert (= (and b!732481 (not res!492065)) b!732482))

(assert (= (and b!732482 (not res!492059)) b!732469))

(declare-fun m!685519 () Bool)

(assert (=> b!732477 m!685519))

(declare-fun m!685521 () Bool)

(assert (=> b!732481 m!685521))

(declare-fun m!685523 () Bool)

(assert (=> b!732479 m!685523))

(declare-fun m!685525 () Bool)

(assert (=> b!732482 m!685525))

(assert (=> b!732482 m!685525))

(declare-fun m!685527 () Bool)

(assert (=> b!732482 m!685527))

(declare-fun m!685529 () Bool)

(assert (=> b!732478 m!685529))

(assert (=> b!732470 m!685525))

(assert (=> b!732470 m!685525))

(declare-fun m!685531 () Bool)

(assert (=> b!732470 m!685531))

(assert (=> b!732470 m!685531))

(assert (=> b!732470 m!685525))

(declare-fun m!685533 () Bool)

(assert (=> b!732470 m!685533))

(declare-fun m!685535 () Bool)

(assert (=> b!732475 m!685535))

(assert (=> b!732471 m!685525))

(assert (=> b!732471 m!685525))

(declare-fun m!685537 () Bool)

(assert (=> b!732471 m!685537))

(declare-fun m!685539 () Bool)

(assert (=> b!732483 m!685539))

(assert (=> b!732480 m!685525))

(assert (=> b!732480 m!685525))

(declare-fun m!685541 () Bool)

(assert (=> b!732480 m!685541))

(assert (=> b!732468 m!685525))

(assert (=> b!732468 m!685525))

(assert (=> b!732468 m!685527))

(assert (=> b!732464 m!685525))

(assert (=> b!732464 m!685525))

(declare-fun m!685543 () Bool)

(assert (=> b!732464 m!685543))

(declare-fun m!685545 () Bool)

(assert (=> start!64914 m!685545))

(declare-fun m!685547 () Bool)

(assert (=> start!64914 m!685547))

(declare-fun m!685549 () Bool)

(assert (=> b!732466 m!685549))

(declare-fun m!685551 () Bool)

(assert (=> b!732466 m!685551))

(assert (=> b!732467 m!685525))

(assert (=> b!732467 m!685525))

(declare-fun m!685553 () Bool)

(assert (=> b!732467 m!685553))

(declare-fun m!685555 () Bool)

(assert (=> b!732465 m!685555))

(declare-fun m!685557 () Bool)

(assert (=> b!732465 m!685557))

(declare-fun m!685559 () Bool)

(assert (=> b!732465 m!685559))

(declare-fun m!685561 () Bool)

(assert (=> b!732465 m!685561))

(declare-fun m!685563 () Bool)

(assert (=> b!732465 m!685563))

(assert (=> b!732465 m!685555))

(declare-fun m!685565 () Bool)

(assert (=> b!732472 m!685565))

(check-sat (not b!732481) (not b!732480) (not b!732482) (not b!732470) (not b!732477) (not b!732466) (not b!732472) (not b!732471) (not b!732468) (not b!732479) (not b!732467) (not b!732465) (not b!732475) (not start!64914) (not b!732464) (not b!732483))
(check-sat)
