; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125322 () Bool)

(assert start!125322)

(declare-fun res!987948 () Bool)

(declare-fun e!820567 () Bool)

(assert (=> start!125322 (=> (not res!987948) (not e!820567))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125322 (= res!987948 (validMask!0 mask!2687))))

(assert (=> start!125322 e!820567))

(assert (=> start!125322 true))

(declare-datatypes ((array!98665 0))(
  ( (array!98666 (arr!47617 (Array (_ BitVec 32) (_ BitVec 64))) (size!48168 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98665)

(declare-fun array_inv!36898 (array!98665) Bool)

(assert (=> start!125322 (array_inv!36898 a!2862)))

(declare-fun b!1458403 () Bool)

(declare-fun res!987954 () Bool)

(declare-fun e!820562 () Bool)

(assert (=> b!1458403 (=> res!987954 e!820562)))

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11766 0))(
  ( (MissingZero!11766 (index!49456 (_ BitVec 32))) (Found!11766 (index!49457 (_ BitVec 32))) (Intermediate!11766 (undefined!12578 Bool) (index!49458 (_ BitVec 32)) (x!131255 (_ BitVec 32))) (Undefined!11766) (MissingVacant!11766 (index!49459 (_ BitVec 32))) )
))
(declare-fun lt!639030 () SeekEntryResult!11766)

(declare-fun lt!639031 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98665 (_ BitVec 32)) SeekEntryResult!11766)

(assert (=> b!1458403 (= res!987954 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!639031 (select (arr!47617 a!2862) j!93) a!2862 mask!2687) lt!639030)))))

(declare-fun b!1458404 () Bool)

(declare-fun res!987957 () Bool)

(assert (=> b!1458404 (=> (not res!987957) (not e!820567))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1458404 (= res!987957 (validKeyInArray!0 (select (arr!47617 a!2862) i!1006)))))

(declare-fun lt!639025 () (_ BitVec 64))

(declare-fun e!820569 () Bool)

(declare-fun lt!639029 () SeekEntryResult!11766)

(declare-fun lt!639028 () array!98665)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun b!1458405 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98665 (_ BitVec 32)) SeekEntryResult!11766)

(assert (=> b!1458405 (= e!820569 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!639031 intermediateAfterIndex!19 lt!639025 lt!639028 mask!2687) lt!639029)))))

(declare-fun b!1458406 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun e!820560 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98665 (_ BitVec 32)) SeekEntryResult!11766)

(assert (=> b!1458406 (= e!820560 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!639025 lt!639028 mask!2687) (seekEntryOrOpen!0 lt!639025 lt!639028 mask!2687)))))

(declare-fun b!1458407 () Bool)

(declare-fun e!820564 () Bool)

(declare-fun e!820563 () Bool)

(assert (=> b!1458407 (= e!820564 e!820563)))

(declare-fun res!987962 () Bool)

