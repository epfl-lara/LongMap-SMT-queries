; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122586 () Bool)

(assert start!122586)

(declare-fun b!1419797 () Bool)

(declare-fun res!955281 () Bool)

(declare-fun e!803207 () Bool)

(assert (=> b!1419797 (=> (not res!955281) (not e!803207))))

(declare-datatypes ((array!96904 0))(
  ( (array!96905 (arr!46770 (Array (_ BitVec 32) (_ BitVec 64))) (size!47322 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!96904)

(declare-datatypes ((List!33358 0))(
  ( (Nil!33355) (Cons!33354 (h!34656 (_ BitVec 64)) (t!48044 List!33358)) )
))
(declare-fun arrayNoDuplicates!0 (array!96904 (_ BitVec 32) List!33358) Bool)

(assert (=> b!1419797 (= res!955281 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33355))))

(declare-fun res!955285 () Bool)

(assert (=> start!122586 (=> (not res!955285) (not e!803207))))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122586 (= res!955285 (validMask!0 mask!2608))))

(assert (=> start!122586 e!803207))

(assert (=> start!122586 true))

(declare-fun array_inv!36003 (array!96904) Bool)

(assert (=> start!122586 (array_inv!36003 a!2831)))

(declare-fun b!1419798 () Bool)

(declare-fun res!955287 () Bool)

(assert (=> b!1419798 (=> (not res!955287) (not e!803207))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1419798 (= res!955287 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47322 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47322 a!2831))))))

(declare-fun b!1419799 () Bool)

(declare-fun res!955283 () Bool)

(assert (=> b!1419799 (=> (not res!955283) (not e!803207))))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1419799 (= res!955283 (and (= (size!47322 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47322 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47322 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1419800 () Bool)

(declare-fun res!955282 () Bool)

(assert (=> b!1419800 (=> (not res!955282) (not e!803207))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1419800 (= res!955282 (validKeyInArray!0 (select (arr!46770 a!2831) i!982)))))

(declare-fun b!1419801 () Bool)

(declare-fun res!955286 () Bool)

(assert (=> b!1419801 (=> (not res!955286) (not e!803207))))

(assert (=> b!1419801 (= res!955286 (validKeyInArray!0 (select (arr!46770 a!2831) j!81)))))

(declare-fun b!1419802 () Bool)

(declare-fun res!955284 () Bool)

(assert (=> b!1419802 (=> (not res!955284) (not e!803207))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96904 (_ BitVec 32)) Bool)

(assert (=> b!1419802 (= res!955284 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1419803 () Bool)

(assert (=> b!1419803 (= e!803207 false)))

(declare-datatypes ((SeekEntryResult!11082 0))(
  ( (MissingZero!11082 (index!46720 (_ BitVec 32))) (Found!11082 (index!46721 (_ BitVec 32))) (Intermediate!11082 (undefined!11894 Bool) (index!46722 (_ BitVec 32)) (x!128377 (_ BitVec 32))) (Undefined!11082) (MissingVacant!11082 (index!46723 (_ BitVec 32))) )
))
(declare-fun lt!625673 () SeekEntryResult!11082)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96904 (_ BitVec 32)) SeekEntryResult!11082)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1419803 (= lt!625673 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46770 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) mask!2608) (select (store (arr!46770 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) (array!96905 (store (arr!46770 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47322 a!2831)) mask!2608))))

(declare-fun b!1419804 () Bool)

(declare-fun res!955288 () Bool)

(assert (=> b!1419804 (=> (not res!955288) (not e!803207))))

(assert (=> b!1419804 (= res!955288 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46770 a!2831) j!81) mask!2608) (select (arr!46770 a!2831) j!81) a!2831 mask!2608) (Intermediate!11082 false intermediateBeforeIndex!13 intermediateBeforeX!13)))))

(assert (= (and start!122586 res!955285) b!1419799))

(assert (= (and b!1419799 res!955283) b!1419800))

(assert (= (and b!1419800 res!955282) b!1419801))

(assert (= (and b!1419801 res!955286) b!1419802))

(assert (= (and b!1419802 res!955284) b!1419797))

(assert (= (and b!1419797 res!955281) b!1419798))

(assert (= (and b!1419798 res!955287) b!1419804))

(assert (= (and b!1419804 res!955288) b!1419803))

(declare-fun m!1309793 () Bool)

(assert (=> b!1419802 m!1309793))

(declare-fun m!1309795 () Bool)

(assert (=> b!1419804 m!1309795))

(assert (=> b!1419804 m!1309795))

(declare-fun m!1309797 () Bool)

(assert (=> b!1419804 m!1309797))

(assert (=> b!1419804 m!1309797))

(assert (=> b!1419804 m!1309795))

(declare-fun m!1309799 () Bool)

(assert (=> b!1419804 m!1309799))

(declare-fun m!1309801 () Bool)

(assert (=> b!1419803 m!1309801))

(declare-fun m!1309803 () Bool)

(assert (=> b!1419803 m!1309803))

(assert (=> b!1419803 m!1309803))

(declare-fun m!1309805 () Bool)

(assert (=> b!1419803 m!1309805))

(assert (=> b!1419803 m!1309805))

(assert (=> b!1419803 m!1309803))

(declare-fun m!1309807 () Bool)

(assert (=> b!1419803 m!1309807))

(assert (=> b!1419801 m!1309795))

(assert (=> b!1419801 m!1309795))

(declare-fun m!1309809 () Bool)

(assert (=> b!1419801 m!1309809))

(declare-fun m!1309811 () Bool)

(assert (=> b!1419800 m!1309811))

(assert (=> b!1419800 m!1309811))

(declare-fun m!1309813 () Bool)

(assert (=> b!1419800 m!1309813))

(declare-fun m!1309815 () Bool)

(assert (=> start!122586 m!1309815))

(declare-fun m!1309817 () Bool)

(assert (=> start!122586 m!1309817))

(declare-fun m!1309819 () Bool)

(assert (=> b!1419797 m!1309819))

(push 1)

(assert (not b!1419801))

(assert (not b!1419804))

(assert (not b!1419800))

(assert (not b!1419802))

(assert (not b!1419803))

(assert (not start!122586))

(assert (not b!1419797))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

