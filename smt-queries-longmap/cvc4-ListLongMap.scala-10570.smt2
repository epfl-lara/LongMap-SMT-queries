; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124562 () Bool)

(assert start!124562)

(declare-fun b!1441762 () Bool)

(declare-fun res!974073 () Bool)

(declare-fun e!812707 () Bool)

(assert (=> b!1441762 (=> (not res!974073) (not e!812707))))

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11545 0))(
  ( (MissingZero!11545 (index!48572 (_ BitVec 32))) (Found!11545 (index!48573 (_ BitVec 32))) (Intermediate!11545 (undefined!12357 Bool) (index!48574 (_ BitVec 32)) (x!130282 (_ BitVec 32))) (Undefined!11545) (MissingVacant!11545 (index!48575 (_ BitVec 32))) )
))
(declare-fun lt!633351 () SeekEntryResult!11545)

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!98010 0))(
  ( (array!98011 (arr!47293 (Array (_ BitVec 32) (_ BitVec 64))) (size!47843 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98010)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98010 (_ BitVec 32)) SeekEntryResult!11545)

(assert (=> b!1441762 (= res!974073 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47293 a!2862) j!93) a!2862 mask!2687) lt!633351))))

(declare-fun b!1441763 () Bool)

(declare-fun res!974074 () Bool)

(declare-fun e!812703 () Bool)

(assert (=> b!1441763 (=> (not res!974074) (not e!812703))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1441763 (= res!974074 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1441764 () Bool)

(declare-fun res!974072 () Bool)

(declare-fun e!812704 () Bool)

(assert (=> b!1441764 (=> (not res!974072) (not e!812704))))

(declare-datatypes ((List!33794 0))(
  ( (Nil!33791) (Cons!33790 (h!35140 (_ BitVec 64)) (t!48488 List!33794)) )
))
(declare-fun arrayNoDuplicates!0 (array!98010 (_ BitVec 32) List!33794) Bool)

(assert (=> b!1441764 (= res!974072 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33791))))

(declare-fun b!1441765 () Bool)

(declare-fun lt!633353 () array!98010)

(declare-fun lt!633354 () SeekEntryResult!11545)

(declare-fun e!812708 () Bool)

(declare-fun lt!633352 () (_ BitVec 64))

(assert (=> b!1441765 (= e!812708 (= lt!633354 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!633352 lt!633353 mask!2687)))))

(declare-fun b!1441766 () Bool)

