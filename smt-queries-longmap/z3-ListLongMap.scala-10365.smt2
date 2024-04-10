; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122006 () Bool)

(assert start!122006)

(declare-fun b!1416082 () Bool)

(declare-fun e!801479 () Bool)

(declare-fun e!801481 () Bool)

(assert (=> b!1416082 (= e!801479 e!801481)))

(declare-fun res!952123 () Bool)

(assert (=> b!1416082 (=> res!952123 e!801481)))

(declare-datatypes ((SeekEntryResult!10988 0))(
  ( (MissingZero!10988 (index!46344 (_ BitVec 32))) (Found!10988 (index!46345 (_ BitVec 32))) (Intermediate!10988 (undefined!11800 Bool) (index!46346 (_ BitVec 32)) (x!127947 (_ BitVec 32))) (Undefined!10988) (MissingVacant!10988 (index!46347 (_ BitVec 32))) )
))
(declare-fun lt!624640 () SeekEntryResult!10988)

(declare-fun lt!624639 () SeekEntryResult!10988)

(get-info :version)

(assert (=> b!1416082 (= res!952123 (or (= lt!624640 lt!624639) (not ((_ is Intermediate!10988) lt!624639))))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96692 0))(
  ( (array!96693 (arr!46677 (Array (_ BitVec 32) (_ BitVec 64))) (size!47227 (_ BitVec 32))) )
))
(declare-fun lt!624638 () array!96692)

(declare-fun lt!624641 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96692 (_ BitVec 32)) SeekEntryResult!10988)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1416082 (= lt!624639 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!624641 mask!2840) lt!624641 lt!624638 mask!2840))))

