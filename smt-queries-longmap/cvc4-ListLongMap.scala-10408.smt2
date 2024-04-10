; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122614 () Bool)

(assert start!122614)

(declare-fun b!1420183 () Bool)

(declare-fun res!955624 () Bool)

(declare-fun e!803318 () Bool)

(assert (=> b!1420183 (=> (not res!955624) (not e!803318))))

(declare-datatypes ((array!96979 0))(
  ( (array!96980 (arr!46807 (Array (_ BitVec 32) (_ BitVec 64))) (size!47357 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!96979)

(declare-datatypes ((List!33317 0))(
  ( (Nil!33314) (Cons!33313 (h!34615 (_ BitVec 64)) (t!48011 List!33317)) )
))
(declare-fun arrayNoDuplicates!0 (array!96979 (_ BitVec 32) List!33317) Bool)

(assert (=> b!1420183 (= res!955624 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33314))))

(declare-fun b!1420184 () Bool)

(declare-fun res!955616 () Bool)

(assert (=> b!1420184 (=> (not res!955616) (not e!803318))))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(declare-fun i!982 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11092 0))(
  ( (MissingZero!11092 (index!46760 (_ BitVec 32))) (Found!11092 (index!46761 (_ BitVec 32))) (Intermediate!11092 (undefined!11904 Bool) (index!46762 (_ BitVec 32)) (x!128422 (_ BitVec 32))) (Undefined!11092) (MissingVacant!11092 (index!46763 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96979 (_ BitVec 32)) SeekEntryResult!11092)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1420184 (= res!955616 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46807 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) mask!2608) (select (store (arr!46807 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) (array!96980 (store (arr!46807 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47357 a!2831)) mask!2608) (Intermediate!11092 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13)))))

(declare-fun res!955622 () Bool)

(assert (=> start!122614 (=> (not res!955622) (not e!803318))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122614 (= res!955622 (validMask!0 mask!2608))))

(assert (=> start!122614 e!803318))

(assert (=> start!122614 true))

(declare-fun array_inv!35835 (array!96979) Bool)

(assert (=> start!122614 (array_inv!35835 a!2831)))

(declare-fun b!1420185 () Bool)

(declare-fun res!955620 () Bool)

(assert (=> b!1420185 (=> (not res!955620) (not e!803318))))

(assert (=> b!1420185 (= res!955620 (and (= (size!47357 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47357 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47357 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1420186 () Bool)

(declare-fun res!955617 () Bool)

(assert (=> b!1420186 (=> (not res!955617) (not e!803318))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96979 (_ BitVec 32)) Bool)

(assert (=> b!1420186 (= res!955617 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1420187 () Bool)

(assert (=> b!1420187 (= e!803318 false)))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun lt!625890 () SeekEntryResult!11092)

(assert (=> b!1420187 (= lt!625890 (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46807 a!2831) j!81) a!2831 mask!2608))))

(declare-fun b!1420188 () Bool)

(declare-fun res!955619 () Bool)

(assert (=> b!1420188 (=> (not res!955619) (not e!803318))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(assert (=> b!1420188 (= res!955619 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47357 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47357 a!2831))))))

(declare-fun b!1420189 () Bool)

(declare-fun res!955621 () Bool)

(assert (=> b!1420189 (=> (not res!955621) (not e!803318))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1420189 (= res!955621 (validKeyInArray!0 (select (arr!46807 a!2831) i!982)))))

(declare-fun b!1420190 () Bool)

(declare-fun res!955623 () Bool)

(assert (=> b!1420190 (=> (not res!955623) (not e!803318))))

(assert (=> b!1420190 (= res!955623 (validKeyInArray!0 (select (arr!46807 a!2831) j!81)))))

(declare-fun b!1420191 () Bool)

(declare-fun res!955618 () Bool)

(assert (=> b!1420191 (=> (not res!955618) (not e!803318))))

(assert (=> b!1420191 (= res!955618 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46807 a!2831) j!81) mask!2608) (select (arr!46807 a!2831) j!81) a!2831 mask!2608) (Intermediate!11092 false intermediateBeforeIndex!13 intermediateBeforeX!13)))))

(assert (= (and start!122614 res!955622) b!1420185))

(assert (= (and b!1420185 res!955620) b!1420189))

(assert (= (and b!1420189 res!955621) b!1420190))

(assert (= (and b!1420190 res!955623) b!1420186))

(assert (= (and b!1420186 res!955617) b!1420183))

(assert (= (and b!1420183 res!955624) b!1420188))

(assert (= (and b!1420188 res!955619) b!1420191))

(assert (= (and b!1420191 res!955618) b!1420184))

(assert (= (and b!1420184 res!955616) b!1420187))

(declare-fun m!1310685 () Bool)

(assert (=> b!1420187 m!1310685))

(assert (=> b!1420187 m!1310685))

(declare-fun m!1310687 () Bool)

(assert (=> b!1420187 m!1310687))

(declare-fun m!1310689 () Bool)

(assert (=> b!1420183 m!1310689))

(declare-fun m!1310691 () Bool)

(assert (=> b!1420184 m!1310691))

(declare-fun m!1310693 () Bool)

(assert (=> b!1420184 m!1310693))

(assert (=> b!1420184 m!1310693))

(declare-fun m!1310695 () Bool)

(assert (=> b!1420184 m!1310695))

(assert (=> b!1420184 m!1310695))

(assert (=> b!1420184 m!1310693))

(declare-fun m!1310697 () Bool)

(assert (=> b!1420184 m!1310697))

(declare-fun m!1310699 () Bool)

(assert (=> start!122614 m!1310699))

(declare-fun m!1310701 () Bool)

(assert (=> start!122614 m!1310701))

(declare-fun m!1310703 () Bool)

(assert (=> b!1420186 m!1310703))

(assert (=> b!1420191 m!1310685))

(assert (=> b!1420191 m!1310685))

(declare-fun m!1310705 () Bool)

(assert (=> b!1420191 m!1310705))

(assert (=> b!1420191 m!1310705))

(assert (=> b!1420191 m!1310685))

(declare-fun m!1310707 () Bool)

(assert (=> b!1420191 m!1310707))

(declare-fun m!1310709 () Bool)

(assert (=> b!1420189 m!1310709))

(assert (=> b!1420189 m!1310709))

(declare-fun m!1310711 () Bool)

(assert (=> b!1420189 m!1310711))

(assert (=> b!1420190 m!1310685))

(assert (=> b!1420190 m!1310685))

(declare-fun m!1310713 () Bool)

(assert (=> b!1420190 m!1310713))

(push 1)

(assert (not b!1420190))

(assert (not b!1420183))

(assert (not b!1420184))

(assert (not start!122614))

(assert (not b!1420189))

(assert (not b!1420186))

(assert (not b!1420191))

(assert (not b!1420187))

(check-sat)

(pop 1)

(push 1)

(check-sat)

