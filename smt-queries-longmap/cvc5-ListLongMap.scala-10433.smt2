; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122760 () Bool)

(assert start!122760)

(declare-fun b!1422879 () Bool)

(declare-fun e!804336 () Bool)

(declare-fun e!804333 () Bool)

(assert (=> b!1422879 (= e!804336 (not e!804333))))

(declare-fun res!958323 () Bool)

(assert (=> b!1422879 (=> res!958323 e!804333)))

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((array!97125 0))(
  ( (array!97126 (arr!46880 (Array (_ BitVec 32) (_ BitVec 64))) (size!47430 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97125)

(declare-fun index!585 () (_ BitVec 32))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1422879 (= res!958323 (or (= (select (arr!46880 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46880 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46880 a!2831) index!585) (select (arr!46880 a!2831) j!81)) (= (select (store (arr!46880 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!804338 () Bool)

(assert (=> b!1422879 e!804338))

(declare-fun res!958312 () Bool)

(assert (=> b!1422879 (=> (not res!958312) (not e!804338))))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97125 (_ BitVec 32)) Bool)

(assert (=> b!1422879 (= res!958312 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48166 0))(
  ( (Unit!48167) )
))
(declare-fun lt!626872 () Unit!48166)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97125 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48166)

(assert (=> b!1422879 (= lt!626872 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1422880 () Bool)

(declare-fun res!958327 () Bool)

(declare-fun e!804335 () Bool)

(assert (=> b!1422880 (=> (not res!958327) (not e!804335))))

(assert (=> b!1422880 (= res!958327 (and (= (size!47430 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47430 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47430 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1422881 () Bool)

(declare-fun e!804337 () Bool)

(assert (=> b!1422881 (= e!804337 true)))

(declare-fun lt!626868 () array!97125)

(declare-fun lt!626869 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!11165 0))(
  ( (MissingZero!11165 (index!47052 (_ BitVec 32))) (Found!11165 (index!47053 (_ BitVec 32))) (Intermediate!11165 (undefined!11977 Bool) (index!47054 (_ BitVec 32)) (x!128695 (_ BitVec 32))) (Undefined!11165) (MissingVacant!11165 (index!47055 (_ BitVec 32))) )
))
(declare-fun lt!626870 () SeekEntryResult!11165)

(declare-fun x!605 () (_ BitVec 32))

(declare-fun lt!626871 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97125 (_ BitVec 32)) SeekEntryResult!11165)

(assert (=> b!1422881 (= lt!626870 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!626871 lt!626869 lt!626868 mask!2608))))

(declare-fun b!1422882 () Bool)

(declare-fun e!804332 () Bool)

(assert (=> b!1422882 (= e!804335 e!804332)))

(declare-fun res!958319 () Bool)

(assert (=> b!1422882 (=> (not res!958319) (not e!804332))))

(declare-fun lt!626874 () SeekEntryResult!11165)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1422882 (= res!958319 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46880 a!2831) j!81) mask!2608) (select (arr!46880 a!2831) j!81) a!2831 mask!2608) lt!626874))))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(assert (=> b!1422882 (= lt!626874 (Intermediate!11165 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1422883 () Bool)

(declare-fun res!958321 () Bool)

(assert (=> b!1422883 (=> (not res!958321) (not e!804336))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1422883 (= res!958321 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1422884 () Bool)

(declare-fun res!958318 () Bool)

(assert (=> b!1422884 (=> (not res!958318) (not e!804335))))

(assert (=> b!1422884 (= res!958318 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47430 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47430 a!2831))))))

(declare-fun b!1422886 () Bool)

(declare-fun res!958315 () Bool)

(assert (=> b!1422886 (=> (not res!958315) (not e!804336))))

(declare-fun lt!626873 () SeekEntryResult!11165)

(assert (=> b!1422886 (= res!958315 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!626869 lt!626868 mask!2608) lt!626873))))

(declare-fun b!1422887 () Bool)

(assert (=> b!1422887 (= e!804332 e!804336)))

(declare-fun res!958317 () Bool)

(assert (=> b!1422887 (=> (not res!958317) (not e!804336))))

(assert (=> b!1422887 (= res!958317 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!626869 mask!2608) lt!626869 lt!626868 mask!2608) lt!626873))))

