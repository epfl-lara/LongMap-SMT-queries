; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121132 () Bool)

(assert start!121132)

(declare-fun b!1408430 () Bool)

(declare-fun e!797093 () Bool)

(declare-fun e!797090 () Bool)

(assert (=> b!1408430 (= e!797093 (not e!797090))))

(declare-fun res!946152 () Bool)

(assert (=> b!1408430 (=> res!946152 e!797090)))

(declare-datatypes ((SeekEntryResult!10797 0))(
  ( (MissingZero!10797 (index!45565 (_ BitVec 32))) (Found!10797 (index!45566 (_ BitVec 32))) (Intermediate!10797 (undefined!11609 Bool) (index!45567 (_ BitVec 32)) (x!127166 (_ BitVec 32))) (Undefined!10797) (MissingVacant!10797 (index!45568 (_ BitVec 32))) )
))
(declare-fun lt!620346 () SeekEntryResult!10797)

(assert (=> b!1408430 (= res!946152 (or (not (is-Intermediate!10797 lt!620346)) (undefined!11609 lt!620346)))))

(declare-fun e!797091 () Bool)

(assert (=> b!1408430 e!797091))

(declare-fun res!946158 () Bool)

(assert (=> b!1408430 (=> (not res!946158) (not e!797091))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96286 0))(
  ( (array!96287 (arr!46486 (Array (_ BitVec 32) (_ BitVec 64))) (size!47036 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96286)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96286 (_ BitVec 32)) Bool)

(assert (=> b!1408430 (= res!946158 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47568 0))(
  ( (Unit!47569) )
))
(declare-fun lt!620345 () Unit!47568)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96286 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47568)

(assert (=> b!1408430 (= lt!620345 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96286 (_ BitVec 32)) SeekEntryResult!10797)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1408430 (= lt!620346 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46486 a!2901) j!112) mask!2840) (select (arr!46486 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1408431 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96286 (_ BitVec 32)) SeekEntryResult!10797)

(assert (=> b!1408431 (= e!797091 (= (seekEntryOrOpen!0 (select (arr!46486 a!2901) j!112) a!2901 mask!2840) (Found!10797 j!112)))))

(declare-fun b!1408432 () Bool)

(declare-fun res!946154 () Bool)

(assert (=> b!1408432 (=> (not res!946154) (not e!797093))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1408432 (= res!946154 (and (= (size!47036 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47036 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47036 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1408434 () Bool)

(declare-fun res!946155 () Bool)

(assert (=> b!1408434 (=> (not res!946155) (not e!797093))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1408434 (= res!946155 (validKeyInArray!0 (select (arr!46486 a!2901) j!112)))))

(declare-fun b!1408435 () Bool)

(declare-fun res!946156 () Bool)

(assert (=> b!1408435 (=> (not res!946156) (not e!797093))))

(assert (=> b!1408435 (= res!946156 (validKeyInArray!0 (select (arr!46486 a!2901) i!1037)))))

(declare-fun b!1408436 () Bool)

(declare-fun res!946159 () Bool)

(assert (=> b!1408436 (=> (not res!946159) (not e!797093))))

(assert (=> b!1408436 (= res!946159 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1408437 () Bool)

(assert (=> b!1408437 (= e!797090 true)))

(declare-fun lt!620344 () SeekEntryResult!10797)

(assert (=> b!1408437 (= lt!620344 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46486 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46486 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96287 (store (arr!46486 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47036 a!2901)) mask!2840))))

(declare-fun res!946157 () Bool)

(assert (=> start!121132 (=> (not res!946157) (not e!797093))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121132 (= res!946157 (validMask!0 mask!2840))))

(assert (=> start!121132 e!797093))

(assert (=> start!121132 true))

(declare-fun array_inv!35514 (array!96286) Bool)

(assert (=> start!121132 (array_inv!35514 a!2901)))

(declare-fun b!1408433 () Bool)

(declare-fun res!946153 () Bool)

(assert (=> b!1408433 (=> (not res!946153) (not e!797093))))

(declare-datatypes ((List!33005 0))(
  ( (Nil!33002) (Cons!33001 (h!34264 (_ BitVec 64)) (t!47699 List!33005)) )
))
(declare-fun arrayNoDuplicates!0 (array!96286 (_ BitVec 32) List!33005) Bool)

(assert (=> b!1408433 (= res!946153 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33002))))

(assert (= (and start!121132 res!946157) b!1408432))

(assert (= (and b!1408432 res!946154) b!1408435))

(assert (= (and b!1408435 res!946156) b!1408434))

(assert (= (and b!1408434 res!946155) b!1408436))

(assert (= (and b!1408436 res!946159) b!1408433))

(assert (= (and b!1408433 res!946153) b!1408430))

(assert (= (and b!1408430 res!946158) b!1408431))

(assert (= (and b!1408430 (not res!946152)) b!1408437))

(declare-fun m!1297727 () Bool)

(assert (=> b!1408436 m!1297727))

(declare-fun m!1297729 () Bool)

(assert (=> b!1408433 m!1297729))

(declare-fun m!1297731 () Bool)

(assert (=> b!1408435 m!1297731))

(assert (=> b!1408435 m!1297731))

(declare-fun m!1297733 () Bool)

(assert (=> b!1408435 m!1297733))

(declare-fun m!1297735 () Bool)

(assert (=> b!1408437 m!1297735))

(declare-fun m!1297737 () Bool)

(assert (=> b!1408437 m!1297737))

(assert (=> b!1408437 m!1297737))

(declare-fun m!1297739 () Bool)

(assert (=> b!1408437 m!1297739))

(assert (=> b!1408437 m!1297739))

(assert (=> b!1408437 m!1297737))

(declare-fun m!1297741 () Bool)

(assert (=> b!1408437 m!1297741))

(declare-fun m!1297743 () Bool)

(assert (=> b!1408431 m!1297743))

(assert (=> b!1408431 m!1297743))

(declare-fun m!1297745 () Bool)

(assert (=> b!1408431 m!1297745))

(declare-fun m!1297747 () Bool)

(assert (=> start!121132 m!1297747))

(declare-fun m!1297749 () Bool)

(assert (=> start!121132 m!1297749))

(assert (=> b!1408430 m!1297743))

(declare-fun m!1297751 () Bool)

(assert (=> b!1408430 m!1297751))

(assert (=> b!1408430 m!1297743))

(declare-fun m!1297753 () Bool)

(assert (=> b!1408430 m!1297753))

(assert (=> b!1408430 m!1297751))

(assert (=> b!1408430 m!1297743))

(declare-fun m!1297755 () Bool)

(assert (=> b!1408430 m!1297755))

(declare-fun m!1297757 () Bool)

(assert (=> b!1408430 m!1297757))

(assert (=> b!1408434 m!1297743))

(assert (=> b!1408434 m!1297743))

(declare-fun m!1297759 () Bool)

(assert (=> b!1408434 m!1297759))

(push 1)

(assert (not b!1408431))

(assert (not b!1408435))

(assert (not b!1408437))

(assert (not b!1408430))

(assert (not b!1408434))

(assert (not b!1408436))

(assert (not start!121132))

(assert (not b!1408433))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

