; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!123528 () Bool)

(assert start!123528)

(declare-fun b!1431941 () Bool)

(declare-fun res!965807 () Bool)

(declare-fun e!808390 () Bool)

(assert (=> b!1431941 (=> (not res!965807) (not e!808390))))

(declare-datatypes ((array!97500 0))(
  ( (array!97501 (arr!47057 (Array (_ BitVec 32) (_ BitVec 64))) (size!47607 (_ BitVec 32))) )
))
(declare-fun lt!630380 () array!97500)

(declare-datatypes ((SeekEntryResult!11336 0))(
  ( (MissingZero!11336 (index!47736 (_ BitVec 32))) (Found!11336 (index!47737 (_ BitVec 32))) (Intermediate!11336 (undefined!12148 Bool) (index!47738 (_ BitVec 32)) (x!129386 (_ BitVec 32))) (Undefined!11336) (MissingVacant!11336 (index!47739 (_ BitVec 32))) )
))
(declare-fun lt!630384 () SeekEntryResult!11336)

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun lt!630383 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97500 (_ BitVec 32)) SeekEntryResult!11336)

(assert (=> b!1431941 (= res!965807 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!630383 lt!630380 mask!2608) lt!630384))))

(declare-fun b!1431942 () Bool)

(declare-fun e!808389 () Bool)

(assert (=> b!1431942 (= e!808390 (not e!808389))))

(declare-fun res!965817 () Bool)

(assert (=> b!1431942 (=> res!965817 e!808389)))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun a!2831 () array!97500)

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1431942 (= res!965817 (or (= (select (arr!47057 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47057 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47057 a!2831) index!585) (select (arr!47057 a!2831) j!81)) (= (select (store (arr!47057 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!808387 () Bool)

(assert (=> b!1431942 e!808387))

(declare-fun res!965813 () Bool)

(assert (=> b!1431942 (=> (not res!965813) (not e!808387))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97500 (_ BitVec 32)) Bool)

(assert (=> b!1431942 (= res!965813 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48418 0))(
  ( (Unit!48419) )
))
(declare-fun lt!630379 () Unit!48418)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97500 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48418)

(assert (=> b!1431942 (= lt!630379 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1431943 () Bool)

(declare-fun e!808386 () Bool)

(declare-fun e!808388 () Bool)

(assert (=> b!1431943 (= e!808386 e!808388)))

(declare-fun res!965814 () Bool)

(assert (=> b!1431943 (=> (not res!965814) (not e!808388))))

(declare-fun lt!630382 () SeekEntryResult!11336)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1431943 (= res!965814 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47057 a!2831) j!81) mask!2608) (select (arr!47057 a!2831) j!81) a!2831 mask!2608) lt!630382))))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(assert (=> b!1431943 (= lt!630382 (Intermediate!11336 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1431944 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97500 (_ BitVec 32)) SeekEntryResult!11336)

(assert (=> b!1431944 (= e!808387 (= (seekEntryOrOpen!0 (select (arr!47057 a!2831) j!81) a!2831 mask!2608) (Found!11336 j!81)))))

(declare-fun b!1431945 () Bool)

(declare-fun res!965805 () Bool)

(assert (=> b!1431945 (=> (not res!965805) (not e!808386))))

(assert (=> b!1431945 (= res!965805 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47607 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47607 a!2831))))))

(declare-fun b!1431946 () Bool)

(assert (=> b!1431946 (= e!808389 true)))

(declare-fun lt!630381 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1431946 (= lt!630381 (nextIndex!0 index!585 x!605 mask!2608))))

(declare-fun res!965818 () Bool)

(assert (=> start!123528 (=> (not res!965818) (not e!808386))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123528 (= res!965818 (validMask!0 mask!2608))))

(assert (=> start!123528 e!808386))

(assert (=> start!123528 true))

(declare-fun array_inv!36085 (array!97500) Bool)

(assert (=> start!123528 (array_inv!36085 a!2831)))

(declare-fun b!1431947 () Bool)

(assert (=> b!1431947 (= e!808388 e!808390)))

(declare-fun res!965810 () Bool)

(assert (=> b!1431947 (=> (not res!965810) (not e!808390))))

