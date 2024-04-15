; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125644 () Bool)

(assert start!125644)

(declare-fun b!1470345 () Bool)

(declare-fun e!825371 () Bool)

(assert (=> b!1470345 (= e!825371 (not true))))

(declare-fun e!825370 () Bool)

(assert (=> b!1470345 e!825370))

(declare-fun res!998590 () Bool)

(assert (=> b!1470345 (=> (not res!998590) (not e!825370))))

(declare-datatypes ((array!99013 0))(
  ( (array!99014 (arr!47794 (Array (_ BitVec 32) (_ BitVec 64))) (size!48346 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99013)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99013 (_ BitVec 32)) Bool)

(assert (=> b!1470345 (= res!998590 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49299 0))(
  ( (Unit!49300) )
))
(declare-fun lt!642723 () Unit!49299)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99013 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49299)

(assert (=> b!1470345 (= lt!642723 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1470346 () Bool)

(declare-fun res!998586 () Bool)

(declare-fun e!825372 () Bool)

(assert (=> b!1470346 (=> (not res!998586) (not e!825372))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1470346 (= res!998586 (validKeyInArray!0 (select (arr!47794 a!2862) i!1006)))))

(declare-fun b!1470347 () Bool)

(declare-fun res!998591 () Bool)

(assert (=> b!1470347 (=> (not res!998591) (not e!825372))))

(declare-datatypes ((List!34373 0))(
  ( (Nil!34370) (Cons!34369 (h!35722 (_ BitVec 64)) (t!49059 List!34373)) )
))
(declare-fun arrayNoDuplicates!0 (array!99013 (_ BitVec 32) List!34373) Bool)

(assert (=> b!1470347 (= res!998591 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34370))))

(declare-fun b!1470348 () Bool)

(declare-fun res!998583 () Bool)

(assert (=> b!1470348 (=> (not res!998583) (not e!825372))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1470348 (= res!998583 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48346 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48346 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48346 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun lt!642726 () array!99013)

(declare-datatypes ((SeekEntryResult!12059 0))(
  ( (MissingZero!12059 (index!50628 (_ BitVec 32))) (Found!12059 (index!50629 (_ BitVec 32))) (Intermediate!12059 (undefined!12871 Bool) (index!50630 (_ BitVec 32)) (x!132208 (_ BitVec 32))) (Undefined!12059) (MissingVacant!12059 (index!50631 (_ BitVec 32))) )
))
(declare-fun lt!642722 () SeekEntryResult!12059)

(declare-fun b!1470349 () Bool)

(declare-fun lt!642724 () (_ BitVec 64))

(declare-fun e!825373 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99013 (_ BitVec 32)) SeekEntryResult!12059)

(assert (=> b!1470349 (= e!825373 (= lt!642722 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!642724 lt!642726 mask!2687)))))

(declare-fun b!1470350 () Bool)

(declare-fun res!998593 () Bool)

(assert (=> b!1470350 (=> (not res!998593) (not e!825372))))

(assert (=> b!1470350 (= res!998593 (validKeyInArray!0 (select (arr!47794 a!2862) j!93)))))

(declare-fun b!1470351 () Bool)

(declare-fun res!998588 () Bool)

(assert (=> b!1470351 (=> (not res!998588) (not e!825371))))

(assert (=> b!1470351 (= res!998588 e!825373)))

(declare-fun c!135397 () Bool)

(assert (=> b!1470351 (= c!135397 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1470353 () Bool)

(declare-fun res!998580 () Bool)

(assert (=> b!1470353 (=> (not res!998580) (not e!825371))))

(assert (=> b!1470353 (= res!998580 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1470354 () Bool)

(declare-fun e!825374 () Bool)

(assert (=> b!1470354 (= e!825372 e!825374)))

(declare-fun res!998582 () Bool)

(assert (=> b!1470354 (=> (not res!998582) (not e!825374))))

(assert (=> b!1470354 (= res!998582 (= (select (store (arr!47794 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1470354 (= lt!642726 (array!99014 (store (arr!47794 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48346 a!2862)))))

(declare-fun b!1470355 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99013 (_ BitVec 32)) SeekEntryResult!12059)

(assert (=> b!1470355 (= e!825370 (= (seekEntryOrOpen!0 (select (arr!47794 a!2862) j!93) a!2862 mask!2687) (Found!12059 j!93)))))

(declare-fun b!1470356 () Bool)

(declare-fun e!825375 () Bool)

(assert (=> b!1470356 (= e!825375 e!825371)))

(declare-fun res!998584 () Bool)

(assert (=> b!1470356 (=> (not res!998584) (not e!825371))))

(assert (=> b!1470356 (= res!998584 (= lt!642722 (Intermediate!12059 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1470356 (= lt!642722 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!642724 mask!2687) lt!642724 lt!642726 mask!2687))))

(assert (=> b!1470356 (= lt!642724 (select (store (arr!47794 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1470357 () Bool)

(declare-fun res!998592 () Bool)

(assert (=> b!1470357 (=> (not res!998592) (not e!825372))))

(assert (=> b!1470357 (= res!998592 (and (= (size!48346 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48346 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48346 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1470358 () Bool)

(declare-fun res!998587 () Bool)

(assert (=> b!1470358 (=> (not res!998587) (not e!825375))))

(declare-fun lt!642725 () SeekEntryResult!12059)

(assert (=> b!1470358 (= res!998587 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47794 a!2862) j!93) a!2862 mask!2687) lt!642725))))

(declare-fun res!998589 () Bool)

(assert (=> start!125644 (=> (not res!998589) (not e!825372))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125644 (= res!998589 (validMask!0 mask!2687))))

(assert (=> start!125644 e!825372))

(assert (=> start!125644 true))

(declare-fun array_inv!37027 (array!99013) Bool)

(assert (=> start!125644 (array_inv!37027 a!2862)))

(declare-fun b!1470352 () Bool)

(assert (=> b!1470352 (= e!825374 e!825375)))

(declare-fun res!998581 () Bool)

(assert (=> b!1470352 (=> (not res!998581) (not e!825375))))

(assert (=> b!1470352 (= res!998581 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47794 a!2862) j!93) mask!2687) (select (arr!47794 a!2862) j!93) a!2862 mask!2687) lt!642725))))

(assert (=> b!1470352 (= lt!642725 (Intermediate!12059 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1470359 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99013 (_ BitVec 32)) SeekEntryResult!12059)

(assert (=> b!1470359 (= e!825373 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!642724 lt!642726 mask!2687) (seekEntryOrOpen!0 lt!642724 lt!642726 mask!2687)))))

(declare-fun b!1470360 () Bool)

(declare-fun res!998585 () Bool)

(assert (=> b!1470360 (=> (not res!998585) (not e!825372))))

(assert (=> b!1470360 (= res!998585 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(assert (= (and start!125644 res!998589) b!1470357))

(assert (= (and b!1470357 res!998592) b!1470346))

(assert (= (and b!1470346 res!998586) b!1470350))

(assert (= (and b!1470350 res!998593) b!1470360))

(assert (= (and b!1470360 res!998585) b!1470347))

(assert (= (and b!1470347 res!998591) b!1470348))

(assert (= (and b!1470348 res!998583) b!1470354))

(assert (= (and b!1470354 res!998582) b!1470352))

(assert (= (and b!1470352 res!998581) b!1470358))

(assert (= (and b!1470358 res!998587) b!1470356))

(assert (= (and b!1470356 res!998584) b!1470351))

(assert (= (and b!1470351 c!135397) b!1470349))

(assert (= (and b!1470351 (not c!135397)) b!1470359))

(assert (= (and b!1470351 res!998588) b!1470353))

(assert (= (and b!1470353 res!998580) b!1470345))

(assert (= (and b!1470345 res!998590) b!1470355))

(declare-fun m!1356855 () Bool)

(assert (=> b!1470359 m!1356855))

(declare-fun m!1356857 () Bool)

(assert (=> b!1470359 m!1356857))

(declare-fun m!1356859 () Bool)

(assert (=> b!1470360 m!1356859))

(declare-fun m!1356861 () Bool)

(assert (=> b!1470350 m!1356861))

(assert (=> b!1470350 m!1356861))

(declare-fun m!1356863 () Bool)

(assert (=> b!1470350 m!1356863))

(declare-fun m!1356865 () Bool)

(assert (=> b!1470354 m!1356865))

(declare-fun m!1356867 () Bool)

(assert (=> b!1470354 m!1356867))

(declare-fun m!1356869 () Bool)

(assert (=> b!1470346 m!1356869))

(assert (=> b!1470346 m!1356869))

(declare-fun m!1356871 () Bool)

(assert (=> b!1470346 m!1356871))

(assert (=> b!1470355 m!1356861))

(assert (=> b!1470355 m!1356861))

(declare-fun m!1356873 () Bool)

(assert (=> b!1470355 m!1356873))

(declare-fun m!1356875 () Bool)

(assert (=> start!125644 m!1356875))

(declare-fun m!1356877 () Bool)

(assert (=> start!125644 m!1356877))

(assert (=> b!1470358 m!1356861))

(assert (=> b!1470358 m!1356861))

(declare-fun m!1356879 () Bool)

(assert (=> b!1470358 m!1356879))

(declare-fun m!1356881 () Bool)

(assert (=> b!1470345 m!1356881))

(declare-fun m!1356883 () Bool)

(assert (=> b!1470345 m!1356883))

(declare-fun m!1356885 () Bool)

(assert (=> b!1470347 m!1356885))

(declare-fun m!1356887 () Bool)

(assert (=> b!1470356 m!1356887))

(assert (=> b!1470356 m!1356887))

(declare-fun m!1356889 () Bool)

(assert (=> b!1470356 m!1356889))

(assert (=> b!1470356 m!1356865))

(declare-fun m!1356891 () Bool)

(assert (=> b!1470356 m!1356891))

(assert (=> b!1470352 m!1356861))

(assert (=> b!1470352 m!1356861))

(declare-fun m!1356893 () Bool)

(assert (=> b!1470352 m!1356893))

(assert (=> b!1470352 m!1356893))

(assert (=> b!1470352 m!1356861))

(declare-fun m!1356895 () Bool)

(assert (=> b!1470352 m!1356895))

(declare-fun m!1356897 () Bool)

(assert (=> b!1470349 m!1356897))

(check-sat (not b!1470347) (not start!125644) (not b!1470359) (not b!1470345) (not b!1470356) (not b!1470352) (not b!1470346) (not b!1470355) (not b!1470349) (not b!1470360) (not b!1470358) (not b!1470350))
(check-sat)
