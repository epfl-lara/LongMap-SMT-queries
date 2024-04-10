; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124498 () Bool)

(assert start!124498)

(declare-fun b!1440589 () Bool)

(declare-fun res!973019 () Bool)

(declare-fun e!812231 () Bool)

(assert (=> b!1440589 (=> (not res!973019) (not e!812231))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!97946 0))(
  ( (array!97947 (arr!47261 (Array (_ BitVec 32) (_ BitVec 64))) (size!47811 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97946)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11513 0))(
  ( (MissingZero!11513 (index!48444 (_ BitVec 32))) (Found!11513 (index!48445 (_ BitVec 32))) (Intermediate!11513 (undefined!12325 Bool) (index!48446 (_ BitVec 32)) (x!130170 (_ BitVec 32))) (Undefined!11513) (MissingVacant!11513 (index!48447 (_ BitVec 32))) )
))
(declare-fun lt!632991 () SeekEntryResult!11513)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97946 (_ BitVec 32)) SeekEntryResult!11513)

(assert (=> b!1440589 (= res!973019 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47261 a!2862) j!93) a!2862 mask!2687) lt!632991))))

(declare-fun b!1440590 () Bool)

(declare-fun res!973024 () Bool)

(declare-fun e!812229 () Bool)

(assert (=> b!1440590 (=> (not res!973024) (not e!812229))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1440590 (= res!973024 (validKeyInArray!0 (select (arr!47261 a!2862) i!1006)))))

(declare-fun b!1440591 () Bool)

(declare-fun res!973017 () Bool)

(assert (=> b!1440591 (=> (not res!973017) (not e!812229))))

(declare-datatypes ((List!33762 0))(
  ( (Nil!33759) (Cons!33758 (h!35108 (_ BitVec 64)) (t!48456 List!33762)) )
))
(declare-fun arrayNoDuplicates!0 (array!97946 (_ BitVec 32) List!33762) Bool)

(assert (=> b!1440591 (= res!973017 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33759))))

(declare-fun b!1440592 () Bool)

(declare-fun res!973021 () Bool)

(assert (=> b!1440592 (=> (not res!973021) (not e!812229))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1440592 (= res!973021 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47811 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47811 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47811 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47261 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1440593 () Bool)

(declare-fun res!973016 () Bool)

(assert (=> b!1440593 (=> (not res!973016) (not e!812229))))

(assert (=> b!1440593 (= res!973016 (and (= (size!47811 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47811 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47811 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1440594 () Bool)

(declare-fun res!973018 () Bool)

(assert (=> b!1440594 (=> (not res!973018) (not e!812229))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97946 (_ BitVec 32)) Bool)

(assert (=> b!1440594 (= res!973018 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1440595 () Bool)

(assert (=> b!1440595 (= e!812231 false)))

(declare-fun lt!632990 () SeekEntryResult!11513)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1440595 (= lt!632990 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47261 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (select (store (arr!47261 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!97947 (store (arr!47261 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47811 a!2862)) mask!2687))))

(declare-fun b!1440596 () Bool)

(assert (=> b!1440596 (= e!812229 e!812231)))

(declare-fun res!973022 () Bool)

(assert (=> b!1440596 (=> (not res!973022) (not e!812231))))

(assert (=> b!1440596 (= res!973022 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47261 a!2862) j!93) mask!2687) (select (arr!47261 a!2862) j!93) a!2862 mask!2687) lt!632991))))

(assert (=> b!1440596 (= lt!632991 (Intermediate!11513 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun res!973023 () Bool)

(assert (=> start!124498 (=> (not res!973023) (not e!812229))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124498 (= res!973023 (validMask!0 mask!2687))))

(assert (=> start!124498 e!812229))

(assert (=> start!124498 true))

(declare-fun array_inv!36289 (array!97946) Bool)

(assert (=> start!124498 (array_inv!36289 a!2862)))

(declare-fun b!1440597 () Bool)

(declare-fun res!973020 () Bool)

(assert (=> b!1440597 (=> (not res!973020) (not e!812229))))

(assert (=> b!1440597 (= res!973020 (validKeyInArray!0 (select (arr!47261 a!2862) j!93)))))

(assert (= (and start!124498 res!973023) b!1440593))

(assert (= (and b!1440593 res!973016) b!1440590))

(assert (= (and b!1440590 res!973024) b!1440597))

(assert (= (and b!1440597 res!973020) b!1440594))

(assert (= (and b!1440594 res!973018) b!1440591))

(assert (= (and b!1440591 res!973017) b!1440592))

(assert (= (and b!1440592 res!973021) b!1440596))

(assert (= (and b!1440596 res!973022) b!1440589))

(assert (= (and b!1440589 res!973019) b!1440595))

(declare-fun m!1329793 () Bool)

(assert (=> b!1440589 m!1329793))

(assert (=> b!1440589 m!1329793))

(declare-fun m!1329795 () Bool)

(assert (=> b!1440589 m!1329795))

(declare-fun m!1329797 () Bool)

(assert (=> b!1440592 m!1329797))

(declare-fun m!1329799 () Bool)

(assert (=> b!1440592 m!1329799))

(assert (=> b!1440597 m!1329793))

(assert (=> b!1440597 m!1329793))

(declare-fun m!1329801 () Bool)

(assert (=> b!1440597 m!1329801))

(assert (=> b!1440595 m!1329797))

(declare-fun m!1329803 () Bool)

(assert (=> b!1440595 m!1329803))

(assert (=> b!1440595 m!1329803))

(declare-fun m!1329805 () Bool)

(assert (=> b!1440595 m!1329805))

(assert (=> b!1440595 m!1329805))

(assert (=> b!1440595 m!1329803))

(declare-fun m!1329807 () Bool)

(assert (=> b!1440595 m!1329807))

(declare-fun m!1329809 () Bool)

(assert (=> b!1440590 m!1329809))

(assert (=> b!1440590 m!1329809))

(declare-fun m!1329811 () Bool)

(assert (=> b!1440590 m!1329811))

(declare-fun m!1329813 () Bool)

(assert (=> b!1440591 m!1329813))

(assert (=> b!1440596 m!1329793))

(assert (=> b!1440596 m!1329793))

(declare-fun m!1329815 () Bool)

(assert (=> b!1440596 m!1329815))

(assert (=> b!1440596 m!1329815))

(assert (=> b!1440596 m!1329793))

(declare-fun m!1329817 () Bool)

(assert (=> b!1440596 m!1329817))

(declare-fun m!1329819 () Bool)

(assert (=> start!124498 m!1329819))

(declare-fun m!1329821 () Bool)

(assert (=> start!124498 m!1329821))

(declare-fun m!1329823 () Bool)

(assert (=> b!1440594 m!1329823))

(push 1)

