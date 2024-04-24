; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!123488 () Bool)

(assert start!123488)

(declare-fun b!1430508 () Bool)

(declare-fun e!807919 () Bool)

(assert (=> b!1430508 (= e!807919 (not true))))

(declare-fun e!807920 () Bool)

(assert (=> b!1430508 e!807920))

(declare-fun res!964263 () Bool)

(assert (=> b!1430508 (=> (not res!964263) (not e!807920))))

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((array!97520 0))(
  ( (array!97521 (arr!47068 (Array (_ BitVec 32) (_ BitVec 64))) (size!47619 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97520)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97520 (_ BitVec 32)) Bool)

(assert (=> b!1430508 (= res!964263 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48275 0))(
  ( (Unit!48276) )
))
(declare-fun lt!629749 () Unit!48275)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97520 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48275)

(assert (=> b!1430508 (= lt!629749 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1430509 () Bool)

(declare-fun res!964255 () Bool)

(declare-fun e!807922 () Bool)

(assert (=> b!1430509 (=> (not res!964255) (not e!807922))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1430509 (= res!964255 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47619 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47619 a!2831))))))

(declare-fun b!1430510 () Bool)

(declare-fun res!964256 () Bool)

(assert (=> b!1430510 (=> (not res!964256) (not e!807919))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1430510 (= res!964256 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun res!964257 () Bool)

(assert (=> start!123488 (=> (not res!964257) (not e!807922))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123488 (= res!964257 (validMask!0 mask!2608))))

(assert (=> start!123488 e!807922))

(assert (=> start!123488 true))

(declare-fun array_inv!36349 (array!97520) Bool)

(assert (=> start!123488 (array_inv!36349 a!2831)))

(declare-fun b!1430511 () Bool)

(declare-fun res!964252 () Bool)

(assert (=> b!1430511 (=> (not res!964252) (not e!807922))))

(declare-fun i!982 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1430511 (= res!964252 (validKeyInArray!0 (select (arr!47068 a!2831) i!982)))))

(declare-fun b!1430512 () Bool)

(declare-fun res!964261 () Bool)

(assert (=> b!1430512 (=> (not res!964261) (not e!807919))))

(declare-fun lt!629752 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!11249 0))(
  ( (MissingZero!11249 (index!47388 (_ BitVec 32))) (Found!11249 (index!47389 (_ BitVec 32))) (Intermediate!11249 (undefined!12061 Bool) (index!47390 (_ BitVec 32)) (x!129188 (_ BitVec 32))) (Undefined!11249) (MissingVacant!11249 (index!47391 (_ BitVec 32))) )
))
(declare-fun lt!629751 () SeekEntryResult!11249)

(declare-fun lt!629750 () array!97520)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97520 (_ BitVec 32)) SeekEntryResult!11249)

(assert (=> b!1430512 (= res!964261 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!629752 lt!629750 mask!2608) lt!629751))))

(declare-fun b!1430513 () Bool)

(declare-fun res!964259 () Bool)

(assert (=> b!1430513 (=> (not res!964259) (not e!807922))))

(assert (=> b!1430513 (= res!964259 (validKeyInArray!0 (select (arr!47068 a!2831) j!81)))))

(declare-fun b!1430514 () Bool)

(declare-fun e!807921 () Bool)

(assert (=> b!1430514 (= e!807921 e!807919)))

(declare-fun res!964264 () Bool)

(assert (=> b!1430514 (=> (not res!964264) (not e!807919))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1430514 (= res!964264 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!629752 mask!2608) lt!629752 lt!629750 mask!2608) lt!629751))))

