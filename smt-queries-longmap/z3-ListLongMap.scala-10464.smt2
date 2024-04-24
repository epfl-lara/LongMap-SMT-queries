; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!123188 () Bool)

(assert start!123188)

(declare-fun b!1427650 () Bool)

(declare-fun res!962204 () Bool)

(declare-fun e!806551 () Bool)

(assert (=> b!1427650 (=> (not res!962204) (not e!806551))))

(declare-datatypes ((array!97424 0))(
  ( (array!97425 (arr!47026 (Array (_ BitVec 32) (_ BitVec 64))) (size!47577 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97424)

(declare-datatypes ((List!33523 0))(
  ( (Nil!33520) (Cons!33519 (h!34832 (_ BitVec 64)) (t!48209 List!33523)) )
))
(declare-fun arrayNoDuplicates!0 (array!97424 (_ BitVec 32) List!33523) Bool)

(assert (=> b!1427650 (= res!962204 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33520))))

(declare-fun b!1427651 () Bool)

(declare-fun res!962206 () Bool)

(declare-fun e!806549 () Bool)

(assert (=> b!1427651 (=> (not res!962206) (not e!806549))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(assert (=> b!1427651 (= res!962206 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1427652 () Bool)

(declare-fun e!806550 () Bool)

(assert (=> b!1427652 (= e!806551 e!806550)))

(declare-fun res!962203 () Bool)

(assert (=> b!1427652 (=> (not res!962203) (not e!806550))))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11207 0))(
  ( (MissingZero!11207 (index!47220 (_ BitVec 32))) (Found!11207 (index!47221 (_ BitVec 32))) (Intermediate!11207 (undefined!12019 Bool) (index!47222 (_ BitVec 32)) (x!129010 (_ BitVec 32))) (Undefined!11207) (MissingVacant!11207 (index!47223 (_ BitVec 32))) )
))
(declare-fun lt!628595 () SeekEntryResult!11207)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97424 (_ BitVec 32)) SeekEntryResult!11207)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1427652 (= res!962203 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47026 a!2831) j!81) mask!2608) (select (arr!47026 a!2831) j!81) a!2831 mask!2608) lt!628595))))

(assert (=> b!1427652 (= lt!628595 (Intermediate!11207 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1427653 () Bool)

(assert (=> b!1427653 (= e!806549 (not true))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97424 (_ BitVec 32)) Bool)

(assert (=> b!1427653 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608)))

(declare-datatypes ((Unit!48191 0))(
  ( (Unit!48192) )
))
(declare-fun lt!628594 () Unit!48191)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97424 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48191)

(assert (=> b!1427653 (= lt!628594 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1427654 () Bool)

(declare-fun res!962208 () Bool)

(assert (=> b!1427654 (=> (not res!962208) (not e!806551))))

(declare-fun i!982 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1427654 (= res!962208 (validKeyInArray!0 (select (arr!47026 a!2831) i!982)))))

(declare-fun res!962207 () Bool)

(assert (=> start!123188 (=> (not res!962207) (not e!806551))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123188 (= res!962207 (validMask!0 mask!2608))))

(assert (=> start!123188 e!806551))

(assert (=> start!123188 true))

(declare-fun array_inv!36307 (array!97424) Bool)

(assert (=> start!123188 (array_inv!36307 a!2831)))

(declare-fun b!1427655 () Bool)

(declare-fun res!962198 () Bool)

(assert (=> b!1427655 (=> (not res!962198) (not e!806551))))

(assert (=> b!1427655 (= res!962198 (validKeyInArray!0 (select (arr!47026 a!2831) j!81)))))

(declare-fun b!1427656 () Bool)

(assert (=> b!1427656 (= e!806550 e!806549)))

(declare-fun res!962205 () Bool)

(assert (=> b!1427656 (=> (not res!962205) (not e!806549))))

(declare-fun lt!628591 () SeekEntryResult!11207)

(declare-fun lt!628592 () (_ BitVec 64))

(declare-fun lt!628593 () array!97424)

(assert (=> b!1427656 (= res!962205 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!628592 mask!2608) lt!628592 lt!628593 mask!2608) lt!628591))))

