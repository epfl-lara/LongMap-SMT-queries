; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120834 () Bool)

(assert start!120834)

(declare-fun b!1405919 () Bool)

(declare-fun res!944187 () Bool)

(declare-fun e!795784 () Bool)

(assert (=> b!1405919 (=> (not res!944187) (not e!795784))))

(declare-datatypes ((array!96094 0))(
  ( (array!96095 (arr!46395 (Array (_ BitVec 32) (_ BitVec 64))) (size!46947 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96094)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1405919 (= res!944187 (validKeyInArray!0 (select (arr!46395 a!2901) i!1037)))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun e!795782 () Bool)

(declare-fun b!1405920 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10732 0))(
  ( (MissingZero!10732 (index!45305 (_ BitVec 32))) (Found!10732 (index!45306 (_ BitVec 32))) (Intermediate!10732 (undefined!11544 Bool) (index!45307 (_ BitVec 32)) (x!126904 (_ BitVec 32))) (Undefined!10732) (MissingVacant!10732 (index!45308 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96094 (_ BitVec 32)) SeekEntryResult!10732)

(assert (=> b!1405920 (= e!795782 (= (seekEntryOrOpen!0 (select (arr!46395 a!2901) j!112) a!2901 mask!2840) (Found!10732 j!112)))))

(declare-fun res!944193 () Bool)

(assert (=> start!120834 (=> (not res!944193) (not e!795784))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120834 (= res!944193 (validMask!0 mask!2840))))

(assert (=> start!120834 e!795784))

(assert (=> start!120834 true))

(declare-fun array_inv!35628 (array!96094) Bool)

(assert (=> start!120834 (array_inv!35628 a!2901)))

(declare-fun b!1405921 () Bool)

(declare-fun res!944188 () Bool)

(assert (=> b!1405921 (=> (not res!944188) (not e!795784))))

(assert (=> b!1405921 (= res!944188 (and (= (size!46947 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46947 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46947 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1405922 () Bool)

(declare-fun e!795783 () Bool)

(assert (=> b!1405922 (= e!795783 true)))

(declare-fun lt!619029 () SeekEntryResult!10732)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96094 (_ BitVec 32)) SeekEntryResult!10732)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1405922 (= lt!619029 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46395 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46395 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96095 (store (arr!46395 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46947 a!2901)) mask!2840))))

(declare-fun b!1405923 () Bool)

(declare-fun res!944194 () Bool)

(assert (=> b!1405923 (=> (not res!944194) (not e!795784))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96094 (_ BitVec 32)) Bool)

(assert (=> b!1405923 (= res!944194 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1405924 () Bool)

(declare-fun res!944190 () Bool)

(assert (=> b!1405924 (=> (not res!944190) (not e!795784))))

(declare-datatypes ((List!32992 0))(
  ( (Nil!32989) (Cons!32988 (h!34242 (_ BitVec 64)) (t!47678 List!32992)) )
))
(declare-fun arrayNoDuplicates!0 (array!96094 (_ BitVec 32) List!32992) Bool)

(assert (=> b!1405924 (= res!944190 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32989))))

(declare-fun b!1405925 () Bool)

(assert (=> b!1405925 (= e!795784 (not e!795783))))

(declare-fun res!944192 () Bool)

(assert (=> b!1405925 (=> res!944192 e!795783)))

(declare-fun lt!619030 () SeekEntryResult!10732)

(assert (=> b!1405925 (= res!944192 (or (not (is-Intermediate!10732 lt!619030)) (undefined!11544 lt!619030)))))

(assert (=> b!1405925 e!795782))

(declare-fun res!944189 () Bool)

(assert (=> b!1405925 (=> (not res!944189) (not e!795782))))

(assert (=> b!1405925 (= res!944189 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47281 0))(
  ( (Unit!47282) )
))
(declare-fun lt!619031 () Unit!47281)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96094 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47281)

(assert (=> b!1405925 (= lt!619031 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1405925 (= lt!619030 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46395 a!2901) j!112) mask!2840) (select (arr!46395 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1405926 () Bool)

(declare-fun res!944191 () Bool)

(assert (=> b!1405926 (=> (not res!944191) (not e!795784))))

(assert (=> b!1405926 (= res!944191 (validKeyInArray!0 (select (arr!46395 a!2901) j!112)))))

(assert (= (and start!120834 res!944193) b!1405921))

(assert (= (and b!1405921 res!944188) b!1405919))

(assert (= (and b!1405919 res!944187) b!1405926))

(assert (= (and b!1405926 res!944191) b!1405923))

(assert (= (and b!1405923 res!944194) b!1405924))

(assert (= (and b!1405924 res!944190) b!1405925))

(assert (= (and b!1405925 res!944189) b!1405920))

(assert (= (and b!1405925 (not res!944192)) b!1405922))

(declare-fun m!1294425 () Bool)

(assert (=> b!1405924 m!1294425))

(declare-fun m!1294427 () Bool)

(assert (=> b!1405920 m!1294427))

(assert (=> b!1405920 m!1294427))

(declare-fun m!1294429 () Bool)

(assert (=> b!1405920 m!1294429))

(declare-fun m!1294431 () Bool)

(assert (=> b!1405919 m!1294431))

(assert (=> b!1405919 m!1294431))

(declare-fun m!1294433 () Bool)

(assert (=> b!1405919 m!1294433))

(declare-fun m!1294435 () Bool)

(assert (=> b!1405923 m!1294435))

(declare-fun m!1294437 () Bool)

(assert (=> b!1405922 m!1294437))

(declare-fun m!1294439 () Bool)

(assert (=> b!1405922 m!1294439))

(assert (=> b!1405922 m!1294439))

(declare-fun m!1294441 () Bool)

(assert (=> b!1405922 m!1294441))

(assert (=> b!1405922 m!1294441))

(assert (=> b!1405922 m!1294439))

(declare-fun m!1294443 () Bool)

(assert (=> b!1405922 m!1294443))

(declare-fun m!1294445 () Bool)

(assert (=> start!120834 m!1294445))

(declare-fun m!1294447 () Bool)

(assert (=> start!120834 m!1294447))

(assert (=> b!1405925 m!1294427))

(declare-fun m!1294449 () Bool)

(assert (=> b!1405925 m!1294449))

(assert (=> b!1405925 m!1294427))

(declare-fun m!1294451 () Bool)

(assert (=> b!1405925 m!1294451))

(assert (=> b!1405925 m!1294449))

(assert (=> b!1405925 m!1294427))

(declare-fun m!1294453 () Bool)

(assert (=> b!1405925 m!1294453))

(declare-fun m!1294455 () Bool)

(assert (=> b!1405925 m!1294455))

(assert (=> b!1405926 m!1294427))

(assert (=> b!1405926 m!1294427))

(declare-fun m!1294457 () Bool)

(assert (=> b!1405926 m!1294457))

(push 1)

(assert (not b!1405924))

(assert (not b!1405922))

(assert (not start!120834))

(assert (not b!1405919))

(assert (not b!1405920))

(assert (not b!1405923))

(assert (not b!1405926))

(assert (not b!1405925))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

