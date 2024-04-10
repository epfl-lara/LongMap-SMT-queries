; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125916 () Bool)

(assert start!125916)

(declare-fun b!1474415 () Bool)

(declare-fun e!827265 () Bool)

(declare-fun e!827261 () Bool)

(assert (=> b!1474415 (= e!827265 e!827261)))

(declare-fun res!1001631 () Bool)

(assert (=> b!1474415 (=> (not res!1001631) (not e!827261))))

(declare-datatypes ((SeekEntryResult!12120 0))(
  ( (MissingZero!12120 (index!50872 (_ BitVec 32))) (Found!12120 (index!50873 (_ BitVec 32))) (Intermediate!12120 (undefined!12932 Bool) (index!50874 (_ BitVec 32)) (x!132452 (_ BitVec 32))) (Undefined!12120) (MissingVacant!12120 (index!50875 (_ BitVec 32))) )
))
(declare-fun lt!644246 () SeekEntryResult!12120)

(declare-datatypes ((array!99193 0))(
  ( (array!99194 (arr!47880 (Array (_ BitVec 32) (_ BitVec 64))) (size!48430 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99193)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99193 (_ BitVec 32)) SeekEntryResult!12120)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1474415 (= res!1001631 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47880 a!2862) j!93) mask!2687) (select (arr!47880 a!2862) j!93) a!2862 mask!2687) lt!644246))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1474415 (= lt!644246 (Intermediate!12120 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1474416 () Bool)

(declare-fun res!1001626 () Bool)

(declare-fun e!827263 () Bool)

(assert (=> b!1474416 (=> (not res!1001626) (not e!827263))))

(declare-datatypes ((List!34381 0))(
  ( (Nil!34378) (Cons!34377 (h!35736 (_ BitVec 64)) (t!49075 List!34381)) )
))
(declare-fun arrayNoDuplicates!0 (array!99193 (_ BitVec 32) List!34381) Bool)

(assert (=> b!1474416 (= res!1001626 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34378))))

(declare-fun b!1474417 () Bool)

(declare-fun res!1001628 () Bool)

(declare-fun e!827262 () Bool)

(assert (=> b!1474417 (=> (not res!1001628) (not e!827262))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99193 (_ BitVec 32)) SeekEntryResult!12120)

(assert (=> b!1474417 (= res!1001628 (= (seekEntryOrOpen!0 (select (arr!47880 a!2862) j!93) a!2862 mask!2687) (Found!12120 j!93)))))

(declare-fun res!1001633 () Bool)

(assert (=> start!125916 (=> (not res!1001633) (not e!827263))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125916 (= res!1001633 (validMask!0 mask!2687))))

(assert (=> start!125916 e!827263))

(assert (=> start!125916 true))

(declare-fun array_inv!36908 (array!99193) Bool)

(assert (=> start!125916 (array_inv!36908 a!2862)))

(declare-fun b!1474418 () Bool)

(declare-fun res!1001632 () Bool)

(declare-fun e!827264 () Bool)

