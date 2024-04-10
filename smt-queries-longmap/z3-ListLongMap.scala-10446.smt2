; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122840 () Bool)

(assert start!122840)

(declare-fun b!1424799 () Bool)

(declare-fun res!960233 () Bool)

(declare-fun e!805175 () Bool)

(assert (=> b!1424799 (=> (not res!960233) (not e!805175))))

(declare-datatypes ((array!97205 0))(
  ( (array!97206 (arr!46920 (Array (_ BitVec 32) (_ BitVec 64))) (size!47470 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97205)

(declare-fun j!81 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1424799 (= res!960233 (validKeyInArray!0 (select (arr!46920 a!2831) j!81)))))

(declare-fun res!960238 () Bool)

(assert (=> start!122840 (=> (not res!960238) (not e!805175))))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122840 (= res!960238 (validMask!0 mask!2608))))

(assert (=> start!122840 e!805175))

(assert (=> start!122840 true))

(declare-fun array_inv!35948 (array!97205) Bool)

(assert (=> start!122840 (array_inv!35948 a!2831)))

(declare-fun b!1424800 () Bool)

(declare-fun res!960247 () Bool)

(assert (=> b!1424800 (=> (not res!960247) (not e!805175))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1424800 (= res!960247 (validKeyInArray!0 (select (arr!46920 a!2831) i!982)))))

(declare-fun b!1424801 () Bool)

(declare-fun res!960246 () Bool)

(assert (=> b!1424801 (=> (not res!960246) (not e!805175))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97205 (_ BitVec 32)) Bool)

(assert (=> b!1424801 (= res!960246 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1424802 () Bool)

(declare-fun res!960241 () Bool)

(declare-fun e!805176 () Bool)

(assert (=> b!1424802 (=> (not res!960241) (not e!805176))))

(declare-fun lt!627709 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!11205 0))(
  ( (MissingZero!11205 (index!47212 (_ BitVec 32))) (Found!11205 (index!47213 (_ BitVec 32))) (Intermediate!11205 (undefined!12017 Bool) (index!47214 (_ BitVec 32)) (x!128839 (_ BitVec 32))) (Undefined!11205) (MissingVacant!11205 (index!47215 (_ BitVec 32))) )
))
(declare-fun lt!627713 () SeekEntryResult!11205)

(declare-fun x!605 () (_ BitVec 32))

(declare-fun lt!627710 () array!97205)

(declare-fun index!585 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97205 (_ BitVec 32)) SeekEntryResult!11205)

(assert (=> b!1424802 (= res!960241 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!627709 lt!627710 mask!2608) lt!627713))))

(declare-fun b!1424803 () Bool)

(declare-fun res!960245 () Bool)

(assert (=> b!1424803 (=> (not res!960245) (not e!805176))))

(declare-fun lt!627708 () SeekEntryResult!11205)

(assert (=> b!1424803 (= res!960245 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46920 a!2831) j!81) a!2831 mask!2608) lt!627708))))

(declare-fun b!1424804 () Bool)

(declare-fun e!805173 () Bool)

(declare-fun e!805172 () Bool)

(assert (=> b!1424804 (= e!805173 e!805172)))

(declare-fun res!960234 () Bool)

(assert (=> b!1424804 (=> res!960234 e!805172)))

(declare-fun lt!627712 () (_ BitVec 32))

