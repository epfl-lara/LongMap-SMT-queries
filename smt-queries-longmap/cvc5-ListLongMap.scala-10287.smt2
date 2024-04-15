; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120882 () Bool)

(assert start!120882)

(declare-fun b!1406495 () Bool)

(declare-fun res!944768 () Bool)

(declare-fun e!796072 () Bool)

(assert (=> b!1406495 (=> (not res!944768) (not e!796072))))

(declare-datatypes ((array!96142 0))(
  ( (array!96143 (arr!46419 (Array (_ BitVec 32) (_ BitVec 64))) (size!46971 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96142)

(declare-datatypes ((List!33016 0))(
  ( (Nil!33013) (Cons!33012 (h!34266 (_ BitVec 64)) (t!47702 List!33016)) )
))
(declare-fun arrayNoDuplicates!0 (array!96142 (_ BitVec 32) List!33016) Bool)

(assert (=> b!1406495 (= res!944768 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33013))))

(declare-fun b!1406496 () Bool)

(declare-fun res!944770 () Bool)

(assert (=> b!1406496 (=> (not res!944770) (not e!796072))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96142 (_ BitVec 32)) Bool)

(assert (=> b!1406496 (= res!944770 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1406497 () Bool)

(declare-fun e!796070 () Bool)

(assert (=> b!1406497 (= e!796070 true)))

(declare-datatypes ((SeekEntryResult!10756 0))(
  ( (MissingZero!10756 (index!45401 (_ BitVec 32))) (Found!10756 (index!45402 (_ BitVec 32))) (Intermediate!10756 (undefined!11568 Bool) (index!45403 (_ BitVec 32)) (x!126992 (_ BitVec 32))) (Undefined!10756) (MissingVacant!10756 (index!45404 (_ BitVec 32))) )
))
(declare-fun lt!619246 () SeekEntryResult!10756)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96142 (_ BitVec 32)) SeekEntryResult!10756)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1406497 (= lt!619246 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46419 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46419 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96143 (store (arr!46419 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46971 a!2901)) mask!2840))))

(declare-fun b!1406498 () Bool)

(declare-fun res!944764 () Bool)

(assert (=> b!1406498 (=> (not res!944764) (not e!796072))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1406498 (= res!944764 (validKeyInArray!0 (select (arr!46419 a!2901) j!112)))))

(declare-fun b!1406499 () Bool)

(assert (=> b!1406499 (= e!796072 (not e!796070))))

(declare-fun res!944763 () Bool)

(assert (=> b!1406499 (=> res!944763 e!796070)))

(declare-fun lt!619247 () SeekEntryResult!10756)

(assert (=> b!1406499 (= res!944763 (or (not (is-Intermediate!10756 lt!619247)) (undefined!11568 lt!619247)))))

(declare-fun e!796073 () Bool)

(assert (=> b!1406499 e!796073))

(declare-fun res!944767 () Bool)

(assert (=> b!1406499 (=> (not res!944767) (not e!796073))))

(assert (=> b!1406499 (= res!944767 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47329 0))(
  ( (Unit!47330) )
))
(declare-fun lt!619245 () Unit!47329)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96142 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47329)

(assert (=> b!1406499 (= lt!619245 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1406499 (= lt!619247 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46419 a!2901) j!112) mask!2840) (select (arr!46419 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1406500 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96142 (_ BitVec 32)) SeekEntryResult!10756)

(assert (=> b!1406500 (= e!796073 (= (seekEntryOrOpen!0 (select (arr!46419 a!2901) j!112) a!2901 mask!2840) (Found!10756 j!112)))))

(declare-fun res!944766 () Bool)

(assert (=> start!120882 (=> (not res!944766) (not e!796072))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120882 (= res!944766 (validMask!0 mask!2840))))

(assert (=> start!120882 e!796072))

(assert (=> start!120882 true))

(declare-fun array_inv!35652 (array!96142) Bool)

(assert (=> start!120882 (array_inv!35652 a!2901)))

(declare-fun b!1406501 () Bool)

(declare-fun res!944769 () Bool)

(assert (=> b!1406501 (=> (not res!944769) (not e!796072))))

(assert (=> b!1406501 (= res!944769 (validKeyInArray!0 (select (arr!46419 a!2901) i!1037)))))

(declare-fun b!1406502 () Bool)

(declare-fun res!944765 () Bool)

(assert (=> b!1406502 (=> (not res!944765) (not e!796072))))

(assert (=> b!1406502 (= res!944765 (and (= (size!46971 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46971 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46971 a!2901)) (not (= i!1037 j!112))))))

(assert (= (and start!120882 res!944766) b!1406502))

(assert (= (and b!1406502 res!944765) b!1406501))

(assert (= (and b!1406501 res!944769) b!1406498))

(assert (= (and b!1406498 res!944764) b!1406496))

(assert (= (and b!1406496 res!944770) b!1406495))

(assert (= (and b!1406495 res!944768) b!1406499))

(assert (= (and b!1406499 res!944767) b!1406500))

(assert (= (and b!1406499 (not res!944763)) b!1406497))

(declare-fun m!1295241 () Bool)

(assert (=> b!1406499 m!1295241))

(declare-fun m!1295243 () Bool)

(assert (=> b!1406499 m!1295243))

(assert (=> b!1406499 m!1295241))

(declare-fun m!1295245 () Bool)

(assert (=> b!1406499 m!1295245))

(assert (=> b!1406499 m!1295243))

(assert (=> b!1406499 m!1295241))

(declare-fun m!1295247 () Bool)

(assert (=> b!1406499 m!1295247))

(declare-fun m!1295249 () Bool)

(assert (=> b!1406499 m!1295249))

(assert (=> b!1406498 m!1295241))

(assert (=> b!1406498 m!1295241))

(declare-fun m!1295251 () Bool)

(assert (=> b!1406498 m!1295251))

(declare-fun m!1295253 () Bool)

(assert (=> b!1406495 m!1295253))

(declare-fun m!1295255 () Bool)

(assert (=> b!1406497 m!1295255))

(declare-fun m!1295257 () Bool)

(assert (=> b!1406497 m!1295257))

(assert (=> b!1406497 m!1295257))

(declare-fun m!1295259 () Bool)

(assert (=> b!1406497 m!1295259))

(assert (=> b!1406497 m!1295259))

(assert (=> b!1406497 m!1295257))

(declare-fun m!1295261 () Bool)

(assert (=> b!1406497 m!1295261))

(declare-fun m!1295263 () Bool)

(assert (=> b!1406501 m!1295263))

(assert (=> b!1406501 m!1295263))

(declare-fun m!1295265 () Bool)

(assert (=> b!1406501 m!1295265))

(declare-fun m!1295267 () Bool)

(assert (=> b!1406496 m!1295267))

(declare-fun m!1295269 () Bool)

(assert (=> start!120882 m!1295269))

(declare-fun m!1295271 () Bool)

(assert (=> start!120882 m!1295271))

(assert (=> b!1406500 m!1295241))

(assert (=> b!1406500 m!1295241))

(declare-fun m!1295273 () Bool)

(assert (=> b!1406500 m!1295273))

(push 1)

(assert (not b!1406498))

(assert (not start!120882))

(assert (not b!1406497))

(assert (not b!1406496))

(assert (not b!1406499))

(assert (not b!1406495))

(assert (not b!1406501))

(assert (not b!1406500))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