(assert (=> b!1422887 (= lt!626873 (Intermediate!11165 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1422887 (= lt!626869 (select (store (arr!46880 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1422887 (= lt!626868 (array!97126 (store (arr!46880 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47430 a!2831)))))

(declare-fun b!1422888 () Bool)

(declare-fun res!958326 () Bool)

(assert (=> b!1422888 (=> (not res!958326) (not e!804335))))

(declare-datatypes ((List!33390 0))(
  ( (Nil!33387) (Cons!33386 (h!34688 (_ BitVec 64)) (t!48084 List!33390)) )
))
(declare-fun arrayNoDuplicates!0 (array!97125 (_ BitVec 32) List!33390) Bool)

(assert (=> b!1422888 (= res!958326 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33387))))

(declare-fun b!1422889 () Bool)

(declare-fun res!958325 () Bool)

(assert (=> b!1422889 (=> (not res!958325) (not e!804336))))

(assert (=> b!1422889 (= res!958325 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46880 a!2831) j!81) a!2831 mask!2608) lt!626874))))

(declare-fun b!1422890 () Bool)

(declare-fun res!958314 () Bool)

(assert (=> b!1422890 (=> res!958314 e!804337)))

(assert (=> b!1422890 (= res!958314 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!626871 (select (arr!46880 a!2831) j!81) a!2831 mask!2608) lt!626874)))))

(declare-fun b!1422891 () Bool)

(assert (=> b!1422891 (= e!804333 e!804337)))

(declare-fun res!958316 () Bool)

(assert (=> b!1422891 (=> res!958316 e!804337)))

