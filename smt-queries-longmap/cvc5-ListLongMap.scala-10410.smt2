; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122814 () Bool)

(assert start!122814)

(declare-fun b!1421494 () Bool)

(declare-fun res!956248 () Bool)

(declare-fun e!804101 () Bool)

(assert (=> b!1421494 (=> (not res!956248) (not e!804101))))

(declare-datatypes ((array!97101 0))(
  ( (array!97102 (arr!46866 (Array (_ BitVec 32) (_ BitVec 64))) (size!47417 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97101)

(declare-fun i!982 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1421494 (= res!956248 (validKeyInArray!0 (select (arr!46866 a!2831) i!982)))))

(declare-fun res!956245 () Bool)

(assert (=> start!122814 (=> (not res!956245) (not e!804101))))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122814 (= res!956245 (validMask!0 mask!2608))))

(assert (=> start!122814 e!804101))

(assert (=> start!122814 true))

(declare-fun array_inv!36147 (array!97101) Bool)

(assert (=> start!122814 (array_inv!36147 a!2831)))

(declare-fun b!1421495 () Bool)

(declare-fun res!956244 () Bool)

(assert (=> b!1421495 (=> (not res!956244) (not e!804101))))

(declare-fun j!81 () (_ BitVec 32))

(assert (=> b!1421495 (= res!956244 (and (= (size!47417 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47417 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47417 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1421496 () Bool)

(declare-fun res!956250 () Bool)

(assert (=> b!1421496 (=> (not res!956250) (not e!804101))))

(declare-datatypes ((List!33363 0))(
  ( (Nil!33360) (Cons!33359 (h!34669 (_ BitVec 64)) (t!48049 List!33363)) )
))
(declare-fun arrayNoDuplicates!0 (array!97101 (_ BitVec 32) List!33363) Bool)

(assert (=> b!1421496 (= res!956250 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33360))))

(declare-fun b!1421497 () Bool)

(declare-fun res!956247 () Bool)

(assert (=> b!1421497 (=> (not res!956247) (not e!804101))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97101 (_ BitVec 32)) Bool)

(assert (=> b!1421497 (= res!956247 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1421498 () Bool)

(assert (=> b!1421498 (= e!804101 false)))

(declare-datatypes ((SeekEntryResult!11053 0))(
  ( (MissingZero!11053 (index!46604 (_ BitVec 32))) (Found!11053 (index!46605 (_ BitVec 32))) (Intermediate!11053 (undefined!11865 Bool) (index!46606 (_ BitVec 32)) (x!128418 (_ BitVec 32))) (Undefined!11053) (MissingVacant!11053 (index!46607 (_ BitVec 32))) )
))
(declare-fun lt!626306 () SeekEntryResult!11053)

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97101 (_ BitVec 32)) SeekEntryResult!11053)

(assert (=> b!1421498 (= lt!626306 (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46866 a!2831) j!81) a!2831 mask!2608))))

(declare-fun b!1421499 () Bool)

(declare-fun res!956251 () Bool)

(assert (=> b!1421499 (=> (not res!956251) (not e!804101))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(assert (=> b!1421499 (= res!956251 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47417 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47417 a!2831))))))

(declare-fun b!1421500 () Bool)

(declare-fun res!956246 () Bool)

(assert (=> b!1421500 (=> (not res!956246) (not e!804101))))

(assert (=> b!1421500 (= res!956246 (validKeyInArray!0 (select (arr!46866 a!2831) j!81)))))

(declare-fun b!1421501 () Bool)

(declare-fun res!956243 () Bool)

(assert (=> b!1421501 (=> (not res!956243) (not e!804101))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1421501 (= res!956243 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46866 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) mask!2608) (select (store (arr!46866 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) (array!97102 (store (arr!46866 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47417 a!2831)) mask!2608) (Intermediate!11053 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13)))))

(declare-fun b!1421502 () Bool)

(declare-fun res!956249 () Bool)

(assert (=> b!1421502 (=> (not res!956249) (not e!804101))))

(assert (=> b!1421502 (= res!956249 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46866 a!2831) j!81) mask!2608) (select (arr!46866 a!2831) j!81) a!2831 mask!2608) (Intermediate!11053 false intermediateBeforeIndex!13 intermediateBeforeX!13)))))

(assert (= (and start!122814 res!956245) b!1421495))

(assert (= (and b!1421495 res!956244) b!1421494))

(assert (= (and b!1421494 res!956248) b!1421500))

(assert (= (and b!1421500 res!956246) b!1421497))

(assert (= (and b!1421497 res!956247) b!1421496))

(assert (= (and b!1421496 res!956250) b!1421499))

(assert (= (and b!1421499 res!956251) b!1421502))

(assert (= (and b!1421502 res!956249) b!1421501))

(assert (= (and b!1421501 res!956243) b!1421498))

(declare-fun m!1312233 () Bool)

(assert (=> b!1421502 m!1312233))

(assert (=> b!1421502 m!1312233))

(declare-fun m!1312235 () Bool)

(assert (=> b!1421502 m!1312235))

(assert (=> b!1421502 m!1312235))

(assert (=> b!1421502 m!1312233))

(declare-fun m!1312237 () Bool)

(assert (=> b!1421502 m!1312237))

(assert (=> b!1421500 m!1312233))

(assert (=> b!1421500 m!1312233))

(declare-fun m!1312239 () Bool)

(assert (=> b!1421500 m!1312239))

(assert (=> b!1421498 m!1312233))

(assert (=> b!1421498 m!1312233))

(declare-fun m!1312241 () Bool)

(assert (=> b!1421498 m!1312241))

(declare-fun m!1312243 () Bool)

(assert (=> b!1421497 m!1312243))

(declare-fun m!1312245 () Bool)

(assert (=> start!122814 m!1312245))

(declare-fun m!1312247 () Bool)

(assert (=> start!122814 m!1312247))

(declare-fun m!1312249 () Bool)

(assert (=> b!1421494 m!1312249))

(assert (=> b!1421494 m!1312249))

(declare-fun m!1312251 () Bool)

(assert (=> b!1421494 m!1312251))

(declare-fun m!1312253 () Bool)

(assert (=> b!1421501 m!1312253))

(declare-fun m!1312255 () Bool)

(assert (=> b!1421501 m!1312255))

(assert (=> b!1421501 m!1312255))

(declare-fun m!1312257 () Bool)

(assert (=> b!1421501 m!1312257))

(assert (=> b!1421501 m!1312257))

(assert (=> b!1421501 m!1312255))

(declare-fun m!1312259 () Bool)

(assert (=> b!1421501 m!1312259))

(declare-fun m!1312261 () Bool)

(assert (=> b!1421496 m!1312261))

(push 1)

(assert (not b!1421498))

(assert (not b!1421494))

(assert (not b!1421501))

(assert (not b!1421496))

(assert (not b!1421500))

(assert (not start!122814))

(assert (not b!1421502))

(assert (not b!1421497))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