(assert (=> b!1474418 (=> (not res!1001632) (not e!827264))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1474418 (= res!1001632 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1474419 () Bool)

(declare-fun res!1001624 () Bool)

(assert (=> b!1474419 (=> (not res!1001624) (not e!827263))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1474419 (= res!1001624 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48430 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48430 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48430 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1474420 () Bool)

(declare-fun res!1001621 () Bool)

(assert (=> b!1474420 (=> (not res!1001621) (not e!827263))))

(assert (=> b!1474420 (= res!1001621 (and (= (size!48430 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48430 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48430 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1474421 () Bool)

(declare-fun res!1001627 () Bool)

(assert (=> b!1474421 (=> (not res!1001627) (not e!827264))))

(declare-fun e!827266 () Bool)

(assert (=> b!1474421 (= res!1001627 e!827266)))

(declare-fun c!135912 () Bool)

(assert (=> b!1474421 (= c!135912 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1474422 () Bool)

(assert (=> b!1474422 (= e!827262 (or (= (select (arr!47880 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47880 a!2862) intermediateBeforeIndex!19) (select (arr!47880 a!2862) j!93))))))

(declare-fun b!1474423 () Bool)

(declare-fun res!1001635 () Bool)

(assert (=> b!1474423 (=> (not res!1001635) (not e!827263))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1474423 (= res!1001635 (validKeyInArray!0 (select (arr!47880 a!2862) j!93)))))

(declare-fun b!1474424 () Bool)

(declare-fun res!1001629 () Bool)

(assert (=> b!1474424 (=> (not res!1001629) (not e!827261))))

(assert (=> b!1474424 (= res!1001629 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47880 a!2862) j!93) a!2862 mask!2687) lt!644246))))

(declare-fun b!1474425 () Bool)

(declare-fun lt!644243 () SeekEntryResult!12120)

(declare-fun lt!644245 () (_ BitVec 64))

(declare-fun lt!644244 () array!99193)

(assert (=> b!1474425 (= e!827266 (= lt!644243 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!644245 lt!644244 mask!2687)))))

(declare-fun b!1474426 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99193 (_ BitVec 32)) SeekEntryResult!12120)

(assert (=> b!1474426 (= e!827266 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!644245 lt!644244 mask!2687) (seekEntryOrOpen!0 lt!644245 lt!644244 mask!2687)))))

(declare-fun b!1474427 () Bool)

(assert (=> b!1474427 (= e!827263 e!827265)))

(declare-fun res!1001630 () Bool)

(assert (=> b!1474427 (=> (not res!1001630) (not e!827265))))

(assert (=> b!1474427 (= res!1001630 (= (select (store (arr!47880 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1474427 (= lt!644244 (array!99194 (store (arr!47880 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48430 a!2862)))))

(declare-fun b!1474428 () Bool)

(declare-fun res!1001634 () Bool)

(assert (=> b!1474428 (=> (not res!1001634) (not e!827263))))

(assert (=> b!1474428 (= res!1001634 (validKeyInArray!0 (select (arr!47880 a!2862) i!1006)))))

(declare-fun b!1474429 () Bool)

(assert (=> b!1474429 (= e!827264 (not true))))

(assert (=> b!1474429 e!827262))

(declare-fun res!1001623 () Bool)

(assert (=> b!1474429 (=> (not res!1001623) (not e!827262))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99193 (_ BitVec 32)) Bool)

(assert (=> b!1474429 (= res!1001623 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49580 0))(
  ( (Unit!49581) )
))
(declare-fun lt!644247 () Unit!49580)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99193 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49580)

(assert (=> b!1474429 (= lt!644247 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1474430 () Bool)

(declare-fun res!1001625 () Bool)

(assert (=> b!1474430 (=> (not res!1001625) (not e!827263))))

(assert (=> b!1474430 (= res!1001625 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1474431 () Bool)

(assert (=> b!1474431 (= e!827261 e!827264)))

(declare-fun res!1001622 () Bool)

(assert (=> b!1474431 (=> (not res!1001622) (not e!827264))))

(assert (=> b!1474431 (= res!1001622 (= lt!644243 (Intermediate!12120 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1474431 (= lt!644243 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!644245 mask!2687) lt!644245 lt!644244 mask!2687))))

(assert (=> b!1474431 (= lt!644245 (select (store (arr!47880 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(assert (= (and start!125916 res!1001633) b!1474420))

(assert (= (and b!1474420 res!1001621) b!1474428))

(assert (= (and b!1474428 res!1001634) b!1474423))

(assert (= (and b!1474423 res!1001635) b!1474430))

(assert (= (and b!1474430 res!1001625) b!1474416))

(assert (= (and b!1474416 res!1001626) b!1474419))

(assert (= (and b!1474419 res!1001624) b!1474427))

(assert (= (and b!1474427 res!1001630) b!1474415))

(assert (= (and b!1474415 res!1001631) b!1474424))

(assert (= (and b!1474424 res!1001629) b!1474431))

(assert (= (and b!1474431 res!1001622) b!1474421))

(assert (= (and b!1474421 c!135912) b!1474425))

(assert (= (and b!1474421 (not c!135912)) b!1474426))

(assert (= (and b!1474421 res!1001627) b!1474418))

(assert (= (and b!1474418 res!1001632) b!1474429))

(assert (= (and b!1474429 res!1001623) b!1474417))

(assert (= (and b!1474417 res!1001628) b!1474422))

(declare-fun m!1360865 () Bool)

(assert (=> b!1474427 m!1360865))

(declare-fun m!1360867 () Bool)

(assert (=> b!1474427 m!1360867))

(declare-fun m!1360869 () Bool)

(assert (=> b!1474422 m!1360869))

(declare-fun m!1360871 () Bool)

(assert (=> b!1474422 m!1360871))

(declare-fun m!1360873 () Bool)

(assert (=> b!1474431 m!1360873))

(assert (=> b!1474431 m!1360873))

(declare-fun m!1360875 () Bool)

(assert (=> b!1474431 m!1360875))

(assert (=> b!1474431 m!1360865))

(declare-fun m!1360877 () Bool)

(assert (=> b!1474431 m!1360877))

(assert (=> b!1474423 m!1360871))

(assert (=> b!1474423 m!1360871))

(declare-fun m!1360879 () Bool)

(assert (=> b!1474423 m!1360879))

(assert (=> b!1474415 m!1360871))

(assert (=> b!1474415 m!1360871))

(declare-fun m!1360881 () Bool)

(assert (=> b!1474415 m!1360881))

(assert (=> b!1474415 m!1360881))

(assert (=> b!1474415 m!1360871))

(declare-fun m!1360883 () Bool)

(assert (=> b!1474415 m!1360883))

(assert (=> b!1474417 m!1360871))

(assert (=> b!1474417 m!1360871))

(declare-fun m!1360885 () Bool)

(assert (=> b!1474417 m!1360885))

(declare-fun m!1360887 () Bool)

(assert (=> b!1474425 m!1360887))

(assert (=> b!1474424 m!1360871))

(assert (=> b!1474424 m!1360871))

(declare-fun m!1360889 () Bool)

(assert (=> b!1474424 m!1360889))

(declare-fun m!1360891 () Bool)

(assert (=> start!125916 m!1360891))

(declare-fun m!1360893 () Bool)

(assert (=> start!125916 m!1360893))

(declare-fun m!1360895 () Bool)

(assert (=> b!1474429 m!1360895))

(declare-fun m!1360897 () Bool)

(assert (=> b!1474429 m!1360897))

(declare-fun m!1360899 () Bool)

(assert (=> b!1474430 m!1360899))

(declare-fun m!1360901 () Bool)

(assert (=> b!1474426 m!1360901))

(declare-fun m!1360903 () Bool)

(assert (=> b!1474426 m!1360903))

(declare-fun m!1360905 () Bool)

(assert (=> b!1474416 m!1360905))

(declare-fun m!1360907 () Bool)

(assert (=> b!1474428 m!1360907))

(assert (=> b!1474428 m!1360907))

(declare-fun m!1360909 () Bool)

(assert (=> b!1474428 m!1360909))

(check-sat (not b!1474430) (not b!1474415) (not b!1474426) (not b!1474425) (not b!1474416) (not b!1474429) (not b!1474417) (not b!1474424) (not b!1474428) (not b!1474423) (not start!125916) (not b!1474431))
(check-sat)
