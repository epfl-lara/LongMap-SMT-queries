; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122712 () Bool)

(assert start!122712)

(declare-fun b!1421775 () Bool)

(declare-fun e!803864 () Bool)

(declare-fun e!803860 () Bool)

(assert (=> b!1421775 (= e!803864 e!803860)))

(declare-fun res!957208 () Bool)

(assert (=> b!1421775 (=> (not res!957208) (not e!803860))))

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((array!97077 0))(
  ( (array!97078 (arr!46856 (Array (_ BitVec 32) (_ BitVec 64))) (size!47406 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97077)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11141 0))(
  ( (MissingZero!11141 (index!46956 (_ BitVec 32))) (Found!11141 (index!46957 (_ BitVec 32))) (Intermediate!11141 (undefined!11953 Bool) (index!46958 (_ BitVec 32)) (x!128607 (_ BitVec 32))) (Undefined!11141) (MissingVacant!11141 (index!46959 (_ BitVec 32))) )
))
(declare-fun lt!626398 () SeekEntryResult!11141)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97077 (_ BitVec 32)) SeekEntryResult!11141)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1421775 (= res!957208 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46856 a!2831) j!81) mask!2608) (select (arr!46856 a!2831) j!81) a!2831 mask!2608) lt!626398))))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(assert (=> b!1421775 (= lt!626398 (Intermediate!11141 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1421776 () Bool)

(declare-fun res!957220 () Bool)

(declare-fun e!803861 () Bool)

(assert (=> b!1421776 (=> (not res!957220) (not e!803861))))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1421776 (= res!957220 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46856 a!2831) j!81) a!2831 mask!2608) lt!626398))))

