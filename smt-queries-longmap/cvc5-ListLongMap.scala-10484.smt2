; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!123282 () Bool)

(assert start!123282)

(declare-fun b!1429761 () Bool)

(declare-fun res!964394 () Bool)

(declare-fun e!807264 () Bool)

(assert (=> b!1429761 (=> (not res!964394) (not e!807264))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-datatypes ((array!97443 0))(
  ( (array!97444 (arr!47033 (Array (_ BitVec 32) (_ BitVec 64))) (size!47583 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97443)

(declare-fun index!585 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(assert (=> b!1429761 (= res!964394 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47583 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47583 a!2831))))))

(declare-fun b!1429762 () Bool)

(declare-fun res!964391 () Bool)

(assert (=> b!1429762 (=> (not res!964391) (not e!807264))))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97443 (_ BitVec 32)) Bool)

(assert (=> b!1429762 (= res!964391 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1429763 () Bool)

(declare-fun res!964396 () Bool)

(assert (=> b!1429763 (=> (not res!964396) (not e!807264))))

(declare-fun i!982 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1429763 (= res!964396 (validKeyInArray!0 (select (arr!47033 a!2831) i!982)))))

(declare-fun b!1429764 () Bool)

(declare-fun res!964399 () Bool)

(declare-fun e!807262 () Bool)

(assert (=> b!1429764 (=> (not res!964399) (not e!807262))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1429764 (= res!964399 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1429765 () Bool)

(declare-fun res!964398 () Bool)

(assert (=> b!1429765 (=> (not res!964398) (not e!807264))))

(declare-datatypes ((List!33543 0))(
  ( (Nil!33540) (Cons!33539 (h!34853 (_ BitVec 64)) (t!48237 List!33543)) )
))
(declare-fun arrayNoDuplicates!0 (array!97443 (_ BitVec 32) List!33543) Bool)

(assert (=> b!1429765 (= res!964398 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33540))))

(declare-fun e!807265 () Bool)

(declare-fun j!81 () (_ BitVec 32))

(declare-fun b!1429766 () Bool)

(declare-datatypes ((SeekEntryResult!11312 0))(
  ( (MissingZero!11312 (index!47640 (_ BitVec 32))) (Found!11312 (index!47641 (_ BitVec 32))) (Intermediate!11312 (undefined!12124 Bool) (index!47642 (_ BitVec 32)) (x!129274 (_ BitVec 32))) (Undefined!11312) (MissingVacant!11312 (index!47643 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97443 (_ BitVec 32)) SeekEntryResult!11312)

(assert (=> b!1429766 (= e!807265 (= (seekEntryOrOpen!0 (select (arr!47033 a!2831) j!81) a!2831 mask!2608) (Found!11312 j!81)))))

(declare-fun b!1429767 () Bool)

(declare-fun res!964392 () Bool)

(assert (=> b!1429767 (=> (not res!964392) (not e!807262))))

(declare-fun lt!629493 () (_ BitVec 64))

(declare-fun lt!629491 () array!97443)

(declare-fun lt!629492 () SeekEntryResult!11312)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97443 (_ BitVec 32)) SeekEntryResult!11312)

(assert (=> b!1429767 (= res!964392 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!629493 lt!629491 mask!2608) lt!629492))))

(declare-fun res!964400 () Bool)

(assert (=> start!123282 (=> (not res!964400) (not e!807264))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123282 (= res!964400 (validMask!0 mask!2608))))

(assert (=> start!123282 e!807264))

(assert (=> start!123282 true))

(declare-fun array_inv!36061 (array!97443) Bool)

(assert (=> start!123282 (array_inv!36061 a!2831)))

(declare-fun b!1429768 () Bool)

(declare-fun e!807263 () Bool)

(assert (=> b!1429768 (= e!807264 e!807263)))

(declare-fun res!964402 () Bool)

(assert (=> b!1429768 (=> (not res!964402) (not e!807263))))

(declare-fun lt!629490 () SeekEntryResult!11312)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1429768 (= res!964402 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47033 a!2831) j!81) mask!2608) (select (arr!47033 a!2831) j!81) a!2831 mask!2608) lt!629490))))

