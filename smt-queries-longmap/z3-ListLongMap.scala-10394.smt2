; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122630 () Bool)

(assert start!122630)

(declare-fun b!1419908 () Bool)

(declare-fun res!954834 () Bool)

(declare-fun e!803567 () Bool)

(assert (=> b!1419908 (=> (not res!954834) (not e!803567))))

(declare-datatypes ((array!96995 0))(
  ( (array!96996 (arr!46816 (Array (_ BitVec 32) (_ BitVec 64))) (size!47367 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!96995)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96995 (_ BitVec 32)) Bool)

(assert (=> b!1419908 (= res!954834 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun res!954836 () Bool)

(assert (=> start!122630 (=> (not res!954836) (not e!803567))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122630 (= res!954836 (validMask!0 mask!2608))))

(assert (=> start!122630 e!803567))

(assert (=> start!122630 true))

(declare-fun array_inv!36097 (array!96995) Bool)

(assert (=> start!122630 (array_inv!36097 a!2831)))

(declare-fun b!1419909 () Bool)

(declare-fun res!954835 () Bool)

(assert (=> b!1419909 (=> (not res!954835) (not e!803567))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11003 0))(
  ( (MissingZero!11003 (index!46404 (_ BitVec 32))) (Found!11003 (index!46405 (_ BitVec 32))) (Intermediate!11003 (undefined!11815 Bool) (index!46406 (_ BitVec 32)) (x!128228 (_ BitVec 32))) (Undefined!11003) (MissingVacant!11003 (index!46407 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96995 (_ BitVec 32)) SeekEntryResult!11003)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1419909 (= res!954835 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46816 a!2831) j!81) mask!2608) (select (arr!46816 a!2831) j!81) a!2831 mask!2608) (Intermediate!11003 false intermediateBeforeIndex!13 intermediateBeforeX!13)))))

(declare-fun b!1419910 () Bool)

(declare-fun res!954837 () Bool)

(assert (=> b!1419910 (=> (not res!954837) (not e!803567))))

(declare-fun i!982 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1419910 (= res!954837 (validKeyInArray!0 (select (arr!46816 a!2831) i!982)))))

(declare-fun b!1419911 () Bool)

(declare-fun res!954833 () Bool)

(assert (=> b!1419911 (=> (not res!954833) (not e!803567))))

(assert (=> b!1419911 (= res!954833 (validKeyInArray!0 (select (arr!46816 a!2831) j!81)))))

(declare-fun b!1419912 () Bool)

(declare-fun res!954831 () Bool)

(assert (=> b!1419912 (=> (not res!954831) (not e!803567))))

(assert (=> b!1419912 (= res!954831 (and (= (size!47367 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47367 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47367 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1419913 () Bool)

(declare-fun res!954832 () Bool)

(assert (=> b!1419913 (=> (not res!954832) (not e!803567))))

(declare-datatypes ((List!33313 0))(
  ( (Nil!33310) (Cons!33309 (h!34613 (_ BitVec 64)) (t!47999 List!33313)) )
))
(declare-fun arrayNoDuplicates!0 (array!96995 (_ BitVec 32) List!33313) Bool)

(assert (=> b!1419913 (= res!954832 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33310))))

(declare-fun b!1419914 () Bool)

(declare-fun res!954838 () Bool)

(assert (=> b!1419914 (=> (not res!954838) (not e!803567))))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(assert (=> b!1419914 (= res!954838 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47367 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47367 a!2831))))))

(declare-fun b!1419915 () Bool)

(assert (=> b!1419915 (= e!803567 (bvslt mask!2608 #b00000000000000000000000000000000))))

(assert (= (and start!122630 res!954836) b!1419912))

(assert (= (and b!1419912 res!954831) b!1419910))

(assert (= (and b!1419910 res!954837) b!1419911))

(assert (= (and b!1419911 res!954833) b!1419908))

(assert (= (and b!1419908 res!954834) b!1419913))

(assert (= (and b!1419913 res!954832) b!1419914))

(assert (= (and b!1419914 res!954838) b!1419909))

(assert (= (and b!1419909 res!954835) b!1419915))

(declare-fun m!1310751 () Bool)

(assert (=> start!122630 m!1310751))

(declare-fun m!1310753 () Bool)

(assert (=> start!122630 m!1310753))

(declare-fun m!1310755 () Bool)

(assert (=> b!1419908 m!1310755))

(declare-fun m!1310757 () Bool)

(assert (=> b!1419913 m!1310757))

(declare-fun m!1310759 () Bool)

(assert (=> b!1419911 m!1310759))

(assert (=> b!1419911 m!1310759))

(declare-fun m!1310761 () Bool)

(assert (=> b!1419911 m!1310761))

(assert (=> b!1419909 m!1310759))

(assert (=> b!1419909 m!1310759))

(declare-fun m!1310763 () Bool)

(assert (=> b!1419909 m!1310763))

(assert (=> b!1419909 m!1310763))

(assert (=> b!1419909 m!1310759))

(declare-fun m!1310765 () Bool)

(assert (=> b!1419909 m!1310765))

(declare-fun m!1310767 () Bool)

(assert (=> b!1419910 m!1310767))

(assert (=> b!1419910 m!1310767))

(declare-fun m!1310769 () Bool)

(assert (=> b!1419910 m!1310769))

(check-sat (not b!1419913) (not start!122630) (not b!1419911) (not b!1419910) (not b!1419909) (not b!1419908))
(check-sat)
