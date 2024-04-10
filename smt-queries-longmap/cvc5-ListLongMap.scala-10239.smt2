; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120486 () Bool)

(assert start!120486)

(declare-fun b!1402958 () Bool)

(declare-fun res!941472 () Bool)

(declare-fun e!794402 () Bool)

(assert (=> b!1402958 (=> (not res!941472) (not e!794402))))

(declare-datatypes ((array!95895 0))(
  ( (array!95896 (arr!46298 (Array (_ BitVec 32) (_ BitVec 64))) (size!46848 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95895)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1402958 (= res!941472 (validKeyInArray!0 (select (arr!46298 a!2901) i!1037)))))

(declare-fun b!1402959 () Bool)

(declare-fun res!941469 () Bool)

(assert (=> b!1402959 (=> (not res!941469) (not e!794402))))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1402959 (= res!941469 (validKeyInArray!0 (select (arr!46298 a!2901) j!112)))))

(declare-fun b!1402960 () Bool)

(declare-fun res!941473 () Bool)

(assert (=> b!1402960 (=> (not res!941473) (not e!794402))))

(declare-datatypes ((List!32817 0))(
  ( (Nil!32814) (Cons!32813 (h!34061 (_ BitVec 64)) (t!47511 List!32817)) )
))
(declare-fun arrayNoDuplicates!0 (array!95895 (_ BitVec 32) List!32817) Bool)

(assert (=> b!1402960 (= res!941473 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32814))))

(declare-fun res!941475 () Bool)

(assert (=> start!120486 (=> (not res!941475) (not e!794402))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120486 (= res!941475 (validMask!0 mask!2840))))

(assert (=> start!120486 e!794402))

(assert (=> start!120486 true))

(declare-fun array_inv!35326 (array!95895) Bool)

(assert (=> start!120486 (array_inv!35326 a!2901)))

(declare-fun b!1402961 () Bool)

(declare-fun res!941474 () Bool)

(assert (=> b!1402961 (=> (not res!941474) (not e!794402))))

(assert (=> b!1402961 (= res!941474 (and (= (size!46848 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46848 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46848 a!2901)) (not (= i!1037 j!112))))))

(declare-fun e!794403 () Bool)

(declare-fun b!1402962 () Bool)

(declare-datatypes ((SeekEntryResult!10615 0))(
  ( (MissingZero!10615 (index!44837 (_ BitVec 32))) (Found!10615 (index!44838 (_ BitVec 32))) (Intermediate!10615 (undefined!11427 Bool) (index!44839 (_ BitVec 32)) (x!126458 (_ BitVec 32))) (Undefined!10615) (MissingVacant!10615 (index!44840 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95895 (_ BitVec 32)) SeekEntryResult!10615)

(assert (=> b!1402962 (= e!794403 (= (seekEntryOrOpen!0 (select (arr!46298 a!2901) j!112) a!2901 mask!2840) (Found!10615 j!112)))))

(declare-fun b!1402963 () Bool)

(declare-fun e!794405 () Bool)

(assert (=> b!1402963 (= e!794405 true)))

(declare-fun lt!618221 () SeekEntryResult!10615)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95895 (_ BitVec 32)) SeekEntryResult!10615)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1402963 (= lt!618221 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46298 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46298 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95896 (store (arr!46298 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46848 a!2901)) mask!2840))))

(declare-fun b!1402964 () Bool)

(assert (=> b!1402964 (= e!794402 (not e!794405))))

(declare-fun res!941476 () Bool)

(assert (=> b!1402964 (=> res!941476 e!794405)))

(declare-fun lt!618220 () SeekEntryResult!10615)

(assert (=> b!1402964 (= res!941476 (or (not (is-Intermediate!10615 lt!618220)) (undefined!11427 lt!618220)))))

(assert (=> b!1402964 e!794403))

(declare-fun res!941470 () Bool)

(assert (=> b!1402964 (=> (not res!941470) (not e!794403))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95895 (_ BitVec 32)) Bool)

(assert (=> b!1402964 (= res!941470 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47234 0))(
  ( (Unit!47235) )
))
(declare-fun lt!618222 () Unit!47234)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95895 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47234)

(assert (=> b!1402964 (= lt!618222 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1402964 (= lt!618220 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46298 a!2901) j!112) mask!2840) (select (arr!46298 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1402965 () Bool)

(declare-fun res!941471 () Bool)

(assert (=> b!1402965 (=> (not res!941471) (not e!794402))))

(assert (=> b!1402965 (= res!941471 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(assert (= (and start!120486 res!941475) b!1402961))

(assert (= (and b!1402961 res!941474) b!1402958))

(assert (= (and b!1402958 res!941472) b!1402959))

(assert (= (and b!1402959 res!941469) b!1402965))

(assert (= (and b!1402965 res!941471) b!1402960))

(assert (= (and b!1402960 res!941473) b!1402964))

(assert (= (and b!1402964 res!941470) b!1402962))

(assert (= (and b!1402964 (not res!941476)) b!1402963))

(declare-fun m!1291395 () Bool)

(assert (=> b!1402965 m!1291395))

(declare-fun m!1291397 () Bool)

(assert (=> b!1402960 m!1291397))

(declare-fun m!1291399 () Bool)

(assert (=> b!1402959 m!1291399))

(assert (=> b!1402959 m!1291399))

(declare-fun m!1291401 () Bool)

(assert (=> b!1402959 m!1291401))

(assert (=> b!1402962 m!1291399))

(assert (=> b!1402962 m!1291399))

(declare-fun m!1291403 () Bool)

(assert (=> b!1402962 m!1291403))

(declare-fun m!1291405 () Bool)

(assert (=> start!120486 m!1291405))

(declare-fun m!1291407 () Bool)

(assert (=> start!120486 m!1291407))

(declare-fun m!1291409 () Bool)

(assert (=> b!1402958 m!1291409))

(assert (=> b!1402958 m!1291409))

(declare-fun m!1291411 () Bool)

(assert (=> b!1402958 m!1291411))

(declare-fun m!1291413 () Bool)

(assert (=> b!1402963 m!1291413))

(declare-fun m!1291415 () Bool)

(assert (=> b!1402963 m!1291415))

(assert (=> b!1402963 m!1291415))

(declare-fun m!1291417 () Bool)

(assert (=> b!1402963 m!1291417))

(assert (=> b!1402963 m!1291417))

(assert (=> b!1402963 m!1291415))

(declare-fun m!1291419 () Bool)

(assert (=> b!1402963 m!1291419))

(assert (=> b!1402964 m!1291399))

(declare-fun m!1291421 () Bool)

(assert (=> b!1402964 m!1291421))

(assert (=> b!1402964 m!1291399))

(declare-fun m!1291423 () Bool)

(assert (=> b!1402964 m!1291423))

(assert (=> b!1402964 m!1291421))

(assert (=> b!1402964 m!1291399))

(declare-fun m!1291425 () Bool)

(assert (=> b!1402964 m!1291425))

(declare-fun m!1291427 () Bool)

(assert (=> b!1402964 m!1291427))

(push 1)

(assert (not b!1402959))

(assert (not b!1402958))

(assert (not b!1402963))

(assert (not start!120486))

(assert (not b!1402960))

(assert (not b!1402962))

(assert (not b!1402965))

(assert (not b!1402964))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

