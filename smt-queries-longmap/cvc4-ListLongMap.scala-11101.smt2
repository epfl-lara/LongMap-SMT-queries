; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129578 () Bool)

(assert start!129578)

(declare-fun b!1521473 () Bool)

(declare-fun res!1040902 () Bool)

(declare-fun e!848438 () Bool)

(assert (=> b!1521473 (=> (not res!1040902) (not e!848438))))

(declare-datatypes ((array!101253 0))(
  ( (array!101254 (arr!48860 (Array (_ BitVec 32) (_ BitVec 64))) (size!49412 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101253)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1521473 (= res!1040902 (validKeyInArray!0 (select (arr!48860 a!2804) j!70)))))

(declare-fun b!1521474 () Bool)

(declare-fun res!1040907 () Bool)

(assert (=> b!1521474 (=> (not res!1040907) (not e!848438))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1521474 (= res!1040907 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49412 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49412 a!2804))))))

(declare-fun b!1521475 () Bool)

(declare-fun res!1040904 () Bool)

(assert (=> b!1521475 (=> (not res!1040904) (not e!848438))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1521475 (= res!1040904 (validKeyInArray!0 (select (arr!48860 a!2804) i!961)))))

(declare-fun b!1521476 () Bool)

(declare-fun res!1040905 () Bool)

(assert (=> b!1521476 (=> (not res!1040905) (not e!848438))))

(declare-datatypes ((List!35421 0))(
  ( (Nil!35418) (Cons!35417 (h!36839 (_ BitVec 64)) (t!50107 List!35421)) )
))
(declare-fun arrayNoDuplicates!0 (array!101253 (_ BitVec 32) List!35421) Bool)

(assert (=> b!1521476 (= res!1040905 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35418))))

(declare-fun b!1521477 () Bool)

(declare-fun res!1040901 () Bool)

(assert (=> b!1521477 (=> (not res!1040901) (not e!848438))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101253 (_ BitVec 32)) Bool)

(assert (=> b!1521477 (= res!1040901 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1521478 () Bool)

(declare-fun res!1040908 () Bool)

(assert (=> b!1521478 (=> (not res!1040908) (not e!848438))))

(assert (=> b!1521478 (= res!1040908 (and (= (size!49412 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49412 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49412 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1521479 () Bool)

(declare-fun e!848439 () Bool)

(assert (=> b!1521479 (= e!848439 false)))

(declare-datatypes ((SeekEntryResult!13048 0))(
  ( (MissingZero!13048 (index!54587 (_ BitVec 32))) (Found!13048 (index!54588 (_ BitVec 32))) (Intermediate!13048 (undefined!13860 Bool) (index!54589 (_ BitVec 32)) (x!136278 (_ BitVec 32))) (Undefined!13048) (MissingVacant!13048 (index!54590 (_ BitVec 32))) )
))
(declare-fun lt!659138 () SeekEntryResult!13048)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101253 (_ BitVec 32)) SeekEntryResult!13048)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1521479 (= lt!659138 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48860 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48860 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101254 (store (arr!48860 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49412 a!2804)) mask!2512))))

(declare-fun b!1521481 () Bool)

(declare-fun res!1040903 () Bool)

(assert (=> b!1521481 (=> (not res!1040903) (not e!848439))))

(declare-fun lt!659139 () SeekEntryResult!13048)

(assert (=> b!1521481 (= res!1040903 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48860 a!2804) j!70) a!2804 mask!2512) lt!659139))))

(declare-fun res!1040906 () Bool)

(assert (=> start!129578 (=> (not res!1040906) (not e!848438))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129578 (= res!1040906 (validMask!0 mask!2512))))

(assert (=> start!129578 e!848438))

(assert (=> start!129578 true))

(declare-fun array_inv!38093 (array!101253) Bool)

(assert (=> start!129578 (array_inv!38093 a!2804)))

(declare-fun b!1521480 () Bool)

(assert (=> b!1521480 (= e!848438 e!848439)))

(declare-fun res!1040909 () Bool)

(assert (=> b!1521480 (=> (not res!1040909) (not e!848439))))

(assert (=> b!1521480 (= res!1040909 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48860 a!2804) j!70) mask!2512) (select (arr!48860 a!2804) j!70) a!2804 mask!2512) lt!659139))))

(assert (=> b!1521480 (= lt!659139 (Intermediate!13048 false resIndex!21 resX!21))))

(assert (= (and start!129578 res!1040906) b!1521478))

(assert (= (and b!1521478 res!1040908) b!1521475))

(assert (= (and b!1521475 res!1040904) b!1521473))

(assert (= (and b!1521473 res!1040902) b!1521477))

(assert (= (and b!1521477 res!1040901) b!1521476))

(assert (= (and b!1521476 res!1040905) b!1521474))

(assert (= (and b!1521474 res!1040907) b!1521480))

(assert (= (and b!1521480 res!1040909) b!1521481))

(assert (= (and b!1521481 res!1040903) b!1521479))

(declare-fun m!1404021 () Bool)

(assert (=> b!1521477 m!1404021))

(declare-fun m!1404023 () Bool)

(assert (=> b!1521473 m!1404023))

(assert (=> b!1521473 m!1404023))

(declare-fun m!1404025 () Bool)

(assert (=> b!1521473 m!1404025))

(declare-fun m!1404027 () Bool)

(assert (=> b!1521476 m!1404027))

(assert (=> b!1521481 m!1404023))

(assert (=> b!1521481 m!1404023))

(declare-fun m!1404029 () Bool)

(assert (=> b!1521481 m!1404029))

(declare-fun m!1404031 () Bool)

(assert (=> b!1521479 m!1404031))

(declare-fun m!1404033 () Bool)

(assert (=> b!1521479 m!1404033))

(assert (=> b!1521479 m!1404033))

(declare-fun m!1404035 () Bool)

(assert (=> b!1521479 m!1404035))

(assert (=> b!1521479 m!1404035))

(assert (=> b!1521479 m!1404033))

(declare-fun m!1404037 () Bool)

(assert (=> b!1521479 m!1404037))

(declare-fun m!1404039 () Bool)

(assert (=> b!1521475 m!1404039))

(assert (=> b!1521475 m!1404039))

(declare-fun m!1404041 () Bool)

(assert (=> b!1521475 m!1404041))

(declare-fun m!1404043 () Bool)

(assert (=> start!129578 m!1404043))

(declare-fun m!1404045 () Bool)

(assert (=> start!129578 m!1404045))

(assert (=> b!1521480 m!1404023))

(assert (=> b!1521480 m!1404023))

(declare-fun m!1404047 () Bool)

(assert (=> b!1521480 m!1404047))

(assert (=> b!1521480 m!1404047))

(assert (=> b!1521480 m!1404023))

(declare-fun m!1404049 () Bool)

(assert (=> b!1521480 m!1404049))

(push 1)

(assert (not b!1521476))

(assert (not start!129578))

(assert (not b!1521480))

(assert (not b!1521475))

(assert (not b!1521481))

(assert (not b!1521479))

(assert (not b!1521477))

(assert (not b!1521473))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

