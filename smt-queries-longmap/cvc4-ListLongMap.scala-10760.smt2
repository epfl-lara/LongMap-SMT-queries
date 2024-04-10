; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125882 () Bool)

(assert start!125882)

(declare-fun b!1473511 () Bool)

(declare-fun res!1000830 () Bool)

(declare-fun e!826872 () Bool)

(assert (=> b!1473511 (=> (not res!1000830) (not e!826872))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!99159 0))(
  ( (array!99160 (arr!47863 (Array (_ BitVec 32) (_ BitVec 64))) (size!48413 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99159)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1473511 (= res!1000830 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48413 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48413 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48413 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1473512 () Bool)

(declare-fun e!826873 () Bool)

(declare-fun e!826869 () Bool)

(assert (=> b!1473512 (= e!826873 e!826869)))

(declare-fun res!1000821 () Bool)

(assert (=> b!1473512 (=> (not res!1000821) (not e!826869))))

(declare-datatypes ((SeekEntryResult!12103 0))(
  ( (MissingZero!12103 (index!50804 (_ BitVec 32))) (Found!12103 (index!50805 (_ BitVec 32))) (Intermediate!12103 (undefined!12915 Bool) (index!50806 (_ BitVec 32)) (x!132387 (_ BitVec 32))) (Undefined!12103) (MissingVacant!12103 (index!50807 (_ BitVec 32))) )
))
(declare-fun lt!643951 () SeekEntryResult!12103)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99159 (_ BitVec 32)) SeekEntryResult!12103)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1473512 (= res!1000821 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47863 a!2862) j!93) mask!2687) (select (arr!47863 a!2862) j!93) a!2862 mask!2687) lt!643951))))

