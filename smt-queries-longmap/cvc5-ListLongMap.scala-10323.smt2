; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121422 () Bool)

(assert start!121422)

(declare-fun b!1410731 () Bool)

(declare-fun e!798337 () Bool)

(declare-fun e!798335 () Bool)

(assert (=> b!1410731 (= e!798337 (not e!798335))))

(declare-fun res!947965 () Bool)

(assert (=> b!1410731 (=> res!947965 e!798335)))

(declare-datatypes ((SeekEntryResult!10861 0))(
  ( (MissingZero!10861 (index!45821 (_ BitVec 32))) (Found!10861 (index!45822 (_ BitVec 32))) (Intermediate!10861 (undefined!11673 Bool) (index!45823 (_ BitVec 32)) (x!127424 (_ BitVec 32))) (Undefined!10861) (MissingVacant!10861 (index!45824 (_ BitVec 32))) )
))
(declare-fun lt!621311 () SeekEntryResult!10861)

(assert (=> b!1410731 (= res!947965 (or (not (is-Intermediate!10861 lt!621311)) (undefined!11673 lt!621311)))))

(declare-fun e!798338 () Bool)

(assert (=> b!1410731 e!798338))

(declare-fun res!947960 () Bool)

(assert (=> b!1410731 (=> (not res!947960) (not e!798338))))

