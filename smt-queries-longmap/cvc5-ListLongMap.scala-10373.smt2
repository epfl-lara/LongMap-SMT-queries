; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122298 () Bool)

(assert start!122298)

(declare-fun b!1418138 () Bool)

(declare-fun e!802708 () Bool)

(assert (=> b!1418138 (= e!802708 true)))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96855 0))(
  ( (array!96856 (arr!46755 (Array (_ BitVec 32) (_ BitVec 64))) (size!47306 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96855)

(declare-datatypes ((SeekEntryResult!10969 0))(
  ( (MissingZero!10969 (index!46268 (_ BitVec 32))) (Found!10969 (index!46269 (_ BitVec 32))) (Intermediate!10969 (undefined!11781 Bool) (index!46270 (_ BitVec 32)) (x!128017 (_ BitVec 32))) (Undefined!10969) (MissingVacant!10969 (index!46271 (_ BitVec 32))) )
))
(declare-fun lt!625593 () SeekEntryResult!10969)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96855 (_ BitVec 32)) SeekEntryResult!10969)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1418138 (= lt!625593 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46755 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46755 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96856 (store (arr!46755 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47306 a!2901)) mask!2840))))

(declare-fun res!953336 () Bool)

(declare-fun e!802709 () Bool)

(assert (=> start!122298 (=> (not res!953336) (not e!802709))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122298 (= res!953336 (validMask!0 mask!2840))))

(assert (=> start!122298 e!802709))

(assert (=> start!122298 true))

(declare-fun array_inv!36036 (array!96855) Bool)

(assert (=> start!122298 (array_inv!36036 a!2901)))

(declare-fun b!1418139 () Bool)

(declare-fun res!953333 () Bool)

(assert (=> b!1418139 (=> (not res!953333) (not e!802709))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1418139 (= res!953333 (validKeyInArray!0 (select (arr!46755 a!2901) i!1037)))))

(declare-fun b!1418140 () Bool)

(declare-fun res!953335 () Bool)

(assert (=> b!1418140 (=> (not res!953335) (not e!802709))))

(assert (=> b!1418140 (= res!953335 (and (= (size!47306 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47306 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47306 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1418141 () Bool)

(assert (=> b!1418141 (= e!802709 (not e!802708))))

(declare-fun res!953334 () Bool)

(assert (=> b!1418141 (=> res!953334 e!802708)))

(declare-fun lt!625595 () SeekEntryResult!10969)

(assert (=> b!1418141 (= res!953334 (or (not (is-Intermediate!10969 lt!625595)) (undefined!11781 lt!625595)))))

(declare-fun e!802707 () Bool)

(assert (=> b!1418141 e!802707))

(declare-fun res!953337 () Bool)

(assert (=> b!1418141 (=> (not res!953337) (not e!802707))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96855 (_ BitVec 32)) Bool)

(assert (=> b!1418141 (= res!953337 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47939 0))(
  ( (Unit!47940) )
))
(declare-fun lt!625594 () Unit!47939)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96855 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47939)

(assert (=> b!1418141 (= lt!625594 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1418141 (= lt!625595 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46755 a!2901) j!112) mask!2840) (select (arr!46755 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1418142 () Bool)

(declare-fun res!953331 () Bool)

(assert (=> b!1418142 (=> (not res!953331) (not e!802709))))

(declare-datatypes ((List!33261 0))(
  ( (Nil!33258) (Cons!33257 (h!34555 (_ BitVec 64)) (t!47947 List!33261)) )
))
(declare-fun arrayNoDuplicates!0 (array!96855 (_ BitVec 32) List!33261) Bool)

(assert (=> b!1418142 (= res!953331 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33258))))

(declare-fun b!1418143 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96855 (_ BitVec 32)) SeekEntryResult!10969)

(assert (=> b!1418143 (= e!802707 (= (seekEntryOrOpen!0 (select (arr!46755 a!2901) j!112) a!2901 mask!2840) (Found!10969 j!112)))))

(declare-fun b!1418144 () Bool)

(declare-fun res!953332 () Bool)

(assert (=> b!1418144 (=> (not res!953332) (not e!802709))))

(assert (=> b!1418144 (= res!953332 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1418145 () Bool)

(declare-fun res!953338 () Bool)

(assert (=> b!1418145 (=> (not res!953338) (not e!802709))))

(assert (=> b!1418145 (= res!953338 (validKeyInArray!0 (select (arr!46755 a!2901) j!112)))))

(assert (= (and start!122298 res!953336) b!1418140))

(assert (= (and b!1418140 res!953335) b!1418139))

(assert (= (and b!1418139 res!953333) b!1418145))

(assert (= (and b!1418145 res!953338) b!1418144))

(assert (= (and b!1418144 res!953332) b!1418142))

(assert (= (and b!1418142 res!953331) b!1418141))

(assert (= (and b!1418141 res!953337) b!1418143))

(assert (= (and b!1418141 (not res!953334)) b!1418138))

(declare-fun m!1309119 () Bool)

(assert (=> b!1418142 m!1309119))

(declare-fun m!1309121 () Bool)

(assert (=> b!1418141 m!1309121))

(declare-fun m!1309123 () Bool)

(assert (=> b!1418141 m!1309123))

(assert (=> b!1418141 m!1309121))

(declare-fun m!1309125 () Bool)

(assert (=> b!1418141 m!1309125))

(assert (=> b!1418141 m!1309123))

(assert (=> b!1418141 m!1309121))

(declare-fun m!1309127 () Bool)

(assert (=> b!1418141 m!1309127))

(declare-fun m!1309129 () Bool)

(assert (=> b!1418141 m!1309129))

(assert (=> b!1418145 m!1309121))

(assert (=> b!1418145 m!1309121))

(declare-fun m!1309131 () Bool)

(assert (=> b!1418145 m!1309131))

(declare-fun m!1309133 () Bool)

(assert (=> b!1418144 m!1309133))

(assert (=> b!1418143 m!1309121))

(assert (=> b!1418143 m!1309121))

(declare-fun m!1309135 () Bool)

(assert (=> b!1418143 m!1309135))

(declare-fun m!1309137 () Bool)

(assert (=> b!1418138 m!1309137))

(declare-fun m!1309139 () Bool)

(assert (=> b!1418138 m!1309139))

(assert (=> b!1418138 m!1309139))

(declare-fun m!1309141 () Bool)

(assert (=> b!1418138 m!1309141))

(assert (=> b!1418138 m!1309141))

(assert (=> b!1418138 m!1309139))

(declare-fun m!1309143 () Bool)

(assert (=> b!1418138 m!1309143))

(declare-fun m!1309145 () Bool)

(assert (=> start!122298 m!1309145))

(declare-fun m!1309147 () Bool)

(assert (=> start!122298 m!1309147))

(declare-fun m!1309149 () Bool)

(assert (=> b!1418139 m!1309149))

(assert (=> b!1418139 m!1309149))

(declare-fun m!1309151 () Bool)

(assert (=> b!1418139 m!1309151))

(push 1)

(assert (not start!122298))

(assert (not b!1418145))

(assert (not b!1418144))

(assert (not b!1418138))

(assert (not b!1418143))

(assert (not b!1418139))

(assert (not b!1418141))

(assert (not b!1418142))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

