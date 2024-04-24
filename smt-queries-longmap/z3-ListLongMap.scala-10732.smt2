; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125808 () Bool)

(assert start!125808)

(declare-fun b!1470377 () Bool)

(declare-fun e!825723 () Bool)

(declare-fun e!825722 () Bool)

(assert (=> b!1470377 (= e!825723 e!825722)))

(declare-fun res!997821 () Bool)

(assert (=> b!1470377 (=> (not res!997821) (not e!825722))))

(declare-datatypes ((SeekEntryResult!11967 0))(
  ( (MissingZero!11967 (index!50260 (_ BitVec 32))) (Found!11967 (index!50261 (_ BitVec 32))) (Intermediate!11967 (undefined!12779 Bool) (index!50262 (_ BitVec 32)) (x!132033 (_ BitVec 32))) (Undefined!11967) (MissingVacant!11967 (index!50263 (_ BitVec 32))) )
))
(declare-fun lt!642978 () SeekEntryResult!11967)

(declare-datatypes ((array!99094 0))(
  ( (array!99095 (arr!47830 (Array (_ BitVec 32) (_ BitVec 64))) (size!48381 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99094)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99094 (_ BitVec 32)) SeekEntryResult!11967)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1470377 (= res!997821 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47830 a!2862) j!93) mask!2687) (select (arr!47830 a!2862) j!93) a!2862 mask!2687) lt!642978))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1470377 (= lt!642978 (Intermediate!11967 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1470378 () Bool)

(declare-fun res!997825 () Bool)

(assert (=> b!1470378 (=> (not res!997825) (not e!825723))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1470378 (= res!997825 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48381 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48381 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48381 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47830 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1470379 () Bool)

(declare-fun res!997822 () Bool)

(assert (=> b!1470379 (=> (not res!997822) (not e!825723))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99094 (_ BitVec 32)) Bool)

(assert (=> b!1470379 (= res!997822 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1470380 () Bool)

(declare-fun res!997824 () Bool)

(assert (=> b!1470380 (=> (not res!997824) (not e!825723))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1470380 (= res!997824 (validKeyInArray!0 (select (arr!47830 a!2862) i!1006)))))

(declare-fun b!1470381 () Bool)

(declare-fun res!997826 () Bool)

(assert (=> b!1470381 (=> (not res!997826) (not e!825723))))

(assert (=> b!1470381 (= res!997826 (validKeyInArray!0 (select (arr!47830 a!2862) j!93)))))

(declare-fun b!1470382 () Bool)

(declare-fun res!997819 () Bool)

(assert (=> b!1470382 (=> (not res!997819) (not e!825723))))

(declare-datatypes ((List!34318 0))(
  ( (Nil!34315) (Cons!34314 (h!35678 (_ BitVec 64)) (t!49004 List!34318)) )
))
(declare-fun arrayNoDuplicates!0 (array!99094 (_ BitVec 32) List!34318) Bool)

(assert (=> b!1470382 (= res!997819 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34315))))

(declare-fun b!1470383 () Bool)

(declare-fun res!997820 () Bool)

(assert (=> b!1470383 (=> (not res!997820) (not e!825722))))

(assert (=> b!1470383 (= res!997820 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47830 a!2862) j!93) a!2862 mask!2687) lt!642978))))

(declare-fun res!997823 () Bool)

(assert (=> start!125808 (=> (not res!997823) (not e!825723))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125808 (= res!997823 (validMask!0 mask!2687))))

(assert (=> start!125808 e!825723))

(assert (=> start!125808 true))

(declare-fun array_inv!37111 (array!99094) Bool)

(assert (=> start!125808 (array_inv!37111 a!2862)))

(declare-fun b!1470384 () Bool)

(declare-fun res!997818 () Bool)

(assert (=> b!1470384 (=> (not res!997818) (not e!825723))))

(assert (=> b!1470384 (= res!997818 (and (= (size!48381 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48381 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48381 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1470385 () Bool)

(assert (=> b!1470385 (= e!825722 false)))

(declare-fun lt!642979 () SeekEntryResult!11967)

(assert (=> b!1470385 (= lt!642979 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47830 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (select (store (arr!47830 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!99095 (store (arr!47830 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48381 a!2862)) mask!2687))))

(assert (= (and start!125808 res!997823) b!1470384))

(assert (= (and b!1470384 res!997818) b!1470380))

(assert (= (and b!1470380 res!997824) b!1470381))

(assert (= (and b!1470381 res!997826) b!1470379))

(assert (= (and b!1470379 res!997822) b!1470382))

(assert (= (and b!1470382 res!997819) b!1470378))

(assert (= (and b!1470378 res!997825) b!1470377))

(assert (= (and b!1470377 res!997821) b!1470383))

(assert (= (and b!1470383 res!997820) b!1470385))

(declare-fun m!1357459 () Bool)

(assert (=> b!1470383 m!1357459))

(assert (=> b!1470383 m!1357459))

(declare-fun m!1357461 () Bool)

(assert (=> b!1470383 m!1357461))

(declare-fun m!1357463 () Bool)

(assert (=> b!1470380 m!1357463))

(assert (=> b!1470380 m!1357463))

(declare-fun m!1357465 () Bool)

(assert (=> b!1470380 m!1357465))

(declare-fun m!1357467 () Bool)

(assert (=> start!125808 m!1357467))

(declare-fun m!1357469 () Bool)

(assert (=> start!125808 m!1357469))

(declare-fun m!1357471 () Bool)

(assert (=> b!1470382 m!1357471))

(assert (=> b!1470381 m!1357459))

(assert (=> b!1470381 m!1357459))

(declare-fun m!1357473 () Bool)

(assert (=> b!1470381 m!1357473))

(declare-fun m!1357475 () Bool)

(assert (=> b!1470379 m!1357475))

(assert (=> b!1470377 m!1357459))

(assert (=> b!1470377 m!1357459))

(declare-fun m!1357477 () Bool)

(assert (=> b!1470377 m!1357477))

(assert (=> b!1470377 m!1357477))

(assert (=> b!1470377 m!1357459))

(declare-fun m!1357479 () Bool)

(assert (=> b!1470377 m!1357479))

(declare-fun m!1357481 () Bool)

(assert (=> b!1470385 m!1357481))

(declare-fun m!1357483 () Bool)

(assert (=> b!1470385 m!1357483))

(assert (=> b!1470385 m!1357483))

(declare-fun m!1357485 () Bool)

(assert (=> b!1470385 m!1357485))

(assert (=> b!1470385 m!1357485))

(assert (=> b!1470385 m!1357483))

(declare-fun m!1357487 () Bool)

(assert (=> b!1470385 m!1357487))

(assert (=> b!1470378 m!1357481))

(declare-fun m!1357489 () Bool)

(assert (=> b!1470378 m!1357489))

(check-sat (not b!1470379) (not b!1470385) (not b!1470380) (not b!1470381) (not b!1470383) (not start!125808) (not b!1470377) (not b!1470382))
(check-sat)
