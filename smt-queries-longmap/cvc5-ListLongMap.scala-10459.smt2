; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122916 () Bool)

(assert start!122916)

(declare-fun b!1425730 () Bool)

(declare-fun e!805444 () Bool)

(declare-fun e!805443 () Bool)

(assert (=> b!1425730 (= e!805444 e!805443)))

(declare-fun res!961166 () Bool)

(assert (=> b!1425730 (=> (not res!961166) (not e!805443))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-datatypes ((array!97281 0))(
  ( (array!97282 (arr!46958 (Array (_ BitVec 32) (_ BitVec 64))) (size!47508 (_ BitVec 32))) )
))
(declare-fun lt!627882 () array!97281)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(declare-fun lt!627880 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!11237 0))(
  ( (MissingZero!11237 (index!47340 (_ BitVec 32))) (Found!11237 (index!47341 (_ BitVec 32))) (Intermediate!11237 (undefined!12049 Bool) (index!47342 (_ BitVec 32)) (x!128975 (_ BitVec 32))) (Undefined!11237) (MissingVacant!11237 (index!47343 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97281 (_ BitVec 32)) SeekEntryResult!11237)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1425730 (= res!961166 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!627880 mask!2608) lt!627880 lt!627882 mask!2608) (Intermediate!11237 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13)))))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun a!2831 () array!97281)

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1425730 (= lt!627880 (select (store (arr!46958 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1425730 (= lt!627882 (array!97282 (store (arr!46958 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47508 a!2831)))))

(declare-fun b!1425731 () Bool)

(declare-fun res!961162 () Bool)

(declare-fun e!805442 () Bool)

(assert (=> b!1425731 (=> (not res!961162) (not e!805442))))

(declare-datatypes ((List!33468 0))(
  ( (Nil!33465) (Cons!33464 (h!34766 (_ BitVec 64)) (t!48162 List!33468)) )
))
(declare-fun arrayNoDuplicates!0 (array!97281 (_ BitVec 32) List!33468) Bool)

(assert (=> b!1425731 (= res!961162 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33465))))

(declare-fun b!1425732 () Bool)

(declare-fun res!961168 () Bool)

(assert (=> b!1425732 (=> (not res!961168) (not e!805442))))

(assert (=> b!1425732 (= res!961168 (and (= (size!47508 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47508 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47508 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1425733 () Bool)

(assert (=> b!1425733 (= e!805443 false)))

(declare-fun lt!627881 () SeekEntryResult!11237)

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1425733 (= lt!627881 (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!627880 lt!627882 mask!2608))))

(declare-fun b!1425734 () Bool)

(declare-fun res!961163 () Bool)

(assert (=> b!1425734 (=> (not res!961163) (not e!805442))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97281 (_ BitVec 32)) Bool)

(assert (=> b!1425734 (= res!961163 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1425735 () Bool)

(declare-fun res!961164 () Bool)

(assert (=> b!1425735 (=> (not res!961164) (not e!805443))))

(declare-fun lt!627879 () SeekEntryResult!11237)

(assert (=> b!1425735 (= res!961164 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46958 a!2831) j!81) a!2831 mask!2608) lt!627879))))

(declare-fun b!1425736 () Bool)

(declare-fun res!961171 () Bool)

(assert (=> b!1425736 (=> (not res!961171) (not e!805442))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1425736 (= res!961171 (validKeyInArray!0 (select (arr!46958 a!2831) i!982)))))

(declare-fun b!1425729 () Bool)

(assert (=> b!1425729 (= e!805442 e!805444)))

(declare-fun res!961165 () Bool)

(assert (=> b!1425729 (=> (not res!961165) (not e!805444))))

(assert (=> b!1425729 (= res!961165 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46958 a!2831) j!81) mask!2608) (select (arr!46958 a!2831) j!81) a!2831 mask!2608) lt!627879))))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(assert (=> b!1425729 (= lt!627879 (Intermediate!11237 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun res!961170 () Bool)

(assert (=> start!122916 (=> (not res!961170) (not e!805442))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122916 (= res!961170 (validMask!0 mask!2608))))

(assert (=> start!122916 e!805442))

(assert (=> start!122916 true))

(declare-fun array_inv!35986 (array!97281) Bool)

(assert (=> start!122916 (array_inv!35986 a!2831)))

(declare-fun b!1425737 () Bool)

(declare-fun res!961169 () Bool)

(assert (=> b!1425737 (=> (not res!961169) (not e!805442))))

(assert (=> b!1425737 (= res!961169 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47508 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47508 a!2831))))))

(declare-fun b!1425738 () Bool)

(declare-fun res!961167 () Bool)

(assert (=> b!1425738 (=> (not res!961167) (not e!805442))))

(assert (=> b!1425738 (= res!961167 (validKeyInArray!0 (select (arr!46958 a!2831) j!81)))))

(assert (= (and start!122916 res!961170) b!1425732))

(assert (= (and b!1425732 res!961168) b!1425736))

(assert (= (and b!1425736 res!961171) b!1425738))

(assert (= (and b!1425738 res!961167) b!1425734))

(assert (= (and b!1425734 res!961163) b!1425731))

(assert (= (and b!1425731 res!961162) b!1425737))

(assert (= (and b!1425737 res!961169) b!1425729))

(assert (= (and b!1425729 res!961165) b!1425730))

(assert (= (and b!1425730 res!961166) b!1425735))

(assert (= (and b!1425735 res!961164) b!1425733))

(declare-fun m!1316331 () Bool)

(assert (=> b!1425730 m!1316331))

(assert (=> b!1425730 m!1316331))

(declare-fun m!1316333 () Bool)

(assert (=> b!1425730 m!1316333))

(declare-fun m!1316335 () Bool)

(assert (=> b!1425730 m!1316335))

(declare-fun m!1316337 () Bool)

(assert (=> b!1425730 m!1316337))

(declare-fun m!1316339 () Bool)

(assert (=> start!122916 m!1316339))

(declare-fun m!1316341 () Bool)

(assert (=> start!122916 m!1316341))

(declare-fun m!1316343 () Bool)

(assert (=> b!1425729 m!1316343))

(assert (=> b!1425729 m!1316343))

(declare-fun m!1316345 () Bool)

(assert (=> b!1425729 m!1316345))

(assert (=> b!1425729 m!1316345))

(assert (=> b!1425729 m!1316343))

(declare-fun m!1316347 () Bool)

(assert (=> b!1425729 m!1316347))

(assert (=> b!1425738 m!1316343))

(assert (=> b!1425738 m!1316343))

(declare-fun m!1316349 () Bool)

(assert (=> b!1425738 m!1316349))

(declare-fun m!1316351 () Bool)

(assert (=> b!1425734 m!1316351))

(assert (=> b!1425735 m!1316343))

(assert (=> b!1425735 m!1316343))

(declare-fun m!1316353 () Bool)

(assert (=> b!1425735 m!1316353))

(declare-fun m!1316355 () Bool)

(assert (=> b!1425733 m!1316355))

(declare-fun m!1316357 () Bool)

(assert (=> b!1425731 m!1316357))

(declare-fun m!1316359 () Bool)

(assert (=> b!1425736 m!1316359))

(assert (=> b!1425736 m!1316359))

(declare-fun m!1316361 () Bool)

(assert (=> b!1425736 m!1316361))

(push 1)

