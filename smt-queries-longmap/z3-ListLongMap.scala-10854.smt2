; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127052 () Bool)

(assert start!127052)

(declare-fun b!1493395 () Bool)

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun e!836542 () Bool)

(declare-datatypes ((array!99697 0))(
  ( (array!99698 (arr!48118 (Array (_ BitVec 32) (_ BitVec 64))) (size!48670 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99697)

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1493395 (= e!836542 (or (= (select (arr!48118 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48118 a!2862) intermediateBeforeIndex!19) (select (arr!48118 a!2862) j!93))))))

(declare-fun b!1493396 () Bool)

(declare-fun e!836549 () Bool)

(declare-fun e!836548 () Bool)

(assert (=> b!1493396 (= e!836549 e!836548)))

(declare-fun res!1016076 () Bool)

(assert (=> b!1493396 (=> (not res!1016076) (not e!836548))))

(declare-datatypes ((SeekEntryResult!12383 0))(
  ( (MissingZero!12383 (index!51924 (_ BitVec 32))) (Found!12383 (index!51925 (_ BitVec 32))) (Intermediate!12383 (undefined!13195 Bool) (index!51926 (_ BitVec 32)) (x!133520 (_ BitVec 32))) (Undefined!12383) (MissingVacant!12383 (index!51927 (_ BitVec 32))) )
))
(declare-fun lt!650833 () SeekEntryResult!12383)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99697 (_ BitVec 32)) SeekEntryResult!12383)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1493396 (= res!1016076 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48118 a!2862) j!93) mask!2687) (select (arr!48118 a!2862) j!93) a!2862 mask!2687) lt!650833))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1493396 (= lt!650833 (Intermediate!12383 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1493397 () Bool)

(declare-fun e!836546 () Bool)

(declare-fun e!836545 () Bool)

(assert (=> b!1493397 (= e!836546 (not e!836545))))

(declare-fun res!1016082 () Bool)

(assert (=> b!1493397 (=> res!1016082 e!836545)))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1493397 (= res!1016082 (or (and (= (select (arr!48118 a!2862) index!646) (select (store (arr!48118 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48118 a!2862) index!646) (select (arr!48118 a!2862) j!93))) (= (select (arr!48118 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1493397 e!836542))

(declare-fun res!1016072 () Bool)

(assert (=> b!1493397 (=> (not res!1016072) (not e!836542))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99697 (_ BitVec 32)) Bool)

(assert (=> b!1493397 (= res!1016072 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49947 0))(
  ( (Unit!49948) )
))
(declare-fun lt!650829 () Unit!49947)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99697 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49947)

(assert (=> b!1493397 (= lt!650829 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1493398 () Bool)

(assert (=> b!1493398 (= e!836548 e!836546)))

(declare-fun res!1016077 () Bool)

(assert (=> b!1493398 (=> (not res!1016077) (not e!836546))))

(declare-fun lt!650834 () SeekEntryResult!12383)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1493398 (= res!1016077 (= lt!650834 (Intermediate!12383 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!650830 () (_ BitVec 64))

(declare-fun lt!650832 () array!99697)

(assert (=> b!1493398 (= lt!650834 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!650830 mask!2687) lt!650830 lt!650832 mask!2687))))

(assert (=> b!1493398 (= lt!650830 (select (store (arr!48118 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1493399 () Bool)

(assert (=> b!1493399 (= e!836545 true)))

(declare-fun lt!650831 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1493399 (= lt!650831 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1493400 () Bool)

(declare-fun res!1016078 () Bool)

(declare-fun e!836547 () Bool)

(assert (=> b!1493400 (=> (not res!1016078) (not e!836547))))

(assert (=> b!1493400 (= res!1016078 (and (= (size!48670 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48670 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48670 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1493401 () Bool)

(declare-fun e!836544 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99697 (_ BitVec 32)) SeekEntryResult!12383)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99697 (_ BitVec 32)) SeekEntryResult!12383)

(assert (=> b!1493401 (= e!836544 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!650830 lt!650832 mask!2687) (seekEntryOrOpen!0 lt!650830 lt!650832 mask!2687)))))

(declare-fun b!1493402 () Bool)

(declare-fun res!1016081 () Bool)

(assert (=> b!1493402 (=> (not res!1016081) (not e!836547))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1493402 (= res!1016081 (validKeyInArray!0 (select (arr!48118 a!2862) j!93)))))

(declare-fun b!1493403 () Bool)

(declare-fun res!1016069 () Bool)

(assert (=> b!1493403 (=> (not res!1016069) (not e!836547))))

(assert (=> b!1493403 (= res!1016069 (validKeyInArray!0 (select (arr!48118 a!2862) i!1006)))))

(declare-fun b!1493404 () Bool)

(declare-fun res!1016075 () Bool)

(assert (=> b!1493404 (=> (not res!1016075) (not e!836548))))

(assert (=> b!1493404 (= res!1016075 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48118 a!2862) j!93) a!2862 mask!2687) lt!650833))))

(declare-fun b!1493405 () Bool)

(declare-fun res!1016073 () Bool)

(assert (=> b!1493405 (=> (not res!1016073) (not e!836547))))

(assert (=> b!1493405 (= res!1016073 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun res!1016074 () Bool)

(assert (=> start!127052 (=> (not res!1016074) (not e!836547))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127052 (= res!1016074 (validMask!0 mask!2687))))

(assert (=> start!127052 e!836547))

(assert (=> start!127052 true))

(declare-fun array_inv!37351 (array!99697) Bool)

(assert (=> start!127052 (array_inv!37351 a!2862)))

(declare-fun b!1493406 () Bool)

(assert (=> b!1493406 (= e!836547 e!836549)))

(declare-fun res!1016068 () Bool)

(assert (=> b!1493406 (=> (not res!1016068) (not e!836549))))

(assert (=> b!1493406 (= res!1016068 (= (select (store (arr!48118 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1493406 (= lt!650832 (array!99698 (store (arr!48118 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48670 a!2862)))))

(declare-fun b!1493407 () Bool)

(declare-fun res!1016071 () Bool)

(assert (=> b!1493407 (=> (not res!1016071) (not e!836546))))

(assert (=> b!1493407 (= res!1016071 e!836544)))

(declare-fun c!138196 () Bool)

(assert (=> b!1493407 (= c!138196 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1493408 () Bool)

(declare-fun res!1016079 () Bool)

(assert (=> b!1493408 (=> (not res!1016079) (not e!836547))))

(declare-datatypes ((List!34697 0))(
  ( (Nil!34694) (Cons!34693 (h!36082 (_ BitVec 64)) (t!49383 List!34697)) )
))
(declare-fun arrayNoDuplicates!0 (array!99697 (_ BitVec 32) List!34697) Bool)

(assert (=> b!1493408 (= res!1016079 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34694))))

(declare-fun b!1493409 () Bool)

(assert (=> b!1493409 (= e!836544 (= lt!650834 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!650830 lt!650832 mask!2687)))))

(declare-fun b!1493410 () Bool)

(declare-fun res!1016080 () Bool)

(assert (=> b!1493410 (=> (not res!1016080) (not e!836547))))

(assert (=> b!1493410 (= res!1016080 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48670 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48670 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48670 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1493411 () Bool)

(declare-fun res!1016083 () Bool)

(assert (=> b!1493411 (=> (not res!1016083) (not e!836542))))

(assert (=> b!1493411 (= res!1016083 (= (seekEntryOrOpen!0 (select (arr!48118 a!2862) j!93) a!2862 mask!2687) (Found!12383 j!93)))))

(declare-fun b!1493412 () Bool)

(declare-fun res!1016070 () Bool)

(assert (=> b!1493412 (=> (not res!1016070) (not e!836546))))

(assert (=> b!1493412 (= res!1016070 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(assert (= (and start!127052 res!1016074) b!1493400))

(assert (= (and b!1493400 res!1016078) b!1493403))

(assert (= (and b!1493403 res!1016069) b!1493402))

(assert (= (and b!1493402 res!1016081) b!1493405))

(assert (= (and b!1493405 res!1016073) b!1493408))

(assert (= (and b!1493408 res!1016079) b!1493410))

(assert (= (and b!1493410 res!1016080) b!1493406))

(assert (= (and b!1493406 res!1016068) b!1493396))

(assert (= (and b!1493396 res!1016076) b!1493404))

(assert (= (and b!1493404 res!1016075) b!1493398))

(assert (= (and b!1493398 res!1016077) b!1493407))

(assert (= (and b!1493407 c!138196) b!1493409))

(assert (= (and b!1493407 (not c!138196)) b!1493401))

(assert (= (and b!1493407 res!1016071) b!1493412))

(assert (= (and b!1493412 res!1016070) b!1493397))

(assert (= (and b!1493397 res!1016072) b!1493411))

(assert (= (and b!1493411 res!1016083) b!1493395))

(assert (= (and b!1493397 (not res!1016082)) b!1493399))

(declare-fun m!1376631 () Bool)

(assert (=> b!1493405 m!1376631))

(declare-fun m!1376633 () Bool)

(assert (=> b!1493408 m!1376633))

(declare-fun m!1376635 () Bool)

(assert (=> b!1493411 m!1376635))

(assert (=> b!1493411 m!1376635))

(declare-fun m!1376637 () Bool)

(assert (=> b!1493411 m!1376637))

(declare-fun m!1376639 () Bool)

(assert (=> b!1493409 m!1376639))

(declare-fun m!1376641 () Bool)

(assert (=> b!1493406 m!1376641))

(declare-fun m!1376643 () Bool)

(assert (=> b!1493406 m!1376643))

(assert (=> b!1493396 m!1376635))

(assert (=> b!1493396 m!1376635))

(declare-fun m!1376645 () Bool)

(assert (=> b!1493396 m!1376645))

(assert (=> b!1493396 m!1376645))

(assert (=> b!1493396 m!1376635))

(declare-fun m!1376647 () Bool)

(assert (=> b!1493396 m!1376647))

(declare-fun m!1376649 () Bool)

(assert (=> b!1493397 m!1376649))

(assert (=> b!1493397 m!1376641))

(declare-fun m!1376651 () Bool)

(assert (=> b!1493397 m!1376651))

(declare-fun m!1376653 () Bool)

(assert (=> b!1493397 m!1376653))

(declare-fun m!1376655 () Bool)

(assert (=> b!1493397 m!1376655))

(assert (=> b!1493397 m!1376635))

(assert (=> b!1493402 m!1376635))

(assert (=> b!1493402 m!1376635))

(declare-fun m!1376657 () Bool)

(assert (=> b!1493402 m!1376657))

(declare-fun m!1376659 () Bool)

(assert (=> b!1493395 m!1376659))

(assert (=> b!1493395 m!1376635))

(declare-fun m!1376661 () Bool)

(assert (=> b!1493401 m!1376661))

(declare-fun m!1376663 () Bool)

(assert (=> b!1493401 m!1376663))

(declare-fun m!1376665 () Bool)

(assert (=> start!127052 m!1376665))

(declare-fun m!1376667 () Bool)

(assert (=> start!127052 m!1376667))

(declare-fun m!1376669 () Bool)

(assert (=> b!1493398 m!1376669))

(assert (=> b!1493398 m!1376669))

(declare-fun m!1376671 () Bool)

(assert (=> b!1493398 m!1376671))

(assert (=> b!1493398 m!1376641))

(declare-fun m!1376673 () Bool)

(assert (=> b!1493398 m!1376673))

(declare-fun m!1376675 () Bool)

(assert (=> b!1493403 m!1376675))

(assert (=> b!1493403 m!1376675))

(declare-fun m!1376677 () Bool)

(assert (=> b!1493403 m!1376677))

(assert (=> b!1493404 m!1376635))

(assert (=> b!1493404 m!1376635))

(declare-fun m!1376679 () Bool)

(assert (=> b!1493404 m!1376679))

(declare-fun m!1376681 () Bool)

(assert (=> b!1493399 m!1376681))

(check-sat (not b!1493397) (not b!1493396) (not b!1493405) (not start!127052) (not b!1493399) (not b!1493404) (not b!1493401) (not b!1493408) (not b!1493409) (not b!1493402) (not b!1493403) (not b!1493411) (not b!1493398))
(check-sat)