(assert (=> b!1441766 (= e!812703 (not (bvsge mask!2687 #b00000000000000000000000000000000)))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98010 (_ BitVec 32)) Bool)

(assert (=> b!1441766 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!48586 0))(
  ( (Unit!48587) )
))
(declare-fun lt!633350 () Unit!48586)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98010 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48586)

(assert (=> b!1441766 (= lt!633350 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun res!974070 () Bool)

(assert (=> start!124562 (=> (not res!974070) (not e!812704))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124562 (= res!974070 (validMask!0 mask!2687))))

(assert (=> start!124562 e!812704))

(assert (=> start!124562 true))

(declare-fun array_inv!36321 (array!98010) Bool)

(assert (=> start!124562 (array_inv!36321 a!2862)))

(declare-fun b!1441767 () Bool)

(declare-fun res!974076 () Bool)

(assert (=> b!1441767 (=> (not res!974076) (not e!812703))))

(assert (=> b!1441767 (= res!974076 e!812708)))

(declare-fun c!133359 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1441767 (= c!133359 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1441768 () Bool)

(declare-fun res!974067 () Bool)

(assert (=> b!1441768 (=> (not res!974067) (not e!812704))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1441768 (= res!974067 (validKeyInArray!0 (select (arr!47293 a!2862) j!93)))))

(declare-fun b!1441769 () Bool)

(declare-fun e!812705 () Bool)

(assert (=> b!1441769 (= e!812704 e!812705)))

(declare-fun res!974069 () Bool)

(assert (=> b!1441769 (=> (not res!974069) (not e!812705))))

(assert (=> b!1441769 (= res!974069 (= (select (store (arr!47293 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1441769 (= lt!633353 (array!98011 (store (arr!47293 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47843 a!2862)))))

(declare-fun b!1441770 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98010 (_ BitVec 32)) SeekEntryResult!11545)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98010 (_ BitVec 32)) SeekEntryResult!11545)

(assert (=> b!1441770 (= e!812708 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!633352 lt!633353 mask!2687) (seekEntryOrOpen!0 lt!633352 lt!633353 mask!2687)))))

(declare-fun b!1441771 () Bool)

(assert (=> b!1441771 (= e!812707 e!812703)))

(declare-fun res!974065 () Bool)

(assert (=> b!1441771 (=> (not res!974065) (not e!812703))))

(assert (=> b!1441771 (= res!974065 (= lt!633354 (Intermediate!11545 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1441771 (= lt!633354 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!633352 mask!2687) lt!633352 lt!633353 mask!2687))))

(assert (=> b!1441771 (= lt!633352 (select (store (arr!47293 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1441772 () Bool)

(declare-fun res!974075 () Bool)

(assert (=> b!1441772 (=> (not res!974075) (not e!812704))))

(assert (=> b!1441772 (= res!974075 (validKeyInArray!0 (select (arr!47293 a!2862) i!1006)))))

(declare-fun b!1441773 () Bool)

(declare-fun res!974066 () Bool)

(assert (=> b!1441773 (=> (not res!974066) (not e!812704))))

(assert (=> b!1441773 (= res!974066 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1441774 () Bool)

(declare-fun res!974068 () Bool)

(assert (=> b!1441774 (=> (not res!974068) (not e!812704))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1441774 (= res!974068 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47843 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47843 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47843 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1441775 () Bool)

(declare-fun res!974071 () Bool)

(assert (=> b!1441775 (=> (not res!974071) (not e!812704))))

(assert (=> b!1441775 (= res!974071 (and (= (size!47843 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47843 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47843 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1441776 () Bool)

(assert (=> b!1441776 (= e!812705 e!812707)))

(declare-fun res!974077 () Bool)

(assert (=> b!1441776 (=> (not res!974077) (not e!812707))))

(assert (=> b!1441776 (= res!974077 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47293 a!2862) j!93) mask!2687) (select (arr!47293 a!2862) j!93) a!2862 mask!2687) lt!633351))))

(assert (=> b!1441776 (= lt!633351 (Intermediate!11545 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(assert (= (and start!124562 res!974070) b!1441775))

(assert (= (and b!1441775 res!974071) b!1441772))

(assert (= (and b!1441772 res!974075) b!1441768))

(assert (= (and b!1441768 res!974067) b!1441773))

(assert (= (and b!1441773 res!974066) b!1441764))

(assert (= (and b!1441764 res!974072) b!1441774))

(assert (= (and b!1441774 res!974068) b!1441769))

(assert (= (and b!1441769 res!974069) b!1441776))

(assert (= (and b!1441776 res!974077) b!1441762))

(assert (= (and b!1441762 res!974073) b!1441771))

(assert (= (and b!1441771 res!974065) b!1441767))

(assert (= (and b!1441767 c!133359) b!1441765))

(assert (= (and b!1441767 (not c!133359)) b!1441770))

(assert (= (and b!1441767 res!974076) b!1441763))

(assert (= (and b!1441763 res!974074) b!1441766))

(declare-fun m!1330963 () Bool)

(assert (=> b!1441764 m!1330963))

(declare-fun m!1330965 () Bool)

(assert (=> b!1441770 m!1330965))

(declare-fun m!1330967 () Bool)

(assert (=> b!1441770 m!1330967))

(declare-fun m!1330969 () Bool)

(assert (=> b!1441762 m!1330969))

(assert (=> b!1441762 m!1330969))

(declare-fun m!1330971 () Bool)

(assert (=> b!1441762 m!1330971))

(assert (=> b!1441768 m!1330969))

(assert (=> b!1441768 m!1330969))

(declare-fun m!1330973 () Bool)

(assert (=> b!1441768 m!1330973))

(declare-fun m!1330975 () Bool)

(assert (=> b!1441772 m!1330975))

(assert (=> b!1441772 m!1330975))

(declare-fun m!1330977 () Bool)

(assert (=> b!1441772 m!1330977))

(assert (=> b!1441776 m!1330969))

(assert (=> b!1441776 m!1330969))

(declare-fun m!1330979 () Bool)

(assert (=> b!1441776 m!1330979))

(assert (=> b!1441776 m!1330979))

(assert (=> b!1441776 m!1330969))

(declare-fun m!1330981 () Bool)

(assert (=> b!1441776 m!1330981))

(declare-fun m!1330983 () Bool)

(assert (=> b!1441765 m!1330983))

(declare-fun m!1330985 () Bool)

(assert (=> b!1441766 m!1330985))

(declare-fun m!1330987 () Bool)

(assert (=> b!1441766 m!1330987))

(declare-fun m!1330989 () Bool)

(assert (=> b!1441769 m!1330989))

(declare-fun m!1330991 () Bool)

(assert (=> b!1441769 m!1330991))

(declare-fun m!1330993 () Bool)

(assert (=> b!1441773 m!1330993))

(declare-fun m!1330995 () Bool)

(assert (=> b!1441771 m!1330995))

(assert (=> b!1441771 m!1330995))

(declare-fun m!1330997 () Bool)

(assert (=> b!1441771 m!1330997))

(assert (=> b!1441771 m!1330989))

(declare-fun m!1330999 () Bool)

(assert (=> b!1441771 m!1330999))

(declare-fun m!1331001 () Bool)

(assert (=> start!124562 m!1331001))

(declare-fun m!1331003 () Bool)

(assert (=> start!124562 m!1331003))

(push 1)

(assert (not b!1441773))

(assert (not b!1441766))

(assert (not b!1441776))

(assert (not start!124562))

(assert (not b!1441771))

(assert (not b!1441764))

(assert (not b!1441762))

