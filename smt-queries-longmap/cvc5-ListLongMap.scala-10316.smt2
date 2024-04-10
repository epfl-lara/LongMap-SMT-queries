; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121218 () Bool)

(assert start!121218)

(declare-fun b!1409462 () Bool)

(declare-fun e!797608 () Bool)

(declare-fun e!797606 () Bool)

(assert (=> b!1409462 (= e!797608 (not e!797606))))

(declare-fun res!947188 () Bool)

(assert (=> b!1409462 (=> res!947188 e!797606)))

(declare-datatypes ((SeekEntryResult!10840 0))(
  ( (MissingZero!10840 (index!45737 (_ BitVec 32))) (Found!10840 (index!45738 (_ BitVec 32))) (Intermediate!10840 (undefined!11652 Bool) (index!45739 (_ BitVec 32)) (x!127329 (_ BitVec 32))) (Undefined!10840) (MissingVacant!10840 (index!45740 (_ BitVec 32))) )
))
(declare-fun lt!620733 () SeekEntryResult!10840)

(assert (=> b!1409462 (= res!947188 (or (not (is-Intermediate!10840 lt!620733)) (undefined!11652 lt!620733)))))

(declare-fun e!797609 () Bool)

(assert (=> b!1409462 e!797609))

(declare-fun res!947189 () Bool)

(assert (=> b!1409462 (=> (not res!947189) (not e!797609))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96372 0))(
  ( (array!96373 (arr!46529 (Array (_ BitVec 32) (_ BitVec 64))) (size!47079 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96372)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96372 (_ BitVec 32)) Bool)

(assert (=> b!1409462 (= res!947189 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47654 0))(
  ( (Unit!47655) )
))
(declare-fun lt!620732 () Unit!47654)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96372 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47654)

(assert (=> b!1409462 (= lt!620732 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96372 (_ BitVec 32)) SeekEntryResult!10840)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1409462 (= lt!620733 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46529 a!2901) j!112) mask!2840) (select (arr!46529 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1409463 () Bool)

(assert (=> b!1409463 (= e!797606 true)))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun lt!620731 () SeekEntryResult!10840)

(assert (=> b!1409463 (= lt!620731 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46529 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46529 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96373 (store (arr!46529 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47079 a!2901)) mask!2840))))

(declare-fun b!1409464 () Bool)

(declare-fun res!947191 () Bool)

(assert (=> b!1409464 (=> (not res!947191) (not e!797608))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1409464 (= res!947191 (validKeyInArray!0 (select (arr!46529 a!2901) j!112)))))

(declare-fun b!1409465 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96372 (_ BitVec 32)) SeekEntryResult!10840)

(assert (=> b!1409465 (= e!797609 (= (seekEntryOrOpen!0 (select (arr!46529 a!2901) j!112) a!2901 mask!2840) (Found!10840 j!112)))))

(declare-fun b!1409466 () Bool)

(declare-fun res!947184 () Bool)

(assert (=> b!1409466 (=> (not res!947184) (not e!797608))))

(assert (=> b!1409466 (= res!947184 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun res!947185 () Bool)

(assert (=> start!121218 (=> (not res!947185) (not e!797608))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121218 (= res!947185 (validMask!0 mask!2840))))

(assert (=> start!121218 e!797608))

(assert (=> start!121218 true))

(declare-fun array_inv!35557 (array!96372) Bool)

(assert (=> start!121218 (array_inv!35557 a!2901)))

(declare-fun b!1409467 () Bool)

(declare-fun res!947190 () Bool)

(assert (=> b!1409467 (=> (not res!947190) (not e!797608))))

(assert (=> b!1409467 (= res!947190 (and (= (size!47079 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47079 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47079 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1409468 () Bool)

(declare-fun res!947187 () Bool)

(assert (=> b!1409468 (=> (not res!947187) (not e!797608))))

(assert (=> b!1409468 (= res!947187 (validKeyInArray!0 (select (arr!46529 a!2901) i!1037)))))

(declare-fun b!1409469 () Bool)

(declare-fun res!947186 () Bool)

(assert (=> b!1409469 (=> (not res!947186) (not e!797608))))

(declare-datatypes ((List!33048 0))(
  ( (Nil!33045) (Cons!33044 (h!34307 (_ BitVec 64)) (t!47742 List!33048)) )
))
(declare-fun arrayNoDuplicates!0 (array!96372 (_ BitVec 32) List!33048) Bool)

(assert (=> b!1409469 (= res!947186 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33045))))

(assert (= (and start!121218 res!947185) b!1409467))

(assert (= (and b!1409467 res!947190) b!1409468))

(assert (= (and b!1409468 res!947187) b!1409464))

(assert (= (and b!1409464 res!947191) b!1409466))

(assert (= (and b!1409466 res!947184) b!1409469))

(assert (= (and b!1409469 res!947186) b!1409462))

(assert (= (and b!1409462 res!947189) b!1409465))

(assert (= (and b!1409462 (not res!947188)) b!1409463))

(declare-fun m!1299189 () Bool)

(assert (=> start!121218 m!1299189))

(declare-fun m!1299191 () Bool)

(assert (=> start!121218 m!1299191))

(declare-fun m!1299193 () Bool)

(assert (=> b!1409469 m!1299193))

(declare-fun m!1299195 () Bool)

(assert (=> b!1409464 m!1299195))

(assert (=> b!1409464 m!1299195))

(declare-fun m!1299197 () Bool)

(assert (=> b!1409464 m!1299197))

(assert (=> b!1409462 m!1299195))

(declare-fun m!1299199 () Bool)

(assert (=> b!1409462 m!1299199))

(assert (=> b!1409462 m!1299195))

(declare-fun m!1299201 () Bool)

(assert (=> b!1409462 m!1299201))

(assert (=> b!1409462 m!1299199))

(assert (=> b!1409462 m!1299195))

(declare-fun m!1299203 () Bool)

(assert (=> b!1409462 m!1299203))

(declare-fun m!1299205 () Bool)

(assert (=> b!1409462 m!1299205))

(declare-fun m!1299207 () Bool)

(assert (=> b!1409466 m!1299207))

(declare-fun m!1299209 () Bool)

(assert (=> b!1409468 m!1299209))

(assert (=> b!1409468 m!1299209))

(declare-fun m!1299211 () Bool)

(assert (=> b!1409468 m!1299211))

(assert (=> b!1409465 m!1299195))

(assert (=> b!1409465 m!1299195))

(declare-fun m!1299213 () Bool)

(assert (=> b!1409465 m!1299213))

(declare-fun m!1299215 () Bool)

(assert (=> b!1409463 m!1299215))

(declare-fun m!1299217 () Bool)

(assert (=> b!1409463 m!1299217))

(assert (=> b!1409463 m!1299217))

(declare-fun m!1299219 () Bool)

(assert (=> b!1409463 m!1299219))

(assert (=> b!1409463 m!1299219))

(assert (=> b!1409463 m!1299217))

(declare-fun m!1299221 () Bool)

(assert (=> b!1409463 m!1299221))

(push 1)

(assert (not b!1409466))

(assert (not b!1409462))

(assert (not b!1409463))

(assert (not b!1409464))

(assert (not b!1409468))

(assert (not b!1409469))

(assert (not b!1409465))

(assert (not start!121218))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

