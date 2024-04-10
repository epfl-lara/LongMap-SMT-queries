; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122738 () Bool)

(assert start!122738)

(declare-fun b!1422351 () Bool)

(declare-fun res!957794 () Bool)

(declare-fun e!804104 () Bool)

(assert (=> b!1422351 (=> (not res!957794) (not e!804104))))

(declare-datatypes ((SeekEntryResult!11154 0))(
  ( (MissingZero!11154 (index!47008 (_ BitVec 32))) (Found!11154 (index!47009 (_ BitVec 32))) (Intermediate!11154 (undefined!11966 Bool) (index!47010 (_ BitVec 32)) (x!128652 (_ BitVec 32))) (Undefined!11154) (MissingVacant!11154 (index!47011 (_ BitVec 32))) )
))
(declare-fun lt!626639 () SeekEntryResult!11154)

(declare-fun x!605 () (_ BitVec 32))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-datatypes ((array!97103 0))(
  ( (array!97104 (arr!46869 (Array (_ BitVec 32) (_ BitVec 64))) (size!47419 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97103)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97103 (_ BitVec 32)) SeekEntryResult!11154)

(assert (=> b!1422351 (= res!957794 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46869 a!2831) j!81) a!2831 mask!2608) lt!626639))))

(declare-fun b!1422352 () Bool)

(declare-fun res!957795 () Bool)

(declare-fun e!804101 () Bool)

(assert (=> b!1422352 (=> (not res!957795) (not e!804101))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1422352 (= res!957795 (and (= (size!47419 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47419 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47419 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1422353 () Bool)

(declare-fun res!957786 () Bool)

(assert (=> b!1422353 (=> (not res!957786) (not e!804101))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97103 (_ BitVec 32)) Bool)

(assert (=> b!1422353 (= res!957786 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1422354 () Bool)

(declare-fun res!957792 () Bool)

(declare-fun e!804102 () Bool)

(assert (=> b!1422354 (=> res!957792 e!804102)))

(declare-fun lt!626642 () (_ BitVec 32))

(assert (=> b!1422354 (= res!957792 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!626642 (select (arr!46869 a!2831) j!81) a!2831 mask!2608) lt!626639)))))

(declare-fun b!1422355 () Bool)

(declare-fun e!804106 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97103 (_ BitVec 32)) SeekEntryResult!11154)

(assert (=> b!1422355 (= e!804106 (= (seekEntryOrOpen!0 (select (arr!46869 a!2831) j!81) a!2831 mask!2608) (Found!11154 j!81)))))

(declare-fun res!957789 () Bool)

(assert (=> start!122738 (=> (not res!957789) (not e!804101))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122738 (= res!957789 (validMask!0 mask!2608))))

(assert (=> start!122738 e!804101))

(assert (=> start!122738 true))

(declare-fun array_inv!35897 (array!97103) Bool)

(assert (=> start!122738 (array_inv!35897 a!2831)))

(declare-fun b!1422356 () Bool)

(declare-fun res!957791 () Bool)

(assert (=> b!1422356 (=> (not res!957791) (not e!804101))))

(declare-datatypes ((List!33379 0))(
  ( (Nil!33376) (Cons!33375 (h!34677 (_ BitVec 64)) (t!48073 List!33379)) )
))
(declare-fun arrayNoDuplicates!0 (array!97103 (_ BitVec 32) List!33379) Bool)

(assert (=> b!1422356 (= res!957791 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33376))))

(declare-fun b!1422357 () Bool)

(assert (=> b!1422357 (= e!804102 true)))

(declare-fun lt!626637 () SeekEntryResult!11154)

(declare-fun lt!626641 () (_ BitVec 64))

(declare-fun lt!626638 () array!97103)

(assert (=> b!1422357 (= lt!626637 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!626642 lt!626641 lt!626638 mask!2608))))

(declare-fun b!1422358 () Bool)

(declare-fun res!957787 () Bool)

(assert (=> b!1422358 (=> (not res!957787) (not e!804104))))

(declare-fun lt!626640 () SeekEntryResult!11154)

(assert (=> b!1422358 (= res!957787 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!626641 lt!626638 mask!2608) lt!626640))))

