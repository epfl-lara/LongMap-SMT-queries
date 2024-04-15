; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!119354 () Bool)

(assert start!119354)

(declare-fun b!1391376 () Bool)

(declare-fun res!931298 () Bool)

(declare-fun e!787909 () Bool)

(assert (=> b!1391376 (=> (not res!931298) (not e!787909))))

(declare-datatypes ((array!95142 0))(
  ( (array!95143 (arr!45934 (Array (_ BitVec 32) (_ BitVec 64))) (size!46486 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95142)

(declare-datatypes ((List!32531 0))(
  ( (Nil!32528) (Cons!32527 (h!33751 (_ BitVec 64)) (t!47217 List!32531)) )
))
(declare-fun arrayNoDuplicates!0 (array!95142 (_ BitVec 32) List!32531) Bool)

(assert (=> b!1391376 (= res!931298 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32528))))

(declare-fun b!1391377 () Bool)

(declare-fun res!931299 () Bool)

(assert (=> b!1391377 (=> (not res!931299) (not e!787909))))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1391377 (= res!931299 (validKeyInArray!0 (select (arr!45934 a!2901) j!112)))))

(declare-fun b!1391378 () Bool)

(declare-fun res!931295 () Bool)

(assert (=> b!1391378 (=> (not res!931295) (not e!787909))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1391378 (= res!931295 (validKeyInArray!0 (select (arr!45934 a!2901) i!1037)))))

(declare-fun b!1391379 () Bool)

(declare-fun res!931296 () Bool)

(assert (=> b!1391379 (=> (not res!931296) (not e!787909))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95142 (_ BitVec 32)) Bool)

(assert (=> b!1391379 (= res!931296 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun res!931297 () Bool)

(assert (=> start!119354 (=> (not res!931297) (not e!787909))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119354 (= res!931297 (validMask!0 mask!2840))))

(assert (=> start!119354 e!787909))

(assert (=> start!119354 true))

(declare-fun array_inv!35167 (array!95142) Bool)

(assert (=> start!119354 (array_inv!35167 a!2901)))

(declare-fun b!1391380 () Bool)

(declare-datatypes ((SeekEntryResult!10277 0))(
  ( (MissingZero!10277 (index!43479 (_ BitVec 32))) (Found!10277 (index!43480 (_ BitVec 32))) (Intermediate!10277 (undefined!11089 Bool) (index!43481 (_ BitVec 32)) (x!125156 (_ BitVec 32))) (Undefined!10277) (MissingVacant!10277 (index!43482 (_ BitVec 32))) )
))
(declare-fun lt!611020 () SeekEntryResult!10277)

(get-info :version)

(assert (=> b!1391380 (= e!787909 (not (or (not ((_ is Intermediate!10277) lt!611020)) (undefined!11089 lt!611020) (bvsge mask!2840 #b00000000000000000000000000000000))))))

(declare-fun e!787910 () Bool)

(assert (=> b!1391380 e!787910))

(declare-fun res!931300 () Bool)

(assert (=> b!1391380 (=> (not res!931300) (not e!787910))))

(assert (=> b!1391380 (= res!931300 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46401 0))(
  ( (Unit!46402) )
))
(declare-fun lt!611021 () Unit!46401)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95142 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46401)

(assert (=> b!1391380 (= lt!611021 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95142 (_ BitVec 32)) SeekEntryResult!10277)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1391380 (= lt!611020 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45934 a!2901) j!112) mask!2840) (select (arr!45934 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1391381 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95142 (_ BitVec 32)) SeekEntryResult!10277)

(assert (=> b!1391381 (= e!787910 (= (seekEntryOrOpen!0 (select (arr!45934 a!2901) j!112) a!2901 mask!2840) (Found!10277 j!112)))))

(declare-fun b!1391382 () Bool)

(declare-fun res!931294 () Bool)

(assert (=> b!1391382 (=> (not res!931294) (not e!787909))))

(assert (=> b!1391382 (= res!931294 (and (= (size!46486 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46486 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46486 a!2901)) (not (= i!1037 j!112))))))

(assert (= (and start!119354 res!931297) b!1391382))

(assert (= (and b!1391382 res!931294) b!1391378))

(assert (= (and b!1391378 res!931295) b!1391377))

(assert (= (and b!1391377 res!931299) b!1391379))

(assert (= (and b!1391379 res!931296) b!1391376))

(assert (= (and b!1391376 res!931298) b!1391380))

(assert (= (and b!1391380 res!931300) b!1391381))

(declare-fun m!1276705 () Bool)

(assert (=> start!119354 m!1276705))

(declare-fun m!1276707 () Bool)

(assert (=> start!119354 m!1276707))

(declare-fun m!1276709 () Bool)

(assert (=> b!1391381 m!1276709))

(assert (=> b!1391381 m!1276709))

(declare-fun m!1276711 () Bool)

(assert (=> b!1391381 m!1276711))

(declare-fun m!1276713 () Bool)

(assert (=> b!1391378 m!1276713))

(assert (=> b!1391378 m!1276713))

(declare-fun m!1276715 () Bool)

(assert (=> b!1391378 m!1276715))

(assert (=> b!1391377 m!1276709))

(assert (=> b!1391377 m!1276709))

(declare-fun m!1276717 () Bool)

(assert (=> b!1391377 m!1276717))

(assert (=> b!1391380 m!1276709))

(declare-fun m!1276719 () Bool)

(assert (=> b!1391380 m!1276719))

(assert (=> b!1391380 m!1276709))

(declare-fun m!1276721 () Bool)

(assert (=> b!1391380 m!1276721))

(assert (=> b!1391380 m!1276719))

(assert (=> b!1391380 m!1276709))

(declare-fun m!1276723 () Bool)

(assert (=> b!1391380 m!1276723))

(declare-fun m!1276725 () Bool)

(assert (=> b!1391380 m!1276725))

(declare-fun m!1276727 () Bool)

(assert (=> b!1391376 m!1276727))

(declare-fun m!1276729 () Bool)

(assert (=> b!1391379 m!1276729))

(check-sat (not b!1391379) (not b!1391377) (not b!1391380) (not b!1391381) (not start!119354) (not b!1391376) (not b!1391378))
(check-sat)