(assert (=> b!1427656 (= lt!628591 (Intermediate!11207 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1427656 (= lt!628592 (select (store (arr!47026 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1427656 (= lt!628593 (array!97425 (store (arr!47026 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47577 a!2831)))))

(declare-fun b!1427657 () Bool)

(declare-fun res!962202 () Bool)

(assert (=> b!1427657 (=> (not res!962202) (not e!806551))))

(assert (=> b!1427657 (= res!962202 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1427658 () Bool)

(declare-fun res!962201 () Bool)

(assert (=> b!1427658 (=> (not res!962201) (not e!806549))))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1427658 (= res!962201 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!628592 lt!628593 mask!2608) lt!628591))))

(declare-fun b!1427659 () Bool)

(declare-fun res!962200 () Bool)

(assert (=> b!1427659 (=> (not res!962200) (not e!806551))))

(assert (=> b!1427659 (= res!962200 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47577 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47577 a!2831))))))

(declare-fun b!1427660 () Bool)

(declare-fun res!962209 () Bool)

(assert (=> b!1427660 (=> (not res!962209) (not e!806551))))

(assert (=> b!1427660 (= res!962209 (and (= (size!47577 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47577 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47577 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1427661 () Bool)

(declare-fun res!962199 () Bool)

(assert (=> b!1427661 (=> (not res!962199) (not e!806549))))

(assert (=> b!1427661 (= res!962199 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47026 a!2831) j!81) a!2831 mask!2608) lt!628595))))

(assert (= (and start!123188 res!962207) b!1427660))

(assert (= (and b!1427660 res!962209) b!1427654))

(assert (= (and b!1427654 res!962208) b!1427655))

(assert (= (and b!1427655 res!962198) b!1427657))

(assert (= (and b!1427657 res!962202) b!1427650))

(assert (= (and b!1427650 res!962204) b!1427659))

(assert (= (and b!1427659 res!962200) b!1427652))

(assert (= (and b!1427652 res!962203) b!1427656))

(assert (= (and b!1427656 res!962205) b!1427661))

(assert (= (and b!1427661 res!962199) b!1427658))

(assert (= (and b!1427658 res!962201) b!1427651))

(assert (= (and b!1427651 res!962206) b!1427653))

(declare-fun m!1318377 () Bool)

(assert (=> b!1427652 m!1318377))

(assert (=> b!1427652 m!1318377))

(declare-fun m!1318379 () Bool)

(assert (=> b!1427652 m!1318379))

(assert (=> b!1427652 m!1318379))

(assert (=> b!1427652 m!1318377))

(declare-fun m!1318381 () Bool)

(assert (=> b!1427652 m!1318381))

(declare-fun m!1318383 () Bool)

(assert (=> b!1427650 m!1318383))

(declare-fun m!1318385 () Bool)

(assert (=> b!1427653 m!1318385))

(declare-fun m!1318387 () Bool)

(assert (=> b!1427653 m!1318387))

(assert (=> b!1427661 m!1318377))

(assert (=> b!1427661 m!1318377))

(declare-fun m!1318389 () Bool)

(assert (=> b!1427661 m!1318389))

(declare-fun m!1318391 () Bool)

(assert (=> b!1427657 m!1318391))

(declare-fun m!1318393 () Bool)

(assert (=> start!123188 m!1318393))

(declare-fun m!1318395 () Bool)

(assert (=> start!123188 m!1318395))

(declare-fun m!1318397 () Bool)

(assert (=> b!1427656 m!1318397))

(assert (=> b!1427656 m!1318397))

(declare-fun m!1318399 () Bool)

(assert (=> b!1427656 m!1318399))

(declare-fun m!1318401 () Bool)

(assert (=> b!1427656 m!1318401))

(declare-fun m!1318403 () Bool)

(assert (=> b!1427656 m!1318403))

(assert (=> b!1427655 m!1318377))

(assert (=> b!1427655 m!1318377))

(declare-fun m!1318405 () Bool)

(assert (=> b!1427655 m!1318405))

(declare-fun m!1318407 () Bool)

(assert (=> b!1427654 m!1318407))

(assert (=> b!1427654 m!1318407))

(declare-fun m!1318409 () Bool)

(assert (=> b!1427654 m!1318409))

(declare-fun m!1318411 () Bool)

(assert (=> b!1427658 m!1318411))

(check-sat (not b!1427656) (not b!1427657) (not b!1427652) (not b!1427658) (not b!1427653) (not b!1427654) (not b!1427655) (not start!123188) (not b!1427661) (not b!1427650))
(check-sat)