(declare-fun a!2901 () array!96692)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1416082 (= lt!624641 (select (store (arr!46677 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1416082 (= lt!624638 (array!96693 (store (arr!46677 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47227 a!2901)))))

(declare-fun b!1416083 () Bool)

(declare-fun res!952124 () Bool)

(declare-fun e!801480 () Bool)

(assert (=> b!1416083 (=> (not res!952124) (not e!801480))))

(assert (=> b!1416083 (= res!952124 (and (= (size!47227 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47227 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47227 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1416084 () Bool)

(declare-fun e!801478 () Bool)

(assert (=> b!1416084 (= e!801481 e!801478)))

(declare-fun res!952128 () Bool)

(assert (=> b!1416084 (=> res!952128 e!801478)))

(declare-fun lt!624633 () (_ BitVec 32))

(assert (=> b!1416084 (= res!952128 (or (bvslt (x!127947 lt!624640) #b00000000000000000000000000000000) (bvsgt (x!127947 lt!624640) #b01111111111111111111111111111110) (bvslt (x!127947 lt!624639) #b00000000000000000000000000000000) (bvsgt (x!127947 lt!624639) #b01111111111111111111111111111110) (bvslt lt!624633 #b00000000000000000000000000000000) (bvsge lt!624633 (size!47227 a!2901)) (bvslt (index!46346 lt!624640) #b00000000000000000000000000000000) (bvsge (index!46346 lt!624640) (size!47227 a!2901)) (bvslt (index!46346 lt!624639) #b00000000000000000000000000000000) (bvsge (index!46346 lt!624639) (size!47227 a!2901)) (not (= lt!624640 (Intermediate!10988 false (index!46346 lt!624640) (x!127947 lt!624640)))) (not (= lt!624639 (Intermediate!10988 false (index!46346 lt!624639) (x!127947 lt!624639))))))))

(declare-fun lt!624634 () SeekEntryResult!10988)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96692 (_ BitVec 32)) SeekEntryResult!10988)

(assert (=> b!1416084 (= lt!624634 (seekKeyOrZeroReturnVacant!0 (x!127947 lt!624639) (index!46346 lt!624639) (index!46346 lt!624639) (select (arr!46677 a!2901) j!112) lt!624638 mask!2840))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96692 (_ BitVec 32)) SeekEntryResult!10988)

(assert (=> b!1416084 (= lt!624634 (seekEntryOrOpen!0 lt!624641 lt!624638 mask!2840))))

(assert (=> b!1416084 (and (not (undefined!11800 lt!624639)) (= (index!46346 lt!624639) i!1037) (bvslt (x!127947 lt!624639) (x!127947 lt!624640)) (= (select (store (arr!46677 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!46346 lt!624639)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!47950 0))(
  ( (Unit!47951) )
))
(declare-fun lt!624642 () Unit!47950)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96692 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47950)

(assert (=> b!1416084 (= lt!624642 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!624633 (x!127947 lt!624640) (index!46346 lt!624640) (x!127947 lt!624639) (index!46346 lt!624639) (undefined!11800 lt!624639) mask!2840))))

(declare-fun b!1416085 () Bool)

(assert (=> b!1416085 (= e!801478 true)))

(declare-fun lt!624637 () SeekEntryResult!10988)

(assert (=> b!1416085 (= lt!624637 lt!624634)))

(declare-fun lt!624636 () Unit!47950)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 (array!96692 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47950)

(assert (=> b!1416085 (= lt!624636 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!624633 (x!127947 lt!624640) (index!46346 lt!624640) (x!127947 lt!624639) (index!46346 lt!624639) mask!2840))))

(declare-fun b!1416086 () Bool)

(declare-fun res!952126 () Bool)

(assert (=> b!1416086 (=> (not res!952126) (not e!801480))))

(declare-datatypes ((List!33196 0))(
  ( (Nil!33193) (Cons!33192 (h!34479 (_ BitVec 64)) (t!47890 List!33196)) )
))
(declare-fun arrayNoDuplicates!0 (array!96692 (_ BitVec 32) List!33196) Bool)

(assert (=> b!1416086 (= res!952126 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33193))))

(declare-fun b!1416087 () Bool)

(declare-fun res!952130 () Bool)

(assert (=> b!1416087 (=> (not res!952130) (not e!801480))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1416087 (= res!952130 (validKeyInArray!0 (select (arr!46677 a!2901) j!112)))))

(declare-fun b!1416088 () Bool)

(declare-fun res!952127 () Bool)

(assert (=> b!1416088 (=> (not res!952127) (not e!801480))))

(assert (=> b!1416088 (= res!952127 (validKeyInArray!0 (select (arr!46677 a!2901) i!1037)))))

(declare-fun b!1416089 () Bool)

(declare-fun res!952131 () Bool)

(assert (=> b!1416089 (=> (not res!952131) (not e!801480))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96692 (_ BitVec 32)) Bool)

(assert (=> b!1416089 (= res!952131 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1416090 () Bool)

(declare-fun res!952132 () Bool)

(assert (=> b!1416090 (=> res!952132 e!801478)))

(assert (=> b!1416090 (= res!952132 (not (= lt!624639 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!624633 lt!624641 lt!624638 mask!2840))))))

(declare-fun res!952125 () Bool)

(assert (=> start!122006 (=> (not res!952125) (not e!801480))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122006 (= res!952125 (validMask!0 mask!2840))))

(assert (=> start!122006 e!801480))

(assert (=> start!122006 true))

(declare-fun array_inv!35705 (array!96692) Bool)

(assert (=> start!122006 (array_inv!35705 a!2901)))

(declare-fun b!1416081 () Bool)

(assert (=> b!1416081 (= e!801480 (not e!801479))))

(declare-fun res!952129 () Bool)

(assert (=> b!1416081 (=> res!952129 e!801479)))

(assert (=> b!1416081 (= res!952129 (or (not ((_ is Intermediate!10988) lt!624640)) (undefined!11800 lt!624640)))))

(assert (=> b!1416081 (= lt!624637 (Found!10988 j!112))))

(assert (=> b!1416081 (= lt!624637 (seekEntryOrOpen!0 (select (arr!46677 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1416081 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!624635 () Unit!47950)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96692 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47950)

(assert (=> b!1416081 (= lt!624635 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1416081 (= lt!624640 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!624633 (select (arr!46677 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1416081 (= lt!624633 (toIndex!0 (select (arr!46677 a!2901) j!112) mask!2840))))

(assert (= (and start!122006 res!952125) b!1416083))

(assert (= (and b!1416083 res!952124) b!1416088))

(assert (= (and b!1416088 res!952127) b!1416087))

(assert (= (and b!1416087 res!952130) b!1416089))

(assert (= (and b!1416089 res!952131) b!1416086))

(assert (= (and b!1416086 res!952126) b!1416081))

(assert (= (and b!1416081 (not res!952129)) b!1416082))

(assert (= (and b!1416082 (not res!952123)) b!1416084))

(assert (= (and b!1416084 (not res!952128)) b!1416090))

(assert (= (and b!1416090 (not res!952132)) b!1416085))

(declare-fun m!1306615 () Bool)

(assert (=> b!1416084 m!1306615))

(declare-fun m!1306617 () Bool)

(assert (=> b!1416084 m!1306617))

(declare-fun m!1306619 () Bool)

(assert (=> b!1416084 m!1306619))

(declare-fun m!1306621 () Bool)

(assert (=> b!1416084 m!1306621))

(assert (=> b!1416084 m!1306617))

(declare-fun m!1306623 () Bool)

(assert (=> b!1416084 m!1306623))

(declare-fun m!1306625 () Bool)

(assert (=> b!1416084 m!1306625))

(declare-fun m!1306627 () Bool)

(assert (=> b!1416085 m!1306627))

(declare-fun m!1306629 () Bool)

(assert (=> b!1416089 m!1306629))

(assert (=> b!1416081 m!1306617))

(declare-fun m!1306631 () Bool)

(assert (=> b!1416081 m!1306631))

(assert (=> b!1416081 m!1306617))

(declare-fun m!1306633 () Bool)

(assert (=> b!1416081 m!1306633))

(declare-fun m!1306635 () Bool)

(assert (=> b!1416081 m!1306635))

(assert (=> b!1416081 m!1306617))

(declare-fun m!1306637 () Bool)

(assert (=> b!1416081 m!1306637))

(assert (=> b!1416081 m!1306617))

(declare-fun m!1306639 () Bool)

(assert (=> b!1416081 m!1306639))

(assert (=> b!1416087 m!1306617))

(assert (=> b!1416087 m!1306617))

(declare-fun m!1306641 () Bool)

(assert (=> b!1416087 m!1306641))

(declare-fun m!1306643 () Bool)

(assert (=> b!1416086 m!1306643))

(declare-fun m!1306645 () Bool)

(assert (=> b!1416088 m!1306645))

(assert (=> b!1416088 m!1306645))

(declare-fun m!1306647 () Bool)

(assert (=> b!1416088 m!1306647))

(declare-fun m!1306649 () Bool)

(assert (=> b!1416082 m!1306649))

(assert (=> b!1416082 m!1306649))

(declare-fun m!1306651 () Bool)

(assert (=> b!1416082 m!1306651))

(assert (=> b!1416082 m!1306625))

(declare-fun m!1306653 () Bool)

(assert (=> b!1416082 m!1306653))

(declare-fun m!1306655 () Bool)

(assert (=> start!122006 m!1306655))

(declare-fun m!1306657 () Bool)

(assert (=> start!122006 m!1306657))

(declare-fun m!1306659 () Bool)

(assert (=> b!1416090 m!1306659))

(check-sat (not b!1416081) (not b!1416086) (not b!1416090) (not b!1416084) (not b!1416082) (not b!1416088) (not b!1416089) (not b!1416085) (not b!1416087) (not start!122006))
(check-sat)
