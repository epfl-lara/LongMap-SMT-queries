; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!121100 () Bool)

(assert start!121100)

(declare-fun b!1408006 () Bool)

(declare-fun e!796901 () Bool)

(assert (=> b!1408006 (= e!796901 true)))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96254 0))(
  ( (array!96255 (arr!46470 (Array (_ BitVec 32) (_ BitVec 64))) (size!47020 (_ BitVec 32))) )
))
(declare-fun lt!620043 () array!96254)

(declare-datatypes ((SeekEntryResult!10781 0))(
  ( (MissingZero!10781 (index!45501 (_ BitVec 32))) (Found!10781 (index!45502 (_ BitVec 32))) (Intermediate!10781 (undefined!11593 Bool) (index!45503 (_ BitVec 32)) (x!127110 (_ BitVec 32))) (Undefined!10781) (MissingVacant!10781 (index!45504 (_ BitVec 32))) )
))
(declare-fun lt!620042 () SeekEntryResult!10781)

(declare-fun lt!620041 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96254 (_ BitVec 32)) SeekEntryResult!10781)

(assert (=> b!1408006 (= lt!620042 (seekEntryOrOpen!0 lt!620041 lt!620043 mask!2840))))

(declare-fun a!2901 () array!96254)

(declare-fun lt!620044 () (_ BitVec 32))

(declare-fun lt!620040 () SeekEntryResult!10781)

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((Unit!47536 0))(
  ( (Unit!47537) )
))
(declare-fun lt!620046 () Unit!47536)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 (array!96254 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47536)

(assert (=> b!1408006 (= lt!620046 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!620044 (x!127110 lt!620040) (index!45503 lt!620040) mask!2840))))

(declare-fun b!1408007 () Bool)

(declare-fun res!945730 () Bool)

(declare-fun e!796900 () Bool)

(assert (=> b!1408007 (=> (not res!945730) (not e!796900))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1408007 (= res!945730 (validKeyInArray!0 (select (arr!46470 a!2901) i!1037)))))

(declare-fun res!945732 () Bool)

(assert (=> start!121100 (=> (not res!945732) (not e!796900))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121100 (= res!945732 (validMask!0 mask!2840))))

(assert (=> start!121100 e!796900))

(assert (=> start!121100 true))

(declare-fun array_inv!35498 (array!96254) Bool)

(assert (=> start!121100 (array_inv!35498 a!2901)))

(declare-fun b!1408008 () Bool)

(declare-fun res!945731 () Bool)

(assert (=> b!1408008 (=> (not res!945731) (not e!796900))))

