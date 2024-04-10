; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124206 () Bool)

(assert start!124206)

(declare-fun b!1437583 () Bool)

(declare-fun res!970364 () Bool)

(declare-fun e!811056 () Bool)

(assert (=> b!1437583 (=> (not res!970364) (not e!811056))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!97771 0))(
  ( (array!97772 (arr!47178 (Array (_ BitVec 32) (_ BitVec 64))) (size!47728 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97771)

(assert (=> b!1437583 (= res!970364 (and (= (size!47728 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47728 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47728 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1437584 () Bool)

(declare-fun e!811058 () Bool)

(assert (=> b!1437584 (= e!811058 false)))

(declare-fun lt!632346 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1437584 (= lt!632346 (toIndex!0 (select (store (arr!47178 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687))))

(declare-fun b!1437585 () Bool)

(declare-fun res!970366 () Bool)

(assert (=> b!1437585 (=> (not res!970366) (not e!811056))))

(declare-datatypes ((List!33679 0))(
  ( (Nil!33676) (Cons!33675 (h!35016 (_ BitVec 64)) (t!48373 List!33679)) )
))
(declare-fun arrayNoDuplicates!0 (array!97771 (_ BitVec 32) List!33679) Bool)

(assert (=> b!1437585 (= res!970366 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33676))))

(declare-fun b!1437586 () Bool)

(declare-fun res!970369 () Bool)

(assert (=> b!1437586 (=> (not res!970369) (not e!811056))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1437586 (= res!970369 (validKeyInArray!0 (select (arr!47178 a!2862) j!93)))))

(declare-fun b!1437587 () Bool)

(declare-fun res!970365 () Bool)

(assert (=> b!1437587 (=> (not res!970365) (not e!811056))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97771 (_ BitVec 32)) Bool)

(assert (=> b!1437587 (= res!970365 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1437588 () Bool)

(declare-fun res!970362 () Bool)

(assert (=> b!1437588 (=> (not res!970362) (not e!811056))))

(assert (=> b!1437588 (= res!970362 (validKeyInArray!0 (select (arr!47178 a!2862) i!1006)))))

(declare-fun b!1437589 () Bool)

(declare-fun res!970361 () Bool)

(assert (=> b!1437589 (=> (not res!970361) (not e!811056))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1437589 (= res!970361 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47728 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47728 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47728 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47178 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!970368 () Bool)

(assert (=> start!124206 (=> (not res!970368) (not e!811056))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124206 (= res!970368 (validMask!0 mask!2687))))

(assert (=> start!124206 e!811056))

(assert (=> start!124206 true))

(declare-fun array_inv!36206 (array!97771) Bool)

(assert (=> start!124206 (array_inv!36206 a!2862)))

(declare-fun b!1437590 () Bool)

(assert (=> b!1437590 (= e!811056 e!811058)))

(declare-fun res!970363 () Bool)

(assert (=> b!1437590 (=> (not res!970363) (not e!811058))))

(declare-datatypes ((SeekEntryResult!11430 0))(
  ( (MissingZero!11430 (index!48112 (_ BitVec 32))) (Found!11430 (index!48113 (_ BitVec 32))) (Intermediate!11430 (undefined!12242 Bool) (index!48114 (_ BitVec 32)) (x!129845 (_ BitVec 32))) (Undefined!11430) (MissingVacant!11430 (index!48115 (_ BitVec 32))) )
))
(declare-fun lt!632345 () SeekEntryResult!11430)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97771 (_ BitVec 32)) SeekEntryResult!11430)

(assert (=> b!1437590 (= res!970363 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47178 a!2862) j!93) mask!2687) (select (arr!47178 a!2862) j!93) a!2862 mask!2687) lt!632345))))

(assert (=> b!1437590 (= lt!632345 (Intermediate!11430 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1437591 () Bool)

(declare-fun res!970367 () Bool)

(assert (=> b!1437591 (=> (not res!970367) (not e!811058))))

(assert (=> b!1437591 (= res!970367 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47178 a!2862) j!93) a!2862 mask!2687) lt!632345))))

(assert (= (and start!124206 res!970368) b!1437583))

(assert (= (and b!1437583 res!970364) b!1437588))

(assert (= (and b!1437588 res!970362) b!1437586))

(assert (= (and b!1437586 res!970369) b!1437587))

(assert (= (and b!1437587 res!970365) b!1437585))

(assert (= (and b!1437585 res!970366) b!1437589))

(assert (= (and b!1437589 res!970361) b!1437590))

(assert (= (and b!1437590 res!970363) b!1437591))

(assert (= (and b!1437591 res!970367) b!1437584))

(declare-fun m!1326811 () Bool)

(assert (=> b!1437584 m!1326811))

(declare-fun m!1326813 () Bool)

(assert (=> b!1437584 m!1326813))

(assert (=> b!1437584 m!1326813))

(declare-fun m!1326815 () Bool)

(assert (=> b!1437584 m!1326815))

(declare-fun m!1326817 () Bool)

(assert (=> b!1437585 m!1326817))

(declare-fun m!1326819 () Bool)

(assert (=> b!1437588 m!1326819))

(assert (=> b!1437588 m!1326819))

(declare-fun m!1326821 () Bool)

(assert (=> b!1437588 m!1326821))

(assert (=> b!1437589 m!1326811))

(declare-fun m!1326823 () Bool)

(assert (=> b!1437589 m!1326823))

(declare-fun m!1326825 () Bool)

(assert (=> b!1437590 m!1326825))

(assert (=> b!1437590 m!1326825))

(declare-fun m!1326827 () Bool)

(assert (=> b!1437590 m!1326827))

(assert (=> b!1437590 m!1326827))

(assert (=> b!1437590 m!1326825))

(declare-fun m!1326829 () Bool)

(assert (=> b!1437590 m!1326829))

(assert (=> b!1437591 m!1326825))

(assert (=> b!1437591 m!1326825))

(declare-fun m!1326831 () Bool)

(assert (=> b!1437591 m!1326831))

(declare-fun m!1326833 () Bool)

(assert (=> b!1437587 m!1326833))

(assert (=> b!1437586 m!1326825))

(assert (=> b!1437586 m!1326825))

(declare-fun m!1326835 () Bool)

(assert (=> b!1437586 m!1326835))

(declare-fun m!1326837 () Bool)

(assert (=> start!124206 m!1326837))

(declare-fun m!1326839 () Bool)

(assert (=> start!124206 m!1326839))

(check-sat (not b!1437586) (not b!1437585) (not b!1437587) (not b!1437584) (not b!1437591) (not b!1437588) (not b!1437590) (not start!124206))
(check-sat)
