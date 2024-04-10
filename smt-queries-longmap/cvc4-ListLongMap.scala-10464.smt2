; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122950 () Bool)

(assert start!122950)

(declare-fun b!1426273 () Bool)

(declare-fun res!961711 () Bool)

(declare-fun e!805646 () Bool)

(assert (=> b!1426273 (=> (not res!961711) (not e!805646))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1426273 (= res!961711 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1426274 () Bool)

(declare-fun res!961712 () Bool)

(declare-fun e!805648 () Bool)

(assert (=> b!1426274 (=> (not res!961712) (not e!805648))))

(declare-datatypes ((array!97315 0))(
  ( (array!97316 (arr!46975 (Array (_ BitVec 32) (_ BitVec 64))) (size!47525 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97315)

(declare-fun i!982 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1426274 (= res!961712 (validKeyInArray!0 (select (arr!46975 a!2831) i!982)))))

(declare-fun b!1426275 () Bool)

(declare-fun res!961715 () Bool)

(assert (=> b!1426275 (=> (not res!961715) (not e!805646))))

(declare-datatypes ((SeekEntryResult!11254 0))(
  ( (MissingZero!11254 (index!47408 (_ BitVec 32))) (Found!11254 (index!47409 (_ BitVec 32))) (Intermediate!11254 (undefined!12066 Bool) (index!47410 (_ BitVec 32)) (x!129032 (_ BitVec 32))) (Undefined!11254) (MissingVacant!11254 (index!47411 (_ BitVec 32))) )
))
(declare-fun lt!628091 () SeekEntryResult!11254)

(declare-fun j!81 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97315 (_ BitVec 32)) SeekEntryResult!11254)

(assert (=> b!1426275 (= res!961715 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46975 a!2831) j!81) a!2831 mask!2608) lt!628091))))

(declare-fun b!1426276 () Bool)

(declare-fun e!805647 () Bool)

(assert (=> b!1426276 (= e!805648 e!805647)))

(declare-fun res!961714 () Bool)

(assert (=> b!1426276 (=> (not res!961714) (not e!805647))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1426276 (= res!961714 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46975 a!2831) j!81) mask!2608) (select (arr!46975 a!2831) j!81) a!2831 mask!2608) lt!628091))))

(assert (=> b!1426276 (= lt!628091 (Intermediate!11254 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1426277 () Bool)

(declare-fun res!961717 () Bool)

(assert (=> b!1426277 (=> (not res!961717) (not e!805648))))

(assert (=> b!1426277 (= res!961717 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47525 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47525 a!2831))))))

(declare-fun b!1426278 () Bool)

(declare-fun res!961710 () Bool)

(assert (=> b!1426278 (=> (not res!961710) (not e!805648))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97315 (_ BitVec 32)) Bool)

