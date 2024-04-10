; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122868 () Bool)

(assert start!122868)

(declare-fun b!1425111 () Bool)

(declare-fun res!960544 () Bool)

(declare-fun e!805276 () Bool)

(assert (=> b!1425111 (=> (not res!960544) (not e!805276))))

(declare-datatypes ((array!97233 0))(
  ( (array!97234 (arr!46934 (Array (_ BitVec 32) (_ BitVec 64))) (size!47484 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97233)

(declare-fun i!982 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1425111 (= res!960544 (validKeyInArray!0 (select (arr!46934 a!2831) i!982)))))

(declare-fun b!1425112 () Bool)

(declare-fun res!960548 () Bool)

(assert (=> b!1425112 (=> (not res!960548) (not e!805276))))

(declare-fun j!81 () (_ BitVec 32))

(assert (=> b!1425112 (= res!960548 (validKeyInArray!0 (select (arr!46934 a!2831) j!81)))))

(declare-fun res!960546 () Bool)

(assert (=> start!122868 (=> (not res!960546) (not e!805276))))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122868 (= res!960546 (validMask!0 mask!2608))))

(assert (=> start!122868 e!805276))

(assert (=> start!122868 true))

(declare-fun array_inv!35962 (array!97233) Bool)

(assert (=> start!122868 (array_inv!35962 a!2831)))

(declare-fun b!1425113 () Bool)

(declare-fun res!960545 () Bool)

(assert (=> b!1425113 (=> (not res!960545) (not e!805276))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1425113 (= res!960545 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47484 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47484 a!2831))))))

(declare-fun b!1425114 () Bool)

(declare-fun res!960547 () Bool)

(assert (=> b!1425114 (=> (not res!960547) (not e!805276))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97233 (_ BitVec 32)) Bool)

(assert (=> b!1425114 (= res!960547 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1425115 () Bool)

(declare-fun res!960549 () Bool)

(assert (=> b!1425115 (=> (not res!960549) (not e!805276))))

(assert (=> b!1425115 (= res!960549 (and (= (size!47484 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47484 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47484 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1425116 () Bool)

(declare-fun res!960550 () Bool)

(assert (=> b!1425116 (=> (not res!960550) (not e!805276))))

(declare-datatypes ((List!33444 0))(
  ( (Nil!33441) (Cons!33440 (h!34742 (_ BitVec 64)) (t!48138 List!33444)) )
))
(declare-fun arrayNoDuplicates!0 (array!97233 (_ BitVec 32) List!33444) Bool)

(assert (=> b!1425116 (= res!960550 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33441))))

(declare-fun b!1425117 () Bool)

(assert (=> b!1425117 (= e!805276 false)))

(declare-datatypes ((SeekEntryResult!11213 0))(
  ( (MissingZero!11213 (index!47244 (_ BitVec 32))) (Found!11213 (index!47245 (_ BitVec 32))) (Intermediate!11213 (undefined!12025 Bool) (index!47246 (_ BitVec 32)) (x!128887 (_ BitVec 32))) (Undefined!11213) (MissingVacant!11213 (index!47247 (_ BitVec 32))) )
))
(declare-fun lt!627774 () SeekEntryResult!11213)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97233 (_ BitVec 32)) SeekEntryResult!11213)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1425117 (= lt!627774 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46934 a!2831) j!81) mask!2608) (select (arr!46934 a!2831) j!81) a!2831 mask!2608))))

(assert (= (and start!122868 res!960546) b!1425115))

(assert (= (and b!1425115 res!960549) b!1425111))

(assert (= (and b!1425111 res!960544) b!1425112))

(assert (= (and b!1425112 res!960548) b!1425114))

(assert (= (and b!1425114 res!960547) b!1425116))

(assert (= (and b!1425116 res!960550) b!1425113))

(assert (= (and b!1425113 res!960545) b!1425117))

(declare-fun m!1315665 () Bool)

(assert (=> b!1425112 m!1315665))

(assert (=> b!1425112 m!1315665))

(declare-fun m!1315667 () Bool)

(assert (=> b!1425112 m!1315667))

(declare-fun m!1315669 () Bool)

(assert (=> b!1425116 m!1315669))

(assert (=> b!1425117 m!1315665))

(assert (=> b!1425117 m!1315665))

(declare-fun m!1315671 () Bool)

(assert (=> b!1425117 m!1315671))

(assert (=> b!1425117 m!1315671))

(assert (=> b!1425117 m!1315665))

(declare-fun m!1315673 () Bool)

(assert (=> b!1425117 m!1315673))

(declare-fun m!1315675 () Bool)

(assert (=> b!1425114 m!1315675))

(declare-fun m!1315677 () Bool)

(assert (=> b!1425111 m!1315677))

(assert (=> b!1425111 m!1315677))

(declare-fun m!1315679 () Bool)

(assert (=> b!1425111 m!1315679))

(declare-fun m!1315681 () Bool)

(assert (=> start!122868 m!1315681))

(declare-fun m!1315683 () Bool)

(assert (=> start!122868 m!1315683))

(push 1)

(assert (not b!1425111))

(assert (not b!1425116))

(assert (not b!1425112))

(assert (not b!1425114))

(assert (not start!122868))

(assert (not b!1425117))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

