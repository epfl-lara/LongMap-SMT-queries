; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124500 () Bool)

(assert start!124500)

(declare-fun b!1439569 () Bool)

(declare-fun res!971421 () Bool)

(declare-fun e!812180 () Bool)

(assert (=> b!1439569 (=> (not res!971421) (not e!812180))))

(declare-datatypes ((array!97921 0))(
  ( (array!97922 (arr!47248 (Array (_ BitVec 32) (_ BitVec 64))) (size!47799 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97921)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97921 (_ BitVec 32)) Bool)

(assert (=> b!1439569 (= res!971421 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1439570 () Bool)

(declare-fun res!971426 () Bool)

(assert (=> b!1439570 (=> (not res!971426) (not e!812180))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1439570 (= res!971426 (validKeyInArray!0 (select (arr!47248 a!2862) i!1006)))))

(declare-fun b!1439571 () Bool)

(declare-fun res!971422 () Bool)

(assert (=> b!1439571 (=> (not res!971422) (not e!812180))))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1439571 (= res!971422 (validKeyInArray!0 (select (arr!47248 a!2862) j!93)))))

(declare-fun b!1439572 () Bool)

(declare-fun res!971420 () Bool)

(declare-fun e!812181 () Bool)

(assert (=> b!1439572 (=> (not res!971420) (not e!812181))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11397 0))(
  ( (MissingZero!11397 (index!47980 (_ BitVec 32))) (Found!11397 (index!47981 (_ BitVec 32))) (Intermediate!11397 (undefined!12209 Bool) (index!47982 (_ BitVec 32)) (x!129890 (_ BitVec 32))) (Undefined!11397) (MissingVacant!11397 (index!47983 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97921 (_ BitVec 32)) SeekEntryResult!11397)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1439572 (= res!971420 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47248 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (select (store (arr!47248 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!97922 (store (arr!47248 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47799 a!2862)) mask!2687) (Intermediate!11397 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun b!1439573 () Bool)

(declare-fun res!971423 () Bool)

(assert (=> b!1439573 (=> (not res!971423) (not e!812180))))

(declare-datatypes ((List!33736 0))(
  ( (Nil!33733) (Cons!33732 (h!35087 (_ BitVec 64)) (t!48422 List!33736)) )
))
(declare-fun arrayNoDuplicates!0 (array!97921 (_ BitVec 32) List!33736) Bool)

(assert (=> b!1439573 (= res!971423 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33733))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun b!1439574 () Bool)

(assert (=> b!1439574 (= e!812181 (and (bvsle x!665 intermediateAfterX!19) (bvslt mask!2687 #b00000000000000000000000000000000)))))

(declare-fun b!1439575 () Bool)

(assert (=> b!1439575 (= e!812180 e!812181)))

(declare-fun res!971424 () Bool)

(assert (=> b!1439575 (=> (not res!971424) (not e!812181))))

(declare-fun lt!632998 () SeekEntryResult!11397)

(assert (=> b!1439575 (= res!971424 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47248 a!2862) j!93) mask!2687) (select (arr!47248 a!2862) j!93) a!2862 mask!2687) lt!632998))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1439575 (= lt!632998 (Intermediate!11397 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1439576 () Bool)

(declare-fun res!971417 () Bool)

(assert (=> b!1439576 (=> (not res!971417) (not e!812181))))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1439576 (= res!971417 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47248 a!2862) j!93) a!2862 mask!2687) lt!632998))))

(declare-fun b!1439577 () Bool)

(declare-fun res!971419 () Bool)

(assert (=> b!1439577 (=> (not res!971419) (not e!812180))))

(assert (=> b!1439577 (= res!971419 (and (= (size!47799 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47799 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47799 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1439578 () Bool)

(declare-fun res!971418 () Bool)

(assert (=> b!1439578 (=> (not res!971418) (not e!812180))))

(assert (=> b!1439578 (= res!971418 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47799 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47799 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47799 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47248 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!971425 () Bool)

(assert (=> start!124500 (=> (not res!971425) (not e!812180))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124500 (= res!971425 (validMask!0 mask!2687))))

(assert (=> start!124500 e!812180))

(assert (=> start!124500 true))

(declare-fun array_inv!36529 (array!97921) Bool)

(assert (=> start!124500 (array_inv!36529 a!2862)))

(assert (= (and start!124500 res!971425) b!1439577))

(assert (= (and b!1439577 res!971419) b!1439570))

(assert (= (and b!1439570 res!971426) b!1439571))

(assert (= (and b!1439571 res!971422) b!1439569))

(assert (= (and b!1439569 res!971421) b!1439573))

(assert (= (and b!1439573 res!971423) b!1439578))

(assert (= (and b!1439578 res!971418) b!1439575))

(assert (= (and b!1439575 res!971424) b!1439576))

(assert (= (and b!1439576 res!971417) b!1439572))

(assert (= (and b!1439572 res!971420) b!1439574))

(declare-fun m!1328863 () Bool)

(assert (=> b!1439576 m!1328863))

(assert (=> b!1439576 m!1328863))

(declare-fun m!1328865 () Bool)

(assert (=> b!1439576 m!1328865))

(assert (=> b!1439575 m!1328863))

(assert (=> b!1439575 m!1328863))

(declare-fun m!1328867 () Bool)

(assert (=> b!1439575 m!1328867))

(assert (=> b!1439575 m!1328867))

(assert (=> b!1439575 m!1328863))

(declare-fun m!1328869 () Bool)

(assert (=> b!1439575 m!1328869))

(declare-fun m!1328871 () Bool)

(assert (=> b!1439569 m!1328871))

(declare-fun m!1328873 () Bool)

(assert (=> b!1439578 m!1328873))

(declare-fun m!1328875 () Bool)

(assert (=> b!1439578 m!1328875))

(declare-fun m!1328877 () Bool)

(assert (=> b!1439570 m!1328877))

(assert (=> b!1439570 m!1328877))

(declare-fun m!1328879 () Bool)

(assert (=> b!1439570 m!1328879))

(assert (=> b!1439571 m!1328863))

(assert (=> b!1439571 m!1328863))

(declare-fun m!1328881 () Bool)

(assert (=> b!1439571 m!1328881))

(declare-fun m!1328883 () Bool)

(assert (=> b!1439573 m!1328883))

(assert (=> b!1439572 m!1328873))

(declare-fun m!1328885 () Bool)

(assert (=> b!1439572 m!1328885))

(assert (=> b!1439572 m!1328885))

(declare-fun m!1328887 () Bool)

(assert (=> b!1439572 m!1328887))

(assert (=> b!1439572 m!1328887))

(assert (=> b!1439572 m!1328885))

(declare-fun m!1328889 () Bool)

(assert (=> b!1439572 m!1328889))

(declare-fun m!1328891 () Bool)

(assert (=> start!124500 m!1328891))

(declare-fun m!1328893 () Bool)

(assert (=> start!124500 m!1328893))

(check-sat (not b!1439570) (not b!1439575) (not b!1439573) (not b!1439571) (not b!1439572) (not b!1439569) (not b!1439576) (not start!124500))
(check-sat)
