; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126384 () Bool)

(assert start!126384)

(declare-fun b!1481618 () Bool)

(declare-fun e!830950 () Bool)

(declare-fun e!830954 () Bool)

(assert (=> b!1481618 (= e!830950 e!830954)))

(declare-fun res!1006929 () Bool)

(assert (=> b!1481618 (=> (not res!1006929) (not e!830954))))

(declare-datatypes ((SeekEntryResult!12219 0))(
  ( (MissingZero!12219 (index!51268 (_ BitVec 32))) (Found!12219 (index!51269 (_ BitVec 32))) (Intermediate!12219 (undefined!13031 Bool) (index!51270 (_ BitVec 32)) (x!132854 (_ BitVec 32))) (Undefined!12219) (MissingVacant!12219 (index!51271 (_ BitVec 32))) )
))
(declare-fun lt!646833 () SeekEntryResult!12219)

(declare-datatypes ((array!99403 0))(
  ( (array!99404 (arr!47979 (Array (_ BitVec 32) (_ BitVec 64))) (size!48529 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99403)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99403 (_ BitVec 32)) SeekEntryResult!12219)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1481618 (= res!1006929 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47979 a!2862) j!93) mask!2687) (select (arr!47979 a!2862) j!93) a!2862 mask!2687) lt!646833))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1481618 (= lt!646833 (Intermediate!12219 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1481619 () Bool)

(declare-fun res!1006923 () Bool)

(declare-fun e!830949 () Bool)

(assert (=> b!1481619 (=> (not res!1006923) (not e!830949))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1481619 (= res!1006923 (validKeyInArray!0 (select (arr!47979 a!2862) j!93)))))

(declare-fun res!1006924 () Bool)

(assert (=> start!126384 (=> (not res!1006924) (not e!830949))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126384 (= res!1006924 (validMask!0 mask!2687))))

(assert (=> start!126384 e!830949))

(assert (=> start!126384 true))

(declare-fun array_inv!37007 (array!99403) Bool)

(assert (=> start!126384 (array_inv!37007 a!2862)))

(declare-fun b!1481620 () Bool)

(declare-fun e!830951 () Bool)

(assert (=> b!1481620 (= e!830951 (not true))))

(declare-fun e!830948 () Bool)

(assert (=> b!1481620 e!830948))

(declare-fun res!1006930 () Bool)

(assert (=> b!1481620 (=> (not res!1006930) (not e!830948))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99403 (_ BitVec 32)) Bool)

(assert (=> b!1481620 (= res!1006930 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49778 0))(
  ( (Unit!49779) )
))
(declare-fun lt!646832 () Unit!49778)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99403 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49778)

