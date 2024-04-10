; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!123232 () Bool)

(assert start!123232)

(declare-fun b!1428786 () Bool)

(declare-fun res!963418 () Bool)

(declare-fun e!806889 () Bool)

(assert (=> b!1428786 (=> (not res!963418) (not e!806889))))

(declare-datatypes ((array!97393 0))(
  ( (array!97394 (arr!47008 (Array (_ BitVec 32) (_ BitVec 64))) (size!47558 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97393)

(declare-fun j!81 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1428786 (= res!963418 (validKeyInArray!0 (select (arr!47008 a!2831) j!81)))))

(declare-fun b!1428787 () Bool)

(declare-fun res!963421 () Bool)

(assert (=> b!1428787 (=> (not res!963421) (not e!806889))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(assert (=> b!1428787 (= res!963421 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47558 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47558 a!2831))))))

(declare-fun b!1428788 () Bool)

(declare-fun res!963424 () Bool)

(assert (=> b!1428788 (=> (not res!963424) (not e!806889))))

(declare-datatypes ((List!33518 0))(
  ( (Nil!33515) (Cons!33514 (h!34828 (_ BitVec 64)) (t!48212 List!33518)) )
))
(declare-fun arrayNoDuplicates!0 (array!97393 (_ BitVec 32) List!33518) Bool)

(assert (=> b!1428788 (= res!963424 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33515))))

(declare-fun b!1428789 () Bool)

(declare-fun res!963422 () Bool)

(declare-fun e!806888 () Bool)

(assert (=> b!1428789 (=> (not res!963422) (not e!806888))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1428789 (= res!963422 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1428790 () Bool)

(declare-fun e!806890 () Bool)

(assert (=> b!1428790 (= e!806890 e!806888)))

(declare-fun res!963426 () Bool)

(assert (=> b!1428790 (=> (not res!963426) (not e!806888))))

(declare-fun lt!629117 () (_ BitVec 64))

(declare-fun lt!629116 () array!97393)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11287 0))(
  ( (MissingZero!11287 (index!47540 (_ BitVec 32))) (Found!11287 (index!47541 (_ BitVec 32))) (Intermediate!11287 (undefined!12099 Bool) (index!47542 (_ BitVec 32)) (x!129177 (_ BitVec 32))) (Undefined!11287) (MissingVacant!11287 (index!47543 (_ BitVec 32))) )
))
(declare-fun lt!629118 () SeekEntryResult!11287)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97393 (_ BitVec 32)) SeekEntryResult!11287)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1428790 (= res!963426 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!629117 mask!2608) lt!629117 lt!629116 mask!2608) lt!629118))))

(assert (=> b!1428790 (= lt!629118 (Intermediate!11287 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1428790 (= lt!629117 (select (store (arr!47008 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1428790 (= lt!629116 (array!97394 (store (arr!47008 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47558 a!2831)))))

(declare-fun b!1428791 () Bool)

(declare-fun res!963417 () Bool)

(assert (=> b!1428791 (=> (not res!963417) (not e!806889))))

(assert (=> b!1428791 (= res!963417 (validKeyInArray!0 (select (arr!47008 a!2831) i!982)))))

(declare-fun res!963419 () Bool)

(assert (=> start!123232 (=> (not res!963419) (not e!806889))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123232 (= res!963419 (validMask!0 mask!2608))))

(assert (=> start!123232 e!806889))

(assert (=> start!123232 true))

(declare-fun array_inv!36036 (array!97393) Bool)

(assert (=> start!123232 (array_inv!36036 a!2831)))

(declare-fun b!1428792 () Bool)

(declare-fun res!963427 () Bool)

(assert (=> b!1428792 (=> (not res!963427) (not e!806888))))

(declare-fun lt!629114 () SeekEntryResult!11287)

(assert (=> b!1428792 (= res!963427 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47008 a!2831) j!81) a!2831 mask!2608) lt!629114))))

(declare-fun b!1428793 () Bool)

(declare-fun res!963415 () Bool)

(assert (=> b!1428793 (=> (not res!963415) (not e!806889))))

(assert (=> b!1428793 (= res!963415 (and (= (size!47558 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47558 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47558 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1428794 () Bool)

(declare-fun res!963425 () Bool)

(assert (=> b!1428794 (=> (not res!963425) (not e!806888))))

(assert (=> b!1428794 (= res!963425 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!629117 lt!629116 mask!2608) lt!629118))))

(declare-fun b!1428795 () Bool)

(declare-fun e!806887 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97393 (_ BitVec 32)) SeekEntryResult!11287)

(assert (=> b!1428795 (= e!806887 (= (seekEntryOrOpen!0 (select (arr!47008 a!2831) j!81) a!2831 mask!2608) (Found!11287 j!81)))))

(declare-fun b!1428796 () Bool)

(assert (=> b!1428796 (= e!806889 e!806890)))

(declare-fun res!963423 () Bool)

(assert (=> b!1428796 (=> (not res!963423) (not e!806890))))

(assert (=> b!1428796 (= res!963423 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47008 a!2831) j!81) mask!2608) (select (arr!47008 a!2831) j!81) a!2831 mask!2608) lt!629114))))

