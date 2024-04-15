; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121188 () Bool)

(assert start!121188)

(declare-fun b!1409069 () Bool)

(declare-fun res!946844 () Bool)

(declare-fun e!797411 () Bool)

(assert (=> b!1409069 (=> (not res!946844) (not e!797411))))

(declare-datatypes ((array!96295 0))(
  ( (array!96296 (arr!46491 (Array (_ BitVec 32) (_ BitVec 64))) (size!47043 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96295)

(declare-datatypes ((List!33088 0))(
  ( (Nil!33085) (Cons!33084 (h!34347 (_ BitVec 64)) (t!47774 List!33088)) )
))
(declare-fun arrayNoDuplicates!0 (array!96295 (_ BitVec 32) List!33088) Bool)

(assert (=> b!1409069 (= res!946844 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33085))))

(declare-fun b!1409071 () Bool)

(declare-fun e!797413 () Bool)

(assert (=> b!1409071 (= e!797411 (not e!797413))))

(declare-fun res!946842 () Bool)

(assert (=> b!1409071 (=> res!946842 e!797413)))

(declare-datatypes ((SeekEntryResult!10828 0))(
  ( (MissingZero!10828 (index!45689 (_ BitVec 32))) (Found!10828 (index!45690 (_ BitVec 32))) (Intermediate!10828 (undefined!11640 Bool) (index!45691 (_ BitVec 32)) (x!127274 (_ BitVec 32))) (Undefined!10828) (MissingVacant!10828 (index!45692 (_ BitVec 32))) )
))
(declare-fun lt!620425 () SeekEntryResult!10828)

(assert (=> b!1409071 (= res!946842 (or (not (is-Intermediate!10828 lt!620425)) (undefined!11640 lt!620425)))))

(declare-fun e!797414 () Bool)

(assert (=> b!1409071 e!797414))

(declare-fun res!946845 () Bool)

(assert (=> b!1409071 (=> (not res!946845) (not e!797414))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96295 (_ BitVec 32)) Bool)

(assert (=> b!1409071 (= res!946845 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47473 0))(
  ( (Unit!47474) )
))
(declare-fun lt!620424 () Unit!47473)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96295 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47473)

(assert (=> b!1409071 (= lt!620424 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96295 (_ BitVec 32)) SeekEntryResult!10828)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1409071 (= lt!620425 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46491 a!2901) j!112) mask!2840) (select (arr!46491 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1409072 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96295 (_ BitVec 32)) SeekEntryResult!10828)

(assert (=> b!1409072 (= e!797414 (= (seekEntryOrOpen!0 (select (arr!46491 a!2901) j!112) a!2901 mask!2840) (Found!10828 j!112)))))

(declare-fun b!1409073 () Bool)

(declare-fun res!946846 () Bool)

(assert (=> b!1409073 (=> (not res!946846) (not e!797411))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1409073 (= res!946846 (and (= (size!47043 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47043 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47043 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1409074 () Bool)

(declare-fun res!946847 () Bool)

(assert (=> b!1409074 (=> (not res!946847) (not e!797411))))

(assert (=> b!1409074 (= res!946847 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1409075 () Bool)

(declare-fun res!946843 () Bool)

(assert (=> b!1409075 (=> (not res!946843) (not e!797411))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1409075 (= res!946843 (validKeyInArray!0 (select (arr!46491 a!2901) j!112)))))

(declare-fun b!1409076 () Bool)

(declare-fun res!946848 () Bool)

(assert (=> b!1409076 (=> (not res!946848) (not e!797411))))

(assert (=> b!1409076 (= res!946848 (validKeyInArray!0 (select (arr!46491 a!2901) i!1037)))))

(declare-fun res!946849 () Bool)

(assert (=> start!121188 (=> (not res!946849) (not e!797411))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121188 (= res!946849 (validMask!0 mask!2840))))

(assert (=> start!121188 e!797411))

(assert (=> start!121188 true))

(declare-fun array_inv!35724 (array!96295) Bool)

(assert (=> start!121188 (array_inv!35724 a!2901)))

(declare-fun b!1409070 () Bool)

(assert (=> b!1409070 (= e!797413 true)))

(declare-fun lt!620426 () SeekEntryResult!10828)

(assert (=> b!1409070 (= lt!620426 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46491 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46491 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96296 (store (arr!46491 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47043 a!2901)) mask!2840))))

(assert (= (and start!121188 res!946849) b!1409073))

(assert (= (and b!1409073 res!946846) b!1409076))

(assert (= (and b!1409076 res!946848) b!1409075))

(assert (= (and b!1409075 res!946843) b!1409074))

(assert (= (and b!1409074 res!946847) b!1409069))

(assert (= (and b!1409069 res!946844) b!1409071))

(assert (= (and b!1409071 res!946845) b!1409072))

(assert (= (and b!1409071 (not res!946842)) b!1409070))

(declare-fun m!1298211 () Bool)

(assert (=> b!1409069 m!1298211))

(declare-fun m!1298213 () Bool)

(assert (=> b!1409070 m!1298213))

(declare-fun m!1298215 () Bool)

(assert (=> b!1409070 m!1298215))

(assert (=> b!1409070 m!1298215))

(declare-fun m!1298217 () Bool)

(assert (=> b!1409070 m!1298217))

(assert (=> b!1409070 m!1298217))

(assert (=> b!1409070 m!1298215))

(declare-fun m!1298219 () Bool)

(assert (=> b!1409070 m!1298219))

(declare-fun m!1298221 () Bool)

(assert (=> start!121188 m!1298221))

(declare-fun m!1298223 () Bool)

(assert (=> start!121188 m!1298223))

(declare-fun m!1298225 () Bool)

(assert (=> b!1409074 m!1298225))

(declare-fun m!1298227 () Bool)

(assert (=> b!1409072 m!1298227))

(assert (=> b!1409072 m!1298227))

(declare-fun m!1298229 () Bool)

(assert (=> b!1409072 m!1298229))

(assert (=> b!1409075 m!1298227))

(assert (=> b!1409075 m!1298227))

(declare-fun m!1298231 () Bool)

(assert (=> b!1409075 m!1298231))

(declare-fun m!1298233 () Bool)

(assert (=> b!1409076 m!1298233))

(assert (=> b!1409076 m!1298233))

(declare-fun m!1298235 () Bool)

(assert (=> b!1409076 m!1298235))

(assert (=> b!1409071 m!1298227))

(declare-fun m!1298237 () Bool)

(assert (=> b!1409071 m!1298237))

(assert (=> b!1409071 m!1298227))

(declare-fun m!1298239 () Bool)

(assert (=> b!1409071 m!1298239))

(assert (=> b!1409071 m!1298237))

(assert (=> b!1409071 m!1298227))

(declare-fun m!1298241 () Bool)

(assert (=> b!1409071 m!1298241))

(declare-fun m!1298243 () Bool)

(assert (=> b!1409071 m!1298243))

(push 1)

(assert (not b!1409074))

(assert (not b!1409071))

(assert (not start!121188))

(assert (not b!1409076))

(assert (not b!1409075))

(assert (not b!1409070))

(assert (not b!1409069))

(assert (not b!1409072))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

