; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121978 () Bool)

(assert start!121978)

(declare-fun b!1415634 () Bool)

(declare-fun res!951681 () Bool)

(declare-fun e!801216 () Bool)

(assert (=> b!1415634 (=> (not res!951681) (not e!801216))))

(declare-datatypes ((array!96664 0))(
  ( (array!96665 (arr!46663 (Array (_ BitVec 32) (_ BitVec 64))) (size!47213 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96664)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1415634 (= res!951681 (validKeyInArray!0 (select (arr!46663 a!2901) i!1037)))))

(declare-fun b!1415635 () Bool)

(declare-fun res!951685 () Bool)

(assert (=> b!1415635 (=> (not res!951685) (not e!801216))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96664 (_ BitVec 32)) Bool)

(assert (=> b!1415635 (= res!951685 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1415636 () Bool)

(declare-fun res!951684 () Bool)

(assert (=> b!1415636 (=> (not res!951684) (not e!801216))))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1415636 (= res!951684 (validKeyInArray!0 (select (arr!46663 a!2901) j!112)))))

(declare-fun b!1415637 () Bool)

(declare-fun e!801218 () Bool)

(declare-fun e!801214 () Bool)

(assert (=> b!1415637 (= e!801218 e!801214)))

(declare-fun res!951680 () Bool)

(assert (=> b!1415637 (=> res!951680 e!801214)))

(declare-datatypes ((SeekEntryResult!10974 0))(
  ( (MissingZero!10974 (index!46288 (_ BitVec 32))) (Found!10974 (index!46289 (_ BitVec 32))) (Intermediate!10974 (undefined!11786 Bool) (index!46290 (_ BitVec 32)) (x!127893 (_ BitVec 32))) (Undefined!10974) (MissingVacant!10974 (index!46291 (_ BitVec 32))) )
))
(declare-fun lt!624285 () SeekEntryResult!10974)

(declare-fun lt!624280 () SeekEntryResult!10974)

(assert (=> b!1415637 (= res!951680 (or (= lt!624285 lt!624280) (not (is-Intermediate!10974 lt!624280))))))

(declare-fun lt!624279 () array!96664)

(declare-fun lt!624281 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96664 (_ BitVec 32)) SeekEntryResult!10974)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1415637 (= lt!624280 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!624281 mask!2840) lt!624281 lt!624279 mask!2840))))

