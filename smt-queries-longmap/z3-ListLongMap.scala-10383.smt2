; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122216 () Bool)

(assert start!122216)

(declare-fun b!1417694 () Bool)

(declare-fun e!802315 () Bool)

(declare-datatypes ((array!96753 0))(
  ( (array!96754 (arr!46705 (Array (_ BitVec 32) (_ BitVec 64))) (size!47257 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!96753)

(assert (=> b!1417694 (= e!802315 (and (bvsle #b00000000000000000000000000000000 (size!47257 a!2831)) (bvsge (size!47257 a!2831) #b01111111111111111111111111111111)))))

(declare-fun res!953475 () Bool)

(assert (=> start!122216 (=> (not res!953475) (not e!802315))))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122216 (= res!953475 (validMask!0 mask!2608))))

(assert (=> start!122216 e!802315))

(assert (=> start!122216 true))

(declare-fun array_inv!35938 (array!96753) Bool)

(assert (=> start!122216 (array_inv!35938 a!2831)))

(declare-fun b!1417695 () Bool)

(declare-fun res!953477 () Bool)

(assert (=> b!1417695 (=> (not res!953477) (not e!802315))))

(declare-fun i!982 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1417695 (= res!953477 (validKeyInArray!0 (select (arr!46705 a!2831) i!982)))))

(declare-fun b!1417696 () Bool)

(declare-fun res!953476 () Bool)

(assert (=> b!1417696 (=> (not res!953476) (not e!802315))))

(declare-fun j!81 () (_ BitVec 32))

(assert (=> b!1417696 (= res!953476 (validKeyInArray!0 (select (arr!46705 a!2831) j!81)))))

(declare-fun b!1417697 () Bool)

(declare-fun res!953479 () Bool)

(assert (=> b!1417697 (=> (not res!953479) (not e!802315))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96753 (_ BitVec 32)) Bool)

(assert (=> b!1417697 (= res!953479 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1417698 () Bool)

(declare-fun res!953478 () Bool)

(assert (=> b!1417698 (=> (not res!953478) (not e!802315))))

(assert (=> b!1417698 (= res!953478 (and (= (size!47257 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47257 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47257 a!2831)) (not (= i!982 j!81))))))

(assert (= (and start!122216 res!953475) b!1417698))

(assert (= (and b!1417698 res!953478) b!1417695))

(assert (= (and b!1417695 res!953477) b!1417696))

(assert (= (and b!1417696 res!953476) b!1417697))

(assert (= (and b!1417697 res!953479) b!1417694))

(declare-fun m!1308019 () Bool)

(assert (=> start!122216 m!1308019))

(declare-fun m!1308021 () Bool)

(assert (=> start!122216 m!1308021))

(declare-fun m!1308023 () Bool)

(assert (=> b!1417695 m!1308023))

(assert (=> b!1417695 m!1308023))

(declare-fun m!1308025 () Bool)

(assert (=> b!1417695 m!1308025))

(declare-fun m!1308027 () Bool)

(assert (=> b!1417696 m!1308027))

(assert (=> b!1417696 m!1308027))

(declare-fun m!1308029 () Bool)

(assert (=> b!1417696 m!1308029))

(declare-fun m!1308031 () Bool)

(assert (=> b!1417697 m!1308031))

(check-sat (not b!1417696) (not b!1417697) (not b!1417695) (not start!122216))
(check-sat)
(get-model)

(declare-fun d!152587 () Bool)

(assert (=> d!152587 (= (validKeyInArray!0 (select (arr!46705 a!2831) j!81)) (and (not (= (select (arr!46705 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46705 a!2831) j!81) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1417696 d!152587))

(declare-fun b!1417737 () Bool)

(declare-fun e!802335 () Bool)

(declare-fun call!67205 () Bool)

(assert (=> b!1417737 (= e!802335 call!67205)))

(declare-fun b!1417738 () Bool)

(declare-fun e!802337 () Bool)

(assert (=> b!1417738 (= e!802337 e!802335)))

(declare-fun c!131596 () Bool)

(assert (=> b!1417738 (= c!131596 (validKeyInArray!0 (select (arr!46705 a!2831) #b00000000000000000000000000000000)))))

(declare-fun d!152589 () Bool)

(declare-fun res!953515 () Bool)

(assert (=> d!152589 (=> res!953515 e!802337)))

(assert (=> d!152589 (= res!953515 (bvsge #b00000000000000000000000000000000 (size!47257 a!2831)))))

(assert (=> d!152589 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608) e!802337)))

(declare-fun b!1417739 () Bool)

(declare-fun e!802336 () Bool)

(assert (=> b!1417739 (= e!802335 e!802336)))

(declare-fun lt!625258 () (_ BitVec 64))

(assert (=> b!1417739 (= lt!625258 (select (arr!46705 a!2831) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!47889 0))(
  ( (Unit!47890) )
))
(declare-fun lt!625259 () Unit!47889)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!96753 (_ BitVec 64) (_ BitVec 32)) Unit!47889)

(assert (=> b!1417739 (= lt!625259 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2831 lt!625258 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!96753 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1417739 (arrayContainsKey!0 a!2831 lt!625258 #b00000000000000000000000000000000)))

(declare-fun lt!625257 () Unit!47889)

(assert (=> b!1417739 (= lt!625257 lt!625259)))

(declare-fun res!953514 () Bool)

(declare-datatypes ((SeekEntryResult!11036 0))(
  ( (MissingZero!11036 (index!46536 (_ BitVec 32))) (Found!11036 (index!46537 (_ BitVec 32))) (Intermediate!11036 (undefined!11848 Bool) (index!46538 (_ BitVec 32)) (x!128148 (_ BitVec 32))) (Undefined!11036) (MissingVacant!11036 (index!46539 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96753 (_ BitVec 32)) SeekEntryResult!11036)

(assert (=> b!1417739 (= res!953514 (= (seekEntryOrOpen!0 (select (arr!46705 a!2831) #b00000000000000000000000000000000) a!2831 mask!2608) (Found!11036 #b00000000000000000000000000000000)))))

(assert (=> b!1417739 (=> (not res!953514) (not e!802336))))

(declare-fun b!1417740 () Bool)

(assert (=> b!1417740 (= e!802336 call!67205)))

(declare-fun bm!67202 () Bool)

(assert (=> bm!67202 (= call!67205 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2831 mask!2608))))

(assert (= (and d!152589 (not res!953515)) b!1417738))

(assert (= (and b!1417738 c!131596) b!1417739))

(assert (= (and b!1417738 (not c!131596)) b!1417737))

(assert (= (and b!1417739 res!953514) b!1417740))

(assert (= (or b!1417740 b!1417737) bm!67202))

(declare-fun m!1308061 () Bool)

(assert (=> b!1417738 m!1308061))

(assert (=> b!1417738 m!1308061))

(declare-fun m!1308063 () Bool)

(assert (=> b!1417738 m!1308063))

(assert (=> b!1417739 m!1308061))

(declare-fun m!1308065 () Bool)

(assert (=> b!1417739 m!1308065))

(declare-fun m!1308067 () Bool)

(assert (=> b!1417739 m!1308067))

(assert (=> b!1417739 m!1308061))

(declare-fun m!1308069 () Bool)

(assert (=> b!1417739 m!1308069))

(declare-fun m!1308071 () Bool)

(assert (=> bm!67202 m!1308071))

(assert (=> b!1417697 d!152589))

(declare-fun d!152595 () Bool)

(assert (=> d!152595 (= (validKeyInArray!0 (select (arr!46705 a!2831) i!982)) (and (not (= (select (arr!46705 a!2831) i!982) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46705 a!2831) i!982) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1417695 d!152595))

(declare-fun d!152597 () Bool)

(assert (=> d!152597 (= (validMask!0 mask!2608) (and (or (= mask!2608 #b00000000000000000000000000000111) (= mask!2608 #b00000000000000000000000000001111) (= mask!2608 #b00000000000000000000000000011111) (= mask!2608 #b00000000000000000000000000111111) (= mask!2608 #b00000000000000000000000001111111) (= mask!2608 #b00000000000000000000000011111111) (= mask!2608 #b00000000000000000000000111111111) (= mask!2608 #b00000000000000000000001111111111) (= mask!2608 #b00000000000000000000011111111111) (= mask!2608 #b00000000000000000000111111111111) (= mask!2608 #b00000000000000000001111111111111) (= mask!2608 #b00000000000000000011111111111111) (= mask!2608 #b00000000000000000111111111111111) (= mask!2608 #b00000000000000001111111111111111) (= mask!2608 #b00000000000000011111111111111111) (= mask!2608 #b00000000000000111111111111111111) (= mask!2608 #b00000000000001111111111111111111) (= mask!2608 #b00000000000011111111111111111111) (= mask!2608 #b00000000000111111111111111111111) (= mask!2608 #b00000000001111111111111111111111) (= mask!2608 #b00000000011111111111111111111111) (= mask!2608 #b00000000111111111111111111111111) (= mask!2608 #b00000001111111111111111111111111) (= mask!2608 #b00000011111111111111111111111111) (= mask!2608 #b00000111111111111111111111111111) (= mask!2608 #b00001111111111111111111111111111) (= mask!2608 #b00011111111111111111111111111111) (= mask!2608 #b00111111111111111111111111111111)) (bvsle mask!2608 #b00111111111111111111111111111111)))))

(assert (=> start!122216 d!152597))

(declare-fun d!152605 () Bool)

(assert (=> d!152605 (= (array_inv!35938 a!2831) (bvsge (size!47257 a!2831) #b00000000000000000000000000000000))))

(assert (=> start!122216 d!152605))

(check-sat (not b!1417738) (not bm!67202) (not b!1417739))
(check-sat)
