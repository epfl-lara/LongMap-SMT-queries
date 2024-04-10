; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120364 () Bool)

(assert start!120364)

(declare-fun b!1401014 () Bool)

(declare-fun res!939532 () Bool)

(declare-fun e!793264 () Bool)

(assert (=> b!1401014 (=> (not res!939532) (not e!793264))))

(declare-datatypes ((array!95773 0))(
  ( (array!95774 (arr!46237 (Array (_ BitVec 32) (_ BitVec 64))) (size!46787 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95773)

(declare-datatypes ((List!32756 0))(
  ( (Nil!32753) (Cons!32752 (h!34000 (_ BitVec 64)) (t!47450 List!32756)) )
))
(declare-fun arrayNoDuplicates!0 (array!95773 (_ BitVec 32) List!32756) Bool)

(assert (=> b!1401014 (= res!939532 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32753))))

(declare-fun res!939526 () Bool)

(assert (=> start!120364 (=> (not res!939526) (not e!793264))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120364 (= res!939526 (validMask!0 mask!2840))))

(assert (=> start!120364 e!793264))

(assert (=> start!120364 true))

(declare-fun array_inv!35265 (array!95773) Bool)

(assert (=> start!120364 (array_inv!35265 a!2901)))

(declare-fun b!1401015 () Bool)

(declare-fun res!939528 () Bool)

(assert (=> b!1401015 (=> (not res!939528) (not e!793264))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1401015 (= res!939528 (and (= (size!46787 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46787 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46787 a!2901)) (not (= i!1037 j!112))))))

(declare-fun e!793267 () Bool)

(declare-fun b!1401016 () Bool)

(declare-datatypes ((SeekEntryResult!10554 0))(
  ( (MissingZero!10554 (index!44593 (_ BitVec 32))) (Found!10554 (index!44594 (_ BitVec 32))) (Intermediate!10554 (undefined!11366 Bool) (index!44595 (_ BitVec 32)) (x!126229 (_ BitVec 32))) (Undefined!10554) (MissingVacant!10554 (index!44596 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95773 (_ BitVec 32)) SeekEntryResult!10554)

(assert (=> b!1401016 (= e!793267 (= (seekEntryOrOpen!0 (select (arr!46237 a!2901) j!112) a!2901 mask!2840) (Found!10554 j!112)))))

(declare-fun b!1401017 () Bool)

(declare-fun res!939529 () Bool)

(assert (=> b!1401017 (=> (not res!939529) (not e!793264))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95773 (_ BitVec 32)) Bool)

(assert (=> b!1401017 (= res!939529 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1401018 () Bool)

(declare-fun e!793262 () Bool)

(declare-fun e!793268 () Bool)

(assert (=> b!1401018 (= e!793262 e!793268)))

(declare-fun res!939527 () Bool)

(assert (=> b!1401018 (=> res!939527 e!793268)))

(declare-fun lt!616628 () SeekEntryResult!10554)

(declare-fun lt!616625 () SeekEntryResult!10554)

(assert (=> b!1401018 (= res!939527 (or (= lt!616628 lt!616625) (not (is-Intermediate!10554 lt!616625))))))

(declare-fun lt!616623 () (_ BitVec 64))

(declare-fun lt!616624 () array!95773)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95773 (_ BitVec 32)) SeekEntryResult!10554)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1401018 (= lt!616625 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!616623 mask!2840) lt!616623 lt!616624 mask!2840))))

(assert (=> b!1401018 (= lt!616623 (select (store (arr!46237 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1401018 (= lt!616624 (array!95774 (store (arr!46237 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46787 a!2901)))))

(declare-fun b!1401019 () Bool)

(declare-fun e!793266 () Bool)

(assert (=> b!1401019 (= e!793266 true)))

(declare-fun lt!616622 () (_ BitVec 32))

(declare-fun lt!616629 () SeekEntryResult!10554)

(assert (=> b!1401019 (= lt!616629 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!616622 lt!616623 lt!616624 mask!2840))))

(declare-fun b!1401020 () Bool)

(declare-fun res!939531 () Bool)

(assert (=> b!1401020 (=> (not res!939531) (not e!793264))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1401020 (= res!939531 (validKeyInArray!0 (select (arr!46237 a!2901) j!112)))))

(declare-fun b!1401021 () Bool)

(assert (=> b!1401021 (= e!793268 e!793266)))

(declare-fun res!939534 () Bool)

(assert (=> b!1401021 (=> res!939534 e!793266)))

(assert (=> b!1401021 (= res!939534 (or (bvslt (x!126229 lt!616628) #b00000000000000000000000000000000) (bvsgt (x!126229 lt!616628) #b01111111111111111111111111111110) (bvslt (x!126229 lt!616625) #b00000000000000000000000000000000) (bvsgt (x!126229 lt!616625) #b01111111111111111111111111111110) (bvslt lt!616622 #b00000000000000000000000000000000) (bvsge lt!616622 (size!46787 a!2901)) (bvslt (index!44595 lt!616628) #b00000000000000000000000000000000) (bvsge (index!44595 lt!616628) (size!46787 a!2901)) (bvslt (index!44595 lt!616625) #b00000000000000000000000000000000) (bvsge (index!44595 lt!616625) (size!46787 a!2901)) (not (= lt!616628 (Intermediate!10554 false (index!44595 lt!616628) (x!126229 lt!616628)))) (not (= lt!616625 (Intermediate!10554 false (index!44595 lt!616625) (x!126229 lt!616625))))))))

(declare-fun e!793265 () Bool)

(assert (=> b!1401021 e!793265))

(declare-fun res!939525 () Bool)

(assert (=> b!1401021 (=> (not res!939525) (not e!793265))))

(assert (=> b!1401021 (= res!939525 (and (not (undefined!11366 lt!616625)) (= (index!44595 lt!616625) i!1037) (bvslt (x!126229 lt!616625) (x!126229 lt!616628)) (= (select (store (arr!46237 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44595 lt!616625)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((Unit!47112 0))(
  ( (Unit!47113) )
))
(declare-fun lt!616626 () Unit!47112)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95773 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47112)

(assert (=> b!1401021 (= lt!616626 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!616622 (x!126229 lt!616628) (index!44595 lt!616628) (x!126229 lt!616625) (index!44595 lt!616625) (undefined!11366 lt!616625) mask!2840))))

(declare-fun b!1401022 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95773 (_ BitVec 32)) SeekEntryResult!10554)

(assert (=> b!1401022 (= e!793265 (= (seekEntryOrOpen!0 lt!616623 lt!616624 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!126229 lt!616625) (index!44595 lt!616625) (index!44595 lt!616625) (select (arr!46237 a!2901) j!112) lt!616624 mask!2840)))))

(declare-fun b!1401023 () Bool)

(declare-fun res!939533 () Bool)

(assert (=> b!1401023 (=> (not res!939533) (not e!793264))))

(assert (=> b!1401023 (= res!939533 (validKeyInArray!0 (select (arr!46237 a!2901) i!1037)))))

(declare-fun b!1401024 () Bool)

(assert (=> b!1401024 (= e!793264 (not e!793262))))

(declare-fun res!939535 () Bool)

(assert (=> b!1401024 (=> res!939535 e!793262)))

(assert (=> b!1401024 (= res!939535 (or (not (is-Intermediate!10554 lt!616628)) (undefined!11366 lt!616628)))))

(assert (=> b!1401024 e!793267))

(declare-fun res!939530 () Bool)

(assert (=> b!1401024 (=> (not res!939530) (not e!793267))))

(assert (=> b!1401024 (= res!939530 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-fun lt!616627 () Unit!47112)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95773 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47112)

(assert (=> b!1401024 (= lt!616627 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1401024 (= lt!616628 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!616622 (select (arr!46237 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1401024 (= lt!616622 (toIndex!0 (select (arr!46237 a!2901) j!112) mask!2840))))

(assert (= (and start!120364 res!939526) b!1401015))

(assert (= (and b!1401015 res!939528) b!1401023))

(assert (= (and b!1401023 res!939533) b!1401020))

(assert (= (and b!1401020 res!939531) b!1401017))

(assert (= (and b!1401017 res!939529) b!1401014))

(assert (= (and b!1401014 res!939532) b!1401024))

(assert (= (and b!1401024 res!939530) b!1401016))

(assert (= (and b!1401024 (not res!939535)) b!1401018))

(assert (= (and b!1401018 (not res!939527)) b!1401021))

(assert (= (and b!1401021 res!939525) b!1401022))

(assert (= (and b!1401021 (not res!939534)) b!1401019))

(declare-fun m!1288657 () Bool)

(assert (=> b!1401024 m!1288657))

(declare-fun m!1288659 () Bool)

(assert (=> b!1401024 m!1288659))

(assert (=> b!1401024 m!1288657))

(assert (=> b!1401024 m!1288657))

(declare-fun m!1288661 () Bool)

(assert (=> b!1401024 m!1288661))

(declare-fun m!1288663 () Bool)

(assert (=> b!1401024 m!1288663))

(declare-fun m!1288665 () Bool)

(assert (=> b!1401024 m!1288665))

(declare-fun m!1288667 () Bool)

(assert (=> b!1401014 m!1288667))

(declare-fun m!1288669 () Bool)

(assert (=> start!120364 m!1288669))

(declare-fun m!1288671 () Bool)

(assert (=> start!120364 m!1288671))

(declare-fun m!1288673 () Bool)

(assert (=> b!1401023 m!1288673))

(assert (=> b!1401023 m!1288673))

(declare-fun m!1288675 () Bool)

(assert (=> b!1401023 m!1288675))

(declare-fun m!1288677 () Bool)

(assert (=> b!1401022 m!1288677))

(assert (=> b!1401022 m!1288657))

(assert (=> b!1401022 m!1288657))

(declare-fun m!1288679 () Bool)

(assert (=> b!1401022 m!1288679))

(assert (=> b!1401016 m!1288657))

(assert (=> b!1401016 m!1288657))

(declare-fun m!1288681 () Bool)

(assert (=> b!1401016 m!1288681))

(assert (=> b!1401020 m!1288657))

(assert (=> b!1401020 m!1288657))

(declare-fun m!1288683 () Bool)

(assert (=> b!1401020 m!1288683))

(declare-fun m!1288685 () Bool)

(assert (=> b!1401017 m!1288685))

(declare-fun m!1288687 () Bool)

(assert (=> b!1401018 m!1288687))

(assert (=> b!1401018 m!1288687))

(declare-fun m!1288689 () Bool)

(assert (=> b!1401018 m!1288689))

(declare-fun m!1288691 () Bool)

(assert (=> b!1401018 m!1288691))

(declare-fun m!1288693 () Bool)

(assert (=> b!1401018 m!1288693))

(assert (=> b!1401021 m!1288691))

(declare-fun m!1288695 () Bool)

(assert (=> b!1401021 m!1288695))

(declare-fun m!1288697 () Bool)

(assert (=> b!1401021 m!1288697))

(declare-fun m!1288699 () Bool)

(assert (=> b!1401019 m!1288699))

(push 1)

