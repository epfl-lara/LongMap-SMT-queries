; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45612 () Bool)

(assert start!45612)

(declare-fun b!502569 () Bool)

(declare-datatypes ((Unit!15202 0))(
  ( (Unit!15203) )
))
(declare-fun e!294339 () Unit!15202)

(declare-fun Unit!15204 () Unit!15202)

(assert (=> b!502569 (= e!294339 Unit!15204)))

(declare-fun lt!228407 () (_ BitVec 32))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!32378 0))(
  ( (array!32379 (arr!15569 (Array (_ BitVec 32) (_ BitVec 64))) (size!15934 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32378)

(declare-fun j!176 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4033 0))(
  ( (MissingZero!4033 (index!18320 (_ BitVec 32))) (Found!4033 (index!18321 (_ BitVec 32))) (Intermediate!4033 (undefined!4845 Bool) (index!18322 (_ BitVec 32)) (x!47357 (_ BitVec 32))) (Undefined!4033) (MissingVacant!4033 (index!18323 (_ BitVec 32))) )
))
(declare-fun lt!228412 () SeekEntryResult!4033)

(declare-fun lt!228402 () Unit!15202)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32378 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15202)

(assert (=> b!502569 (= lt!228402 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!228407 #b00000000000000000000000000000000 (index!18322 lt!228412) (x!47357 lt!228412) mask!3524))))

(declare-fun lt!228404 () array!32378)

(declare-fun lt!228405 () (_ BitVec 64))

(declare-fun res!304089 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32378 (_ BitVec 32)) SeekEntryResult!4033)

(assert (=> b!502569 (= res!304089 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228407 lt!228405 lt!228404 mask!3524) (Intermediate!4033 false (index!18322 lt!228412) (x!47357 lt!228412))))))

(declare-fun e!294332 () Bool)

(assert (=> b!502569 (=> (not res!304089) (not e!294332))))

(assert (=> b!502569 e!294332))

(declare-fun b!502570 () Bool)

(declare-fun e!294337 () Bool)

(declare-fun e!294335 () Bool)

(assert (=> b!502570 (= e!294337 e!294335)))

(declare-fun res!304091 () Bool)

(assert (=> b!502570 (=> (not res!304091) (not e!294335))))

(declare-fun lt!228408 () SeekEntryResult!4033)

