; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!123154 () Bool)

(assert start!123154)

(declare-fun b!1428009 () Bool)

(declare-fun res!962839 () Bool)

(declare-fun e!806520 () Bool)

(assert (=> b!1428009 (=> (not res!962839) (not e!806520))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1428009 (= res!962839 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1428010 () Bool)

(declare-fun res!962846 () Bool)

(assert (=> b!1428010 (=> (not res!962846) (not e!806520))))

(declare-datatypes ((SeekEntryResult!11275 0))(
  ( (MissingZero!11275 (index!47492 (_ BitVec 32))) (Found!11275 (index!47493 (_ BitVec 32))) (Intermediate!11275 (undefined!12087 Bool) (index!47494 (_ BitVec 32)) (x!129127 (_ BitVec 32))) (Undefined!11275) (MissingVacant!11275 (index!47495 (_ BitVec 32))) )
))
(declare-fun lt!628802 () SeekEntryResult!11275)

(declare-fun x!605 () (_ BitVec 32))

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((array!97366 0))(
  ( (array!97367 (arr!46996 (Array (_ BitVec 32) (_ BitVec 64))) (size!47546 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97366)

(declare-fun index!585 () (_ BitVec 32))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97366 (_ BitVec 32)) SeekEntryResult!11275)

(assert (=> b!1428010 (= res!962846 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46996 a!2831) j!81) a!2831 mask!2608) lt!628802))))

(declare-fun b!1428011 () Bool)

(declare-fun e!806521 () Bool)

(declare-fun e!806518 () Bool)

(assert (=> b!1428011 (= e!806521 e!806518)))

(declare-fun res!962845 () Bool)

(assert (=> b!1428011 (=> (not res!962845) (not e!806518))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1428011 (= res!962845 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46996 a!2831) j!81) mask!2608) (select (arr!46996 a!2831) j!81) a!2831 mask!2608) lt!628802))))

