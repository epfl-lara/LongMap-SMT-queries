; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124680 () Bool)

(assert start!124680)

(declare-fun b!1441394 () Bool)

(declare-fun res!972998 () Bool)

(declare-fun e!812907 () Bool)

(assert (=> b!1441394 (=> (not res!972998) (not e!812907))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!98023 0))(
  ( (array!98024 (arr!47296 (Array (_ BitVec 32) (_ BitVec 64))) (size!47847 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98023)

(assert (=> b!1441394 (= res!972998 (and (= (size!47847 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47847 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47847 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1441395 () Bool)

(declare-fun res!972999 () Bool)

(assert (=> b!1441395 (=> (not res!972999) (not e!812907))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1441395 (= res!972999 (validKeyInArray!0 (select (arr!47296 a!2862) i!1006)))))

(declare-fun b!1441396 () Bool)

(declare-fun res!973004 () Bool)

(assert (=> b!1441396 (=> (not res!973004) (not e!812907))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98023 (_ BitVec 32)) Bool)

(assert (=> b!1441396 (= res!973004 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1441397 () Bool)

(declare-fun res!973002 () Bool)

(declare-fun e!812906 () Bool)

(assert (=> b!1441397 (=> (not res!973002) (not e!812906))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11445 0))(
  ( (MissingZero!11445 (index!48172 (_ BitVec 32))) (Found!11445 (index!48173 (_ BitVec 32))) (Intermediate!11445 (undefined!12257 Bool) (index!48174 (_ BitVec 32)) (x!130078 (_ BitVec 32))) (Undefined!11445) (MissingVacant!11445 (index!48175 (_ BitVec 32))) )
))
(declare-fun lt!633388 () SeekEntryResult!11445)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98023 (_ BitVec 32)) SeekEntryResult!11445)

(assert (=> b!1441397 (= res!973002 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47296 a!2862) j!93) a!2862 mask!2687) lt!633388))))

(declare-fun b!1441398 () Bool)

(assert (=> b!1441398 (= e!812906 false)))

(declare-fun lt!633387 () SeekEntryResult!11445)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1441398 (= lt!633387 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47296 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (select (store (arr!47296 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!98024 (store (arr!47296 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47847 a!2862)) mask!2687))))

(declare-fun b!1441399 () Bool)

(declare-fun res!972996 () Bool)

(assert (=> b!1441399 (=> (not res!972996) (not e!812907))))

(assert (=> b!1441399 (= res!972996 (validKeyInArray!0 (select (arr!47296 a!2862) j!93)))))

(declare-fun b!1441400 () Bool)

(assert (=> b!1441400 (= e!812907 e!812906)))

(declare-fun res!973000 () Bool)

(assert (=> b!1441400 (=> (not res!973000) (not e!812906))))

(assert (=> b!1441400 (= res!973000 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47296 a!2862) j!93) mask!2687) (select (arr!47296 a!2862) j!93) a!2862 mask!2687) lt!633388))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1441400 (= lt!633388 (Intermediate!11445 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1441401 () Bool)

(declare-fun res!973001 () Bool)

(assert (=> b!1441401 (=> (not res!973001) (not e!812907))))

(declare-datatypes ((List!33784 0))(
  ( (Nil!33781) (Cons!33780 (h!35141 (_ BitVec 64)) (t!48470 List!33784)) )
))
(declare-fun arrayNoDuplicates!0 (array!98023 (_ BitVec 32) List!33784) Bool)

(assert (=> b!1441401 (= res!973001 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33781))))

(declare-fun res!972997 () Bool)

(assert (=> start!124680 (=> (not res!972997) (not e!812907))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124680 (= res!972997 (validMask!0 mask!2687))))

(assert (=> start!124680 e!812907))

(assert (=> start!124680 true))

(declare-fun array_inv!36577 (array!98023) Bool)

(assert (=> start!124680 (array_inv!36577 a!2862)))

(declare-fun b!1441402 () Bool)

(declare-fun res!973003 () Bool)

(assert (=> b!1441402 (=> (not res!973003) (not e!812907))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1441402 (= res!973003 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47847 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47847 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47847 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47296 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!124680 res!972997) b!1441394))

(assert (= (and b!1441394 res!972998) b!1441395))

(assert (= (and b!1441395 res!972999) b!1441399))

(assert (= (and b!1441399 res!972996) b!1441396))

(assert (= (and b!1441396 res!973004) b!1441401))

(assert (= (and b!1441401 res!973001) b!1441402))

(assert (= (and b!1441402 res!973003) b!1441400))

(assert (= (and b!1441400 res!973000) b!1441397))

(assert (= (and b!1441397 res!973002) b!1441398))

(declare-fun m!1330651 () Bool)

(assert (=> b!1441395 m!1330651))

(assert (=> b!1441395 m!1330651))

(declare-fun m!1330653 () Bool)

(assert (=> b!1441395 m!1330653))

(declare-fun m!1330655 () Bool)

(assert (=> b!1441402 m!1330655))

(declare-fun m!1330657 () Bool)

(assert (=> b!1441402 m!1330657))

(declare-fun m!1330659 () Bool)

(assert (=> b!1441396 m!1330659))

(assert (=> b!1441398 m!1330655))

(declare-fun m!1330661 () Bool)

(assert (=> b!1441398 m!1330661))

(assert (=> b!1441398 m!1330661))

(declare-fun m!1330663 () Bool)

(assert (=> b!1441398 m!1330663))

(assert (=> b!1441398 m!1330663))

(assert (=> b!1441398 m!1330661))

(declare-fun m!1330665 () Bool)

(assert (=> b!1441398 m!1330665))

(declare-fun m!1330667 () Bool)

(assert (=> b!1441399 m!1330667))

(assert (=> b!1441399 m!1330667))

(declare-fun m!1330669 () Bool)

(assert (=> b!1441399 m!1330669))

(assert (=> b!1441400 m!1330667))

(assert (=> b!1441400 m!1330667))

(declare-fun m!1330671 () Bool)

(assert (=> b!1441400 m!1330671))

(assert (=> b!1441400 m!1330671))

(assert (=> b!1441400 m!1330667))

(declare-fun m!1330673 () Bool)

(assert (=> b!1441400 m!1330673))

(declare-fun m!1330675 () Bool)

(assert (=> start!124680 m!1330675))

(declare-fun m!1330677 () Bool)

(assert (=> start!124680 m!1330677))

(declare-fun m!1330679 () Bool)

(assert (=> b!1441401 m!1330679))

(assert (=> b!1441397 m!1330667))

(assert (=> b!1441397 m!1330667))

(declare-fun m!1330681 () Bool)

(assert (=> b!1441397 m!1330681))

(check-sat (not b!1441401) (not b!1441396) (not b!1441400) (not start!124680) (not b!1441395) (not b!1441398) (not b!1441399) (not b!1441397))
(check-sat)
