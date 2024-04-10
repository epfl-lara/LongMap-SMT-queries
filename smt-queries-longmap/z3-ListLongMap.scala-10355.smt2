; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!121946 () Bool)

(assert start!121946)

(declare-datatypes ((SeekEntryResult!10958 0))(
  ( (MissingZero!10958 (index!46224 (_ BitVec 32))) (Found!10958 (index!46225 (_ BitVec 32))) (Intermediate!10958 (undefined!11770 Bool) (index!46226 (_ BitVec 32)) (x!127837 (_ BitVec 32))) (Undefined!10958) (MissingVacant!10958 (index!46227 (_ BitVec 32))) )
))
(declare-fun lt!623943 () SeekEntryResult!10958)

(declare-fun lt!623947 () (_ BitVec 32))

(declare-fun lt!623946 () SeekEntryResult!10958)

(declare-datatypes ((array!96632 0))(
  ( (array!96633 (arr!46647 (Array (_ BitVec 32) (_ BitVec 64))) (size!47197 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96632)

(declare-fun e!800930 () Bool)

(declare-fun b!1415154 () Bool)

(assert (=> b!1415154 (= e!800930 (or (bvslt (x!127837 lt!623946) #b00000000000000000000000000000000) (bvsgt (x!127837 lt!623946) #b01111111111111111111111111111110) (bvslt (x!127837 lt!623943) #b00000000000000000000000000000000) (bvsgt (x!127837 lt!623943) #b01111111111111111111111111111110) (bvslt lt!623947 #b00000000000000000000000000000000) (bvsge lt!623947 (size!47197 a!2901)) (bvslt (index!46226 lt!623946) #b00000000000000000000000000000000) (bvsge (index!46226 lt!623946) (size!47197 a!2901)) (and (bvsge (index!46226 lt!623943) #b00000000000000000000000000000000) (bvslt (index!46226 lt!623943) (size!47197 a!2901)))))))

(declare-fun e!800929 () Bool)

(assert (=> b!1415154 e!800929))

(declare-fun res!951203 () Bool)

(assert (=> b!1415154 (=> (not res!951203) (not e!800929))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1415154 (= res!951203 (and (not (undefined!11770 lt!623943)) (= (index!46226 lt!623943) i!1037) (bvslt (x!127837 lt!623943) (x!127837 lt!623946)) (= (select (store (arr!46647 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!46226 lt!623943)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((Unit!47890 0))(
  ( (Unit!47891) )
))
(declare-fun lt!623944 () Unit!47890)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96632 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47890)

(assert (=> b!1415154 (= lt!623944 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!623947 (x!127837 lt!623946) (index!46226 lt!623946) (x!127837 lt!623943) (index!46226 lt!623943) (undefined!11770 lt!623943) mask!2840))))

(declare-fun b!1415155 () Bool)

(declare-fun res!951202 () Bool)

(declare-fun e!800928 () Bool)

(assert (=> b!1415155 (=> (not res!951202) (not e!800928))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1415155 (= res!951202 (validKeyInArray!0 (select (arr!46647 a!2901) j!112)))))

(declare-fun b!1415156 () Bool)

(declare-fun e!800925 () Bool)

(assert (=> b!1415156 (= e!800928 (not e!800925))))

(declare-fun res!951199 () Bool)

(assert (=> b!1415156 (=> res!951199 e!800925)))

(get-info :version)

(assert (=> b!1415156 (= res!951199 (or (not ((_ is Intermediate!10958) lt!623946)) (undefined!11770 lt!623946)))))

(declare-fun e!800927 () Bool)

(assert (=> b!1415156 e!800927))

(declare-fun res!951197 () Bool)

(assert (=> b!1415156 (=> (not res!951197) (not e!800927))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96632 (_ BitVec 32)) Bool)

(assert (=> b!1415156 (= res!951197 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-fun lt!623948 () Unit!47890)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96632 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47890)

(assert (=> b!1415156 (= lt!623948 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96632 (_ BitVec 32)) SeekEntryResult!10958)

(assert (=> b!1415156 (= lt!623946 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!623947 (select (arr!46647 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1415156 (= lt!623947 (toIndex!0 (select (arr!46647 a!2901) j!112) mask!2840))))

(declare-fun res!951205 () Bool)

(assert (=> start!121946 (=> (not res!951205) (not e!800928))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121946 (= res!951205 (validMask!0 mask!2840))))

(assert (=> start!121946 e!800928))

(assert (=> start!121946 true))

(declare-fun array_inv!35675 (array!96632) Bool)

(assert (=> start!121946 (array_inv!35675 a!2901)))

(declare-fun b!1415157 () Bool)

(declare-fun res!951196 () Bool)

(assert (=> b!1415157 (=> (not res!951196) (not e!800928))))

(assert (=> b!1415157 (= res!951196 (and (= (size!47197 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47197 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47197 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1415158 () Bool)

(declare-fun res!951200 () Bool)

(assert (=> b!1415158 (=> (not res!951200) (not e!800928))))

(assert (=> b!1415158 (= res!951200 (validKeyInArray!0 (select (arr!46647 a!2901) i!1037)))))

(declare-fun b!1415159 () Bool)

(declare-fun res!951198 () Bool)

(assert (=> b!1415159 (=> (not res!951198) (not e!800928))))

(declare-datatypes ((List!33166 0))(
  ( (Nil!33163) (Cons!33162 (h!34449 (_ BitVec 64)) (t!47860 List!33166)) )
))
(declare-fun arrayNoDuplicates!0 (array!96632 (_ BitVec 32) List!33166) Bool)

(assert (=> b!1415159 (= res!951198 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33163))))

(declare-fun b!1415160 () Bool)

(assert (=> b!1415160 (= e!800925 e!800930)))

(declare-fun res!951201 () Bool)

(assert (=> b!1415160 (=> res!951201 e!800930)))

(assert (=> b!1415160 (= res!951201 (or (= lt!623946 lt!623943) (not ((_ is Intermediate!10958) lt!623943))))))

(declare-fun lt!623945 () (_ BitVec 64))

(declare-fun lt!623949 () array!96632)

(assert (=> b!1415160 (= lt!623943 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!623945 mask!2840) lt!623945 lt!623949 mask!2840))))

(assert (=> b!1415160 (= lt!623945 (select (store (arr!46647 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1415160 (= lt!623949 (array!96633 (store (arr!46647 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47197 a!2901)))))

(declare-fun b!1415161 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96632 (_ BitVec 32)) SeekEntryResult!10958)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96632 (_ BitVec 32)) SeekEntryResult!10958)

(assert (=> b!1415161 (= e!800929 (= (seekEntryOrOpen!0 lt!623945 lt!623949 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!127837 lt!623943) (index!46226 lt!623943) (index!46226 lt!623943) (select (arr!46647 a!2901) j!112) lt!623949 mask!2840)))))

(declare-fun b!1415162 () Bool)

(declare-fun res!951204 () Bool)

(assert (=> b!1415162 (=> (not res!951204) (not e!800928))))

(assert (=> b!1415162 (= res!951204 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1415163 () Bool)

(assert (=> b!1415163 (= e!800927 (= (seekEntryOrOpen!0 (select (arr!46647 a!2901) j!112) a!2901 mask!2840) (Found!10958 j!112)))))

(assert (= (and start!121946 res!951205) b!1415157))

(assert (= (and b!1415157 res!951196) b!1415158))

(assert (= (and b!1415158 res!951200) b!1415155))

(assert (= (and b!1415155 res!951202) b!1415162))

(assert (= (and b!1415162 res!951204) b!1415159))

(assert (= (and b!1415159 res!951198) b!1415156))

(assert (= (and b!1415156 res!951197) b!1415163))

(assert (= (and b!1415156 (not res!951199)) b!1415160))

(assert (= (and b!1415160 (not res!951201)) b!1415154))

(assert (= (and b!1415154 res!951203) b!1415161))

(declare-fun m!1305321 () Bool)

(assert (=> b!1415154 m!1305321))

(declare-fun m!1305323 () Bool)

(assert (=> b!1415154 m!1305323))

(declare-fun m!1305325 () Bool)

(assert (=> b!1415154 m!1305325))

(declare-fun m!1305327 () Bool)

(assert (=> b!1415163 m!1305327))

(assert (=> b!1415163 m!1305327))

(declare-fun m!1305329 () Bool)

(assert (=> b!1415163 m!1305329))

(declare-fun m!1305331 () Bool)

(assert (=> b!1415161 m!1305331))

(assert (=> b!1415161 m!1305327))

(assert (=> b!1415161 m!1305327))

(declare-fun m!1305333 () Bool)

(assert (=> b!1415161 m!1305333))

(declare-fun m!1305335 () Bool)

(assert (=> b!1415159 m!1305335))

(declare-fun m!1305337 () Bool)

(assert (=> start!121946 m!1305337))

(declare-fun m!1305339 () Bool)

(assert (=> start!121946 m!1305339))

(assert (=> b!1415156 m!1305327))

(declare-fun m!1305341 () Bool)

(assert (=> b!1415156 m!1305341))

(assert (=> b!1415156 m!1305327))

(declare-fun m!1305343 () Bool)

(assert (=> b!1415156 m!1305343))

(assert (=> b!1415156 m!1305327))

(declare-fun m!1305345 () Bool)

(assert (=> b!1415156 m!1305345))

(declare-fun m!1305347 () Bool)

(assert (=> b!1415156 m!1305347))

(assert (=> b!1415155 m!1305327))

(assert (=> b!1415155 m!1305327))

(declare-fun m!1305349 () Bool)

(assert (=> b!1415155 m!1305349))

(declare-fun m!1305351 () Bool)

(assert (=> b!1415160 m!1305351))

(assert (=> b!1415160 m!1305351))

(declare-fun m!1305353 () Bool)

(assert (=> b!1415160 m!1305353))

(assert (=> b!1415160 m!1305321))

(declare-fun m!1305355 () Bool)

(assert (=> b!1415160 m!1305355))

(declare-fun m!1305357 () Bool)

(assert (=> b!1415158 m!1305357))

(assert (=> b!1415158 m!1305357))

(declare-fun m!1305359 () Bool)

(assert (=> b!1415158 m!1305359))

(declare-fun m!1305361 () Bool)

(assert (=> b!1415162 m!1305361))

(check-sat (not b!1415159) (not b!1415160) (not b!1415156) (not b!1415161) (not b!1415154) (not start!121946) (not b!1415162) (not b!1415155) (not b!1415163) (not b!1415158))
(check-sat)
