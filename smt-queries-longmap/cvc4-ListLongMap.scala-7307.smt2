; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93448 () Bool)

(assert start!93448)

(declare-fun b!1058497 () Bool)

(declare-fun res!707072 () Bool)

(declare-fun e!602195 () Bool)

(assert (=> b!1058497 (=> (not res!707072) (not e!602195))))

(declare-datatypes ((array!66751 0))(
  ( (array!66752 (arr!32094 (Array (_ BitVec 32) (_ BitVec 64))) (size!32630 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66751)

(declare-datatypes ((List!22406 0))(
  ( (Nil!22403) (Cons!22402 (h!23611 (_ BitVec 64)) (t!31713 List!22406)) )
))
(declare-fun arrayNoDuplicates!0 (array!66751 (_ BitVec 32) List!22406) Bool)

(assert (=> b!1058497 (= res!707072 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22403))))

(declare-fun b!1058498 () Bool)

(declare-fun res!707073 () Bool)

(assert (=> b!1058498 (=> (not res!707073) (not e!602195))))

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1058498 (= res!707073 (validKeyInArray!0 k!2747))))

(declare-fun b!1058499 () Bool)

(declare-fun e!602191 () Bool)

(assert (=> b!1058499 (= e!602195 e!602191)))

(declare-fun res!707077 () Bool)

(assert (=> b!1058499 (=> (not res!707077) (not e!602191))))

(declare-fun lt!466932 () array!66751)

(declare-fun arrayContainsKey!0 (array!66751 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1058499 (= res!707077 (arrayContainsKey!0 lt!466932 k!2747 #b00000000000000000000000000000000))))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1058499 (= lt!466932 (array!66752 (store (arr!32094 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32630 a!3488)))))

(declare-fun b!1058500 () Bool)

(declare-fun e!602197 () Bool)

(declare-fun e!602193 () Bool)

(assert (=> b!1058500 (= e!602197 (not e!602193))))

(declare-fun res!707070 () Bool)

(assert (=> b!1058500 (=> res!707070 e!602193)))

(declare-fun lt!466927 () (_ BitVec 32))

(assert (=> b!1058500 (= res!707070 (or (bvsgt lt!466927 i!1381) (bvsle i!1381 lt!466927)))))

(declare-fun e!602192 () Bool)

(assert (=> b!1058500 e!602192))

(declare-fun res!707074 () Bool)

(assert (=> b!1058500 (=> (not res!707074) (not e!602192))))

(assert (=> b!1058500 (= res!707074 (= (select (store (arr!32094 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!466927) k!2747))))

(declare-fun e!602194 () Bool)

(declare-fun b!1058501 () Bool)

(assert (=> b!1058501 (= e!602194 (arrayContainsKey!0 a!3488 k!2747 i!1381))))

(declare-fun b!1058502 () Bool)

(assert (=> b!1058502 (= e!602192 e!602194)))

(declare-fun res!707076 () Bool)

(assert (=> b!1058502 (=> res!707076 e!602194)))

(assert (=> b!1058502 (= res!707076 (or (bvsgt lt!466927 i!1381) (bvsle i!1381 lt!466927)))))

(declare-fun res!707078 () Bool)

(assert (=> start!93448 (=> (not res!707078) (not e!602195))))

(assert (=> start!93448 (= res!707078 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32630 a!3488)) (bvslt (size!32630 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!93448 e!602195))

(assert (=> start!93448 true))

(declare-fun array_inv!24874 (array!66751) Bool)

(assert (=> start!93448 (array_inv!24874 a!3488)))

(declare-fun b!1058496 () Bool)

(declare-fun res!707075 () Bool)

(assert (=> b!1058496 (=> (not res!707075) (not e!602195))))

(assert (=> b!1058496 (= res!707075 (= (select (arr!32094 a!3488) i!1381) k!2747))))

(declare-fun b!1058503 () Bool)

(assert (=> b!1058503 (= e!602191 e!602197)))

(declare-fun res!707071 () Bool)

(assert (=> b!1058503 (=> (not res!707071) (not e!602197))))

(assert (=> b!1058503 (= res!707071 (not (= lt!466927 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66751 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1058503 (= lt!466927 (arrayScanForKey!0 lt!466932 k!2747 #b00000000000000000000000000000000))))

(declare-fun b!1058504 () Bool)

(assert (=> b!1058504 (= e!602193 true)))

(assert (=> b!1058504 (not (= (select (arr!32094 a!3488) lt!466927) k!2747))))

(declare-datatypes ((Unit!34710 0))(
  ( (Unit!34711) )
))
(declare-fun lt!466928 () Unit!34710)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!66751 (_ BitVec 64) (_ BitVec 32) List!22406) Unit!34710)

(assert (=> b!1058504 (= lt!466928 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 a!3488 k!2747 lt!466927 Nil!22403))))

(declare-fun lt!466931 () (_ BitVec 32))

(assert (=> b!1058504 (arrayContainsKey!0 a!3488 k!2747 lt!466931)))

(declare-fun lt!466929 () Unit!34710)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66751 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34710)

(assert (=> b!1058504 (= lt!466929 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k!2747 i!1381 lt!466931))))

(assert (=> b!1058504 (= lt!466931 (bvadd #b00000000000000000000000000000001 lt!466927))))

(assert (=> b!1058504 (arrayNoDuplicates!0 a!3488 lt!466927 Nil!22403)))

(declare-fun lt!466930 () Unit!34710)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66751 (_ BitVec 32) (_ BitVec 32)) Unit!34710)

(assert (=> b!1058504 (= lt!466930 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 lt!466927))))

(assert (= (and start!93448 res!707078) b!1058497))

(assert (= (and b!1058497 res!707072) b!1058498))

(assert (= (and b!1058498 res!707073) b!1058496))

(assert (= (and b!1058496 res!707075) b!1058499))

(assert (= (and b!1058499 res!707077) b!1058503))

(assert (= (and b!1058503 res!707071) b!1058500))

(assert (= (and b!1058500 res!707074) b!1058502))

(assert (= (and b!1058502 (not res!707076)) b!1058501))

(assert (= (and b!1058500 (not res!707070)) b!1058504))

(declare-fun m!978137 () Bool)

(assert (=> b!1058503 m!978137))

(declare-fun m!978139 () Bool)

(assert (=> b!1058499 m!978139))

(declare-fun m!978141 () Bool)

(assert (=> b!1058499 m!978141))

(declare-fun m!978143 () Bool)

(assert (=> b!1058496 m!978143))

(declare-fun m!978145 () Bool)

(assert (=> b!1058501 m!978145))

(assert (=> b!1058500 m!978141))

(declare-fun m!978147 () Bool)

(assert (=> b!1058500 m!978147))

(declare-fun m!978149 () Bool)

(assert (=> start!93448 m!978149))

(declare-fun m!978151 () Bool)

(assert (=> b!1058497 m!978151))

(declare-fun m!978153 () Bool)

(assert (=> b!1058504 m!978153))

(declare-fun m!978155 () Bool)

(assert (=> b!1058504 m!978155))

(declare-fun m!978157 () Bool)

(assert (=> b!1058504 m!978157))

(declare-fun m!978159 () Bool)

(assert (=> b!1058504 m!978159))

(declare-fun m!978161 () Bool)

(assert (=> b!1058504 m!978161))

(declare-fun m!978163 () Bool)

(assert (=> b!1058504 m!978163))

(declare-fun m!978165 () Bool)

(assert (=> b!1058498 m!978165))

(push 1)