(assert (=> b!1481620 (= lt!646832 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1481621 () Bool)

(declare-fun res!1006935 () Bool)

(assert (=> b!1481621 (=> (not res!1006935) (not e!830949))))

(declare-datatypes ((List!34480 0))(
  ( (Nil!34477) (Cons!34476 (h!35847 (_ BitVec 64)) (t!49174 List!34480)) )
))
(declare-fun arrayNoDuplicates!0 (array!99403 (_ BitVec 32) List!34480) Bool)

(assert (=> b!1481621 (= res!1006935 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34477))))

(declare-fun b!1481622 () Bool)

(declare-fun res!1006926 () Bool)

(assert (=> b!1481622 (=> (not res!1006926) (not e!830949))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1481622 (= res!1006926 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48529 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48529 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48529 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1481623 () Bool)

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1481623 (= e!830948 (and (or (= (select (arr!47979 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47979 a!2862) intermediateBeforeIndex!19) (select (arr!47979 a!2862) j!93))) (or (and (= (select (arr!47979 a!2862) index!646) (select (store (arr!47979 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47979 a!2862) index!646) (select (arr!47979 a!2862) j!93))) (= (select (arr!47979 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= (select (store (arr!47979 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1481624 () Bool)

(declare-fun res!1006928 () Bool)

(assert (=> b!1481624 (=> (not res!1006928) (not e!830949))))

(assert (=> b!1481624 (= res!1006928 (and (= (size!48529 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48529 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48529 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1481625 () Bool)

(declare-fun res!1006934 () Bool)

(assert (=> b!1481625 (=> (not res!1006934) (not e!830949))))

(assert (=> b!1481625 (= res!1006934 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1481626 () Bool)

(declare-fun res!1006922 () Bool)

(assert (=> b!1481626 (=> (not res!1006922) (not e!830951))))

(assert (=> b!1481626 (= res!1006922 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1481627 () Bool)

(declare-fun res!1006925 () Bool)

(assert (=> b!1481627 (=> (not res!1006925) (not e!830948))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99403 (_ BitVec 32)) SeekEntryResult!12219)

(assert (=> b!1481627 (= res!1006925 (= (seekEntryOrOpen!0 (select (arr!47979 a!2862) j!93) a!2862 mask!2687) (Found!12219 j!93)))))

(declare-fun b!1481628 () Bool)

(assert (=> b!1481628 (= e!830949 e!830950)))

(declare-fun res!1006933 () Bool)

(assert (=> b!1481628 (=> (not res!1006933) (not e!830950))))

(assert (=> b!1481628 (= res!1006933 (= (select (store (arr!47979 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!646831 () array!99403)

(assert (=> b!1481628 (= lt!646831 (array!99404 (store (arr!47979 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48529 a!2862)))))

(declare-fun b!1481629 () Bool)

(declare-fun res!1006936 () Bool)

(assert (=> b!1481629 (=> (not res!1006936) (not e!830951))))

(declare-fun e!830953 () Bool)

(assert (=> b!1481629 (= res!1006936 e!830953)))

(declare-fun c!136869 () Bool)

(assert (=> b!1481629 (= c!136869 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1481630 () Bool)

(declare-fun res!1006932 () Bool)

(assert (=> b!1481630 (=> (not res!1006932) (not e!830949))))

(assert (=> b!1481630 (= res!1006932 (validKeyInArray!0 (select (arr!47979 a!2862) i!1006)))))

(declare-fun b!1481631 () Bool)

(declare-fun res!1006931 () Bool)

(assert (=> b!1481631 (=> (not res!1006931) (not e!830954))))

(assert (=> b!1481631 (= res!1006931 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47979 a!2862) j!93) a!2862 mask!2687) lt!646833))))

(declare-fun b!1481632 () Bool)

(declare-fun lt!646830 () SeekEntryResult!12219)

(declare-fun lt!646829 () (_ BitVec 64))

(assert (=> b!1481632 (= e!830953 (= lt!646830 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!646829 lt!646831 mask!2687)))))

(declare-fun b!1481633 () Bool)

(assert (=> b!1481633 (= e!830954 e!830951)))

(declare-fun res!1006927 () Bool)

(assert (=> b!1481633 (=> (not res!1006927) (not e!830951))))

(assert (=> b!1481633 (= res!1006927 (= lt!646830 (Intermediate!12219 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1481633 (= lt!646830 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!646829 mask!2687) lt!646829 lt!646831 mask!2687))))

(assert (=> b!1481633 (= lt!646829 (select (store (arr!47979 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1481634 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99403 (_ BitVec 32)) SeekEntryResult!12219)

(assert (=> b!1481634 (= e!830953 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!646829 lt!646831 mask!2687) (seekEntryOrOpen!0 lt!646829 lt!646831 mask!2687)))))

(assert (= (and start!126384 res!1006924) b!1481624))

(assert (= (and b!1481624 res!1006928) b!1481630))

(assert (= (and b!1481630 res!1006932) b!1481619))

(assert (= (and b!1481619 res!1006923) b!1481625))

(assert (= (and b!1481625 res!1006934) b!1481621))

(assert (= (and b!1481621 res!1006935) b!1481622))

(assert (= (and b!1481622 res!1006926) b!1481628))

(assert (= (and b!1481628 res!1006933) b!1481618))

(assert (= (and b!1481618 res!1006929) b!1481631))

(assert (= (and b!1481631 res!1006931) b!1481633))

(assert (= (and b!1481633 res!1006927) b!1481629))

(assert (= (and b!1481629 c!136869) b!1481632))

(assert (= (and b!1481629 (not c!136869)) b!1481634))

(assert (= (and b!1481629 res!1006936) b!1481626))

(assert (= (and b!1481626 res!1006922) b!1481620))

(assert (= (and b!1481620 res!1006930) b!1481627))

(assert (= (and b!1481627 res!1006925) b!1481623))

(declare-fun m!1367355 () Bool)

(assert (=> b!1481623 m!1367355))

(declare-fun m!1367357 () Bool)

(assert (=> b!1481623 m!1367357))

(declare-fun m!1367359 () Bool)

(assert (=> b!1481623 m!1367359))

(declare-fun m!1367361 () Bool)

(assert (=> b!1481623 m!1367361))

(declare-fun m!1367363 () Bool)

(assert (=> b!1481623 m!1367363))

(declare-fun m!1367365 () Bool)

(assert (=> start!126384 m!1367365))

(declare-fun m!1367367 () Bool)

(assert (=> start!126384 m!1367367))

(assert (=> b!1481628 m!1367355))

(declare-fun m!1367369 () Bool)

(assert (=> b!1481628 m!1367369))

(declare-fun m!1367371 () Bool)

(assert (=> b!1481634 m!1367371))

(declare-fun m!1367373 () Bool)

(assert (=> b!1481634 m!1367373))

(assert (=> b!1481619 m!1367363))

(assert (=> b!1481619 m!1367363))

(declare-fun m!1367375 () Bool)

(assert (=> b!1481619 m!1367375))

(assert (=> b!1481627 m!1367363))

(assert (=> b!1481627 m!1367363))

(declare-fun m!1367377 () Bool)

(assert (=> b!1481627 m!1367377))

(declare-fun m!1367379 () Bool)

(assert (=> b!1481620 m!1367379))

(declare-fun m!1367381 () Bool)

(assert (=> b!1481620 m!1367381))

(declare-fun m!1367383 () Bool)

(assert (=> b!1481630 m!1367383))

(assert (=> b!1481630 m!1367383))

(declare-fun m!1367385 () Bool)

(assert (=> b!1481630 m!1367385))

(assert (=> b!1481618 m!1367363))

(assert (=> b!1481618 m!1367363))

(declare-fun m!1367387 () Bool)

(assert (=> b!1481618 m!1367387))

(assert (=> b!1481618 m!1367387))

(assert (=> b!1481618 m!1367363))

(declare-fun m!1367389 () Bool)

(assert (=> b!1481618 m!1367389))

(declare-fun m!1367391 () Bool)

(assert (=> b!1481625 m!1367391))

(declare-fun m!1367393 () Bool)

(assert (=> b!1481633 m!1367393))

(assert (=> b!1481633 m!1367393))

(declare-fun m!1367395 () Bool)

(assert (=> b!1481633 m!1367395))

(assert (=> b!1481633 m!1367355))

(declare-fun m!1367397 () Bool)

(assert (=> b!1481633 m!1367397))

(declare-fun m!1367399 () Bool)

(assert (=> b!1481621 m!1367399))

(declare-fun m!1367401 () Bool)

(assert (=> b!1481632 m!1367401))

(assert (=> b!1481631 m!1367363))

(assert (=> b!1481631 m!1367363))

(declare-fun m!1367403 () Bool)

(assert (=> b!1481631 m!1367403))

(check-sat (not b!1481618) (not start!126384) (not b!1481631) (not b!1481634) (not b!1481625) (not b!1481620) (not b!1481632) (not b!1481619) (not b!1481633) (not b!1481630) (not b!1481627) (not b!1481621))
(check-sat)