(assert (=> b!1426278 (= res!961710 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1426279 () Bool)

(declare-fun res!961709 () Bool)

(assert (=> b!1426279 (=> (not res!961709) (not e!805648))))

(assert (=> b!1426279 (= res!961709 (and (= (size!47525 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47525 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47525 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1426280 () Bool)

(assert (=> b!1426280 (= e!805647 e!805646)))

(declare-fun res!961707 () Bool)

(assert (=> b!1426280 (=> (not res!961707) (not e!805646))))

(declare-fun lt!628093 () array!97315)

(declare-fun lt!628094 () SeekEntryResult!11254)

(declare-fun lt!628095 () (_ BitVec 64))

(assert (=> b!1426280 (= res!961707 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!628095 mask!2608) lt!628095 lt!628093 mask!2608) lt!628094))))

(assert (=> b!1426280 (= lt!628094 (Intermediate!11254 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1426280 (= lt!628095 (select (store (arr!46975 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1426280 (= lt!628093 (array!97316 (store (arr!46975 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47525 a!2831)))))

(declare-fun res!961713 () Bool)

(assert (=> start!122950 (=> (not res!961713) (not e!805648))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122950 (= res!961713 (validMask!0 mask!2608))))

(assert (=> start!122950 e!805648))

(assert (=> start!122950 true))

(declare-fun array_inv!36003 (array!97315) Bool)

(assert (=> start!122950 (array_inv!36003 a!2831)))

(declare-fun b!1426281 () Bool)

(declare-fun res!961716 () Bool)

(assert (=> b!1426281 (=> (not res!961716) (not e!805646))))

(assert (=> b!1426281 (= res!961716 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!628095 lt!628093 mask!2608) lt!628094))))

(declare-fun b!1426282 () Bool)

(assert (=> b!1426282 (= e!805646 (not true))))

(assert (=> b!1426282 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608)))

(declare-datatypes ((Unit!48254 0))(
  ( (Unit!48255) )
))
(declare-fun lt!628092 () Unit!48254)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97315 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48254)

(assert (=> b!1426282 (= lt!628092 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1426283 () Bool)

(declare-fun res!961708 () Bool)

(assert (=> b!1426283 (=> (not res!961708) (not e!805648))))

(declare-datatypes ((List!33485 0))(
  ( (Nil!33482) (Cons!33481 (h!34783 (_ BitVec 64)) (t!48179 List!33485)) )
))
(declare-fun arrayNoDuplicates!0 (array!97315 (_ BitVec 32) List!33485) Bool)

(assert (=> b!1426283 (= res!961708 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33482))))

(declare-fun b!1426284 () Bool)

(declare-fun res!961706 () Bool)

(assert (=> b!1426284 (=> (not res!961706) (not e!805648))))

(assert (=> b!1426284 (= res!961706 (validKeyInArray!0 (select (arr!46975 a!2831) j!81)))))

(assert (= (and start!122950 res!961713) b!1426279))

(assert (= (and b!1426279 res!961709) b!1426274))

(assert (= (and b!1426274 res!961712) b!1426284))

(assert (= (and b!1426284 res!961706) b!1426278))

(assert (= (and b!1426278 res!961710) b!1426283))

(assert (= (and b!1426283 res!961708) b!1426277))

(assert (= (and b!1426277 res!961717) b!1426276))

(assert (= (and b!1426276 res!961714) b!1426280))

(assert (= (and b!1426280 res!961707) b!1426275))

(assert (= (and b!1426275 res!961715) b!1426281))

(assert (= (and b!1426281 res!961716) b!1426273))

(assert (= (and b!1426273 res!961711) b!1426282))

(declare-fun m!1316883 () Bool)

(assert (=> b!1426280 m!1316883))

(assert (=> b!1426280 m!1316883))

(declare-fun m!1316885 () Bool)

(assert (=> b!1426280 m!1316885))

(declare-fun m!1316887 () Bool)

(assert (=> b!1426280 m!1316887))

(declare-fun m!1316889 () Bool)

(assert (=> b!1426280 m!1316889))

(declare-fun m!1316891 () Bool)

(assert (=> start!122950 m!1316891))

(declare-fun m!1316893 () Bool)

(assert (=> start!122950 m!1316893))

(declare-fun m!1316895 () Bool)

(assert (=> b!1426274 m!1316895))

(assert (=> b!1426274 m!1316895))

(declare-fun m!1316897 () Bool)

(assert (=> b!1426274 m!1316897))

(declare-fun m!1316899 () Bool)

(assert (=> b!1426278 m!1316899))

(declare-fun m!1316901 () Bool)

(assert (=> b!1426283 m!1316901))

(declare-fun m!1316903 () Bool)

(assert (=> b!1426284 m!1316903))

(assert (=> b!1426284 m!1316903))

(declare-fun m!1316905 () Bool)

(assert (=> b!1426284 m!1316905))

(assert (=> b!1426275 m!1316903))

(assert (=> b!1426275 m!1316903))

(declare-fun m!1316907 () Bool)

(assert (=> b!1426275 m!1316907))

(declare-fun m!1316909 () Bool)

(assert (=> b!1426281 m!1316909))

(declare-fun m!1316911 () Bool)

(assert (=> b!1426282 m!1316911))

(declare-fun m!1316913 () Bool)

(assert (=> b!1426282 m!1316913))

(assert (=> b!1426276 m!1316903))

(assert (=> b!1426276 m!1316903))

(declare-fun m!1316915 () Bool)

(assert (=> b!1426276 m!1316915))

(assert (=> b!1426276 m!1316915))

(assert (=> b!1426276 m!1316903))

(declare-fun m!1316917 () Bool)

(assert (=> b!1426276 m!1316917))

(push 1)

