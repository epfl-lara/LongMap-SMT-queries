; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129584 () Bool)

(assert start!129584)

(declare-fun b!1521220 () Bool)

(declare-fun res!1040443 () Bool)

(declare-fun e!848472 () Bool)

(assert (=> b!1521220 (=> (not res!1040443) (not e!848472))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!101259 0))(
  ( (array!101260 (arr!48862 (Array (_ BitVec 32) (_ BitVec 64))) (size!49412 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101259)

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13027 0))(
  ( (MissingZero!13027 (index!54503 (_ BitVec 32))) (Found!13027 (index!54504 (_ BitVec 32))) (Intermediate!13027 (undefined!13839 Bool) (index!54505 (_ BitVec 32)) (x!136199 (_ BitVec 32))) (Undefined!13027) (MissingVacant!13027 (index!54506 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101259 (_ BitVec 32)) SeekEntryResult!13027)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1521220 (= res!1040443 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48862 a!2804) j!70) mask!2512) (select (arr!48862 a!2804) j!70) a!2804 mask!2512) (Intermediate!13027 false resIndex!21 resX!21)))))

(declare-fun b!1521221 () Bool)

(declare-fun res!1040447 () Bool)

(assert (=> b!1521221 (=> (not res!1040447) (not e!848472))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1521221 (= res!1040447 (and (= (size!49412 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49412 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49412 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1521222 () Bool)

(declare-fun res!1040446 () Bool)

(assert (=> b!1521222 (=> (not res!1040446) (not e!848472))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1521222 (= res!1040446 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49412 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49412 a!2804))))))

(declare-fun b!1521223 () Bool)

(assert (=> b!1521223 (= e!848472 false)))

(declare-fun lt!659323 () SeekEntryResult!13027)

(assert (=> b!1521223 (= lt!659323 (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48862 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1521224 () Bool)

(declare-fun res!1040442 () Bool)

(assert (=> b!1521224 (=> (not res!1040442) (not e!848472))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101259 (_ BitVec 32)) Bool)

(assert (=> b!1521224 (= res!1040442 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1521225 () Bool)

(declare-fun res!1040444 () Bool)

(assert (=> b!1521225 (=> (not res!1040444) (not e!848472))))

(declare-datatypes ((List!35345 0))(
  ( (Nil!35342) (Cons!35341 (h!36762 (_ BitVec 64)) (t!50039 List!35345)) )
))
(declare-fun arrayNoDuplicates!0 (array!101259 (_ BitVec 32) List!35345) Bool)

(assert (=> b!1521225 (= res!1040444 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35342))))

(declare-fun b!1521226 () Bool)

(declare-fun res!1040448 () Bool)

(assert (=> b!1521226 (=> (not res!1040448) (not e!848472))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1521226 (= res!1040448 (validKeyInArray!0 (select (arr!48862 a!2804) i!961)))))

(declare-fun b!1521227 () Bool)

(declare-fun res!1040445 () Bool)

(assert (=> b!1521227 (=> (not res!1040445) (not e!848472))))

(assert (=> b!1521227 (= res!1040445 (validKeyInArray!0 (select (arr!48862 a!2804) j!70)))))

(declare-fun res!1040449 () Bool)

(assert (=> start!129584 (=> (not res!1040449) (not e!848472))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129584 (= res!1040449 (validMask!0 mask!2512))))

(assert (=> start!129584 e!848472))

(assert (=> start!129584 true))

(declare-fun array_inv!37890 (array!101259) Bool)

(assert (=> start!129584 (array_inv!37890 a!2804)))

(assert (= (and start!129584 res!1040449) b!1521221))

(assert (= (and b!1521221 res!1040447) b!1521226))

(assert (= (and b!1521226 res!1040448) b!1521227))

(assert (= (and b!1521227 res!1040445) b!1521224))

(assert (= (and b!1521224 res!1040442) b!1521225))

(assert (= (and b!1521225 res!1040444) b!1521222))

(assert (= (and b!1521222 res!1040446) b!1521220))

(assert (= (and b!1521220 res!1040443) b!1521223))

(declare-fun m!1404331 () Bool)

(assert (=> b!1521226 m!1404331))

(assert (=> b!1521226 m!1404331))

(declare-fun m!1404333 () Bool)

(assert (=> b!1521226 m!1404333))

(declare-fun m!1404335 () Bool)

(assert (=> b!1521220 m!1404335))

(assert (=> b!1521220 m!1404335))

(declare-fun m!1404337 () Bool)

(assert (=> b!1521220 m!1404337))

(assert (=> b!1521220 m!1404337))

(assert (=> b!1521220 m!1404335))

(declare-fun m!1404339 () Bool)

(assert (=> b!1521220 m!1404339))

(assert (=> b!1521227 m!1404335))

(assert (=> b!1521227 m!1404335))

(declare-fun m!1404341 () Bool)

(assert (=> b!1521227 m!1404341))

(declare-fun m!1404343 () Bool)

(assert (=> b!1521225 m!1404343))

(declare-fun m!1404345 () Bool)

(assert (=> start!129584 m!1404345))

(declare-fun m!1404347 () Bool)

(assert (=> start!129584 m!1404347))

(assert (=> b!1521223 m!1404335))

(assert (=> b!1521223 m!1404335))

(declare-fun m!1404349 () Bool)

(assert (=> b!1521223 m!1404349))

(declare-fun m!1404351 () Bool)

(assert (=> b!1521224 m!1404351))

(push 1)

(assert (not b!1521220))

(assert (not b!1521225))

(assert (not b!1521226))

(assert (not b!1521223))

(assert (not b!1521224))

(assert (not start!129584))

(assert (not b!1521227))

(check-sat)

(pop 1)

(push 1)

