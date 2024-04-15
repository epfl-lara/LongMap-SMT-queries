; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125458 () Bool)

(assert start!125458)

(declare-fun b!1467907 () Bool)

(declare-fun e!824354 () Bool)

(declare-fun e!824355 () Bool)

(assert (=> b!1467907 (= e!824354 e!824355)))

(declare-fun res!996566 () Bool)

(assert (=> b!1467907 (=> (not res!996566) (not e!824355))))

(declare-datatypes ((SeekEntryResult!11996 0))(
  ( (MissingZero!11996 (index!50376 (_ BitVec 32))) (Found!11996 (index!50377 (_ BitVec 32))) (Intermediate!11996 (undefined!12808 Bool) (index!50378 (_ BitVec 32)) (x!131968 (_ BitVec 32))) (Undefined!11996) (MissingVacant!11996 (index!50379 (_ BitVec 32))) )
))
(declare-fun lt!641981 () SeekEntryResult!11996)

(declare-datatypes ((array!98884 0))(
  ( (array!98885 (arr!47731 (Array (_ BitVec 32) (_ BitVec 64))) (size!48283 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98884)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98884 (_ BitVec 32)) SeekEntryResult!11996)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1467907 (= res!996566 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47731 a!2862) j!93) mask!2687) (select (arr!47731 a!2862) j!93) a!2862 mask!2687) lt!641981))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1467907 (= lt!641981 (Intermediate!11996 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1467908 () Bool)

(declare-fun res!996564 () Bool)

(assert (=> b!1467908 (=> (not res!996564) (not e!824354))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1467908 (= res!996564 (validKeyInArray!0 (select (arr!47731 a!2862) j!93)))))

(declare-fun b!1467909 () Bool)

(declare-fun res!996565 () Bool)

(assert (=> b!1467909 (=> (not res!996565) (not e!824354))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1467909 (= res!996565 (validKeyInArray!0 (select (arr!47731 a!2862) i!1006)))))

(declare-fun b!1467910 () Bool)

(declare-fun res!996571 () Bool)

(assert (=> b!1467910 (=> (not res!996571) (not e!824354))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98884 (_ BitVec 32)) Bool)

(assert (=> b!1467910 (= res!996571 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1467911 () Bool)

(declare-fun res!996569 () Bool)

(assert (=> b!1467911 (=> (not res!996569) (not e!824354))))

(declare-datatypes ((List!34310 0))(
  ( (Nil!34307) (Cons!34306 (h!35656 (_ BitVec 64)) (t!48996 List!34310)) )
))
(declare-fun arrayNoDuplicates!0 (array!98884 (_ BitVec 32) List!34310) Bool)

(assert (=> b!1467911 (= res!996569 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34307))))

(declare-fun b!1467912 () Bool)

(assert (=> b!1467912 (= e!824355 false)))

(declare-fun lt!641982 () SeekEntryResult!11996)

(assert (=> b!1467912 (= lt!641982 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47731 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (select (store (arr!47731 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!98885 (store (arr!47731 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48283 a!2862)) mask!2687))))

(declare-fun res!996567 () Bool)

(assert (=> start!125458 (=> (not res!996567) (not e!824354))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125458 (= res!996567 (validMask!0 mask!2687))))

(assert (=> start!125458 e!824354))

(assert (=> start!125458 true))

(declare-fun array_inv!36964 (array!98884) Bool)

(assert (=> start!125458 (array_inv!36964 a!2862)))

(declare-fun b!1467913 () Bool)

(declare-fun res!996568 () Bool)

(assert (=> b!1467913 (=> (not res!996568) (not e!824355))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1467913 (= res!996568 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47731 a!2862) j!93) a!2862 mask!2687) lt!641981))))

(declare-fun b!1467914 () Bool)

(declare-fun res!996563 () Bool)

(assert (=> b!1467914 (=> (not res!996563) (not e!824354))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1467914 (= res!996563 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48283 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48283 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48283 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47731 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1467915 () Bool)

(declare-fun res!996570 () Bool)

(assert (=> b!1467915 (=> (not res!996570) (not e!824354))))

(assert (=> b!1467915 (= res!996570 (and (= (size!48283 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48283 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48283 a!2862)) (not (= i!1006 j!93))))))

(assert (= (and start!125458 res!996567) b!1467915))

(assert (= (and b!1467915 res!996570) b!1467909))

(assert (= (and b!1467909 res!996565) b!1467908))

(assert (= (and b!1467908 res!996564) b!1467910))

(assert (= (and b!1467910 res!996571) b!1467911))

(assert (= (and b!1467911 res!996569) b!1467914))

(assert (= (and b!1467914 res!996563) b!1467907))

(assert (= (and b!1467907 res!996566) b!1467913))

(assert (= (and b!1467913 res!996568) b!1467912))

(declare-fun m!1354425 () Bool)

(assert (=> b!1467907 m!1354425))

(assert (=> b!1467907 m!1354425))

(declare-fun m!1354427 () Bool)

(assert (=> b!1467907 m!1354427))

(assert (=> b!1467907 m!1354427))

(assert (=> b!1467907 m!1354425))

(declare-fun m!1354429 () Bool)

(assert (=> b!1467907 m!1354429))

(assert (=> b!1467913 m!1354425))

(assert (=> b!1467913 m!1354425))

(declare-fun m!1354431 () Bool)

(assert (=> b!1467913 m!1354431))

(declare-fun m!1354433 () Bool)

(assert (=> b!1467909 m!1354433))

(assert (=> b!1467909 m!1354433))

(declare-fun m!1354435 () Bool)

(assert (=> b!1467909 m!1354435))

(assert (=> b!1467908 m!1354425))

(assert (=> b!1467908 m!1354425))

(declare-fun m!1354437 () Bool)

(assert (=> b!1467908 m!1354437))

(declare-fun m!1354439 () Bool)

(assert (=> b!1467911 m!1354439))

(declare-fun m!1354441 () Bool)

(assert (=> b!1467914 m!1354441))

(declare-fun m!1354443 () Bool)

(assert (=> b!1467914 m!1354443))

(declare-fun m!1354445 () Bool)

(assert (=> start!125458 m!1354445))

(declare-fun m!1354447 () Bool)

(assert (=> start!125458 m!1354447))

(assert (=> b!1467912 m!1354441))

(declare-fun m!1354449 () Bool)

(assert (=> b!1467912 m!1354449))

(assert (=> b!1467912 m!1354449))

(declare-fun m!1354451 () Bool)

(assert (=> b!1467912 m!1354451))

(assert (=> b!1467912 m!1354451))

(assert (=> b!1467912 m!1354449))

(declare-fun m!1354453 () Bool)

(assert (=> b!1467912 m!1354453))

(declare-fun m!1354455 () Bool)

(assert (=> b!1467910 m!1354455))

(check-sat (not b!1467909) (not b!1467911) (not b!1467910) (not b!1467913) (not b!1467912) (not start!125458) (not b!1467907) (not b!1467908))
(check-sat)
