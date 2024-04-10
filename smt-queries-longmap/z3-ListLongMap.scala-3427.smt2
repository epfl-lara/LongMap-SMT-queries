; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47618 () Bool)

(assert start!47618)

(declare-fun b!523828 () Bool)

(declare-fun res!320979 () Bool)

(declare-fun e!305508 () Bool)

(assert (=> b!523828 (=> (not res!320979) (not e!305508))))

(declare-datatypes ((array!33318 0))(
  ( (array!33319 (arr!16012 (Array (_ BitVec 32) (_ BitVec 64))) (size!16376 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33318)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33318 (_ BitVec 32)) Bool)

(assert (=> b!523828 (= res!320979 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!523829 () Bool)

(declare-fun res!320987 () Bool)

(declare-fun e!305506 () Bool)

(assert (=> b!523829 (=> (not res!320987) (not e!305506))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!523829 (= res!320987 (validKeyInArray!0 (select (arr!16012 a!3235) j!176)))))

(declare-fun e!305507 () Bool)

(declare-fun b!523830 () Bool)

(declare-datatypes ((SeekEntryResult!4479 0))(
  ( (MissingZero!4479 (index!20125 (_ BitVec 32))) (Found!4479 (index!20126 (_ BitVec 32))) (Intermediate!4479 (undefined!5291 Bool) (index!20127 (_ BitVec 32)) (x!49107 (_ BitVec 32))) (Undefined!4479) (MissingVacant!4479 (index!20128 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33318 (_ BitVec 32)) SeekEntryResult!4479)

(assert (=> b!523830 (= e!305507 (= (seekEntryOrOpen!0 (select (arr!16012 a!3235) j!176) a!3235 mask!3524) (Found!4479 j!176)))))

(declare-fun b!523831 () Bool)

(declare-fun res!320976 () Bool)

(assert (=> b!523831 (=> (not res!320976) (not e!305506))))

(declare-fun k0!2280 () (_ BitVec 64))

(assert (=> b!523831 (= res!320976 (validKeyInArray!0 k0!2280))))

(declare-fun b!523832 () Bool)

(declare-fun res!320981 () Bool)

(assert (=> b!523832 (=> (not res!320981) (not e!305506))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!523832 (= res!320981 (and (= (size!16376 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16376 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16376 a!3235)) (not (= i!1204 j!176))))))

(declare-fun res!320978 () Bool)

(assert (=> start!47618 (=> (not res!320978) (not e!305506))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47618 (= res!320978 (validMask!0 mask!3524))))

(assert (=> start!47618 e!305506))

(assert (=> start!47618 true))

(declare-fun array_inv!11808 (array!33318) Bool)

(assert (=> start!47618 (array_inv!11808 a!3235)))

(declare-fun b!523833 () Bool)

(declare-fun res!320977 () Bool)

(declare-fun e!305502 () Bool)

(assert (=> b!523833 (=> res!320977 e!305502)))

(declare-fun lt!240368 () SeekEntryResult!4479)

(get-info :version)

(assert (=> b!523833 (= res!320977 (or (undefined!5291 lt!240368) (not ((_ is Intermediate!4479) lt!240368))))))

(declare-fun b!523834 () Bool)

(declare-datatypes ((Unit!16368 0))(
  ( (Unit!16369) )
))
(declare-fun e!305503 () Unit!16368)

(declare-fun Unit!16370 () Unit!16368)

(assert (=> b!523834 (= e!305503 Unit!16370)))

(declare-fun lt!240367 () (_ BitVec 32))

(declare-fun lt!240369 () Unit!16368)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33318 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16368)

(assert (=> b!523834 (= lt!240369 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!240367 #b00000000000000000000000000000000 (index!20127 lt!240368) (x!49107 lt!240368) mask!3524))))

(declare-fun lt!240364 () array!33318)

(declare-fun lt!240363 () (_ BitVec 64))

(declare-fun res!320980 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33318 (_ BitVec 32)) SeekEntryResult!4479)

(assert (=> b!523834 (= res!320980 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!240367 lt!240363 lt!240364 mask!3524) (Intermediate!4479 false (index!20127 lt!240368) (x!49107 lt!240368))))))

(declare-fun e!305504 () Bool)

(assert (=> b!523834 (=> (not res!320980) (not e!305504))))

(assert (=> b!523834 e!305504))

(declare-fun b!523835 () Bool)

(assert (=> b!523835 (= e!305504 false)))

(declare-fun b!523836 () Bool)

(assert (=> b!523836 (= e!305506 e!305508)))

(declare-fun res!320984 () Bool)

(assert (=> b!523836 (=> (not res!320984) (not e!305508))))

(declare-fun lt!240366 () SeekEntryResult!4479)

(assert (=> b!523836 (= res!320984 (or (= lt!240366 (MissingZero!4479 i!1204)) (= lt!240366 (MissingVacant!4479 i!1204))))))

(assert (=> b!523836 (= lt!240366 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!523837 () Bool)

(declare-fun res!320986 () Bool)

(assert (=> b!523837 (=> (not res!320986) (not e!305508))))

(declare-datatypes ((List!10170 0))(
  ( (Nil!10167) (Cons!10166 (h!11094 (_ BitVec 64)) (t!16398 List!10170)) )
))
(declare-fun arrayNoDuplicates!0 (array!33318 (_ BitVec 32) List!10170) Bool)

(assert (=> b!523837 (= res!320986 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10167))))

(declare-fun b!523838 () Bool)

(assert (=> b!523838 (= e!305502 (or (bvsgt #b00000000000000000000000000000000 (x!49107 lt!240368)) (bvsgt (x!49107 lt!240368) #b01111111111111111111111111111110) (bvslt lt!240367 #b00000000000000000000000000000000) (bvsge lt!240367 (size!16376 a!3235)) (and (bvsge (index!20127 lt!240368) #b00000000000000000000000000000000) (bvslt (index!20127 lt!240368) (size!16376 a!3235)))))))

(assert (=> b!523838 (and (or (= (select (arr!16012 a!3235) (index!20127 lt!240368)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16012 a!3235) (index!20127 lt!240368)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16012 a!3235) (index!20127 lt!240368)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16012 a!3235) (index!20127 lt!240368)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!240365 () Unit!16368)

(assert (=> b!523838 (= lt!240365 e!305503)))

(declare-fun c!61730 () Bool)

(assert (=> b!523838 (= c!61730 (= (select (arr!16012 a!3235) (index!20127 lt!240368)) (select (arr!16012 a!3235) j!176)))))

(assert (=> b!523838 (and (bvslt (x!49107 lt!240368) #b01111111111111111111111111111110) (or (= (select (arr!16012 a!3235) (index!20127 lt!240368)) (select (arr!16012 a!3235) j!176)) (= (select (arr!16012 a!3235) (index!20127 lt!240368)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16012 a!3235) (index!20127 lt!240368)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!523839 () Bool)

(declare-fun res!320985 () Bool)

(assert (=> b!523839 (=> (not res!320985) (not e!305506))))

(declare-fun arrayContainsKey!0 (array!33318 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!523839 (= res!320985 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!523840 () Bool)

(declare-fun Unit!16371 () Unit!16368)

(assert (=> b!523840 (= e!305503 Unit!16371)))

(declare-fun b!523841 () Bool)

(assert (=> b!523841 (= e!305508 (not e!305502))))

(declare-fun res!320982 () Bool)

(assert (=> b!523841 (=> res!320982 e!305502)))

(declare-fun lt!240370 () (_ BitVec 32))

(assert (=> b!523841 (= res!320982 (= lt!240368 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!240370 lt!240363 lt!240364 mask!3524)))))

(assert (=> b!523841 (= lt!240368 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!240367 (select (arr!16012 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!523841 (= lt!240370 (toIndex!0 lt!240363 mask!3524))))

(assert (=> b!523841 (= lt!240363 (select (store (arr!16012 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!523841 (= lt!240367 (toIndex!0 (select (arr!16012 a!3235) j!176) mask!3524))))

(assert (=> b!523841 (= lt!240364 (array!33319 (store (arr!16012 a!3235) i!1204 k0!2280) (size!16376 a!3235)))))

(assert (=> b!523841 e!305507))

(declare-fun res!320983 () Bool)

(assert (=> b!523841 (=> (not res!320983) (not e!305507))))

(assert (=> b!523841 (= res!320983 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!240362 () Unit!16368)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33318 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16368)

(assert (=> b!523841 (= lt!240362 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (= (and start!47618 res!320978) b!523832))

(assert (= (and b!523832 res!320981) b!523829))

(assert (= (and b!523829 res!320987) b!523831))

(assert (= (and b!523831 res!320976) b!523839))

(assert (= (and b!523839 res!320985) b!523836))

(assert (= (and b!523836 res!320984) b!523828))

(assert (= (and b!523828 res!320979) b!523837))

(assert (= (and b!523837 res!320986) b!523841))

(assert (= (and b!523841 res!320983) b!523830))

(assert (= (and b!523841 (not res!320982)) b!523833))

(assert (= (and b!523833 (not res!320977)) b!523838))

(assert (= (and b!523838 c!61730) b!523834))

(assert (= (and b!523838 (not c!61730)) b!523840))

(assert (= (and b!523834 res!320980) b!523835))

(declare-fun m!504555 () Bool)

(assert (=> b!523829 m!504555))

(assert (=> b!523829 m!504555))

(declare-fun m!504557 () Bool)

(assert (=> b!523829 m!504557))

(declare-fun m!504559 () Bool)

(assert (=> b!523831 m!504559))

(declare-fun m!504561 () Bool)

(assert (=> b!523838 m!504561))

(assert (=> b!523838 m!504555))

(assert (=> b!523830 m!504555))

(assert (=> b!523830 m!504555))

(declare-fun m!504563 () Bool)

(assert (=> b!523830 m!504563))

(declare-fun m!504565 () Bool)

(assert (=> b!523834 m!504565))

(declare-fun m!504567 () Bool)

(assert (=> b!523834 m!504567))

(declare-fun m!504569 () Bool)

(assert (=> start!47618 m!504569))

(declare-fun m!504571 () Bool)

(assert (=> start!47618 m!504571))

(declare-fun m!504573 () Bool)

(assert (=> b!523839 m!504573))

(declare-fun m!504575 () Bool)

(assert (=> b!523837 m!504575))

(declare-fun m!504577 () Bool)

(assert (=> b!523828 m!504577))

(declare-fun m!504579 () Bool)

(assert (=> b!523836 m!504579))

(declare-fun m!504581 () Bool)

(assert (=> b!523841 m!504581))

(assert (=> b!523841 m!504555))

(declare-fun m!504583 () Bool)

(assert (=> b!523841 m!504583))

(declare-fun m!504585 () Bool)

(assert (=> b!523841 m!504585))

(declare-fun m!504587 () Bool)

(assert (=> b!523841 m!504587))

(declare-fun m!504589 () Bool)

(assert (=> b!523841 m!504589))

(declare-fun m!504591 () Bool)

(assert (=> b!523841 m!504591))

(assert (=> b!523841 m!504555))

(declare-fun m!504593 () Bool)

(assert (=> b!523841 m!504593))

(assert (=> b!523841 m!504555))

(declare-fun m!504595 () Bool)

(assert (=> b!523841 m!504595))

(check-sat (not b!523834) (not b!523841) (not b!523836) (not b!523828) (not start!47618) (not b!523837) (not b!523830) (not b!523839) (not b!523829) (not b!523831))
(check-sat)
(get-model)

(declare-fun bm!31850 () Bool)

(declare-fun call!31853 () Bool)

(assert (=> bm!31850 (= call!31853 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!523892 () Bool)

(declare-fun e!305538 () Bool)

(assert (=> b!523892 (= e!305538 call!31853)))

(declare-fun b!523893 () Bool)

(declare-fun e!305537 () Bool)

(assert (=> b!523893 (= e!305537 e!305538)))

(declare-fun lt!240404 () (_ BitVec 64))

(assert (=> b!523893 (= lt!240404 (select (arr!16012 a!3235) #b00000000000000000000000000000000))))

(declare-fun lt!240405 () Unit!16368)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!33318 (_ BitVec 64) (_ BitVec 32)) Unit!16368)

(assert (=> b!523893 (= lt!240405 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!240404 #b00000000000000000000000000000000))))

(assert (=> b!523893 (arrayContainsKey!0 a!3235 lt!240404 #b00000000000000000000000000000000)))

(declare-fun lt!240406 () Unit!16368)

(assert (=> b!523893 (= lt!240406 lt!240405)))

(declare-fun res!321028 () Bool)

(assert (=> b!523893 (= res!321028 (= (seekEntryOrOpen!0 (select (arr!16012 a!3235) #b00000000000000000000000000000000) a!3235 mask!3524) (Found!4479 #b00000000000000000000000000000000)))))

(assert (=> b!523893 (=> (not res!321028) (not e!305538))))

(declare-fun d!80625 () Bool)

(declare-fun res!321029 () Bool)

(declare-fun e!305536 () Bool)

(assert (=> d!80625 (=> res!321029 e!305536)))

(assert (=> d!80625 (= res!321029 (bvsge #b00000000000000000000000000000000 (size!16376 a!3235)))))

(assert (=> d!80625 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524) e!305536)))

(declare-fun b!523894 () Bool)

(assert (=> b!523894 (= e!305537 call!31853)))

(declare-fun b!523895 () Bool)

(assert (=> b!523895 (= e!305536 e!305537)))

(declare-fun c!61736 () Bool)

(assert (=> b!523895 (= c!61736 (validKeyInArray!0 (select (arr!16012 a!3235) #b00000000000000000000000000000000)))))

(assert (= (and d!80625 (not res!321029)) b!523895))

(assert (= (and b!523895 c!61736) b!523893))

(assert (= (and b!523895 (not c!61736)) b!523894))

(assert (= (and b!523893 res!321028) b!523892))

(assert (= (or b!523892 b!523894) bm!31850))

(declare-fun m!504639 () Bool)

(assert (=> bm!31850 m!504639))

(declare-fun m!504641 () Bool)

(assert (=> b!523893 m!504641))

(declare-fun m!504643 () Bool)

(assert (=> b!523893 m!504643))

(declare-fun m!504645 () Bool)

(assert (=> b!523893 m!504645))

(assert (=> b!523893 m!504641))

(declare-fun m!504647 () Bool)

(assert (=> b!523893 m!504647))

(assert (=> b!523895 m!504641))

(assert (=> b!523895 m!504641))

(declare-fun m!504649 () Bool)

(assert (=> b!523895 m!504649))

(assert (=> b!523828 d!80625))

(declare-fun d!80627 () Bool)

(declare-fun res!321034 () Bool)

(declare-fun e!305543 () Bool)

(assert (=> d!80627 (=> res!321034 e!305543)))

(assert (=> d!80627 (= res!321034 (= (select (arr!16012 a!3235) #b00000000000000000000000000000000) k0!2280))))

(assert (=> d!80627 (= (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000) e!305543)))

(declare-fun b!523900 () Bool)

(declare-fun e!305544 () Bool)

(assert (=> b!523900 (= e!305543 e!305544)))

(declare-fun res!321035 () Bool)

(assert (=> b!523900 (=> (not res!321035) (not e!305544))))

(assert (=> b!523900 (= res!321035 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16376 a!3235)))))

(declare-fun b!523901 () Bool)

(assert (=> b!523901 (= e!305544 (arrayContainsKey!0 a!3235 k0!2280 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!80627 (not res!321034)) b!523900))

(assert (= (and b!523900 res!321035) b!523901))

(assert (=> d!80627 m!504641))

(declare-fun m!504651 () Bool)

(assert (=> b!523901 m!504651))

(assert (=> b!523839 d!80627))

(declare-fun d!80629 () Bool)

(assert (=> d!80629 (= (validMask!0 mask!3524) (and (or (= mask!3524 #b00000000000000000000000000000111) (= mask!3524 #b00000000000000000000000000001111) (= mask!3524 #b00000000000000000000000000011111) (= mask!3524 #b00000000000000000000000000111111) (= mask!3524 #b00000000000000000000000001111111) (= mask!3524 #b00000000000000000000000011111111) (= mask!3524 #b00000000000000000000000111111111) (= mask!3524 #b00000000000000000000001111111111) (= mask!3524 #b00000000000000000000011111111111) (= mask!3524 #b00000000000000000000111111111111) (= mask!3524 #b00000000000000000001111111111111) (= mask!3524 #b00000000000000000011111111111111) (= mask!3524 #b00000000000000000111111111111111) (= mask!3524 #b00000000000000001111111111111111) (= mask!3524 #b00000000000000011111111111111111) (= mask!3524 #b00000000000000111111111111111111) (= mask!3524 #b00000000000001111111111111111111) (= mask!3524 #b00000000000011111111111111111111) (= mask!3524 #b00000000000111111111111111111111) (= mask!3524 #b00000000001111111111111111111111) (= mask!3524 #b00000000011111111111111111111111) (= mask!3524 #b00000000111111111111111111111111) (= mask!3524 #b00000001111111111111111111111111) (= mask!3524 #b00000011111111111111111111111111) (= mask!3524 #b00000111111111111111111111111111) (= mask!3524 #b00001111111111111111111111111111) (= mask!3524 #b00011111111111111111111111111111) (= mask!3524 #b00111111111111111111111111111111)) (bvsle mask!3524 #b00111111111111111111111111111111)))))

(assert (=> start!47618 d!80629))

(declare-fun d!80631 () Bool)

(assert (=> d!80631 (= (array_inv!11808 a!3235) (bvsge (size!16376 a!3235) #b00000000000000000000000000000000))))

(assert (=> start!47618 d!80631))

(declare-fun d!80633 () Bool)

(declare-fun e!305547 () Bool)

(assert (=> d!80633 e!305547))

(declare-fun res!321038 () Bool)

(assert (=> d!80633 (=> (not res!321038) (not e!305547))))

(assert (=> d!80633 (= res!321038 (and (or (bvslt i!1204 #b00000000000000000000000000000000) (bvsge i!1204 (size!16376 a!3235)) (and (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16376 a!3235)))) (or (bvslt i!1204 #b00000000000000000000000000000000) (bvsge i!1204 (size!16376 a!3235)) (and (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16376 a!3235)))) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16376 a!3235))))))

(declare-fun lt!240409 () Unit!16368)

(declare-fun choose!47 (array!33318 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16368)

(assert (=> d!80633 (= lt!240409 (choose!47 a!3235 i!1204 k0!2280 j!176 lt!240367 #b00000000000000000000000000000000 (index!20127 lt!240368) (x!49107 lt!240368) mask!3524))))

(assert (=> d!80633 (validMask!0 mask!3524)))

(assert (=> d!80633 (= (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!240367 #b00000000000000000000000000000000 (index!20127 lt!240368) (x!49107 lt!240368) mask!3524) lt!240409)))

(declare-fun b!523904 () Bool)

(assert (=> b!523904 (= e!305547 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!240367 (select (store (arr!16012 a!3235) i!1204 k0!2280) j!176) (array!33319 (store (arr!16012 a!3235) i!1204 k0!2280) (size!16376 a!3235)) mask!3524) (Intermediate!4479 false (index!20127 lt!240368) (x!49107 lt!240368))))))

(assert (= (and d!80633 res!321038) b!523904))

(declare-fun m!504653 () Bool)

(assert (=> d!80633 m!504653))

(assert (=> d!80633 m!504569))

(assert (=> b!523904 m!504585))

(assert (=> b!523904 m!504589))

(assert (=> b!523904 m!504589))

(declare-fun m!504655 () Bool)

(assert (=> b!523904 m!504655))

(assert (=> b!523834 d!80633))

(declare-fun b!523950 () Bool)

(declare-fun e!305586 () SeekEntryResult!4479)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!523950 (= e!305586 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!240367 #b00000000000000000000000000000000 mask!3524) lt!240363 lt!240364 mask!3524))))

(declare-fun b!523951 () Bool)

(declare-fun e!305588 () Bool)

(declare-fun e!305587 () Bool)

(assert (=> b!523951 (= e!305588 e!305587)))

(declare-fun res!321069 () Bool)

(declare-fun lt!240416 () SeekEntryResult!4479)

(assert (=> b!523951 (= res!321069 (and ((_ is Intermediate!4479) lt!240416) (not (undefined!5291 lt!240416)) (bvslt (x!49107 lt!240416) #b01111111111111111111111111111110) (bvsge (x!49107 lt!240416) #b00000000000000000000000000000000) (bvsge (x!49107 lt!240416) #b00000000000000000000000000000000)))))

(assert (=> b!523951 (=> (not res!321069) (not e!305587))))

(declare-fun b!523952 () Bool)

(declare-fun e!305584 () SeekEntryResult!4479)

(assert (=> b!523952 (= e!305584 e!305586)))

(declare-fun c!61747 () Bool)

(declare-fun lt!240417 () (_ BitVec 64))

(assert (=> b!523952 (= c!61747 (or (= lt!240417 lt!240363) (= (bvadd lt!240417 lt!240417) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!523953 () Bool)

(assert (=> b!523953 (= e!305584 (Intermediate!4479 true lt!240367 #b00000000000000000000000000000000))))

(declare-fun d!80639 () Bool)

(assert (=> d!80639 e!305588))

(declare-fun c!61746 () Bool)

(assert (=> d!80639 (= c!61746 (and ((_ is Intermediate!4479) lt!240416) (undefined!5291 lt!240416)))))

(assert (=> d!80639 (= lt!240416 e!305584)))

(declare-fun c!61748 () Bool)

(assert (=> d!80639 (= c!61748 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!80639 (= lt!240417 (select (arr!16012 lt!240364) lt!240367))))

(assert (=> d!80639 (validMask!0 mask!3524)))

(assert (=> d!80639 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!240367 lt!240363 lt!240364 mask!3524) lt!240416)))

(declare-fun b!523954 () Bool)

(assert (=> b!523954 (and (bvsge (index!20127 lt!240416) #b00000000000000000000000000000000) (bvslt (index!20127 lt!240416) (size!16376 lt!240364)))))

(declare-fun res!321068 () Bool)

(assert (=> b!523954 (= res!321068 (= (select (arr!16012 lt!240364) (index!20127 lt!240416)) lt!240363))))

(declare-fun e!305585 () Bool)

(assert (=> b!523954 (=> res!321068 e!305585)))

(assert (=> b!523954 (= e!305587 e!305585)))

(declare-fun b!523955 () Bool)

(assert (=> b!523955 (and (bvsge (index!20127 lt!240416) #b00000000000000000000000000000000) (bvslt (index!20127 lt!240416) (size!16376 lt!240364)))))

(declare-fun res!321070 () Bool)

(assert (=> b!523955 (= res!321070 (= (select (arr!16012 lt!240364) (index!20127 lt!240416)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!523955 (=> res!321070 e!305585)))

(declare-fun b!523956 () Bool)

(assert (=> b!523956 (= e!305588 (bvsge (x!49107 lt!240416) #b01111111111111111111111111111110))))

(declare-fun b!523957 () Bool)

(assert (=> b!523957 (and (bvsge (index!20127 lt!240416) #b00000000000000000000000000000000) (bvslt (index!20127 lt!240416) (size!16376 lt!240364)))))

(assert (=> b!523957 (= e!305585 (= (select (arr!16012 lt!240364) (index!20127 lt!240416)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!523958 () Bool)

(assert (=> b!523958 (= e!305586 (Intermediate!4479 false lt!240367 #b00000000000000000000000000000000))))

(assert (= (and d!80639 c!61748) b!523953))

(assert (= (and d!80639 (not c!61748)) b!523952))

(assert (= (and b!523952 c!61747) b!523958))

(assert (= (and b!523952 (not c!61747)) b!523950))

(assert (= (and d!80639 c!61746) b!523956))

(assert (= (and d!80639 (not c!61746)) b!523951))

(assert (= (and b!523951 res!321069) b!523954))

(assert (= (and b!523954 (not res!321068)) b!523955))

(assert (= (and b!523955 (not res!321070)) b!523957))

(declare-fun m!504671 () Bool)

(assert (=> b!523957 m!504671))

(declare-fun m!504673 () Bool)

(assert (=> d!80639 m!504673))

(assert (=> d!80639 m!504569))

(assert (=> b!523955 m!504671))

(assert (=> b!523954 m!504671))

(declare-fun m!504675 () Bool)

(assert (=> b!523950 m!504675))

(assert (=> b!523950 m!504675))

(declare-fun m!504677 () Bool)

(assert (=> b!523950 m!504677))

(assert (=> b!523834 d!80639))

(declare-fun d!80651 () Bool)

(assert (=> d!80651 (= (validKeyInArray!0 (select (arr!16012 a!3235) j!176)) (and (not (= (select (arr!16012 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16012 a!3235) j!176) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!523829 d!80651))

(declare-fun b!524011 () Bool)

(declare-fun e!305615 () SeekEntryResult!4479)

(declare-fun e!305616 () SeekEntryResult!4479)

(assert (=> b!524011 (= e!305615 e!305616)))

(declare-fun lt!240438 () (_ BitVec 64))

(declare-fun lt!240439 () SeekEntryResult!4479)

(assert (=> b!524011 (= lt!240438 (select (arr!16012 a!3235) (index!20127 lt!240439)))))

(declare-fun c!61772 () Bool)

(assert (=> b!524011 (= c!61772 (= lt!240438 (select (arr!16012 a!3235) j!176)))))

(declare-fun b!524012 () Bool)

(declare-fun e!305617 () SeekEntryResult!4479)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33318 (_ BitVec 32)) SeekEntryResult!4479)

(assert (=> b!524012 (= e!305617 (seekKeyOrZeroReturnVacant!0 (x!49107 lt!240439) (index!20127 lt!240439) (index!20127 lt!240439) (select (arr!16012 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!524013 () Bool)

(declare-fun c!61771 () Bool)

(assert (=> b!524013 (= c!61771 (= lt!240438 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!524013 (= e!305616 e!305617)))

(declare-fun b!524014 () Bool)

(assert (=> b!524014 (= e!305615 Undefined!4479)))

(declare-fun b!524015 () Bool)

(assert (=> b!524015 (= e!305616 (Found!4479 (index!20127 lt!240439)))))

(declare-fun d!80653 () Bool)

(declare-fun lt!240440 () SeekEntryResult!4479)

(assert (=> d!80653 (and (or ((_ is Undefined!4479) lt!240440) (not ((_ is Found!4479) lt!240440)) (and (bvsge (index!20126 lt!240440) #b00000000000000000000000000000000) (bvslt (index!20126 lt!240440) (size!16376 a!3235)))) (or ((_ is Undefined!4479) lt!240440) ((_ is Found!4479) lt!240440) (not ((_ is MissingZero!4479) lt!240440)) (and (bvsge (index!20125 lt!240440) #b00000000000000000000000000000000) (bvslt (index!20125 lt!240440) (size!16376 a!3235)))) (or ((_ is Undefined!4479) lt!240440) ((_ is Found!4479) lt!240440) ((_ is MissingZero!4479) lt!240440) (not ((_ is MissingVacant!4479) lt!240440)) (and (bvsge (index!20128 lt!240440) #b00000000000000000000000000000000) (bvslt (index!20128 lt!240440) (size!16376 a!3235)))) (or ((_ is Undefined!4479) lt!240440) (ite ((_ is Found!4479) lt!240440) (= (select (arr!16012 a!3235) (index!20126 lt!240440)) (select (arr!16012 a!3235) j!176)) (ite ((_ is MissingZero!4479) lt!240440) (= (select (arr!16012 a!3235) (index!20125 lt!240440)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!4479) lt!240440) (= (select (arr!16012 a!3235) (index!20128 lt!240440)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!80653 (= lt!240440 e!305615)))

(declare-fun c!61770 () Bool)

(assert (=> d!80653 (= c!61770 (and ((_ is Intermediate!4479) lt!240439) (undefined!5291 lt!240439)))))

(assert (=> d!80653 (= lt!240439 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16012 a!3235) j!176) mask!3524) (select (arr!16012 a!3235) j!176) a!3235 mask!3524))))

(assert (=> d!80653 (validMask!0 mask!3524)))

(assert (=> d!80653 (= (seekEntryOrOpen!0 (select (arr!16012 a!3235) j!176) a!3235 mask!3524) lt!240440)))

(declare-fun b!524010 () Bool)

(assert (=> b!524010 (= e!305617 (MissingZero!4479 (index!20127 lt!240439)))))

(assert (= (and d!80653 c!61770) b!524014))

(assert (= (and d!80653 (not c!61770)) b!524011))

(assert (= (and b!524011 c!61772) b!524015))

(assert (= (and b!524011 (not c!61772)) b!524013))

(assert (= (and b!524013 c!61771) b!524010))

(assert (= (and b!524013 (not c!61771)) b!524012))

(declare-fun m!504695 () Bool)

(assert (=> b!524011 m!504695))

(assert (=> b!524012 m!504555))

(declare-fun m!504697 () Bool)

(assert (=> b!524012 m!504697))

(assert (=> d!80653 m!504555))

(assert (=> d!80653 m!504593))

(declare-fun m!504699 () Bool)

(assert (=> d!80653 m!504699))

(assert (=> d!80653 m!504569))

(assert (=> d!80653 m!504593))

(assert (=> d!80653 m!504555))

(declare-fun m!504701 () Bool)

(assert (=> d!80653 m!504701))

(declare-fun m!504703 () Bool)

(assert (=> d!80653 m!504703))

(declare-fun m!504705 () Bool)

(assert (=> d!80653 m!504705))

(assert (=> b!523830 d!80653))

(declare-fun d!80659 () Bool)

(declare-fun lt!240451 () (_ BitVec 32))

(declare-fun lt!240450 () (_ BitVec 32))

(assert (=> d!80659 (= lt!240451 (bvmul (bvxor lt!240450 (bvlshr lt!240450 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!80659 (= lt!240450 ((_ extract 31 0) (bvand (bvxor lt!240363 (bvlshr lt!240363 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!80659 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!321083 (let ((h!11096 ((_ extract 31 0) (bvand (bvxor lt!240363 (bvlshr lt!240363 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!49114 (bvmul (bvxor h!11096 (bvlshr h!11096 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!49114 (bvlshr x!49114 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!321083 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!321083 #b00000000000000000000000000000000))))))

(assert (=> d!80659 (= (toIndex!0 lt!240363 mask!3524) (bvand (bvxor lt!240451 (bvlshr lt!240451 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!523841 d!80659))

(declare-fun d!80665 () Bool)

(declare-fun lt!240453 () (_ BitVec 32))

(declare-fun lt!240452 () (_ BitVec 32))

(assert (=> d!80665 (= lt!240453 (bvmul (bvxor lt!240452 (bvlshr lt!240452 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!80665 (= lt!240452 ((_ extract 31 0) (bvand (bvxor (select (arr!16012 a!3235) j!176) (bvlshr (select (arr!16012 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!80665 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!321083 (let ((h!11096 ((_ extract 31 0) (bvand (bvxor (select (arr!16012 a!3235) j!176) (bvlshr (select (arr!16012 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!49114 (bvmul (bvxor h!11096 (bvlshr h!11096 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!49114 (bvlshr x!49114 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!321083 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!321083 #b00000000000000000000000000000000))))))

(assert (=> d!80665 (= (toIndex!0 (select (arr!16012 a!3235) j!176) mask!3524) (bvand (bvxor lt!240453 (bvlshr lt!240453 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!523841 d!80665))

(declare-fun bm!31854 () Bool)

(declare-fun call!31857 () Bool)

(assert (=> bm!31854 (= call!31857 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!176 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!524028 () Bool)

(declare-fun e!305628 () Bool)

(assert (=> b!524028 (= e!305628 call!31857)))

(declare-fun b!524029 () Bool)

(declare-fun e!305627 () Bool)

(assert (=> b!524029 (= e!305627 e!305628)))

(declare-fun lt!240454 () (_ BitVec 64))

(assert (=> b!524029 (= lt!240454 (select (arr!16012 a!3235) j!176))))

(declare-fun lt!240455 () Unit!16368)

(assert (=> b!524029 (= lt!240455 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!240454 j!176))))

(assert (=> b!524029 (arrayContainsKey!0 a!3235 lt!240454 #b00000000000000000000000000000000)))

(declare-fun lt!240456 () Unit!16368)

(assert (=> b!524029 (= lt!240456 lt!240455)))

(declare-fun res!321085 () Bool)

(assert (=> b!524029 (= res!321085 (= (seekEntryOrOpen!0 (select (arr!16012 a!3235) j!176) a!3235 mask!3524) (Found!4479 j!176)))))

(assert (=> b!524029 (=> (not res!321085) (not e!305628))))

(declare-fun d!80667 () Bool)

(declare-fun res!321086 () Bool)

(declare-fun e!305626 () Bool)

(assert (=> d!80667 (=> res!321086 e!305626)))

(assert (=> d!80667 (= res!321086 (bvsge j!176 (size!16376 a!3235)))))

(assert (=> d!80667 (= (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524) e!305626)))

(declare-fun b!524030 () Bool)

(assert (=> b!524030 (= e!305627 call!31857)))

(declare-fun b!524031 () Bool)

(assert (=> b!524031 (= e!305626 e!305627)))

(declare-fun c!61776 () Bool)

(assert (=> b!524031 (= c!61776 (validKeyInArray!0 (select (arr!16012 a!3235) j!176)))))

(assert (= (and d!80667 (not res!321086)) b!524031))

(assert (= (and b!524031 c!61776) b!524029))

(assert (= (and b!524031 (not c!61776)) b!524030))

(assert (= (and b!524029 res!321085) b!524028))

(assert (= (or b!524028 b!524030) bm!31854))

(declare-fun m!504719 () Bool)

(assert (=> bm!31854 m!504719))

(assert (=> b!524029 m!504555))

(declare-fun m!504721 () Bool)

(assert (=> b!524029 m!504721))

(declare-fun m!504723 () Bool)

(assert (=> b!524029 m!504723))

(assert (=> b!524029 m!504555))

(assert (=> b!524029 m!504563))

(assert (=> b!524031 m!504555))

(assert (=> b!524031 m!504555))

(assert (=> b!524031 m!504557))

(assert (=> b!523841 d!80667))

(declare-fun e!305634 () SeekEntryResult!4479)

(declare-fun b!524038 () Bool)

(assert (=> b!524038 (= e!305634 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!240370 #b00000000000000000000000000000000 mask!3524) lt!240363 lt!240364 mask!3524))))

(declare-fun b!524039 () Bool)

(declare-fun e!305637 () Bool)

(declare-fun e!305636 () Bool)

(assert (=> b!524039 (= e!305637 e!305636)))

(declare-fun res!321090 () Bool)

(declare-fun lt!240457 () SeekEntryResult!4479)

(assert (=> b!524039 (= res!321090 (and ((_ is Intermediate!4479) lt!240457) (not (undefined!5291 lt!240457)) (bvslt (x!49107 lt!240457) #b01111111111111111111111111111110) (bvsge (x!49107 lt!240457) #b00000000000000000000000000000000) (bvsge (x!49107 lt!240457) #b00000000000000000000000000000000)))))

(assert (=> b!524039 (=> (not res!321090) (not e!305636))))

(declare-fun b!524040 () Bool)

(declare-fun e!305632 () SeekEntryResult!4479)

(assert (=> b!524040 (= e!305632 e!305634)))

(declare-fun c!61780 () Bool)

(declare-fun lt!240458 () (_ BitVec 64))

(assert (=> b!524040 (= c!61780 (or (= lt!240458 lt!240363) (= (bvadd lt!240458 lt!240458) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!524041 () Bool)

(assert (=> b!524041 (= e!305632 (Intermediate!4479 true lt!240370 #b00000000000000000000000000000000))))

(declare-fun d!80669 () Bool)

(assert (=> d!80669 e!305637))

(declare-fun c!61778 () Bool)

(assert (=> d!80669 (= c!61778 (and ((_ is Intermediate!4479) lt!240457) (undefined!5291 lt!240457)))))

(assert (=> d!80669 (= lt!240457 e!305632)))

(declare-fun c!61781 () Bool)

(assert (=> d!80669 (= c!61781 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!80669 (= lt!240458 (select (arr!16012 lt!240364) lt!240370))))

(assert (=> d!80669 (validMask!0 mask!3524)))

(assert (=> d!80669 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!240370 lt!240363 lt!240364 mask!3524) lt!240457)))

(declare-fun b!524042 () Bool)

(assert (=> b!524042 (and (bvsge (index!20127 lt!240457) #b00000000000000000000000000000000) (bvslt (index!20127 lt!240457) (size!16376 lt!240364)))))

(declare-fun res!321089 () Bool)

(assert (=> b!524042 (= res!321089 (= (select (arr!16012 lt!240364) (index!20127 lt!240457)) lt!240363))))

(declare-fun e!305633 () Bool)

(assert (=> b!524042 (=> res!321089 e!305633)))

(assert (=> b!524042 (= e!305636 e!305633)))

(declare-fun b!524043 () Bool)

(assert (=> b!524043 (and (bvsge (index!20127 lt!240457) #b00000000000000000000000000000000) (bvslt (index!20127 lt!240457) (size!16376 lt!240364)))))

(declare-fun res!321091 () Bool)

(assert (=> b!524043 (= res!321091 (= (select (arr!16012 lt!240364) (index!20127 lt!240457)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!524043 (=> res!321091 e!305633)))

(declare-fun b!524044 () Bool)

(assert (=> b!524044 (= e!305637 (bvsge (x!49107 lt!240457) #b01111111111111111111111111111110))))

(declare-fun b!524045 () Bool)

(assert (=> b!524045 (and (bvsge (index!20127 lt!240457) #b00000000000000000000000000000000) (bvslt (index!20127 lt!240457) (size!16376 lt!240364)))))

(assert (=> b!524045 (= e!305633 (= (select (arr!16012 lt!240364) (index!20127 lt!240457)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!524046 () Bool)

(assert (=> b!524046 (= e!305634 (Intermediate!4479 false lt!240370 #b00000000000000000000000000000000))))

(assert (= (and d!80669 c!61781) b!524041))

(assert (= (and d!80669 (not c!61781)) b!524040))

(assert (= (and b!524040 c!61780) b!524046))

(assert (= (and b!524040 (not c!61780)) b!524038))

(assert (= (and d!80669 c!61778) b!524044))

(assert (= (and d!80669 (not c!61778)) b!524039))

(assert (= (and b!524039 res!321090) b!524042))

(assert (= (and b!524042 (not res!321089)) b!524043))

(assert (= (and b!524043 (not res!321091)) b!524045))

(declare-fun m!504725 () Bool)

(assert (=> b!524045 m!504725))

(declare-fun m!504727 () Bool)

(assert (=> d!80669 m!504727))

(assert (=> d!80669 m!504569))

(assert (=> b!524043 m!504725))

(assert (=> b!524042 m!504725))

(declare-fun m!504729 () Bool)

(assert (=> b!524038 m!504729))

(assert (=> b!524038 m!504729))

(declare-fun m!504731 () Bool)

(assert (=> b!524038 m!504731))

(assert (=> b!523841 d!80669))

(declare-fun d!80671 () Bool)

(assert (=> d!80671 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!240470 () Unit!16368)

(declare-fun choose!38 (array!33318 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16368)

(assert (=> d!80671 (= lt!240470 (choose!38 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (=> d!80671 (validMask!0 mask!3524)))

(assert (=> d!80671 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176) lt!240470)))

(declare-fun bs!16456 () Bool)

(assert (= bs!16456 d!80671))

(assert (=> bs!16456 m!504595))

(declare-fun m!504743 () Bool)

(assert (=> bs!16456 m!504743))

(assert (=> bs!16456 m!504569))

(assert (=> b!523841 d!80671))

(declare-fun b!524053 () Bool)

(declare-fun e!305645 () SeekEntryResult!4479)

(assert (=> b!524053 (= e!305645 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!240367 #b00000000000000000000000000000000 mask!3524) (select (arr!16012 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!524054 () Bool)

(declare-fun e!305647 () Bool)

(declare-fun e!305646 () Bool)

(assert (=> b!524054 (= e!305647 e!305646)))

(declare-fun res!321098 () Bool)

(declare-fun lt!240471 () SeekEntryResult!4479)

(assert (=> b!524054 (= res!321098 (and ((_ is Intermediate!4479) lt!240471) (not (undefined!5291 lt!240471)) (bvslt (x!49107 lt!240471) #b01111111111111111111111111111110) (bvsge (x!49107 lt!240471) #b00000000000000000000000000000000) (bvsge (x!49107 lt!240471) #b00000000000000000000000000000000)))))

(assert (=> b!524054 (=> (not res!321098) (not e!305646))))

(declare-fun b!524055 () Bool)

(declare-fun e!305643 () SeekEntryResult!4479)

(assert (=> b!524055 (= e!305643 e!305645)))

(declare-fun lt!240472 () (_ BitVec 64))

(declare-fun c!61784 () Bool)

(assert (=> b!524055 (= c!61784 (or (= lt!240472 (select (arr!16012 a!3235) j!176)) (= (bvadd lt!240472 lt!240472) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!524056 () Bool)

(assert (=> b!524056 (= e!305643 (Intermediate!4479 true lt!240367 #b00000000000000000000000000000000))))

(declare-fun d!80675 () Bool)

(assert (=> d!80675 e!305647))

(declare-fun c!61783 () Bool)

(assert (=> d!80675 (= c!61783 (and ((_ is Intermediate!4479) lt!240471) (undefined!5291 lt!240471)))))

(assert (=> d!80675 (= lt!240471 e!305643)))

(declare-fun c!61785 () Bool)

(assert (=> d!80675 (= c!61785 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!80675 (= lt!240472 (select (arr!16012 a!3235) lt!240367))))

(assert (=> d!80675 (validMask!0 mask!3524)))

(assert (=> d!80675 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!240367 (select (arr!16012 a!3235) j!176) a!3235 mask!3524) lt!240471)))

(declare-fun b!524057 () Bool)

(assert (=> b!524057 (and (bvsge (index!20127 lt!240471) #b00000000000000000000000000000000) (bvslt (index!20127 lt!240471) (size!16376 a!3235)))))

(declare-fun res!321097 () Bool)

(assert (=> b!524057 (= res!321097 (= (select (arr!16012 a!3235) (index!20127 lt!240471)) (select (arr!16012 a!3235) j!176)))))

(declare-fun e!305644 () Bool)

(assert (=> b!524057 (=> res!321097 e!305644)))

(assert (=> b!524057 (= e!305646 e!305644)))

(declare-fun b!524058 () Bool)

(assert (=> b!524058 (and (bvsge (index!20127 lt!240471) #b00000000000000000000000000000000) (bvslt (index!20127 lt!240471) (size!16376 a!3235)))))

(declare-fun res!321099 () Bool)

(assert (=> b!524058 (= res!321099 (= (select (arr!16012 a!3235) (index!20127 lt!240471)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!524058 (=> res!321099 e!305644)))

(declare-fun b!524059 () Bool)

(assert (=> b!524059 (= e!305647 (bvsge (x!49107 lt!240471) #b01111111111111111111111111111110))))

(declare-fun b!524060 () Bool)

(assert (=> b!524060 (and (bvsge (index!20127 lt!240471) #b00000000000000000000000000000000) (bvslt (index!20127 lt!240471) (size!16376 a!3235)))))

(assert (=> b!524060 (= e!305644 (= (select (arr!16012 a!3235) (index!20127 lt!240471)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!524061 () Bool)

(assert (=> b!524061 (= e!305645 (Intermediate!4479 false lt!240367 #b00000000000000000000000000000000))))

(assert (= (and d!80675 c!61785) b!524056))

(assert (= (and d!80675 (not c!61785)) b!524055))

(assert (= (and b!524055 c!61784) b!524061))

(assert (= (and b!524055 (not c!61784)) b!524053))

(assert (= (and d!80675 c!61783) b!524059))

(assert (= (and d!80675 (not c!61783)) b!524054))

(assert (= (and b!524054 res!321098) b!524057))

(assert (= (and b!524057 (not res!321097)) b!524058))

(assert (= (and b!524058 (not res!321099)) b!524060))

(declare-fun m!504745 () Bool)

(assert (=> b!524060 m!504745))

(declare-fun m!504747 () Bool)

(assert (=> d!80675 m!504747))

(assert (=> d!80675 m!504569))

(assert (=> b!524058 m!504745))

(assert (=> b!524057 m!504745))

(assert (=> b!524053 m!504675))

(assert (=> b!524053 m!504675))

(assert (=> b!524053 m!504555))

(declare-fun m!504749 () Bool)

(assert (=> b!524053 m!504749))

(assert (=> b!523841 d!80675))

(declare-fun b!524063 () Bool)

(declare-fun e!305648 () SeekEntryResult!4479)

(declare-fun e!305649 () SeekEntryResult!4479)

(assert (=> b!524063 (= e!305648 e!305649)))

(declare-fun lt!240473 () (_ BitVec 64))

(declare-fun lt!240474 () SeekEntryResult!4479)

(assert (=> b!524063 (= lt!240473 (select (arr!16012 a!3235) (index!20127 lt!240474)))))

(declare-fun c!61788 () Bool)

(assert (=> b!524063 (= c!61788 (= lt!240473 k0!2280))))

(declare-fun e!305650 () SeekEntryResult!4479)

(declare-fun b!524064 () Bool)

(assert (=> b!524064 (= e!305650 (seekKeyOrZeroReturnVacant!0 (x!49107 lt!240474) (index!20127 lt!240474) (index!20127 lt!240474) k0!2280 a!3235 mask!3524))))

(declare-fun b!524065 () Bool)

(declare-fun c!61787 () Bool)

(assert (=> b!524065 (= c!61787 (= lt!240473 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!524065 (= e!305649 e!305650)))

(declare-fun b!524066 () Bool)

(assert (=> b!524066 (= e!305648 Undefined!4479)))

(declare-fun b!524067 () Bool)

(assert (=> b!524067 (= e!305649 (Found!4479 (index!20127 lt!240474)))))

(declare-fun d!80677 () Bool)

(declare-fun lt!240475 () SeekEntryResult!4479)

(assert (=> d!80677 (and (or ((_ is Undefined!4479) lt!240475) (not ((_ is Found!4479) lt!240475)) (and (bvsge (index!20126 lt!240475) #b00000000000000000000000000000000) (bvslt (index!20126 lt!240475) (size!16376 a!3235)))) (or ((_ is Undefined!4479) lt!240475) ((_ is Found!4479) lt!240475) (not ((_ is MissingZero!4479) lt!240475)) (and (bvsge (index!20125 lt!240475) #b00000000000000000000000000000000) (bvslt (index!20125 lt!240475) (size!16376 a!3235)))) (or ((_ is Undefined!4479) lt!240475) ((_ is Found!4479) lt!240475) ((_ is MissingZero!4479) lt!240475) (not ((_ is MissingVacant!4479) lt!240475)) (and (bvsge (index!20128 lt!240475) #b00000000000000000000000000000000) (bvslt (index!20128 lt!240475) (size!16376 a!3235)))) (or ((_ is Undefined!4479) lt!240475) (ite ((_ is Found!4479) lt!240475) (= (select (arr!16012 a!3235) (index!20126 lt!240475)) k0!2280) (ite ((_ is MissingZero!4479) lt!240475) (= (select (arr!16012 a!3235) (index!20125 lt!240475)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!4479) lt!240475) (= (select (arr!16012 a!3235) (index!20128 lt!240475)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!80677 (= lt!240475 e!305648)))

(declare-fun c!61786 () Bool)

(assert (=> d!80677 (= c!61786 (and ((_ is Intermediate!4479) lt!240474) (undefined!5291 lt!240474)))))

(assert (=> d!80677 (= lt!240474 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2280 mask!3524) k0!2280 a!3235 mask!3524))))

(assert (=> d!80677 (validMask!0 mask!3524)))

(assert (=> d!80677 (= (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524) lt!240475)))

(declare-fun b!524062 () Bool)

(assert (=> b!524062 (= e!305650 (MissingZero!4479 (index!20127 lt!240474)))))

(assert (= (and d!80677 c!61786) b!524066))

(assert (= (and d!80677 (not c!61786)) b!524063))

(assert (= (and b!524063 c!61788) b!524067))

(assert (= (and b!524063 (not c!61788)) b!524065))

(assert (= (and b!524065 c!61787) b!524062))

(assert (= (and b!524065 (not c!61787)) b!524064))

(declare-fun m!504751 () Bool)

(assert (=> b!524063 m!504751))

(declare-fun m!504753 () Bool)

(assert (=> b!524064 m!504753))

(declare-fun m!504755 () Bool)

(assert (=> d!80677 m!504755))

(declare-fun m!504757 () Bool)

(assert (=> d!80677 m!504757))

(assert (=> d!80677 m!504569))

(assert (=> d!80677 m!504755))

(declare-fun m!504759 () Bool)

(assert (=> d!80677 m!504759))

(declare-fun m!504761 () Bool)

(assert (=> d!80677 m!504761))

(declare-fun m!504763 () Bool)

(assert (=> d!80677 m!504763))

(assert (=> b!523836 d!80677))

(declare-fun d!80679 () Bool)

(assert (=> d!80679 (= (validKeyInArray!0 k0!2280) (and (not (= k0!2280 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2280 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!523831 d!80679))

(declare-fun bm!31861 () Bool)

(declare-fun call!31864 () Bool)

(declare-fun c!61798 () Bool)

(assert (=> bm!31861 (= call!31864 (arrayNoDuplicates!0 a!3235 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!61798 (Cons!10166 (select (arr!16012 a!3235) #b00000000000000000000000000000000) Nil!10167) Nil!10167)))))

(declare-fun d!80681 () Bool)

(declare-fun res!321115 () Bool)

(declare-fun e!305673 () Bool)

(assert (=> d!80681 (=> res!321115 e!305673)))

(assert (=> d!80681 (= res!321115 (bvsge #b00000000000000000000000000000000 (size!16376 a!3235)))))

(assert (=> d!80681 (= (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10167) e!305673)))

(declare-fun b!524100 () Bool)

(declare-fun e!305675 () Bool)

(declare-fun e!305674 () Bool)

(assert (=> b!524100 (= e!305675 e!305674)))

(assert (=> b!524100 (= c!61798 (validKeyInArray!0 (select (arr!16012 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!524101 () Bool)

(assert (=> b!524101 (= e!305674 call!31864)))

(declare-fun b!524102 () Bool)

(declare-fun e!305672 () Bool)

(declare-fun contains!2771 (List!10170 (_ BitVec 64)) Bool)

(assert (=> b!524102 (= e!305672 (contains!2771 Nil!10167 (select (arr!16012 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!524103 () Bool)

(assert (=> b!524103 (= e!305673 e!305675)))

(declare-fun res!321116 () Bool)

(assert (=> b!524103 (=> (not res!321116) (not e!305675))))

(assert (=> b!524103 (= res!321116 (not e!305672))))

(declare-fun res!321114 () Bool)

(assert (=> b!524103 (=> (not res!321114) (not e!305672))))

(assert (=> b!524103 (= res!321114 (validKeyInArray!0 (select (arr!16012 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!524104 () Bool)

(assert (=> b!524104 (= e!305674 call!31864)))

(assert (= (and d!80681 (not res!321115)) b!524103))

(assert (= (and b!524103 res!321114) b!524102))

(assert (= (and b!524103 res!321116) b!524100))

(assert (= (and b!524100 c!61798) b!524104))

(assert (= (and b!524100 (not c!61798)) b!524101))

(assert (= (or b!524104 b!524101) bm!31861))

(assert (=> bm!31861 m!504641))

(declare-fun m!504773 () Bool)

(assert (=> bm!31861 m!504773))

(assert (=> b!524100 m!504641))

(assert (=> b!524100 m!504641))

(assert (=> b!524100 m!504649))

(assert (=> b!524102 m!504641))

(assert (=> b!524102 m!504641))

(declare-fun m!504775 () Bool)

(assert (=> b!524102 m!504775))

(assert (=> b!524103 m!504641))

(assert (=> b!524103 m!504641))

(assert (=> b!524103 m!504649))

(assert (=> b!523837 d!80681))

(check-sat (not b!523950) (not d!80633) (not bm!31854) (not d!80675) (not bm!31861) (not d!80671) (not b!524031) (not b!523893) (not d!80653) (not b!523904) (not b!524103) (not d!80639) (not b!524064) (not b!524029) (not b!524053) (not d!80669) (not b!523901) (not d!80677) (not b!524102) (not bm!31850) (not b!524100) (not b!523895) (not b!524038) (not b!524012))
(check-sat)