(assert (=> b!1428011 (= lt!628802 (Intermediate!11275 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun res!962843 () Bool)

(assert (=> start!123154 (=> (not res!962843) (not e!806521))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123154 (= res!962843 (validMask!0 mask!2608))))

(assert (=> start!123154 e!806521))

(assert (=> start!123154 true))

(declare-fun array_inv!36024 (array!97366) Bool)

(assert (=> start!123154 (array_inv!36024 a!2831)))

(declare-fun b!1428012 () Bool)

(declare-fun res!962848 () Bool)

(assert (=> b!1428012 (=> (not res!962848) (not e!806521))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1428012 (= res!962848 (and (= (size!47546 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47546 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47546 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1428013 () Bool)

(declare-fun res!962840 () Bool)

(assert (=> b!1428013 (=> (not res!962840) (not e!806520))))

(declare-fun lt!628803 () array!97366)

(declare-fun lt!628805 () SeekEntryResult!11275)

(declare-fun lt!628806 () (_ BitVec 64))

(assert (=> b!1428013 (= res!962840 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!628806 lt!628803 mask!2608) lt!628805))))

(declare-fun b!1428014 () Bool)

(declare-fun res!962847 () Bool)

(assert (=> b!1428014 (=> (not res!962847) (not e!806521))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1428014 (= res!962847 (validKeyInArray!0 (select (arr!46996 a!2831) j!81)))))

(declare-fun b!1428015 () Bool)

(declare-fun e!806522 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97366 (_ BitVec 32)) SeekEntryResult!11275)

(assert (=> b!1428015 (= e!806522 (= (seekEntryOrOpen!0 (select (arr!46996 a!2831) j!81) a!2831 mask!2608) (Found!11275 j!81)))))

(declare-fun b!1428016 () Bool)

(assert (=> b!1428016 (= e!806518 e!806520)))

(declare-fun res!962849 () Bool)

(assert (=> b!1428016 (=> (not res!962849) (not e!806520))))

(assert (=> b!1428016 (= res!962849 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!628806 mask!2608) lt!628806 lt!628803 mask!2608) lt!628805))))

(assert (=> b!1428016 (= lt!628805 (Intermediate!11275 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1428016 (= lt!628806 (select (store (arr!46996 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1428016 (= lt!628803 (array!97367 (store (arr!46996 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47546 a!2831)))))

(declare-fun b!1428017 () Bool)

(declare-fun res!962842 () Bool)

(assert (=> b!1428017 (=> (not res!962842) (not e!806521))))

(assert (=> b!1428017 (= res!962842 (validKeyInArray!0 (select (arr!46996 a!2831) i!982)))))

(declare-fun b!1428018 () Bool)

(assert (=> b!1428018 (= e!806520 (not true))))

(assert (=> b!1428018 e!806522))

(declare-fun res!962851 () Bool)

(assert (=> b!1428018 (=> (not res!962851) (not e!806522))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97366 (_ BitVec 32)) Bool)

(assert (=> b!1428018 (= res!962851 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48296 0))(
  ( (Unit!48297) )
))
(declare-fun lt!628804 () Unit!48296)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97366 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48296)

(assert (=> b!1428018 (= lt!628804 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1428019 () Bool)

(declare-fun res!962841 () Bool)

(assert (=> b!1428019 (=> (not res!962841) (not e!806521))))

(assert (=> b!1428019 (= res!962841 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47546 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47546 a!2831))))))

(declare-fun b!1428020 () Bool)

(declare-fun res!962844 () Bool)

(assert (=> b!1428020 (=> (not res!962844) (not e!806521))))

(assert (=> b!1428020 (= res!962844 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1428021 () Bool)

(declare-fun res!962850 () Bool)

(assert (=> b!1428021 (=> (not res!962850) (not e!806521))))

(declare-datatypes ((List!33506 0))(
  ( (Nil!33503) (Cons!33502 (h!34813 (_ BitVec 64)) (t!48200 List!33506)) )
))
(declare-fun arrayNoDuplicates!0 (array!97366 (_ BitVec 32) List!33506) Bool)

(assert (=> b!1428021 (= res!962850 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33503))))

(assert (= (and start!123154 res!962843) b!1428012))

(assert (= (and b!1428012 res!962848) b!1428017))

(assert (= (and b!1428017 res!962842) b!1428014))

(assert (= (and b!1428014 res!962847) b!1428020))

(assert (= (and b!1428020 res!962844) b!1428021))

(assert (= (and b!1428021 res!962850) b!1428019))

(assert (= (and b!1428019 res!962841) b!1428011))

(assert (= (and b!1428011 res!962845) b!1428016))

(assert (= (and b!1428016 res!962849) b!1428010))

(assert (= (and b!1428010 res!962846) b!1428013))

(assert (= (and b!1428013 res!962840) b!1428009))

(assert (= (and b!1428009 res!962839) b!1428018))

(assert (= (and b!1428018 res!962851) b!1428015))

(declare-fun m!1318255 () Bool)

(assert (=> b!1428018 m!1318255))

(declare-fun m!1318257 () Bool)

(assert (=> b!1428018 m!1318257))

(declare-fun m!1318259 () Bool)

(assert (=> b!1428011 m!1318259))

(assert (=> b!1428011 m!1318259))

(declare-fun m!1318261 () Bool)

(assert (=> b!1428011 m!1318261))

(assert (=> b!1428011 m!1318261))

(assert (=> b!1428011 m!1318259))

(declare-fun m!1318263 () Bool)

(assert (=> b!1428011 m!1318263))

(assert (=> b!1428010 m!1318259))

(assert (=> b!1428010 m!1318259))

(declare-fun m!1318265 () Bool)

(assert (=> b!1428010 m!1318265))

(declare-fun m!1318267 () Bool)

(assert (=> b!1428021 m!1318267))

(declare-fun m!1318269 () Bool)

(assert (=> b!1428020 m!1318269))

(declare-fun m!1318271 () Bool)

(assert (=> b!1428016 m!1318271))

(assert (=> b!1428016 m!1318271))

(declare-fun m!1318273 () Bool)

(assert (=> b!1428016 m!1318273))

(declare-fun m!1318275 () Bool)

(assert (=> b!1428016 m!1318275))

(declare-fun m!1318277 () Bool)

(assert (=> b!1428016 m!1318277))

(assert (=> b!1428014 m!1318259))

(assert (=> b!1428014 m!1318259))

(declare-fun m!1318279 () Bool)

(assert (=> b!1428014 m!1318279))

(assert (=> b!1428015 m!1318259))

(assert (=> b!1428015 m!1318259))

(declare-fun m!1318281 () Bool)

(assert (=> b!1428015 m!1318281))

(declare-fun m!1318283 () Bool)

(assert (=> b!1428013 m!1318283))

(declare-fun m!1318285 () Bool)

(assert (=> start!123154 m!1318285))

(declare-fun m!1318287 () Bool)

(assert (=> start!123154 m!1318287))

(declare-fun m!1318289 () Bool)

(assert (=> b!1428017 m!1318289))

(assert (=> b!1428017 m!1318289))

(declare-fun m!1318291 () Bool)

(assert (=> b!1428017 m!1318291))

(push 1)

