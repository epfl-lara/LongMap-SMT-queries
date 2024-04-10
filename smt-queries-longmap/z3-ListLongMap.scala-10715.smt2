; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125430 () Bool)

(assert start!125430)

(declare-fun b!1467434 () Bool)

(declare-fun res!995974 () Bool)

(declare-fun e!824267 () Bool)

(assert (=> b!1467434 (=> (not res!995974) (not e!824267))))

(declare-datatypes ((array!98878 0))(
  ( (array!98879 (arr!47727 (Array (_ BitVec 32) (_ BitVec 64))) (size!48277 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98878)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98878 (_ BitVec 32)) Bool)

(assert (=> b!1467434 (= res!995974 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1467435 () Bool)

(assert (=> b!1467435 (= e!824267 false)))

(declare-fun lt!642099 () Bool)

(declare-datatypes ((List!34228 0))(
  ( (Nil!34225) (Cons!34224 (h!35574 (_ BitVec 64)) (t!48922 List!34228)) )
))
(declare-fun arrayNoDuplicates!0 (array!98878 (_ BitVec 32) List!34228) Bool)

(assert (=> b!1467435 (= lt!642099 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34225))))

(declare-fun res!995973 () Bool)

(assert (=> start!125430 (=> (not res!995973) (not e!824267))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125430 (= res!995973 (validMask!0 mask!2687))))

(assert (=> start!125430 e!824267))

(assert (=> start!125430 true))

(declare-fun array_inv!36755 (array!98878) Bool)

(assert (=> start!125430 (array_inv!36755 a!2862)))

(declare-fun b!1467436 () Bool)

(declare-fun res!995976 () Bool)

(assert (=> b!1467436 (=> (not res!995976) (not e!824267))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1467436 (= res!995976 (validKeyInArray!0 (select (arr!47727 a!2862) i!1006)))))

(declare-fun b!1467437 () Bool)

(declare-fun res!995975 () Bool)

(assert (=> b!1467437 (=> (not res!995975) (not e!824267))))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1467437 (= res!995975 (and (= (size!48277 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48277 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48277 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1467438 () Bool)

(declare-fun res!995977 () Bool)

(assert (=> b!1467438 (=> (not res!995977) (not e!824267))))

(assert (=> b!1467438 (= res!995977 (validKeyInArray!0 (select (arr!47727 a!2862) j!93)))))

(assert (= (and start!125430 res!995973) b!1467437))

(assert (= (and b!1467437 res!995975) b!1467436))

(assert (= (and b!1467436 res!995976) b!1467438))

(assert (= (and b!1467438 res!995977) b!1467434))

(assert (= (and b!1467434 res!995974) b!1467435))

(declare-fun m!1354373 () Bool)

(assert (=> b!1467436 m!1354373))

(assert (=> b!1467436 m!1354373))

(declare-fun m!1354375 () Bool)

(assert (=> b!1467436 m!1354375))

(declare-fun m!1354377 () Bool)

(assert (=> b!1467438 m!1354377))

(assert (=> b!1467438 m!1354377))

(declare-fun m!1354379 () Bool)

(assert (=> b!1467438 m!1354379))

(declare-fun m!1354381 () Bool)

(assert (=> start!125430 m!1354381))

(declare-fun m!1354383 () Bool)

(assert (=> start!125430 m!1354383))

(declare-fun m!1354385 () Bool)

(assert (=> b!1467435 m!1354385))

(declare-fun m!1354387 () Bool)

(assert (=> b!1467434 m!1354387))

(check-sat (not b!1467435) (not b!1467434) (not start!125430) (not b!1467436) (not b!1467438))