(assert (=> b!1429768 (= lt!629490 (Intermediate!11312 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1429769 () Bool)

(declare-fun res!964401 () Bool)

(assert (=> b!1429769 (=> (not res!964401) (not e!807264))))

(assert (=> b!1429769 (= res!964401 (and (= (size!47583 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47583 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47583 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1429770 () Bool)

(declare-fun res!964395 () Bool)

(assert (=> b!1429770 (=> (not res!964395) (not e!807262))))

(assert (=> b!1429770 (= res!964395 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47033 a!2831) j!81) a!2831 mask!2608) lt!629490))))

(declare-fun b!1429771 () Bool)

(assert (=> b!1429771 (= e!807263 e!807262)))

(declare-fun res!964397 () Bool)

(assert (=> b!1429771 (=> (not res!964397) (not e!807262))))

(assert (=> b!1429771 (= res!964397 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!629493 mask!2608) lt!629493 lt!629491 mask!2608) lt!629492))))

(assert (=> b!1429771 (= lt!629492 (Intermediate!11312 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1429771 (= lt!629493 (select (store (arr!47033 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1429771 (= lt!629491 (array!97444 (store (arr!47033 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47583 a!2831)))))

(declare-fun b!1429772 () Bool)

(assert (=> b!1429772 (= e!807262 (not true))))

(assert (=> b!1429772 e!807265))

(declare-fun res!964390 () Bool)

(assert (=> b!1429772 (=> (not res!964390) (not e!807265))))

(assert (=> b!1429772 (= res!964390 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48370 0))(
  ( (Unit!48371) )
))
(declare-fun lt!629489 () Unit!48370)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97443 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48370)

(assert (=> b!1429772 (= lt!629489 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1429773 () Bool)

(declare-fun res!964393 () Bool)

(assert (=> b!1429773 (=> (not res!964393) (not e!807264))))

(assert (=> b!1429773 (= res!964393 (validKeyInArray!0 (select (arr!47033 a!2831) j!81)))))

(assert (= (and start!123282 res!964400) b!1429769))

(assert (= (and b!1429769 res!964401) b!1429763))

(assert (= (and b!1429763 res!964396) b!1429773))

(assert (= (and b!1429773 res!964393) b!1429762))

(assert (= (and b!1429762 res!964391) b!1429765))

(assert (= (and b!1429765 res!964398) b!1429761))

(assert (= (and b!1429761 res!964394) b!1429768))

(assert (= (and b!1429768 res!964402) b!1429771))

(assert (= (and b!1429771 res!964397) b!1429770))

(assert (= (and b!1429770 res!964395) b!1429767))

(assert (= (and b!1429767 res!964392) b!1429764))

(assert (= (and b!1429764 res!964399) b!1429772))

(assert (= (and b!1429772 res!964390) b!1429766))

(declare-fun m!1319853 () Bool)

(assert (=> b!1429770 m!1319853))

(assert (=> b!1429770 m!1319853))

(declare-fun m!1319855 () Bool)

(assert (=> b!1429770 m!1319855))

(declare-fun m!1319857 () Bool)

(assert (=> start!123282 m!1319857))

(declare-fun m!1319859 () Bool)

(assert (=> start!123282 m!1319859))

(declare-fun m!1319861 () Bool)

(assert (=> b!1429763 m!1319861))

(assert (=> b!1429763 m!1319861))

(declare-fun m!1319863 () Bool)

(assert (=> b!1429763 m!1319863))

(declare-fun m!1319865 () Bool)

(assert (=> b!1429765 m!1319865))

(assert (=> b!1429773 m!1319853))

(assert (=> b!1429773 m!1319853))

(declare-fun m!1319867 () Bool)

(assert (=> b!1429773 m!1319867))

(assert (=> b!1429766 m!1319853))

(assert (=> b!1429766 m!1319853))

(declare-fun m!1319869 () Bool)

(assert (=> b!1429766 m!1319869))

(declare-fun m!1319871 () Bool)

(assert (=> b!1429762 m!1319871))

(declare-fun m!1319873 () Bool)

(assert (=> b!1429767 m!1319873))

(assert (=> b!1429768 m!1319853))

(assert (=> b!1429768 m!1319853))

(declare-fun m!1319875 () Bool)

(assert (=> b!1429768 m!1319875))

(assert (=> b!1429768 m!1319875))

(assert (=> b!1429768 m!1319853))

(declare-fun m!1319877 () Bool)

(assert (=> b!1429768 m!1319877))

(declare-fun m!1319879 () Bool)

(assert (=> b!1429772 m!1319879))

(declare-fun m!1319881 () Bool)

(assert (=> b!1429772 m!1319881))

(declare-fun m!1319883 () Bool)

(assert (=> b!1429771 m!1319883))

(assert (=> b!1429771 m!1319883))

(declare-fun m!1319885 () Bool)

(assert (=> b!1429771 m!1319885))

(declare-fun m!1319887 () Bool)

(assert (=> b!1429771 m!1319887))

(declare-fun m!1319889 () Bool)

(assert (=> b!1429771 m!1319889))

(push 1)

