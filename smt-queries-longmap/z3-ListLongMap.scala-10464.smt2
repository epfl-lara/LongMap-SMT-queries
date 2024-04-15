; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122942 () Bool)

(assert start!122942)

(declare-fun b!1426120 () Bool)

(declare-fun res!961609 () Bool)

(declare-fun e!805584 () Bool)

(assert (=> b!1426120 (=> (not res!961609) (not e!805584))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(assert (=> b!1426120 (= res!961609 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1426121 () Bool)

(declare-fun res!961611 () Bool)

(assert (=> b!1426121 (=> (not res!961611) (not e!805584))))

(declare-datatypes ((SeekEntryResult!11254 0))(
  ( (MissingZero!11254 (index!47408 (_ BitVec 32))) (Found!11254 (index!47409 (_ BitVec 32))) (Intermediate!11254 (undefined!12066 Bool) (index!47410 (_ BitVec 32)) (x!129029 (_ BitVec 32))) (Undefined!11254) (MissingVacant!11254 (index!47411 (_ BitVec 32))) )
))
(declare-fun lt!627872 () SeekEntryResult!11254)

(declare-fun x!605 () (_ BitVec 32))

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((array!97260 0))(
  ( (array!97261 (arr!46948 (Array (_ BitVec 32) (_ BitVec 64))) (size!47500 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97260)

(declare-fun index!585 () (_ BitVec 32))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97260 (_ BitVec 32)) SeekEntryResult!11254)

(assert (=> b!1426121 (= res!961611 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46948 a!2831) j!81) a!2831 mask!2608) lt!627872))))

(declare-fun b!1426122 () Bool)

(declare-fun res!961610 () Bool)

(declare-fun e!805585 () Bool)

(assert (=> b!1426122 (=> (not res!961610) (not e!805585))))

(declare-fun i!982 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1426122 (= res!961610 (validKeyInArray!0 (select (arr!46948 a!2831) i!982)))))

(declare-fun b!1426123 () Bool)

(declare-fun e!805586 () Bool)

(assert (=> b!1426123 (= e!805585 e!805586)))

(declare-fun res!961607 () Bool)

(assert (=> b!1426123 (=> (not res!961607) (not e!805586))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1426123 (= res!961607 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46948 a!2831) j!81) mask!2608) (select (arr!46948 a!2831) j!81) a!2831 mask!2608) lt!627872))))

