; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121198 () Bool)

(assert start!121198)

(declare-fun b!1409222 () Bool)

(declare-fun res!946945 () Bool)

(declare-fun e!797489 () Bool)

(assert (=> b!1409222 (=> (not res!946945) (not e!797489))))

(declare-datatypes ((array!96352 0))(
  ( (array!96353 (arr!46519 (Array (_ BitVec 32) (_ BitVec 64))) (size!47069 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96352)

(declare-datatypes ((List!33038 0))(
  ( (Nil!33035) (Cons!33034 (h!34297 (_ BitVec 64)) (t!47732 List!33038)) )
))
(declare-fun arrayNoDuplicates!0 (array!96352 (_ BitVec 32) List!33038) Bool)

(assert (=> b!1409222 (= res!946945 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33035))))

(declare-fun b!1409224 () Bool)

(declare-fun res!946950 () Bool)

(assert (=> b!1409224 (=> (not res!946950) (not e!797489))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96352 (_ BitVec 32)) Bool)

(assert (=> b!1409224 (= res!946950 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1409225 () Bool)

(declare-fun res!946947 () Bool)

(assert (=> b!1409225 (=> (not res!946947) (not e!797489))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1409225 (= res!946947 (and (= (size!47069 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47069 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47069 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1409226 () Bool)

(declare-fun res!946951 () Bool)

(assert (=> b!1409226 (=> (not res!946951) (not e!797489))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1409226 (= res!946951 (validKeyInArray!0 (select (arr!46519 a!2901) j!112)))))

(declare-fun e!797487 () Bool)

(declare-fun b!1409227 () Bool)

(declare-datatypes ((SeekEntryResult!10830 0))(
  ( (MissingZero!10830 (index!45697 (_ BitVec 32))) (Found!10830 (index!45698 (_ BitVec 32))) (Intermediate!10830 (undefined!11642 Bool) (index!45699 (_ BitVec 32)) (x!127287 (_ BitVec 32))) (Undefined!10830) (MissingVacant!10830 (index!45700 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96352 (_ BitVec 32)) SeekEntryResult!10830)

(assert (=> b!1409227 (= e!797487 (= (seekEntryOrOpen!0 (select (arr!46519 a!2901) j!112) a!2901 mask!2840) (Found!10830 j!112)))))

(declare-fun res!946949 () Bool)

(assert (=> start!121198 (=> (not res!946949) (not e!797489))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121198 (= res!946949 (validMask!0 mask!2840))))

(assert (=> start!121198 e!797489))

(assert (=> start!121198 true))

(declare-fun array_inv!35547 (array!96352) Bool)

(assert (=> start!121198 (array_inv!35547 a!2901)))

(declare-fun b!1409223 () Bool)

(declare-fun e!797488 () Bool)

(assert (=> b!1409223 (= e!797489 (not e!797488))))

(declare-fun res!946948 () Bool)

(assert (=> b!1409223 (=> res!946948 e!797488)))

(declare-fun lt!620642 () SeekEntryResult!10830)

(assert (=> b!1409223 (= res!946948 (or (not (is-Intermediate!10830 lt!620642)) (undefined!11642 lt!620642)))))

(assert (=> b!1409223 e!797487))

(declare-fun res!946946 () Bool)

(assert (=> b!1409223 (=> (not res!946946) (not e!797487))))

(assert (=> b!1409223 (= res!946946 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47634 0))(
  ( (Unit!47635) )
))
(declare-fun lt!620641 () Unit!47634)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96352 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47634)

(assert (=> b!1409223 (= lt!620641 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96352 (_ BitVec 32)) SeekEntryResult!10830)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1409223 (= lt!620642 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46519 a!2901) j!112) mask!2840) (select (arr!46519 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1409228 () Bool)

(declare-fun res!946944 () Bool)

(assert (=> b!1409228 (=> (not res!946944) (not e!797489))))

(assert (=> b!1409228 (= res!946944 (validKeyInArray!0 (select (arr!46519 a!2901) i!1037)))))

(declare-fun b!1409229 () Bool)

(assert (=> b!1409229 (= e!797488 true)))

(declare-fun lt!620643 () SeekEntryResult!10830)

(assert (=> b!1409229 (= lt!620643 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46519 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46519 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96353 (store (arr!46519 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47069 a!2901)) mask!2840))))

(assert (= (and start!121198 res!946949) b!1409225))

(assert (= (and b!1409225 res!946947) b!1409228))

(assert (= (and b!1409228 res!946944) b!1409226))

(assert (= (and b!1409226 res!946951) b!1409224))

(assert (= (and b!1409224 res!946950) b!1409222))

(assert (= (and b!1409222 res!946945) b!1409223))

(assert (= (and b!1409223 res!946946) b!1409227))

(assert (= (and b!1409223 (not res!946948)) b!1409229))

(declare-fun m!1298849 () Bool)

(assert (=> b!1409224 m!1298849))

(declare-fun m!1298851 () Bool)

(assert (=> b!1409227 m!1298851))

(assert (=> b!1409227 m!1298851))

(declare-fun m!1298853 () Bool)

(assert (=> b!1409227 m!1298853))

(declare-fun m!1298855 () Bool)

(assert (=> b!1409228 m!1298855))

(assert (=> b!1409228 m!1298855))

(declare-fun m!1298857 () Bool)

(assert (=> b!1409228 m!1298857))

(assert (=> b!1409226 m!1298851))

(assert (=> b!1409226 m!1298851))

(declare-fun m!1298859 () Bool)

(assert (=> b!1409226 m!1298859))

(assert (=> b!1409223 m!1298851))

(declare-fun m!1298861 () Bool)

(assert (=> b!1409223 m!1298861))

(assert (=> b!1409223 m!1298851))

(declare-fun m!1298863 () Bool)

(assert (=> b!1409223 m!1298863))

(assert (=> b!1409223 m!1298861))

(assert (=> b!1409223 m!1298851))

(declare-fun m!1298865 () Bool)

(assert (=> b!1409223 m!1298865))

(declare-fun m!1298867 () Bool)

(assert (=> b!1409223 m!1298867))

(declare-fun m!1298869 () Bool)

(assert (=> b!1409229 m!1298869))

(declare-fun m!1298871 () Bool)

(assert (=> b!1409229 m!1298871))

(assert (=> b!1409229 m!1298871))

(declare-fun m!1298873 () Bool)

(assert (=> b!1409229 m!1298873))

(assert (=> b!1409229 m!1298873))

(assert (=> b!1409229 m!1298871))

(declare-fun m!1298875 () Bool)

(assert (=> b!1409229 m!1298875))

(declare-fun m!1298877 () Bool)

(assert (=> b!1409222 m!1298877))

(declare-fun m!1298879 () Bool)

(assert (=> start!121198 m!1298879))

(declare-fun m!1298881 () Bool)

(assert (=> start!121198 m!1298881))

(push 1)

(assert (not b!1409222))

(assert (not b!1409229))

(assert (not b!1409227))

(assert (not b!1409223))

(assert (not b!1409224))

(assert (not start!121198))

(assert (not b!1409228))

(assert (not b!1409226))

(check-sat)

(pop 1)

(push 1)

(check-sat)