(assert (=> b!1458407 (=> (not res!987962) (not e!820563))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun lt!639026 () SeekEntryResult!11766)

(assert (=> b!1458407 (= res!987962 (= lt!639026 (Intermediate!11766 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1458407 (= lt!639026 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!639025 mask!2687) lt!639025 lt!639028 mask!2687))))

(assert (=> b!1458407 (= lt!639025 (select (store (arr!47617 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1458408 () Bool)

(declare-fun res!987955 () Bool)

(assert (=> b!1458408 (=> (not res!987955) (not e!820563))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1458408 (= res!987955 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1458409 () Bool)

(declare-fun e!820566 () Bool)

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1458409 (= e!820566 (and (or (= (select (arr!47617 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47617 a!2862) intermediateBeforeIndex!19) (select (arr!47617 a!2862) j!93))) (let ((bdg!53306 (select (store (arr!47617 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!47617 a!2862) index!646) bdg!53306) (= (select (arr!47617 a!2862) index!646) (select (arr!47617 a!2862) j!93))) (= (select (arr!47617 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!53306 #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1458410 () Bool)

(declare-fun res!987956 () Bool)

(assert (=> b!1458410 (=> (not res!987956) (not e!820564))))

(assert (=> b!1458410 (= res!987956 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47617 a!2862) j!93) a!2862 mask!2687) lt!639030))))

(declare-fun b!1458411 () Bool)

(declare-fun res!987950 () Bool)

(assert (=> b!1458411 (=> (not res!987950) (not e!820566))))

(assert (=> b!1458411 (= res!987950 (= (seekEntryOrOpen!0 (select (arr!47617 a!2862) j!93) a!2862 mask!2687) (Found!11766 j!93)))))

(declare-fun b!1458412 () Bool)

(assert (=> b!1458412 (= e!820562 true)))

(declare-fun lt!639024 () Bool)

(assert (=> b!1458412 (= lt!639024 e!820569)))

(declare-fun c!134748 () Bool)

(assert (=> b!1458412 (= c!134748 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1458413 () Bool)

(declare-fun res!987945 () Bool)

(assert (=> b!1458413 (=> (not res!987945) (not e!820567))))

(declare-datatypes ((List!34105 0))(
  ( (Nil!34102) (Cons!34101 (h!35462 (_ BitVec 64)) (t!48791 List!34105)) )
))
(declare-fun arrayNoDuplicates!0 (array!98665 (_ BitVec 32) List!34105) Bool)

(assert (=> b!1458413 (= res!987945 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34102))))

(declare-fun b!1458414 () Bool)

(declare-fun res!987949 () Bool)

(assert (=> b!1458414 (=> (not res!987949) (not e!820567))))

(assert (=> b!1458414 (= res!987949 (and (= (size!48168 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48168 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48168 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1458415 () Bool)

(declare-fun res!987953 () Bool)

(assert (=> b!1458415 (=> (not res!987953) (not e!820567))))

(assert (=> b!1458415 (= res!987953 (validKeyInArray!0 (select (arr!47617 a!2862) j!93)))))

(declare-fun b!1458416 () Bool)

(declare-fun e!820565 () Bool)

(assert (=> b!1458416 (= e!820565 e!820564)))

(declare-fun res!987959 () Bool)

(assert (=> b!1458416 (=> (not res!987959) (not e!820564))))

(assert (=> b!1458416 (= res!987959 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47617 a!2862) j!93) mask!2687) (select (arr!47617 a!2862) j!93) a!2862 mask!2687) lt!639030))))

(assert (=> b!1458416 (= lt!639030 (Intermediate!11766 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1458417 () Bool)

(declare-fun e!820561 () Bool)

(assert (=> b!1458417 (= e!820561 e!820562)))

(declare-fun res!987946 () Bool)

(assert (=> b!1458417 (=> res!987946 e!820562)))

(assert (=> b!1458417 (= res!987946 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!639031 #b00000000000000000000000000000000) (bvsge lt!639031 (size!48168 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1458417 (= lt!639031 (nextIndex!0 index!646 (bvadd #b00000000000000000000000000000001 x!665) mask!2687))))

(assert (=> b!1458417 (= lt!639029 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!639025 lt!639028 mask!2687))))

(assert (=> b!1458417 (= lt!639029 (seekEntryOrOpen!0 lt!639025 lt!639028 mask!2687))))

(declare-fun b!1458418 () Bool)

(assert (=> b!1458418 (= e!820560 (= lt!639026 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!639025 lt!639028 mask!2687)))))

(declare-fun b!1458419 () Bool)

(declare-fun res!987958 () Bool)

(assert (=> b!1458419 (=> (not res!987958) (not e!820567))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98665 (_ BitVec 32)) Bool)

(assert (=> b!1458419 (= res!987958 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1458420 () Bool)

(assert (=> b!1458420 (= e!820563 (not e!820561))))

(declare-fun res!987961 () Bool)

(assert (=> b!1458420 (=> res!987961 e!820561)))

(assert (=> b!1458420 (= res!987961 (or (and (= (select (arr!47617 a!2862) index!646) (select (store (arr!47617 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47617 a!2862) index!646) (select (arr!47617 a!2862) j!93))) (= (select (arr!47617 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1458420 e!820566))

(declare-fun res!987951 () Bool)

(assert (=> b!1458420 (=> (not res!987951) (not e!820566))))

(assert (=> b!1458420 (= res!987951 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49061 0))(
  ( (Unit!49062) )
))
(declare-fun lt!639027 () Unit!49061)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98665 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49061)

(assert (=> b!1458420 (= lt!639027 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1458421 () Bool)

(declare-fun res!987947 () Bool)

(assert (=> b!1458421 (=> (not res!987947) (not e!820563))))

(assert (=> b!1458421 (= res!987947 e!820560)))

(declare-fun c!134749 () Bool)

(assert (=> b!1458421 (= c!134749 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1458422 () Bool)

(assert (=> b!1458422 (= e!820567 e!820565)))

(declare-fun res!987952 () Bool)

(assert (=> b!1458422 (=> (not res!987952) (not e!820565))))

(assert (=> b!1458422 (= res!987952 (= (select (store (arr!47617 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1458422 (= lt!639028 (array!98666 (store (arr!47617 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48168 a!2862)))))

(declare-fun b!1458423 () Bool)

(assert (=> b!1458423 (= e!820569 (not (= lt!639026 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!639031 lt!639025 lt!639028 mask!2687))))))

(declare-fun b!1458424 () Bool)

(declare-fun res!987960 () Bool)

(assert (=> b!1458424 (=> (not res!987960) (not e!820567))))

(assert (=> b!1458424 (= res!987960 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48168 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48168 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48168 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(assert (= (and start!125322 res!987948) b!1458414))

(assert (= (and b!1458414 res!987949) b!1458404))

(assert (= (and b!1458404 res!987957) b!1458415))

(assert (= (and b!1458415 res!987953) b!1458419))

(assert (= (and b!1458419 res!987958) b!1458413))

(assert (= (and b!1458413 res!987945) b!1458424))

(assert (= (and b!1458424 res!987960) b!1458422))

(assert (= (and b!1458422 res!987952) b!1458416))

(assert (= (and b!1458416 res!987959) b!1458410))

(assert (= (and b!1458410 res!987956) b!1458407))

(assert (= (and b!1458407 res!987962) b!1458421))

(assert (= (and b!1458421 c!134749) b!1458418))

(assert (= (and b!1458421 (not c!134749)) b!1458406))

(assert (= (and b!1458421 res!987947) b!1458408))

(assert (= (and b!1458408 res!987955) b!1458420))

(assert (= (and b!1458420 res!987951) b!1458411))

(assert (= (and b!1458411 res!987950) b!1458409))

(assert (= (and b!1458420 (not res!987961)) b!1458417))

(assert (= (and b!1458417 (not res!987946)) b!1458403))

(assert (= (and b!1458403 (not res!987954)) b!1458412))

(assert (= (and b!1458412 c!134748) b!1458423))

(assert (= (and b!1458412 (not c!134748)) b!1458405))

(declare-fun m!1346539 () Bool)

(assert (=> b!1458422 m!1346539))

(declare-fun m!1346541 () Bool)

(assert (=> b!1458422 m!1346541))

(declare-fun m!1346543 () Bool)

(assert (=> b!1458416 m!1346543))

(assert (=> b!1458416 m!1346543))

(declare-fun m!1346545 () Bool)

(assert (=> b!1458416 m!1346545))

(assert (=> b!1458416 m!1346545))

(assert (=> b!1458416 m!1346543))

(declare-fun m!1346547 () Bool)

(assert (=> b!1458416 m!1346547))

(declare-fun m!1346549 () Bool)

(assert (=> b!1458417 m!1346549))

(declare-fun m!1346551 () Bool)

(assert (=> b!1458417 m!1346551))

(declare-fun m!1346553 () Bool)

(assert (=> b!1458417 m!1346553))

(declare-fun m!1346555 () Bool)

(assert (=> b!1458418 m!1346555))

(assert (=> b!1458410 m!1346543))

(assert (=> b!1458410 m!1346543))

(declare-fun m!1346557 () Bool)

(assert (=> b!1458410 m!1346557))

(assert (=> b!1458406 m!1346551))

(assert (=> b!1458406 m!1346553))

(declare-fun m!1346559 () Bool)

(assert (=> b!1458407 m!1346559))

(assert (=> b!1458407 m!1346559))

(declare-fun m!1346561 () Bool)

(assert (=> b!1458407 m!1346561))

(assert (=> b!1458407 m!1346539))

(declare-fun m!1346563 () Bool)

(assert (=> b!1458407 m!1346563))

(declare-fun m!1346565 () Bool)

(assert (=> b!1458420 m!1346565))

(assert (=> b!1458420 m!1346539))

(declare-fun m!1346567 () Bool)

(assert (=> b!1458420 m!1346567))

(declare-fun m!1346569 () Bool)

(assert (=> b!1458420 m!1346569))

(declare-fun m!1346571 () Bool)

(assert (=> b!1458420 m!1346571))

(assert (=> b!1458420 m!1346543))

(declare-fun m!1346573 () Bool)

(assert (=> b!1458419 m!1346573))

(declare-fun m!1346575 () Bool)

(assert (=> b!1458423 m!1346575))

(declare-fun m!1346577 () Bool)

(assert (=> start!125322 m!1346577))

(declare-fun m!1346579 () Bool)

(assert (=> start!125322 m!1346579))

(declare-fun m!1346581 () Bool)

(assert (=> b!1458404 m!1346581))

(assert (=> b!1458404 m!1346581))

(declare-fun m!1346583 () Bool)

(assert (=> b!1458404 m!1346583))

(assert (=> b!1458403 m!1346543))

(assert (=> b!1458403 m!1346543))

(declare-fun m!1346585 () Bool)

(assert (=> b!1458403 m!1346585))

(assert (=> b!1458411 m!1346543))

(assert (=> b!1458411 m!1346543))

(declare-fun m!1346587 () Bool)

(assert (=> b!1458411 m!1346587))

(assert (=> b!1458415 m!1346543))

(assert (=> b!1458415 m!1346543))

(declare-fun m!1346589 () Bool)

(assert (=> b!1458415 m!1346589))

(assert (=> b!1458409 m!1346539))

(declare-fun m!1346591 () Bool)

(assert (=> b!1458409 m!1346591))

(assert (=> b!1458409 m!1346567))

(assert (=> b!1458409 m!1346569))

(assert (=> b!1458409 m!1346543))

(declare-fun m!1346593 () Bool)

(assert (=> b!1458413 m!1346593))

(declare-fun m!1346595 () Bool)

(assert (=> b!1458405 m!1346595))

(check-sat (not start!125322) (not b!1458417) (not b!1458404) (not b!1458418) (not b!1458411) (not b!1458410) (not b!1458419) (not b!1458415) (not b!1458420) (not b!1458407) (not b!1458416) (not b!1458403) (not b!1458423) (not b!1458406) (not b!1458413) (not b!1458405))
(check-sat)