(assert (=> b!1426123 (= lt!627872 (Intermediate!11254 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1426124 () Bool)

(declare-fun res!961605 () Bool)

(assert (=> b!1426124 (=> (not res!961605) (not e!805585))))

(assert (=> b!1426124 (= res!961605 (validKeyInArray!0 (select (arr!46948 a!2831) j!81)))))

(declare-fun res!961606 () Bool)

(assert (=> start!122942 (=> (not res!961606) (not e!805585))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122942 (= res!961606 (validMask!0 mask!2608))))

(assert (=> start!122942 e!805585))

(assert (=> start!122942 true))

(declare-fun array_inv!36181 (array!97260) Bool)

(assert (=> start!122942 (array_inv!36181 a!2831)))

(declare-fun b!1426125 () Bool)

(declare-fun res!961608 () Bool)

(assert (=> b!1426125 (=> (not res!961608) (not e!805585))))

(assert (=> b!1426125 (= res!961608 (and (= (size!47500 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47500 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47500 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1426126 () Bool)

(assert (=> b!1426126 (= e!805586 e!805584)))

(declare-fun res!961615 () Bool)

(assert (=> b!1426126 (=> (not res!961615) (not e!805584))))

(declare-fun lt!627875 () SeekEntryResult!11254)

(declare-fun lt!627871 () (_ BitVec 64))

(declare-fun lt!627874 () array!97260)

(assert (=> b!1426126 (= res!961615 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!627871 mask!2608) lt!627871 lt!627874 mask!2608) lt!627875))))

(assert (=> b!1426126 (= lt!627875 (Intermediate!11254 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1426126 (= lt!627871 (select (store (arr!46948 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1426126 (= lt!627874 (array!97261 (store (arr!46948 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47500 a!2831)))))

(declare-fun b!1426127 () Bool)

(declare-fun res!961614 () Bool)

(assert (=> b!1426127 (=> (not res!961614) (not e!805585))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97260 (_ BitVec 32)) Bool)

(assert (=> b!1426127 (= res!961614 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1426128 () Bool)

(assert (=> b!1426128 (= e!805584 (not true))))

(assert (=> b!1426128 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608)))

(declare-datatypes ((Unit!48093 0))(
  ( (Unit!48094) )
))
(declare-fun lt!627873 () Unit!48093)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97260 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48093)

(assert (=> b!1426128 (= lt!627873 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1426129 () Bool)

(declare-fun res!961613 () Bool)

(assert (=> b!1426129 (=> (not res!961613) (not e!805585))))

(assert (=> b!1426129 (= res!961613 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47500 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47500 a!2831))))))

(declare-fun b!1426130 () Bool)

(declare-fun res!961612 () Bool)

(assert (=> b!1426130 (=> (not res!961612) (not e!805584))))

(assert (=> b!1426130 (= res!961612 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!627871 lt!627874 mask!2608) lt!627875))))

(declare-fun b!1426131 () Bool)

(declare-fun res!961604 () Bool)

(assert (=> b!1426131 (=> (not res!961604) (not e!805585))))

(declare-datatypes ((List!33536 0))(
  ( (Nil!33533) (Cons!33532 (h!34834 (_ BitVec 64)) (t!48222 List!33536)) )
))
(declare-fun arrayNoDuplicates!0 (array!97260 (_ BitVec 32) List!33536) Bool)

(assert (=> b!1426131 (= res!961604 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33533))))

(assert (= (and start!122942 res!961606) b!1426125))

(assert (= (and b!1426125 res!961608) b!1426122))

(assert (= (and b!1426122 res!961610) b!1426124))

(assert (= (and b!1426124 res!961605) b!1426127))

(assert (= (and b!1426127 res!961614) b!1426131))

(assert (= (and b!1426131 res!961604) b!1426129))

(assert (= (and b!1426129 res!961613) b!1426123))

(assert (= (and b!1426123 res!961607) b!1426126))

(assert (= (and b!1426126 res!961615) b!1426121))

(assert (= (and b!1426121 res!961611) b!1426130))

(assert (= (and b!1426130 res!961612) b!1426120))

(assert (= (and b!1426120 res!961609) b!1426128))

(declare-fun m!1316259 () Bool)

(assert (=> b!1426121 m!1316259))

(assert (=> b!1426121 m!1316259))

(declare-fun m!1316261 () Bool)

(assert (=> b!1426121 m!1316261))

(declare-fun m!1316263 () Bool)

(assert (=> start!122942 m!1316263))

(declare-fun m!1316265 () Bool)

(assert (=> start!122942 m!1316265))

(declare-fun m!1316267 () Bool)

(assert (=> b!1426122 m!1316267))

(assert (=> b!1426122 m!1316267))

(declare-fun m!1316269 () Bool)

(assert (=> b!1426122 m!1316269))

(declare-fun m!1316271 () Bool)

(assert (=> b!1426126 m!1316271))

(assert (=> b!1426126 m!1316271))

(declare-fun m!1316273 () Bool)

(assert (=> b!1426126 m!1316273))

(declare-fun m!1316275 () Bool)

(assert (=> b!1426126 m!1316275))

(declare-fun m!1316277 () Bool)

(assert (=> b!1426126 m!1316277))

(declare-fun m!1316279 () Bool)

(assert (=> b!1426127 m!1316279))

(assert (=> b!1426123 m!1316259))

(assert (=> b!1426123 m!1316259))

(declare-fun m!1316281 () Bool)

(assert (=> b!1426123 m!1316281))

(assert (=> b!1426123 m!1316281))

(assert (=> b!1426123 m!1316259))

(declare-fun m!1316283 () Bool)

(assert (=> b!1426123 m!1316283))

(assert (=> b!1426124 m!1316259))

(assert (=> b!1426124 m!1316259))

(declare-fun m!1316285 () Bool)

(assert (=> b!1426124 m!1316285))

(declare-fun m!1316287 () Bool)

(assert (=> b!1426131 m!1316287))

(declare-fun m!1316289 () Bool)

(assert (=> b!1426128 m!1316289))

(declare-fun m!1316291 () Bool)

(assert (=> b!1426128 m!1316291))

(declare-fun m!1316293 () Bool)

(assert (=> b!1426130 m!1316293))

(check-sat (not b!1426126) (not start!122942) (not b!1426131) (not b!1426122) (not b!1426130) (not b!1426127) (not b!1426124) (not b!1426128) (not b!1426123) (not b!1426121))
(check-sat)
