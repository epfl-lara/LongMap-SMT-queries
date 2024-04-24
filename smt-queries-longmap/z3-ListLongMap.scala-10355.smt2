; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122132 () Bool)

(assert start!122132)

(declare-fun b!1416264 () Bool)

(declare-fun res!951626 () Bool)

(declare-fun e!801649 () Bool)

(assert (=> b!1416264 (=> (not res!951626) (not e!801649))))

(declare-datatypes ((array!96740 0))(
  ( (array!96741 (arr!46699 (Array (_ BitVec 32) (_ BitVec 64))) (size!47250 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96740)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1416264 (= res!951626 (validKeyInArray!0 (select (arr!46699 a!2901) j!112)))))

(declare-fun b!1416265 () Bool)

(declare-fun res!951629 () Bool)

(assert (=> b!1416265 (=> (not res!951629) (not e!801649))))

(declare-datatypes ((List!33205 0))(
  ( (Nil!33202) (Cons!33201 (h!34496 (_ BitVec 64)) (t!47891 List!33205)) )
))
(declare-fun arrayNoDuplicates!0 (array!96740 (_ BitVec 32) List!33205) Bool)

(assert (=> b!1416265 (= res!951629 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33202))))

(declare-fun b!1416266 () Bool)

(declare-fun e!801646 () Bool)

(assert (=> b!1416266 (= e!801649 (not e!801646))))

(declare-fun res!951631 () Bool)

(assert (=> b!1416266 (=> res!951631 e!801646)))

(declare-datatypes ((SeekEntryResult!10913 0))(
  ( (MissingZero!10913 (index!46044 (_ BitVec 32))) (Found!10913 (index!46045 (_ BitVec 32))) (Intermediate!10913 (undefined!11725 Bool) (index!46046 (_ BitVec 32)) (x!127811 (_ BitVec 32))) (Undefined!10913) (MissingVacant!10913 (index!46047 (_ BitVec 32))) )
))
(declare-fun lt!624325 () SeekEntryResult!10913)

(get-info :version)

(assert (=> b!1416266 (= res!951631 (or (not ((_ is Intermediate!10913) lt!624325)) (undefined!11725 lt!624325)))))

(declare-fun e!801648 () Bool)

(assert (=> b!1416266 e!801648))

(declare-fun res!951622 () Bool)

(assert (=> b!1416266 (=> (not res!951622) (not e!801648))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96740 (_ BitVec 32)) Bool)

(assert (=> b!1416266 (= res!951622 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47827 0))(
  ( (Unit!47828) )
))
(declare-fun lt!624320 () Unit!47827)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96740 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47827)

