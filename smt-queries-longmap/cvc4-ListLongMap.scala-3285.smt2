; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45658 () Bool)

(assert start!45658)

(declare-fun b!503707 () Bool)

(declare-fun e!294964 () Bool)

(declare-fun e!294966 () Bool)

(assert (=> b!503707 (= e!294964 e!294966)))

(declare-fun res!304987 () Bool)

(assert (=> b!503707 (=> res!304987 e!294966)))

(declare-datatypes ((array!32414 0))(
  ( (array!32415 (arr!15587 (Array (_ BitVec 32) (_ BitVec 64))) (size!15951 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32414)

(declare-fun lt!229206 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4054 0))(
  ( (MissingZero!4054 (index!18404 (_ BitVec 32))) (Found!4054 (index!18405 (_ BitVec 32))) (Intermediate!4054 (undefined!4866 Bool) (index!18406 (_ BitVec 32)) (x!47423 (_ BitVec 32))) (Undefined!4054) (MissingVacant!4054 (index!18407 (_ BitVec 32))) )
))
(declare-fun lt!229203 () SeekEntryResult!4054)

(assert (=> b!503707 (= res!304987 (or (bvsgt (x!47423 lt!229203) #b01111111111111111111111111111110) (bvslt lt!229206 #b00000000000000000000000000000000) (bvsge lt!229206 (size!15951 a!3235)) (bvslt (index!18406 lt!229203) #b00000000000000000000000000000000) (bvsge (index!18406 lt!229203) (size!15951 a!3235)) (not (= lt!229203 (Intermediate!4054 false (index!18406 lt!229203) (x!47423 lt!229203))))))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!503707 (= (index!18406 lt!229203) i!1204)))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((Unit!15292 0))(
  ( (Unit!15293) )
))
(declare-fun lt!229205 () Unit!15292)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!32414 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15292)

(assert (=> b!503707 (= lt!229205 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k!2280 j!176 lt!229206 #b00000000000000000000000000000000 (index!18406 lt!229203) (x!47423 lt!229203) mask!3524))))

(assert (=> b!503707 (and (or (= (select (arr!15587 a!3235) (index!18406 lt!229203)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15587 a!3235) (index!18406 lt!229203)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15587 a!3235) (index!18406 lt!229203)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15587 a!3235) (index!18406 lt!229203)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!229202 () Unit!15292)

(declare-fun e!294967 () Unit!15292)

(assert (=> b!503707 (= lt!229202 e!294967)))

(declare-fun c!59645 () Bool)

(assert (=> b!503707 (= c!59645 (= (select (arr!15587 a!3235) (index!18406 lt!229203)) (select (arr!15587 a!3235) j!176)))))

(assert (=> b!503707 (and (bvslt (x!47423 lt!229203) #b01111111111111111111111111111110) (or (= (select (arr!15587 a!3235) (index!18406 lt!229203)) (select (arr!15587 a!3235) j!176)) (= (select (arr!15587 a!3235) (index!18406 lt!229203)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15587 a!3235) (index!18406 lt!229203)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!503708 () Bool)

(declare-fun res!304985 () Bool)

(declare-fun e!294968 () Bool)

(assert (=> b!503708 (=> (not res!304985) (not e!294968))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32414 (_ BitVec 32)) Bool)

(assert (=> b!503708 (= res!304985 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!503709 () Bool)

(declare-fun res!304984 () Bool)

(declare-fun e!294972 () Bool)

(assert (=> b!503709 (=> (not res!304984) (not e!294972))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!503709 (= res!304984 (validKeyInArray!0 (select (arr!15587 a!3235) j!176)))))

(declare-fun b!503710 () Bool)

(declare-fun res!304986 () Bool)

(assert (=> b!503710 (=> (not res!304986) (not e!294972))))

(declare-fun arrayContainsKey!0 (array!32414 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!503710 (= res!304986 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!503711 () Bool)

(declare-fun Unit!15294 () Unit!15292)

(assert (=> b!503711 (= e!294967 Unit!15294)))

(declare-fun b!503712 () Bool)

(declare-fun res!304975 () Bool)

(assert (=> b!503712 (=> (not res!304975) (not e!294968))))

(declare-datatypes ((List!9745 0))(
  ( (Nil!9742) (Cons!9741 (h!10618 (_ BitVec 64)) (t!15973 List!9745)) )
))
(declare-fun arrayNoDuplicates!0 (array!32414 (_ BitVec 32) List!9745) Bool)

(assert (=> b!503712 (= res!304975 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9742))))

(declare-fun b!503713 () Bool)

(declare-fun res!304978 () Bool)

(assert (=> b!503713 (=> (not res!304978) (not e!294972))))

(assert (=> b!503713 (= res!304978 (validKeyInArray!0 k!2280))))

(declare-fun e!294969 () Bool)

(declare-fun b!503714 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32414 (_ BitVec 32)) SeekEntryResult!4054)

(assert (=> b!503714 (= e!294969 (= (seekEntryOrOpen!0 (select (arr!15587 a!3235) j!176) a!3235 mask!3524) (Found!4054 j!176)))))

(declare-fun b!503715 () Bool)

(assert (=> b!503715 (= e!294972 e!294968)))

(declare-fun res!304988 () Bool)

(assert (=> b!503715 (=> (not res!304988) (not e!294968))))

(declare-fun lt!229201 () SeekEntryResult!4054)

(assert (=> b!503715 (= res!304988 (or (= lt!229201 (MissingZero!4054 i!1204)) (= lt!229201 (MissingVacant!4054 i!1204))))))

(assert (=> b!503715 (= lt!229201 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!503716 () Bool)

(assert (=> b!503716 (= e!294966 true)))

(declare-fun lt!229198 () array!32414)

(declare-fun lt!229207 () (_ BitVec 64))

(declare-fun lt!229200 () SeekEntryResult!4054)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32414 (_ BitVec 32)) SeekEntryResult!4054)

(assert (=> b!503716 (= lt!229200 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229206 lt!229207 lt!229198 mask!3524))))

(declare-fun res!304980 () Bool)

(assert (=> start!45658 (=> (not res!304980) (not e!294972))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45658 (= res!304980 (validMask!0 mask!3524))))

(assert (=> start!45658 e!294972))

(assert (=> start!45658 true))

(declare-fun array_inv!11383 (array!32414) Bool)

(assert (=> start!45658 (array_inv!11383 a!3235)))

(declare-fun b!503717 () Bool)

(declare-fun res!304974 () Bool)

(assert (=> b!503717 (=> (not res!304974) (not e!294972))))

(assert (=> b!503717 (= res!304974 (and (= (size!15951 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15951 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15951 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!503718 () Bool)

(declare-fun res!304977 () Bool)

(assert (=> b!503718 (=> res!304977 e!294966)))

(declare-fun e!294965 () Bool)

(assert (=> b!503718 (= res!304977 e!294965)))

(declare-fun res!304976 () Bool)

(assert (=> b!503718 (=> (not res!304976) (not e!294965))))

(assert (=> b!503718 (= res!304976 (bvsgt #b00000000000000000000000000000000 (x!47423 lt!229203)))))

(declare-fun b!503719 () Bool)

(declare-fun e!294971 () Bool)

(assert (=> b!503719 (= e!294971 false)))

(declare-fun b!503720 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32414 (_ BitVec 32)) SeekEntryResult!4054)

(assert (=> b!503720 (= e!294965 (not (= (seekKeyOrZeroReturnVacant!0 #b00000000000000000000000000000000 lt!229206 (index!18406 lt!229203) (select (arr!15587 a!3235) j!176) a!3235 mask!3524) (Found!4054 j!176))))))

(declare-fun b!503721 () Bool)

(assert (=> b!503721 (= e!294968 (not e!294964))))

(declare-fun res!304982 () Bool)

(assert (=> b!503721 (=> res!304982 e!294964)))

(declare-fun lt!229204 () (_ BitVec 32))

(assert (=> b!503721 (= res!304982 (= lt!229203 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229204 lt!229207 lt!229198 mask!3524)))))

(assert (=> b!503721 (= lt!229203 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229206 (select (arr!15587 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!503721 (= lt!229204 (toIndex!0 lt!229207 mask!3524))))

(assert (=> b!503721 (= lt!229207 (select (store (arr!15587 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!503721 (= lt!229206 (toIndex!0 (select (arr!15587 a!3235) j!176) mask!3524))))

(assert (=> b!503721 (= lt!229198 (array!32415 (store (arr!15587 a!3235) i!1204 k!2280) (size!15951 a!3235)))))

(assert (=> b!503721 e!294969))

(declare-fun res!304983 () Bool)

(assert (=> b!503721 (=> (not res!304983) (not e!294969))))

(assert (=> b!503721 (= res!304983 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!229199 () Unit!15292)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32414 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15292)

(assert (=> b!503721 (= lt!229199 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!503722 () Bool)

(declare-fun res!304979 () Bool)

(assert (=> b!503722 (=> res!304979 e!294964)))

(assert (=> b!503722 (= res!304979 (or (undefined!4866 lt!229203) (not (is-Intermediate!4054 lt!229203))))))

(declare-fun b!503723 () Bool)

(declare-fun Unit!15295 () Unit!15292)

(assert (=> b!503723 (= e!294967 Unit!15295)))

(declare-fun lt!229197 () Unit!15292)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32414 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15292)

(assert (=> b!503723 (= lt!229197 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!229206 #b00000000000000000000000000000000 (index!18406 lt!229203) (x!47423 lt!229203) mask!3524))))

(declare-fun res!304981 () Bool)

(assert (=> b!503723 (= res!304981 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229206 lt!229207 lt!229198 mask!3524) (Intermediate!4054 false (index!18406 lt!229203) (x!47423 lt!229203))))))

(assert (=> b!503723 (=> (not res!304981) (not e!294971))))

(assert (=> b!503723 e!294971))

(assert (= (and start!45658 res!304980) b!503717))

(assert (= (and b!503717 res!304974) b!503709))

(assert (= (and b!503709 res!304984) b!503713))

(assert (= (and b!503713 res!304978) b!503710))

(assert (= (and b!503710 res!304986) b!503715))

(assert (= (and b!503715 res!304988) b!503708))

(assert (= (and b!503708 res!304985) b!503712))

(assert (= (and b!503712 res!304975) b!503721))

(assert (= (and b!503721 res!304983) b!503714))

(assert (= (and b!503721 (not res!304982)) b!503722))

(assert (= (and b!503722 (not res!304979)) b!503707))

(assert (= (and b!503707 c!59645) b!503723))

(assert (= (and b!503707 (not c!59645)) b!503711))

(assert (= (and b!503723 res!304981) b!503719))

(assert (= (and b!503707 (not res!304987)) b!503718))

(assert (= (and b!503718 res!304976) b!503720))

(assert (= (and b!503718 (not res!304977)) b!503716))

(declare-fun m!484517 () Bool)

(assert (=> b!503723 m!484517))

(declare-fun m!484519 () Bool)

(assert (=> b!503723 m!484519))

(declare-fun m!484521 () Bool)

(assert (=> b!503710 m!484521))

(declare-fun m!484523 () Bool)

(assert (=> b!503720 m!484523))

(assert (=> b!503720 m!484523))

(declare-fun m!484525 () Bool)

(assert (=> b!503720 m!484525))

(assert (=> b!503709 m!484523))

(assert (=> b!503709 m!484523))

(declare-fun m!484527 () Bool)

(assert (=> b!503709 m!484527))

(assert (=> b!503716 m!484519))

(assert (=> b!503714 m!484523))

(assert (=> b!503714 m!484523))

(declare-fun m!484529 () Bool)

(assert (=> b!503714 m!484529))

(declare-fun m!484531 () Bool)

(assert (=> b!503713 m!484531))

(declare-fun m!484533 () Bool)

(assert (=> b!503721 m!484533))

(declare-fun m!484535 () Bool)

(assert (=> b!503721 m!484535))

(declare-fun m!484537 () Bool)

(assert (=> b!503721 m!484537))

(assert (=> b!503721 m!484523))

(declare-fun m!484539 () Bool)

(assert (=> b!503721 m!484539))

(assert (=> b!503721 m!484523))

(declare-fun m!484541 () Bool)

(assert (=> b!503721 m!484541))

(declare-fun m!484543 () Bool)

(assert (=> b!503721 m!484543))

(assert (=> b!503721 m!484523))

(declare-fun m!484545 () Bool)

(assert (=> b!503721 m!484545))

(declare-fun m!484547 () Bool)

(assert (=> b!503721 m!484547))

(declare-fun m!484549 () Bool)

(assert (=> b!503715 m!484549))

(declare-fun m!484551 () Bool)

(assert (=> b!503712 m!484551))

(declare-fun m!484553 () Bool)

(assert (=> b!503708 m!484553))

(declare-fun m!484555 () Bool)

(assert (=> start!45658 m!484555))

(declare-fun m!484557 () Bool)

(assert (=> start!45658 m!484557))

(declare-fun m!484559 () Bool)

(assert (=> b!503707 m!484559))

(declare-fun m!484561 () Bool)

(assert (=> b!503707 m!484561))

(assert (=> b!503707 m!484523))

(push 1)

