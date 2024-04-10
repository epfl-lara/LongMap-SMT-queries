; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122096 () Bool)

(assert start!122096)

(declare-fun b!1416830 () Bool)

(declare-fun res!952710 () Bool)

(declare-fun e!801884 () Bool)

(assert (=> b!1416830 (=> (not res!952710) (not e!801884))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96731 0))(
  ( (array!96732 (arr!46695 (Array (_ BitVec 32) (_ BitVec 64))) (size!47245 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96731)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1416830 (= res!952710 (and (= (size!47245 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47245 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47245 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1416831 () Bool)

(declare-fun res!952709 () Bool)

(assert (=> b!1416831 (=> (not res!952709) (not e!801884))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1416831 (= res!952709 (validKeyInArray!0 (select (arr!46695 a!2901) j!112)))))

(declare-fun e!801886 () Bool)

(declare-fun b!1416832 () Bool)

(declare-datatypes ((SeekEntryResult!11006 0))(
  ( (MissingZero!11006 (index!46416 (_ BitVec 32))) (Found!11006 (index!46417 (_ BitVec 32))) (Intermediate!11006 (undefined!11818 Bool) (index!46418 (_ BitVec 32)) (x!128019 (_ BitVec 32))) (Undefined!11006) (MissingVacant!11006 (index!46419 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96731 (_ BitVec 32)) SeekEntryResult!11006)

(assert (=> b!1416832 (= e!801886 (= (seekEntryOrOpen!0 (select (arr!46695 a!2901) j!112) a!2901 mask!2840) (Found!11006 j!112)))))

(declare-fun res!952713 () Bool)

(assert (=> start!122096 (=> (not res!952713) (not e!801884))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122096 (= res!952713 (validMask!0 mask!2840))))

(assert (=> start!122096 e!801884))

(assert (=> start!122096 true))

(declare-fun array_inv!35723 (array!96731) Bool)

(assert (=> start!122096 (array_inv!35723 a!2901)))

(declare-fun b!1416833 () Bool)

(declare-fun res!952711 () Bool)

(assert (=> b!1416833 (=> (not res!952711) (not e!801884))))

(declare-datatypes ((List!33214 0))(
  ( (Nil!33211) (Cons!33210 (h!34500 (_ BitVec 64)) (t!47908 List!33214)) )
))
(declare-fun arrayNoDuplicates!0 (array!96731 (_ BitVec 32) List!33214) Bool)

(assert (=> b!1416833 (= res!952711 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33211))))

(declare-fun b!1416834 () Bool)

(declare-fun res!952708 () Bool)

(assert (=> b!1416834 (=> (not res!952708) (not e!801884))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96731 (_ BitVec 32)) Bool)

(assert (=> b!1416834 (= res!952708 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1416835 () Bool)

(declare-fun e!801887 () Bool)

(assert (=> b!1416835 (= e!801884 (not e!801887))))

(declare-fun res!952707 () Bool)

(assert (=> b!1416835 (=> res!952707 e!801887)))

(declare-fun lt!625134 () SeekEntryResult!11006)

(get-info :version)

(assert (=> b!1416835 (= res!952707 (or (not ((_ is Intermediate!11006) lt!625134)) (undefined!11818 lt!625134)))))

(assert (=> b!1416835 e!801886))

(declare-fun res!952712 () Bool)

(assert (=> b!1416835 (=> (not res!952712) (not e!801886))))

(assert (=> b!1416835 (= res!952712 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47986 0))(
  ( (Unit!47987) )
))
(declare-fun lt!625133 () Unit!47986)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96731 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47986)

(assert (=> b!1416835 (= lt!625133 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96731 (_ BitVec 32)) SeekEntryResult!11006)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1416835 (= lt!625134 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46695 a!2901) j!112) mask!2840) (select (arr!46695 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1416836 () Bool)

(declare-fun res!952714 () Bool)

(assert (=> b!1416836 (=> (not res!952714) (not e!801884))))

(assert (=> b!1416836 (= res!952714 (validKeyInArray!0 (select (arr!46695 a!2901) i!1037)))))

(declare-fun b!1416837 () Bool)

(assert (=> b!1416837 (= e!801887 true)))

(declare-fun lt!625132 () SeekEntryResult!11006)

(assert (=> b!1416837 (= lt!625132 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46695 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46695 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96732 (store (arr!46695 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47245 a!2901)) mask!2840))))

(assert (= (and start!122096 res!952713) b!1416830))

(assert (= (and b!1416830 res!952710) b!1416836))

(assert (= (and b!1416836 res!952714) b!1416831))

(assert (= (and b!1416831 res!952709) b!1416834))

(assert (= (and b!1416834 res!952708) b!1416833))

(assert (= (and b!1416833 res!952711) b!1416835))

(assert (= (and b!1416835 res!952712) b!1416832))

(assert (= (and b!1416835 (not res!952707)) b!1416837))

(declare-fun m!1307509 () Bool)

(assert (=> b!1416836 m!1307509))

(assert (=> b!1416836 m!1307509))

(declare-fun m!1307511 () Bool)

(assert (=> b!1416836 m!1307511))

(declare-fun m!1307513 () Bool)

(assert (=> b!1416833 m!1307513))

(declare-fun m!1307515 () Bool)

(assert (=> b!1416835 m!1307515))

(declare-fun m!1307517 () Bool)

(assert (=> b!1416835 m!1307517))

(assert (=> b!1416835 m!1307515))

(declare-fun m!1307519 () Bool)

(assert (=> b!1416835 m!1307519))

(assert (=> b!1416835 m!1307517))

(assert (=> b!1416835 m!1307515))

(declare-fun m!1307521 () Bool)

(assert (=> b!1416835 m!1307521))

(declare-fun m!1307523 () Bool)

(assert (=> b!1416835 m!1307523))

(declare-fun m!1307525 () Bool)

(assert (=> start!122096 m!1307525))

(declare-fun m!1307527 () Bool)

(assert (=> start!122096 m!1307527))

(declare-fun m!1307529 () Bool)

(assert (=> b!1416837 m!1307529))

(declare-fun m!1307531 () Bool)

(assert (=> b!1416837 m!1307531))

(assert (=> b!1416837 m!1307531))

(declare-fun m!1307533 () Bool)

(assert (=> b!1416837 m!1307533))

(assert (=> b!1416837 m!1307533))

(assert (=> b!1416837 m!1307531))

(declare-fun m!1307535 () Bool)

(assert (=> b!1416837 m!1307535))

(assert (=> b!1416831 m!1307515))

(assert (=> b!1416831 m!1307515))

(declare-fun m!1307537 () Bool)

(assert (=> b!1416831 m!1307537))

(assert (=> b!1416832 m!1307515))

(assert (=> b!1416832 m!1307515))

(declare-fun m!1307539 () Bool)

(assert (=> b!1416832 m!1307539))

(declare-fun m!1307541 () Bool)

(assert (=> b!1416834 m!1307541))

(check-sat (not start!122096) (not b!1416832) (not b!1416831) (not b!1416835) (not b!1416833) (not b!1416836) (not b!1416837) (not b!1416834))
