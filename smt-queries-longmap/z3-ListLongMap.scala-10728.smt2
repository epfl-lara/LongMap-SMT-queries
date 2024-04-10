; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125508 () Bool)

(assert start!125508)

(declare-fun b!1468372 () Bool)

(declare-fun e!824559 () Bool)

(assert (=> b!1468372 (= e!824559 false)))

(declare-datatypes ((SeekEntryResult!12006 0))(
  ( (MissingZero!12006 (index!50416 (_ BitVec 32))) (Found!12006 (index!50417 (_ BitVec 32))) (Intermediate!12006 (undefined!12818 Bool) (index!50418 (_ BitVec 32)) (x!132007 (_ BitVec 32))) (Undefined!12006) (MissingVacant!12006 (index!50419 (_ BitVec 32))) )
))
(declare-fun lt!642276 () SeekEntryResult!12006)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!98956 0))(
  ( (array!98957 (arr!47766 (Array (_ BitVec 32) (_ BitVec 64))) (size!48316 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98956)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98956 (_ BitVec 32)) SeekEntryResult!12006)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1468372 (= lt!642276 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47766 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (select (store (arr!47766 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!98957 (store (arr!47766 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48316 a!2862)) mask!2687))))

(declare-fun res!996918 () Bool)

(declare-fun e!824561 () Bool)

(assert (=> start!125508 (=> (not res!996918) (not e!824561))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125508 (= res!996918 (validMask!0 mask!2687))))

(assert (=> start!125508 e!824561))

(assert (=> start!125508 true))

(declare-fun array_inv!36794 (array!98956) Bool)

(assert (=> start!125508 (array_inv!36794 a!2862)))

(declare-fun b!1468373 () Bool)

(declare-fun res!996915 () Bool)

(assert (=> b!1468373 (=> (not res!996915) (not e!824561))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1468373 (= res!996915 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48316 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48316 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48316 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47766 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1468374 () Bool)

(declare-fun res!996914 () Bool)

(assert (=> b!1468374 (=> (not res!996914) (not e!824561))))

(assert (=> b!1468374 (= res!996914 (and (= (size!48316 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48316 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48316 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1468375 () Bool)

(assert (=> b!1468375 (= e!824561 e!824559)))

(declare-fun res!996917 () Bool)

(assert (=> b!1468375 (=> (not res!996917) (not e!824559))))

(declare-fun lt!642275 () SeekEntryResult!12006)

(assert (=> b!1468375 (= res!996917 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47766 a!2862) j!93) mask!2687) (select (arr!47766 a!2862) j!93) a!2862 mask!2687) lt!642275))))

(assert (=> b!1468375 (= lt!642275 (Intermediate!12006 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1468376 () Bool)

(declare-fun res!996919 () Bool)

(assert (=> b!1468376 (=> (not res!996919) (not e!824561))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1468376 (= res!996919 (validKeyInArray!0 (select (arr!47766 a!2862) j!93)))))

(declare-fun b!1468377 () Bool)

(declare-fun res!996916 () Bool)

(assert (=> b!1468377 (=> (not res!996916) (not e!824561))))

(declare-datatypes ((List!34267 0))(
  ( (Nil!34264) (Cons!34263 (h!35613 (_ BitVec 64)) (t!48961 List!34267)) )
))
(declare-fun arrayNoDuplicates!0 (array!98956 (_ BitVec 32) List!34267) Bool)

(assert (=> b!1468377 (= res!996916 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34264))))

(declare-fun b!1468378 () Bool)

(declare-fun res!996911 () Bool)

(assert (=> b!1468378 (=> (not res!996911) (not e!824561))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98956 (_ BitVec 32)) Bool)

(assert (=> b!1468378 (= res!996911 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1468379 () Bool)

(declare-fun res!996913 () Bool)

(assert (=> b!1468379 (=> (not res!996913) (not e!824559))))

(assert (=> b!1468379 (= res!996913 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47766 a!2862) j!93) a!2862 mask!2687) lt!642275))))

(declare-fun b!1468380 () Bool)

(declare-fun res!996912 () Bool)

(assert (=> b!1468380 (=> (not res!996912) (not e!824561))))

(assert (=> b!1468380 (= res!996912 (validKeyInArray!0 (select (arr!47766 a!2862) i!1006)))))

(assert (= (and start!125508 res!996918) b!1468374))

(assert (= (and b!1468374 res!996914) b!1468380))

(assert (= (and b!1468380 res!996912) b!1468376))

(assert (= (and b!1468376 res!996919) b!1468378))

(assert (= (and b!1468378 res!996911) b!1468377))

(assert (= (and b!1468377 res!996916) b!1468373))

(assert (= (and b!1468373 res!996915) b!1468375))

(assert (= (and b!1468375 res!996917) b!1468379))

(assert (= (and b!1468379 res!996913) b!1468372))

(declare-fun m!1355421 () Bool)

(assert (=> b!1468376 m!1355421))

(assert (=> b!1468376 m!1355421))

(declare-fun m!1355423 () Bool)

(assert (=> b!1468376 m!1355423))

(declare-fun m!1355425 () Bool)

(assert (=> b!1468377 m!1355425))

(declare-fun m!1355427 () Bool)

(assert (=> b!1468373 m!1355427))

(declare-fun m!1355429 () Bool)

(assert (=> b!1468373 m!1355429))

(assert (=> b!1468379 m!1355421))

(assert (=> b!1468379 m!1355421))

(declare-fun m!1355431 () Bool)

(assert (=> b!1468379 m!1355431))

(declare-fun m!1355433 () Bool)

(assert (=> b!1468380 m!1355433))

(assert (=> b!1468380 m!1355433))

(declare-fun m!1355435 () Bool)

(assert (=> b!1468380 m!1355435))

(declare-fun m!1355437 () Bool)

(assert (=> b!1468378 m!1355437))

(assert (=> b!1468375 m!1355421))

(assert (=> b!1468375 m!1355421))

(declare-fun m!1355439 () Bool)

(assert (=> b!1468375 m!1355439))

(assert (=> b!1468375 m!1355439))

(assert (=> b!1468375 m!1355421))

(declare-fun m!1355441 () Bool)

(assert (=> b!1468375 m!1355441))

(declare-fun m!1355443 () Bool)

(assert (=> start!125508 m!1355443))

(declare-fun m!1355445 () Bool)

(assert (=> start!125508 m!1355445))

(assert (=> b!1468372 m!1355427))

(declare-fun m!1355447 () Bool)

(assert (=> b!1468372 m!1355447))

(assert (=> b!1468372 m!1355447))

(declare-fun m!1355449 () Bool)

(assert (=> b!1468372 m!1355449))

(assert (=> b!1468372 m!1355449))

(assert (=> b!1468372 m!1355447))

(declare-fun m!1355451 () Bool)

(assert (=> b!1468372 m!1355451))

(check-sat (not b!1468380) (not b!1468379) (not b!1468378) (not b!1468376) (not b!1468377) (not b!1468375) (not start!125508) (not b!1468372))
(check-sat)
