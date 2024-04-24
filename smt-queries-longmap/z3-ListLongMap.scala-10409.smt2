; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122804 () Bool)

(assert start!122804)

(declare-fun b!1421352 () Bool)

(declare-fun res!956110 () Bool)

(declare-fun e!804065 () Bool)

(assert (=> b!1421352 (=> (not res!956110) (not e!804065))))

(declare-datatypes ((array!97091 0))(
  ( (array!97092 (arr!46861 (Array (_ BitVec 32) (_ BitVec 64))) (size!47412 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97091)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97091 (_ BitVec 32)) Bool)

(assert (=> b!1421352 (= res!956110 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1421353 () Bool)

(declare-fun res!956104 () Bool)

(assert (=> b!1421353 (=> (not res!956104) (not e!804065))))

(declare-fun i!982 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1421353 (= res!956104 (validKeyInArray!0 (select (arr!46861 a!2831) i!982)))))

(declare-fun b!1421354 () Bool)

(declare-fun res!956108 () Bool)

(assert (=> b!1421354 (=> (not res!956108) (not e!804065))))

(declare-datatypes ((List!33358 0))(
  ( (Nil!33355) (Cons!33354 (h!34664 (_ BitVec 64)) (t!48044 List!33358)) )
))
(declare-fun arrayNoDuplicates!0 (array!97091 (_ BitVec 32) List!33358) Bool)

(assert (=> b!1421354 (= res!956108 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33355))))

(declare-fun b!1421355 () Bool)

(declare-fun e!804064 () Bool)

(assert (=> b!1421355 (= e!804065 e!804064)))

(declare-fun res!956109 () Bool)

(assert (=> b!1421355 (=> (not res!956109) (not e!804064))))

(declare-datatypes ((SeekEntryResult!11048 0))(
  ( (MissingZero!11048 (index!46584 (_ BitVec 32))) (Found!11048 (index!46585 (_ BitVec 32))) (Intermediate!11048 (undefined!11860 Bool) (index!46586 (_ BitVec 32)) (x!128405 (_ BitVec 32))) (Undefined!11048) (MissingVacant!11048 (index!46587 (_ BitVec 32))) )
))
(declare-fun lt!626291 () SeekEntryResult!11048)

(declare-fun j!81 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97091 (_ BitVec 32)) SeekEntryResult!11048)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1421355 (= res!956109 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46861 a!2831) j!81) mask!2608) (select (arr!46861 a!2831) j!81) a!2831 mask!2608) lt!626291))))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(assert (=> b!1421355 (= lt!626291 (Intermediate!11048 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1421356 () Bool)

(declare-fun res!956107 () Bool)

(assert (=> b!1421356 (=> (not res!956107) (not e!804064))))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1421356 (= res!956107 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46861 a!2831) j!81) a!2831 mask!2608) lt!626291))))

(declare-fun b!1421357 () Bool)

(declare-fun res!956105 () Bool)

(assert (=> b!1421357 (=> (not res!956105) (not e!804065))))

(assert (=> b!1421357 (= res!956105 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47412 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47412 a!2831))))))

(declare-fun res!956101 () Bool)

(assert (=> start!122804 (=> (not res!956101) (not e!804065))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122804 (= res!956101 (validMask!0 mask!2608))))

(assert (=> start!122804 e!804065))

(assert (=> start!122804 true))

(declare-fun array_inv!36142 (array!97091) Bool)

(assert (=> start!122804 (array_inv!36142 a!2831)))

(declare-fun b!1421358 () Bool)

(declare-fun res!956106 () Bool)

(assert (=> b!1421358 (=> (not res!956106) (not e!804065))))

(assert (=> b!1421358 (= res!956106 (validKeyInArray!0 (select (arr!46861 a!2831) j!81)))))

(declare-fun b!1421359 () Bool)

(declare-fun res!956102 () Bool)

(assert (=> b!1421359 (=> (not res!956102) (not e!804064))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(assert (=> b!1421359 (= res!956102 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46861 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) mask!2608) (select (store (arr!46861 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) (array!97092 (store (arr!46861 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47412 a!2831)) mask!2608) (Intermediate!11048 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13)))))

(declare-fun b!1421360 () Bool)

(declare-fun res!956103 () Bool)

(assert (=> b!1421360 (=> (not res!956103) (not e!804065))))

(assert (=> b!1421360 (= res!956103 (and (= (size!47412 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47412 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47412 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1421361 () Bool)

(assert (=> b!1421361 (= e!804064 (bvslt mask!2608 #b00000000000000000000000000000000))))

(assert (= (and start!122804 res!956101) b!1421360))

(assert (= (and b!1421360 res!956103) b!1421353))

(assert (= (and b!1421353 res!956104) b!1421358))

(assert (= (and b!1421358 res!956106) b!1421352))

(assert (= (and b!1421352 res!956110) b!1421354))

(assert (= (and b!1421354 res!956108) b!1421357))

(assert (= (and b!1421357 res!956105) b!1421355))

(assert (= (and b!1421355 res!956109) b!1421359))

(assert (= (and b!1421359 res!956102) b!1421356))

(assert (= (and b!1421356 res!956107) b!1421361))

(declare-fun m!1312083 () Bool)

(assert (=> b!1421353 m!1312083))

(assert (=> b!1421353 m!1312083))

(declare-fun m!1312085 () Bool)

(assert (=> b!1421353 m!1312085))

(declare-fun m!1312087 () Bool)

(assert (=> b!1421352 m!1312087))

(declare-fun m!1312089 () Bool)

(assert (=> start!122804 m!1312089))

(declare-fun m!1312091 () Bool)

(assert (=> start!122804 m!1312091))

(declare-fun m!1312093 () Bool)

(assert (=> b!1421355 m!1312093))

(assert (=> b!1421355 m!1312093))

(declare-fun m!1312095 () Bool)

(assert (=> b!1421355 m!1312095))

(assert (=> b!1421355 m!1312095))

(assert (=> b!1421355 m!1312093))

(declare-fun m!1312097 () Bool)

(assert (=> b!1421355 m!1312097))

(declare-fun m!1312099 () Bool)

(assert (=> b!1421359 m!1312099))

(declare-fun m!1312101 () Bool)

(assert (=> b!1421359 m!1312101))

(assert (=> b!1421359 m!1312101))

(declare-fun m!1312103 () Bool)

(assert (=> b!1421359 m!1312103))

(assert (=> b!1421359 m!1312103))

(assert (=> b!1421359 m!1312101))

(declare-fun m!1312105 () Bool)

(assert (=> b!1421359 m!1312105))

(assert (=> b!1421356 m!1312093))

(assert (=> b!1421356 m!1312093))

(declare-fun m!1312107 () Bool)

(assert (=> b!1421356 m!1312107))

(assert (=> b!1421358 m!1312093))

(assert (=> b!1421358 m!1312093))

(declare-fun m!1312109 () Bool)

(assert (=> b!1421358 m!1312109))

(declare-fun m!1312111 () Bool)

(assert (=> b!1421354 m!1312111))

(check-sat (not b!1421355) (not b!1421358) (not b!1421353) (not start!122804) (not b!1421359) (not b!1421356) (not b!1421352) (not b!1421354))
(check-sat)