(assert (=> b!1473512 (= lt!643951 (Intermediate!12103 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1473513 () Bool)

(declare-fun e!826868 () Bool)

(declare-fun e!826867 () Bool)

(assert (=> b!1473513 (= e!826868 (not e!826867))))

(declare-fun res!1000828 () Bool)

(assert (=> b!1473513 (=> res!1000828 e!826867)))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1473513 (= res!1000828 (or (not (= (select (arr!47863 a!2862) index!646) (select (store (arr!47863 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (not (= (select (arr!47863 a!2862) index!646) (select (arr!47863 a!2862) j!93)))))))

(declare-fun e!826874 () Bool)

(assert (=> b!1473513 e!826874))

(declare-fun res!1000820 () Bool)

(assert (=> b!1473513 (=> (not res!1000820) (not e!826874))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99159 (_ BitVec 32)) Bool)

(assert (=> b!1473513 (= res!1000820 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49546 0))(
  ( (Unit!49547) )
))
(declare-fun lt!643956 () Unit!49546)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99159 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49546)

(assert (=> b!1473513 (= lt!643956 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun res!1000822 () Bool)

(assert (=> start!125882 (=> (not res!1000822) (not e!826872))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125882 (= res!1000822 (validMask!0 mask!2687))))

(assert (=> start!125882 e!826872))

(assert (=> start!125882 true))

(declare-fun array_inv!36891 (array!99159) Bool)

(assert (=> start!125882 (array_inv!36891 a!2862)))

(declare-fun b!1473514 () Bool)

(declare-fun res!1000825 () Bool)

(assert (=> b!1473514 (=> (not res!1000825) (not e!826868))))

(declare-fun e!826870 () Bool)

(assert (=> b!1473514 (= res!1000825 e!826870)))

(declare-fun c!135861 () Bool)

(assert (=> b!1473514 (= c!135861 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1473515 () Bool)

(declare-fun res!1000832 () Bool)

(assert (=> b!1473515 (=> (not res!1000832) (not e!826872))))

(declare-datatypes ((List!34364 0))(
  ( (Nil!34361) (Cons!34360 (h!35719 (_ BitVec 64)) (t!49058 List!34364)) )
))
(declare-fun arrayNoDuplicates!0 (array!99159 (_ BitVec 32) List!34364) Bool)

(assert (=> b!1473515 (= res!1000832 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34361))))

(declare-fun b!1473516 () Bool)

(declare-fun lt!643952 () (_ BitVec 64))

(declare-fun lt!643954 () array!99159)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99159 (_ BitVec 32)) SeekEntryResult!12103)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99159 (_ BitVec 32)) SeekEntryResult!12103)

(assert (=> b!1473516 (= e!826870 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!643952 lt!643954 mask!2687) (seekEntryOrOpen!0 lt!643952 lt!643954 mask!2687)))))

(declare-fun b!1473517 () Bool)

(declare-fun res!1000833 () Bool)

(assert (=> b!1473517 (=> (not res!1000833) (not e!826874))))

(assert (=> b!1473517 (= res!1000833 (= (seekEntryOrOpen!0 (select (arr!47863 a!2862) j!93) a!2862 mask!2687) (Found!12103 j!93)))))

(declare-fun b!1473518 () Bool)

(assert (=> b!1473518 (= e!826872 e!826873)))

(declare-fun res!1000823 () Bool)

(assert (=> b!1473518 (=> (not res!1000823) (not e!826873))))

(assert (=> b!1473518 (= res!1000823 (= (select (store (arr!47863 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1473518 (= lt!643954 (array!99160 (store (arr!47863 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48413 a!2862)))))

(declare-fun b!1473519 () Bool)

(assert (=> b!1473519 (= e!826867 true)))

(declare-fun lt!643955 () SeekEntryResult!12103)

(assert (=> b!1473519 (= lt!643955 (seekEntryOrOpen!0 lt!643952 lt!643954 mask!2687))))

(declare-fun b!1473520 () Bool)

(declare-fun res!1000834 () Bool)

(assert (=> b!1473520 (=> (not res!1000834) (not e!826872))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1473520 (= res!1000834 (validKeyInArray!0 (select (arr!47863 a!2862) j!93)))))

(declare-fun b!1473521 () Bool)

(declare-fun res!1000826 () Bool)

(assert (=> b!1473521 (=> (not res!1000826) (not e!826869))))

(assert (=> b!1473521 (= res!1000826 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47863 a!2862) j!93) a!2862 mask!2687) lt!643951))))

(declare-fun b!1473522 () Bool)

(declare-fun res!1000824 () Bool)

(assert (=> b!1473522 (=> (not res!1000824) (not e!826872))))

(assert (=> b!1473522 (= res!1000824 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1473523 () Bool)

(declare-fun lt!643953 () SeekEntryResult!12103)

(assert (=> b!1473523 (= e!826870 (= lt!643953 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!643952 lt!643954 mask!2687)))))

(declare-fun b!1473524 () Bool)

(declare-fun res!1000827 () Bool)

(assert (=> b!1473524 (=> (not res!1000827) (not e!826872))))

(assert (=> b!1473524 (= res!1000827 (validKeyInArray!0 (select (arr!47863 a!2862) i!1006)))))

(declare-fun b!1473525 () Bool)

(assert (=> b!1473525 (= e!826874 (or (= (select (arr!47863 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47863 a!2862) intermediateBeforeIndex!19) (select (arr!47863 a!2862) j!93))))))

(declare-fun b!1473526 () Bool)

(declare-fun res!1000819 () Bool)

(assert (=> b!1473526 (=> (not res!1000819) (not e!826872))))

(assert (=> b!1473526 (= res!1000819 (and (= (size!48413 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48413 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48413 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1473527 () Bool)

(assert (=> b!1473527 (= e!826869 e!826868)))

(declare-fun res!1000829 () Bool)

(assert (=> b!1473527 (=> (not res!1000829) (not e!826868))))

(assert (=> b!1473527 (= res!1000829 (= lt!643953 (Intermediate!12103 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1473527 (= lt!643953 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!643952 mask!2687) lt!643952 lt!643954 mask!2687))))

(assert (=> b!1473527 (= lt!643952 (select (store (arr!47863 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1473528 () Bool)

(declare-fun res!1000831 () Bool)

(assert (=> b!1473528 (=> (not res!1000831) (not e!826868))))

(assert (=> b!1473528 (= res!1000831 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(assert (= (and start!125882 res!1000822) b!1473526))

(assert (= (and b!1473526 res!1000819) b!1473524))

(assert (= (and b!1473524 res!1000827) b!1473520))

(assert (= (and b!1473520 res!1000834) b!1473522))

(assert (= (and b!1473522 res!1000824) b!1473515))

(assert (= (and b!1473515 res!1000832) b!1473511))

(assert (= (and b!1473511 res!1000830) b!1473518))

(assert (= (and b!1473518 res!1000823) b!1473512))

(assert (= (and b!1473512 res!1000821) b!1473521))

(assert (= (and b!1473521 res!1000826) b!1473527))

(assert (= (and b!1473527 res!1000829) b!1473514))

(assert (= (and b!1473514 c!135861) b!1473523))

(assert (= (and b!1473514 (not c!135861)) b!1473516))

(assert (= (and b!1473514 res!1000825) b!1473528))

(assert (= (and b!1473528 res!1000831) b!1473513))

(assert (= (and b!1473513 res!1000820) b!1473517))

(assert (= (and b!1473517 res!1000833) b!1473525))

(assert (= (and b!1473513 (not res!1000828)) b!1473519))

(declare-fun m!1360031 () Bool)

(assert (=> b!1473520 m!1360031))

(assert (=> b!1473520 m!1360031))

(declare-fun m!1360033 () Bool)

(assert (=> b!1473520 m!1360033))

(declare-fun m!1360035 () Bool)

(assert (=> b!1473527 m!1360035))

(assert (=> b!1473527 m!1360035))

(declare-fun m!1360037 () Bool)

(assert (=> b!1473527 m!1360037))

(declare-fun m!1360039 () Bool)

(assert (=> b!1473527 m!1360039))

(declare-fun m!1360041 () Bool)

(assert (=> b!1473527 m!1360041))

(declare-fun m!1360043 () Bool)

(assert (=> b!1473513 m!1360043))

(assert (=> b!1473513 m!1360039))

(declare-fun m!1360045 () Bool)

(assert (=> b!1473513 m!1360045))

(declare-fun m!1360047 () Bool)

(assert (=> b!1473513 m!1360047))

(declare-fun m!1360049 () Bool)

(assert (=> b!1473513 m!1360049))

(assert (=> b!1473513 m!1360031))

(declare-fun m!1360051 () Bool)

(assert (=> b!1473523 m!1360051))

(assert (=> b!1473517 m!1360031))

(assert (=> b!1473517 m!1360031))

(declare-fun m!1360053 () Bool)

(assert (=> b!1473517 m!1360053))

(declare-fun m!1360055 () Bool)

(assert (=> b!1473522 m!1360055))

(declare-fun m!1360057 () Bool)

(assert (=> start!125882 m!1360057))

(declare-fun m!1360059 () Bool)

(assert (=> start!125882 m!1360059))

(declare-fun m!1360061 () Bool)

(assert (=> b!1473515 m!1360061))

(assert (=> b!1473521 m!1360031))

(assert (=> b!1473521 m!1360031))

(declare-fun m!1360063 () Bool)

(assert (=> b!1473521 m!1360063))

(declare-fun m!1360065 () Bool)

(assert (=> b!1473519 m!1360065))

(declare-fun m!1360067 () Bool)

(assert (=> b!1473525 m!1360067))

(assert (=> b!1473525 m!1360031))

(assert (=> b!1473518 m!1360039))

(declare-fun m!1360069 () Bool)

(assert (=> b!1473518 m!1360069))

(declare-fun m!1360071 () Bool)

(assert (=> b!1473516 m!1360071))

(assert (=> b!1473516 m!1360065))

(assert (=> b!1473512 m!1360031))

(assert (=> b!1473512 m!1360031))

(declare-fun m!1360073 () Bool)

(assert (=> b!1473512 m!1360073))

(assert (=> b!1473512 m!1360073))

(assert (=> b!1473512 m!1360031))

(declare-fun m!1360075 () Bool)

(assert (=> b!1473512 m!1360075))

(declare-fun m!1360077 () Bool)

(assert (=> b!1473524 m!1360077))

(assert (=> b!1473524 m!1360077))

(declare-fun m!1360079 () Bool)

(assert (=> b!1473524 m!1360079))

(push 1)

