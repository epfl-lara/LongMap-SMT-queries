; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!121964 () Bool)

(assert start!121964)

(declare-fun b!1415424 () Bool)

(declare-fun e!801087 () Bool)

(declare-fun e!801092 () Bool)

(assert (=> b!1415424 (= e!801087 e!801092)))

(declare-fun res!951474 () Bool)

(assert (=> b!1415424 (=> res!951474 e!801092)))

(declare-datatypes ((SeekEntryResult!10967 0))(
  ( (MissingZero!10967 (index!46260 (_ BitVec 32))) (Found!10967 (index!46261 (_ BitVec 32))) (Intermediate!10967 (undefined!11779 Bool) (index!46262 (_ BitVec 32)) (x!127870 (_ BitVec 32))) (Undefined!10967) (MissingVacant!10967 (index!46263 (_ BitVec 32))) )
))
(declare-fun lt!624132 () SeekEntryResult!10967)

(declare-fun lt!624133 () SeekEntryResult!10967)

(get-info :version)

(assert (=> b!1415424 (= res!951474 (or (= lt!624132 lt!624133) (not ((_ is Intermediate!10967) lt!624133))))))

(declare-datatypes ((array!96650 0))(
  ( (array!96651 (arr!46656 (Array (_ BitVec 32) (_ BitVec 64))) (size!47206 (_ BitVec 32))) )
))
(declare-fun lt!624134 () array!96650)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun lt!624137 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96650 (_ BitVec 32)) SeekEntryResult!10967)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1415424 (= lt!624133 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!624137 mask!2840) lt!624137 lt!624134 mask!2840))))

