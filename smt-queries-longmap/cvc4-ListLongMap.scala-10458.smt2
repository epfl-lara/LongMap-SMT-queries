; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122914 () Bool)

(assert start!122914)

(declare-fun b!1425699 () Bool)

(declare-fun res!961141 () Bool)

(declare-fun e!805431 () Bool)

(assert (=> b!1425699 (=> (not res!961141) (not e!805431))))

(declare-datatypes ((array!97279 0))(
  ( (array!97280 (arr!46957 (Array (_ BitVec 32) (_ BitVec 64))) (size!47507 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97279)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97279 (_ BitVec 32)) Bool)

(assert (=> b!1425699 (= res!961141 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1425700 () Bool)

(declare-fun res!961134 () Bool)

(assert (=> b!1425700 (=> (not res!961134) (not e!805431))))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1425700 (= res!961134 (and (= (size!47507 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47507 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47507 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1425701 () Bool)

(declare-fun res!961133 () Bool)

(assert (=> b!1425701 (=> (not res!961133) (not e!805431))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1425701 (= res!961133 (validKeyInArray!0 (select (arr!46957 a!2831) i!982)))))

(declare-fun b!1425702 () Bool)

(declare-fun res!961135 () Bool)

(assert (=> b!1425702 (=> (not res!961135) (not e!805431))))

(assert (=> b!1425702 (= res!961135 (validKeyInArray!0 (select (arr!46957 a!2831) j!81)))))

(declare-fun b!1425703 () Bool)

(declare-fun e!805432 () Bool)

(declare-fun e!805433 () Bool)

(assert (=> b!1425703 (= e!805432 e!805433)))

(declare-fun res!961139 () Bool)

(assert (=> b!1425703 (=> (not res!961139) (not e!805433))))

(declare-fun lt!627869 () array!97279)

(declare-fun lt!627868 () (_ BitVec 64))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(declare-datatypes ((SeekEntryResult!11236 0))(
  ( (MissingZero!11236 (index!47336 (_ BitVec 32))) (Found!11236 (index!47337 (_ BitVec 32))) (Intermediate!11236 (undefined!12048 Bool) (index!47338 (_ BitVec 32)) (x!128966 (_ BitVec 32))) (Undefined!11236) (MissingVacant!11236 (index!47339 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97279 (_ BitVec 32)) SeekEntryResult!11236)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1425703 (= res!961139 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!627868 mask!2608) lt!627868 lt!627869 mask!2608) (Intermediate!11236 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13)))))

(assert (=> b!1425703 (= lt!627868 (select (store (arr!46957 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1425703 (= lt!627869 (array!97280 (store (arr!46957 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47507 a!2831)))))

(declare-fun b!1425704 () Bool)

(assert (=> b!1425704 (= e!805433 false)))

(declare-fun lt!627870 () SeekEntryResult!11236)

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1425704 (= lt!627870 (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!627868 lt!627869 mask!2608))))

(declare-fun b!1425705 () Bool)

(assert (=> b!1425705 (= e!805431 e!805432)))

(declare-fun res!961137 () Bool)

(assert (=> b!1425705 (=> (not res!961137) (not e!805432))))

(declare-fun lt!627867 () SeekEntryResult!11236)

(assert (=> b!1425705 (= res!961137 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46957 a!2831) j!81) mask!2608) (select (arr!46957 a!2831) j!81) a!2831 mask!2608) lt!627867))))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(assert (=> b!1425705 (= lt!627867 (Intermediate!11236 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun res!961136 () Bool)

(assert (=> start!122914 (=> (not res!961136) (not e!805431))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122914 (= res!961136 (validMask!0 mask!2608))))

(assert (=> start!122914 e!805431))

(assert (=> start!122914 true))

(declare-fun array_inv!35985 (array!97279) Bool)

(assert (=> start!122914 (array_inv!35985 a!2831)))

(declare-fun b!1425706 () Bool)

(declare-fun res!961132 () Bool)

(assert (=> b!1425706 (=> (not res!961132) (not e!805431))))

(declare-datatypes ((List!33467 0))(
  ( (Nil!33464) (Cons!33463 (h!34765 (_ BitVec 64)) (t!48161 List!33467)) )
))
(declare-fun arrayNoDuplicates!0 (array!97279 (_ BitVec 32) List!33467) Bool)

(assert (=> b!1425706 (= res!961132 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33464))))

(declare-fun b!1425707 () Bool)

(declare-fun res!961140 () Bool)

(assert (=> b!1425707 (=> (not res!961140) (not e!805433))))

(assert (=> b!1425707 (= res!961140 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46957 a!2831) j!81) a!2831 mask!2608) lt!627867))))

(declare-fun b!1425708 () Bool)

(declare-fun res!961138 () Bool)

(assert (=> b!1425708 (=> (not res!961138) (not e!805431))))

(assert (=> b!1425708 (= res!961138 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47507 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47507 a!2831))))))

(assert (= (and start!122914 res!961136) b!1425700))

(assert (= (and b!1425700 res!961134) b!1425701))

(assert (= (and b!1425701 res!961133) b!1425702))

(assert (= (and b!1425702 res!961135) b!1425699))

(assert (= (and b!1425699 res!961141) b!1425706))

(assert (= (and b!1425706 res!961132) b!1425708))

(assert (= (and b!1425708 res!961138) b!1425705))

(assert (= (and b!1425705 res!961137) b!1425703))

(assert (= (and b!1425703 res!961139) b!1425707))

(assert (= (and b!1425707 res!961140) b!1425704))

(declare-fun m!1316299 () Bool)

(assert (=> b!1425706 m!1316299))

(declare-fun m!1316301 () Bool)

(assert (=> b!1425701 m!1316301))

(assert (=> b!1425701 m!1316301))

(declare-fun m!1316303 () Bool)

(assert (=> b!1425701 m!1316303))

(declare-fun m!1316305 () Bool)

(assert (=> start!122914 m!1316305))

(declare-fun m!1316307 () Bool)

(assert (=> start!122914 m!1316307))

(declare-fun m!1316309 () Bool)

(assert (=> b!1425705 m!1316309))

(assert (=> b!1425705 m!1316309))

(declare-fun m!1316311 () Bool)

(assert (=> b!1425705 m!1316311))

(assert (=> b!1425705 m!1316311))

(assert (=> b!1425705 m!1316309))

(declare-fun m!1316313 () Bool)

(assert (=> b!1425705 m!1316313))

(declare-fun m!1316315 () Bool)

(assert (=> b!1425703 m!1316315))

(assert (=> b!1425703 m!1316315))

(declare-fun m!1316317 () Bool)

(assert (=> b!1425703 m!1316317))

(declare-fun m!1316319 () Bool)

(assert (=> b!1425703 m!1316319))

(declare-fun m!1316321 () Bool)

(assert (=> b!1425703 m!1316321))

(declare-fun m!1316323 () Bool)

(assert (=> b!1425699 m!1316323))

(declare-fun m!1316325 () Bool)

(assert (=> b!1425704 m!1316325))

(assert (=> b!1425702 m!1316309))

(assert (=> b!1425702 m!1316309))

(declare-fun m!1316327 () Bool)

(assert (=> b!1425702 m!1316327))

(assert (=> b!1425707 m!1316309))

(assert (=> b!1425707 m!1316309))

(declare-fun m!1316329 () Bool)

(assert (=> b!1425707 m!1316329))

(push 1)

(assert (not b!1425704))

