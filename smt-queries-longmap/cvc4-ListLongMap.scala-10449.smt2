; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122860 () Bool)

(assert start!122860)

(declare-fun b!1425027 () Bool)

(declare-fun res!960461 () Bool)

(declare-fun e!805252 () Bool)

(assert (=> b!1425027 (=> (not res!960461) (not e!805252))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-datatypes ((array!97225 0))(
  ( (array!97226 (arr!46930 (Array (_ BitVec 32) (_ BitVec 64))) (size!47480 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97225)

(declare-fun index!585 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(assert (=> b!1425027 (= res!960461 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47480 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47480 a!2831))))))

(declare-fun b!1425028 () Bool)

(declare-fun res!960462 () Bool)

(assert (=> b!1425028 (=> (not res!960462) (not e!805252))))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1425028 (= res!960462 (validKeyInArray!0 (select (arr!46930 a!2831) j!81)))))

(declare-fun b!1425029 () Bool)

(declare-fun res!960463 () Bool)

(assert (=> b!1425029 (=> (not res!960463) (not e!805252))))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97225 (_ BitVec 32)) Bool)

(assert (=> b!1425029 (= res!960463 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1425030 () Bool)

(assert (=> b!1425030 (= e!805252 false)))

(declare-datatypes ((SeekEntryResult!11209 0))(
  ( (MissingZero!11209 (index!47228 (_ BitVec 32))) (Found!11209 (index!47229 (_ BitVec 32))) (Intermediate!11209 (undefined!12021 Bool) (index!47230 (_ BitVec 32)) (x!128867 (_ BitVec 32))) (Undefined!11209) (MissingVacant!11209 (index!47231 (_ BitVec 32))) )
))
(declare-fun lt!627762 () SeekEntryResult!11209)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97225 (_ BitVec 32)) SeekEntryResult!11209)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1425030 (= lt!627762 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46930 a!2831) j!81) mask!2608) (select (arr!46930 a!2831) j!81) a!2831 mask!2608))))

(declare-fun res!960466 () Bool)

(assert (=> start!122860 (=> (not res!960466) (not e!805252))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122860 (= res!960466 (validMask!0 mask!2608))))

(assert (=> start!122860 e!805252))

(assert (=> start!122860 true))

(declare-fun array_inv!35958 (array!97225) Bool)

(assert (=> start!122860 (array_inv!35958 a!2831)))

(declare-fun b!1425031 () Bool)

(declare-fun res!960464 () Bool)

(assert (=> b!1425031 (=> (not res!960464) (not e!805252))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1425031 (= res!960464 (and (= (size!47480 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47480 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47480 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1425032 () Bool)

(declare-fun res!960465 () Bool)

(assert (=> b!1425032 (=> (not res!960465) (not e!805252))))

(declare-datatypes ((List!33440 0))(
  ( (Nil!33437) (Cons!33436 (h!34738 (_ BitVec 64)) (t!48134 List!33440)) )
))
(declare-fun arrayNoDuplicates!0 (array!97225 (_ BitVec 32) List!33440) Bool)

(assert (=> b!1425032 (= res!960465 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33437))))

(declare-fun b!1425033 () Bool)

(declare-fun res!960460 () Bool)

(assert (=> b!1425033 (=> (not res!960460) (not e!805252))))

(assert (=> b!1425033 (= res!960460 (validKeyInArray!0 (select (arr!46930 a!2831) i!982)))))

(assert (= (and start!122860 res!960466) b!1425031))

(assert (= (and b!1425031 res!960464) b!1425033))

(assert (= (and b!1425033 res!960460) b!1425028))

(assert (= (and b!1425028 res!960462) b!1425029))

(assert (= (and b!1425029 res!960463) b!1425032))

(assert (= (and b!1425032 res!960465) b!1425027))

(assert (= (and b!1425027 res!960461) b!1425030))

(declare-fun m!1315585 () Bool)

(assert (=> start!122860 m!1315585))

(declare-fun m!1315587 () Bool)

(assert (=> start!122860 m!1315587))

(declare-fun m!1315589 () Bool)

(assert (=> b!1425033 m!1315589))

(assert (=> b!1425033 m!1315589))

(declare-fun m!1315591 () Bool)

(assert (=> b!1425033 m!1315591))

(declare-fun m!1315593 () Bool)

(assert (=> b!1425029 m!1315593))

(declare-fun m!1315595 () Bool)

(assert (=> b!1425030 m!1315595))

(assert (=> b!1425030 m!1315595))

(declare-fun m!1315597 () Bool)

(assert (=> b!1425030 m!1315597))

(assert (=> b!1425030 m!1315597))

(assert (=> b!1425030 m!1315595))

(declare-fun m!1315599 () Bool)

(assert (=> b!1425030 m!1315599))

(assert (=> b!1425028 m!1315595))

(assert (=> b!1425028 m!1315595))

(declare-fun m!1315601 () Bool)

(assert (=> b!1425028 m!1315601))

(declare-fun m!1315603 () Bool)

(assert (=> b!1425032 m!1315603))

(push 1)

(assert (not b!1425033))

(assert (not b!1425030))

(assert (not b!1425029))

(assert (not b!1425032))

(assert (not b!1425028))

(assert (not start!122860))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