(assert (=> b!1430514 (= lt!629751 (Intermediate!11249 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1430514 (= lt!629752 (select (store (arr!47068 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1430514 (= lt!629750 (array!97521 (store (arr!47068 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47619 a!2831)))))

(declare-fun b!1430515 () Bool)

(declare-fun res!964253 () Bool)

(assert (=> b!1430515 (=> (not res!964253) (not e!807922))))

(assert (=> b!1430515 (= res!964253 (and (= (size!47619 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47619 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47619 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1430516 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97520 (_ BitVec 32)) SeekEntryResult!11249)

(assert (=> b!1430516 (= e!807920 (= (seekEntryOrOpen!0 (select (arr!47068 a!2831) j!81) a!2831 mask!2608) (Found!11249 j!81)))))

(declare-fun b!1430517 () Bool)

(declare-fun res!964258 () Bool)

(assert (=> b!1430517 (=> (not res!964258) (not e!807919))))

(declare-fun lt!629753 () SeekEntryResult!11249)

(assert (=> b!1430517 (= res!964258 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47068 a!2831) j!81) a!2831 mask!2608) lt!629753))))

(declare-fun b!1430518 () Bool)

(declare-fun res!964260 () Bool)

(assert (=> b!1430518 (=> (not res!964260) (not e!807922))))

(assert (=> b!1430518 (= res!964260 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1430519 () Bool)

(assert (=> b!1430519 (= e!807922 e!807921)))

(declare-fun res!964262 () Bool)

(assert (=> b!1430519 (=> (not res!964262) (not e!807921))))

(assert (=> b!1430519 (= res!964262 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47068 a!2831) j!81) mask!2608) (select (arr!47068 a!2831) j!81) a!2831 mask!2608) lt!629753))))

(assert (=> b!1430519 (= lt!629753 (Intermediate!11249 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1430520 () Bool)

(declare-fun res!964254 () Bool)

(assert (=> b!1430520 (=> (not res!964254) (not e!807922))))

(declare-datatypes ((List!33565 0))(
  ( (Nil!33562) (Cons!33561 (h!34886 (_ BitVec 64)) (t!48251 List!33565)) )
))
(declare-fun arrayNoDuplicates!0 (array!97520 (_ BitVec 32) List!33565) Bool)

(assert (=> b!1430520 (= res!964254 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33562))))

(assert (= (and start!123488 res!964257) b!1430515))

(assert (= (and b!1430515 res!964253) b!1430511))

(assert (= (and b!1430511 res!964252) b!1430513))

(assert (= (and b!1430513 res!964259) b!1430518))

(assert (= (and b!1430518 res!964260) b!1430520))

(assert (= (and b!1430520 res!964254) b!1430509))

(assert (= (and b!1430509 res!964255) b!1430519))

(assert (= (and b!1430519 res!964262) b!1430514))

(assert (= (and b!1430514 res!964264) b!1430517))

(assert (= (and b!1430517 res!964258) b!1430512))

(assert (= (and b!1430512 res!964261) b!1430510))

(assert (= (and b!1430510 res!964256) b!1430508))

(assert (= (and b!1430508 res!964263) b!1430516))

(declare-fun m!1320735 () Bool)

(assert (=> b!1430513 m!1320735))

(assert (=> b!1430513 m!1320735))

(declare-fun m!1320737 () Bool)

(assert (=> b!1430513 m!1320737))

(assert (=> b!1430519 m!1320735))

(assert (=> b!1430519 m!1320735))

(declare-fun m!1320739 () Bool)

(assert (=> b!1430519 m!1320739))

(assert (=> b!1430519 m!1320739))

(assert (=> b!1430519 m!1320735))

(declare-fun m!1320741 () Bool)

(assert (=> b!1430519 m!1320741))

(declare-fun m!1320743 () Bool)

(assert (=> b!1430514 m!1320743))

(assert (=> b!1430514 m!1320743))

(declare-fun m!1320745 () Bool)

(assert (=> b!1430514 m!1320745))

(declare-fun m!1320747 () Bool)

(assert (=> b!1430514 m!1320747))

(declare-fun m!1320749 () Bool)

(assert (=> b!1430514 m!1320749))

(assert (=> b!1430516 m!1320735))

(assert (=> b!1430516 m!1320735))

(declare-fun m!1320751 () Bool)

(assert (=> b!1430516 m!1320751))

(declare-fun m!1320753 () Bool)

(assert (=> b!1430520 m!1320753))

(declare-fun m!1320755 () Bool)

(assert (=> b!1430508 m!1320755))

(declare-fun m!1320757 () Bool)

(assert (=> b!1430508 m!1320757))

(declare-fun m!1320759 () Bool)

(assert (=> start!123488 m!1320759))

(declare-fun m!1320761 () Bool)

(assert (=> start!123488 m!1320761))

(declare-fun m!1320763 () Bool)

(assert (=> b!1430518 m!1320763))

(assert (=> b!1430517 m!1320735))

(assert (=> b!1430517 m!1320735))

(declare-fun m!1320765 () Bool)

(assert (=> b!1430517 m!1320765))

(declare-fun m!1320767 () Bool)

(assert (=> b!1430511 m!1320767))

(assert (=> b!1430511 m!1320767))

(declare-fun m!1320769 () Bool)

(assert (=> b!1430511 m!1320769))

(declare-fun m!1320771 () Bool)

(assert (=> b!1430512 m!1320771))

(check-sat (not b!1430508) (not b!1430513) (not start!123488) (not b!1430516) (not b!1430517) (not b!1430518) (not b!1430512) (not b!1430519) (not b!1430520) (not b!1430514) (not b!1430511))
(check-sat)
