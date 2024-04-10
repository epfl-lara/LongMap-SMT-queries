; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122800 () Bool)

(assert start!122800)

(declare-fun b!1423839 () Bool)

(declare-fun res!959273 () Bool)

(declare-fun e!804757 () Bool)

(assert (=> b!1423839 (=> (not res!959273) (not e!804757))))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11185 0))(
  ( (MissingZero!11185 (index!47132 (_ BitVec 32))) (Found!11185 (index!47133 (_ BitVec 32))) (Intermediate!11185 (undefined!11997 Bool) (index!47134 (_ BitVec 32)) (x!128763 (_ BitVec 32))) (Undefined!11185) (MissingVacant!11185 (index!47135 (_ BitVec 32))) )
))
(declare-fun lt!627293 () SeekEntryResult!11185)

(declare-datatypes ((array!97165 0))(
  ( (array!97166 (arr!46900 (Array (_ BitVec 32) (_ BitVec 64))) (size!47450 (_ BitVec 32))) )
))
(declare-fun lt!627288 () array!97165)

(declare-fun x!605 () (_ BitVec 32))

(declare-fun lt!627289 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97165 (_ BitVec 32)) SeekEntryResult!11185)

(assert (=> b!1423839 (= res!959273 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!627289 lt!627288 mask!2608) lt!627293))))

(declare-fun res!959278 () Bool)

(declare-fun e!804752 () Bool)

(assert (=> start!122800 (=> (not res!959278) (not e!804752))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122800 (= res!959278 (validMask!0 mask!2608))))

(assert (=> start!122800 e!804752))

(assert (=> start!122800 true))

(declare-fun a!2831 () array!97165)

(declare-fun array_inv!35928 (array!97165) Bool)

(assert (=> start!122800 (array_inv!35928 a!2831)))

(declare-fun b!1423840 () Bool)

(declare-fun res!959280 () Bool)

(assert (=> b!1423840 (=> (not res!959280) (not e!804752))))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1423840 (= res!959280 (and (= (size!47450 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47450 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47450 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1423841 () Bool)

(declare-fun res!959277 () Bool)

(declare-fun e!804753 () Bool)

(assert (=> b!1423841 (=> res!959277 e!804753)))

(declare-fun lt!627294 () SeekEntryResult!11185)

(declare-fun lt!627292 () (_ BitVec 32))

(assert (=> b!1423841 (= res!959277 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!627292 (select (arr!46900 a!2831) j!81) a!2831 mask!2608) lt!627294)))))

(declare-fun b!1423842 () Bool)

(declare-fun e!804756 () Bool)

(assert (=> b!1423842 (= e!804752 e!804756)))

(declare-fun res!959279 () Bool)

(assert (=> b!1423842 (=> (not res!959279) (not e!804756))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1423842 (= res!959279 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46900 a!2831) j!81) mask!2608) (select (arr!46900 a!2831) j!81) a!2831 mask!2608) lt!627294))))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(assert (=> b!1423842 (= lt!627294 (Intermediate!11185 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1423843 () Bool)

(declare-fun res!959284 () Bool)

(assert (=> b!1423843 (=> (not res!959284) (not e!804752))))

(assert (=> b!1423843 (= res!959284 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47450 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47450 a!2831))))))

(declare-fun b!1423844 () Bool)

(declare-fun res!959272 () Bool)

(assert (=> b!1423844 (=> (not res!959272) (not e!804752))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1423844 (= res!959272 (validKeyInArray!0 (select (arr!46900 a!2831) j!81)))))

(declare-fun b!1423845 () Bool)

(declare-fun e!804755 () Bool)

(assert (=> b!1423845 (= e!804755 e!804753)))

(declare-fun res!959285 () Bool)

(assert (=> b!1423845 (=> res!959285 e!804753)))

