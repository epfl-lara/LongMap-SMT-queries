; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126142 () Bool)

(assert start!126142)

(declare-fun b!1477430 () Bool)

(declare-fun e!828820 () Bool)

(declare-fun e!828828 () Bool)

(assert (=> b!1477430 (= e!828820 e!828828)))

(declare-fun res!1003659 () Bool)

(assert (=> b!1477430 (=> (not res!1003659) (not e!828828))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!99226 0))(
  ( (array!99227 (arr!47893 (Array (_ BitVec 32) (_ BitVec 64))) (size!48445 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99226)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12158 0))(
  ( (MissingZero!12158 (index!51024 (_ BitVec 32))) (Found!12158 (index!51025 (_ BitVec 32))) (Intermediate!12158 (undefined!12970 Bool) (index!51026 (_ BitVec 32)) (x!132616 (_ BitVec 32))) (Undefined!12158) (MissingVacant!12158 (index!51027 (_ BitVec 32))) )
))
(declare-fun lt!645180 () SeekEntryResult!12158)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99226 (_ BitVec 32)) SeekEntryResult!12158)

(assert (=> b!1477430 (= res!1003659 (= lt!645180 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47893 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1477431 () Bool)

(declare-fun e!828825 () Bool)

(declare-fun e!828826 () Bool)

(assert (=> b!1477431 (= e!828825 e!828826)))

(declare-fun res!1003652 () Bool)

(assert (=> b!1477431 (=> (not res!1003652) (not e!828826))))

(declare-fun lt!645179 () SeekEntryResult!12158)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99226 (_ BitVec 32)) SeekEntryResult!12158)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1477431 (= res!1003652 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47893 a!2862) j!93) mask!2687) (select (arr!47893 a!2862) j!93) a!2862 mask!2687) lt!645179))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1477431 (= lt!645179 (Intermediate!12158 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1477432 () Bool)

(declare-fun e!828821 () Bool)

(assert (=> b!1477432 (= e!828821 e!828820)))

(declare-fun res!1003661 () Bool)

(assert (=> b!1477432 (=> res!1003661 e!828820)))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1477432 (= res!1003661 (or (and (= (select (arr!47893 a!2862) index!646) (select (store (arr!47893 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47893 a!2862) index!646) (select (arr!47893 a!2862) j!93))) (not (= (select (arr!47893 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1477433 () Bool)

(declare-fun res!1003660 () Bool)

(declare-fun e!828827 () Bool)

(assert (=> b!1477433 (=> (not res!1003660) (not e!828827))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1477433 (= res!1003660 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48445 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48445 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48445 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun lt!645178 () array!99226)

(declare-fun e!828823 () Bool)

(declare-fun lt!645175 () SeekEntryResult!12158)

(declare-fun lt!645176 () (_ BitVec 64))

(declare-fun b!1477434 () Bool)

(assert (=> b!1477434 (= e!828823 (= lt!645175 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!645176 lt!645178 mask!2687)))))

(declare-fun b!1477435 () Bool)

(declare-fun e!828822 () Bool)

(assert (=> b!1477435 (= e!828822 (not true))))

(assert (=> b!1477435 e!828821))

(declare-fun res!1003658 () Bool)

(assert (=> b!1477435 (=> (not res!1003658) (not e!828821))))

(assert (=> b!1477435 (= res!1003658 (and (= lt!645180 (Found!12158 j!93)) (or (= (select (arr!47893 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47893 a!2862) intermediateBeforeIndex!19) (select (arr!47893 a!2862) j!93)))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99226 (_ BitVec 32)) SeekEntryResult!12158)

(assert (=> b!1477435 (= lt!645180 (seekEntryOrOpen!0 (select (arr!47893 a!2862) j!93) a!2862 mask!2687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99226 (_ BitVec 32)) Bool)

(assert (=> b!1477435 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!49497 0))(
  ( (Unit!49498) )
))
(declare-fun lt!645177 () Unit!49497)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99226 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49497)

(assert (=> b!1477435 (= lt!645177 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1477436 () Bool)

(assert (=> b!1477436 (= e!828826 e!828822)))

(declare-fun res!1003662 () Bool)

(assert (=> b!1477436 (=> (not res!1003662) (not e!828822))))

(assert (=> b!1477436 (= res!1003662 (= lt!645175 (Intermediate!12158 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1477436 (= lt!645175 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!645176 mask!2687) lt!645176 lt!645178 mask!2687))))

(assert (=> b!1477436 (= lt!645176 (select (store (arr!47893 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1477437 () Bool)

(declare-fun res!1003664 () Bool)

(assert (=> b!1477437 (=> (not res!1003664) (not e!828822))))

(assert (=> b!1477437 (= res!1003664 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1477438 () Bool)

(declare-fun res!1003653 () Bool)

(assert (=> b!1477438 (=> (not res!1003653) (not e!828827))))

(assert (=> b!1477438 (= res!1003653 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1477429 () Bool)

(declare-fun res!1003666 () Bool)

(assert (=> b!1477429 (=> (not res!1003666) (not e!828827))))

(declare-datatypes ((List!34472 0))(
  ( (Nil!34469) (Cons!34468 (h!35836 (_ BitVec 64)) (t!49158 List!34472)) )
))
(declare-fun arrayNoDuplicates!0 (array!99226 (_ BitVec 32) List!34472) Bool)

(assert (=> b!1477429 (= res!1003666 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34469))))

(declare-fun res!1003655 () Bool)

(assert (=> start!126142 (=> (not res!1003655) (not e!828827))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126142 (= res!1003655 (validMask!0 mask!2687))))

(assert (=> start!126142 e!828827))

(assert (=> start!126142 true))

(declare-fun array_inv!37126 (array!99226) Bool)

(assert (=> start!126142 (array_inv!37126 a!2862)))

(declare-fun b!1477439 () Bool)

(declare-fun res!1003665 () Bool)

(assert (=> b!1477439 (=> (not res!1003665) (not e!828827))))

(assert (=> b!1477439 (= res!1003665 (and (= (size!48445 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48445 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48445 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1477440 () Bool)

(declare-fun res!1003656 () Bool)

(assert (=> b!1477440 (=> (not res!1003656) (not e!828827))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1477440 (= res!1003656 (validKeyInArray!0 (select (arr!47893 a!2862) i!1006)))))

(declare-fun b!1477441 () Bool)

(assert (=> b!1477441 (= e!828828 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1477442 () Bool)

(assert (=> b!1477442 (= e!828827 e!828825)))

(declare-fun res!1003654 () Bool)

(assert (=> b!1477442 (=> (not res!1003654) (not e!828825))))

(assert (=> b!1477442 (= res!1003654 (= (select (store (arr!47893 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1477442 (= lt!645178 (array!99227 (store (arr!47893 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48445 a!2862)))))

(declare-fun b!1477443 () Bool)

(declare-fun res!1003663 () Bool)

(assert (=> b!1477443 (=> (not res!1003663) (not e!828827))))

(assert (=> b!1477443 (= res!1003663 (validKeyInArray!0 (select (arr!47893 a!2862) j!93)))))

(declare-fun b!1477444 () Bool)

(assert (=> b!1477444 (= e!828823 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!645176 lt!645178 mask!2687) (seekEntryOrOpen!0 lt!645176 lt!645178 mask!2687)))))

(declare-fun b!1477445 () Bool)

(declare-fun res!1003651 () Bool)

(assert (=> b!1477445 (=> (not res!1003651) (not e!828826))))

(assert (=> b!1477445 (= res!1003651 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47893 a!2862) j!93) a!2862 mask!2687) lt!645179))))

(declare-fun b!1477446 () Bool)

(declare-fun res!1003657 () Bool)

(assert (=> b!1477446 (=> (not res!1003657) (not e!828822))))

(assert (=> b!1477446 (= res!1003657 e!828823)))

(declare-fun c!136411 () Bool)

(assert (=> b!1477446 (= c!136411 (bvsle x!665 intermediateAfterX!19))))

(assert (= (and start!126142 res!1003655) b!1477439))

(assert (= (and b!1477439 res!1003665) b!1477440))

(assert (= (and b!1477440 res!1003656) b!1477443))

(assert (= (and b!1477443 res!1003663) b!1477438))

(assert (= (and b!1477438 res!1003653) b!1477429))

(assert (= (and b!1477429 res!1003666) b!1477433))

(assert (= (and b!1477433 res!1003660) b!1477442))

(assert (= (and b!1477442 res!1003654) b!1477431))

(assert (= (and b!1477431 res!1003652) b!1477445))

(assert (= (and b!1477445 res!1003651) b!1477436))

(assert (= (and b!1477436 res!1003662) b!1477446))

(assert (= (and b!1477446 c!136411) b!1477434))

(assert (= (and b!1477446 (not c!136411)) b!1477444))

(assert (= (and b!1477446 res!1003657) b!1477437))

(assert (= (and b!1477437 res!1003664) b!1477435))

(assert (= (and b!1477435 res!1003658) b!1477432))

(assert (= (and b!1477432 (not res!1003661)) b!1477430))

(assert (= (and b!1477430 res!1003659) b!1477441))

(declare-fun m!1362891 () Bool)

(assert (=> b!1477435 m!1362891))

(declare-fun m!1362893 () Bool)

(assert (=> b!1477435 m!1362893))

(declare-fun m!1362895 () Bool)

(assert (=> b!1477435 m!1362895))

(declare-fun m!1362897 () Bool)

(assert (=> b!1477435 m!1362897))

(declare-fun m!1362899 () Bool)

(assert (=> b!1477435 m!1362899))

(assert (=> b!1477435 m!1362895))

(declare-fun m!1362901 () Bool)

(assert (=> b!1477442 m!1362901))

(declare-fun m!1362903 () Bool)

(assert (=> b!1477442 m!1362903))

(assert (=> b!1477445 m!1362895))

(assert (=> b!1477445 m!1362895))

(declare-fun m!1362905 () Bool)

(assert (=> b!1477445 m!1362905))

(declare-fun m!1362907 () Bool)

(assert (=> b!1477429 m!1362907))

(declare-fun m!1362909 () Bool)

(assert (=> start!126142 m!1362909))

(declare-fun m!1362911 () Bool)

(assert (=> start!126142 m!1362911))

(declare-fun m!1362913 () Bool)

(assert (=> b!1477432 m!1362913))

(assert (=> b!1477432 m!1362901))

(declare-fun m!1362915 () Bool)

(assert (=> b!1477432 m!1362915))

(assert (=> b!1477432 m!1362895))

(declare-fun m!1362917 () Bool)

(assert (=> b!1477444 m!1362917))

(declare-fun m!1362919 () Bool)

(assert (=> b!1477444 m!1362919))

(declare-fun m!1362921 () Bool)

(assert (=> b!1477434 m!1362921))

(declare-fun m!1362923 () Bool)

(assert (=> b!1477440 m!1362923))

(assert (=> b!1477440 m!1362923))

(declare-fun m!1362925 () Bool)

(assert (=> b!1477440 m!1362925))

(declare-fun m!1362927 () Bool)

(assert (=> b!1477438 m!1362927))

(assert (=> b!1477431 m!1362895))

(assert (=> b!1477431 m!1362895))

(declare-fun m!1362929 () Bool)

(assert (=> b!1477431 m!1362929))

(assert (=> b!1477431 m!1362929))

(assert (=> b!1477431 m!1362895))

(declare-fun m!1362931 () Bool)

(assert (=> b!1477431 m!1362931))

(assert (=> b!1477443 m!1362895))

(assert (=> b!1477443 m!1362895))

(declare-fun m!1362933 () Bool)

(assert (=> b!1477443 m!1362933))

(assert (=> b!1477430 m!1362895))

(assert (=> b!1477430 m!1362895))

(declare-fun m!1362935 () Bool)

(assert (=> b!1477430 m!1362935))

(declare-fun m!1362937 () Bool)

(assert (=> b!1477436 m!1362937))

(assert (=> b!1477436 m!1362937))

(declare-fun m!1362939 () Bool)

(assert (=> b!1477436 m!1362939))

(assert (=> b!1477436 m!1362901))

(declare-fun m!1362941 () Bool)

(assert (=> b!1477436 m!1362941))

(check-sat (not b!1477431) (not b!1477436) (not b!1477430) (not b!1477429) (not b!1477445) (not b!1477440) (not b!1477444) (not b!1477435) (not b!1477438) (not start!126142) (not b!1477443) (not b!1477434))
(check-sat)