(assert (=> b!1416266 (= lt!624320 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!624324 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96740 (_ BitVec 32)) SeekEntryResult!10913)

(assert (=> b!1416266 (= lt!624325 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!624324 (select (arr!46699 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1416266 (= lt!624324 (toIndex!0 (select (arr!46699 a!2901) j!112) mask!2840))))

(declare-fun res!951623 () Bool)

(assert (=> start!122132 (=> (not res!951623) (not e!801649))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122132 (= res!951623 (validMask!0 mask!2840))))

(assert (=> start!122132 e!801649))

(assert (=> start!122132 true))

(declare-fun array_inv!35980 (array!96740) Bool)

(assert (=> start!122132 (array_inv!35980 a!2901)))

(declare-fun b!1416267 () Bool)

(declare-fun res!951627 () Bool)

(assert (=> b!1416267 (=> (not res!951627) (not e!801649))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1416267 (= res!951627 (and (= (size!47250 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47250 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47250 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1416268 () Bool)

(declare-fun res!951630 () Bool)

(assert (=> b!1416268 (=> (not res!951630) (not e!801649))))

(assert (=> b!1416268 (= res!951630 (validKeyInArray!0 (select (arr!46699 a!2901) i!1037)))))

(declare-fun b!1416269 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96740 (_ BitVec 32)) SeekEntryResult!10913)

(assert (=> b!1416269 (= e!801648 (= (seekEntryOrOpen!0 (select (arr!46699 a!2901) j!112) a!2901 mask!2840) (Found!10913 j!112)))))

(declare-fun b!1416270 () Bool)

(declare-fun lt!624321 () SeekEntryResult!10913)

(declare-fun e!801647 () Bool)

(assert (=> b!1416270 (= e!801647 (or (bvslt (x!127811 lt!624325) #b00000000000000000000000000000000) (bvsgt (x!127811 lt!624325) #b01111111111111111111111111111110) (bvslt (x!127811 lt!624321) #b00000000000000000000000000000000) (bvsgt (x!127811 lt!624321) #b01111111111111111111111111111110) (bvslt lt!624324 #b00000000000000000000000000000000) (bvsge lt!624324 (size!47250 a!2901)) (bvslt (index!46046 lt!624325) #b00000000000000000000000000000000) (bvsge (index!46046 lt!624325) (size!47250 a!2901)) (and (bvsge (index!46046 lt!624321) #b00000000000000000000000000000000) (bvslt (index!46046 lt!624321) (size!47250 a!2901)))))))

(declare-fun e!801645 () Bool)

(assert (=> b!1416270 e!801645))

(declare-fun res!951625 () Bool)

(assert (=> b!1416270 (=> (not res!951625) (not e!801645))))

(assert (=> b!1416270 (= res!951625 (and (not (undefined!11725 lt!624321)) (= (index!46046 lt!624321) i!1037) (bvslt (x!127811 lt!624321) (x!127811 lt!624325)) (= (select (store (arr!46699 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!46046 lt!624321)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!624322 () Unit!47827)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96740 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47827)

(assert (=> b!1416270 (= lt!624322 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!624324 (x!127811 lt!624325) (index!46046 lt!624325) (x!127811 lt!624321) (index!46046 lt!624321) (undefined!11725 lt!624321) mask!2840))))

(declare-fun b!1416271 () Bool)

(declare-fun res!951624 () Bool)

(assert (=> b!1416271 (=> (not res!951624) (not e!801649))))

(assert (=> b!1416271 (= res!951624 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1416272 () Bool)

(assert (=> b!1416272 (= e!801646 e!801647)))

(declare-fun res!951628 () Bool)

(assert (=> b!1416272 (=> res!951628 e!801647)))

(assert (=> b!1416272 (= res!951628 (or (= lt!624325 lt!624321) (not ((_ is Intermediate!10913) lt!624321))))))

(declare-fun lt!624323 () (_ BitVec 64))

(declare-fun lt!624326 () array!96740)

(assert (=> b!1416272 (= lt!624321 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!624323 mask!2840) lt!624323 lt!624326 mask!2840))))

(assert (=> b!1416272 (= lt!624323 (select (store (arr!46699 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1416272 (= lt!624326 (array!96741 (store (arr!46699 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47250 a!2901)))))

(declare-fun b!1416273 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96740 (_ BitVec 32)) SeekEntryResult!10913)

(assert (=> b!1416273 (= e!801645 (= (seekEntryOrOpen!0 lt!624323 lt!624326 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!127811 lt!624321) (index!46046 lt!624321) (index!46046 lt!624321) (select (arr!46699 a!2901) j!112) lt!624326 mask!2840)))))

(assert (= (and start!122132 res!951623) b!1416267))

(assert (= (and b!1416267 res!951627) b!1416268))

(assert (= (and b!1416268 res!951630) b!1416264))

(assert (= (and b!1416264 res!951626) b!1416271))

(assert (= (and b!1416271 res!951624) b!1416265))

(assert (= (and b!1416265 res!951629) b!1416266))

(assert (= (and b!1416266 res!951622) b!1416269))

(assert (= (and b!1416266 (not res!951631)) b!1416272))

(assert (= (and b!1416272 (not res!951628)) b!1416270))

(assert (= (and b!1416270 res!951625) b!1416273))

(declare-fun m!1306651 () Bool)

(assert (=> b!1416268 m!1306651))

(assert (=> b!1416268 m!1306651))

(declare-fun m!1306653 () Bool)

(assert (=> b!1416268 m!1306653))

(declare-fun m!1306655 () Bool)

(assert (=> b!1416264 m!1306655))

(assert (=> b!1416264 m!1306655))

(declare-fun m!1306657 () Bool)

(assert (=> b!1416264 m!1306657))

(assert (=> b!1416269 m!1306655))

(assert (=> b!1416269 m!1306655))

(declare-fun m!1306659 () Bool)

(assert (=> b!1416269 m!1306659))

(declare-fun m!1306661 () Bool)

(assert (=> b!1416272 m!1306661))

(assert (=> b!1416272 m!1306661))

(declare-fun m!1306663 () Bool)

(assert (=> b!1416272 m!1306663))

(declare-fun m!1306665 () Bool)

(assert (=> b!1416272 m!1306665))

(declare-fun m!1306667 () Bool)

(assert (=> b!1416272 m!1306667))

(declare-fun m!1306669 () Bool)

(assert (=> b!1416273 m!1306669))

(assert (=> b!1416273 m!1306655))

(assert (=> b!1416273 m!1306655))

(declare-fun m!1306671 () Bool)

(assert (=> b!1416273 m!1306671))

(declare-fun m!1306673 () Bool)

(assert (=> start!122132 m!1306673))

(declare-fun m!1306675 () Bool)

(assert (=> start!122132 m!1306675))

(declare-fun m!1306677 () Bool)

(assert (=> b!1416265 m!1306677))

(declare-fun m!1306679 () Bool)

(assert (=> b!1416271 m!1306679))

(assert (=> b!1416270 m!1306665))

(declare-fun m!1306681 () Bool)

(assert (=> b!1416270 m!1306681))

(declare-fun m!1306683 () Bool)

(assert (=> b!1416270 m!1306683))

(assert (=> b!1416266 m!1306655))

(declare-fun m!1306685 () Bool)

(assert (=> b!1416266 m!1306685))

(assert (=> b!1416266 m!1306655))

(assert (=> b!1416266 m!1306655))

(declare-fun m!1306687 () Bool)

(assert (=> b!1416266 m!1306687))

(declare-fun m!1306689 () Bool)

(assert (=> b!1416266 m!1306689))

(declare-fun m!1306691 () Bool)

(assert (=> b!1416266 m!1306691))

(check-sat (not b!1416273) (not b!1416271) (not b!1416264) (not b!1416272) (not b!1416269) (not b!1416265) (not start!122132) (not b!1416266) (not b!1416268) (not b!1416270))
(check-sat)