(assert (=> b!1431947 (= res!965810 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!630383 mask!2608) lt!630383 lt!630380 mask!2608) lt!630384))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1431947 (= lt!630384 (Intermediate!11336 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1431947 (= lt!630383 (select (store (arr!47057 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1431947 (= lt!630380 (array!97501 (store (arr!47057 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47607 a!2831)))))

(declare-fun b!1431948 () Bool)

(declare-fun res!965808 () Bool)

(assert (=> b!1431948 (=> (not res!965808) (not e!808386))))

(assert (=> b!1431948 (= res!965808 (and (= (size!47607 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47607 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47607 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1431949 () Bool)

(declare-fun res!965811 () Bool)

(assert (=> b!1431949 (=> (not res!965811) (not e!808390))))

(assert (=> b!1431949 (= res!965811 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1431950 () Bool)

(declare-fun res!965812 () Bool)

(assert (=> b!1431950 (=> (not res!965812) (not e!808386))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1431950 (= res!965812 (validKeyInArray!0 (select (arr!47057 a!2831) j!81)))))

(declare-fun b!1431951 () Bool)

(declare-fun res!965815 () Bool)

(assert (=> b!1431951 (=> (not res!965815) (not e!808386))))

(declare-datatypes ((List!33567 0))(
  ( (Nil!33564) (Cons!33563 (h!34886 (_ BitVec 64)) (t!48261 List!33567)) )
))
(declare-fun arrayNoDuplicates!0 (array!97500 (_ BitVec 32) List!33567) Bool)

(assert (=> b!1431951 (= res!965815 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33564))))

(declare-fun b!1431952 () Bool)

(declare-fun res!965809 () Bool)

(assert (=> b!1431952 (=> (not res!965809) (not e!808390))))

(assert (=> b!1431952 (= res!965809 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47057 a!2831) j!81) a!2831 mask!2608) lt!630382))))

(declare-fun b!1431953 () Bool)

(declare-fun res!965806 () Bool)

(assert (=> b!1431953 (=> (not res!965806) (not e!808386))))

(assert (=> b!1431953 (= res!965806 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1431954 () Bool)

(declare-fun res!965816 () Bool)

(assert (=> b!1431954 (=> (not res!965816) (not e!808386))))

(assert (=> b!1431954 (= res!965816 (validKeyInArray!0 (select (arr!47057 a!2831) i!982)))))

(assert (= (and start!123528 res!965818) b!1431948))

(assert (= (and b!1431948 res!965808) b!1431954))

(assert (= (and b!1431954 res!965816) b!1431950))

(assert (= (and b!1431950 res!965812) b!1431953))

(assert (= (and b!1431953 res!965806) b!1431951))

(assert (= (and b!1431951 res!965815) b!1431945))

(assert (= (and b!1431945 res!965805) b!1431943))

(assert (= (and b!1431943 res!965814) b!1431947))

(assert (= (and b!1431947 res!965810) b!1431952))

(assert (= (and b!1431952 res!965809) b!1431941))

(assert (= (and b!1431941 res!965807) b!1431949))

(assert (= (and b!1431949 res!965811) b!1431942))

(assert (= (and b!1431942 res!965813) b!1431944))

(assert (= (and b!1431942 (not res!965817)) b!1431946))

(declare-fun m!1321725 () Bool)

(assert (=> b!1431952 m!1321725))

(assert (=> b!1431952 m!1321725))

(declare-fun m!1321727 () Bool)

(assert (=> b!1431952 m!1321727))

(declare-fun m!1321729 () Bool)

(assert (=> b!1431941 m!1321729))

(declare-fun m!1321731 () Bool)

(assert (=> b!1431946 m!1321731))

(declare-fun m!1321733 () Bool)

(assert (=> b!1431954 m!1321733))

(assert (=> b!1431954 m!1321733))

(declare-fun m!1321735 () Bool)

(assert (=> b!1431954 m!1321735))

(declare-fun m!1321737 () Bool)

(assert (=> b!1431953 m!1321737))

(assert (=> b!1431943 m!1321725))

(assert (=> b!1431943 m!1321725))

(declare-fun m!1321739 () Bool)

(assert (=> b!1431943 m!1321739))

(assert (=> b!1431943 m!1321739))

(assert (=> b!1431943 m!1321725))

(declare-fun m!1321741 () Bool)

(assert (=> b!1431943 m!1321741))

(declare-fun m!1321743 () Bool)

(assert (=> b!1431951 m!1321743))

(declare-fun m!1321745 () Bool)

(assert (=> start!123528 m!1321745))

(declare-fun m!1321747 () Bool)

(assert (=> start!123528 m!1321747))

(assert (=> b!1431944 m!1321725))

(assert (=> b!1431944 m!1321725))

(declare-fun m!1321749 () Bool)

(assert (=> b!1431944 m!1321749))

(declare-fun m!1321751 () Bool)

(assert (=> b!1431947 m!1321751))

(assert (=> b!1431947 m!1321751))

(declare-fun m!1321753 () Bool)

(assert (=> b!1431947 m!1321753))

(declare-fun m!1321755 () Bool)

(assert (=> b!1431947 m!1321755))

(declare-fun m!1321757 () Bool)

(assert (=> b!1431947 m!1321757))

(assert (=> b!1431950 m!1321725))

(assert (=> b!1431950 m!1321725))

(declare-fun m!1321759 () Bool)

(assert (=> b!1431950 m!1321759))

(assert (=> b!1431942 m!1321755))

(declare-fun m!1321761 () Bool)

(assert (=> b!1431942 m!1321761))

(declare-fun m!1321763 () Bool)

(assert (=> b!1431942 m!1321763))

(declare-fun m!1321765 () Bool)

(assert (=> b!1431942 m!1321765))

(assert (=> b!1431942 m!1321725))

(declare-fun m!1321767 () Bool)

(assert (=> b!1431942 m!1321767))

(push 1)

