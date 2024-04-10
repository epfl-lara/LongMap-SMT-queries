; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125278 () Bool)

(assert start!125278)

(declare-fun res!992044 () Bool)

(declare-fun e!822164 () Bool)

(assert (=> start!125278 (=> (not res!992044) (not e!822164))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125278 (= res!992044 (validMask!0 mask!2687))))

(assert (=> start!125278 e!822164))

(assert (=> start!125278 true))

(declare-datatypes ((array!98726 0))(
  ( (array!98727 (arr!47651 (Array (_ BitVec 32) (_ BitVec 64))) (size!48201 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98726)

(declare-fun array_inv!36679 (array!98726) Bool)

(assert (=> start!125278 (array_inv!36679 a!2862)))

(declare-fun b!1462647 () Bool)

(declare-fun e!822161 () Bool)

(declare-fun e!822167 () Bool)

(assert (=> b!1462647 (= e!822161 e!822167)))

(declare-fun res!992046 () Bool)

(assert (=> b!1462647 (=> (not res!992046) (not e!822167))))

(declare-datatypes ((SeekEntryResult!11903 0))(
  ( (MissingZero!11903 (index!50004 (_ BitVec 32))) (Found!11903 (index!50005 (_ BitVec 32))) (Intermediate!11903 (undefined!12715 Bool) (index!50006 (_ BitVec 32)) (x!131600 (_ BitVec 32))) (Undefined!11903) (MissingVacant!11903 (index!50007 (_ BitVec 32))) )
))
(declare-fun lt!640517 () SeekEntryResult!11903)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1462647 (= res!992046 (= lt!640517 (Intermediate!11903 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!640515 () (_ BitVec 64))

(declare-fun lt!640520 () array!98726)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98726 (_ BitVec 32)) SeekEntryResult!11903)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1462647 (= lt!640517 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!640515 mask!2687) lt!640515 lt!640520 mask!2687))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1462647 (= lt!640515 (select (store (arr!47651 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1462648 () Bool)

(declare-fun res!992047 () Bool)

(assert (=> b!1462648 (=> (not res!992047) (not e!822164))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1462648 (= res!992047 (validKeyInArray!0 (select (arr!47651 a!2862) i!1006)))))

(declare-fun b!1462649 () Bool)

(declare-fun e!822170 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1462649 (= e!822170 (= lt!640517 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!640515 lt!640520 mask!2687)))))

(declare-fun b!1462650 () Bool)

(declare-fun e!822163 () Bool)

(assert (=> b!1462650 (= e!822163 true)))

(declare-fun lt!640516 () Bool)

(declare-fun e!822162 () Bool)

(assert (=> b!1462650 (= lt!640516 e!822162)))

(declare-fun c!134813 () Bool)

(assert (=> b!1462650 (= c!134813 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1462651 () Bool)

(declare-fun res!992057 () Bool)

(assert (=> b!1462651 (=> (not res!992057) (not e!822167))))

(assert (=> b!1462651 (= res!992057 e!822170)))

(declare-fun c!134814 () Bool)

(assert (=> b!1462651 (= c!134814 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1462652 () Bool)

(declare-fun res!992049 () Bool)

(assert (=> b!1462652 (=> (not res!992049) (not e!822164))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1462652 (= res!992049 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48201 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48201 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48201 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1462653 () Bool)

(declare-fun res!992048 () Bool)

(assert (=> b!1462653 (=> (not res!992048) (not e!822164))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98726 (_ BitVec 32)) Bool)

(assert (=> b!1462653 (= res!992048 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun e!822165 () Bool)

(declare-fun b!1462654 () Bool)

(assert (=> b!1462654 (= e!822165 (or (= (select (arr!47651 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47651 a!2862) intermediateBeforeIndex!19) (select (arr!47651 a!2862) j!93))))))

(declare-fun b!1462655 () Bool)

(declare-fun res!992056 () Bool)

(assert (=> b!1462655 (=> (not res!992056) (not e!822164))))

(assert (=> b!1462655 (= res!992056 (validKeyInArray!0 (select (arr!47651 a!2862) j!93)))))

(declare-fun b!1462656 () Bool)

(declare-fun lt!640519 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98726 (_ BitVec 32)) SeekEntryResult!11903)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98726 (_ BitVec 32)) SeekEntryResult!11903)

(assert (=> b!1462656 (= e!822162 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640519 intermediateAfterIndex!19 lt!640515 lt!640520 mask!2687) (seekEntryOrOpen!0 lt!640515 lt!640520 mask!2687))))))

(declare-fun b!1462657 () Bool)

(declare-fun res!992051 () Bool)

(assert (=> b!1462657 (=> (not res!992051) (not e!822164))))

(declare-datatypes ((List!34152 0))(
  ( (Nil!34149) (Cons!34148 (h!35498 (_ BitVec 64)) (t!48846 List!34152)) )
))
(declare-fun arrayNoDuplicates!0 (array!98726 (_ BitVec 32) List!34152) Bool)

(assert (=> b!1462657 (= res!992051 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34149))))

(declare-fun b!1462658 () Bool)

(declare-fun res!992045 () Bool)

(assert (=> b!1462658 (=> (not res!992045) (not e!822165))))

(assert (=> b!1462658 (= res!992045 (= (seekEntryOrOpen!0 (select (arr!47651 a!2862) j!93) a!2862 mask!2687) (Found!11903 j!93)))))

(declare-fun b!1462659 () Bool)

(assert (=> b!1462659 (= e!822170 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!640515 lt!640520 mask!2687) (seekEntryOrOpen!0 lt!640515 lt!640520 mask!2687)))))

(declare-fun b!1462660 () Bool)

(assert (=> b!1462660 (= e!822162 (not (= lt!640517 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640519 lt!640515 lt!640520 mask!2687))))))

(declare-fun b!1462661 () Bool)

(declare-fun res!992052 () Bool)

(assert (=> b!1462661 (=> (not res!992052) (not e!822164))))

(assert (=> b!1462661 (= res!992052 (and (= (size!48201 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48201 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48201 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1462662 () Bool)

(declare-fun res!992059 () Bool)

(assert (=> b!1462662 (=> (not res!992059) (not e!822161))))

(declare-fun lt!640521 () SeekEntryResult!11903)

(assert (=> b!1462662 (= res!992059 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47651 a!2862) j!93) a!2862 mask!2687) lt!640521))))

(declare-fun b!1462663 () Bool)

(declare-fun e!822169 () Bool)

(assert (=> b!1462663 (= e!822164 e!822169)))

(declare-fun res!992058 () Bool)

(assert (=> b!1462663 (=> (not res!992058) (not e!822169))))

(assert (=> b!1462663 (= res!992058 (= (select (store (arr!47651 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1462663 (= lt!640520 (array!98727 (store (arr!47651 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48201 a!2862)))))

(declare-fun b!1462664 () Bool)

(declare-fun e!822166 () Bool)

(assert (=> b!1462664 (= e!822166 e!822163)))

(declare-fun res!992042 () Bool)

(assert (=> b!1462664 (=> res!992042 e!822163)))

(assert (=> b!1462664 (= res!992042 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!640519 #b00000000000000000000000000000000) (bvsge lt!640519 (size!48201 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1462664 (= lt!640519 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1462665 () Bool)

(declare-fun res!992054 () Bool)

(assert (=> b!1462665 (=> (not res!992054) (not e!822167))))

(assert (=> b!1462665 (= res!992054 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1462666 () Bool)

(assert (=> b!1462666 (= e!822169 e!822161)))

(declare-fun res!992053 () Bool)

(assert (=> b!1462666 (=> (not res!992053) (not e!822161))))

(assert (=> b!1462666 (= res!992053 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47651 a!2862) j!93) mask!2687) (select (arr!47651 a!2862) j!93) a!2862 mask!2687) lt!640521))))

(assert (=> b!1462666 (= lt!640521 (Intermediate!11903 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1462667 () Bool)

(declare-fun res!992050 () Bool)

(assert (=> b!1462667 (=> res!992050 e!822163)))

(assert (=> b!1462667 (= res!992050 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640519 (select (arr!47651 a!2862) j!93) a!2862 mask!2687) lt!640521)))))

(declare-fun b!1462668 () Bool)

(assert (=> b!1462668 (= e!822167 (not e!822166))))

(declare-fun res!992055 () Bool)

(assert (=> b!1462668 (=> res!992055 e!822166)))

(assert (=> b!1462668 (= res!992055 (or (and (= (select (arr!47651 a!2862) index!646) (select (store (arr!47651 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47651 a!2862) index!646) (select (arr!47651 a!2862) j!93))) (= (select (arr!47651 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1462668 e!822165))

(declare-fun res!992043 () Bool)

(assert (=> b!1462668 (=> (not res!992043) (not e!822165))))

(assert (=> b!1462668 (= res!992043 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49302 0))(
  ( (Unit!49303) )
))
(declare-fun lt!640518 () Unit!49302)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98726 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49302)

(assert (=> b!1462668 (= lt!640518 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(assert (= (and start!125278 res!992044) b!1462661))

(assert (= (and b!1462661 res!992052) b!1462648))

(assert (= (and b!1462648 res!992047) b!1462655))

(assert (= (and b!1462655 res!992056) b!1462653))

(assert (= (and b!1462653 res!992048) b!1462657))

(assert (= (and b!1462657 res!992051) b!1462652))

(assert (= (and b!1462652 res!992049) b!1462663))

(assert (= (and b!1462663 res!992058) b!1462666))

(assert (= (and b!1462666 res!992053) b!1462662))

(assert (= (and b!1462662 res!992059) b!1462647))

(assert (= (and b!1462647 res!992046) b!1462651))

(assert (= (and b!1462651 c!134814) b!1462649))

(assert (= (and b!1462651 (not c!134814)) b!1462659))

(assert (= (and b!1462651 res!992057) b!1462665))

(assert (= (and b!1462665 res!992054) b!1462668))

(assert (= (and b!1462668 res!992043) b!1462658))

(assert (= (and b!1462658 res!992045) b!1462654))

(assert (= (and b!1462668 (not res!992055)) b!1462664))

(assert (= (and b!1462664 (not res!992042)) b!1462667))

(assert (= (and b!1462667 (not res!992050)) b!1462650))

(assert (= (and b!1462650 c!134813) b!1462660))

(assert (= (and b!1462650 (not c!134813)) b!1462656))

(declare-fun m!1350079 () Bool)

(assert (=> b!1462664 m!1350079))

(declare-fun m!1350081 () Bool)

(assert (=> b!1462655 m!1350081))

(assert (=> b!1462655 m!1350081))

(declare-fun m!1350083 () Bool)

(assert (=> b!1462655 m!1350083))

(assert (=> b!1462667 m!1350081))

(assert (=> b!1462667 m!1350081))

(declare-fun m!1350085 () Bool)

(assert (=> b!1462667 m!1350085))

(declare-fun m!1350087 () Bool)

(assert (=> b!1462663 m!1350087))

(declare-fun m!1350089 () Bool)

(assert (=> b!1462663 m!1350089))

(declare-fun m!1350091 () Bool)

(assert (=> b!1462656 m!1350091))

(declare-fun m!1350093 () Bool)

(assert (=> b!1462656 m!1350093))

(declare-fun m!1350095 () Bool)

(assert (=> start!125278 m!1350095))

(declare-fun m!1350097 () Bool)

(assert (=> start!125278 m!1350097))

(declare-fun m!1350099 () Bool)

(assert (=> b!1462648 m!1350099))

(assert (=> b!1462648 m!1350099))

(declare-fun m!1350101 () Bool)

(assert (=> b!1462648 m!1350101))

(declare-fun m!1350103 () Bool)

(assert (=> b!1462668 m!1350103))

(assert (=> b!1462668 m!1350087))

(declare-fun m!1350105 () Bool)

(assert (=> b!1462668 m!1350105))

(declare-fun m!1350107 () Bool)

(assert (=> b!1462668 m!1350107))

(declare-fun m!1350109 () Bool)

(assert (=> b!1462668 m!1350109))

(assert (=> b!1462668 m!1350081))

(assert (=> b!1462658 m!1350081))

(assert (=> b!1462658 m!1350081))

(declare-fun m!1350111 () Bool)

(assert (=> b!1462658 m!1350111))

(declare-fun m!1350113 () Bool)

(assert (=> b!1462649 m!1350113))

(declare-fun m!1350115 () Bool)

(assert (=> b!1462653 m!1350115))

(declare-fun m!1350117 () Bool)

(assert (=> b!1462654 m!1350117))

(assert (=> b!1462654 m!1350081))

(declare-fun m!1350119 () Bool)

(assert (=> b!1462659 m!1350119))

(assert (=> b!1462659 m!1350093))

(declare-fun m!1350121 () Bool)

(assert (=> b!1462657 m!1350121))

(assert (=> b!1462666 m!1350081))

(assert (=> b!1462666 m!1350081))

(declare-fun m!1350123 () Bool)

(assert (=> b!1462666 m!1350123))

(assert (=> b!1462666 m!1350123))

(assert (=> b!1462666 m!1350081))

(declare-fun m!1350125 () Bool)

(assert (=> b!1462666 m!1350125))

(declare-fun m!1350127 () Bool)

(assert (=> b!1462660 m!1350127))

(assert (=> b!1462662 m!1350081))

(assert (=> b!1462662 m!1350081))

(declare-fun m!1350129 () Bool)

(assert (=> b!1462662 m!1350129))

(declare-fun m!1350131 () Bool)

(assert (=> b!1462647 m!1350131))

(assert (=> b!1462647 m!1350131))

(declare-fun m!1350133 () Bool)

(assert (=> b!1462647 m!1350133))

(assert (=> b!1462647 m!1350087))

(declare-fun m!1350135 () Bool)

(assert (=> b!1462647 m!1350135))

(push 1)

