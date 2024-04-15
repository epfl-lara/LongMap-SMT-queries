; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45486 () Bool)

(assert start!45486)

(declare-fun b!500886 () Bool)

(declare-fun res!302761 () Bool)

(declare-fun e!293409 () Bool)

(assert (=> b!500886 (=> (not res!302761) (not e!293409))))

(declare-datatypes ((array!32321 0))(
  ( (array!32322 (arr!15542 (Array (_ BitVec 32) (_ BitVec 64))) (size!15907 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32321)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!500886 (= res!302761 (validKeyInArray!0 (select (arr!15542 a!3235) j!176)))))

(declare-fun b!500887 () Bool)

(declare-fun res!302767 () Bool)

(assert (=> b!500887 (=> (not res!302767) (not e!293409))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!500887 (= res!302767 (and (= (size!15907 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15907 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15907 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!500888 () Bool)

(declare-fun e!293408 () Bool)

(assert (=> b!500888 (= e!293408 (or (bvslt mask!3524 #b00000000000000000000000000000000) (bvsle mask!3524 #b00111111111111111111111111111111)))))

(declare-datatypes ((SeekEntryResult!4006 0))(
  ( (MissingZero!4006 (index!18206 (_ BitVec 32))) (Found!4006 (index!18207 (_ BitVec 32))) (Intermediate!4006 (undefined!4818 Bool) (index!18208 (_ BitVec 32)) (x!47246 (_ BitVec 32))) (Undefined!4006) (MissingVacant!4006 (index!18209 (_ BitVec 32))) )
))
(declare-fun lt!227371 () SeekEntryResult!4006)

(assert (=> b!500888 (= (index!18208 lt!227371) i!1204)))

(declare-datatypes ((Unit!15094 0))(
  ( (Unit!15095) )
))
(declare-fun lt!227369 () Unit!15094)

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun lt!227370 () (_ BitVec 32))

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!32321 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15094)

(assert (=> b!500888 (= lt!227369 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k0!2280 j!176 lt!227370 #b00000000000000000000000000000000 (index!18208 lt!227371) (x!47246 lt!227371) mask!3524))))

(assert (=> b!500888 (and (or (= (select (arr!15542 a!3235) (index!18208 lt!227371)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15542 a!3235) (index!18208 lt!227371)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15542 a!3235) (index!18208 lt!227371)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15542 a!3235) (index!18208 lt!227371)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!227366 () Unit!15094)

(declare-fun e!293411 () Unit!15094)

(assert (=> b!500888 (= lt!227366 e!293411)))

(declare-fun c!59340 () Bool)

(assert (=> b!500888 (= c!59340 (= (select (arr!15542 a!3235) (index!18208 lt!227371)) (select (arr!15542 a!3235) j!176)))))

(assert (=> b!500888 (and (bvslt (x!47246 lt!227371) #b01111111111111111111111111111110) (or (= (select (arr!15542 a!3235) (index!18208 lt!227371)) (select (arr!15542 a!3235) j!176)) (= (select (arr!15542 a!3235) (index!18208 lt!227371)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15542 a!3235) (index!18208 lt!227371)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!500889 () Bool)

(declare-fun e!293406 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32321 (_ BitVec 32)) SeekEntryResult!4006)

(assert (=> b!500889 (= e!293406 (= (seekEntryOrOpen!0 (select (arr!15542 a!3235) j!176) a!3235 mask!3524) (Found!4006 j!176)))))

(declare-fun b!500890 () Bool)

(declare-fun e!293410 () Bool)

(assert (=> b!500890 (= e!293409 e!293410)))

(declare-fun res!302766 () Bool)

(assert (=> b!500890 (=> (not res!302766) (not e!293410))))

(declare-fun lt!227367 () SeekEntryResult!4006)

(assert (=> b!500890 (= res!302766 (or (= lt!227367 (MissingZero!4006 i!1204)) (= lt!227367 (MissingVacant!4006 i!1204))))))

(assert (=> b!500890 (= lt!227367 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!500891 () Bool)

(declare-fun res!302771 () Bool)

(assert (=> b!500891 (=> (not res!302771) (not e!293409))))

(assert (=> b!500891 (= res!302771 (validKeyInArray!0 k0!2280))))

(declare-fun b!500892 () Bool)

(declare-fun res!302768 () Bool)

(assert (=> b!500892 (=> (not res!302768) (not e!293410))))

(declare-datatypes ((List!9739 0))(
  ( (Nil!9736) (Cons!9735 (h!10609 (_ BitVec 64)) (t!15958 List!9739)) )
))
(declare-fun arrayNoDuplicates!0 (array!32321 (_ BitVec 32) List!9739) Bool)

(assert (=> b!500892 (= res!302768 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9736))))

(declare-fun res!302763 () Bool)

(assert (=> start!45486 (=> (not res!302763) (not e!293409))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45486 (= res!302763 (validMask!0 mask!3524))))

(assert (=> start!45486 e!293409))

(assert (=> start!45486 true))

(declare-fun array_inv!11425 (array!32321) Bool)

(assert (=> start!45486 (array_inv!11425 a!3235)))

(declare-fun b!500893 () Bool)

(declare-fun res!302764 () Bool)

(assert (=> b!500893 (=> (not res!302764) (not e!293410))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32321 (_ BitVec 32)) Bool)

(assert (=> b!500893 (= res!302764 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!500894 () Bool)

(declare-fun Unit!15096 () Unit!15094)

(assert (=> b!500894 (= e!293411 Unit!15096)))

(declare-fun b!500895 () Bool)

(declare-fun res!302770 () Bool)

(assert (=> b!500895 (=> (not res!302770) (not e!293409))))

(declare-fun arrayContainsKey!0 (array!32321 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!500895 (= res!302770 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!500896 () Bool)

(assert (=> b!500896 (= e!293410 (not e!293408))))

(declare-fun res!302760 () Bool)

(assert (=> b!500896 (=> res!302760 e!293408)))

(declare-fun lt!227373 () array!32321)

(declare-fun lt!227365 () (_ BitVec 64))

(declare-fun lt!227368 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32321 (_ BitVec 32)) SeekEntryResult!4006)

(assert (=> b!500896 (= res!302760 (= lt!227371 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!227368 lt!227365 lt!227373 mask!3524)))))

(assert (=> b!500896 (= lt!227371 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!227370 (select (arr!15542 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!500896 (= lt!227368 (toIndex!0 lt!227365 mask!3524))))

(assert (=> b!500896 (= lt!227365 (select (store (arr!15542 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!500896 (= lt!227370 (toIndex!0 (select (arr!15542 a!3235) j!176) mask!3524))))

(assert (=> b!500896 (= lt!227373 (array!32322 (store (arr!15542 a!3235) i!1204 k0!2280) (size!15907 a!3235)))))

(assert (=> b!500896 e!293406))

(declare-fun res!302762 () Bool)

(assert (=> b!500896 (=> (not res!302762) (not e!293406))))

(assert (=> b!500896 (= res!302762 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!227372 () Unit!15094)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32321 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15094)

(assert (=> b!500896 (= lt!227372 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!500897 () Bool)

(declare-fun Unit!15097 () Unit!15094)

(assert (=> b!500897 (= e!293411 Unit!15097)))

(declare-fun lt!227374 () Unit!15094)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32321 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15094)

(assert (=> b!500897 (= lt!227374 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!227370 #b00000000000000000000000000000000 (index!18208 lt!227371) (x!47246 lt!227371) mask!3524))))

(declare-fun res!302769 () Bool)

(assert (=> b!500897 (= res!302769 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!227370 lt!227365 lt!227373 mask!3524) (Intermediate!4006 false (index!18208 lt!227371) (x!47246 lt!227371))))))

(declare-fun e!293412 () Bool)

(assert (=> b!500897 (=> (not res!302769) (not e!293412))))

(assert (=> b!500897 e!293412))

(declare-fun b!500898 () Bool)

(assert (=> b!500898 (= e!293412 false)))

(declare-fun b!500899 () Bool)

(declare-fun res!302765 () Bool)

(assert (=> b!500899 (=> res!302765 e!293408)))

(get-info :version)

(assert (=> b!500899 (= res!302765 (or (undefined!4818 lt!227371) (not ((_ is Intermediate!4006) lt!227371))))))

(assert (= (and start!45486 res!302763) b!500887))

(assert (= (and b!500887 res!302767) b!500886))

(assert (= (and b!500886 res!302761) b!500891))

(assert (= (and b!500891 res!302771) b!500895))

(assert (= (and b!500895 res!302770) b!500890))

(assert (= (and b!500890 res!302766) b!500893))

(assert (= (and b!500893 res!302764) b!500892))

(assert (= (and b!500892 res!302768) b!500896))

(assert (= (and b!500896 res!302762) b!500889))

(assert (= (and b!500896 (not res!302760)) b!500899))

(assert (= (and b!500899 (not res!302765)) b!500888))

(assert (= (and b!500888 c!59340) b!500897))

(assert (= (and b!500888 (not c!59340)) b!500894))

(assert (= (and b!500897 res!302769) b!500898))

(declare-fun m!481507 () Bool)

(assert (=> b!500897 m!481507))

(declare-fun m!481509 () Bool)

(assert (=> b!500897 m!481509))

(declare-fun m!481511 () Bool)

(assert (=> b!500893 m!481511))

(declare-fun m!481513 () Bool)

(assert (=> b!500886 m!481513))

(assert (=> b!500886 m!481513))

(declare-fun m!481515 () Bool)

(assert (=> b!500886 m!481515))

(declare-fun m!481517 () Bool)

(assert (=> b!500892 m!481517))

(assert (=> b!500889 m!481513))

(assert (=> b!500889 m!481513))

(declare-fun m!481519 () Bool)

(assert (=> b!500889 m!481519))

(declare-fun m!481521 () Bool)

(assert (=> b!500895 m!481521))

(declare-fun m!481523 () Bool)

(assert (=> b!500890 m!481523))

(declare-fun m!481525 () Bool)

(assert (=> b!500896 m!481525))

(declare-fun m!481527 () Bool)

(assert (=> b!500896 m!481527))

(declare-fun m!481529 () Bool)

(assert (=> b!500896 m!481529))

(declare-fun m!481531 () Bool)

(assert (=> b!500896 m!481531))

(assert (=> b!500896 m!481513))

(declare-fun m!481533 () Bool)

(assert (=> b!500896 m!481533))

(declare-fun m!481535 () Bool)

(assert (=> b!500896 m!481535))

(assert (=> b!500896 m!481513))

(declare-fun m!481537 () Bool)

(assert (=> b!500896 m!481537))

(declare-fun m!481539 () Bool)

(assert (=> b!500896 m!481539))

(assert (=> b!500896 m!481513))

(declare-fun m!481541 () Bool)

(assert (=> b!500888 m!481541))

(declare-fun m!481543 () Bool)

(assert (=> b!500888 m!481543))

(assert (=> b!500888 m!481513))

(declare-fun m!481545 () Bool)

(assert (=> b!500891 m!481545))

(declare-fun m!481547 () Bool)

(assert (=> start!45486 m!481547))

(declare-fun m!481549 () Bool)

(assert (=> start!45486 m!481549))

(check-sat (not b!500889) (not b!500892) (not b!500888) (not b!500891) (not start!45486) (not b!500886) (not b!500895) (not b!500890) (not b!500896) (not b!500893) (not b!500897))
(check-sat)
(get-model)

(declare-fun d!78321 () Bool)

(declare-fun res!302848 () Bool)

(declare-fun e!293462 () Bool)

(assert (=> d!78321 (=> res!302848 e!293462)))

(assert (=> d!78321 (= res!302848 (bvsge j!176 (size!15907 a!3235)))))

(assert (=> d!78321 (= (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524) e!293462)))

(declare-fun b!500992 () Bool)

(declare-fun e!293461 () Bool)

(assert (=> b!500992 (= e!293462 e!293461)))

(declare-fun c!59349 () Bool)

(assert (=> b!500992 (= c!59349 (validKeyInArray!0 (select (arr!15542 a!3235) j!176)))))

(declare-fun b!500993 () Bool)

(declare-fun e!293463 () Bool)

(assert (=> b!500993 (= e!293461 e!293463)))

(declare-fun lt!227441 () (_ BitVec 64))

(assert (=> b!500993 (= lt!227441 (select (arr!15542 a!3235) j!176))))

(declare-fun lt!227442 () Unit!15094)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!32321 (_ BitVec 64) (_ BitVec 32)) Unit!15094)

(assert (=> b!500993 (= lt!227442 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!227441 j!176))))

(assert (=> b!500993 (arrayContainsKey!0 a!3235 lt!227441 #b00000000000000000000000000000000)))

(declare-fun lt!227443 () Unit!15094)

(assert (=> b!500993 (= lt!227443 lt!227442)))

(declare-fun res!302849 () Bool)

(assert (=> b!500993 (= res!302849 (= (seekEntryOrOpen!0 (select (arr!15542 a!3235) j!176) a!3235 mask!3524) (Found!4006 j!176)))))

(assert (=> b!500993 (=> (not res!302849) (not e!293463))))

(declare-fun bm!31426 () Bool)

(declare-fun call!31429 () Bool)

(assert (=> bm!31426 (= call!31429 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!176 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!500994 () Bool)

(assert (=> b!500994 (= e!293461 call!31429)))

(declare-fun b!500995 () Bool)

(assert (=> b!500995 (= e!293463 call!31429)))

(assert (= (and d!78321 (not res!302848)) b!500992))

(assert (= (and b!500992 c!59349) b!500993))

(assert (= (and b!500992 (not c!59349)) b!500994))

(assert (= (and b!500993 res!302849) b!500995))

(assert (= (or b!500995 b!500994) bm!31426))

(assert (=> b!500992 m!481513))

(assert (=> b!500992 m!481513))

(assert (=> b!500992 m!481515))

(assert (=> b!500993 m!481513))

(declare-fun m!481639 () Bool)

(assert (=> b!500993 m!481639))

(declare-fun m!481641 () Bool)

(assert (=> b!500993 m!481641))

(assert (=> b!500993 m!481513))

(assert (=> b!500993 m!481519))

(declare-fun m!481643 () Bool)

(assert (=> bm!31426 m!481643))

(assert (=> b!500896 d!78321))

(declare-fun b!501014 () Bool)

(declare-fun e!293475 () SeekEntryResult!4006)

(assert (=> b!501014 (= e!293475 (Intermediate!4006 false lt!227370 #b00000000000000000000000000000000))))

(declare-fun b!501015 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!501015 (= e!293475 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!227370 #b00000000000000000000000000000000 mask!3524) (select (arr!15542 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!501016 () Bool)

(declare-fun lt!227448 () SeekEntryResult!4006)

(assert (=> b!501016 (and (bvsge (index!18208 lt!227448) #b00000000000000000000000000000000) (bvslt (index!18208 lt!227448) (size!15907 a!3235)))))

(declare-fun e!293478 () Bool)

(assert (=> b!501016 (= e!293478 (= (select (arr!15542 a!3235) (index!18208 lt!227448)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!501017 () Bool)

(declare-fun e!293474 () Bool)

(assert (=> b!501017 (= e!293474 (bvsge (x!47246 lt!227448) #b01111111111111111111111111111110))))

(declare-fun b!501018 () Bool)

(declare-fun e!293477 () SeekEntryResult!4006)

(assert (=> b!501018 (= e!293477 e!293475)))

(declare-fun c!59357 () Bool)

(declare-fun lt!227449 () (_ BitVec 64))

(assert (=> b!501018 (= c!59357 (or (= lt!227449 (select (arr!15542 a!3235) j!176)) (= (bvadd lt!227449 lt!227449) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!78323 () Bool)

(assert (=> d!78323 e!293474))

(declare-fun c!59358 () Bool)

(assert (=> d!78323 (= c!59358 (and ((_ is Intermediate!4006) lt!227448) (undefined!4818 lt!227448)))))

(assert (=> d!78323 (= lt!227448 e!293477)))

(declare-fun c!59356 () Bool)

(assert (=> d!78323 (= c!59356 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!78323 (= lt!227449 (select (arr!15542 a!3235) lt!227370))))

(assert (=> d!78323 (validMask!0 mask!3524)))

(assert (=> d!78323 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!227370 (select (arr!15542 a!3235) j!176) a!3235 mask!3524) lt!227448)))

(declare-fun b!501019 () Bool)

(assert (=> b!501019 (= e!293477 (Intermediate!4006 true lt!227370 #b00000000000000000000000000000000))))

(declare-fun b!501020 () Bool)

(declare-fun e!293476 () Bool)

(assert (=> b!501020 (= e!293474 e!293476)))

(declare-fun res!302856 () Bool)

(assert (=> b!501020 (= res!302856 (and ((_ is Intermediate!4006) lt!227448) (not (undefined!4818 lt!227448)) (bvslt (x!47246 lt!227448) #b01111111111111111111111111111110) (bvsge (x!47246 lt!227448) #b00000000000000000000000000000000) (bvsge (x!47246 lt!227448) #b00000000000000000000000000000000)))))

(assert (=> b!501020 (=> (not res!302856) (not e!293476))))

(declare-fun b!501021 () Bool)

(assert (=> b!501021 (and (bvsge (index!18208 lt!227448) #b00000000000000000000000000000000) (bvslt (index!18208 lt!227448) (size!15907 a!3235)))))

(declare-fun res!302857 () Bool)

(assert (=> b!501021 (= res!302857 (= (select (arr!15542 a!3235) (index!18208 lt!227448)) (select (arr!15542 a!3235) j!176)))))

(assert (=> b!501021 (=> res!302857 e!293478)))

(assert (=> b!501021 (= e!293476 e!293478)))

(declare-fun b!501022 () Bool)

(assert (=> b!501022 (and (bvsge (index!18208 lt!227448) #b00000000000000000000000000000000) (bvslt (index!18208 lt!227448) (size!15907 a!3235)))))

(declare-fun res!302858 () Bool)

(assert (=> b!501022 (= res!302858 (= (select (arr!15542 a!3235) (index!18208 lt!227448)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!501022 (=> res!302858 e!293478)))

(assert (= (and d!78323 c!59356) b!501019))

(assert (= (and d!78323 (not c!59356)) b!501018))

(assert (= (and b!501018 c!59357) b!501014))

(assert (= (and b!501018 (not c!59357)) b!501015))

(assert (= (and d!78323 c!59358) b!501017))

(assert (= (and d!78323 (not c!59358)) b!501020))

(assert (= (and b!501020 res!302856) b!501021))

(assert (= (and b!501021 (not res!302857)) b!501022))

(assert (= (and b!501022 (not res!302858)) b!501016))

(declare-fun m!481645 () Bool)

(assert (=> d!78323 m!481645))

(assert (=> d!78323 m!481547))

(declare-fun m!481647 () Bool)

(assert (=> b!501015 m!481647))

(assert (=> b!501015 m!481647))

(assert (=> b!501015 m!481513))

(declare-fun m!481649 () Bool)

(assert (=> b!501015 m!481649))

(declare-fun m!481651 () Bool)

(assert (=> b!501022 m!481651))

(assert (=> b!501021 m!481651))

(assert (=> b!501016 m!481651))

(assert (=> b!500896 d!78323))

(declare-fun b!501023 () Bool)

(declare-fun e!293480 () SeekEntryResult!4006)

(assert (=> b!501023 (= e!293480 (Intermediate!4006 false lt!227368 #b00000000000000000000000000000000))))

(declare-fun b!501024 () Bool)

(assert (=> b!501024 (= e!293480 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!227368 #b00000000000000000000000000000000 mask!3524) lt!227365 lt!227373 mask!3524))))

(declare-fun b!501025 () Bool)

(declare-fun lt!227450 () SeekEntryResult!4006)

(assert (=> b!501025 (and (bvsge (index!18208 lt!227450) #b00000000000000000000000000000000) (bvslt (index!18208 lt!227450) (size!15907 lt!227373)))))

(declare-fun e!293483 () Bool)

(assert (=> b!501025 (= e!293483 (= (select (arr!15542 lt!227373) (index!18208 lt!227450)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!501026 () Bool)

(declare-fun e!293479 () Bool)

(assert (=> b!501026 (= e!293479 (bvsge (x!47246 lt!227450) #b01111111111111111111111111111110))))

(declare-fun b!501027 () Bool)

(declare-fun e!293482 () SeekEntryResult!4006)

(assert (=> b!501027 (= e!293482 e!293480)))

(declare-fun c!59360 () Bool)

(declare-fun lt!227451 () (_ BitVec 64))

(assert (=> b!501027 (= c!59360 (or (= lt!227451 lt!227365) (= (bvadd lt!227451 lt!227451) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!78325 () Bool)

(assert (=> d!78325 e!293479))

(declare-fun c!59361 () Bool)

(assert (=> d!78325 (= c!59361 (and ((_ is Intermediate!4006) lt!227450) (undefined!4818 lt!227450)))))

(assert (=> d!78325 (= lt!227450 e!293482)))

(declare-fun c!59359 () Bool)

(assert (=> d!78325 (= c!59359 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!78325 (= lt!227451 (select (arr!15542 lt!227373) lt!227368))))

(assert (=> d!78325 (validMask!0 mask!3524)))

(assert (=> d!78325 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!227368 lt!227365 lt!227373 mask!3524) lt!227450)))

(declare-fun b!501028 () Bool)

(assert (=> b!501028 (= e!293482 (Intermediate!4006 true lt!227368 #b00000000000000000000000000000000))))

(declare-fun b!501029 () Bool)

(declare-fun e!293481 () Bool)

(assert (=> b!501029 (= e!293479 e!293481)))

(declare-fun res!302859 () Bool)

(assert (=> b!501029 (= res!302859 (and ((_ is Intermediate!4006) lt!227450) (not (undefined!4818 lt!227450)) (bvslt (x!47246 lt!227450) #b01111111111111111111111111111110) (bvsge (x!47246 lt!227450) #b00000000000000000000000000000000) (bvsge (x!47246 lt!227450) #b00000000000000000000000000000000)))))

(assert (=> b!501029 (=> (not res!302859) (not e!293481))))

(declare-fun b!501030 () Bool)

(assert (=> b!501030 (and (bvsge (index!18208 lt!227450) #b00000000000000000000000000000000) (bvslt (index!18208 lt!227450) (size!15907 lt!227373)))))

(declare-fun res!302860 () Bool)

(assert (=> b!501030 (= res!302860 (= (select (arr!15542 lt!227373) (index!18208 lt!227450)) lt!227365))))

(assert (=> b!501030 (=> res!302860 e!293483)))

(assert (=> b!501030 (= e!293481 e!293483)))

(declare-fun b!501031 () Bool)

(assert (=> b!501031 (and (bvsge (index!18208 lt!227450) #b00000000000000000000000000000000) (bvslt (index!18208 lt!227450) (size!15907 lt!227373)))))

(declare-fun res!302861 () Bool)

(assert (=> b!501031 (= res!302861 (= (select (arr!15542 lt!227373) (index!18208 lt!227450)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!501031 (=> res!302861 e!293483)))

(assert (= (and d!78325 c!59359) b!501028))

(assert (= (and d!78325 (not c!59359)) b!501027))

(assert (= (and b!501027 c!59360) b!501023))

(assert (= (and b!501027 (not c!59360)) b!501024))

(assert (= (and d!78325 c!59361) b!501026))

(assert (= (and d!78325 (not c!59361)) b!501029))

(assert (= (and b!501029 res!302859) b!501030))

(assert (= (and b!501030 (not res!302860)) b!501031))

(assert (= (and b!501031 (not res!302861)) b!501025))

(declare-fun m!481653 () Bool)

(assert (=> d!78325 m!481653))

(assert (=> d!78325 m!481547))

(declare-fun m!481655 () Bool)

(assert (=> b!501024 m!481655))

(assert (=> b!501024 m!481655))

(declare-fun m!481657 () Bool)

(assert (=> b!501024 m!481657))

(declare-fun m!481659 () Bool)

(assert (=> b!501031 m!481659))

(assert (=> b!501030 m!481659))

(assert (=> b!501025 m!481659))

(assert (=> b!500896 d!78325))

(declare-fun d!78329 () Bool)

(assert (=> d!78329 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!227454 () Unit!15094)

(declare-fun choose!38 (array!32321 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15094)

(assert (=> d!78329 (= lt!227454 (choose!38 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (=> d!78329 (validMask!0 mask!3524)))

(assert (=> d!78329 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176) lt!227454)))

(declare-fun bs!15898 () Bool)

(assert (= bs!15898 d!78329))

(assert (=> bs!15898 m!481535))

(declare-fun m!481661 () Bool)

(assert (=> bs!15898 m!481661))

(assert (=> bs!15898 m!481547))

(assert (=> b!500896 d!78329))

(declare-fun d!78335 () Bool)

(declare-fun lt!227460 () (_ BitVec 32))

(declare-fun lt!227459 () (_ BitVec 32))

(assert (=> d!78335 (= lt!227460 (bvmul (bvxor lt!227459 (bvlshr lt!227459 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!78335 (= lt!227459 ((_ extract 31 0) (bvand (bvxor lt!227365 (bvlshr lt!227365 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!78335 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!302862 (let ((h!10612 ((_ extract 31 0) (bvand (bvxor lt!227365 (bvlshr lt!227365 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!47250 (bvmul (bvxor h!10612 (bvlshr h!10612 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!47250 (bvlshr x!47250 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!302862 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!302862 #b00000000000000000000000000000000))))))

(assert (=> d!78335 (= (toIndex!0 lt!227365 mask!3524) (bvand (bvxor lt!227460 (bvlshr lt!227460 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!500896 d!78335))

(declare-fun d!78337 () Bool)

(declare-fun lt!227462 () (_ BitVec 32))

(declare-fun lt!227461 () (_ BitVec 32))

(assert (=> d!78337 (= lt!227462 (bvmul (bvxor lt!227461 (bvlshr lt!227461 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!78337 (= lt!227461 ((_ extract 31 0) (bvand (bvxor (select (arr!15542 a!3235) j!176) (bvlshr (select (arr!15542 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!78337 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!302862 (let ((h!10612 ((_ extract 31 0) (bvand (bvxor (select (arr!15542 a!3235) j!176) (bvlshr (select (arr!15542 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!47250 (bvmul (bvxor h!10612 (bvlshr h!10612 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!47250 (bvlshr x!47250 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!302862 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!302862 #b00000000000000000000000000000000))))))

(assert (=> d!78337 (= (toIndex!0 (select (arr!15542 a!3235) j!176) mask!3524) (bvand (bvxor lt!227462 (bvlshr lt!227462 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!500896 d!78337))

(declare-fun d!78339 () Bool)

(assert (=> d!78339 (= (validKeyInArray!0 k0!2280) (and (not (= k0!2280 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2280 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!500891 d!78339))

(declare-fun d!78341 () Bool)

(assert (=> d!78341 (= (validKeyInArray!0 (select (arr!15542 a!3235) j!176)) (and (not (= (select (arr!15542 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15542 a!3235) j!176) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!500886 d!78341))

(declare-fun b!501080 () Bool)

(declare-fun e!293512 () SeekEntryResult!4006)

(declare-fun lt!227485 () SeekEntryResult!4006)

(assert (=> b!501080 (= e!293512 (Found!4006 (index!18208 lt!227485)))))

(declare-fun b!501081 () Bool)

(declare-fun c!59385 () Bool)

(declare-fun lt!227486 () (_ BitVec 64))

(assert (=> b!501081 (= c!59385 (= lt!227486 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!293513 () SeekEntryResult!4006)

(assert (=> b!501081 (= e!293512 e!293513)))

(declare-fun b!501082 () Bool)

(assert (=> b!501082 (= e!293513 (MissingZero!4006 (index!18208 lt!227485)))))

(declare-fun b!501083 () Bool)

(declare-fun e!293511 () SeekEntryResult!4006)

(assert (=> b!501083 (= e!293511 Undefined!4006)))

(declare-fun b!501084 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32321 (_ BitVec 32)) SeekEntryResult!4006)

(assert (=> b!501084 (= e!293513 (seekKeyOrZeroReturnVacant!0 (x!47246 lt!227485) (index!18208 lt!227485) (index!18208 lt!227485) (select (arr!15542 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!501085 () Bool)

(assert (=> b!501085 (= e!293511 e!293512)))

(assert (=> b!501085 (= lt!227486 (select (arr!15542 a!3235) (index!18208 lt!227485)))))

(declare-fun c!59383 () Bool)

(assert (=> b!501085 (= c!59383 (= lt!227486 (select (arr!15542 a!3235) j!176)))))

(declare-fun d!78343 () Bool)

(declare-fun lt!227484 () SeekEntryResult!4006)

(assert (=> d!78343 (and (or ((_ is Undefined!4006) lt!227484) (not ((_ is Found!4006) lt!227484)) (and (bvsge (index!18207 lt!227484) #b00000000000000000000000000000000) (bvslt (index!18207 lt!227484) (size!15907 a!3235)))) (or ((_ is Undefined!4006) lt!227484) ((_ is Found!4006) lt!227484) (not ((_ is MissingZero!4006) lt!227484)) (and (bvsge (index!18206 lt!227484) #b00000000000000000000000000000000) (bvslt (index!18206 lt!227484) (size!15907 a!3235)))) (or ((_ is Undefined!4006) lt!227484) ((_ is Found!4006) lt!227484) ((_ is MissingZero!4006) lt!227484) (not ((_ is MissingVacant!4006) lt!227484)) (and (bvsge (index!18209 lt!227484) #b00000000000000000000000000000000) (bvslt (index!18209 lt!227484) (size!15907 a!3235)))) (or ((_ is Undefined!4006) lt!227484) (ite ((_ is Found!4006) lt!227484) (= (select (arr!15542 a!3235) (index!18207 lt!227484)) (select (arr!15542 a!3235) j!176)) (ite ((_ is MissingZero!4006) lt!227484) (= (select (arr!15542 a!3235) (index!18206 lt!227484)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!4006) lt!227484) (= (select (arr!15542 a!3235) (index!18209 lt!227484)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!78343 (= lt!227484 e!293511)))

(declare-fun c!59384 () Bool)

(assert (=> d!78343 (= c!59384 (and ((_ is Intermediate!4006) lt!227485) (undefined!4818 lt!227485)))))

(assert (=> d!78343 (= lt!227485 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15542 a!3235) j!176) mask!3524) (select (arr!15542 a!3235) j!176) a!3235 mask!3524))))

(assert (=> d!78343 (validMask!0 mask!3524)))

(assert (=> d!78343 (= (seekEntryOrOpen!0 (select (arr!15542 a!3235) j!176) a!3235 mask!3524) lt!227484)))

(assert (= (and d!78343 c!59384) b!501083))

(assert (= (and d!78343 (not c!59384)) b!501085))

(assert (= (and b!501085 c!59383) b!501080))

(assert (= (and b!501085 (not c!59383)) b!501081))

(assert (= (and b!501081 c!59385) b!501082))

(assert (= (and b!501081 (not c!59385)) b!501084))

(assert (=> b!501084 m!481513))

(declare-fun m!481679 () Bool)

(assert (=> b!501084 m!481679))

(declare-fun m!481681 () Bool)

(assert (=> b!501085 m!481681))

(assert (=> d!78343 m!481547))

(assert (=> d!78343 m!481513))

(assert (=> d!78343 m!481533))

(declare-fun m!481683 () Bool)

(assert (=> d!78343 m!481683))

(declare-fun m!481685 () Bool)

(assert (=> d!78343 m!481685))

(assert (=> d!78343 m!481533))

(assert (=> d!78343 m!481513))

(declare-fun m!481687 () Bool)

(assert (=> d!78343 m!481687))

(declare-fun m!481689 () Bool)

(assert (=> d!78343 m!481689))

(assert (=> b!500889 d!78343))

(declare-fun d!78357 () Bool)

(declare-fun res!302879 () Bool)

(declare-fun e!293530 () Bool)

(assert (=> d!78357 (=> res!302879 e!293530)))

(assert (=> d!78357 (= res!302879 (= (select (arr!15542 a!3235) #b00000000000000000000000000000000) k0!2280))))

(assert (=> d!78357 (= (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000) e!293530)))

(declare-fun b!501108 () Bool)

(declare-fun e!293531 () Bool)

(assert (=> b!501108 (= e!293530 e!293531)))

(declare-fun res!302880 () Bool)

(assert (=> b!501108 (=> (not res!302880) (not e!293531))))

(assert (=> b!501108 (= res!302880 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!15907 a!3235)))))

(declare-fun b!501109 () Bool)

(assert (=> b!501109 (= e!293531 (arrayContainsKey!0 a!3235 k0!2280 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!78357 (not res!302879)) b!501108))

(assert (= (and b!501108 res!302880) b!501109))

(declare-fun m!481705 () Bool)

(assert (=> d!78357 m!481705))

(declare-fun m!481707 () Bool)

(assert (=> b!501109 m!481707))

(assert (=> b!500895 d!78357))

(declare-fun b!501110 () Bool)

(declare-fun e!293533 () SeekEntryResult!4006)

(declare-fun lt!227500 () SeekEntryResult!4006)

(assert (=> b!501110 (= e!293533 (Found!4006 (index!18208 lt!227500)))))

(declare-fun b!501111 () Bool)

(declare-fun c!59394 () Bool)

(declare-fun lt!227501 () (_ BitVec 64))

(assert (=> b!501111 (= c!59394 (= lt!227501 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!293534 () SeekEntryResult!4006)

(assert (=> b!501111 (= e!293533 e!293534)))

(declare-fun b!501112 () Bool)

(assert (=> b!501112 (= e!293534 (MissingZero!4006 (index!18208 lt!227500)))))

(declare-fun b!501113 () Bool)

(declare-fun e!293532 () SeekEntryResult!4006)

(assert (=> b!501113 (= e!293532 Undefined!4006)))

(declare-fun b!501114 () Bool)

(assert (=> b!501114 (= e!293534 (seekKeyOrZeroReturnVacant!0 (x!47246 lt!227500) (index!18208 lt!227500) (index!18208 lt!227500) k0!2280 a!3235 mask!3524))))

(declare-fun b!501115 () Bool)

(assert (=> b!501115 (= e!293532 e!293533)))

(assert (=> b!501115 (= lt!227501 (select (arr!15542 a!3235) (index!18208 lt!227500)))))

(declare-fun c!59392 () Bool)

(assert (=> b!501115 (= c!59392 (= lt!227501 k0!2280))))

(declare-fun d!78361 () Bool)

(declare-fun lt!227499 () SeekEntryResult!4006)

(assert (=> d!78361 (and (or ((_ is Undefined!4006) lt!227499) (not ((_ is Found!4006) lt!227499)) (and (bvsge (index!18207 lt!227499) #b00000000000000000000000000000000) (bvslt (index!18207 lt!227499) (size!15907 a!3235)))) (or ((_ is Undefined!4006) lt!227499) ((_ is Found!4006) lt!227499) (not ((_ is MissingZero!4006) lt!227499)) (and (bvsge (index!18206 lt!227499) #b00000000000000000000000000000000) (bvslt (index!18206 lt!227499) (size!15907 a!3235)))) (or ((_ is Undefined!4006) lt!227499) ((_ is Found!4006) lt!227499) ((_ is MissingZero!4006) lt!227499) (not ((_ is MissingVacant!4006) lt!227499)) (and (bvsge (index!18209 lt!227499) #b00000000000000000000000000000000) (bvslt (index!18209 lt!227499) (size!15907 a!3235)))) (or ((_ is Undefined!4006) lt!227499) (ite ((_ is Found!4006) lt!227499) (= (select (arr!15542 a!3235) (index!18207 lt!227499)) k0!2280) (ite ((_ is MissingZero!4006) lt!227499) (= (select (arr!15542 a!3235) (index!18206 lt!227499)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!4006) lt!227499) (= (select (arr!15542 a!3235) (index!18209 lt!227499)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!78361 (= lt!227499 e!293532)))

(declare-fun c!59393 () Bool)

(assert (=> d!78361 (= c!59393 (and ((_ is Intermediate!4006) lt!227500) (undefined!4818 lt!227500)))))

(assert (=> d!78361 (= lt!227500 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2280 mask!3524) k0!2280 a!3235 mask!3524))))

(assert (=> d!78361 (validMask!0 mask!3524)))

(assert (=> d!78361 (= (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524) lt!227499)))

(assert (= (and d!78361 c!59393) b!501113))

(assert (= (and d!78361 (not c!59393)) b!501115))

(assert (= (and b!501115 c!59392) b!501110))

(assert (= (and b!501115 (not c!59392)) b!501111))

(assert (= (and b!501111 c!59394) b!501112))

(assert (= (and b!501111 (not c!59394)) b!501114))

(declare-fun m!481719 () Bool)

(assert (=> b!501114 m!481719))

(declare-fun m!481721 () Bool)

(assert (=> b!501115 m!481721))

(assert (=> d!78361 m!481547))

(declare-fun m!481723 () Bool)

(assert (=> d!78361 m!481723))

(declare-fun m!481725 () Bool)

(assert (=> d!78361 m!481725))

(declare-fun m!481727 () Bool)

(assert (=> d!78361 m!481727))

(assert (=> d!78361 m!481723))

(declare-fun m!481729 () Bool)

(assert (=> d!78361 m!481729))

(declare-fun m!481731 () Bool)

(assert (=> d!78361 m!481731))

(assert (=> b!500890 d!78361))

(declare-fun d!78365 () Bool)

(declare-fun res!302882 () Bool)

(declare-fun e!293536 () Bool)

(assert (=> d!78365 (=> res!302882 e!293536)))

(assert (=> d!78365 (= res!302882 (bvsge #b00000000000000000000000000000000 (size!15907 a!3235)))))

(assert (=> d!78365 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524) e!293536)))

(declare-fun b!501116 () Bool)

(declare-fun e!293535 () Bool)

(assert (=> b!501116 (= e!293536 e!293535)))

(declare-fun c!59395 () Bool)

(assert (=> b!501116 (= c!59395 (validKeyInArray!0 (select (arr!15542 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!501117 () Bool)

(declare-fun e!293537 () Bool)

(assert (=> b!501117 (= e!293535 e!293537)))

(declare-fun lt!227502 () (_ BitVec 64))

(assert (=> b!501117 (= lt!227502 (select (arr!15542 a!3235) #b00000000000000000000000000000000))))

(declare-fun lt!227503 () Unit!15094)

(assert (=> b!501117 (= lt!227503 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!227502 #b00000000000000000000000000000000))))

(assert (=> b!501117 (arrayContainsKey!0 a!3235 lt!227502 #b00000000000000000000000000000000)))

(declare-fun lt!227504 () Unit!15094)

(assert (=> b!501117 (= lt!227504 lt!227503)))

(declare-fun res!302883 () Bool)

(assert (=> b!501117 (= res!302883 (= (seekEntryOrOpen!0 (select (arr!15542 a!3235) #b00000000000000000000000000000000) a!3235 mask!3524) (Found!4006 #b00000000000000000000000000000000)))))

(assert (=> b!501117 (=> (not res!302883) (not e!293537))))

(declare-fun bm!31430 () Bool)

(declare-fun call!31433 () Bool)

(assert (=> bm!31430 (= call!31433 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!501118 () Bool)

(assert (=> b!501118 (= e!293535 call!31433)))

(declare-fun b!501119 () Bool)

(assert (=> b!501119 (= e!293537 call!31433)))

(assert (= (and d!78365 (not res!302882)) b!501116))

(assert (= (and b!501116 c!59395) b!501117))

(assert (= (and b!501116 (not c!59395)) b!501118))

(assert (= (and b!501117 res!302883) b!501119))

(assert (= (or b!501119 b!501118) bm!31430))

(assert (=> b!501116 m!481705))

(assert (=> b!501116 m!481705))

(declare-fun m!481733 () Bool)

(assert (=> b!501116 m!481733))

(assert (=> b!501117 m!481705))

(declare-fun m!481735 () Bool)

(assert (=> b!501117 m!481735))

(declare-fun m!481737 () Bool)

(assert (=> b!501117 m!481737))

(assert (=> b!501117 m!481705))

(declare-fun m!481739 () Bool)

(assert (=> b!501117 m!481739))

(declare-fun m!481741 () Bool)

(assert (=> bm!31430 m!481741))

(assert (=> b!500893 d!78365))

(declare-fun d!78367 () Bool)

(assert (=> d!78367 (= (index!18208 lt!227371) i!1204)))

(declare-fun lt!227507 () Unit!15094)

(declare-fun choose!104 (array!32321 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15094)

(assert (=> d!78367 (= lt!227507 (choose!104 a!3235 i!1204 k0!2280 j!176 lt!227370 #b00000000000000000000000000000000 (index!18208 lt!227371) (x!47246 lt!227371) mask!3524))))

(assert (=> d!78367 (validMask!0 mask!3524)))

(assert (=> d!78367 (= (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k0!2280 j!176 lt!227370 #b00000000000000000000000000000000 (index!18208 lt!227371) (x!47246 lt!227371) mask!3524) lt!227507)))

(declare-fun bs!15899 () Bool)

(assert (= bs!15899 d!78367))

(declare-fun m!481743 () Bool)

(assert (=> bs!15899 m!481743))

(assert (=> bs!15899 m!481547))

(assert (=> b!500888 d!78367))

(declare-fun d!78369 () Bool)

(assert (=> d!78369 (= (validMask!0 mask!3524) (and (or (= mask!3524 #b00000000000000000000000000000111) (= mask!3524 #b00000000000000000000000000001111) (= mask!3524 #b00000000000000000000000000011111) (= mask!3524 #b00000000000000000000000000111111) (= mask!3524 #b00000000000000000000000001111111) (= mask!3524 #b00000000000000000000000011111111) (= mask!3524 #b00000000000000000000000111111111) (= mask!3524 #b00000000000000000000001111111111) (= mask!3524 #b00000000000000000000011111111111) (= mask!3524 #b00000000000000000000111111111111) (= mask!3524 #b00000000000000000001111111111111) (= mask!3524 #b00000000000000000011111111111111) (= mask!3524 #b00000000000000000111111111111111) (= mask!3524 #b00000000000000001111111111111111) (= mask!3524 #b00000000000000011111111111111111) (= mask!3524 #b00000000000000111111111111111111) (= mask!3524 #b00000000000001111111111111111111) (= mask!3524 #b00000000000011111111111111111111) (= mask!3524 #b00000000000111111111111111111111) (= mask!3524 #b00000000001111111111111111111111) (= mask!3524 #b00000000011111111111111111111111) (= mask!3524 #b00000000111111111111111111111111) (= mask!3524 #b00000001111111111111111111111111) (= mask!3524 #b00000011111111111111111111111111) (= mask!3524 #b00000111111111111111111111111111) (= mask!3524 #b00001111111111111111111111111111) (= mask!3524 #b00011111111111111111111111111111) (= mask!3524 #b00111111111111111111111111111111)) (bvsle mask!3524 #b00111111111111111111111111111111)))))

(assert (=> start!45486 d!78369))

(declare-fun d!78375 () Bool)

(assert (=> d!78375 (= (array_inv!11425 a!3235) (bvsge (size!15907 a!3235) #b00000000000000000000000000000000))))

(assert (=> start!45486 d!78375))

(declare-fun d!78377 () Bool)

(declare-fun e!293562 () Bool)

(assert (=> d!78377 e!293562))

(declare-fun res!302898 () Bool)

(assert (=> d!78377 (=> (not res!302898) (not e!293562))))

(assert (=> d!78377 (= res!302898 (and (or (bvslt i!1204 #b00000000000000000000000000000000) (bvsge i!1204 (size!15907 a!3235)) (and (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15907 a!3235)))) (or (bvslt i!1204 #b00000000000000000000000000000000) (bvsge i!1204 (size!15907 a!3235)) (and (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15907 a!3235)))) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15907 a!3235))))))

(declare-fun lt!227529 () Unit!15094)

(declare-fun choose!47 (array!32321 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15094)

(assert (=> d!78377 (= lt!227529 (choose!47 a!3235 i!1204 k0!2280 j!176 lt!227370 #b00000000000000000000000000000000 (index!18208 lt!227371) (x!47246 lt!227371) mask!3524))))

(assert (=> d!78377 (validMask!0 mask!3524)))

(assert (=> d!78377 (= (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!227370 #b00000000000000000000000000000000 (index!18208 lt!227371) (x!47246 lt!227371) mask!3524) lt!227529)))

(declare-fun b!501160 () Bool)

(assert (=> b!501160 (= e!293562 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!227370 (select (store (arr!15542 a!3235) i!1204 k0!2280) j!176) (array!32322 (store (arr!15542 a!3235) i!1204 k0!2280) (size!15907 a!3235)) mask!3524) (Intermediate!4006 false (index!18208 lt!227371) (x!47246 lt!227371))))))

(assert (= (and d!78377 res!302898) b!501160))

(declare-fun m!481753 () Bool)

(assert (=> d!78377 m!481753))

(assert (=> d!78377 m!481547))

(assert (=> b!501160 m!481527))

(assert (=> b!501160 m!481531))

(assert (=> b!501160 m!481531))

(declare-fun m!481759 () Bool)

(assert (=> b!501160 m!481759))

(assert (=> b!500897 d!78377))

(declare-fun b!501167 () Bool)

(declare-fun e!293567 () SeekEntryResult!4006)

(assert (=> b!501167 (= e!293567 (Intermediate!4006 false lt!227370 #b00000000000000000000000000000000))))

(declare-fun b!501168 () Bool)

(assert (=> b!501168 (= e!293567 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!227370 #b00000000000000000000000000000000 mask!3524) lt!227365 lt!227373 mask!3524))))

(declare-fun b!501169 () Bool)

(declare-fun lt!227533 () SeekEntryResult!4006)

(assert (=> b!501169 (and (bvsge (index!18208 lt!227533) #b00000000000000000000000000000000) (bvslt (index!18208 lt!227533) (size!15907 lt!227373)))))

(declare-fun e!293570 () Bool)

(assert (=> b!501169 (= e!293570 (= (select (arr!15542 lt!227373) (index!18208 lt!227533)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!501170 () Bool)

(declare-fun e!293566 () Bool)

(assert (=> b!501170 (= e!293566 (bvsge (x!47246 lt!227533) #b01111111111111111111111111111110))))

(declare-fun b!501171 () Bool)

(declare-fun e!293569 () SeekEntryResult!4006)

(assert (=> b!501171 (= e!293569 e!293567)))

(declare-fun c!59411 () Bool)

(declare-fun lt!227534 () (_ BitVec 64))

(assert (=> b!501171 (= c!59411 (or (= lt!227534 lt!227365) (= (bvadd lt!227534 lt!227534) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!78381 () Bool)

(assert (=> d!78381 e!293566))

(declare-fun c!59412 () Bool)

(assert (=> d!78381 (= c!59412 (and ((_ is Intermediate!4006) lt!227533) (undefined!4818 lt!227533)))))

(assert (=> d!78381 (= lt!227533 e!293569)))

(declare-fun c!59410 () Bool)

(assert (=> d!78381 (= c!59410 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!78381 (= lt!227534 (select (arr!15542 lt!227373) lt!227370))))

(assert (=> d!78381 (validMask!0 mask!3524)))

(assert (=> d!78381 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!227370 lt!227365 lt!227373 mask!3524) lt!227533)))

(declare-fun b!501172 () Bool)

(assert (=> b!501172 (= e!293569 (Intermediate!4006 true lt!227370 #b00000000000000000000000000000000))))

(declare-fun b!501173 () Bool)

(declare-fun e!293568 () Bool)

(assert (=> b!501173 (= e!293566 e!293568)))

(declare-fun res!302901 () Bool)

(assert (=> b!501173 (= res!302901 (and ((_ is Intermediate!4006) lt!227533) (not (undefined!4818 lt!227533)) (bvslt (x!47246 lt!227533) #b01111111111111111111111111111110) (bvsge (x!47246 lt!227533) #b00000000000000000000000000000000) (bvsge (x!47246 lt!227533) #b00000000000000000000000000000000)))))

(assert (=> b!501173 (=> (not res!302901) (not e!293568))))

(declare-fun b!501174 () Bool)

(assert (=> b!501174 (and (bvsge (index!18208 lt!227533) #b00000000000000000000000000000000) (bvslt (index!18208 lt!227533) (size!15907 lt!227373)))))

(declare-fun res!302902 () Bool)

(assert (=> b!501174 (= res!302902 (= (select (arr!15542 lt!227373) (index!18208 lt!227533)) lt!227365))))

(assert (=> b!501174 (=> res!302902 e!293570)))

(assert (=> b!501174 (= e!293568 e!293570)))

(declare-fun b!501175 () Bool)

(assert (=> b!501175 (and (bvsge (index!18208 lt!227533) #b00000000000000000000000000000000) (bvslt (index!18208 lt!227533) (size!15907 lt!227373)))))

(declare-fun res!302903 () Bool)

(assert (=> b!501175 (= res!302903 (= (select (arr!15542 lt!227373) (index!18208 lt!227533)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!501175 (=> res!302903 e!293570)))

(assert (= (and d!78381 c!59410) b!501172))

(assert (= (and d!78381 (not c!59410)) b!501171))

(assert (= (and b!501171 c!59411) b!501167))

(assert (= (and b!501171 (not c!59411)) b!501168))

(assert (= (and d!78381 c!59412) b!501170))

(assert (= (and d!78381 (not c!59412)) b!501173))

(assert (= (and b!501173 res!302901) b!501174))

(assert (= (and b!501174 (not res!302902)) b!501175))

(assert (= (and b!501175 (not res!302903)) b!501169))

(declare-fun m!481767 () Bool)

(assert (=> d!78381 m!481767))

(assert (=> d!78381 m!481547))

(assert (=> b!501168 m!481647))

(assert (=> b!501168 m!481647))

(declare-fun m!481769 () Bool)

(assert (=> b!501168 m!481769))

(declare-fun m!481771 () Bool)

(assert (=> b!501175 m!481771))

(assert (=> b!501174 m!481771))

(assert (=> b!501169 m!481771))

(assert (=> b!500897 d!78381))

(declare-fun b!501218 () Bool)

(declare-fun e!293601 () Bool)

(declare-fun e!293598 () Bool)

(assert (=> b!501218 (= e!293601 e!293598)))

(declare-fun res!302924 () Bool)

(assert (=> b!501218 (=> (not res!302924) (not e!293598))))

(declare-fun e!293600 () Bool)

(assert (=> b!501218 (= res!302924 (not e!293600))))

(declare-fun res!302922 () Bool)

(assert (=> b!501218 (=> (not res!302922) (not e!293600))))

(assert (=> b!501218 (= res!302922 (validKeyInArray!0 (select (arr!15542 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!501219 () Bool)

(declare-fun e!293599 () Bool)

(declare-fun call!31437 () Bool)

(assert (=> b!501219 (= e!293599 call!31437)))

(declare-fun d!78387 () Bool)

(declare-fun res!302923 () Bool)

(assert (=> d!78387 (=> res!302923 e!293601)))

(assert (=> d!78387 (= res!302923 (bvsge #b00000000000000000000000000000000 (size!15907 a!3235)))))

(assert (=> d!78387 (= (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9736) e!293601)))

(declare-fun b!501220 () Bool)

(declare-fun contains!2704 (List!9739 (_ BitVec 64)) Bool)

(assert (=> b!501220 (= e!293600 (contains!2704 Nil!9736 (select (arr!15542 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!501221 () Bool)

(assert (=> b!501221 (= e!293599 call!31437)))

(declare-fun b!501222 () Bool)

(assert (=> b!501222 (= e!293598 e!293599)))

(declare-fun c!59426 () Bool)

(assert (=> b!501222 (= c!59426 (validKeyInArray!0 (select (arr!15542 a!3235) #b00000000000000000000000000000000)))))

(declare-fun bm!31434 () Bool)

(assert (=> bm!31434 (= call!31437 (arrayNoDuplicates!0 a!3235 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!59426 (Cons!9735 (select (arr!15542 a!3235) #b00000000000000000000000000000000) Nil!9736) Nil!9736)))))

(assert (= (and d!78387 (not res!302923)) b!501218))

(assert (= (and b!501218 res!302922) b!501220))

(assert (= (and b!501218 res!302924) b!501222))

(assert (= (and b!501222 c!59426) b!501221))

(assert (= (and b!501222 (not c!59426)) b!501219))

(assert (= (or b!501221 b!501219) bm!31434))

(assert (=> b!501218 m!481705))

(assert (=> b!501218 m!481705))

(assert (=> b!501218 m!481733))

(assert (=> b!501220 m!481705))

(assert (=> b!501220 m!481705))

(declare-fun m!481803 () Bool)

(assert (=> b!501220 m!481803))

(assert (=> b!501222 m!481705))

(assert (=> b!501222 m!481705))

(assert (=> b!501222 m!481733))

(assert (=> bm!31434 m!481705))

(declare-fun m!481805 () Bool)

(assert (=> bm!31434 m!481805))

(assert (=> b!500892 d!78387))

(check-sat (not b!501168) (not b!501084) (not b!501116) (not b!501220) (not b!500993) (not d!78381) (not d!78343) (not b!501117) (not b!501015) (not b!501114) (not b!501024) (not b!501222) (not d!78361) (not d!78323) (not bm!31430) (not b!501109) (not d!78377) (not d!78329) (not b!501218) (not d!78367) (not d!78325) (not bm!31434) (not bm!31426) (not b!501160) (not b!500992))
(check-sat)
