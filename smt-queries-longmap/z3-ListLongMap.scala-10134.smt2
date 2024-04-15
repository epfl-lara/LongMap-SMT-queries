; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!119510 () Bool)

(assert start!119510)

(declare-fun res!932028 () Bool)

(declare-fun e!788478 () Bool)

(assert (=> start!119510 (=> (not res!932028) (not e!788478))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119510 (= res!932028 (validMask!0 mask!2840))))

(assert (=> start!119510 e!788478))

(assert (=> start!119510 true))

(declare-datatypes ((array!95196 0))(
  ( (array!95197 (arr!45958 (Array (_ BitVec 32) (_ BitVec 64))) (size!46510 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95196)

(declare-fun array_inv!35191 (array!95196) Bool)

(assert (=> start!119510 (array_inv!35191 a!2901)))

(declare-fun b!1392403 () Bool)

(declare-fun e!788477 () Bool)

(assert (=> b!1392403 (= e!788478 (not e!788477))))

(declare-fun res!932035 () Bool)

(assert (=> b!1392403 (=> res!932035 e!788477)))

(declare-datatypes ((SeekEntryResult!10301 0))(
  ( (MissingZero!10301 (index!43575 (_ BitVec 32))) (Found!10301 (index!43576 (_ BitVec 32))) (Intermediate!10301 (undefined!11113 Bool) (index!43577 (_ BitVec 32)) (x!125256 (_ BitVec 32))) (Undefined!10301) (MissingVacant!10301 (index!43578 (_ BitVec 32))) )
))
(declare-fun lt!611440 () SeekEntryResult!10301)

(get-info :version)

(assert (=> b!1392403 (= res!932035 (or (not ((_ is Intermediate!10301) lt!611440)) (undefined!11113 lt!611440)))))

(declare-fun e!788479 () Bool)

(assert (=> b!1392403 e!788479))

(declare-fun res!932030 () Bool)

(assert (=> b!1392403 (=> (not res!932030) (not e!788479))))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95196 (_ BitVec 32)) Bool)

(assert (=> b!1392403 (= res!932030 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46449 0))(
  ( (Unit!46450) )
))
(declare-fun lt!611441 () Unit!46449)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95196 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46449)

(assert (=> b!1392403 (= lt!611441 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95196 (_ BitVec 32)) SeekEntryResult!10301)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1392403 (= lt!611440 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45958 a!2901) j!112) mask!2840) (select (arr!45958 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1392404 () Bool)

(declare-fun res!932033 () Bool)

(assert (=> b!1392404 (=> (not res!932033) (not e!788478))))

(declare-datatypes ((List!32555 0))(
  ( (Nil!32552) (Cons!32551 (h!33781 (_ BitVec 64)) (t!47241 List!32555)) )
))
(declare-fun arrayNoDuplicates!0 (array!95196 (_ BitVec 32) List!32555) Bool)

(assert (=> b!1392404 (= res!932033 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32552))))

(declare-fun b!1392405 () Bool)

(declare-fun res!932029 () Bool)

(assert (=> b!1392405 (=> (not res!932029) (not e!788478))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1392405 (= res!932029 (validKeyInArray!0 (select (arr!45958 a!2901) i!1037)))))

(declare-fun b!1392406 () Bool)

(declare-fun res!932027 () Bool)

(assert (=> b!1392406 (=> res!932027 e!788477)))

(assert (=> b!1392406 (= res!932027 (not (= lt!611440 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!45958 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!45958 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95197 (store (arr!45958 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46510 a!2901)) mask!2840))))))

(declare-fun b!1392407 () Bool)

(declare-fun res!932034 () Bool)

(assert (=> b!1392407 (=> (not res!932034) (not e!788478))))

(assert (=> b!1392407 (= res!932034 (and (= (size!46510 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46510 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46510 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1392408 () Bool)

(assert (=> b!1392408 (= e!788477 (bvsge mask!2840 #b00000000000000000000000000000000))))

(declare-fun b!1392409 () Bool)

(declare-fun res!932031 () Bool)

(assert (=> b!1392409 (=> (not res!932031) (not e!788478))))

(assert (=> b!1392409 (= res!932031 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1392410 () Bool)

(declare-fun res!932032 () Bool)

(assert (=> b!1392410 (=> (not res!932032) (not e!788478))))

(assert (=> b!1392410 (= res!932032 (validKeyInArray!0 (select (arr!45958 a!2901) j!112)))))

(declare-fun b!1392411 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95196 (_ BitVec 32)) SeekEntryResult!10301)

(assert (=> b!1392411 (= e!788479 (= (seekEntryOrOpen!0 (select (arr!45958 a!2901) j!112) a!2901 mask!2840) (Found!10301 j!112)))))

(assert (= (and start!119510 res!932028) b!1392407))

(assert (= (and b!1392407 res!932034) b!1392405))

(assert (= (and b!1392405 res!932029) b!1392410))

(assert (= (and b!1392410 res!932032) b!1392409))

(assert (= (and b!1392409 res!932031) b!1392404))

(assert (= (and b!1392404 res!932033) b!1392403))

(assert (= (and b!1392403 res!932030) b!1392411))

(assert (= (and b!1392403 (not res!932035)) b!1392406))

(assert (= (and b!1392406 (not res!932027)) b!1392408))

(declare-fun m!1277695 () Bool)

(assert (=> b!1392410 m!1277695))

(assert (=> b!1392410 m!1277695))

(declare-fun m!1277697 () Bool)

(assert (=> b!1392410 m!1277697))

(declare-fun m!1277699 () Bool)

(assert (=> b!1392409 m!1277699))

(declare-fun m!1277701 () Bool)

(assert (=> b!1392406 m!1277701))

(declare-fun m!1277703 () Bool)

(assert (=> b!1392406 m!1277703))

(assert (=> b!1392406 m!1277703))

(declare-fun m!1277705 () Bool)

(assert (=> b!1392406 m!1277705))

(assert (=> b!1392406 m!1277705))

(assert (=> b!1392406 m!1277703))

(declare-fun m!1277707 () Bool)

(assert (=> b!1392406 m!1277707))

(assert (=> b!1392403 m!1277695))

(declare-fun m!1277709 () Bool)

(assert (=> b!1392403 m!1277709))

(assert (=> b!1392403 m!1277695))

(declare-fun m!1277711 () Bool)

(assert (=> b!1392403 m!1277711))

(assert (=> b!1392403 m!1277709))

(assert (=> b!1392403 m!1277695))

(declare-fun m!1277713 () Bool)

(assert (=> b!1392403 m!1277713))

(declare-fun m!1277715 () Bool)

(assert (=> b!1392403 m!1277715))

(assert (=> b!1392411 m!1277695))

(assert (=> b!1392411 m!1277695))

(declare-fun m!1277717 () Bool)

(assert (=> b!1392411 m!1277717))

(declare-fun m!1277719 () Bool)

(assert (=> b!1392405 m!1277719))

(assert (=> b!1392405 m!1277719))

(declare-fun m!1277721 () Bool)

(assert (=> b!1392405 m!1277721))

(declare-fun m!1277723 () Bool)

(assert (=> start!119510 m!1277723))

(declare-fun m!1277725 () Bool)

(assert (=> start!119510 m!1277725))

(declare-fun m!1277727 () Bool)

(assert (=> b!1392404 m!1277727))

(check-sat (not b!1392403) (not start!119510) (not b!1392409) (not b!1392411) (not b!1392404) (not b!1392410) (not b!1392406) (not b!1392405))
(check-sat)