(declare-fun b!1422359 () Bool)

(declare-fun e!804105 () Bool)

(assert (=> b!1422359 (= e!804101 e!804105)))

(declare-fun res!957796 () Bool)

(assert (=> b!1422359 (=> (not res!957796) (not e!804105))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1422359 (= res!957796 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46869 a!2831) j!81) mask!2608) (select (arr!46869 a!2831) j!81) a!2831 mask!2608) lt!626639))))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(assert (=> b!1422359 (= lt!626639 (Intermediate!11154 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1422360 () Bool)

(declare-fun e!804107 () Bool)

(assert (=> b!1422360 (= e!804104 (not e!804107))))

(declare-fun res!957797 () Bool)

(assert (=> b!1422360 (=> res!957797 e!804107)))

(assert (=> b!1422360 (= res!957797 (or (= (select (arr!46869 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46869 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46869 a!2831) index!585) (select (arr!46869 a!2831) j!81)) (= (select (store (arr!46869 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1422360 e!804106))

(declare-fun res!957798 () Bool)

(assert (=> b!1422360 (=> (not res!957798) (not e!804106))))

(assert (=> b!1422360 (= res!957798 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48144 0))(
  ( (Unit!48145) )
))
(declare-fun lt!626643 () Unit!48144)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97103 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48144)

(assert (=> b!1422360 (= lt!626643 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1422361 () Bool)

(declare-fun res!957784 () Bool)

(assert (=> b!1422361 (=> (not res!957784) (not e!804104))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1422361 (= res!957784 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1422362 () Bool)

(assert (=> b!1422362 (= e!804107 e!804102)))

(declare-fun res!957788 () Bool)

(assert (=> b!1422362 (=> res!957788 e!804102)))

(assert (=> b!1422362 (= res!957788 (or (bvslt (bvadd #b00000000000000000000000000000001 x!605) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!605) #b01111111111111111111111111111110) (bvslt lt!626642 #b00000000000000000000000000000000) (bvsge lt!626642 (size!47419 a!2831))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1422362 (= lt!626642 (nextIndex!0 index!585 x!605 mask!2608))))

(declare-fun b!1422363 () Bool)

(declare-fun res!957799 () Bool)

(assert (=> b!1422363 (=> (not res!957799) (not e!804101))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1422363 (= res!957799 (validKeyInArray!0 (select (arr!46869 a!2831) i!982)))))

(declare-fun b!1422364 () Bool)

(declare-fun res!957790 () Bool)

(assert (=> b!1422364 (=> (not res!957790) (not e!804101))))

(assert (=> b!1422364 (= res!957790 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47419 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47419 a!2831))))))

(declare-fun b!1422365 () Bool)

(assert (=> b!1422365 (= e!804105 e!804104)))

(declare-fun res!957785 () Bool)

(assert (=> b!1422365 (=> (not res!957785) (not e!804104))))

(assert (=> b!1422365 (= res!957785 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!626641 mask!2608) lt!626641 lt!626638 mask!2608) lt!626640))))

(assert (=> b!1422365 (= lt!626640 (Intermediate!11154 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1422365 (= lt!626641 (select (store (arr!46869 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1422365 (= lt!626638 (array!97104 (store (arr!46869 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47419 a!2831)))))

(declare-fun b!1422366 () Bool)

(declare-fun res!957793 () Bool)

(assert (=> b!1422366 (=> (not res!957793) (not e!804101))))

(assert (=> b!1422366 (= res!957793 (validKeyInArray!0 (select (arr!46869 a!2831) j!81)))))

(assert (= (and start!122738 res!957789) b!1422352))

(assert (= (and b!1422352 res!957795) b!1422363))

(assert (= (and b!1422363 res!957799) b!1422366))

(assert (= (and b!1422366 res!957793) b!1422353))

(assert (= (and b!1422353 res!957786) b!1422356))

(assert (= (and b!1422356 res!957791) b!1422364))

(assert (= (and b!1422364 res!957790) b!1422359))

(assert (= (and b!1422359 res!957796) b!1422365))

(assert (= (and b!1422365 res!957785) b!1422351))

(assert (= (and b!1422351 res!957794) b!1422358))

(assert (= (and b!1422358 res!957787) b!1422361))

(assert (= (and b!1422361 res!957784) b!1422360))

(assert (= (and b!1422360 res!957798) b!1422355))

(assert (= (and b!1422360 (not res!957797)) b!1422362))

(assert (= (and b!1422362 (not res!957788)) b!1422354))

(assert (= (and b!1422354 (not res!957792)) b!1422357))

(declare-fun m!1312899 () Bool)

(assert (=> b!1422366 m!1312899))

(assert (=> b!1422366 m!1312899))

(declare-fun m!1312901 () Bool)

(assert (=> b!1422366 m!1312901))

(declare-fun m!1312903 () Bool)

(assert (=> b!1422365 m!1312903))

(assert (=> b!1422365 m!1312903))

(declare-fun m!1312905 () Bool)

(assert (=> b!1422365 m!1312905))

(declare-fun m!1312907 () Bool)

(assert (=> b!1422365 m!1312907))

(declare-fun m!1312909 () Bool)

(assert (=> b!1422365 m!1312909))

(assert (=> b!1422360 m!1312907))

(declare-fun m!1312911 () Bool)

(assert (=> b!1422360 m!1312911))

(declare-fun m!1312913 () Bool)

(assert (=> b!1422360 m!1312913))

(declare-fun m!1312915 () Bool)

(assert (=> b!1422360 m!1312915))

(assert (=> b!1422360 m!1312899))

(declare-fun m!1312917 () Bool)

(assert (=> b!1422360 m!1312917))

(assert (=> b!1422355 m!1312899))

(assert (=> b!1422355 m!1312899))

(declare-fun m!1312919 () Bool)

(assert (=> b!1422355 m!1312919))

(declare-fun m!1312921 () Bool)

(assert (=> b!1422362 m!1312921))

(declare-fun m!1312923 () Bool)

(assert (=> b!1422356 m!1312923))

(declare-fun m!1312925 () Bool)

(assert (=> b!1422358 m!1312925))

(declare-fun m!1312927 () Bool)

(assert (=> start!122738 m!1312927))

(declare-fun m!1312929 () Bool)

(assert (=> start!122738 m!1312929))

(declare-fun m!1312931 () Bool)

(assert (=> b!1422353 m!1312931))

(declare-fun m!1312933 () Bool)

(assert (=> b!1422363 m!1312933))

(assert (=> b!1422363 m!1312933))

(declare-fun m!1312935 () Bool)

(assert (=> b!1422363 m!1312935))

(assert (=> b!1422359 m!1312899))

(assert (=> b!1422359 m!1312899))

(declare-fun m!1312937 () Bool)

(assert (=> b!1422359 m!1312937))

(assert (=> b!1422359 m!1312937))

(assert (=> b!1422359 m!1312899))

(declare-fun m!1312939 () Bool)

(assert (=> b!1422359 m!1312939))

(assert (=> b!1422351 m!1312899))

(assert (=> b!1422351 m!1312899))

(declare-fun m!1312941 () Bool)

(assert (=> b!1422351 m!1312941))

(declare-fun m!1312943 () Bool)

(assert (=> b!1422357 m!1312943))

(assert (=> b!1422354 m!1312899))

(assert (=> b!1422354 m!1312899))

(declare-fun m!1312945 () Bool)

(assert (=> b!1422354 m!1312945))

(check-sat (not b!1422360) (not b!1422356) (not b!1422359) (not b!1422351) (not b!1422353) (not b!1422357) (not b!1422354) (not start!122738) (not b!1422355) (not b!1422358) (not b!1422365) (not b!1422363) (not b!1422366) (not b!1422362))
(check-sat)
