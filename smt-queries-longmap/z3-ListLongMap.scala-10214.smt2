; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120524 () Bool)

(assert start!120524)

(declare-fun b!1401693 () Bool)

(declare-fun e!793708 () Bool)

(declare-fun e!793706 () Bool)

(assert (=> b!1401693 (= e!793708 (not e!793706))))

(declare-fun res!939519 () Bool)

(assert (=> b!1401693 (=> res!939519 e!793706)))

(declare-datatypes ((SeekEntryResult!10496 0))(
  ( (MissingZero!10496 (index!44361 (_ BitVec 32))) (Found!10496 (index!44362 (_ BitVec 32))) (Intermediate!10496 (undefined!11308 Bool) (index!44363 (_ BitVec 32)) (x!126158 (_ BitVec 32))) (Undefined!10496) (MissingVacant!10496 (index!44364 (_ BitVec 32))) )
))
(declare-fun lt!616684 () SeekEntryResult!10496)

(get-info :version)

(assert (=> b!1401693 (= res!939519 (or (not ((_ is Intermediate!10496) lt!616684)) (undefined!11308 lt!616684)))))

(declare-fun e!793707 () Bool)

(assert (=> b!1401693 e!793707))

(declare-fun res!939522 () Bool)

(assert (=> b!1401693 (=> (not res!939522) (not e!793707))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95855 0))(
  ( (array!95856 (arr!46276 (Array (_ BitVec 32) (_ BitVec 64))) (size!46827 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95855)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95855 (_ BitVec 32)) Bool)

(assert (=> b!1401693 (= res!939522 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47023 0))(
  ( (Unit!47024) )
))
(declare-fun lt!616691 () Unit!47023)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95855 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47023)

