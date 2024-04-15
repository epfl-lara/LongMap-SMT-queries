; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124648 () Bool)

(assert start!124648)

(declare-fun res!976627 () Bool)

(declare-fun e!813842 () Bool)

(assert (=> start!124648 (=> (not res!976627) (not e!813842))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124648 (= res!976627 (validMask!0 mask!2687))))

(assert (=> start!124648 e!813842))

(assert (=> start!124648 true))

(declare-datatypes ((array!98074 0))(
  ( (array!98075 (arr!47326 (Array (_ BitVec 32) (_ BitVec 64))) (size!47878 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98074)

(declare-fun array_inv!36559 (array!98074) Bool)

(assert (=> start!124648 (array_inv!36559 a!2862)))

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11603 0))(
  ( (MissingZero!11603 (index!48804 (_ BitVec 32))) (Found!11603 (index!48805 (_ BitVec 32))) (Intermediate!11603 (undefined!12415 Bool) (index!48806 (_ BitVec 32)) (x!130495 (_ BitVec 32))) (Undefined!11603) (MissingVacant!11603 (index!48807 (_ BitVec 32))) )
))
(declare-fun lt!634062 () SeekEntryResult!11603)

(declare-fun e!813846 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun b!1444550 () Bool)

(declare-fun lt!634058 () array!98074)

(declare-fun lt!634061 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98074 (_ BitVec 32)) SeekEntryResult!11603)

(assert (=> b!1444550 (= e!813846 (= lt!634062 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!634061 lt!634058 mask!2687)))))

(declare-fun b!1444551 () Bool)

(declare-fun res!976636 () Bool)

(assert (=> b!1444551 (=> (not res!976636) (not e!813842))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1444551 (= res!976636 (validKeyInArray!0 (select (arr!47326 a!2862) i!1006)))))

(declare-fun b!1444552 () Bool)

(declare-fun res!976634 () Bool)

(assert (=> b!1444552 (=> (not res!976634) (not e!813842))))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1444552 (= res!976634 (validKeyInArray!0 (select (arr!47326 a!2862) j!93)))))

(declare-fun b!1444553 () Bool)

(declare-fun res!976628 () Bool)

(assert (=> b!1444553 (=> (not res!976628) (not e!813842))))

(assert (=> b!1444553 (= res!976628 (and (= (size!47878 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47878 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47878 a!2862)) (not (= i!1006 j!93))))))

(declare-fun e!813845 () Bool)

(declare-fun b!1444554 () Bool)

