; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121086 () Bool)

(assert start!121086)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96193 0))(
  ( (array!96194 (arr!46440 (Array (_ BitVec 32) (_ BitVec 64))) (size!46992 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96193)

(declare-fun b!1407800 () Bool)

(declare-fun e!796802 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10777 0))(
  ( (MissingZero!10777 (index!45485 (_ BitVec 32))) (Found!10777 (index!45486 (_ BitVec 32))) (Intermediate!10777 (undefined!11589 Bool) (index!45487 (_ BitVec 32)) (x!127087 (_ BitVec 32))) (Undefined!10777) (MissingVacant!10777 (index!45488 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96193 (_ BitVec 32)) SeekEntryResult!10777)

(assert (=> b!1407800 (= e!796802 (= (seekEntryOrOpen!0 (select (arr!46440 a!2901) j!112) a!2901 mask!2840) (Found!10777 j!112)))))

(declare-fun b!1407801 () Bool)

(declare-fun e!796800 () Bool)

(declare-fun e!796801 () Bool)

(assert (=> b!1407801 (= e!796800 (not e!796801))))

(declare-fun res!945579 () Bool)

(assert (=> b!1407801 (=> res!945579 e!796801)))

(declare-fun lt!619787 () SeekEntryResult!10777)

(assert (=> b!1407801 (= res!945579 (or (not (is-Intermediate!10777 lt!619787)) (undefined!11589 lt!619787)))))

(assert (=> b!1407801 e!796802))

(declare-fun res!945577 () Bool)

(assert (=> b!1407801 (=> (not res!945577) (not e!796802))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96193 (_ BitVec 32)) Bool)

(assert (=> b!1407801 (= res!945577 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47371 0))(
  ( (Unit!47372) )
))
(declare-fun lt!619786 () Unit!47371)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96193 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47371)

(assert (=> b!1407801 (= lt!619786 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96193 (_ BitVec 32)) SeekEntryResult!10777)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1407801 (= lt!619787 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46440 a!2901) j!112) mask!2840) (select (arr!46440 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1407802 () Bool)

(declare-fun res!945575 () Bool)

(assert (=> b!1407802 (=> (not res!945575) (not e!796800))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1407802 (= res!945575 (and (= (size!46992 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46992 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46992 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1407803 () Bool)

(declare-fun res!945578 () Bool)

(assert (=> b!1407803 (=> (not res!945578) (not e!796800))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1407803 (= res!945578 (validKeyInArray!0 (select (arr!46440 a!2901) i!1037)))))

(declare-fun b!1407804 () Bool)

(declare-fun res!945576 () Bool)

(assert (=> b!1407804 (=> (not res!945576) (not e!796800))))

(declare-datatypes ((List!33037 0))(
  ( (Nil!33034) (Cons!33033 (h!34296 (_ BitVec 64)) (t!47723 List!33037)) )
))
(declare-fun arrayNoDuplicates!0 (array!96193 (_ BitVec 32) List!33037) Bool)

(assert (=> b!1407804 (= res!945576 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33034))))

(declare-fun b!1407805 () Bool)

(declare-fun res!945580 () Bool)

(assert (=> b!1407805 (=> (not res!945580) (not e!796800))))

(assert (=> b!1407805 (= res!945580 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun res!945573 () Bool)

(assert (=> start!121086 (=> (not res!945573) (not e!796800))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121086 (= res!945573 (validMask!0 mask!2840))))

(assert (=> start!121086 e!796800))

(assert (=> start!121086 true))

(declare-fun array_inv!35673 (array!96193) Bool)

(assert (=> start!121086 (array_inv!35673 a!2901)))

(declare-fun b!1407806 () Bool)

(declare-fun res!945574 () Bool)

(assert (=> b!1407806 (=> (not res!945574) (not e!796800))))

(assert (=> b!1407806 (= res!945574 (validKeyInArray!0 (select (arr!46440 a!2901) j!112)))))

(declare-fun b!1407807 () Bool)

(assert (=> b!1407807 (= e!796801 true)))

(declare-fun lt!619785 () SeekEntryResult!10777)

(assert (=> b!1407807 (= lt!619785 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46440 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46440 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96194 (store (arr!46440 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46992 a!2901)) mask!2840))))

(assert (= (and start!121086 res!945573) b!1407802))

(assert (= (and b!1407802 res!945575) b!1407803))

(assert (= (and b!1407803 res!945578) b!1407806))

(assert (= (and b!1407806 res!945574) b!1407805))

(assert (= (and b!1407805 res!945580) b!1407804))

(assert (= (and b!1407804 res!945576) b!1407801))

(assert (= (and b!1407801 res!945577) b!1407800))

(assert (= (and b!1407801 (not res!945579)) b!1407807))

(declare-fun m!1296417 () Bool)

(assert (=> b!1407805 m!1296417))

(declare-fun m!1296419 () Bool)

(assert (=> b!1407800 m!1296419))

(assert (=> b!1407800 m!1296419))

(declare-fun m!1296421 () Bool)

(assert (=> b!1407800 m!1296421))

(assert (=> b!1407801 m!1296419))

(declare-fun m!1296423 () Bool)

(assert (=> b!1407801 m!1296423))

(assert (=> b!1407801 m!1296419))

(declare-fun m!1296425 () Bool)

(assert (=> b!1407801 m!1296425))

(assert (=> b!1407801 m!1296423))

(assert (=> b!1407801 m!1296419))

(declare-fun m!1296427 () Bool)

(assert (=> b!1407801 m!1296427))

(declare-fun m!1296429 () Bool)

(assert (=> b!1407801 m!1296429))

(declare-fun m!1296431 () Bool)

(assert (=> start!121086 m!1296431))

(declare-fun m!1296433 () Bool)

(assert (=> start!121086 m!1296433))

(declare-fun m!1296435 () Bool)

(assert (=> b!1407804 m!1296435))

(declare-fun m!1296437 () Bool)

(assert (=> b!1407807 m!1296437))

(declare-fun m!1296439 () Bool)

(assert (=> b!1407807 m!1296439))

(assert (=> b!1407807 m!1296439))

(declare-fun m!1296441 () Bool)

(assert (=> b!1407807 m!1296441))

(assert (=> b!1407807 m!1296441))

(assert (=> b!1407807 m!1296439))

(declare-fun m!1296443 () Bool)

(assert (=> b!1407807 m!1296443))

(declare-fun m!1296445 () Bool)

(assert (=> b!1407803 m!1296445))

(assert (=> b!1407803 m!1296445))

(declare-fun m!1296447 () Bool)

(assert (=> b!1407803 m!1296447))

(assert (=> b!1407806 m!1296419))

(assert (=> b!1407806 m!1296419))

(declare-fun m!1296449 () Bool)

(assert (=> b!1407806 m!1296449))

(push 1)

(assert (not b!1407803))

(assert (not b!1407804))

(assert (not b!1407805))

(assert (not start!121086))

(assert (not b!1407807))

(assert (not b!1407806))

(assert (not b!1407800))

(assert (not b!1407801))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