(assert (=> b!1422891 (= res!958316 (or (bvslt (bvadd #b00000000000000000000000000000001 x!605) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!605) #b01111111111111111111111111111110) (bvslt lt!626871 #b00000000000000000000000000000000) (bvsge lt!626871 (size!47430 a!2831))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1422891 (= lt!626871 (nextIndex!0 index!585 x!605 mask!2608))))

(declare-fun b!1422892 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97125 (_ BitVec 32)) SeekEntryResult!11165)

(assert (=> b!1422892 (= e!804338 (= (seekEntryOrOpen!0 (select (arr!46880 a!2831) j!81) a!2831 mask!2608) (Found!11165 j!81)))))

(declare-fun res!958322 () Bool)

(assert (=> start!122760 (=> (not res!958322) (not e!804335))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122760 (= res!958322 (validMask!0 mask!2608))))

(assert (=> start!122760 e!804335))

(assert (=> start!122760 true))

(declare-fun array_inv!35908 (array!97125) Bool)

(assert (=> start!122760 (array_inv!35908 a!2831)))

(declare-fun b!1422885 () Bool)

(declare-fun res!958324 () Bool)

(assert (=> b!1422885 (=> (not res!958324) (not e!804335))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1422885 (= res!958324 (validKeyInArray!0 (select (arr!46880 a!2831) j!81)))))

(declare-fun b!1422893 () Bool)

(declare-fun res!958313 () Bool)

(assert (=> b!1422893 (=> (not res!958313) (not e!804335))))

(assert (=> b!1422893 (= res!958313 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1422894 () Bool)

(declare-fun res!958320 () Bool)

(assert (=> b!1422894 (=> (not res!958320) (not e!804335))))

(assert (=> b!1422894 (= res!958320 (validKeyInArray!0 (select (arr!46880 a!2831) i!982)))))

(assert (= (and start!122760 res!958322) b!1422880))

(assert (= (and b!1422880 res!958327) b!1422894))

(assert (= (and b!1422894 res!958320) b!1422885))

(assert (= (and b!1422885 res!958324) b!1422893))

(assert (= (and b!1422893 res!958313) b!1422888))

(assert (= (and b!1422888 res!958326) b!1422884))

(assert (= (and b!1422884 res!958318) b!1422882))

(assert (= (and b!1422882 res!958319) b!1422887))

(assert (= (and b!1422887 res!958317) b!1422889))

(assert (= (and b!1422889 res!958325) b!1422886))

(assert (= (and b!1422886 res!958315) b!1422883))

(assert (= (and b!1422883 res!958321) b!1422879))

(assert (= (and b!1422879 res!958312) b!1422892))

(assert (= (and b!1422879 (not res!958323)) b!1422891))

(assert (= (and b!1422891 (not res!958316)) b!1422890))

(assert (= (and b!1422890 (not res!958314)) b!1422881))

(declare-fun m!1313427 () Bool)

(assert (=> b!1422893 m!1313427))

(declare-fun m!1313429 () Bool)

(assert (=> b!1422890 m!1313429))

(assert (=> b!1422890 m!1313429))

(declare-fun m!1313431 () Bool)

(assert (=> b!1422890 m!1313431))

(declare-fun m!1313433 () Bool)

(assert (=> start!122760 m!1313433))

(declare-fun m!1313435 () Bool)

(assert (=> start!122760 m!1313435))

(declare-fun m!1313437 () Bool)

(assert (=> b!1422879 m!1313437))

(declare-fun m!1313439 () Bool)

(assert (=> b!1422879 m!1313439))

(declare-fun m!1313441 () Bool)

(assert (=> b!1422879 m!1313441))

(declare-fun m!1313443 () Bool)

(assert (=> b!1422879 m!1313443))

(assert (=> b!1422879 m!1313429))

(declare-fun m!1313445 () Bool)

(assert (=> b!1422879 m!1313445))

(assert (=> b!1422882 m!1313429))

(assert (=> b!1422882 m!1313429))

(declare-fun m!1313447 () Bool)

(assert (=> b!1422882 m!1313447))

(assert (=> b!1422882 m!1313447))

(assert (=> b!1422882 m!1313429))

(declare-fun m!1313449 () Bool)

(assert (=> b!1422882 m!1313449))

(declare-fun m!1313451 () Bool)

(assert (=> b!1422887 m!1313451))

(assert (=> b!1422887 m!1313451))

(declare-fun m!1313453 () Bool)

(assert (=> b!1422887 m!1313453))

(assert (=> b!1422887 m!1313437))

(declare-fun m!1313455 () Bool)

(assert (=> b!1422887 m!1313455))

(declare-fun m!1313457 () Bool)

(assert (=> b!1422881 m!1313457))

(declare-fun m!1313459 () Bool)

(assert (=> b!1422894 m!1313459))

(assert (=> b!1422894 m!1313459))

(declare-fun m!1313461 () Bool)

(assert (=> b!1422894 m!1313461))

(declare-fun m!1313463 () Bool)

(assert (=> b!1422886 m!1313463))

(assert (=> b!1422892 m!1313429))

(assert (=> b!1422892 m!1313429))

(declare-fun m!1313465 () Bool)

(assert (=> b!1422892 m!1313465))

(assert (=> b!1422885 m!1313429))

(assert (=> b!1422885 m!1313429))

(declare-fun m!1313467 () Bool)

(assert (=> b!1422885 m!1313467))

(declare-fun m!1313469 () Bool)

(assert (=> b!1422888 m!1313469))

(assert (=> b!1422889 m!1313429))

(assert (=> b!1422889 m!1313429))

(declare-fun m!1313471 () Bool)

(assert (=> b!1422889 m!1313471))

(declare-fun m!1313473 () Bool)

(assert (=> b!1422891 m!1313473))

(push 1)