(assert (=> b!1424804 (= res!960234 (or (bvslt (bvadd #b00000000000000000000000000000001 x!605) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!605) #b01111111111111111111111111111110) (bvslt lt!627712 #b00000000000000000000000000000000) (bvsge lt!627712 (size!47470 a!2831))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1424804 (= lt!627712 (nextIndex!0 index!585 x!605 mask!2608))))

(declare-fun b!1424805 () Bool)

(declare-fun res!960240 () Bool)

(assert (=> b!1424805 (=> (not res!960240) (not e!805175))))

(assert (=> b!1424805 (= res!960240 (and (= (size!47470 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47470 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47470 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1424806 () Bool)

(declare-fun res!960232 () Bool)

(assert (=> b!1424806 (=> (not res!960232) (not e!805175))))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(assert (=> b!1424806 (= res!960232 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47470 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47470 a!2831))))))

(declare-fun b!1424807 () Bool)

(assert (=> b!1424807 (= e!805172 true)))

(declare-fun lt!627711 () SeekEntryResult!11205)

(assert (=> b!1424807 (= lt!627711 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!627712 lt!627709 lt!627710 mask!2608))))

(declare-fun b!1424808 () Bool)

(declare-fun e!805177 () Bool)

(assert (=> b!1424808 (= e!805175 e!805177)))

(declare-fun res!960237 () Bool)

(assert (=> b!1424808 (=> (not res!960237) (not e!805177))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1424808 (= res!960237 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46920 a!2831) j!81) mask!2608) (select (arr!46920 a!2831) j!81) a!2831 mask!2608) lt!627708))))

(assert (=> b!1424808 (= lt!627708 (Intermediate!11205 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1424809 () Bool)

(assert (=> b!1424809 (= e!805176 (not e!805173))))

(declare-fun res!960244 () Bool)

(assert (=> b!1424809 (=> res!960244 e!805173)))

(assert (=> b!1424809 (= res!960244 (or (= (select (arr!46920 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46920 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46920 a!2831) index!585) (select (arr!46920 a!2831) j!81)) (= (select (store (arr!46920 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!805174 () Bool)

(assert (=> b!1424809 e!805174))

(declare-fun res!960235 () Bool)

(assert (=> b!1424809 (=> (not res!960235) (not e!805174))))

(assert (=> b!1424809 (= res!960235 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48246 0))(
  ( (Unit!48247) )
))
(declare-fun lt!627714 () Unit!48246)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97205 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48246)

(assert (=> b!1424809 (= lt!627714 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1424810 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97205 (_ BitVec 32)) SeekEntryResult!11205)

(assert (=> b!1424810 (= e!805174 (= (seekEntryOrOpen!0 (select (arr!46920 a!2831) j!81) a!2831 mask!2608) (Found!11205 j!81)))))

(declare-fun b!1424811 () Bool)

(declare-fun res!960242 () Bool)

(assert (=> b!1424811 (=> res!960242 e!805172)))

(assert (=> b!1424811 (= res!960242 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!627712 (select (arr!46920 a!2831) j!81) a!2831 mask!2608) lt!627708)))))

(declare-fun b!1424812 () Bool)

(declare-fun res!960236 () Bool)

(assert (=> b!1424812 (=> (not res!960236) (not e!805175))))

(declare-datatypes ((List!33430 0))(
  ( (Nil!33427) (Cons!33426 (h!34728 (_ BitVec 64)) (t!48124 List!33430)) )
))
(declare-fun arrayNoDuplicates!0 (array!97205 (_ BitVec 32) List!33430) Bool)

(assert (=> b!1424812 (= res!960236 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33427))))

(declare-fun b!1424813 () Bool)

(assert (=> b!1424813 (= e!805177 e!805176)))

(declare-fun res!960243 () Bool)

(assert (=> b!1424813 (=> (not res!960243) (not e!805176))))

(assert (=> b!1424813 (= res!960243 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!627709 mask!2608) lt!627709 lt!627710 mask!2608) lt!627713))))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(assert (=> b!1424813 (= lt!627713 (Intermediate!11205 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1424813 (= lt!627709 (select (store (arr!46920 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1424813 (= lt!627710 (array!97206 (store (arr!46920 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47470 a!2831)))))

(declare-fun b!1424814 () Bool)

(declare-fun res!960239 () Bool)

(assert (=> b!1424814 (=> (not res!960239) (not e!805176))))

(assert (=> b!1424814 (= res!960239 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(assert (= (and start!122840 res!960238) b!1424805))

(assert (= (and b!1424805 res!960240) b!1424800))

(assert (= (and b!1424800 res!960247) b!1424799))

(assert (= (and b!1424799 res!960233) b!1424801))

(assert (= (and b!1424801 res!960246) b!1424812))

(assert (= (and b!1424812 res!960236) b!1424806))

(assert (= (and b!1424806 res!960232) b!1424808))

(assert (= (and b!1424808 res!960237) b!1424813))

(assert (= (and b!1424813 res!960243) b!1424803))

(assert (= (and b!1424803 res!960245) b!1424802))

(assert (= (and b!1424802 res!960241) b!1424814))

(assert (= (and b!1424814 res!960239) b!1424809))

(assert (= (and b!1424809 res!960235) b!1424810))

(assert (= (and b!1424809 (not res!960244)) b!1424804))

(assert (= (and b!1424804 (not res!960234)) b!1424811))

(assert (= (and b!1424811 (not res!960242)) b!1424807))

(declare-fun m!1315347 () Bool)

(assert (=> start!122840 m!1315347))

(declare-fun m!1315349 () Bool)

(assert (=> start!122840 m!1315349))

(declare-fun m!1315351 () Bool)

(assert (=> b!1424802 m!1315351))

(declare-fun m!1315353 () Bool)

(assert (=> b!1424811 m!1315353))

(assert (=> b!1424811 m!1315353))

(declare-fun m!1315355 () Bool)

(assert (=> b!1424811 m!1315355))

(declare-fun m!1315357 () Bool)

(assert (=> b!1424809 m!1315357))

(declare-fun m!1315359 () Bool)

(assert (=> b!1424809 m!1315359))

(declare-fun m!1315361 () Bool)

(assert (=> b!1424809 m!1315361))

(declare-fun m!1315363 () Bool)

(assert (=> b!1424809 m!1315363))

(assert (=> b!1424809 m!1315353))

(declare-fun m!1315365 () Bool)

(assert (=> b!1424809 m!1315365))

(declare-fun m!1315367 () Bool)

(assert (=> b!1424800 m!1315367))

(assert (=> b!1424800 m!1315367))

(declare-fun m!1315369 () Bool)

(assert (=> b!1424800 m!1315369))

(assert (=> b!1424799 m!1315353))

(assert (=> b!1424799 m!1315353))

(declare-fun m!1315371 () Bool)

(assert (=> b!1424799 m!1315371))

(declare-fun m!1315373 () Bool)

(assert (=> b!1424812 m!1315373))

(assert (=> b!1424810 m!1315353))

(assert (=> b!1424810 m!1315353))

(declare-fun m!1315375 () Bool)

(assert (=> b!1424810 m!1315375))

(assert (=> b!1424803 m!1315353))

(assert (=> b!1424803 m!1315353))

(declare-fun m!1315377 () Bool)

(assert (=> b!1424803 m!1315377))

(declare-fun m!1315379 () Bool)

(assert (=> b!1424804 m!1315379))

(declare-fun m!1315381 () Bool)

(assert (=> b!1424807 m!1315381))

(declare-fun m!1315383 () Bool)

(assert (=> b!1424801 m!1315383))

(declare-fun m!1315385 () Bool)

(assert (=> b!1424813 m!1315385))

(assert (=> b!1424813 m!1315385))

(declare-fun m!1315387 () Bool)

(assert (=> b!1424813 m!1315387))

(assert (=> b!1424813 m!1315357))

(declare-fun m!1315389 () Bool)

(assert (=> b!1424813 m!1315389))

(assert (=> b!1424808 m!1315353))

(assert (=> b!1424808 m!1315353))

(declare-fun m!1315391 () Bool)

(assert (=> b!1424808 m!1315391))

(assert (=> b!1424808 m!1315391))

(assert (=> b!1424808 m!1315353))

(declare-fun m!1315393 () Bool)

(assert (=> b!1424808 m!1315393))

(check-sat (not b!1424811) (not b!1424807) (not b!1424813) (not b!1424808) (not b!1424809) (not b!1424800) (not b!1424802) (not b!1424812) (not b!1424804) (not b!1424801) (not b!1424803) (not start!122840) (not b!1424810) (not b!1424799))
(check-sat)
