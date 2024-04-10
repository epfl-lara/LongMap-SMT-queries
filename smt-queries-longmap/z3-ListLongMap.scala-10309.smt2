; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!121178 () Bool)

(assert start!121178)

(declare-fun b!1408982 () Bool)

(declare-fun res!946706 () Bool)

(declare-fun e!797368 () Bool)

(assert (=> b!1408982 (=> (not res!946706) (not e!797368))))

(declare-datatypes ((array!96332 0))(
  ( (array!96333 (arr!46509 (Array (_ BitVec 32) (_ BitVec 64))) (size!47059 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96332)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1408982 (= res!946706 (validKeyInArray!0 (select (arr!46509 a!2901) i!1037)))))

(declare-fun b!1408983 () Bool)

(declare-fun e!797366 () Bool)

(assert (=> b!1408983 (= e!797368 (not e!797366))))

(declare-fun res!946705 () Bool)

(assert (=> b!1408983 (=> res!946705 e!797366)))

(declare-datatypes ((SeekEntryResult!10820 0))(
  ( (MissingZero!10820 (index!45657 (_ BitVec 32))) (Found!10820 (index!45658 (_ BitVec 32))) (Intermediate!10820 (undefined!11632 Bool) (index!45659 (_ BitVec 32)) (x!127253 (_ BitVec 32))) (Undefined!10820) (MissingVacant!10820 (index!45660 (_ BitVec 32))) )
))
(declare-fun lt!620551 () SeekEntryResult!10820)

(get-info :version)

(assert (=> b!1408983 (= res!946705 (or (not ((_ is Intermediate!10820) lt!620551)) (undefined!11632 lt!620551)))))

(declare-fun e!797367 () Bool)

(assert (=> b!1408983 e!797367))

(declare-fun res!946710 () Bool)

(assert (=> b!1408983 (=> (not res!946710) (not e!797367))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96332 (_ BitVec 32)) Bool)

(assert (=> b!1408983 (= res!946710 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47614 0))(
  ( (Unit!47615) )
))
(declare-fun lt!620552 () Unit!47614)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96332 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47614)

(assert (=> b!1408983 (= lt!620552 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96332 (_ BitVec 32)) SeekEntryResult!10820)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1408983 (= lt!620551 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46509 a!2901) j!112) mask!2840) (select (arr!46509 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1408984 () Bool)

(declare-fun res!946709 () Bool)

(assert (=> b!1408984 (=> (not res!946709) (not e!797368))))

(assert (=> b!1408984 (= res!946709 (validKeyInArray!0 (select (arr!46509 a!2901) j!112)))))

(declare-fun b!1408985 () Bool)

(assert (=> b!1408985 (= e!797366 true)))

(declare-fun lt!620553 () SeekEntryResult!10820)

(assert (=> b!1408985 (= lt!620553 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46509 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46509 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96333 (store (arr!46509 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47059 a!2901)) mask!2840))))

(declare-fun b!1408986 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96332 (_ BitVec 32)) SeekEntryResult!10820)

(assert (=> b!1408986 (= e!797367 (= (seekEntryOrOpen!0 (select (arr!46509 a!2901) j!112) a!2901 mask!2840) (Found!10820 j!112)))))

(declare-fun b!1408987 () Bool)

(declare-fun res!946707 () Bool)

(assert (=> b!1408987 (=> (not res!946707) (not e!797368))))

(assert (=> b!1408987 (= res!946707 (and (= (size!47059 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47059 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47059 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1408989 () Bool)

(declare-fun res!946704 () Bool)

(assert (=> b!1408989 (=> (not res!946704) (not e!797368))))

(assert (=> b!1408989 (= res!946704 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun res!946711 () Bool)

(assert (=> start!121178 (=> (not res!946711) (not e!797368))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121178 (= res!946711 (validMask!0 mask!2840))))

(assert (=> start!121178 e!797368))

(assert (=> start!121178 true))

(declare-fun array_inv!35537 (array!96332) Bool)

(assert (=> start!121178 (array_inv!35537 a!2901)))

(declare-fun b!1408988 () Bool)

(declare-fun res!946708 () Bool)

(assert (=> b!1408988 (=> (not res!946708) (not e!797368))))

(declare-datatypes ((List!33028 0))(
  ( (Nil!33025) (Cons!33024 (h!34287 (_ BitVec 64)) (t!47722 List!33028)) )
))
(declare-fun arrayNoDuplicates!0 (array!96332 (_ BitVec 32) List!33028) Bool)

(assert (=> b!1408988 (= res!946708 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33025))))

(assert (= (and start!121178 res!946711) b!1408987))

(assert (= (and b!1408987 res!946707) b!1408982))

(assert (= (and b!1408982 res!946706) b!1408984))

(assert (= (and b!1408984 res!946709) b!1408989))

(assert (= (and b!1408989 res!946704) b!1408988))

(assert (= (and b!1408988 res!946708) b!1408983))

(assert (= (and b!1408983 res!946710) b!1408986))

(assert (= (and b!1408983 (not res!946705)) b!1408985))

(declare-fun m!1298509 () Bool)

(assert (=> b!1408982 m!1298509))

(assert (=> b!1408982 m!1298509))

(declare-fun m!1298511 () Bool)

(assert (=> b!1408982 m!1298511))

(declare-fun m!1298513 () Bool)

(assert (=> b!1408988 m!1298513))

(declare-fun m!1298515 () Bool)

(assert (=> start!121178 m!1298515))

(declare-fun m!1298517 () Bool)

(assert (=> start!121178 m!1298517))

(declare-fun m!1298519 () Bool)

(assert (=> b!1408985 m!1298519))

(declare-fun m!1298521 () Bool)

(assert (=> b!1408985 m!1298521))

(assert (=> b!1408985 m!1298521))

(declare-fun m!1298523 () Bool)

(assert (=> b!1408985 m!1298523))

(assert (=> b!1408985 m!1298523))

(assert (=> b!1408985 m!1298521))

(declare-fun m!1298525 () Bool)

(assert (=> b!1408985 m!1298525))

(declare-fun m!1298527 () Bool)

(assert (=> b!1408986 m!1298527))

(assert (=> b!1408986 m!1298527))

(declare-fun m!1298529 () Bool)

(assert (=> b!1408986 m!1298529))

(declare-fun m!1298531 () Bool)

(assert (=> b!1408989 m!1298531))

(assert (=> b!1408983 m!1298527))

(declare-fun m!1298533 () Bool)

(assert (=> b!1408983 m!1298533))

(assert (=> b!1408983 m!1298527))

(declare-fun m!1298535 () Bool)

(assert (=> b!1408983 m!1298535))

(assert (=> b!1408983 m!1298533))

(assert (=> b!1408983 m!1298527))

(declare-fun m!1298537 () Bool)

(assert (=> b!1408983 m!1298537))

(declare-fun m!1298539 () Bool)

(assert (=> b!1408983 m!1298539))

(assert (=> b!1408984 m!1298527))

(assert (=> b!1408984 m!1298527))

(declare-fun m!1298541 () Bool)

(assert (=> b!1408984 m!1298541))

(check-sat (not b!1408983) (not b!1408986) (not b!1408984) (not b!1408985) (not b!1408982) (not b!1408989) (not b!1408988) (not start!121178))