(assert (=> b!1444554 (= e!813845 (not (or (and (= (select (arr!47326 a!2862) index!646) (select (store (arr!47326 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47326 a!2862) index!646) (select (arr!47326 a!2862) j!93))) (not (= (select (arr!47326 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge mask!2687 #b00000000000000000000000000000000))))))

(declare-fun e!813841 () Bool)

(assert (=> b!1444554 e!813841))

(declare-fun res!976635 () Bool)

(assert (=> b!1444554 (=> (not res!976635) (not e!813841))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98074 (_ BitVec 32)) Bool)

(assert (=> b!1444554 (= res!976635 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48543 0))(
  ( (Unit!48544) )
))
(declare-fun lt!634060 () Unit!48543)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98074 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48543)

(assert (=> b!1444554 (= lt!634060 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun b!1444555 () Bool)

(assert (=> b!1444555 (= e!813841 (or (= (select (arr!47326 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47326 a!2862) intermediateBeforeIndex!19) (select (arr!47326 a!2862) j!93))))))

(declare-fun b!1444556 () Bool)

(declare-fun res!976626 () Bool)

(assert (=> b!1444556 (=> (not res!976626) (not e!813842))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1444556 (= res!976626 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47878 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47878 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47878 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1444557 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98074 (_ BitVec 32)) SeekEntryResult!11603)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98074 (_ BitVec 32)) SeekEntryResult!11603)

(assert (=> b!1444557 (= e!813846 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!634061 lt!634058 mask!2687) (seekEntryOrOpen!0 lt!634061 lt!634058 mask!2687)))))

(declare-fun b!1444558 () Bool)

(declare-fun res!976629 () Bool)

(declare-fun e!813844 () Bool)

(assert (=> b!1444558 (=> (not res!976629) (not e!813844))))

(declare-fun lt!634059 () SeekEntryResult!11603)

(assert (=> b!1444558 (= res!976629 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47326 a!2862) j!93) a!2862 mask!2687) lt!634059))))

(declare-fun b!1444559 () Bool)

(declare-fun res!976630 () Bool)

(assert (=> b!1444559 (=> (not res!976630) (not e!813841))))

(assert (=> b!1444559 (= res!976630 (= (seekEntryOrOpen!0 (select (arr!47326 a!2862) j!93) a!2862 mask!2687) (Found!11603 j!93)))))

(declare-fun b!1444560 () Bool)

(declare-fun res!976633 () Bool)

(assert (=> b!1444560 (=> (not res!976633) (not e!813842))))

(assert (=> b!1444560 (= res!976633 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1444561 () Bool)

(declare-fun res!976624 () Bool)

(assert (=> b!1444561 (=> (not res!976624) (not e!813842))))

(declare-datatypes ((List!33905 0))(
  ( (Nil!33902) (Cons!33901 (h!35251 (_ BitVec 64)) (t!48591 List!33905)) )
))
(declare-fun arrayNoDuplicates!0 (array!98074 (_ BitVec 32) List!33905) Bool)

(assert (=> b!1444561 (= res!976624 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33902))))

(declare-fun b!1444562 () Bool)

(declare-fun e!813843 () Bool)

(assert (=> b!1444562 (= e!813842 e!813843)))

(declare-fun res!976632 () Bool)

(assert (=> b!1444562 (=> (not res!976632) (not e!813843))))

(assert (=> b!1444562 (= res!976632 (= (select (store (arr!47326 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1444562 (= lt!634058 (array!98075 (store (arr!47326 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47878 a!2862)))))

(declare-fun b!1444563 () Bool)

(assert (=> b!1444563 (= e!813843 e!813844)))

(declare-fun res!976625 () Bool)

(assert (=> b!1444563 (=> (not res!976625) (not e!813844))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1444563 (= res!976625 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47326 a!2862) j!93) mask!2687) (select (arr!47326 a!2862) j!93) a!2862 mask!2687) lt!634059))))

(assert (=> b!1444563 (= lt!634059 (Intermediate!11603 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1444564 () Bool)

(declare-fun res!976623 () Bool)

(assert (=> b!1444564 (=> (not res!976623) (not e!813845))))

(assert (=> b!1444564 (= res!976623 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1444565 () Bool)

(declare-fun res!976631 () Bool)

(assert (=> b!1444565 (=> (not res!976631) (not e!813845))))

(assert (=> b!1444565 (= res!976631 e!813846)))

(declare-fun c!133477 () Bool)

(assert (=> b!1444565 (= c!133477 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1444566 () Bool)

(assert (=> b!1444566 (= e!813844 e!813845)))

(declare-fun res!976622 () Bool)

(assert (=> b!1444566 (=> (not res!976622) (not e!813845))))

(assert (=> b!1444566 (= res!976622 (= lt!634062 (Intermediate!11603 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1444566 (= lt!634062 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!634061 mask!2687) lt!634061 lt!634058 mask!2687))))

(assert (=> b!1444566 (= lt!634061 (select (store (arr!47326 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(assert (= (and start!124648 res!976627) b!1444553))

(assert (= (and b!1444553 res!976628) b!1444551))

(assert (= (and b!1444551 res!976636) b!1444552))

(assert (= (and b!1444552 res!976634) b!1444560))

(assert (= (and b!1444560 res!976633) b!1444561))

(assert (= (and b!1444561 res!976624) b!1444556))

(assert (= (and b!1444556 res!976626) b!1444562))

(assert (= (and b!1444562 res!976632) b!1444563))

(assert (= (and b!1444563 res!976625) b!1444558))

(assert (= (and b!1444558 res!976629) b!1444566))

(assert (= (and b!1444566 res!976622) b!1444565))

(assert (= (and b!1444565 c!133477) b!1444550))

(assert (= (and b!1444565 (not c!133477)) b!1444557))

(assert (= (and b!1444565 res!976631) b!1444564))

(assert (= (and b!1444564 res!976623) b!1444554))

(assert (= (and b!1444554 res!976635) b!1444559))

(assert (= (and b!1444559 res!976630) b!1444555))

(declare-fun m!1333071 () Bool)

(assert (=> b!1444558 m!1333071))

(assert (=> b!1444558 m!1333071))

(declare-fun m!1333073 () Bool)

(assert (=> b!1444558 m!1333073))

(declare-fun m!1333075 () Bool)

(assert (=> b!1444554 m!1333075))

(declare-fun m!1333077 () Bool)

(assert (=> b!1444554 m!1333077))

(declare-fun m!1333079 () Bool)

(assert (=> b!1444554 m!1333079))

(declare-fun m!1333081 () Bool)

(assert (=> b!1444554 m!1333081))

(declare-fun m!1333083 () Bool)

(assert (=> b!1444554 m!1333083))

(assert (=> b!1444554 m!1333071))

(assert (=> b!1444552 m!1333071))

(assert (=> b!1444552 m!1333071))

(declare-fun m!1333085 () Bool)

(assert (=> b!1444552 m!1333085))

(assert (=> b!1444563 m!1333071))

(assert (=> b!1444563 m!1333071))

(declare-fun m!1333087 () Bool)

(assert (=> b!1444563 m!1333087))

(assert (=> b!1444563 m!1333087))

(assert (=> b!1444563 m!1333071))

(declare-fun m!1333089 () Bool)

(assert (=> b!1444563 m!1333089))

(declare-fun m!1333091 () Bool)

(assert (=> start!124648 m!1333091))

(declare-fun m!1333093 () Bool)

(assert (=> start!124648 m!1333093))

(declare-fun m!1333095 () Bool)

(assert (=> b!1444561 m!1333095))

(declare-fun m!1333097 () Bool)

(assert (=> b!1444551 m!1333097))

(assert (=> b!1444551 m!1333097))

(declare-fun m!1333099 () Bool)

(assert (=> b!1444551 m!1333099))

(declare-fun m!1333101 () Bool)

(assert (=> b!1444560 m!1333101))

(assert (=> b!1444562 m!1333077))

(declare-fun m!1333103 () Bool)

(assert (=> b!1444562 m!1333103))

(declare-fun m!1333105 () Bool)

(assert (=> b!1444550 m!1333105))

(assert (=> b!1444559 m!1333071))

(assert (=> b!1444559 m!1333071))

(declare-fun m!1333107 () Bool)

(assert (=> b!1444559 m!1333107))

(declare-fun m!1333109 () Bool)

(assert (=> b!1444555 m!1333109))

(assert (=> b!1444555 m!1333071))

(declare-fun m!1333111 () Bool)

(assert (=> b!1444566 m!1333111))

(assert (=> b!1444566 m!1333111))

(declare-fun m!1333113 () Bool)

(assert (=> b!1444566 m!1333113))

(assert (=> b!1444566 m!1333077))

(declare-fun m!1333115 () Bool)

(assert (=> b!1444566 m!1333115))

(declare-fun m!1333117 () Bool)

(assert (=> b!1444557 m!1333117))

(declare-fun m!1333119 () Bool)

(assert (=> b!1444557 m!1333119))

(check-sat (not b!1444560) (not b!1444552) (not b!1444566) (not b!1444558) (not b!1444550) (not start!124648) (not b!1444559) (not b!1444563) (not b!1444561) (not b!1444557) (not b!1444551) (not b!1444554))
(check-sat)
