; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121086 () Bool)

(assert start!121086)

(declare-fun b!1407860 () Bool)

(declare-fun res!945397 () Bool)

(declare-fun e!796920 () Bool)

(assert (=> b!1407860 (=> (not res!945397) (not e!796920))))

(declare-datatypes ((array!96315 0))(
  ( (array!96316 (arr!46503 (Array (_ BitVec 32) (_ BitVec 64))) (size!47054 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96315)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96315 (_ BitVec 32)) Bool)

(assert (=> b!1407860 (= res!945397 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1407861 () Bool)

(declare-fun res!945396 () Bool)

(assert (=> b!1407861 (=> (not res!945396) (not e!796920))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1407861 (= res!945396 (and (= (size!47054 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47054 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47054 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1407862 () Bool)

(declare-fun res!945399 () Bool)

(assert (=> b!1407862 (=> (not res!945399) (not e!796920))))

(declare-datatypes ((List!33009 0))(
  ( (Nil!33006) (Cons!33005 (h!34267 (_ BitVec 64)) (t!47695 List!33009)) )
))
(declare-fun arrayNoDuplicates!0 (array!96315 (_ BitVec 32) List!33009) Bool)

(assert (=> b!1407862 (= res!945399 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33006))))

(declare-fun b!1407863 () Bool)

(declare-fun e!796919 () Bool)

(declare-datatypes ((SeekEntryResult!10717 0))(
  ( (MissingZero!10717 (index!45245 (_ BitVec 32))) (Found!10717 (index!45246 (_ BitVec 32))) (Intermediate!10717 (undefined!11529 Bool) (index!45247 (_ BitVec 32)) (x!126991 (_ BitVec 32))) (Undefined!10717) (MissingVacant!10717 (index!45248 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96315 (_ BitVec 32)) SeekEntryResult!10717)

(assert (=> b!1407863 (= e!796919 (= (seekEntryOrOpen!0 (select (arr!46503 a!2901) j!112) a!2901 mask!2840) (Found!10717 j!112)))))

(declare-fun b!1407864 () Bool)

(declare-fun e!796921 () Bool)

(assert (=> b!1407864 (= e!796921 true)))

(declare-fun lt!619889 () SeekEntryResult!10717)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96315 (_ BitVec 32)) SeekEntryResult!10717)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1407864 (= lt!619889 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46503 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46503 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96316 (store (arr!46503 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47054 a!2901)) mask!2840))))

(declare-fun b!1407865 () Bool)

(assert (=> b!1407865 (= e!796920 (not e!796921))))

(declare-fun res!945394 () Bool)

(assert (=> b!1407865 (=> res!945394 e!796921)))

(declare-fun lt!619887 () SeekEntryResult!10717)

(assert (=> b!1407865 (= res!945394 (or (not (is-Intermediate!10717 lt!619887)) (undefined!11529 lt!619887)))))

(assert (=> b!1407865 e!796919))

(declare-fun res!945395 () Bool)

(assert (=> b!1407865 (=> (not res!945395) (not e!796919))))

(assert (=> b!1407865 (= res!945395 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47435 0))(
  ( (Unit!47436) )
))
(declare-fun lt!619888 () Unit!47435)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96315 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47435)

(assert (=> b!1407865 (= lt!619888 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1407865 (= lt!619887 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46503 a!2901) j!112) mask!2840) (select (arr!46503 a!2901) j!112) a!2901 mask!2840))))

(declare-fun res!945398 () Bool)

(assert (=> start!121086 (=> (not res!945398) (not e!796920))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121086 (= res!945398 (validMask!0 mask!2840))))

(assert (=> start!121086 e!796920))

(assert (=> start!121086 true))

(declare-fun array_inv!35784 (array!96315) Bool)

(assert (=> start!121086 (array_inv!35784 a!2901)))

(declare-fun b!1407866 () Bool)

(declare-fun res!945400 () Bool)

(assert (=> b!1407866 (=> (not res!945400) (not e!796920))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1407866 (= res!945400 (validKeyInArray!0 (select (arr!46503 a!2901) j!112)))))

(declare-fun b!1407867 () Bool)

(declare-fun res!945393 () Bool)

(assert (=> b!1407867 (=> (not res!945393) (not e!796920))))

(assert (=> b!1407867 (= res!945393 (validKeyInArray!0 (select (arr!46503 a!2901) i!1037)))))

(assert (= (and start!121086 res!945398) b!1407861))

(assert (= (and b!1407861 res!945396) b!1407867))

(assert (= (and b!1407867 res!945393) b!1407866))

(assert (= (and b!1407866 res!945400) b!1407860))

(assert (= (and b!1407860 res!945397) b!1407862))

(assert (= (and b!1407862 res!945399) b!1407865))

(assert (= (and b!1407865 res!945395) b!1407863))

(assert (= (and b!1407865 (not res!945394)) b!1407864))

(declare-fun m!1297353 () Bool)

(assert (=> b!1407864 m!1297353))

(declare-fun m!1297355 () Bool)

(assert (=> b!1407864 m!1297355))

(assert (=> b!1407864 m!1297355))

(declare-fun m!1297357 () Bool)

(assert (=> b!1407864 m!1297357))

(assert (=> b!1407864 m!1297357))

(assert (=> b!1407864 m!1297355))

(declare-fun m!1297359 () Bool)

(assert (=> b!1407864 m!1297359))

(declare-fun m!1297361 () Bool)

(assert (=> b!1407865 m!1297361))

(declare-fun m!1297363 () Bool)

(assert (=> b!1407865 m!1297363))

(assert (=> b!1407865 m!1297361))

(declare-fun m!1297365 () Bool)

(assert (=> b!1407865 m!1297365))

(assert (=> b!1407865 m!1297363))

(assert (=> b!1407865 m!1297361))

(declare-fun m!1297367 () Bool)

(assert (=> b!1407865 m!1297367))

(declare-fun m!1297369 () Bool)

(assert (=> b!1407865 m!1297369))

(declare-fun m!1297371 () Bool)

(assert (=> b!1407867 m!1297371))

(assert (=> b!1407867 m!1297371))

(declare-fun m!1297373 () Bool)

(assert (=> b!1407867 m!1297373))

(declare-fun m!1297375 () Bool)

(assert (=> b!1407860 m!1297375))

(assert (=> b!1407866 m!1297361))

(assert (=> b!1407866 m!1297361))

(declare-fun m!1297377 () Bool)

(assert (=> b!1407866 m!1297377))

(declare-fun m!1297379 () Bool)

(assert (=> b!1407862 m!1297379))

(declare-fun m!1297381 () Bool)

(assert (=> start!121086 m!1297381))

(declare-fun m!1297383 () Bool)

(assert (=> start!121086 m!1297383))

(assert (=> b!1407863 m!1297361))

(assert (=> b!1407863 m!1297361))

(declare-fun m!1297385 () Bool)

(assert (=> b!1407863 m!1297385))

(push 1)

(assert (not b!1407864))

(assert (not b!1407866))

(assert (not b!1407863))

(assert (not start!121086))

(assert (not b!1407862))

(assert (not b!1407867))

(assert (not b!1407860))

(assert (not b!1407865))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