(assert (=> b!1401693 (= lt!616691 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!616686 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95855 (_ BitVec 32)) SeekEntryResult!10496)

(assert (=> b!1401693 (= lt!616684 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!616686 (select (arr!46276 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1401693 (= lt!616686 (toIndex!0 (select (arr!46276 a!2901) j!112) mask!2840))))

(declare-fun b!1401694 () Bool)

(declare-fun res!939526 () Bool)

(assert (=> b!1401694 (=> (not res!939526) (not e!793708))))

(assert (=> b!1401694 (= res!939526 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1401695 () Bool)

(declare-fun res!939524 () Bool)

(assert (=> b!1401695 (=> (not res!939524) (not e!793708))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1401695 (= res!939524 (validKeyInArray!0 (select (arr!46276 a!2901) i!1037)))))

(declare-fun b!1401696 () Bool)

(declare-fun res!939520 () Bool)

(assert (=> b!1401696 (=> (not res!939520) (not e!793708))))

(assert (=> b!1401696 (= res!939520 (and (= (size!46827 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46827 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46827 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1401697 () Bool)

(declare-fun res!939527 () Bool)

(assert (=> b!1401697 (=> (not res!939527) (not e!793708))))

(declare-datatypes ((List!32782 0))(
  ( (Nil!32779) (Cons!32778 (h!34034 (_ BitVec 64)) (t!47468 List!32782)) )
))
(declare-fun arrayNoDuplicates!0 (array!95855 (_ BitVec 32) List!32782) Bool)

(assert (=> b!1401697 (= res!939527 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32779))))

(declare-fun b!1401698 () Bool)

(declare-fun e!793710 () Bool)

(declare-fun e!793709 () Bool)

(assert (=> b!1401698 (= e!793710 e!793709)))

(declare-fun res!939521 () Bool)

(assert (=> b!1401698 (=> res!939521 e!793709)))

(declare-fun lt!616689 () SeekEntryResult!10496)

(assert (=> b!1401698 (= res!939521 (or (bvslt (x!126158 lt!616684) #b00000000000000000000000000000000) (bvsgt (x!126158 lt!616684) #b01111111111111111111111111111110) (bvslt (x!126158 lt!616689) #b00000000000000000000000000000000) (bvsgt (x!126158 lt!616689) #b01111111111111111111111111111110) (bvslt lt!616686 #b00000000000000000000000000000000) (bvsge lt!616686 (size!46827 a!2901)) (bvslt (index!44363 lt!616684) #b00000000000000000000000000000000) (bvsge (index!44363 lt!616684) (size!46827 a!2901)) (bvslt (index!44363 lt!616689) #b00000000000000000000000000000000) (bvsge (index!44363 lt!616689) (size!46827 a!2901)) (not (= lt!616684 (Intermediate!10496 false (index!44363 lt!616684) (x!126158 lt!616684)))) (not (= lt!616689 (Intermediate!10496 false (index!44363 lt!616689) (x!126158 lt!616689))))))))

(declare-fun e!793712 () Bool)

(assert (=> b!1401698 e!793712))

(declare-fun res!939525 () Bool)

(assert (=> b!1401698 (=> (not res!939525) (not e!793712))))

(assert (=> b!1401698 (= res!939525 (and (not (undefined!11308 lt!616689)) (= (index!44363 lt!616689) i!1037) (bvslt (x!126158 lt!616689) (x!126158 lt!616684)) (= (select (store (arr!46276 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44363 lt!616689)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!616690 () Unit!47023)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95855 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47023)

(assert (=> b!1401698 (= lt!616690 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!616686 (x!126158 lt!616684) (index!44363 lt!616684) (x!126158 lt!616689) (index!44363 lt!616689) (undefined!11308 lt!616689) mask!2840))))

(declare-fun b!1401699 () Bool)

(declare-fun lt!616685 () (_ BitVec 64))

(declare-fun lt!616688 () array!95855)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95855 (_ BitVec 32)) SeekEntryResult!10496)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95855 (_ BitVec 32)) SeekEntryResult!10496)

(assert (=> b!1401699 (= e!793712 (= (seekEntryOrOpen!0 lt!616685 lt!616688 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!126158 lt!616689) (index!44363 lt!616689) (index!44363 lt!616689) (select (arr!46276 a!2901) j!112) lt!616688 mask!2840)))))

(declare-fun b!1401700 () Bool)

(assert (=> b!1401700 (= e!793709 true)))

(declare-fun lt!616687 () SeekEntryResult!10496)

(assert (=> b!1401700 (= lt!616687 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!616686 lt!616685 lt!616688 mask!2840))))

(declare-fun b!1401701 () Bool)

(assert (=> b!1401701 (= e!793707 (= (seekEntryOrOpen!0 (select (arr!46276 a!2901) j!112) a!2901 mask!2840) (Found!10496 j!112)))))

(declare-fun b!1401702 () Bool)

(declare-fun res!939523 () Bool)

(assert (=> b!1401702 (=> (not res!939523) (not e!793708))))

(assert (=> b!1401702 (= res!939523 (validKeyInArray!0 (select (arr!46276 a!2901) j!112)))))

(declare-fun res!939529 () Bool)

(assert (=> start!120524 (=> (not res!939529) (not e!793708))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120524 (= res!939529 (validMask!0 mask!2840))))

(assert (=> start!120524 e!793708))

(assert (=> start!120524 true))

(declare-fun array_inv!35557 (array!95855) Bool)

(assert (=> start!120524 (array_inv!35557 a!2901)))

(declare-fun b!1401692 () Bool)

(assert (=> b!1401692 (= e!793706 e!793710)))

(declare-fun res!939528 () Bool)

(assert (=> b!1401692 (=> res!939528 e!793710)))

(assert (=> b!1401692 (= res!939528 (or (= lt!616684 lt!616689) (not ((_ is Intermediate!10496) lt!616689))))))

(assert (=> b!1401692 (= lt!616689 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!616685 mask!2840) lt!616685 lt!616688 mask!2840))))

(assert (=> b!1401692 (= lt!616685 (select (store (arr!46276 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1401692 (= lt!616688 (array!95856 (store (arr!46276 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46827 a!2901)))))

(assert (= (and start!120524 res!939529) b!1401696))

(assert (= (and b!1401696 res!939520) b!1401695))

(assert (= (and b!1401695 res!939524) b!1401702))

(assert (= (and b!1401702 res!939523) b!1401694))

(assert (= (and b!1401694 res!939526) b!1401697))

(assert (= (and b!1401697 res!939527) b!1401693))

(assert (= (and b!1401693 res!939522) b!1401701))

(assert (= (and b!1401693 (not res!939519)) b!1401692))

(assert (= (and b!1401692 (not res!939528)) b!1401698))

(assert (= (and b!1401698 res!939525) b!1401699))

(assert (= (and b!1401698 (not res!939521)) b!1401700))

(declare-fun m!1289413 () Bool)

(assert (=> b!1401694 m!1289413))

(declare-fun m!1289415 () Bool)

(assert (=> b!1401699 m!1289415))

(declare-fun m!1289417 () Bool)

(assert (=> b!1401699 m!1289417))

(assert (=> b!1401699 m!1289417))

(declare-fun m!1289419 () Bool)

(assert (=> b!1401699 m!1289419))

(declare-fun m!1289421 () Bool)

(assert (=> b!1401700 m!1289421))

(declare-fun m!1289423 () Bool)

(assert (=> b!1401692 m!1289423))

(assert (=> b!1401692 m!1289423))

(declare-fun m!1289425 () Bool)

(assert (=> b!1401692 m!1289425))

(declare-fun m!1289427 () Bool)

(assert (=> b!1401692 m!1289427))

(declare-fun m!1289429 () Bool)

(assert (=> b!1401692 m!1289429))

(declare-fun m!1289431 () Bool)

(assert (=> b!1401695 m!1289431))

(assert (=> b!1401695 m!1289431))

(declare-fun m!1289433 () Bool)

(assert (=> b!1401695 m!1289433))

(assert (=> b!1401693 m!1289417))

(declare-fun m!1289435 () Bool)

(assert (=> b!1401693 m!1289435))

(assert (=> b!1401693 m!1289417))

(declare-fun m!1289437 () Bool)

(assert (=> b!1401693 m!1289437))

(declare-fun m!1289439 () Bool)

(assert (=> b!1401693 m!1289439))

(assert (=> b!1401693 m!1289417))

(declare-fun m!1289441 () Bool)

(assert (=> b!1401693 m!1289441))

(declare-fun m!1289443 () Bool)

(assert (=> b!1401697 m!1289443))

(assert (=> b!1401701 m!1289417))

(assert (=> b!1401701 m!1289417))

(declare-fun m!1289445 () Bool)

(assert (=> b!1401701 m!1289445))

(declare-fun m!1289447 () Bool)

(assert (=> start!120524 m!1289447))

(declare-fun m!1289449 () Bool)

(assert (=> start!120524 m!1289449))

(assert (=> b!1401698 m!1289427))

(declare-fun m!1289451 () Bool)

(assert (=> b!1401698 m!1289451))

(declare-fun m!1289453 () Bool)

(assert (=> b!1401698 m!1289453))

(assert (=> b!1401702 m!1289417))

(assert (=> b!1401702 m!1289417))

(declare-fun m!1289455 () Bool)

(assert (=> b!1401702 m!1289455))

(check-sat (not b!1401697) (not b!1401694) (not b!1401698) (not b!1401692) (not b!1401702) (not b!1401701) (not b!1401693) (not b!1401700) (not start!120524) (not b!1401699) (not b!1401695))
(check-sat)