(assert (=> b!1408008 (= res!945731 (and (= (size!47020 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47020 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47020 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1408009 () Bool)

(declare-fun res!945734 () Bool)

(assert (=> b!1408009 (=> (not res!945734) (not e!796900))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96254 (_ BitVec 32)) Bool)

(assert (=> b!1408009 (= res!945734 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1408010 () Bool)

(declare-fun e!796898 () Bool)

(assert (=> b!1408010 (= e!796900 (not e!796898))))

(declare-fun res!945728 () Bool)

(assert (=> b!1408010 (=> res!945728 e!796898)))

(get-info :version)

(assert (=> b!1408010 (= res!945728 (or (not ((_ is Intermediate!10781) lt!620040)) (undefined!11593 lt!620040)))))

(assert (=> b!1408010 (= lt!620042 (Found!10781 j!112))))

(assert (=> b!1408010 (= lt!620042 (seekEntryOrOpen!0 (select (arr!46470 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1408010 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!620045 () Unit!47536)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96254 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47536)

(assert (=> b!1408010 (= lt!620045 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96254 (_ BitVec 32)) SeekEntryResult!10781)

(assert (=> b!1408010 (= lt!620040 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!620044 (select (arr!46470 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1408010 (= lt!620044 (toIndex!0 (select (arr!46470 a!2901) j!112) mask!2840))))

(declare-fun b!1408011 () Bool)

(declare-fun res!945733 () Bool)

(assert (=> b!1408011 (=> res!945733 e!796901)))

(assert (=> b!1408011 (= res!945733 (or (bvslt (x!127110 lt!620040) #b00000000000000000000000000000000) (bvsgt (x!127110 lt!620040) #b01111111111111111111111111111110) (bvslt lt!620044 #b00000000000000000000000000000000) (bvsge lt!620044 (size!47020 a!2901)) (bvslt (index!45503 lt!620040) #b00000000000000000000000000000000) (bvsge (index!45503 lt!620040) (size!47020 a!2901)) (not (= lt!620040 (Intermediate!10781 false (index!45503 lt!620040) (x!127110 lt!620040))))))))

(declare-fun b!1408012 () Bool)

(declare-fun res!945736 () Bool)

(assert (=> b!1408012 (=> (not res!945736) (not e!796900))))

(declare-datatypes ((List!32989 0))(
  ( (Nil!32986) (Cons!32985 (h!34248 (_ BitVec 64)) (t!47683 List!32989)) )
))
(declare-fun arrayNoDuplicates!0 (array!96254 (_ BitVec 32) List!32989) Bool)

(assert (=> b!1408012 (= res!945736 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32986))))

(declare-fun b!1408013 () Bool)

(declare-fun res!945729 () Bool)

(assert (=> b!1408013 (=> (not res!945729) (not e!796900))))

(assert (=> b!1408013 (= res!945729 (validKeyInArray!0 (select (arr!46470 a!2901) j!112)))))

(declare-fun b!1408014 () Bool)

(assert (=> b!1408014 (= e!796898 e!796901)))

(declare-fun res!945735 () Bool)

(assert (=> b!1408014 (=> res!945735 e!796901)))

(assert (=> b!1408014 (= res!945735 (not (= lt!620040 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!620041 mask!2840) lt!620041 lt!620043 mask!2840))))))

(assert (=> b!1408014 (= lt!620041 (select (store (arr!46470 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1408014 (= lt!620043 (array!96255 (store (arr!46470 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47020 a!2901)))))

(assert (= (and start!121100 res!945732) b!1408008))

(assert (= (and b!1408008 res!945731) b!1408007))

(assert (= (and b!1408007 res!945730) b!1408013))

(assert (= (and b!1408013 res!945729) b!1408009))

(assert (= (and b!1408009 res!945734) b!1408012))

(assert (= (and b!1408012 res!945736) b!1408010))

(assert (= (and b!1408010 (not res!945728)) b!1408014))

(assert (= (and b!1408014 (not res!945735)) b!1408011))

(assert (= (and b!1408011 (not res!945733)) b!1408006))

(declare-fun m!1297127 () Bool)

(assert (=> start!121100 m!1297127))

(declare-fun m!1297129 () Bool)

(assert (=> start!121100 m!1297129))

(declare-fun m!1297131 () Bool)

(assert (=> b!1408010 m!1297131))

(declare-fun m!1297133 () Bool)

(assert (=> b!1408010 m!1297133))

(assert (=> b!1408010 m!1297131))

(assert (=> b!1408010 m!1297131))

(declare-fun m!1297135 () Bool)

(assert (=> b!1408010 m!1297135))

(declare-fun m!1297137 () Bool)

(assert (=> b!1408010 m!1297137))

(assert (=> b!1408010 m!1297131))

(declare-fun m!1297139 () Bool)

(assert (=> b!1408010 m!1297139))

(declare-fun m!1297141 () Bool)

(assert (=> b!1408010 m!1297141))

(assert (=> b!1408013 m!1297131))

(assert (=> b!1408013 m!1297131))

(declare-fun m!1297143 () Bool)

(assert (=> b!1408013 m!1297143))

(declare-fun m!1297145 () Bool)

(assert (=> b!1408012 m!1297145))

(declare-fun m!1297147 () Bool)

(assert (=> b!1408007 m!1297147))

(assert (=> b!1408007 m!1297147))

(declare-fun m!1297149 () Bool)

(assert (=> b!1408007 m!1297149))

(declare-fun m!1297151 () Bool)

(assert (=> b!1408006 m!1297151))

(declare-fun m!1297153 () Bool)

(assert (=> b!1408006 m!1297153))

(declare-fun m!1297155 () Bool)

(assert (=> b!1408009 m!1297155))

(declare-fun m!1297157 () Bool)

(assert (=> b!1408014 m!1297157))

(assert (=> b!1408014 m!1297157))

(declare-fun m!1297159 () Bool)

(assert (=> b!1408014 m!1297159))

(declare-fun m!1297161 () Bool)

(assert (=> b!1408014 m!1297161))

(declare-fun m!1297163 () Bool)

(assert (=> b!1408014 m!1297163))

(check-sat (not b!1408013) (not b!1408007) (not b!1408014) (not b!1408006) (not start!121100) (not b!1408009) (not b!1408010) (not b!1408012))
(check-sat)
