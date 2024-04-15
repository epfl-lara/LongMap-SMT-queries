; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121158 () Bool)

(assert start!121158)

(declare-fun b!1408709 () Bool)

(declare-fun e!797232 () Bool)

(declare-fun e!797231 () Bool)

(assert (=> b!1408709 (= e!797232 (not e!797231))))

(declare-fun res!946487 () Bool)

(assert (=> b!1408709 (=> res!946487 e!797231)))

(declare-datatypes ((SeekEntryResult!10813 0))(
  ( (MissingZero!10813 (index!45629 (_ BitVec 32))) (Found!10813 (index!45630 (_ BitVec 32))) (Intermediate!10813 (undefined!11625 Bool) (index!45631 (_ BitVec 32)) (x!127219 (_ BitVec 32))) (Undefined!10813) (MissingVacant!10813 (index!45632 (_ BitVec 32))) )
))
(declare-fun lt!620290 () SeekEntryResult!10813)

(assert (=> b!1408709 (= res!946487 (or (not (is-Intermediate!10813 lt!620290)) (undefined!11625 lt!620290)))))

(declare-fun e!797234 () Bool)

(assert (=> b!1408709 e!797234))

(declare-fun res!946484 () Bool)

(assert (=> b!1408709 (=> (not res!946484) (not e!797234))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96265 0))(
  ( (array!96266 (arr!46476 (Array (_ BitVec 32) (_ BitVec 64))) (size!47028 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96265)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96265 (_ BitVec 32)) Bool)

(assert (=> b!1408709 (= res!946484 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47443 0))(
  ( (Unit!47444) )
))
(declare-fun lt!620291 () Unit!47443)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96265 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47443)

(assert (=> b!1408709 (= lt!620291 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96265 (_ BitVec 32)) SeekEntryResult!10813)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1408709 (= lt!620290 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46476 a!2901) j!112) mask!2840) (select (arr!46476 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1408710 () Bool)

(declare-fun res!946489 () Bool)

(assert (=> b!1408710 (=> (not res!946489) (not e!797232))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1408710 (= res!946489 (validKeyInArray!0 (select (arr!46476 a!2901) i!1037)))))

(declare-fun b!1408711 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96265 (_ BitVec 32)) SeekEntryResult!10813)

(assert (=> b!1408711 (= e!797234 (= (seekEntryOrOpen!0 (select (arr!46476 a!2901) j!112) a!2901 mask!2840) (Found!10813 j!112)))))

(declare-fun b!1408712 () Bool)

(declare-fun res!946482 () Bool)

(assert (=> b!1408712 (=> (not res!946482) (not e!797232))))

(declare-datatypes ((List!33073 0))(
  ( (Nil!33070) (Cons!33069 (h!34332 (_ BitVec 64)) (t!47759 List!33073)) )
))
(declare-fun arrayNoDuplicates!0 (array!96265 (_ BitVec 32) List!33073) Bool)

(assert (=> b!1408712 (= res!946482 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33070))))

(declare-fun res!946488 () Bool)

(assert (=> start!121158 (=> (not res!946488) (not e!797232))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121158 (= res!946488 (validMask!0 mask!2840))))

(assert (=> start!121158 e!797232))

(assert (=> start!121158 true))

(declare-fun array_inv!35709 (array!96265) Bool)

(assert (=> start!121158 (array_inv!35709 a!2901)))

(declare-fun b!1408713 () Bool)

(declare-fun res!946483 () Bool)

(assert (=> b!1408713 (=> (not res!946483) (not e!797232))))

(assert (=> b!1408713 (= res!946483 (validKeyInArray!0 (select (arr!46476 a!2901) j!112)))))

(declare-fun b!1408714 () Bool)

(declare-fun res!946486 () Bool)

(assert (=> b!1408714 (=> (not res!946486) (not e!797232))))

(assert (=> b!1408714 (= res!946486 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1408715 () Bool)

(assert (=> b!1408715 (= e!797231 true)))

(declare-fun lt!620289 () SeekEntryResult!10813)

(assert (=> b!1408715 (= lt!620289 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46476 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46476 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96266 (store (arr!46476 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47028 a!2901)) mask!2840))))

(declare-fun b!1408716 () Bool)

(declare-fun res!946485 () Bool)

(assert (=> b!1408716 (=> (not res!946485) (not e!797232))))

(assert (=> b!1408716 (= res!946485 (and (= (size!47028 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47028 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47028 a!2901)) (not (= i!1037 j!112))))))

(assert (= (and start!121158 res!946488) b!1408716))

(assert (= (and b!1408716 res!946485) b!1408710))

(assert (= (and b!1408710 res!946489) b!1408713))

(assert (= (and b!1408713 res!946483) b!1408714))

(assert (= (and b!1408714 res!946486) b!1408712))

(assert (= (and b!1408712 res!946482) b!1408709))

(assert (= (and b!1408709 res!946484) b!1408711))

(assert (= (and b!1408709 (not res!946487)) b!1408715))

(declare-fun m!1297701 () Bool)

(assert (=> b!1408710 m!1297701))

(assert (=> b!1408710 m!1297701))

(declare-fun m!1297703 () Bool)

(assert (=> b!1408710 m!1297703))

(declare-fun m!1297705 () Bool)

(assert (=> b!1408711 m!1297705))

(assert (=> b!1408711 m!1297705))

(declare-fun m!1297707 () Bool)

(assert (=> b!1408711 m!1297707))

(declare-fun m!1297709 () Bool)

(assert (=> b!1408714 m!1297709))

(declare-fun m!1297711 () Bool)

(assert (=> b!1408715 m!1297711))

(declare-fun m!1297713 () Bool)

(assert (=> b!1408715 m!1297713))

(assert (=> b!1408715 m!1297713))

(declare-fun m!1297715 () Bool)

(assert (=> b!1408715 m!1297715))

(assert (=> b!1408715 m!1297715))

(assert (=> b!1408715 m!1297713))

(declare-fun m!1297717 () Bool)

(assert (=> b!1408715 m!1297717))

(declare-fun m!1297719 () Bool)

(assert (=> b!1408712 m!1297719))

(declare-fun m!1297721 () Bool)

(assert (=> start!121158 m!1297721))

(declare-fun m!1297723 () Bool)

(assert (=> start!121158 m!1297723))

(assert (=> b!1408709 m!1297705))

(declare-fun m!1297725 () Bool)

(assert (=> b!1408709 m!1297725))

(assert (=> b!1408709 m!1297705))

(declare-fun m!1297727 () Bool)

(assert (=> b!1408709 m!1297727))

(assert (=> b!1408709 m!1297725))

(assert (=> b!1408709 m!1297705))

(declare-fun m!1297729 () Bool)

(assert (=> b!1408709 m!1297729))

(declare-fun m!1297731 () Bool)

(assert (=> b!1408709 m!1297731))

(assert (=> b!1408713 m!1297705))

(assert (=> b!1408713 m!1297705))

(declare-fun m!1297733 () Bool)

(assert (=> b!1408713 m!1297733))

(push 1)

(assert (not b!1408711))

(assert (not b!1408710))

(assert (not b!1408712))

(assert (not start!121158))

(assert (not b!1408715))

(assert (not b!1408713))

(assert (not b!1408709))

(assert (not b!1408714))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