(declare-fun a!2901 () array!96650)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1415424 (= lt!624137 (select (store (arr!46656 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1415424 (= lt!624134 (array!96651 (store (arr!46656 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47206 a!2901)))))

(declare-fun b!1415425 () Bool)

(declare-fun res!951468 () Bool)

(declare-fun e!801089 () Bool)

(assert (=> b!1415425 (=> (not res!951468) (not e!801089))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96650 (_ BitVec 32)) Bool)

(assert (=> b!1415425 (= res!951468 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1415426 () Bool)

(declare-fun res!951466 () Bool)

(assert (=> b!1415426 (=> (not res!951466) (not e!801089))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1415426 (= res!951466 (validKeyInArray!0 (select (arr!46656 a!2901) i!1037)))))

(declare-fun lt!624136 () (_ BitVec 32))

(declare-fun b!1415427 () Bool)

(assert (=> b!1415427 (= e!801092 (or (bvslt (x!127870 lt!624132) #b00000000000000000000000000000000) (bvsgt (x!127870 lt!624132) #b01111111111111111111111111111110) (bvslt (x!127870 lt!624133) #b00000000000000000000000000000000) (bvsgt (x!127870 lt!624133) #b01111111111111111111111111111110) (bvslt lt!624136 #b00000000000000000000000000000000) (bvsge lt!624136 (size!47206 a!2901)) (bvslt (index!46262 lt!624132) #b00000000000000000000000000000000) (bvsge (index!46262 lt!624132) (size!47206 a!2901)) (bvslt (index!46262 lt!624133) #b00000000000000000000000000000000) (bvsge (index!46262 lt!624133) (size!47206 a!2901)) (= lt!624132 (Intermediate!10967 false (index!46262 lt!624132) (x!127870 lt!624132)))))))

(declare-fun e!801090 () Bool)

(assert (=> b!1415427 e!801090))

(declare-fun res!951473 () Bool)

(assert (=> b!1415427 (=> (not res!951473) (not e!801090))))

(assert (=> b!1415427 (= res!951473 (and (not (undefined!11779 lt!624133)) (= (index!46262 lt!624133) i!1037) (bvslt (x!127870 lt!624133) (x!127870 lt!624132)) (= (select (store (arr!46656 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!46262 lt!624133)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((Unit!47908 0))(
  ( (Unit!47909) )
))
(declare-fun lt!624138 () Unit!47908)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96650 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47908)

(assert (=> b!1415427 (= lt!624138 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!624136 (x!127870 lt!624132) (index!46262 lt!624132) (x!127870 lt!624133) (index!46262 lt!624133) (undefined!11779 lt!624133) mask!2840))))

(declare-fun b!1415428 () Bool)

(assert (=> b!1415428 (= e!801089 (not e!801087))))

(declare-fun res!951472 () Bool)

(assert (=> b!1415428 (=> res!951472 e!801087)))

(assert (=> b!1415428 (= res!951472 (or (not ((_ is Intermediate!10967) lt!624132)) (undefined!11779 lt!624132)))))

(declare-fun e!801091 () Bool)

(assert (=> b!1415428 e!801091))

(declare-fun res!951469 () Bool)

(assert (=> b!1415428 (=> (not res!951469) (not e!801091))))

(assert (=> b!1415428 (= res!951469 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-fun lt!624135 () Unit!47908)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96650 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47908)

(assert (=> b!1415428 (= lt!624135 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1415428 (= lt!624132 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!624136 (select (arr!46656 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1415428 (= lt!624136 (toIndex!0 (select (arr!46656 a!2901) j!112) mask!2840))))

(declare-fun b!1415429 () Bool)

(declare-fun res!951467 () Bool)

(assert (=> b!1415429 (=> (not res!951467) (not e!801089))))

(declare-datatypes ((List!33175 0))(
  ( (Nil!33172) (Cons!33171 (h!34458 (_ BitVec 64)) (t!47869 List!33175)) )
))
(declare-fun arrayNoDuplicates!0 (array!96650 (_ BitVec 32) List!33175) Bool)

(assert (=> b!1415429 (= res!951467 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33172))))

(declare-fun b!1415430 () Bool)

(declare-fun res!951475 () Bool)

(assert (=> b!1415430 (=> (not res!951475) (not e!801089))))

(assert (=> b!1415430 (= res!951475 (and (= (size!47206 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47206 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47206 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1415431 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96650 (_ BitVec 32)) SeekEntryResult!10967)

(assert (=> b!1415431 (= e!801091 (= (seekEntryOrOpen!0 (select (arr!46656 a!2901) j!112) a!2901 mask!2840) (Found!10967 j!112)))))

(declare-fun b!1415432 () Bool)

(declare-fun res!951471 () Bool)

(assert (=> b!1415432 (=> (not res!951471) (not e!801089))))

(assert (=> b!1415432 (= res!951471 (validKeyInArray!0 (select (arr!46656 a!2901) j!112)))))

(declare-fun res!951470 () Bool)

(assert (=> start!121964 (=> (not res!951470) (not e!801089))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121964 (= res!951470 (validMask!0 mask!2840))))

(assert (=> start!121964 e!801089))

(assert (=> start!121964 true))

(declare-fun array_inv!35684 (array!96650) Bool)

(assert (=> start!121964 (array_inv!35684 a!2901)))

(declare-fun b!1415433 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96650 (_ BitVec 32)) SeekEntryResult!10967)

(assert (=> b!1415433 (= e!801090 (= (seekEntryOrOpen!0 lt!624137 lt!624134 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!127870 lt!624133) (index!46262 lt!624133) (index!46262 lt!624133) (select (arr!46656 a!2901) j!112) lt!624134 mask!2840)))))

(assert (= (and start!121964 res!951470) b!1415430))

(assert (= (and b!1415430 res!951475) b!1415426))

(assert (= (and b!1415426 res!951466) b!1415432))

(assert (= (and b!1415432 res!951471) b!1415425))

(assert (= (and b!1415425 res!951468) b!1415429))

(assert (= (and b!1415429 res!951467) b!1415428))

(assert (= (and b!1415428 res!951469) b!1415431))

(assert (= (and b!1415428 (not res!951472)) b!1415424))

(assert (= (and b!1415424 (not res!951474)) b!1415427))

(assert (= (and b!1415427 res!951473) b!1415433))

(declare-fun m!1305699 () Bool)

(assert (=> b!1415428 m!1305699))

(declare-fun m!1305701 () Bool)

(assert (=> b!1415428 m!1305701))

(assert (=> b!1415428 m!1305699))

(declare-fun m!1305703 () Bool)

(assert (=> b!1415428 m!1305703))

(declare-fun m!1305705 () Bool)

(assert (=> b!1415428 m!1305705))

(assert (=> b!1415428 m!1305699))

(declare-fun m!1305707 () Bool)

(assert (=> b!1415428 m!1305707))

(declare-fun m!1305709 () Bool)

(assert (=> b!1415424 m!1305709))

(assert (=> b!1415424 m!1305709))

(declare-fun m!1305711 () Bool)

(assert (=> b!1415424 m!1305711))

(declare-fun m!1305713 () Bool)

(assert (=> b!1415424 m!1305713))

(declare-fun m!1305715 () Bool)

(assert (=> b!1415424 m!1305715))

(declare-fun m!1305717 () Bool)

(assert (=> b!1415433 m!1305717))

(assert (=> b!1415433 m!1305699))

(assert (=> b!1415433 m!1305699))

(declare-fun m!1305719 () Bool)

(assert (=> b!1415433 m!1305719))

(declare-fun m!1305721 () Bool)

(assert (=> b!1415429 m!1305721))

(assert (=> b!1415431 m!1305699))

(assert (=> b!1415431 m!1305699))

(declare-fun m!1305723 () Bool)

(assert (=> b!1415431 m!1305723))

(assert (=> b!1415427 m!1305713))

(declare-fun m!1305725 () Bool)

(assert (=> b!1415427 m!1305725))

(declare-fun m!1305727 () Bool)

(assert (=> b!1415427 m!1305727))

(assert (=> b!1415432 m!1305699))

(assert (=> b!1415432 m!1305699))

(declare-fun m!1305729 () Bool)

(assert (=> b!1415432 m!1305729))

(declare-fun m!1305731 () Bool)

(assert (=> start!121964 m!1305731))

(declare-fun m!1305733 () Bool)

(assert (=> start!121964 m!1305733))

(declare-fun m!1305735 () Bool)

(assert (=> b!1415425 m!1305735))

(declare-fun m!1305737 () Bool)

(assert (=> b!1415426 m!1305737))

(assert (=> b!1415426 m!1305737))

(declare-fun m!1305739 () Bool)

(assert (=> b!1415426 m!1305739))

(check-sat (not b!1415432) (not b!1415428) (not b!1415426) (not b!1415424) (not b!1415425) (not start!121964) (not b!1415433) (not b!1415431) (not b!1415429) (not b!1415427))
(check-sat)
