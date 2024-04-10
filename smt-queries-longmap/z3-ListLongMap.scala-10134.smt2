; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!119516 () Bool)

(assert start!119516)

(declare-fun e!788528 () Bool)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95249 0))(
  ( (array!95250 (arr!45984 (Array (_ BitVec 32) (_ BitVec 64))) (size!46534 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95249)

(declare-fun b!1392511 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10301 0))(
  ( (MissingZero!10301 (index!43575 (_ BitVec 32))) (Found!10301 (index!43576 (_ BitVec 32))) (Intermediate!10301 (undefined!11113 Bool) (index!43577 (_ BitVec 32)) (x!125259 (_ BitVec 32))) (Undefined!10301) (MissingVacant!10301 (index!43578 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95249 (_ BitVec 32)) SeekEntryResult!10301)

(assert (=> b!1392511 (= e!788528 (= (seekEntryOrOpen!0 (select (arr!45984 a!2901) j!112) a!2901 mask!2840) (Found!10301 j!112)))))

(declare-fun b!1392512 () Bool)

(declare-fun res!932087 () Bool)

(declare-fun e!788531 () Bool)

(assert (=> b!1392512 (=> (not res!932087) (not e!788531))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1392512 (= res!932087 (and (= (size!46534 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46534 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46534 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1392513 () Bool)

(declare-fun e!788529 () Bool)

(assert (=> b!1392513 (= e!788529 (bvsge mask!2840 #b00000000000000000000000000000000))))

(declare-fun b!1392514 () Bool)

(declare-fun res!932092 () Bool)

(assert (=> b!1392514 (=> (not res!932092) (not e!788531))))

(declare-datatypes ((List!32503 0))(
  ( (Nil!32500) (Cons!32499 (h!33729 (_ BitVec 64)) (t!47197 List!32503)) )
))
(declare-fun arrayNoDuplicates!0 (array!95249 (_ BitVec 32) List!32503) Bool)

(assert (=> b!1392514 (= res!932092 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32500))))

(declare-fun b!1392515 () Bool)

(assert (=> b!1392515 (= e!788531 (not e!788529))))

(declare-fun res!932085 () Bool)

(assert (=> b!1392515 (=> res!932085 e!788529)))

(declare-fun lt!611636 () SeekEntryResult!10301)

(get-info :version)

(assert (=> b!1392515 (= res!932085 (or (not ((_ is Intermediate!10301) lt!611636)) (undefined!11113 lt!611636)))))

(assert (=> b!1392515 e!788528))

(declare-fun res!932090 () Bool)

(assert (=> b!1392515 (=> (not res!932090) (not e!788528))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95249 (_ BitVec 32)) Bool)

(assert (=> b!1392515 (= res!932090 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46606 0))(
  ( (Unit!46607) )
))
(declare-fun lt!611637 () Unit!46606)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95249 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46606)

(assert (=> b!1392515 (= lt!611637 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95249 (_ BitVec 32)) SeekEntryResult!10301)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1392515 (= lt!611636 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45984 a!2901) j!112) mask!2840) (select (arr!45984 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1392516 () Bool)

(declare-fun res!932089 () Bool)

(assert (=> b!1392516 (=> (not res!932089) (not e!788531))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1392516 (= res!932089 (validKeyInArray!0 (select (arr!45984 a!2901) j!112)))))

(declare-fun b!1392517 () Bool)

(declare-fun res!932084 () Bool)

(assert (=> b!1392517 (=> (not res!932084) (not e!788531))))

(assert (=> b!1392517 (= res!932084 (validKeyInArray!0 (select (arr!45984 a!2901) i!1037)))))

(declare-fun b!1392518 () Bool)

(declare-fun res!932088 () Bool)

(assert (=> b!1392518 (=> (not res!932088) (not e!788531))))

(assert (=> b!1392518 (= res!932088 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun res!932086 () Bool)

(assert (=> start!119516 (=> (not res!932086) (not e!788531))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119516 (= res!932086 (validMask!0 mask!2840))))

(assert (=> start!119516 e!788531))

(assert (=> start!119516 true))

(declare-fun array_inv!35012 (array!95249) Bool)

(assert (=> start!119516 (array_inv!35012 a!2901)))

(declare-fun b!1392519 () Bool)

(declare-fun res!932091 () Bool)

(assert (=> b!1392519 (=> res!932091 e!788529)))

(assert (=> b!1392519 (= res!932091 (not (= lt!611636 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!45984 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!45984 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95250 (store (arr!45984 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46534 a!2901)) mask!2840))))))

(assert (= (and start!119516 res!932086) b!1392512))

(assert (= (and b!1392512 res!932087) b!1392517))

(assert (= (and b!1392517 res!932084) b!1392516))

(assert (= (and b!1392516 res!932089) b!1392518))

(assert (= (and b!1392518 res!932088) b!1392514))

(assert (= (and b!1392514 res!932092) b!1392515))

(assert (= (and b!1392515 res!932090) b!1392511))

(assert (= (and b!1392515 (not res!932085)) b!1392519))

(assert (= (and b!1392519 (not res!932091)) b!1392513))

(declare-fun m!1278265 () Bool)

(assert (=> b!1392516 m!1278265))

(assert (=> b!1392516 m!1278265))

(declare-fun m!1278267 () Bool)

(assert (=> b!1392516 m!1278267))

(assert (=> b!1392515 m!1278265))

(declare-fun m!1278269 () Bool)

(assert (=> b!1392515 m!1278269))

(assert (=> b!1392515 m!1278265))

(declare-fun m!1278271 () Bool)

(assert (=> b!1392515 m!1278271))

(assert (=> b!1392515 m!1278269))

(assert (=> b!1392515 m!1278265))

(declare-fun m!1278273 () Bool)

(assert (=> b!1392515 m!1278273))

(declare-fun m!1278275 () Bool)

(assert (=> b!1392515 m!1278275))

(declare-fun m!1278277 () Bool)

(assert (=> b!1392517 m!1278277))

(assert (=> b!1392517 m!1278277))

(declare-fun m!1278279 () Bool)

(assert (=> b!1392517 m!1278279))

(declare-fun m!1278281 () Bool)

(assert (=> b!1392519 m!1278281))

(declare-fun m!1278283 () Bool)

(assert (=> b!1392519 m!1278283))

(assert (=> b!1392519 m!1278283))

(declare-fun m!1278285 () Bool)

(assert (=> b!1392519 m!1278285))

(assert (=> b!1392519 m!1278285))

(assert (=> b!1392519 m!1278283))

(declare-fun m!1278287 () Bool)

(assert (=> b!1392519 m!1278287))

(declare-fun m!1278289 () Bool)

(assert (=> b!1392514 m!1278289))

(declare-fun m!1278291 () Bool)

(assert (=> b!1392518 m!1278291))

(declare-fun m!1278293 () Bool)

(assert (=> start!119516 m!1278293))

(declare-fun m!1278295 () Bool)

(assert (=> start!119516 m!1278295))

(assert (=> b!1392511 m!1278265))

(assert (=> b!1392511 m!1278265))

(declare-fun m!1278297 () Bool)

(assert (=> b!1392511 m!1278297))

(check-sat (not b!1392511) (not b!1392515) (not b!1392518) (not b!1392519) (not b!1392516) (not b!1392514) (not b!1392517) (not start!119516))
(check-sat)
