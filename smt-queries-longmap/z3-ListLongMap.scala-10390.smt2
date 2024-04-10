; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122384 () Bool)

(assert start!122384)

(declare-fun b!1418454 () Bool)

(declare-fun res!954100 () Bool)

(declare-fun e!802700 () Bool)

(assert (=> b!1418454 (=> (not res!954100) (not e!802700))))

(declare-datatypes ((array!96860 0))(
  ( (array!96861 (arr!46752 (Array (_ BitVec 32) (_ BitVec 64))) (size!47302 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!96860)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96860 (_ BitVec 32)) Bool)

(assert (=> b!1418454 (= res!954100 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1418455 () Bool)

(assert (=> b!1418455 (= e!802700 false)))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun lt!625584 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1418455 (= lt!625584 (toIndex!0 (select (arr!46752 a!2831) j!81) mask!2608))))

(declare-fun b!1418456 () Bool)

(declare-fun res!954099 () Bool)

(assert (=> b!1418456 (=> (not res!954099) (not e!802700))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1418456 (= res!954099 (and (= (size!47302 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47302 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47302 a!2831)) (not (= i!982 j!81))))))

(declare-fun res!954095 () Bool)

(assert (=> start!122384 (=> (not res!954095) (not e!802700))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122384 (= res!954095 (validMask!0 mask!2608))))

(assert (=> start!122384 e!802700))

(assert (=> start!122384 true))

(declare-fun array_inv!35780 (array!96860) Bool)

(assert (=> start!122384 (array_inv!35780 a!2831)))

(declare-fun b!1418457 () Bool)

(declare-fun res!954094 () Bool)

(assert (=> b!1418457 (=> (not res!954094) (not e!802700))))

(declare-datatypes ((List!33262 0))(
  ( (Nil!33259) (Cons!33258 (h!34551 (_ BitVec 64)) (t!47956 List!33262)) )
))
(declare-fun arrayNoDuplicates!0 (array!96860 (_ BitVec 32) List!33262) Bool)

(assert (=> b!1418457 (= res!954094 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33259))))

(declare-fun b!1418458 () Bool)

(declare-fun res!954097 () Bool)

(assert (=> b!1418458 (=> (not res!954097) (not e!802700))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1418458 (= res!954097 (validKeyInArray!0 (select (arr!46752 a!2831) j!81)))))

(declare-fun b!1418459 () Bool)

(declare-fun res!954098 () Bool)

(assert (=> b!1418459 (=> (not res!954098) (not e!802700))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1418459 (= res!954098 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47302 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47302 a!2831))))))

(declare-fun b!1418460 () Bool)

(declare-fun res!954096 () Bool)

(assert (=> b!1418460 (=> (not res!954096) (not e!802700))))

(assert (=> b!1418460 (= res!954096 (validKeyInArray!0 (select (arr!46752 a!2831) i!982)))))

(assert (= (and start!122384 res!954095) b!1418456))

(assert (= (and b!1418456 res!954099) b!1418460))

(assert (= (and b!1418460 res!954096) b!1418458))

(assert (= (and b!1418458 res!954097) b!1418454))

(assert (= (and b!1418454 res!954100) b!1418457))

(assert (= (and b!1418457 res!954094) b!1418459))

(assert (= (and b!1418459 res!954098) b!1418455))

(declare-fun m!1309137 () Bool)

(assert (=> start!122384 m!1309137))

(declare-fun m!1309139 () Bool)

(assert (=> start!122384 m!1309139))

(declare-fun m!1309141 () Bool)

(assert (=> b!1418454 m!1309141))

(declare-fun m!1309143 () Bool)

(assert (=> b!1418460 m!1309143))

(assert (=> b!1418460 m!1309143))

(declare-fun m!1309145 () Bool)

(assert (=> b!1418460 m!1309145))

(declare-fun m!1309147 () Bool)

(assert (=> b!1418455 m!1309147))

(assert (=> b!1418455 m!1309147))

(declare-fun m!1309149 () Bool)

(assert (=> b!1418455 m!1309149))

(declare-fun m!1309151 () Bool)

(assert (=> b!1418457 m!1309151))

(assert (=> b!1418458 m!1309147))

(assert (=> b!1418458 m!1309147))

(declare-fun m!1309153 () Bool)

(assert (=> b!1418458 m!1309153))

(check-sat (not start!122384) (not b!1418454) (not b!1418458) (not b!1418455) (not b!1418460) (not b!1418457))
