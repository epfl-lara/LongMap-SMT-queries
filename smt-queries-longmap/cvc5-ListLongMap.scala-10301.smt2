; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121128 () Bool)

(assert start!121128)

(declare-fun b!1408349 () Bool)

(declare-fun res!946125 () Bool)

(declare-fun e!797053 () Bool)

(assert (=> b!1408349 (=> (not res!946125) (not e!797053))))

(declare-datatypes ((array!96235 0))(
  ( (array!96236 (arr!46461 (Array (_ BitVec 32) (_ BitVec 64))) (size!47013 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96235)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1408349 (= res!946125 (validKeyInArray!0 (select (arr!46461 a!2901) i!1037)))))

(declare-fun b!1408350 () Bool)

(declare-fun e!797054 () Bool)

(assert (=> b!1408350 (= e!797054 true)))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10798 0))(
  ( (MissingZero!10798 (index!45569 (_ BitVec 32))) (Found!10798 (index!45570 (_ BitVec 32))) (Intermediate!10798 (undefined!11610 Bool) (index!45571 (_ BitVec 32)) (x!127164 (_ BitVec 32))) (Undefined!10798) (MissingVacant!10798 (index!45572 (_ BitVec 32))) )
))
(declare-fun lt!620154 () SeekEntryResult!10798)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96235 (_ BitVec 32)) SeekEntryResult!10798)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1408350 (= lt!620154 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46461 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46461 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96236 (store (arr!46461 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47013 a!2901)) mask!2840))))

(declare-fun b!1408351 () Bool)

(declare-fun res!946122 () Bool)

(assert (=> b!1408351 (=> (not res!946122) (not e!797053))))

(assert (=> b!1408351 (= res!946122 (validKeyInArray!0 (select (arr!46461 a!2901) j!112)))))

(declare-fun e!797052 () Bool)

(declare-fun b!1408352 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96235 (_ BitVec 32)) SeekEntryResult!10798)

(assert (=> b!1408352 (= e!797052 (= (seekEntryOrOpen!0 (select (arr!46461 a!2901) j!112) a!2901 mask!2840) (Found!10798 j!112)))))

(declare-fun b!1408353 () Bool)

(assert (=> b!1408353 (= e!797053 (not e!797054))))

(declare-fun res!946123 () Bool)

(assert (=> b!1408353 (=> res!946123 e!797054)))

(declare-fun lt!620155 () SeekEntryResult!10798)

(assert (=> b!1408353 (= res!946123 (or (not (is-Intermediate!10798 lt!620155)) (undefined!11610 lt!620155)))))

(assert (=> b!1408353 e!797052))

(declare-fun res!946124 () Bool)

(assert (=> b!1408353 (=> (not res!946124) (not e!797052))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96235 (_ BitVec 32)) Bool)

(assert (=> b!1408353 (= res!946124 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47413 0))(
  ( (Unit!47414) )
))
(declare-fun lt!620156 () Unit!47413)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96235 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47413)

(assert (=> b!1408353 (= lt!620156 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1408353 (= lt!620155 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46461 a!2901) j!112) mask!2840) (select (arr!46461 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1408354 () Bool)

(declare-fun res!946128 () Bool)

(assert (=> b!1408354 (=> (not res!946128) (not e!797053))))

(assert (=> b!1408354 (= res!946128 (and (= (size!47013 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47013 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47013 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1408355 () Bool)

(declare-fun res!946129 () Bool)

(assert (=> b!1408355 (=> (not res!946129) (not e!797053))))

(assert (=> b!1408355 (= res!946129 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1408356 () Bool)

(declare-fun res!946127 () Bool)

(assert (=> b!1408356 (=> (not res!946127) (not e!797053))))

(declare-datatypes ((List!33058 0))(
  ( (Nil!33055) (Cons!33054 (h!34317 (_ BitVec 64)) (t!47744 List!33058)) )
))
(declare-fun arrayNoDuplicates!0 (array!96235 (_ BitVec 32) List!33058) Bool)

(assert (=> b!1408356 (= res!946127 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33055))))

(declare-fun res!946126 () Bool)

(assert (=> start!121128 (=> (not res!946126) (not e!797053))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121128 (= res!946126 (validMask!0 mask!2840))))

(assert (=> start!121128 e!797053))

(assert (=> start!121128 true))

(declare-fun array_inv!35694 (array!96235) Bool)

(assert (=> start!121128 (array_inv!35694 a!2901)))

(assert (= (and start!121128 res!946126) b!1408354))

(assert (= (and b!1408354 res!946128) b!1408349))

(assert (= (and b!1408349 res!946125) b!1408351))

(assert (= (and b!1408351 res!946122) b!1408355))

(assert (= (and b!1408355 res!946129) b!1408356))

(assert (= (and b!1408356 res!946127) b!1408353))

(assert (= (and b!1408353 res!946124) b!1408352))

(assert (= (and b!1408353 (not res!946123)) b!1408350))

(declare-fun m!1297191 () Bool)

(assert (=> b!1408356 m!1297191))

(declare-fun m!1297193 () Bool)

(assert (=> b!1408351 m!1297193))

(assert (=> b!1408351 m!1297193))

(declare-fun m!1297195 () Bool)

(assert (=> b!1408351 m!1297195))

(declare-fun m!1297197 () Bool)

(assert (=> start!121128 m!1297197))

(declare-fun m!1297199 () Bool)

(assert (=> start!121128 m!1297199))

(declare-fun m!1297201 () Bool)

(assert (=> b!1408355 m!1297201))

(declare-fun m!1297203 () Bool)

(assert (=> b!1408350 m!1297203))

(declare-fun m!1297205 () Bool)

(assert (=> b!1408350 m!1297205))

(assert (=> b!1408350 m!1297205))

(declare-fun m!1297207 () Bool)

(assert (=> b!1408350 m!1297207))

(assert (=> b!1408350 m!1297207))

(assert (=> b!1408350 m!1297205))

(declare-fun m!1297209 () Bool)

(assert (=> b!1408350 m!1297209))

(declare-fun m!1297211 () Bool)

(assert (=> b!1408349 m!1297211))

(assert (=> b!1408349 m!1297211))

(declare-fun m!1297213 () Bool)

(assert (=> b!1408349 m!1297213))

(assert (=> b!1408352 m!1297193))

(assert (=> b!1408352 m!1297193))

(declare-fun m!1297215 () Bool)

(assert (=> b!1408352 m!1297215))

(assert (=> b!1408353 m!1297193))

(declare-fun m!1297217 () Bool)

(assert (=> b!1408353 m!1297217))

(assert (=> b!1408353 m!1297193))

(declare-fun m!1297219 () Bool)

(assert (=> b!1408353 m!1297219))

(assert (=> b!1408353 m!1297217))

(assert (=> b!1408353 m!1297193))

(declare-fun m!1297221 () Bool)

(assert (=> b!1408353 m!1297221))

(declare-fun m!1297223 () Bool)

(assert (=> b!1408353 m!1297223))

(push 1)

(assert (not b!1408349))

(assert (not b!1408352))

(assert (not b!1408356))

(assert (not start!121128))

(assert (not b!1408350))

(assert (not b!1408355))

(assert (not b!1408351))

(assert (not b!1408353))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