(assert (=> b!1428796 (= lt!629114 (Intermediate!11287 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1428797 () Bool)

(declare-fun res!963416 () Bool)

(assert (=> b!1428797 (=> (not res!963416) (not e!806889))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97393 (_ BitVec 32)) Bool)

(assert (=> b!1428797 (= res!963416 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1428798 () Bool)

(assert (=> b!1428798 (= e!806888 (not true))))

(assert (=> b!1428798 e!806887))

(declare-fun res!963420 () Bool)

(assert (=> b!1428798 (=> (not res!963420) (not e!806887))))

(assert (=> b!1428798 (= res!963420 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48320 0))(
  ( (Unit!48321) )
))
(declare-fun lt!629115 () Unit!48320)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97393 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48320)

(assert (=> b!1428798 (= lt!629115 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(assert (= (and start!123232 res!963419) b!1428793))

(assert (= (and b!1428793 res!963415) b!1428791))

(assert (= (and b!1428791 res!963417) b!1428786))

(assert (= (and b!1428786 res!963418) b!1428797))

(assert (= (and b!1428797 res!963416) b!1428788))

(assert (= (and b!1428788 res!963424) b!1428787))

(assert (= (and b!1428787 res!963421) b!1428796))

(assert (= (and b!1428796 res!963423) b!1428790))

(assert (= (and b!1428790 res!963426) b!1428792))

(assert (= (and b!1428792 res!963427) b!1428794))

(assert (= (and b!1428794 res!963425) b!1428789))

(assert (= (and b!1428789 res!963422) b!1428798))

(assert (= (and b!1428798 res!963420) b!1428795))

(declare-fun m!1318903 () Bool)

(assert (=> b!1428797 m!1318903))

(declare-fun m!1318905 () Bool)

(assert (=> start!123232 m!1318905))

(declare-fun m!1318907 () Bool)

(assert (=> start!123232 m!1318907))

(declare-fun m!1318909 () Bool)

(assert (=> b!1428795 m!1318909))

(assert (=> b!1428795 m!1318909))

(declare-fun m!1318911 () Bool)

(assert (=> b!1428795 m!1318911))

(declare-fun m!1318913 () Bool)

(assert (=> b!1428798 m!1318913))

(declare-fun m!1318915 () Bool)

(assert (=> b!1428798 m!1318915))

(declare-fun m!1318917 () Bool)

(assert (=> b!1428790 m!1318917))

(assert (=> b!1428790 m!1318917))

(declare-fun m!1318919 () Bool)

(assert (=> b!1428790 m!1318919))

(declare-fun m!1318921 () Bool)

(assert (=> b!1428790 m!1318921))

(declare-fun m!1318923 () Bool)

(assert (=> b!1428790 m!1318923))

(assert (=> b!1428796 m!1318909))

(assert (=> b!1428796 m!1318909))

(declare-fun m!1318925 () Bool)

(assert (=> b!1428796 m!1318925))

(assert (=> b!1428796 m!1318925))

(assert (=> b!1428796 m!1318909))

(declare-fun m!1318927 () Bool)

(assert (=> b!1428796 m!1318927))

(declare-fun m!1318929 () Bool)

(assert (=> b!1428791 m!1318929))

(assert (=> b!1428791 m!1318929))

(declare-fun m!1318931 () Bool)

(assert (=> b!1428791 m!1318931))

(declare-fun m!1318933 () Bool)

(assert (=> b!1428794 m!1318933))

(assert (=> b!1428792 m!1318909))

(assert (=> b!1428792 m!1318909))

(declare-fun m!1318935 () Bool)

(assert (=> b!1428792 m!1318935))

(assert (=> b!1428786 m!1318909))

(assert (=> b!1428786 m!1318909))

(declare-fun m!1318937 () Bool)

(assert (=> b!1428786 m!1318937))

(declare-fun m!1318939 () Bool)

(assert (=> b!1428788 m!1318939))

(push 1)

(assert (not b!1428792))

(assert (not start!123232))

(assert (not b!1428795))

(assert (not b!1428786))