(declare-datatypes ((array!96423 0))(
  ( (array!96424 (arr!46550 (Array (_ BitVec 32) (_ BitVec 64))) (size!47100 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96423)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96423 (_ BitVec 32)) Bool)

(assert (=> b!1410731 (= res!947960 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47696 0))(
  ( (Unit!47697) )
))
(declare-fun lt!621312 () Unit!47696)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96423 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47696)

(assert (=> b!1410731 (= lt!621312 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!621309 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96423 (_ BitVec 32)) SeekEntryResult!10861)

(assert (=> b!1410731 (= lt!621311 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!621309 (select (arr!46550 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1410731 (= lt!621309 (toIndex!0 (select (arr!46550 a!2901) j!112) mask!2840))))

(declare-fun res!947964 () Bool)

(assert (=> start!121422 (=> (not res!947964) (not e!798337))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121422 (= res!947964 (validMask!0 mask!2840))))

(assert (=> start!121422 e!798337))

(assert (=> start!121422 true))

(declare-fun array_inv!35578 (array!96423) Bool)

(assert (=> start!121422 (array_inv!35578 a!2901)))

(declare-fun lt!621310 () SeekEntryResult!10861)

(declare-fun b!1410732 () Bool)

(assert (=> b!1410732 (= e!798335 (or (= lt!621311 lt!621310) (not (is-Intermediate!10861 lt!621310)) (bvslt (x!127424 lt!621311) #b00000000000000000000000000000000) (bvsgt (x!127424 lt!621311) #b01111111111111111111111111111110) (bvslt lt!621309 #b00000000000000000000000000000000) (bvsge lt!621309 (size!47100 a!2901)) (bvslt (index!45823 lt!621311) #b00000000000000000000000000000000) (bvsge (index!45823 lt!621311) (size!47100 a!2901)) (not (= lt!621311 (Intermediate!10861 false (index!45823 lt!621311) (x!127424 lt!621311)))) (= lt!621310 (Intermediate!10861 (undefined!11673 lt!621310) (index!45823 lt!621310) (x!127424 lt!621310)))))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1410732 (= lt!621310 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46550 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46550 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96424 (store (arr!46550 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47100 a!2901)) mask!2840))))

(declare-fun b!1410733 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96423 (_ BitVec 32)) SeekEntryResult!10861)

(assert (=> b!1410733 (= e!798338 (= (seekEntryOrOpen!0 (select (arr!46550 a!2901) j!112) a!2901 mask!2840) (Found!10861 j!112)))))

(declare-fun b!1410734 () Bool)

(declare-fun res!947959 () Bool)

(assert (=> b!1410734 (=> (not res!947959) (not e!798337))))

(declare-datatypes ((List!33069 0))(
  ( (Nil!33066) (Cons!33065 (h!34337 (_ BitVec 64)) (t!47763 List!33069)) )
))
(declare-fun arrayNoDuplicates!0 (array!96423 (_ BitVec 32) List!33069) Bool)

(assert (=> b!1410734 (= res!947959 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33066))))

(declare-fun b!1410735 () Bool)

(declare-fun res!947962 () Bool)

(assert (=> b!1410735 (=> (not res!947962) (not e!798337))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1410735 (= res!947962 (validKeyInArray!0 (select (arr!46550 a!2901) i!1037)))))

(declare-fun b!1410736 () Bool)

(declare-fun res!947958 () Bool)

(assert (=> b!1410736 (=> (not res!947958) (not e!798337))))

(assert (=> b!1410736 (= res!947958 (validKeyInArray!0 (select (arr!46550 a!2901) j!112)))))

(declare-fun b!1410737 () Bool)

(declare-fun res!947963 () Bool)

(assert (=> b!1410737 (=> (not res!947963) (not e!798337))))

(assert (=> b!1410737 (= res!947963 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1410738 () Bool)

(declare-fun res!947961 () Bool)

(assert (=> b!1410738 (=> (not res!947961) (not e!798337))))

(assert (=> b!1410738 (= res!947961 (and (= (size!47100 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47100 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47100 a!2901)) (not (= i!1037 j!112))))))

(assert (= (and start!121422 res!947964) b!1410738))

(assert (= (and b!1410738 res!947961) b!1410735))

(assert (= (and b!1410735 res!947962) b!1410736))

(assert (= (and b!1410736 res!947958) b!1410737))

(assert (= (and b!1410737 res!947963) b!1410734))

(assert (= (and b!1410734 res!947959) b!1410731))

(assert (= (and b!1410731 res!947960) b!1410733))

(assert (= (and b!1410731 (not res!947965)) b!1410732))

(declare-fun m!1300365 () Bool)

(assert (=> b!1410731 m!1300365))

(declare-fun m!1300367 () Bool)

(assert (=> b!1410731 m!1300367))

(assert (=> b!1410731 m!1300365))

(declare-fun m!1300369 () Bool)

(assert (=> b!1410731 m!1300369))

(assert (=> b!1410731 m!1300365))

(declare-fun m!1300371 () Bool)

(assert (=> b!1410731 m!1300371))

(declare-fun m!1300373 () Bool)

(assert (=> b!1410731 m!1300373))

(assert (=> b!1410736 m!1300365))

(assert (=> b!1410736 m!1300365))

(declare-fun m!1300375 () Bool)

(assert (=> b!1410736 m!1300375))

(declare-fun m!1300377 () Bool)

(assert (=> b!1410734 m!1300377))

(declare-fun m!1300379 () Bool)

(assert (=> b!1410732 m!1300379))

(declare-fun m!1300381 () Bool)

(assert (=> b!1410732 m!1300381))

(assert (=> b!1410732 m!1300381))

(declare-fun m!1300383 () Bool)

(assert (=> b!1410732 m!1300383))

(assert (=> b!1410732 m!1300383))

(assert (=> b!1410732 m!1300381))

(declare-fun m!1300385 () Bool)

(assert (=> b!1410732 m!1300385))

(assert (=> b!1410733 m!1300365))

(assert (=> b!1410733 m!1300365))

(declare-fun m!1300387 () Bool)

(assert (=> b!1410733 m!1300387))

(declare-fun m!1300389 () Bool)

(assert (=> b!1410735 m!1300389))

(assert (=> b!1410735 m!1300389))

(declare-fun m!1300391 () Bool)

(assert (=> b!1410735 m!1300391))

(declare-fun m!1300393 () Bool)

(assert (=> b!1410737 m!1300393))

(declare-fun m!1300395 () Bool)

(assert (=> start!121422 m!1300395))

(declare-fun m!1300397 () Bool)

(assert (=> start!121422 m!1300397))

(push 1)