(declare-fun b!1421777 () Bool)

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1421777 (= e!803861 (not (or (= (select (arr!46856 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46856 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46856 a!2831) index!585) (select (arr!46856 a!2831) j!81)) (= (select (store (arr!46856 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (bvslt mask!2608 #b00000000000000000000000000000000) (bvslt index!585 (bvadd #b00000000000000000000000000000001 mask!2608)))))))

(declare-fun e!803863 () Bool)

(assert (=> b!1421777 e!803863))

(declare-fun res!957219 () Bool)

(assert (=> b!1421777 (=> (not res!957219) (not e!803863))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97077 (_ BitVec 32)) Bool)

(assert (=> b!1421777 (= res!957219 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48118 0))(
  ( (Unit!48119) )
))
(declare-fun lt!626400 () Unit!48118)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97077 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48118)

(assert (=> b!1421777 (= lt!626400 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1421778 () Bool)

(declare-fun res!957213 () Bool)

(assert (=> b!1421778 (=> (not res!957213) (not e!803864))))

(assert (=> b!1421778 (= res!957213 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1421779 () Bool)

(declare-fun res!957210 () Bool)

(assert (=> b!1421779 (=> (not res!957210) (not e!803861))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1421779 (= res!957210 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun res!957209 () Bool)

(assert (=> start!122712 (=> (not res!957209) (not e!803864))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122712 (= res!957209 (validMask!0 mask!2608))))

(assert (=> start!122712 e!803864))

(assert (=> start!122712 true))

(declare-fun array_inv!35884 (array!97077) Bool)

(assert (=> start!122712 (array_inv!35884 a!2831)))

(declare-fun b!1421780 () Bool)

(declare-fun res!957215 () Bool)

(assert (=> b!1421780 (=> (not res!957215) (not e!803864))))

(assert (=> b!1421780 (= res!957215 (and (= (size!47406 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47406 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47406 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1421781 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97077 (_ BitVec 32)) SeekEntryResult!11141)

(assert (=> b!1421781 (= e!803863 (= (seekEntryOrOpen!0 (select (arr!46856 a!2831) j!81) a!2831 mask!2608) (Found!11141 j!81)))))

(declare-fun b!1421782 () Bool)

(declare-fun res!957211 () Bool)

(assert (=> b!1421782 (=> (not res!957211) (not e!803864))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1421782 (= res!957211 (validKeyInArray!0 (select (arr!46856 a!2831) i!982)))))

(declare-fun b!1421783 () Bool)

(declare-fun res!957217 () Bool)

(assert (=> b!1421783 (=> (not res!957217) (not e!803864))))

(declare-datatypes ((List!33366 0))(
  ( (Nil!33363) (Cons!33362 (h!34664 (_ BitVec 64)) (t!48060 List!33366)) )
))
(declare-fun arrayNoDuplicates!0 (array!97077 (_ BitVec 32) List!33366) Bool)

(assert (=> b!1421783 (= res!957217 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33363))))

(declare-fun b!1421784 () Bool)

(declare-fun res!957216 () Bool)

(assert (=> b!1421784 (=> (not res!957216) (not e!803861))))

(declare-fun lt!626399 () SeekEntryResult!11141)

(declare-fun lt!626397 () array!97077)

(declare-fun lt!626396 () (_ BitVec 64))

(assert (=> b!1421784 (= res!957216 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!626396 lt!626397 mask!2608) lt!626399))))

(declare-fun b!1421785 () Bool)

(declare-fun res!957212 () Bool)

(assert (=> b!1421785 (=> (not res!957212) (not e!803864))))

(assert (=> b!1421785 (= res!957212 (validKeyInArray!0 (select (arr!46856 a!2831) j!81)))))

(declare-fun b!1421786 () Bool)

(declare-fun res!957214 () Bool)

(assert (=> b!1421786 (=> (not res!957214) (not e!803864))))

(assert (=> b!1421786 (= res!957214 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47406 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47406 a!2831))))))

(declare-fun b!1421787 () Bool)

(assert (=> b!1421787 (= e!803860 e!803861)))

(declare-fun res!957218 () Bool)

(assert (=> b!1421787 (=> (not res!957218) (not e!803861))))

(assert (=> b!1421787 (= res!957218 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!626396 mask!2608) lt!626396 lt!626397 mask!2608) lt!626399))))

(assert (=> b!1421787 (= lt!626399 (Intermediate!11141 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1421787 (= lt!626396 (select (store (arr!46856 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1421787 (= lt!626397 (array!97078 (store (arr!46856 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47406 a!2831)))))

(assert (= (and start!122712 res!957209) b!1421780))

(assert (= (and b!1421780 res!957215) b!1421782))

(assert (= (and b!1421782 res!957211) b!1421785))

(assert (= (and b!1421785 res!957212) b!1421778))

(assert (= (and b!1421778 res!957213) b!1421783))

(assert (= (and b!1421783 res!957217) b!1421786))

(assert (= (and b!1421786 res!957214) b!1421775))

(assert (= (and b!1421775 res!957208) b!1421787))

(assert (= (and b!1421787 res!957218) b!1421776))

(assert (= (and b!1421776 res!957220) b!1421784))

(assert (= (and b!1421784 res!957216) b!1421779))

(assert (= (and b!1421779 res!957210) b!1421777))

(assert (= (and b!1421777 res!957219) b!1421781))

(declare-fun m!1312323 () Bool)

(assert (=> b!1421777 m!1312323))

(declare-fun m!1312325 () Bool)

(assert (=> b!1421777 m!1312325))

(declare-fun m!1312327 () Bool)

(assert (=> b!1421777 m!1312327))

(declare-fun m!1312329 () Bool)

(assert (=> b!1421777 m!1312329))

(declare-fun m!1312331 () Bool)

(assert (=> b!1421777 m!1312331))

(declare-fun m!1312333 () Bool)

(assert (=> b!1421777 m!1312333))

(declare-fun m!1312335 () Bool)

(assert (=> b!1421787 m!1312335))

(assert (=> b!1421787 m!1312335))

(declare-fun m!1312337 () Bool)

(assert (=> b!1421787 m!1312337))

(assert (=> b!1421787 m!1312323))

(declare-fun m!1312339 () Bool)

(assert (=> b!1421787 m!1312339))

(declare-fun m!1312341 () Bool)

(assert (=> b!1421784 m!1312341))

(declare-fun m!1312343 () Bool)

(assert (=> b!1421782 m!1312343))

(assert (=> b!1421782 m!1312343))

(declare-fun m!1312345 () Bool)

(assert (=> b!1421782 m!1312345))

(assert (=> b!1421785 m!1312331))

(assert (=> b!1421785 m!1312331))

(declare-fun m!1312347 () Bool)

(assert (=> b!1421785 m!1312347))

(assert (=> b!1421775 m!1312331))

(assert (=> b!1421775 m!1312331))

(declare-fun m!1312349 () Bool)

(assert (=> b!1421775 m!1312349))

(assert (=> b!1421775 m!1312349))

(assert (=> b!1421775 m!1312331))

(declare-fun m!1312351 () Bool)

(assert (=> b!1421775 m!1312351))

(assert (=> b!1421776 m!1312331))

(assert (=> b!1421776 m!1312331))

(declare-fun m!1312353 () Bool)

(assert (=> b!1421776 m!1312353))

(declare-fun m!1312355 () Bool)

(assert (=> start!122712 m!1312355))

(declare-fun m!1312357 () Bool)

(assert (=> start!122712 m!1312357))

(declare-fun m!1312359 () Bool)

(assert (=> b!1421778 m!1312359))

(declare-fun m!1312361 () Bool)

(assert (=> b!1421783 m!1312361))

(assert (=> b!1421781 m!1312331))

(assert (=> b!1421781 m!1312331))

(declare-fun m!1312363 () Bool)

(assert (=> b!1421781 m!1312363))

(push 1)

(assert (not b!1421787))

(assert (not b!1421776))

(assert (not b!1421778))

(assert (not b!1421781))

(assert (not b!1421784))

(assert (not b!1421782))

(assert (not b!1421777))

(assert (not b!1421775))

(assert (not start!122712))

(assert (not b!1421785))

(assert (not b!1421783))

(check-sat)

(pop 1)

(push 1)

(check-sat)

