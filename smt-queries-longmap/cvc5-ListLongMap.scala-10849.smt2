; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127006 () Bool)

(assert start!127006)

(declare-fun b!1492573 () Bool)

(declare-fun res!1015398 () Bool)

(declare-fun e!836187 () Bool)

(assert (=> b!1492573 (=> (not res!1015398) (not e!836187))))

(declare-datatypes ((array!99716 0))(
  ( (array!99717 (arr!48128 (Array (_ BitVec 32) (_ BitVec 64))) (size!48678 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99716)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12368 0))(
  ( (MissingZero!12368 (index!51864 (_ BitVec 32))) (Found!12368 (index!51865 (_ BitVec 32))) (Intermediate!12368 (undefined!13180 Bool) (index!51866 (_ BitVec 32)) (x!133460 (_ BitVec 32))) (Undefined!12368) (MissingVacant!12368 (index!51867 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99716 (_ BitVec 32)) SeekEntryResult!12368)

(assert (=> b!1492573 (= res!1015398 (= (seekEntryOrOpen!0 (select (arr!48128 a!2862) j!93) a!2862 mask!2687) (Found!12368 j!93)))))

(declare-fun b!1492574 () Bool)

(declare-fun res!1015393 () Bool)

(declare-fun e!836185 () Bool)

(assert (=> b!1492574 (=> (not res!1015393) (not e!836185))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1492574 (= res!1015393 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48678 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48678 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48678 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1492575 () Bool)

(declare-fun res!1015387 () Bool)

(declare-fun e!836191 () Bool)

(assert (=> b!1492575 (=> (not res!1015387) (not e!836191))))

(declare-fun e!836188 () Bool)

(assert (=> b!1492575 (= res!1015387 e!836188)))

(declare-fun c!138123 () Bool)

(assert (=> b!1492575 (= c!138123 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1492576 () Bool)

(declare-fun e!836186 () Bool)

(assert (=> b!1492576 (= e!836191 (not e!836186))))

(declare-fun res!1015391 () Bool)

(assert (=> b!1492576 (=> res!1015391 e!836186)))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1492576 (= res!1015391 (or (and (= (select (arr!48128 a!2862) index!646) (select (store (arr!48128 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48128 a!2862) index!646) (select (arr!48128 a!2862) j!93))) (= (select (arr!48128 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1492576 e!836187))

(declare-fun res!1015394 () Bool)

(assert (=> b!1492576 (=> (not res!1015394) (not e!836187))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99716 (_ BitVec 32)) Bool)

(assert (=> b!1492576 (= res!1015394 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!50076 0))(
  ( (Unit!50077) )
))
(declare-fun lt!650696 () Unit!50076)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99716 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50076)

(assert (=> b!1492576 (= lt!650696 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun res!1015392 () Bool)

(assert (=> start!127006 (=> (not res!1015392) (not e!836185))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127006 (= res!1015392 (validMask!0 mask!2687))))

(assert (=> start!127006 e!836185))

(assert (=> start!127006 true))

(declare-fun array_inv!37156 (array!99716) Bool)

(assert (=> start!127006 (array_inv!37156 a!2862)))

(declare-fun b!1492577 () Bool)

(declare-fun res!1015388 () Bool)

(assert (=> b!1492577 (=> (not res!1015388) (not e!836185))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1492577 (= res!1015388 (validKeyInArray!0 (select (arr!48128 a!2862) j!93)))))

(declare-fun b!1492578 () Bool)

(declare-fun res!1015399 () Bool)

(assert (=> b!1492578 (=> (not res!1015399) (not e!836185))))

(assert (=> b!1492578 (= res!1015399 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun lt!650699 () (_ BitVec 64))

(declare-fun lt!650697 () SeekEntryResult!12368)

(declare-fun b!1492579 () Bool)

(declare-fun lt!650695 () array!99716)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99716 (_ BitVec 32)) SeekEntryResult!12368)

(assert (=> b!1492579 (= e!836188 (= lt!650697 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!650699 lt!650695 mask!2687)))))

(declare-fun b!1492580 () Bool)

(declare-fun e!836189 () Bool)

(assert (=> b!1492580 (= e!836189 e!836191)))

(declare-fun res!1015396 () Bool)

(assert (=> b!1492580 (=> (not res!1015396) (not e!836191))))

(assert (=> b!1492580 (= res!1015396 (= lt!650697 (Intermediate!12368 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1492580 (= lt!650697 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!650699 mask!2687) lt!650699 lt!650695 mask!2687))))

(assert (=> b!1492580 (= lt!650699 (select (store (arr!48128 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1492581 () Bool)

(declare-fun res!1015390 () Bool)

(assert (=> b!1492581 (=> (not res!1015390) (not e!836191))))

(assert (=> b!1492581 (= res!1015390 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1492582 () Bool)

(declare-fun res!1015397 () Bool)

(assert (=> b!1492582 (=> (not res!1015397) (not e!836189))))

(declare-fun lt!650698 () SeekEntryResult!12368)

(assert (=> b!1492582 (= res!1015397 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48128 a!2862) j!93) a!2862 mask!2687) lt!650698))))

(declare-fun b!1492583 () Bool)

(declare-fun res!1015386 () Bool)

(assert (=> b!1492583 (=> (not res!1015386) (not e!836185))))

(declare-datatypes ((List!34629 0))(
  ( (Nil!34626) (Cons!34625 (h!36011 (_ BitVec 64)) (t!49323 List!34629)) )
))
(declare-fun arrayNoDuplicates!0 (array!99716 (_ BitVec 32) List!34629) Bool)

(assert (=> b!1492583 (= res!1015386 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34626))))

(declare-fun b!1492584 () Bool)

(assert (=> b!1492584 (= e!836186 true)))

(declare-fun lt!650700 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1492584 (= lt!650700 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1492585 () Bool)

(declare-fun res!1015385 () Bool)

(assert (=> b!1492585 (=> (not res!1015385) (not e!836185))))

(assert (=> b!1492585 (= res!1015385 (and (= (size!48678 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48678 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48678 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1492586 () Bool)

(assert (=> b!1492586 (= e!836187 (or (= (select (arr!48128 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48128 a!2862) intermediateBeforeIndex!19) (select (arr!48128 a!2862) j!93))))))

(declare-fun b!1492587 () Bool)

(declare-fun e!836192 () Bool)

(assert (=> b!1492587 (= e!836192 e!836189)))

(declare-fun res!1015384 () Bool)

(assert (=> b!1492587 (=> (not res!1015384) (not e!836189))))

(assert (=> b!1492587 (= res!1015384 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48128 a!2862) j!93) mask!2687) (select (arr!48128 a!2862) j!93) a!2862 mask!2687) lt!650698))))

(assert (=> b!1492587 (= lt!650698 (Intermediate!12368 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1492588 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99716 (_ BitVec 32)) SeekEntryResult!12368)

(assert (=> b!1492588 (= e!836188 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!650699 lt!650695 mask!2687) (seekEntryOrOpen!0 lt!650699 lt!650695 mask!2687)))))

(declare-fun b!1492589 () Bool)

(declare-fun res!1015395 () Bool)

(assert (=> b!1492589 (=> (not res!1015395) (not e!836185))))

(assert (=> b!1492589 (= res!1015395 (validKeyInArray!0 (select (arr!48128 a!2862) i!1006)))))

(declare-fun b!1492590 () Bool)

(assert (=> b!1492590 (= e!836185 e!836192)))

(declare-fun res!1015389 () Bool)

(assert (=> b!1492590 (=> (not res!1015389) (not e!836192))))

(assert (=> b!1492590 (= res!1015389 (= (select (store (arr!48128 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1492590 (= lt!650695 (array!99717 (store (arr!48128 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48678 a!2862)))))

(assert (= (and start!127006 res!1015392) b!1492585))

(assert (= (and b!1492585 res!1015385) b!1492589))

(assert (= (and b!1492589 res!1015395) b!1492577))

(assert (= (and b!1492577 res!1015388) b!1492578))

(assert (= (and b!1492578 res!1015399) b!1492583))

(assert (= (and b!1492583 res!1015386) b!1492574))

(assert (= (and b!1492574 res!1015393) b!1492590))

(assert (= (and b!1492590 res!1015389) b!1492587))

(assert (= (and b!1492587 res!1015384) b!1492582))

(assert (= (and b!1492582 res!1015397) b!1492580))

(assert (= (and b!1492580 res!1015396) b!1492575))

(assert (= (and b!1492575 c!138123) b!1492579))

(assert (= (and b!1492575 (not c!138123)) b!1492588))

(assert (= (and b!1492575 res!1015387) b!1492581))

(assert (= (and b!1492581 res!1015390) b!1492576))

(assert (= (and b!1492576 res!1015394) b!1492573))

(assert (= (and b!1492573 res!1015398) b!1492586))

(assert (= (and b!1492576 (not res!1015391)) b!1492584))

(declare-fun m!1376521 () Bool)

(assert (=> b!1492577 m!1376521))

(assert (=> b!1492577 m!1376521))

(declare-fun m!1376523 () Bool)

(assert (=> b!1492577 m!1376523))

(assert (=> b!1492573 m!1376521))

(assert (=> b!1492573 m!1376521))

(declare-fun m!1376525 () Bool)

(assert (=> b!1492573 m!1376525))

(declare-fun m!1376527 () Bool)

(assert (=> b!1492586 m!1376527))

(assert (=> b!1492586 m!1376521))

(declare-fun m!1376529 () Bool)

(assert (=> start!127006 m!1376529))

(declare-fun m!1376531 () Bool)

(assert (=> start!127006 m!1376531))

(assert (=> b!1492587 m!1376521))

(assert (=> b!1492587 m!1376521))

(declare-fun m!1376533 () Bool)

(assert (=> b!1492587 m!1376533))

(assert (=> b!1492587 m!1376533))

(assert (=> b!1492587 m!1376521))

(declare-fun m!1376535 () Bool)

(assert (=> b!1492587 m!1376535))

(declare-fun m!1376537 () Bool)

(assert (=> b!1492584 m!1376537))

(declare-fun m!1376539 () Bool)

(assert (=> b!1492579 m!1376539))

(declare-fun m!1376541 () Bool)

(assert (=> b!1492590 m!1376541))

(declare-fun m!1376543 () Bool)

(assert (=> b!1492590 m!1376543))

(declare-fun m!1376545 () Bool)

(assert (=> b!1492589 m!1376545))

(assert (=> b!1492589 m!1376545))

(declare-fun m!1376547 () Bool)

(assert (=> b!1492589 m!1376547))

(declare-fun m!1376549 () Bool)

(assert (=> b!1492580 m!1376549))

(assert (=> b!1492580 m!1376549))

(declare-fun m!1376551 () Bool)

(assert (=> b!1492580 m!1376551))

(assert (=> b!1492580 m!1376541))

(declare-fun m!1376553 () Bool)

(assert (=> b!1492580 m!1376553))

(declare-fun m!1376555 () Bool)

(assert (=> b!1492588 m!1376555))

(declare-fun m!1376557 () Bool)

(assert (=> b!1492588 m!1376557))

(declare-fun m!1376559 () Bool)

(assert (=> b!1492576 m!1376559))

(assert (=> b!1492576 m!1376541))

(declare-fun m!1376561 () Bool)

(assert (=> b!1492576 m!1376561))

(declare-fun m!1376563 () Bool)

(assert (=> b!1492576 m!1376563))

(declare-fun m!1376565 () Bool)

(assert (=> b!1492576 m!1376565))

(assert (=> b!1492576 m!1376521))

(assert (=> b!1492582 m!1376521))

(assert (=> b!1492582 m!1376521))

(declare-fun m!1376567 () Bool)

(assert (=> b!1492582 m!1376567))

(declare-fun m!1376569 () Bool)

(assert (=> b!1492578 m!1376569))

(declare-fun m!1376571 () Bool)

(assert (=> b!1492583 m!1376571))

(push 1)