(assert (=> b!1423845 (= res!959285 (or (bvslt (bvadd #b00000000000000000000000000000001 x!605) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!605) #b01111111111111111111111111111110) (bvslt lt!627292 #b00000000000000000000000000000000) (bvsge lt!627292 (size!47450 a!2831))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1423845 (= lt!627292 (nextIndex!0 index!585 x!605 mask!2608))))

(declare-fun b!1423846 () Bool)

(declare-fun res!959287 () Bool)

(assert (=> b!1423846 (=> (not res!959287) (not e!804757))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1423846 (= res!959287 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1423847 () Bool)

(assert (=> b!1423847 (= e!804757 (not e!804755))))

(declare-fun res!959282 () Bool)

(assert (=> b!1423847 (=> res!959282 e!804755)))

(assert (=> b!1423847 (= res!959282 (or (= (select (arr!46900 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46900 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46900 a!2831) index!585) (select (arr!46900 a!2831) j!81)) (= (select (store (arr!46900 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!804754 () Bool)

(assert (=> b!1423847 e!804754))

(declare-fun res!959283 () Bool)

(assert (=> b!1423847 (=> (not res!959283) (not e!804754))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97165 (_ BitVec 32)) Bool)

(assert (=> b!1423847 (= res!959283 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48206 0))(
  ( (Unit!48207) )
))
(declare-fun lt!627290 () Unit!48206)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97165 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48206)

(assert (=> b!1423847 (= lt!627290 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1423848 () Bool)

(declare-fun res!959274 () Bool)

(assert (=> b!1423848 (=> (not res!959274) (not e!804752))))

(assert (=> b!1423848 (= res!959274 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1423849 () Bool)

(declare-fun res!959286 () Bool)

(assert (=> b!1423849 (=> (not res!959286) (not e!804752))))

(declare-datatypes ((List!33410 0))(
  ( (Nil!33407) (Cons!33406 (h!34708 (_ BitVec 64)) (t!48104 List!33410)) )
))
(declare-fun arrayNoDuplicates!0 (array!97165 (_ BitVec 32) List!33410) Bool)

(assert (=> b!1423849 (= res!959286 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33407))))

(declare-fun b!1423850 () Bool)

(assert (=> b!1423850 (= e!804756 e!804757)))

(declare-fun res!959275 () Bool)

(assert (=> b!1423850 (=> (not res!959275) (not e!804757))))

(assert (=> b!1423850 (= res!959275 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!627289 mask!2608) lt!627289 lt!627288 mask!2608) lt!627293))))

(assert (=> b!1423850 (= lt!627293 (Intermediate!11185 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1423850 (= lt!627289 (select (store (arr!46900 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1423850 (= lt!627288 (array!97166 (store (arr!46900 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47450 a!2831)))))

(declare-fun b!1423851 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97165 (_ BitVec 32)) SeekEntryResult!11185)

(assert (=> b!1423851 (= e!804754 (= (seekEntryOrOpen!0 (select (arr!46900 a!2831) j!81) a!2831 mask!2608) (Found!11185 j!81)))))

(declare-fun b!1423852 () Bool)

(declare-fun res!959276 () Bool)

(assert (=> b!1423852 (=> (not res!959276) (not e!804757))))

(assert (=> b!1423852 (= res!959276 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46900 a!2831) j!81) a!2831 mask!2608) lt!627294))))

(declare-fun b!1423853 () Bool)

(assert (=> b!1423853 (= e!804753 true)))

(declare-fun lt!627291 () SeekEntryResult!11185)

(assert (=> b!1423853 (= lt!627291 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!627292 lt!627289 lt!627288 mask!2608))))

(declare-fun b!1423854 () Bool)

(declare-fun res!959281 () Bool)

(assert (=> b!1423854 (=> (not res!959281) (not e!804752))))

(assert (=> b!1423854 (= res!959281 (validKeyInArray!0 (select (arr!46900 a!2831) i!982)))))

(assert (= (and start!122800 res!959278) b!1423840))

(assert (= (and b!1423840 res!959280) b!1423854))

(assert (= (and b!1423854 res!959281) b!1423844))

(assert (= (and b!1423844 res!959272) b!1423848))

(assert (= (and b!1423848 res!959274) b!1423849))

(assert (= (and b!1423849 res!959286) b!1423843))

(assert (= (and b!1423843 res!959284) b!1423842))

(assert (= (and b!1423842 res!959279) b!1423850))

(assert (= (and b!1423850 res!959275) b!1423852))

(assert (= (and b!1423852 res!959276) b!1423839))

(assert (= (and b!1423839 res!959273) b!1423846))

(assert (= (and b!1423846 res!959287) b!1423847))

(assert (= (and b!1423847 res!959283) b!1423851))

(assert (= (and b!1423847 (not res!959282)) b!1423845))

(assert (= (and b!1423845 (not res!959285)) b!1423841))

(assert (= (and b!1423841 (not res!959277)) b!1423853))

(declare-fun m!1314387 () Bool)

(assert (=> b!1423849 m!1314387))

(declare-fun m!1314389 () Bool)

(assert (=> b!1423850 m!1314389))

(assert (=> b!1423850 m!1314389))

(declare-fun m!1314391 () Bool)

(assert (=> b!1423850 m!1314391))

(declare-fun m!1314393 () Bool)

(assert (=> b!1423850 m!1314393))

(declare-fun m!1314395 () Bool)

(assert (=> b!1423850 m!1314395))

(declare-fun m!1314397 () Bool)

(assert (=> b!1423854 m!1314397))

(assert (=> b!1423854 m!1314397))

(declare-fun m!1314399 () Bool)

(assert (=> b!1423854 m!1314399))

(declare-fun m!1314401 () Bool)

(assert (=> b!1423844 m!1314401))

(assert (=> b!1423844 m!1314401))

(declare-fun m!1314403 () Bool)

(assert (=> b!1423844 m!1314403))

(assert (=> b!1423841 m!1314401))

(assert (=> b!1423841 m!1314401))

(declare-fun m!1314405 () Bool)

(assert (=> b!1423841 m!1314405))

(declare-fun m!1314407 () Bool)

(assert (=> start!122800 m!1314407))

(declare-fun m!1314409 () Bool)

(assert (=> start!122800 m!1314409))

(assert (=> b!1423851 m!1314401))

(assert (=> b!1423851 m!1314401))

(declare-fun m!1314411 () Bool)

(assert (=> b!1423851 m!1314411))

(declare-fun m!1314413 () Bool)

(assert (=> b!1423853 m!1314413))

(assert (=> b!1423852 m!1314401))

(assert (=> b!1423852 m!1314401))

(declare-fun m!1314415 () Bool)

(assert (=> b!1423852 m!1314415))

(declare-fun m!1314417 () Bool)

(assert (=> b!1423845 m!1314417))

(assert (=> b!1423847 m!1314393))

(declare-fun m!1314419 () Bool)

(assert (=> b!1423847 m!1314419))

(declare-fun m!1314421 () Bool)

(assert (=> b!1423847 m!1314421))

(declare-fun m!1314423 () Bool)

(assert (=> b!1423847 m!1314423))

(assert (=> b!1423847 m!1314401))

(declare-fun m!1314425 () Bool)

(assert (=> b!1423847 m!1314425))

(assert (=> b!1423842 m!1314401))

(assert (=> b!1423842 m!1314401))

(declare-fun m!1314427 () Bool)

(assert (=> b!1423842 m!1314427))

(assert (=> b!1423842 m!1314427))

(assert (=> b!1423842 m!1314401))

(declare-fun m!1314429 () Bool)

(assert (=> b!1423842 m!1314429))

(declare-fun m!1314431 () Bool)

(assert (=> b!1423848 m!1314431))

(declare-fun m!1314433 () Bool)

(assert (=> b!1423839 m!1314433))

(push 1)

