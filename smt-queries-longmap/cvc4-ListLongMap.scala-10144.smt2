; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119632 () Bool)

(assert start!119632)

(declare-fun b!1393523 () Bool)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95314 0))(
  ( (array!95315 (arr!46015 (Array (_ BitVec 32) (_ BitVec 64))) (size!46565 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95314)

(declare-fun e!789061 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10332 0))(
  ( (MissingZero!10332 (index!43699 (_ BitVec 32))) (Found!10332 (index!43700 (_ BitVec 32))) (Intermediate!10332 (undefined!11144 Bool) (index!43701 (_ BitVec 32)) (x!125376 (_ BitVec 32))) (Undefined!10332) (MissingVacant!10332 (index!43702 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95314 (_ BitVec 32)) SeekEntryResult!10332)

(assert (=> b!1393523 (= e!789061 (= (seekEntryOrOpen!0 (select (arr!46015 a!2901) j!112) a!2901 mask!2840) (Found!10332 j!112)))))

(declare-fun b!1393524 () Bool)

(declare-fun res!932935 () Bool)

(declare-fun e!789059 () Bool)

(assert (=> b!1393524 (=> (not res!932935) (not e!789059))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1393524 (= res!932935 (validKeyInArray!0 (select (arr!46015 a!2901) j!112)))))

(declare-fun b!1393525 () Bool)

(declare-fun res!932936 () Bool)

(assert (=> b!1393525 (=> (not res!932936) (not e!789059))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1393525 (= res!932936 (and (= (size!46565 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46565 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46565 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1393526 () Bool)

(declare-fun res!932932 () Bool)

(assert (=> b!1393526 (=> (not res!932932) (not e!789059))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95314 (_ BitVec 32)) Bool)

(assert (=> b!1393526 (= res!932932 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1393527 () Bool)

(declare-fun e!789062 () Bool)

(assert (=> b!1393527 (= e!789059 (not e!789062))))

(declare-fun res!932931 () Bool)

(assert (=> b!1393527 (=> res!932931 e!789062)))

(declare-fun lt!612024 () SeekEntryResult!10332)

(assert (=> b!1393527 (= res!932931 (or (not (is-Intermediate!10332 lt!612024)) (undefined!11144 lt!612024)))))

(assert (=> b!1393527 e!789061))

(declare-fun res!932938 () Bool)

(assert (=> b!1393527 (=> (not res!932938) (not e!789061))))

(assert (=> b!1393527 (= res!932938 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46668 0))(
  ( (Unit!46669) )
))
(declare-fun lt!612022 () Unit!46668)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95314 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46668)

(assert (=> b!1393527 (= lt!612022 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95314 (_ BitVec 32)) SeekEntryResult!10332)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1393527 (= lt!612024 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46015 a!2901) j!112) mask!2840) (select (arr!46015 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1393529 () Bool)

(assert (=> b!1393529 (= e!789062 true)))

(declare-fun lt!612023 () SeekEntryResult!10332)

(assert (=> b!1393529 (= lt!612023 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46015 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46015 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95315 (store (arr!46015 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46565 a!2901)) mask!2840))))

(declare-fun b!1393530 () Bool)

(declare-fun res!932937 () Bool)

(assert (=> b!1393530 (=> (not res!932937) (not e!789059))))

(declare-datatypes ((List!32534 0))(
  ( (Nil!32531) (Cons!32530 (h!33763 (_ BitVec 64)) (t!47228 List!32534)) )
))
(declare-fun arrayNoDuplicates!0 (array!95314 (_ BitVec 32) List!32534) Bool)

(assert (=> b!1393530 (= res!932937 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32531))))

(declare-fun b!1393528 () Bool)

(declare-fun res!932934 () Bool)

(assert (=> b!1393528 (=> (not res!932934) (not e!789059))))

(assert (=> b!1393528 (= res!932934 (validKeyInArray!0 (select (arr!46015 a!2901) i!1037)))))

(declare-fun res!932933 () Bool)

(assert (=> start!119632 (=> (not res!932933) (not e!789059))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119632 (= res!932933 (validMask!0 mask!2840))))

(assert (=> start!119632 e!789059))

(assert (=> start!119632 true))

(declare-fun array_inv!35043 (array!95314) Bool)

(assert (=> start!119632 (array_inv!35043 a!2901)))

(assert (= (and start!119632 res!932933) b!1393525))

(assert (= (and b!1393525 res!932936) b!1393528))

(assert (= (and b!1393528 res!932934) b!1393524))

(assert (= (and b!1393524 res!932935) b!1393526))

(assert (= (and b!1393526 res!932932) b!1393530))

(assert (= (and b!1393530 res!932937) b!1393527))

(assert (= (and b!1393527 res!932938) b!1393523))

(assert (= (and b!1393527 (not res!932931)) b!1393529))

(declare-fun m!1279469 () Bool)

(assert (=> b!1393523 m!1279469))

(assert (=> b!1393523 m!1279469))

(declare-fun m!1279471 () Bool)

(assert (=> b!1393523 m!1279471))

(declare-fun m!1279473 () Bool)

(assert (=> start!119632 m!1279473))

(declare-fun m!1279475 () Bool)

(assert (=> start!119632 m!1279475))

(assert (=> b!1393524 m!1279469))

(assert (=> b!1393524 m!1279469))

(declare-fun m!1279477 () Bool)

(assert (=> b!1393524 m!1279477))

(declare-fun m!1279479 () Bool)

(assert (=> b!1393528 m!1279479))

(assert (=> b!1393528 m!1279479))

(declare-fun m!1279481 () Bool)

(assert (=> b!1393528 m!1279481))

(declare-fun m!1279483 () Bool)

(assert (=> b!1393526 m!1279483))

(assert (=> b!1393527 m!1279469))

(declare-fun m!1279485 () Bool)

(assert (=> b!1393527 m!1279485))

(assert (=> b!1393527 m!1279469))

(declare-fun m!1279487 () Bool)

(assert (=> b!1393527 m!1279487))

(assert (=> b!1393527 m!1279485))

(assert (=> b!1393527 m!1279469))

(declare-fun m!1279489 () Bool)

(assert (=> b!1393527 m!1279489))

(declare-fun m!1279491 () Bool)

(assert (=> b!1393527 m!1279491))

(declare-fun m!1279493 () Bool)

(assert (=> b!1393530 m!1279493))

(declare-fun m!1279495 () Bool)

(assert (=> b!1393529 m!1279495))

(declare-fun m!1279497 () Bool)

(assert (=> b!1393529 m!1279497))

(assert (=> b!1393529 m!1279497))

(declare-fun m!1279499 () Bool)

(assert (=> b!1393529 m!1279499))

(assert (=> b!1393529 m!1279499))

(assert (=> b!1393529 m!1279497))

(declare-fun m!1279501 () Bool)

(assert (=> b!1393529 m!1279501))

(push 1)

(assert (not b!1393527))

(assert (not b!1393523))

(assert (not b!1393529))

(assert (not b!1393530))

(assert (not b!1393526))

(assert (not b!1393528))

(assert (not b!1393524))

(assert (not start!119632))

(check-sat)

(pop 1)

(push 1)

(check-sat)