(assert (=> b!502570 (= res!304091 (or (= lt!228408 (MissingZero!4033 i!1204)) (= lt!228408 (MissingVacant!4033 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32378 (_ BitVec 32)) SeekEntryResult!4033)

(assert (=> b!502570 (= lt!228408 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!502571 () Bool)

(declare-fun res!304093 () Bool)

(declare-fun e!294333 () Bool)

(assert (=> b!502571 (=> res!304093 e!294333)))

(declare-fun e!294336 () Bool)

(assert (=> b!502571 (= res!304093 e!294336)))

(declare-fun res!304090 () Bool)

(assert (=> b!502571 (=> (not res!304090) (not e!294336))))

(assert (=> b!502571 (= res!304090 (bvsgt #b00000000000000000000000000000000 (x!47357 lt!228412)))))

(declare-fun b!502572 () Bool)

(declare-fun res!304081 () Bool)

(assert (=> b!502572 (=> (not res!304081) (not e!294335))))

(declare-datatypes ((List!9766 0))(
  ( (Nil!9763) (Cons!9762 (h!10639 (_ BitVec 64)) (t!15985 List!9766)) )
))
(declare-fun arrayNoDuplicates!0 (array!32378 (_ BitVec 32) List!9766) Bool)

(assert (=> b!502572 (= res!304081 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9763))))

(declare-fun b!502573 () Bool)

(declare-fun res!304087 () Bool)

(assert (=> b!502573 (=> (not res!304087) (not e!294337))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!502573 (= res!304087 (validKeyInArray!0 k0!2280))))

(declare-fun b!502574 () Bool)

(declare-fun res!304083 () Bool)

(assert (=> b!502574 (=> (not res!304083) (not e!294337))))

(assert (=> b!502574 (= res!304083 (and (= (size!15934 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15934 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15934 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!502575 () Bool)

(declare-fun e!294331 () Bool)

(assert (=> b!502575 (= e!294331 e!294333)))

(declare-fun res!304086 () Bool)

(assert (=> b!502575 (=> res!304086 e!294333)))

(assert (=> b!502575 (= res!304086 (or (bvsgt (x!47357 lt!228412) #b01111111111111111111111111111110) (bvslt lt!228407 #b00000000000000000000000000000000) (bvsge lt!228407 (size!15934 a!3235)) (bvslt (index!18322 lt!228412) #b00000000000000000000000000000000) (bvsge (index!18322 lt!228412) (size!15934 a!3235)) (not (= lt!228412 (Intermediate!4033 false (index!18322 lt!228412) (x!47357 lt!228412))))))))

(assert (=> b!502575 (= (index!18322 lt!228412) i!1204)))

(declare-fun lt!228403 () Unit!15202)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!32378 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15202)

(assert (=> b!502575 (= lt!228403 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k0!2280 j!176 lt!228407 #b00000000000000000000000000000000 (index!18322 lt!228412) (x!47357 lt!228412) mask!3524))))

(assert (=> b!502575 (and (or (= (select (arr!15569 a!3235) (index!18322 lt!228412)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15569 a!3235) (index!18322 lt!228412)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15569 a!3235) (index!18322 lt!228412)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15569 a!3235) (index!18322 lt!228412)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!228409 () Unit!15202)

(assert (=> b!502575 (= lt!228409 e!294339)))

(declare-fun c!59523 () Bool)

(assert (=> b!502575 (= c!59523 (= (select (arr!15569 a!3235) (index!18322 lt!228412)) (select (arr!15569 a!3235) j!176)))))

(assert (=> b!502575 (and (bvslt (x!47357 lt!228412) #b01111111111111111111111111111110) (or (= (select (arr!15569 a!3235) (index!18322 lt!228412)) (select (arr!15569 a!3235) j!176)) (= (select (arr!15569 a!3235) (index!18322 lt!228412)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15569 a!3235) (index!18322 lt!228412)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!502576 () Bool)

(declare-fun res!304085 () Bool)

(assert (=> b!502576 (=> (not res!304085) (not e!294335))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32378 (_ BitVec 32)) Bool)

(assert (=> b!502576 (= res!304085 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!502578 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32378 (_ BitVec 32)) SeekEntryResult!4033)

(assert (=> b!502578 (= e!294336 (not (= (seekKeyOrZeroReturnVacant!0 #b00000000000000000000000000000000 lt!228407 (index!18322 lt!228412) (select (arr!15569 a!3235) j!176) a!3235 mask!3524) (Found!4033 j!176))))))

(declare-fun b!502579 () Bool)

(declare-fun res!304080 () Bool)

(assert (=> b!502579 (=> res!304080 e!294331)))

(get-info :version)

(assert (=> b!502579 (= res!304080 (or (undefined!4845 lt!228412) (not ((_ is Intermediate!4033) lt!228412))))))

(declare-fun b!502580 () Bool)

(assert (=> b!502580 (= e!294333 true)))

(declare-fun lt!228411 () SeekEntryResult!4033)

(assert (=> b!502580 (= lt!228411 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228407 lt!228405 lt!228404 mask!3524))))

(declare-fun b!502581 () Bool)

(assert (=> b!502581 (= e!294335 (not e!294331))))

(declare-fun res!304094 () Bool)

(assert (=> b!502581 (=> res!304094 e!294331)))

(declare-fun lt!228406 () (_ BitVec 32))

(assert (=> b!502581 (= res!304094 (= lt!228412 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228406 lt!228405 lt!228404 mask!3524)))))

(assert (=> b!502581 (= lt!228412 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228407 (select (arr!15569 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!502581 (= lt!228406 (toIndex!0 lt!228405 mask!3524))))

(assert (=> b!502581 (= lt!228405 (select (store (arr!15569 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!502581 (= lt!228407 (toIndex!0 (select (arr!15569 a!3235) j!176) mask!3524))))

(assert (=> b!502581 (= lt!228404 (array!32379 (store (arr!15569 a!3235) i!1204 k0!2280) (size!15934 a!3235)))))

(declare-fun e!294338 () Bool)

(assert (=> b!502581 e!294338))

(declare-fun res!304084 () Bool)

(assert (=> b!502581 (=> (not res!304084) (not e!294338))))

(assert (=> b!502581 (= res!304084 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!228410 () Unit!15202)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32378 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15202)

(assert (=> b!502581 (= lt!228410 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!502582 () Bool)

(declare-fun res!304082 () Bool)

(assert (=> b!502582 (=> (not res!304082) (not e!294337))))

(declare-fun arrayContainsKey!0 (array!32378 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!502582 (= res!304082 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun res!304088 () Bool)

(assert (=> start!45612 (=> (not res!304088) (not e!294337))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45612 (= res!304088 (validMask!0 mask!3524))))

(assert (=> start!45612 e!294337))

(assert (=> start!45612 true))

(declare-fun array_inv!11452 (array!32378) Bool)

(assert (=> start!45612 (array_inv!11452 a!3235)))

(declare-fun b!502577 () Bool)

(assert (=> b!502577 (= e!294332 false)))

(declare-fun b!502583 () Bool)

(declare-fun res!304092 () Bool)

(assert (=> b!502583 (=> (not res!304092) (not e!294337))))

(assert (=> b!502583 (= res!304092 (validKeyInArray!0 (select (arr!15569 a!3235) j!176)))))

(declare-fun b!502584 () Bool)

(declare-fun Unit!15205 () Unit!15202)

(assert (=> b!502584 (= e!294339 Unit!15205)))

(declare-fun b!502585 () Bool)

(assert (=> b!502585 (= e!294338 (= (seekEntryOrOpen!0 (select (arr!15569 a!3235) j!176) a!3235 mask!3524) (Found!4033 j!176)))))

(assert (= (and start!45612 res!304088) b!502574))

(assert (= (and b!502574 res!304083) b!502583))

(assert (= (and b!502583 res!304092) b!502573))

(assert (= (and b!502573 res!304087) b!502582))

(assert (= (and b!502582 res!304082) b!502570))

(assert (= (and b!502570 res!304091) b!502576))

(assert (= (and b!502576 res!304085) b!502572))

(assert (= (and b!502572 res!304081) b!502581))

(assert (= (and b!502581 res!304084) b!502585))

(assert (= (and b!502581 (not res!304094)) b!502579))

(assert (= (and b!502579 (not res!304080)) b!502575))

(assert (= (and b!502575 c!59523) b!502569))

(assert (= (and b!502575 (not c!59523)) b!502584))

(assert (= (and b!502569 res!304089) b!502577))

(assert (= (and b!502575 (not res!304086)) b!502571))

(assert (= (and b!502571 res!304090) b!502578))

(assert (= (and b!502571 (not res!304093)) b!502580))

(declare-fun m!482983 () Bool)

(assert (=> b!502573 m!482983))

(declare-fun m!482985 () Bool)

(assert (=> start!45612 m!482985))

(declare-fun m!482987 () Bool)

(assert (=> start!45612 m!482987))

(declare-fun m!482989 () Bool)

(assert (=> b!502575 m!482989))

(declare-fun m!482991 () Bool)

(assert (=> b!502575 m!482991))

(declare-fun m!482993 () Bool)

(assert (=> b!502575 m!482993))

(declare-fun m!482995 () Bool)

(assert (=> b!502581 m!482995))

(declare-fun m!482997 () Bool)

(assert (=> b!502581 m!482997))

(declare-fun m!482999 () Bool)

(assert (=> b!502581 m!482999))

(declare-fun m!483001 () Bool)

(assert (=> b!502581 m!483001))

(assert (=> b!502581 m!482993))

(declare-fun m!483003 () Bool)

(assert (=> b!502581 m!483003))

(assert (=> b!502581 m!482993))

(declare-fun m!483005 () Bool)

(assert (=> b!502581 m!483005))

(assert (=> b!502581 m!482993))

(declare-fun m!483007 () Bool)

(assert (=> b!502581 m!483007))

(declare-fun m!483009 () Bool)

(assert (=> b!502581 m!483009))

(declare-fun m!483011 () Bool)

(assert (=> b!502572 m!483011))

(assert (=> b!502585 m!482993))

(assert (=> b!502585 m!482993))

(declare-fun m!483013 () Bool)

(assert (=> b!502585 m!483013))

(declare-fun m!483015 () Bool)

(assert (=> b!502570 m!483015))

(declare-fun m!483017 () Bool)

(assert (=> b!502580 m!483017))

(declare-fun m!483019 () Bool)

(assert (=> b!502576 m!483019))

(declare-fun m!483021 () Bool)

(assert (=> b!502582 m!483021))

(assert (=> b!502583 m!482993))

(assert (=> b!502583 m!482993))

(declare-fun m!483023 () Bool)

(assert (=> b!502583 m!483023))

(assert (=> b!502578 m!482993))

(assert (=> b!502578 m!482993))

(declare-fun m!483025 () Bool)

(assert (=> b!502578 m!483025))

(declare-fun m!483027 () Bool)

(assert (=> b!502569 m!483027))

(assert (=> b!502569 m!483017))

(check-sat (not b!502585) (not b!502573) (not start!45612) (not b!502569) (not b!502572) (not b!502576) (not b!502580) (not b!502582) (not b!502583) (not b!502581) (not b!502575) (not b!502570) (not b!502578))
(check-sat)
