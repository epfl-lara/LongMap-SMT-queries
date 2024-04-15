; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!121430 () Bool)

(assert start!121430)

(declare-fun b!1410798 () Bool)

(declare-fun res!948080 () Bool)

(declare-fun e!798377 () Bool)

(assert (=> b!1410798 (=> (not res!948080) (not e!798377))))

(declare-datatypes ((array!96384 0))(
  ( (array!96385 (arr!46531 (Array (_ BitVec 32) (_ BitVec 64))) (size!47083 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96384)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96384 (_ BitVec 32)) Bool)

(assert (=> b!1410798 (= res!948080 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1410799 () Bool)

(declare-fun e!798372 () Bool)

(declare-fun e!798373 () Bool)

(assert (=> b!1410799 (= e!798372 e!798373)))

(declare-fun res!948083 () Bool)

(assert (=> b!1410799 (=> res!948083 e!798373)))

(declare-datatypes ((SeekEntryResult!10868 0))(
  ( (MissingZero!10868 (index!45849 (_ BitVec 32))) (Found!10868 (index!45850 (_ BitVec 32))) (Intermediate!10868 (undefined!11680 Bool) (index!45851 (_ BitVec 32)) (x!127444 (_ BitVec 32))) (Undefined!10868) (MissingVacant!10868 (index!45852 (_ BitVec 32))) )
))
(declare-fun lt!621189 () SeekEntryResult!10868)

(declare-fun lt!621188 () (_ BitVec 32))

(declare-fun lt!621192 () SeekEntryResult!10868)

(get-info :version)

(assert (=> b!1410799 (= res!948083 (or (= lt!621189 lt!621192) (not ((_ is Intermediate!10868) lt!621192)) (bvslt (x!127444 lt!621189) #b00000000000000000000000000000000) (bvsgt (x!127444 lt!621189) #b01111111111111111111111111111110) (bvslt lt!621188 #b00000000000000000000000000000000) (bvsge lt!621188 (size!47083 a!2901)) (bvslt (index!45851 lt!621189) #b00000000000000000000000000000000) (bvsge (index!45851 lt!621189) (size!47083 a!2901)) (not (= lt!621189 (Intermediate!10868 false (index!45851 lt!621189) (x!127444 lt!621189))))))))

(declare-fun lt!621190 () (_ BitVec 64))

(declare-fun lt!621194 () array!96384)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96384 (_ BitVec 32)) SeekEntryResult!10868)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1410799 (= lt!621192 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!621190 mask!2840) lt!621190 lt!621194 mask!2840))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1410799 (= lt!621190 (select (store (arr!46531 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1410799 (= lt!621194 (array!96385 (store (arr!46531 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47083 a!2901)))))

(declare-fun b!1410800 () Bool)

(assert (=> b!1410800 (= e!798377 (not e!798372))))

(declare-fun res!948076 () Bool)

(assert (=> b!1410800 (=> res!948076 e!798372)))

(assert (=> b!1410800 (= res!948076 (or (not ((_ is Intermediate!10868) lt!621189)) (undefined!11680 lt!621189)))))

(declare-fun e!798375 () Bool)

(assert (=> b!1410800 e!798375))

(declare-fun res!948084 () Bool)

(assert (=> b!1410800 (=> (not res!948084) (not e!798375))))

(assert (=> b!1410800 (= res!948084 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47553 0))(
  ( (Unit!47554) )
))
(declare-fun lt!621191 () Unit!47553)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96384 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47553)

(assert (=> b!1410800 (= lt!621191 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1410800 (= lt!621189 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!621188 (select (arr!46531 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1410800 (= lt!621188 (toIndex!0 (select (arr!46531 a!2901) j!112) mask!2840))))

(declare-fun b!1410801 () Bool)

(declare-fun res!948081 () Bool)

(assert (=> b!1410801 (=> (not res!948081) (not e!798377))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1410801 (= res!948081 (validKeyInArray!0 (select (arr!46531 a!2901) j!112)))))

(declare-fun res!948079 () Bool)

(assert (=> start!121430 (=> (not res!948079) (not e!798377))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121430 (= res!948079 (validMask!0 mask!2840))))

(assert (=> start!121430 e!798377))

(assert (=> start!121430 true))

(declare-fun array_inv!35764 (array!96384) Bool)

(assert (=> start!121430 (array_inv!35764 a!2901)))

(declare-fun b!1410802 () Bool)

(declare-fun res!948077 () Bool)

(assert (=> b!1410802 (=> (not res!948077) (not e!798377))))

(assert (=> b!1410802 (= res!948077 (validKeyInArray!0 (select (arr!46531 a!2901) i!1037)))))

(declare-fun e!798374 () Bool)

(declare-fun lt!621193 () SeekEntryResult!10868)

(declare-fun b!1410803 () Bool)

(assert (=> b!1410803 (= e!798374 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!621188 lt!621190 lt!621194 mask!2840) lt!621193))))

(declare-fun b!1410804 () Bool)

(assert (=> b!1410804 (= e!798373 e!798374)))

(declare-fun res!948085 () Bool)

(assert (=> b!1410804 (=> res!948085 e!798374)))

(assert (=> b!1410804 (= res!948085 (not (= lt!621192 lt!621193)))))

(assert (=> b!1410804 (= lt!621193 (Intermediate!10868 (undefined!11680 lt!621192) (index!45851 lt!621192) (x!127444 lt!621192)))))

(declare-fun b!1410805 () Bool)

(declare-fun res!948078 () Bool)

(assert (=> b!1410805 (=> (not res!948078) (not e!798377))))

(declare-datatypes ((List!33128 0))(
  ( (Nil!33125) (Cons!33124 (h!34396 (_ BitVec 64)) (t!47814 List!33128)) )
))
(declare-fun arrayNoDuplicates!0 (array!96384 (_ BitVec 32) List!33128) Bool)

(assert (=> b!1410805 (= res!948078 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33125))))

(declare-fun b!1410806 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96384 (_ BitVec 32)) SeekEntryResult!10868)

(assert (=> b!1410806 (= e!798375 (= (seekEntryOrOpen!0 (select (arr!46531 a!2901) j!112) a!2901 mask!2840) (Found!10868 j!112)))))

(declare-fun b!1410807 () Bool)

(declare-fun res!948082 () Bool)

(assert (=> b!1410807 (=> (not res!948082) (not e!798377))))

(assert (=> b!1410807 (= res!948082 (and (= (size!47083 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47083 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47083 a!2901)) (not (= i!1037 j!112))))))

(assert (= (and start!121430 res!948079) b!1410807))

(assert (= (and b!1410807 res!948082) b!1410802))

(assert (= (and b!1410802 res!948077) b!1410801))

(assert (= (and b!1410801 res!948081) b!1410798))

(assert (= (and b!1410798 res!948080) b!1410805))

(assert (= (and b!1410805 res!948078) b!1410800))

(assert (= (and b!1410800 res!948084) b!1410806))

(assert (= (and b!1410800 (not res!948076)) b!1410799))

(assert (= (and b!1410799 (not res!948083)) b!1410804))

(assert (= (and b!1410804 (not res!948085)) b!1410803))

(declare-fun m!1300033 () Bool)

(assert (=> b!1410800 m!1300033))

(declare-fun m!1300035 () Bool)

(assert (=> b!1410800 m!1300035))

(assert (=> b!1410800 m!1300033))

(declare-fun m!1300037 () Bool)

(assert (=> b!1410800 m!1300037))

(declare-fun m!1300039 () Bool)

(assert (=> b!1410800 m!1300039))

(assert (=> b!1410800 m!1300033))

(declare-fun m!1300041 () Bool)

(assert (=> b!1410800 m!1300041))

(assert (=> b!1410806 m!1300033))

(assert (=> b!1410806 m!1300033))

(declare-fun m!1300043 () Bool)

(assert (=> b!1410806 m!1300043))

(declare-fun m!1300045 () Bool)

(assert (=> b!1410805 m!1300045))

(declare-fun m!1300047 () Bool)

(assert (=> b!1410798 m!1300047))

(declare-fun m!1300049 () Bool)

(assert (=> start!121430 m!1300049))

(declare-fun m!1300051 () Bool)

(assert (=> start!121430 m!1300051))

(declare-fun m!1300053 () Bool)

(assert (=> b!1410799 m!1300053))

(assert (=> b!1410799 m!1300053))

(declare-fun m!1300055 () Bool)

(assert (=> b!1410799 m!1300055))

(declare-fun m!1300057 () Bool)

(assert (=> b!1410799 m!1300057))

(declare-fun m!1300059 () Bool)

(assert (=> b!1410799 m!1300059))

(declare-fun m!1300061 () Bool)

(assert (=> b!1410803 m!1300061))

(assert (=> b!1410801 m!1300033))

(assert (=> b!1410801 m!1300033))

(declare-fun m!1300063 () Bool)

(assert (=> b!1410801 m!1300063))

(declare-fun m!1300065 () Bool)

(assert (=> b!1410802 m!1300065))

(assert (=> b!1410802 m!1300065))

(declare-fun m!1300067 () Bool)

(assert (=> b!1410802 m!1300067))

(check-sat (not b!1410800) (not b!1410803) (not b!1410799) (not b!1410801) (not b!1410802) (not b!1410806) (not b!1410798) (not b!1410805) (not start!121430))
(check-sat)
