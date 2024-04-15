; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121464 () Bool)

(assert start!121464)

(declare-fun res!948567 () Bool)

(declare-fun e!798643 () Bool)

(assert (=> start!121464 (=> (not res!948567) (not e!798643))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121464 (= res!948567 (validMask!0 mask!2840))))

(assert (=> start!121464 e!798643))

(assert (=> start!121464 true))

(declare-datatypes ((array!96418 0))(
  ( (array!96419 (arr!46548 (Array (_ BitVec 32) (_ BitVec 64))) (size!47100 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96418)

(declare-fun array_inv!35781 (array!96418) Bool)

(assert (=> start!121464 (array_inv!35781 a!2901)))

(declare-fun e!798644 () Bool)

(declare-fun b!1411282 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10885 0))(
  ( (MissingZero!10885 (index!45917 (_ BitVec 32))) (Found!10885 (index!45918 (_ BitVec 32))) (Intermediate!10885 (undefined!11697 Bool) (index!45919 (_ BitVec 32)) (x!127501 (_ BitVec 32))) (Undefined!10885) (MissingVacant!10885 (index!45920 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96418 (_ BitVec 32)) SeekEntryResult!10885)

(assert (=> b!1411282 (= e!798644 (= (seekEntryOrOpen!0 (select (arr!46548 a!2901) j!112) a!2901 mask!2840) (Found!10885 j!112)))))

(declare-fun b!1411283 () Bool)

(declare-fun res!948564 () Bool)

(assert (=> b!1411283 (=> (not res!948564) (not e!798643))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1411283 (= res!948564 (validKeyInArray!0 (select (arr!46548 a!2901) i!1037)))))

(declare-fun b!1411284 () Bool)

(declare-fun e!798646 () Bool)

(assert (=> b!1411284 (= e!798643 (not e!798646))))

(declare-fun res!948565 () Bool)

(assert (=> b!1411284 (=> res!948565 e!798646)))

(declare-fun lt!621476 () SeekEntryResult!10885)

(assert (=> b!1411284 (= res!948565 (or (not (is-Intermediate!10885 lt!621476)) (undefined!11697 lt!621476)))))

(assert (=> b!1411284 e!798644))

(declare-fun res!948568 () Bool)

(assert (=> b!1411284 (=> (not res!948568) (not e!798644))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96418 (_ BitVec 32)) Bool)

(assert (=> b!1411284 (= res!948568 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47587 0))(
  ( (Unit!47588) )
))
(declare-fun lt!621475 () Unit!47587)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96418 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47587)

(assert (=> b!1411284 (= lt!621475 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!621479 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96418 (_ BitVec 32)) SeekEntryResult!10885)

(assert (=> b!1411284 (= lt!621476 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!621479 (select (arr!46548 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1411284 (= lt!621479 (toIndex!0 (select (arr!46548 a!2901) j!112) mask!2840))))

(declare-fun b!1411285 () Bool)

(declare-fun res!948561 () Bool)

(assert (=> b!1411285 (=> (not res!948561) (not e!798643))))

(declare-datatypes ((List!33145 0))(
  ( (Nil!33142) (Cons!33141 (h!34413 (_ BitVec 64)) (t!47831 List!33145)) )
))
(declare-fun arrayNoDuplicates!0 (array!96418 (_ BitVec 32) List!33145) Bool)

(assert (=> b!1411285 (= res!948561 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33142))))

(declare-fun b!1411286 () Bool)

(declare-fun res!948566 () Bool)

(assert (=> b!1411286 (=> (not res!948566) (not e!798643))))

(assert (=> b!1411286 (= res!948566 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1411287 () Bool)

(declare-fun e!798647 () Bool)

(assert (=> b!1411287 (= e!798646 e!798647)))

(declare-fun res!948563 () Bool)

(assert (=> b!1411287 (=> res!948563 e!798647)))

(declare-fun lt!621478 () SeekEntryResult!10885)

(assert (=> b!1411287 (= res!948563 (or (= lt!621476 lt!621478) (not (is-Intermediate!10885 lt!621478))))))

(assert (=> b!1411287 (= lt!621478 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46548 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46548 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96419 (store (arr!46548 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47100 a!2901)) mask!2840))))

(declare-fun b!1411288 () Bool)

(declare-fun res!948562 () Bool)

(assert (=> b!1411288 (=> (not res!948562) (not e!798643))))

(assert (=> b!1411288 (= res!948562 (and (= (size!47100 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47100 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47100 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1411289 () Bool)

(assert (=> b!1411289 (= e!798647 (and (bvsge (index!45919 lt!621478) #b00000000000000000000000000000000) (bvslt (index!45919 lt!621478) (size!47100 a!2901))))))

(assert (=> b!1411289 (and (not (undefined!11697 lt!621478)) (= (index!45919 lt!621478) i!1037) (bvslt (x!127501 lt!621478) (x!127501 lt!621476)))))

(declare-fun lt!621477 () Unit!47587)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96418 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47587)

(assert (=> b!1411289 (= lt!621477 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!621479 (x!127501 lt!621476) (index!45919 lt!621476) (x!127501 lt!621478) (index!45919 lt!621478) (undefined!11697 lt!621478) mask!2840))))

(declare-fun b!1411290 () Bool)

(declare-fun res!948560 () Bool)

(assert (=> b!1411290 (=> (not res!948560) (not e!798643))))

(assert (=> b!1411290 (= res!948560 (validKeyInArray!0 (select (arr!46548 a!2901) j!112)))))

(assert (= (and start!121464 res!948567) b!1411288))

(assert (= (and b!1411288 res!948562) b!1411283))

(assert (= (and b!1411283 res!948564) b!1411290))

(assert (= (and b!1411290 res!948560) b!1411286))

(assert (= (and b!1411286 res!948566) b!1411285))

(assert (= (and b!1411285 res!948561) b!1411284))

(assert (= (and b!1411284 res!948568) b!1411282))

(assert (= (and b!1411284 (not res!948565)) b!1411287))

(assert (= (and b!1411287 (not res!948563)) b!1411289))

(declare-fun m!1300645 () Bool)

(assert (=> start!121464 m!1300645))

(declare-fun m!1300647 () Bool)

(assert (=> start!121464 m!1300647))

(declare-fun m!1300649 () Bool)

(assert (=> b!1411286 m!1300649))

(declare-fun m!1300651 () Bool)

(assert (=> b!1411284 m!1300651))

(declare-fun m!1300653 () Bool)

(assert (=> b!1411284 m!1300653))

(assert (=> b!1411284 m!1300651))

(assert (=> b!1411284 m!1300651))

(declare-fun m!1300655 () Bool)

(assert (=> b!1411284 m!1300655))

(declare-fun m!1300657 () Bool)

(assert (=> b!1411284 m!1300657))

(declare-fun m!1300659 () Bool)

(assert (=> b!1411284 m!1300659))

(declare-fun m!1300661 () Bool)

(assert (=> b!1411289 m!1300661))

(declare-fun m!1300663 () Bool)

(assert (=> b!1411285 m!1300663))

(declare-fun m!1300665 () Bool)

(assert (=> b!1411283 m!1300665))

(assert (=> b!1411283 m!1300665))

(declare-fun m!1300667 () Bool)

(assert (=> b!1411283 m!1300667))

(declare-fun m!1300669 () Bool)

(assert (=> b!1411287 m!1300669))

(declare-fun m!1300671 () Bool)

(assert (=> b!1411287 m!1300671))

(assert (=> b!1411287 m!1300671))

(declare-fun m!1300673 () Bool)

(assert (=> b!1411287 m!1300673))

(assert (=> b!1411287 m!1300673))

(assert (=> b!1411287 m!1300671))

(declare-fun m!1300675 () Bool)

(assert (=> b!1411287 m!1300675))

(assert (=> b!1411290 m!1300651))

(assert (=> b!1411290 m!1300651))

(declare-fun m!1300677 () Bool)

(assert (=> b!1411290 m!1300677))

(assert (=> b!1411282 m!1300651))

(assert (=> b!1411282 m!1300651))

(declare-fun m!1300679 () Bool)

(assert (=> b!1411282 m!1300679))

(push 1)

(assert (not b!1411284))

(assert (not b!1411283))

(assert (not b!1411285))

(assert (not b!1411286))

(assert (not b!1411290))

(assert (not b!1411287))

(assert (not start!121464))

(assert (not b!1411289))

(assert (not b!1411282))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

