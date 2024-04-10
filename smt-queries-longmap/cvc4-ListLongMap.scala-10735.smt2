; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125552 () Bool)

(assert start!125552)

(declare-fun b!1468966 () Bool)

(declare-fun res!997508 () Bool)

(declare-fun e!824758 () Bool)

(assert (=> b!1468966 (=> (not res!997508) (not e!824758))))

(declare-datatypes ((array!99000 0))(
  ( (array!99001 (arr!47788 (Array (_ BitVec 32) (_ BitVec 64))) (size!48338 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99000)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99000 (_ BitVec 32)) Bool)

(assert (=> b!1468966 (= res!997508 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1468967 () Bool)

(declare-fun res!997507 () Bool)

(assert (=> b!1468967 (=> (not res!997507) (not e!824758))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1468967 (= res!997507 (validKeyInArray!0 (select (arr!47788 a!2862) j!93)))))

(declare-fun b!1468968 () Bool)

(declare-fun res!997509 () Bool)

(assert (=> b!1468968 (=> (not res!997509) (not e!824758))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1468968 (= res!997509 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48338 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48338 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48338 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47788 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1468969 () Bool)

(declare-fun res!997505 () Bool)

(assert (=> b!1468969 (=> (not res!997505) (not e!824758))))

(assert (=> b!1468969 (= res!997505 (validKeyInArray!0 (select (arr!47788 a!2862) i!1006)))))

(declare-fun b!1468970 () Bool)

(declare-fun res!997513 () Bool)

(assert (=> b!1468970 (=> (not res!997513) (not e!824758))))

(declare-datatypes ((List!34289 0))(
  ( (Nil!34286) (Cons!34285 (h!35635 (_ BitVec 64)) (t!48983 List!34289)) )
))
(declare-fun arrayNoDuplicates!0 (array!99000 (_ BitVec 32) List!34289) Bool)

(assert (=> b!1468970 (= res!997513 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34286))))

(declare-fun b!1468971 () Bool)

(declare-fun res!997512 () Bool)

(assert (=> b!1468971 (=> (not res!997512) (not e!824758))))

(assert (=> b!1468971 (= res!997512 (and (= (size!48338 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48338 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48338 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1468972 () Bool)

(declare-fun e!824759 () Bool)

(assert (=> b!1468972 (= e!824759 false)))

(declare-datatypes ((SeekEntryResult!12028 0))(
  ( (MissingZero!12028 (index!50504 (_ BitVec 32))) (Found!12028 (index!50505 (_ BitVec 32))) (Intermediate!12028 (undefined!12840 Bool) (index!50506 (_ BitVec 32)) (x!132085 (_ BitVec 32))) (Undefined!12028) (MissingVacant!12028 (index!50507 (_ BitVec 32))) )
))
(declare-fun lt!642408 () SeekEntryResult!12028)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99000 (_ BitVec 32)) SeekEntryResult!12028)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1468972 (= lt!642408 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47788 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (select (store (arr!47788 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!99001 (store (arr!47788 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48338 a!2862)) mask!2687))))

(declare-fun b!1468973 () Bool)

(declare-fun res!997511 () Bool)

(assert (=> b!1468973 (=> (not res!997511) (not e!824759))))

(declare-fun lt!642407 () SeekEntryResult!12028)

(assert (=> b!1468973 (= res!997511 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47788 a!2862) j!93) a!2862 mask!2687) lt!642407))))

(declare-fun res!997506 () Bool)

(assert (=> start!125552 (=> (not res!997506) (not e!824758))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125552 (= res!997506 (validMask!0 mask!2687))))

(assert (=> start!125552 e!824758))

(assert (=> start!125552 true))

(declare-fun array_inv!36816 (array!99000) Bool)

(assert (=> start!125552 (array_inv!36816 a!2862)))

(declare-fun b!1468974 () Bool)

(assert (=> b!1468974 (= e!824758 e!824759)))

(declare-fun res!997510 () Bool)

(assert (=> b!1468974 (=> (not res!997510) (not e!824759))))

(assert (=> b!1468974 (= res!997510 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47788 a!2862) j!93) mask!2687) (select (arr!47788 a!2862) j!93) a!2862 mask!2687) lt!642407))))

(assert (=> b!1468974 (= lt!642407 (Intermediate!12028 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(assert (= (and start!125552 res!997506) b!1468971))

(assert (= (and b!1468971 res!997512) b!1468969))

(assert (= (and b!1468969 res!997505) b!1468967))

(assert (= (and b!1468967 res!997507) b!1468966))

(assert (= (and b!1468966 res!997508) b!1468970))

(assert (= (and b!1468970 res!997513) b!1468968))

(assert (= (and b!1468968 res!997509) b!1468974))

(assert (= (and b!1468974 res!997510) b!1468973))

(assert (= (and b!1468973 res!997511) b!1468972))

(declare-fun m!1356125 () Bool)

(assert (=> b!1468974 m!1356125))

(assert (=> b!1468974 m!1356125))

(declare-fun m!1356127 () Bool)

(assert (=> b!1468974 m!1356127))

(assert (=> b!1468974 m!1356127))

(assert (=> b!1468974 m!1356125))

(declare-fun m!1356129 () Bool)

(assert (=> b!1468974 m!1356129))

(declare-fun m!1356131 () Bool)

(assert (=> b!1468969 m!1356131))

(assert (=> b!1468969 m!1356131))

(declare-fun m!1356133 () Bool)

(assert (=> b!1468969 m!1356133))

(assert (=> b!1468967 m!1356125))

(assert (=> b!1468967 m!1356125))

(declare-fun m!1356135 () Bool)

(assert (=> b!1468967 m!1356135))

(declare-fun m!1356137 () Bool)

(assert (=> b!1468970 m!1356137))

(declare-fun m!1356139 () Bool)

(assert (=> start!125552 m!1356139))

(declare-fun m!1356141 () Bool)

(assert (=> start!125552 m!1356141))

(declare-fun m!1356143 () Bool)

(assert (=> b!1468972 m!1356143))

(declare-fun m!1356145 () Bool)

(assert (=> b!1468972 m!1356145))

(assert (=> b!1468972 m!1356145))

(declare-fun m!1356147 () Bool)

(assert (=> b!1468972 m!1356147))

(assert (=> b!1468972 m!1356147))

(assert (=> b!1468972 m!1356145))

(declare-fun m!1356149 () Bool)

(assert (=> b!1468972 m!1356149))

(assert (=> b!1468968 m!1356143))

(declare-fun m!1356151 () Bool)

(assert (=> b!1468968 m!1356151))

(declare-fun m!1356153 () Bool)

(assert (=> b!1468966 m!1356153))

(assert (=> b!1468973 m!1356125))

(assert (=> b!1468973 m!1356125))

(declare-fun m!1356155 () Bool)

(assert (=> b!1468973 m!1356155))

(push 1)

(assert (not b!1468970))

(assert (not b!1468967))

(assert (not b!1468974))

(assert (not b!1468973))

(assert (not start!125552))

(assert (not b!1468969))

(assert (not b!1468972))

(assert (not b!1468966))

(check-sat)

