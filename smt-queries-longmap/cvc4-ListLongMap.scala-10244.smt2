; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120520 () Bool)

(assert start!120520)

(declare-fun b!1403366 () Bool)

(declare-fun res!941877 () Bool)

(declare-fun e!794606 () Bool)

(assert (=> b!1403366 (=> (not res!941877) (not e!794606))))

(declare-datatypes ((array!95929 0))(
  ( (array!95930 (arr!46315 (Array (_ BitVec 32) (_ BitVec 64))) (size!46865 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95929)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1403366 (= res!941877 (validKeyInArray!0 (select (arr!46315 a!2901) j!112)))))

(declare-fun b!1403367 () Bool)

(declare-fun e!794609 () Bool)

(assert (=> b!1403367 (= e!794606 (not e!794609))))

(declare-fun res!941884 () Bool)

(assert (=> b!1403367 (=> res!941884 e!794609)))

(declare-datatypes ((SeekEntryResult!10632 0))(
  ( (MissingZero!10632 (index!44905 (_ BitVec 32))) (Found!10632 (index!44906 (_ BitVec 32))) (Intermediate!10632 (undefined!11444 Bool) (index!44907 (_ BitVec 32)) (x!126515 (_ BitVec 32))) (Undefined!10632) (MissingVacant!10632 (index!44908 (_ BitVec 32))) )
))
(declare-fun lt!618375 () SeekEntryResult!10632)

(assert (=> b!1403367 (= res!941884 (or (not (is-Intermediate!10632 lt!618375)) (undefined!11444 lt!618375)))))

(declare-fun e!794608 () Bool)

(assert (=> b!1403367 e!794608))

(declare-fun res!941883 () Bool)

(assert (=> b!1403367 (=> (not res!941883) (not e!794608))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95929 (_ BitVec 32)) Bool)

(assert (=> b!1403367 (= res!941883 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47268 0))(
  ( (Unit!47269) )
))
(declare-fun lt!618373 () Unit!47268)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95929 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47268)

(assert (=> b!1403367 (= lt!618373 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95929 (_ BitVec 32)) SeekEntryResult!10632)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1403367 (= lt!618375 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46315 a!2901) j!112) mask!2840) (select (arr!46315 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1403368 () Bool)

(assert (=> b!1403368 (= e!794609 true)))

(declare-fun lt!618374 () SeekEntryResult!10632)

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1403368 (= lt!618374 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46315 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46315 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95930 (store (arr!46315 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46865 a!2901)) mask!2840))))

(declare-fun b!1403369 () Bool)

(declare-fun res!941881 () Bool)

(assert (=> b!1403369 (=> (not res!941881) (not e!794606))))

(assert (=> b!1403369 (= res!941881 (and (= (size!46865 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46865 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46865 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1403370 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95929 (_ BitVec 32)) SeekEntryResult!10632)

(assert (=> b!1403370 (= e!794608 (= (seekEntryOrOpen!0 (select (arr!46315 a!2901) j!112) a!2901 mask!2840) (Found!10632 j!112)))))

(declare-fun res!941880 () Bool)

(assert (=> start!120520 (=> (not res!941880) (not e!794606))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120520 (= res!941880 (validMask!0 mask!2840))))

(assert (=> start!120520 e!794606))

(assert (=> start!120520 true))

(declare-fun array_inv!35343 (array!95929) Bool)

(assert (=> start!120520 (array_inv!35343 a!2901)))

(declare-fun b!1403371 () Bool)

(declare-fun res!941878 () Bool)

(assert (=> b!1403371 (=> (not res!941878) (not e!794606))))

(declare-datatypes ((List!32834 0))(
  ( (Nil!32831) (Cons!32830 (h!34078 (_ BitVec 64)) (t!47528 List!32834)) )
))
(declare-fun arrayNoDuplicates!0 (array!95929 (_ BitVec 32) List!32834) Bool)

(assert (=> b!1403371 (= res!941878 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32831))))

(declare-fun b!1403372 () Bool)

(declare-fun res!941882 () Bool)

(assert (=> b!1403372 (=> (not res!941882) (not e!794606))))

(assert (=> b!1403372 (= res!941882 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1403373 () Bool)

(declare-fun res!941879 () Bool)

(assert (=> b!1403373 (=> (not res!941879) (not e!794606))))

(assert (=> b!1403373 (= res!941879 (validKeyInArray!0 (select (arr!46315 a!2901) i!1037)))))

(assert (= (and start!120520 res!941880) b!1403369))

(assert (= (and b!1403369 res!941881) b!1403373))

(assert (= (and b!1403373 res!941879) b!1403366))

(assert (= (and b!1403366 res!941877) b!1403372))

(assert (= (and b!1403372 res!941882) b!1403371))

(assert (= (and b!1403371 res!941878) b!1403367))

(assert (= (and b!1403367 res!941883) b!1403370))

(assert (= (and b!1403367 (not res!941884)) b!1403368))

(declare-fun m!1291973 () Bool)

(assert (=> b!1403368 m!1291973))

(declare-fun m!1291975 () Bool)

(assert (=> b!1403368 m!1291975))

(assert (=> b!1403368 m!1291975))

(declare-fun m!1291977 () Bool)

(assert (=> b!1403368 m!1291977))

(assert (=> b!1403368 m!1291977))

(assert (=> b!1403368 m!1291975))

(declare-fun m!1291979 () Bool)

(assert (=> b!1403368 m!1291979))

(declare-fun m!1291981 () Bool)

(assert (=> b!1403370 m!1291981))

(assert (=> b!1403370 m!1291981))

(declare-fun m!1291983 () Bool)

(assert (=> b!1403370 m!1291983))

(assert (=> b!1403367 m!1291981))

(declare-fun m!1291985 () Bool)

(assert (=> b!1403367 m!1291985))

(assert (=> b!1403367 m!1291981))

(declare-fun m!1291987 () Bool)

(assert (=> b!1403367 m!1291987))

(assert (=> b!1403367 m!1291985))

(assert (=> b!1403367 m!1291981))

(declare-fun m!1291989 () Bool)

(assert (=> b!1403367 m!1291989))

(declare-fun m!1291991 () Bool)

(assert (=> b!1403367 m!1291991))

(declare-fun m!1291993 () Bool)

(assert (=> b!1403372 m!1291993))

(assert (=> b!1403366 m!1291981))

(assert (=> b!1403366 m!1291981))

(declare-fun m!1291995 () Bool)

(assert (=> b!1403366 m!1291995))

(declare-fun m!1291997 () Bool)

(assert (=> b!1403373 m!1291997))

(assert (=> b!1403373 m!1291997))

(declare-fun m!1291999 () Bool)

(assert (=> b!1403373 m!1291999))

(declare-fun m!1292001 () Bool)

(assert (=> b!1403371 m!1292001))

(declare-fun m!1292003 () Bool)

(assert (=> start!120520 m!1292003))

(declare-fun m!1292005 () Bool)

(assert (=> start!120520 m!1292005))

(push 1)

(assert (not b!1403372))

(assert (not b!1403368))

(assert (not start!120520))

(assert (not b!1403367))

(assert (not b!1403366))

(assert (not b!1403373))

(assert (not b!1403370))

