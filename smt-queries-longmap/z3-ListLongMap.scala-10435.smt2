; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!123014 () Bool)

(assert start!123014)

(declare-fun b!1424616 () Bool)

(declare-fun e!805386 () Bool)

(declare-fun e!805391 () Bool)

(assert (=> b!1424616 (= e!805386 e!805391)))

(declare-fun res!959170 () Bool)

(assert (=> b!1424616 (=> res!959170 e!805391)))

(declare-fun x!605 () (_ BitVec 32))

(declare-datatypes ((array!97250 0))(
  ( (array!97251 (arr!46939 (Array (_ BitVec 32) (_ BitVec 64))) (size!47490 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97250)

(declare-fun lt!627525 () (_ BitVec 32))

(assert (=> b!1424616 (= res!959170 (or (bvslt (bvadd #b00000000000000000000000000000001 x!605) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!605) #b01111111111111111111111111111110) (bvslt lt!627525 #b00000000000000000000000000000000) (bvsge lt!627525 (size!47490 a!2831))))))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1424616 (= lt!627525 (nextIndex!0 index!585 (bvadd #b00000000000000000000000000000001 x!605) mask!2608))))

(declare-fun b!1424617 () Bool)

(declare-fun res!959172 () Bool)

(declare-fun e!805389 () Bool)

(assert (=> b!1424617 (=> (not res!959172) (not e!805389))))

(declare-datatypes ((List!33436 0))(
  ( (Nil!33433) (Cons!33432 (h!34745 (_ BitVec 64)) (t!48122 List!33436)) )
))
(declare-fun arrayNoDuplicates!0 (array!97250 (_ BitVec 32) List!33436) Bool)

(assert (=> b!1424617 (= res!959172 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33433))))

(declare-fun b!1424618 () Bool)

(declare-fun res!959174 () Bool)

(assert (=> b!1424618 (=> (not res!959174) (not e!805389))))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1424618 (= res!959174 (and (= (size!47490 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47490 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47490 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1424619 () Bool)

(declare-fun e!805388 () Bool)

(declare-fun e!805390 () Bool)

(assert (=> b!1424619 (= e!805388 e!805390)))

(declare-fun res!959175 () Bool)

(assert (=> b!1424619 (=> (not res!959175) (not e!805390))))

(declare-fun lt!627529 () (_ BitVec 64))

(declare-fun lt!627526 () array!97250)

(declare-datatypes ((SeekEntryResult!11126 0))(
  ( (MissingZero!11126 (index!46896 (_ BitVec 32))) (Found!11126 (index!46897 (_ BitVec 32))) (Intermediate!11126 (undefined!11938 Bool) (index!46898 (_ BitVec 32)) (x!128697 (_ BitVec 32))) (Undefined!11126) (MissingVacant!11126 (index!46899 (_ BitVec 32))) )
))
(declare-fun lt!627527 () SeekEntryResult!11126)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97250 (_ BitVec 32)) SeekEntryResult!11126)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1424619 (= res!959175 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!627529 mask!2608) lt!627529 lt!627526 mask!2608) lt!627527))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1424619 (= lt!627527 (Intermediate!11126 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1424619 (= lt!627529 (select (store (arr!46939 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1424619 (= lt!627526 (array!97251 (store (arr!46939 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47490 a!2831)))))

(declare-fun b!1424620 () Bool)

(declare-fun res!959176 () Bool)

(assert (=> b!1424620 (=> (not res!959176) (not e!805389))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(assert (=> b!1424620 (= res!959176 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47490 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47490 a!2831))))))

(declare-fun b!1424621 () Bool)

(declare-fun res!959169 () Bool)

(assert (=> b!1424621 (=> (not res!959169) (not e!805390))))

(declare-fun lt!627524 () SeekEntryResult!11126)

(assert (=> b!1424621 (= res!959169 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46939 a!2831) j!81) a!2831 mask!2608) lt!627524))))

(declare-fun b!1424622 () Bool)

(declare-fun e!805385 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97250 (_ BitVec 32)) SeekEntryResult!11126)

(assert (=> b!1424622 (= e!805385 (= (seekEntryOrOpen!0 (select (arr!46939 a!2831) j!81) a!2831 mask!2608) (Found!11126 j!81)))))

(declare-fun b!1424623 () Bool)

(assert (=> b!1424623 (= e!805389 e!805388)))

(declare-fun res!959179 () Bool)

(assert (=> b!1424623 (=> (not res!959179) (not e!805388))))

(assert (=> b!1424623 (= res!959179 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46939 a!2831) j!81) mask!2608) (select (arr!46939 a!2831) j!81) a!2831 mask!2608) lt!627524))))

(assert (=> b!1424623 (= lt!627524 (Intermediate!11126 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun res!959168 () Bool)

(assert (=> start!123014 (=> (not res!959168) (not e!805389))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123014 (= res!959168 (validMask!0 mask!2608))))

(assert (=> start!123014 e!805389))

(assert (=> start!123014 true))

(declare-fun array_inv!36220 (array!97250) Bool)

(assert (=> start!123014 (array_inv!36220 a!2831)))

(declare-fun b!1424624 () Bool)

(assert (=> b!1424624 (= e!805390 (not e!805386))))

(declare-fun res!959171 () Bool)

(assert (=> b!1424624 (=> res!959171 e!805386)))

(assert (=> b!1424624 (= res!959171 (or (= (select (arr!46939 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46939 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46939 a!2831) index!585) (select (arr!46939 a!2831) j!81)) (= (select (store (arr!46939 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1424624 e!805385))

(declare-fun res!959167 () Bool)

(assert (=> b!1424624 (=> (not res!959167) (not e!805385))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97250 (_ BitVec 32)) Bool)

(assert (=> b!1424624 (= res!959167 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48119 0))(
  ( (Unit!48120) )
))
(declare-fun lt!627528 () Unit!48119)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97250 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48119)

(assert (=> b!1424624 (= lt!627528 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1424625 () Bool)

(declare-fun res!959164 () Bool)

(assert (=> b!1424625 (=> (not res!959164) (not e!805389))))

(assert (=> b!1424625 (= res!959164 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1424626 () Bool)

(declare-fun res!959165 () Bool)

(assert (=> b!1424626 (=> (not res!959165) (not e!805389))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1424626 (= res!959165 (validKeyInArray!0 (select (arr!46939 a!2831) i!982)))))

(declare-fun b!1424627 () Bool)

(assert (=> b!1424627 (= e!805391 true)))

(declare-fun lt!627530 () SeekEntryResult!11126)

(assert (=> b!1424627 (= lt!627530 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!627525 lt!627529 lt!627526 mask!2608))))

(declare-fun b!1424628 () Bool)

(declare-fun res!959177 () Bool)

(assert (=> b!1424628 (=> res!959177 e!805391)))

(assert (=> b!1424628 (= res!959177 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!627525 (select (arr!46939 a!2831) j!81) a!2831 mask!2608) lt!627524)))))

(declare-fun b!1424629 () Bool)

(declare-fun res!959173 () Bool)

(assert (=> b!1424629 (=> (not res!959173) (not e!805390))))

(assert (=> b!1424629 (= res!959173 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!627529 lt!627526 mask!2608) lt!627527))))

(declare-fun b!1424630 () Bool)

(declare-fun res!959178 () Bool)

(assert (=> b!1424630 (=> (not res!959178) (not e!805389))))

(assert (=> b!1424630 (= res!959178 (validKeyInArray!0 (select (arr!46939 a!2831) j!81)))))

(declare-fun b!1424631 () Bool)

(declare-fun res!959166 () Bool)

(assert (=> b!1424631 (=> (not res!959166) (not e!805390))))

(assert (=> b!1424631 (= res!959166 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(assert (= (and start!123014 res!959168) b!1424618))

(assert (= (and b!1424618 res!959174) b!1424626))

(assert (= (and b!1424626 res!959165) b!1424630))

(assert (= (and b!1424630 res!959178) b!1424625))

(assert (= (and b!1424625 res!959164) b!1424617))

(assert (= (and b!1424617 res!959172) b!1424620))

(assert (= (and b!1424620 res!959176) b!1424623))

(assert (= (and b!1424623 res!959179) b!1424619))

(assert (= (and b!1424619 res!959175) b!1424621))

(assert (= (and b!1424621 res!959169) b!1424629))

(assert (= (and b!1424629 res!959173) b!1424631))

(assert (= (and b!1424631 res!959166) b!1424624))

(assert (= (and b!1424624 res!959167) b!1424622))

(assert (= (and b!1424624 (not res!959171)) b!1424616))

(assert (= (and b!1424616 (not res!959170)) b!1424628))

(assert (= (and b!1424628 (not res!959177)) b!1424627))

(declare-fun m!1315281 () Bool)

(assert (=> b!1424627 m!1315281))

(declare-fun m!1315283 () Bool)

(assert (=> b!1424628 m!1315283))

(assert (=> b!1424628 m!1315283))

(declare-fun m!1315285 () Bool)

(assert (=> b!1424628 m!1315285))

(declare-fun m!1315287 () Bool)

(assert (=> b!1424624 m!1315287))

(declare-fun m!1315289 () Bool)

(assert (=> b!1424624 m!1315289))

(declare-fun m!1315291 () Bool)

(assert (=> b!1424624 m!1315291))

(declare-fun m!1315293 () Bool)

(assert (=> b!1424624 m!1315293))

(assert (=> b!1424624 m!1315283))

(declare-fun m!1315295 () Bool)

(assert (=> b!1424624 m!1315295))

(declare-fun m!1315297 () Bool)

(assert (=> b!1424619 m!1315297))

(assert (=> b!1424619 m!1315297))

(declare-fun m!1315299 () Bool)

(assert (=> b!1424619 m!1315299))

(assert (=> b!1424619 m!1315287))

(declare-fun m!1315301 () Bool)

(assert (=> b!1424619 m!1315301))

(declare-fun m!1315303 () Bool)

(assert (=> b!1424625 m!1315303))

(declare-fun m!1315305 () Bool)

(assert (=> start!123014 m!1315305))

(declare-fun m!1315307 () Bool)

(assert (=> start!123014 m!1315307))

(assert (=> b!1424621 m!1315283))

(assert (=> b!1424621 m!1315283))

(declare-fun m!1315309 () Bool)

(assert (=> b!1424621 m!1315309))

(assert (=> b!1424622 m!1315283))

(assert (=> b!1424622 m!1315283))

(declare-fun m!1315311 () Bool)

(assert (=> b!1424622 m!1315311))

(assert (=> b!1424630 m!1315283))

(assert (=> b!1424630 m!1315283))

(declare-fun m!1315313 () Bool)

(assert (=> b!1424630 m!1315313))

(declare-fun m!1315315 () Bool)

(assert (=> b!1424616 m!1315315))

(declare-fun m!1315317 () Bool)

(assert (=> b!1424626 m!1315317))

(assert (=> b!1424626 m!1315317))

(declare-fun m!1315319 () Bool)

(assert (=> b!1424626 m!1315319))

(declare-fun m!1315321 () Bool)

(assert (=> b!1424617 m!1315321))

(declare-fun m!1315323 () Bool)

(assert (=> b!1424629 m!1315323))

(assert (=> b!1424623 m!1315283))

(assert (=> b!1424623 m!1315283))

(declare-fun m!1315325 () Bool)

(assert (=> b!1424623 m!1315325))

(assert (=> b!1424623 m!1315325))

(assert (=> b!1424623 m!1315283))

(declare-fun m!1315327 () Bool)

(assert (=> b!1424623 m!1315327))

(check-sat (not b!1424629) (not b!1424623) (not b!1424628) (not b!1424625) (not b!1424627) (not b!1424619) (not b!1424617) (not start!123014) (not b!1424621) (not b!1424630) (not b!1424624) (not b!1424626) (not b!1424616) (not b!1424622))
(check-sat)