(assert (=> b!1415637 (= lt!624281 (select (store (arr!46663 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1415637 (= lt!624279 (array!96665 (store (arr!46663 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47213 a!2901)))))

(declare-fun e!801213 () Bool)

(declare-fun b!1415638 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96664 (_ BitVec 32)) SeekEntryResult!10974)

(assert (=> b!1415638 (= e!801213 (= (seekEntryOrOpen!0 (select (arr!46663 a!2901) j!112) a!2901 mask!2840) (Found!10974 j!112)))))

(declare-fun b!1415639 () Bool)

(assert (=> b!1415639 (= e!801216 (not e!801218))))

(declare-fun res!951683 () Bool)

(assert (=> b!1415639 (=> res!951683 e!801218)))

(assert (=> b!1415639 (= res!951683 (or (not (is-Intermediate!10974 lt!624285)) (undefined!11786 lt!624285)))))

(assert (=> b!1415639 e!801213))

(declare-fun res!951678 () Bool)

(assert (=> b!1415639 (=> (not res!951678) (not e!801213))))

(assert (=> b!1415639 (= res!951678 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47922 0))(
  ( (Unit!47923) )
))
(declare-fun lt!624282 () Unit!47922)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96664 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47922)

(assert (=> b!1415639 (= lt!624282 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!624283 () (_ BitVec 32))

(assert (=> b!1415639 (= lt!624285 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!624283 (select (arr!46663 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1415639 (= lt!624283 (toIndex!0 (select (arr!46663 a!2901) j!112) mask!2840))))

(declare-fun b!1415640 () Bool)

(declare-fun res!951679 () Bool)

(assert (=> b!1415640 (=> (not res!951679) (not e!801216))))

(declare-datatypes ((List!33182 0))(
  ( (Nil!33179) (Cons!33178 (h!34465 (_ BitVec 64)) (t!47876 List!33182)) )
))
(declare-fun arrayNoDuplicates!0 (array!96664 (_ BitVec 32) List!33182) Bool)

(assert (=> b!1415640 (= res!951679 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33179))))

(declare-fun b!1415641 () Bool)

(declare-fun e!801217 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96664 (_ BitVec 32)) SeekEntryResult!10974)

(assert (=> b!1415641 (= e!801217 (= (seekEntryOrOpen!0 lt!624281 lt!624279 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!127893 lt!624280) (index!46290 lt!624280) (index!46290 lt!624280) (select (arr!46663 a!2901) j!112) lt!624279 mask!2840)))))

(declare-fun res!951677 () Bool)

(assert (=> start!121978 (=> (not res!951677) (not e!801216))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121978 (= res!951677 (validMask!0 mask!2840))))

(assert (=> start!121978 e!801216))

(assert (=> start!121978 true))

(declare-fun array_inv!35691 (array!96664) Bool)

(assert (=> start!121978 (array_inv!35691 a!2901)))

(declare-fun b!1415642 () Bool)

(assert (=> b!1415642 (= e!801214 (or (bvslt (x!127893 lt!624285) #b00000000000000000000000000000000) (bvsgt (x!127893 lt!624285) #b01111111111111111111111111111110) (bvslt (x!127893 lt!624280) #b00000000000000000000000000000000) (bvsgt (x!127893 lt!624280) #b01111111111111111111111111111110) (bvslt lt!624283 #b00000000000000000000000000000000) (bvsge lt!624283 (size!47213 a!2901)) (bvslt (index!46290 lt!624285) #b00000000000000000000000000000000) (bvsge (index!46290 lt!624285) (size!47213 a!2901)) (bvslt (index!46290 lt!624280) #b00000000000000000000000000000000) (bvsge (index!46290 lt!624280) (size!47213 a!2901)) (not (= lt!624285 (Intermediate!10974 false (index!46290 lt!624285) (x!127893 lt!624285)))) (= lt!624280 (Intermediate!10974 false (index!46290 lt!624280) (x!127893 lt!624280)))))))

(assert (=> b!1415642 e!801217))

(declare-fun res!951682 () Bool)

(assert (=> b!1415642 (=> (not res!951682) (not e!801217))))

(assert (=> b!1415642 (= res!951682 (and (not (undefined!11786 lt!624280)) (= (index!46290 lt!624280) i!1037) (bvslt (x!127893 lt!624280) (x!127893 lt!624285)) (= (select (store (arr!46663 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!46290 lt!624280)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!624284 () Unit!47922)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96664 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47922)

(assert (=> b!1415642 (= lt!624284 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!624283 (x!127893 lt!624285) (index!46290 lt!624285) (x!127893 lt!624280) (index!46290 lt!624280) (undefined!11786 lt!624280) mask!2840))))

(declare-fun b!1415643 () Bool)

(declare-fun res!951676 () Bool)

(assert (=> b!1415643 (=> (not res!951676) (not e!801216))))

(assert (=> b!1415643 (= res!951676 (and (= (size!47213 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47213 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47213 a!2901)) (not (= i!1037 j!112))))))

(assert (= (and start!121978 res!951677) b!1415643))

(assert (= (and b!1415643 res!951676) b!1415634))

(assert (= (and b!1415634 res!951681) b!1415636))

(assert (= (and b!1415636 res!951684) b!1415635))

(assert (= (and b!1415635 res!951685) b!1415640))

(assert (= (and b!1415640 res!951679) b!1415639))

(assert (= (and b!1415639 res!951678) b!1415638))

(assert (= (and b!1415639 (not res!951683)) b!1415637))

(assert (= (and b!1415637 (not res!951680)) b!1415642))

(assert (= (and b!1415642 res!951682) b!1415641))

(declare-fun m!1305993 () Bool)

(assert (=> b!1415641 m!1305993))

(declare-fun m!1305995 () Bool)

(assert (=> b!1415641 m!1305995))

(assert (=> b!1415641 m!1305995))

(declare-fun m!1305997 () Bool)

(assert (=> b!1415641 m!1305997))

(declare-fun m!1305999 () Bool)

(assert (=> b!1415634 m!1305999))

(assert (=> b!1415634 m!1305999))

(declare-fun m!1306001 () Bool)

(assert (=> b!1415634 m!1306001))

(assert (=> b!1415639 m!1305995))

(declare-fun m!1306003 () Bool)

(assert (=> b!1415639 m!1306003))

(assert (=> b!1415639 m!1305995))

(declare-fun m!1306005 () Bool)

(assert (=> b!1415639 m!1306005))

(assert (=> b!1415639 m!1305995))

(declare-fun m!1306007 () Bool)

(assert (=> b!1415639 m!1306007))

(declare-fun m!1306009 () Bool)

(assert (=> b!1415639 m!1306009))

(assert (=> b!1415638 m!1305995))

(assert (=> b!1415638 m!1305995))

(declare-fun m!1306011 () Bool)

(assert (=> b!1415638 m!1306011))

(assert (=> b!1415636 m!1305995))

(assert (=> b!1415636 m!1305995))

(declare-fun m!1306013 () Bool)

(assert (=> b!1415636 m!1306013))

(declare-fun m!1306015 () Bool)

(assert (=> start!121978 m!1306015))

(declare-fun m!1306017 () Bool)

(assert (=> start!121978 m!1306017))

(declare-fun m!1306019 () Bool)

(assert (=> b!1415642 m!1306019))

(declare-fun m!1306021 () Bool)

(assert (=> b!1415642 m!1306021))

(declare-fun m!1306023 () Bool)

(assert (=> b!1415642 m!1306023))

(declare-fun m!1306025 () Bool)

(assert (=> b!1415637 m!1306025))

(assert (=> b!1415637 m!1306025))

(declare-fun m!1306027 () Bool)

(assert (=> b!1415637 m!1306027))

(assert (=> b!1415637 m!1306019))

(declare-fun m!1306029 () Bool)

(assert (=> b!1415637 m!1306029))

(declare-fun m!1306031 () Bool)

(assert (=> b!1415640 m!1306031))

(declare-fun m!1306033 () Bool)

(assert (=> b!1415635 m!1306033))

(push 1)

