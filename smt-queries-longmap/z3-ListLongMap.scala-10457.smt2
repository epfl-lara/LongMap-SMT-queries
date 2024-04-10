; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122906 () Bool)

(assert start!122906)

(declare-fun b!1425583 () Bool)

(declare-fun res!961016 () Bool)

(declare-fun e!805391 () Bool)

(assert (=> b!1425583 (=> (not res!961016) (not e!805391))))

(declare-datatypes ((array!97271 0))(
  ( (array!97272 (arr!46953 (Array (_ BitVec 32) (_ BitVec 64))) (size!47503 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97271)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97271 (_ BitVec 32)) Bool)

(assert (=> b!1425583 (= res!961016 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1425584 () Bool)

(declare-fun res!961021 () Bool)

(assert (=> b!1425584 (=> (not res!961021) (not e!805391))))

(declare-datatypes ((List!33463 0))(
  ( (Nil!33460) (Cons!33459 (h!34761 (_ BitVec 64)) (t!48157 List!33463)) )
))
(declare-fun arrayNoDuplicates!0 (array!97271 (_ BitVec 32) List!33463) Bool)

(assert (=> b!1425584 (= res!961021 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33460))))

(declare-fun b!1425585 () Bool)

(declare-fun res!961017 () Bool)

(assert (=> b!1425585 (=> (not res!961017) (not e!805391))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1425585 (= res!961017 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47503 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47503 a!2831))))))

(declare-fun b!1425586 () Bool)

(declare-fun res!961022 () Bool)

(assert (=> b!1425586 (=> (not res!961022) (not e!805391))))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1425586 (= res!961022 (and (= (size!47503 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47503 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47503 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1425587 () Bool)

(declare-fun res!961020 () Bool)

(assert (=> b!1425587 (=> (not res!961020) (not e!805391))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11232 0))(
  ( (MissingZero!11232 (index!47320 (_ BitVec 32))) (Found!11232 (index!47321 (_ BitVec 32))) (Intermediate!11232 (undefined!12044 Bool) (index!47322 (_ BitVec 32)) (x!128954 (_ BitVec 32))) (Undefined!11232) (MissingVacant!11232 (index!47323 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97271 (_ BitVec 32)) SeekEntryResult!11232)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1425587 (= res!961020 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46953 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) mask!2608) (select (store (arr!46953 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) (array!97272 (store (arr!46953 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47503 a!2831)) mask!2608) (Intermediate!11232 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13)))))

(declare-fun b!1425588 () Bool)

(declare-fun res!961018 () Bool)

(assert (=> b!1425588 (=> (not res!961018) (not e!805391))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1425588 (= res!961018 (validKeyInArray!0 (select (arr!46953 a!2831) j!81)))))

(declare-fun b!1425589 () Bool)

(declare-fun res!961024 () Bool)

(assert (=> b!1425589 (=> (not res!961024) (not e!805391))))

(assert (=> b!1425589 (= res!961024 (validKeyInArray!0 (select (arr!46953 a!2831) i!982)))))

(declare-fun b!1425590 () Bool)

(assert (=> b!1425590 (= e!805391 false)))

(declare-fun lt!627831 () SeekEntryResult!11232)

(assert (=> b!1425590 (= lt!627831 (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46953 a!2831) j!81) a!2831 mask!2608))))

(declare-fun b!1425591 () Bool)

(declare-fun res!961023 () Bool)

(assert (=> b!1425591 (=> (not res!961023) (not e!805391))))

(assert (=> b!1425591 (= res!961023 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46953 a!2831) j!81) mask!2608) (select (arr!46953 a!2831) j!81) a!2831 mask!2608) (Intermediate!11232 false intermediateBeforeIndex!13 intermediateBeforeX!13)))))

(declare-fun res!961019 () Bool)

(assert (=> start!122906 (=> (not res!961019) (not e!805391))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122906 (= res!961019 (validMask!0 mask!2608))))

(assert (=> start!122906 e!805391))

(assert (=> start!122906 true))

(declare-fun array_inv!35981 (array!97271) Bool)

(assert (=> start!122906 (array_inv!35981 a!2831)))

(assert (= (and start!122906 res!961019) b!1425586))

(assert (= (and b!1425586 res!961022) b!1425589))

(assert (= (and b!1425589 res!961024) b!1425588))

(assert (= (and b!1425588 res!961018) b!1425583))

(assert (= (and b!1425583 res!961016) b!1425584))

(assert (= (and b!1425584 res!961021) b!1425585))

(assert (= (and b!1425585 res!961017) b!1425591))

(assert (= (and b!1425591 res!961023) b!1425587))

(assert (= (and b!1425587 res!961020) b!1425590))

(declare-fun m!1316175 () Bool)

(assert (=> b!1425587 m!1316175))

(declare-fun m!1316177 () Bool)

(assert (=> b!1425587 m!1316177))

(assert (=> b!1425587 m!1316177))

(declare-fun m!1316179 () Bool)

(assert (=> b!1425587 m!1316179))

(assert (=> b!1425587 m!1316179))

(assert (=> b!1425587 m!1316177))

(declare-fun m!1316181 () Bool)

(assert (=> b!1425587 m!1316181))

(declare-fun m!1316183 () Bool)

(assert (=> start!122906 m!1316183))

(declare-fun m!1316185 () Bool)

(assert (=> start!122906 m!1316185))

(declare-fun m!1316187 () Bool)

(assert (=> b!1425590 m!1316187))

(assert (=> b!1425590 m!1316187))

(declare-fun m!1316189 () Bool)

(assert (=> b!1425590 m!1316189))

(declare-fun m!1316191 () Bool)

(assert (=> b!1425589 m!1316191))

(assert (=> b!1425589 m!1316191))

(declare-fun m!1316193 () Bool)

(assert (=> b!1425589 m!1316193))

(declare-fun m!1316195 () Bool)

(assert (=> b!1425584 m!1316195))

(assert (=> b!1425588 m!1316187))

(assert (=> b!1425588 m!1316187))

(declare-fun m!1316197 () Bool)

(assert (=> b!1425588 m!1316197))

(assert (=> b!1425591 m!1316187))

(assert (=> b!1425591 m!1316187))

(declare-fun m!1316199 () Bool)

(assert (=> b!1425591 m!1316199))

(assert (=> b!1425591 m!1316199))

(assert (=> b!1425591 m!1316187))

(declare-fun m!1316201 () Bool)

(assert (=> b!1425591 m!1316201))

(declare-fun m!1316203 () Bool)

(assert (=> b!1425583 m!1316203))

(check-sat (not b!1425583) (not b!1425584) (not b!1425587) (not b!1425591) (not b!1425588) (not start!122906) (not b!1425589) (not b!1425590))
