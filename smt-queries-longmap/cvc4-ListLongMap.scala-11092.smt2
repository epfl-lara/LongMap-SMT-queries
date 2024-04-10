; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129578 () Bool)

(assert start!129578)

(declare-fun b!1521148 () Bool)

(declare-fun res!1040376 () Bool)

(declare-fun e!848455 () Bool)

(assert (=> b!1521148 (=> (not res!1040376) (not e!848455))))

(declare-datatypes ((array!101253 0))(
  ( (array!101254 (arr!48859 (Array (_ BitVec 32) (_ BitVec 64))) (size!49409 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101253)

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1521148 (= res!1040376 (validKeyInArray!0 (select (arr!48859 a!2804) i!961)))))

(declare-fun b!1521149 () Bool)

(declare-fun res!1040372 () Bool)

(assert (=> b!1521149 (=> (not res!1040372) (not e!848455))))

(declare-fun j!70 () (_ BitVec 32))

(assert (=> b!1521149 (= res!1040372 (validKeyInArray!0 (select (arr!48859 a!2804) j!70)))))

(declare-fun b!1521150 () Bool)

(declare-fun res!1040373 () Bool)

(assert (=> b!1521150 (=> (not res!1040373) (not e!848455))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101253 (_ BitVec 32)) Bool)

(assert (=> b!1521150 (= res!1040373 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1521152 () Bool)

(declare-fun res!1040371 () Bool)

(assert (=> b!1521152 (=> (not res!1040371) (not e!848455))))

(declare-datatypes ((List!35342 0))(
  ( (Nil!35339) (Cons!35338 (h!36759 (_ BitVec 64)) (t!50036 List!35342)) )
))
(declare-fun arrayNoDuplicates!0 (array!101253 (_ BitVec 32) List!35342) Bool)

(assert (=> b!1521152 (= res!1040371 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35339))))

(declare-fun b!1521153 () Bool)

(assert (=> b!1521153 (= e!848455 false)))

(declare-datatypes ((SeekEntryResult!13024 0))(
  ( (MissingZero!13024 (index!54491 (_ BitVec 32))) (Found!13024 (index!54492 (_ BitVec 32))) (Intermediate!13024 (undefined!13836 Bool) (index!54493 (_ BitVec 32)) (x!136188 (_ BitVec 32))) (Undefined!13024) (MissingVacant!13024 (index!54494 (_ BitVec 32))) )
))
(declare-fun lt!659314 () SeekEntryResult!13024)

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101253 (_ BitVec 32)) SeekEntryResult!13024)

(assert (=> b!1521153 (= lt!659314 (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48859 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1521154 () Bool)

(declare-fun res!1040377 () Bool)

(assert (=> b!1521154 (=> (not res!1040377) (not e!848455))))

(assert (=> b!1521154 (= res!1040377 (and (= (size!49409 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49409 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49409 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1521155 () Bool)

(declare-fun res!1040375 () Bool)

(assert (=> b!1521155 (=> (not res!1040375) (not e!848455))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1521155 (= res!1040375 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49409 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49409 a!2804))))))

(declare-fun res!1040370 () Bool)

(assert (=> start!129578 (=> (not res!1040370) (not e!848455))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129578 (= res!1040370 (validMask!0 mask!2512))))

(assert (=> start!129578 e!848455))

(assert (=> start!129578 true))

(declare-fun array_inv!37887 (array!101253) Bool)

(assert (=> start!129578 (array_inv!37887 a!2804)))

(declare-fun b!1521151 () Bool)

(declare-fun res!1040374 () Bool)

(assert (=> b!1521151 (=> (not res!1040374) (not e!848455))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1521151 (= res!1040374 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48859 a!2804) j!70) mask!2512) (select (arr!48859 a!2804) j!70) a!2804 mask!2512) (Intermediate!13024 false resIndex!21 resX!21)))))

(assert (= (and start!129578 res!1040370) b!1521154))

(assert (= (and b!1521154 res!1040377) b!1521148))

(assert (= (and b!1521148 res!1040376) b!1521149))

(assert (= (and b!1521149 res!1040372) b!1521150))

(assert (= (and b!1521150 res!1040373) b!1521152))

(assert (= (and b!1521152 res!1040371) b!1521155))

(assert (= (and b!1521155 res!1040375) b!1521151))

(assert (= (and b!1521151 res!1040374) b!1521153))

(declare-fun m!1404265 () Bool)

(assert (=> b!1521152 m!1404265))

(declare-fun m!1404267 () Bool)

(assert (=> b!1521153 m!1404267))

(assert (=> b!1521153 m!1404267))

(declare-fun m!1404269 () Bool)

(assert (=> b!1521153 m!1404269))

(declare-fun m!1404271 () Bool)

(assert (=> start!129578 m!1404271))

(declare-fun m!1404273 () Bool)

(assert (=> start!129578 m!1404273))

(assert (=> b!1521151 m!1404267))

(assert (=> b!1521151 m!1404267))

(declare-fun m!1404275 () Bool)

(assert (=> b!1521151 m!1404275))

(assert (=> b!1521151 m!1404275))

(assert (=> b!1521151 m!1404267))

(declare-fun m!1404277 () Bool)

(assert (=> b!1521151 m!1404277))

(declare-fun m!1404279 () Bool)

(assert (=> b!1521150 m!1404279))

(assert (=> b!1521149 m!1404267))

(assert (=> b!1521149 m!1404267))

(declare-fun m!1404281 () Bool)

(assert (=> b!1521149 m!1404281))

(declare-fun m!1404283 () Bool)

(assert (=> b!1521148 m!1404283))

(assert (=> b!1521148 m!1404283))

(declare-fun m!1404285 () Bool)

(assert (=> b!1521148 m!1404285))

(push 1)

(assert (not b!1521153))

(assert (not b!1521150))

(assert (not b!1521152))

(assert (not start!129578))

(assert (not b!1521148))

(assert (not b!1521149))

(assert (not b!1521151))

(check-sat)

