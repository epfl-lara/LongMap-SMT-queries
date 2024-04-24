; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121410 () Bool)

(assert start!121410)

(declare-fun b!1410650 () Bool)

(declare-fun res!947692 () Bool)

(declare-fun e!798371 () Bool)

(assert (=> b!1410650 (=> (not res!947692) (not e!798371))))

(declare-datatypes ((array!96486 0))(
  ( (array!96487 (arr!46584 (Array (_ BitVec 32) (_ BitVec 64))) (size!47135 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96486)

(declare-datatypes ((List!33090 0))(
  ( (Nil!33087) (Cons!33086 (h!34357 (_ BitVec 64)) (t!47776 List!33090)) )
))
(declare-fun arrayNoDuplicates!0 (array!96486 (_ BitVec 32) List!33090) Bool)

(assert (=> b!1410650 (= res!947692 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33087))))

(declare-fun b!1410651 () Bool)

(declare-fun res!947689 () Bool)

(assert (=> b!1410651 (=> (not res!947689) (not e!798371))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96486 (_ BitVec 32)) Bool)

(assert (=> b!1410651 (= res!947689 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1410652 () Bool)

(declare-fun e!798368 () Bool)

(assert (=> b!1410652 (= e!798371 (not e!798368))))

(declare-fun res!947691 () Bool)

(assert (=> b!1410652 (=> res!947691 e!798368)))

(declare-datatypes ((SeekEntryResult!10798 0))(
  ( (MissingZero!10798 (index!45569 (_ BitVec 32))) (Found!10798 (index!45570 (_ BitVec 32))) (Intermediate!10798 (undefined!11610 Bool) (index!45571 (_ BitVec 32)) (x!127306 (_ BitVec 32))) (Undefined!10798) (MissingVacant!10798 (index!45572 (_ BitVec 32))) )
))
(declare-fun lt!621149 () SeekEntryResult!10798)

(assert (=> b!1410652 (= res!947691 (or (not (is-Intermediate!10798 lt!621149)) (undefined!11610 lt!621149)))))

(declare-fun e!798370 () Bool)

(assert (=> b!1410652 e!798370))

(declare-fun res!947694 () Bool)

(assert (=> b!1410652 (=> (not res!947694) (not e!798370))))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1410652 (= res!947694 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47597 0))(
  ( (Unit!47598) )
))
(declare-fun lt!621148 () Unit!47597)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96486 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47597)

(assert (=> b!1410652 (= lt!621148 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96486 (_ BitVec 32)) SeekEntryResult!10798)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1410652 (= lt!621149 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46584 a!2901) j!112) mask!2840) (select (arr!46584 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1410653 () Bool)

(declare-fun res!947688 () Bool)

(assert (=> b!1410653 (=> (not res!947688) (not e!798371))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1410653 (= res!947688 (validKeyInArray!0 (select (arr!46584 a!2901) j!112)))))

(declare-fun b!1410654 () Bool)

(assert (=> b!1410654 (= e!798368 true)))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun lt!621147 () SeekEntryResult!10798)

(assert (=> b!1410654 (= lt!621147 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46584 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46584 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96487 (store (arr!46584 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47135 a!2901)) mask!2840))))

(declare-fun res!947693 () Bool)

(assert (=> start!121410 (=> (not res!947693) (not e!798371))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121410 (= res!947693 (validMask!0 mask!2840))))

(assert (=> start!121410 e!798371))

(assert (=> start!121410 true))

(declare-fun array_inv!35865 (array!96486) Bool)

(assert (=> start!121410 (array_inv!35865 a!2901)))

(declare-fun b!1410655 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96486 (_ BitVec 32)) SeekEntryResult!10798)

(assert (=> b!1410655 (= e!798370 (= (seekEntryOrOpen!0 (select (arr!46584 a!2901) j!112) a!2901 mask!2840) (Found!10798 j!112)))))

(declare-fun b!1410656 () Bool)

(declare-fun res!947695 () Bool)

(assert (=> b!1410656 (=> (not res!947695) (not e!798371))))

(assert (=> b!1410656 (= res!947695 (validKeyInArray!0 (select (arr!46584 a!2901) i!1037)))))

(declare-fun b!1410657 () Bool)

(declare-fun res!947690 () Bool)

(assert (=> b!1410657 (=> (not res!947690) (not e!798371))))

(assert (=> b!1410657 (= res!947690 (and (= (size!47135 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47135 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47135 a!2901)) (not (= i!1037 j!112))))))

(assert (= (and start!121410 res!947693) b!1410657))

(assert (= (and b!1410657 res!947690) b!1410656))

(assert (= (and b!1410656 res!947695) b!1410653))

(assert (= (and b!1410653 res!947688) b!1410651))

(assert (= (and b!1410651 res!947689) b!1410650))

(assert (= (and b!1410650 res!947692) b!1410652))

(assert (= (and b!1410652 res!947694) b!1410655))

(assert (= (and b!1410652 (not res!947691)) b!1410654))

(declare-fun m!1300629 () Bool)

(assert (=> b!1410656 m!1300629))

(assert (=> b!1410656 m!1300629))

(declare-fun m!1300631 () Bool)

(assert (=> b!1410656 m!1300631))

(declare-fun m!1300633 () Bool)

(assert (=> b!1410650 m!1300633))

(declare-fun m!1300635 () Bool)

(assert (=> b!1410653 m!1300635))

(assert (=> b!1410653 m!1300635))

(declare-fun m!1300637 () Bool)

(assert (=> b!1410653 m!1300637))

(declare-fun m!1300639 () Bool)

(assert (=> b!1410654 m!1300639))

(declare-fun m!1300641 () Bool)

(assert (=> b!1410654 m!1300641))

(assert (=> b!1410654 m!1300641))

(declare-fun m!1300643 () Bool)

(assert (=> b!1410654 m!1300643))

(assert (=> b!1410654 m!1300643))

(assert (=> b!1410654 m!1300641))

(declare-fun m!1300645 () Bool)

(assert (=> b!1410654 m!1300645))

(declare-fun m!1300647 () Bool)

(assert (=> start!121410 m!1300647))

(declare-fun m!1300649 () Bool)

(assert (=> start!121410 m!1300649))

(assert (=> b!1410652 m!1300635))

(declare-fun m!1300651 () Bool)

(assert (=> b!1410652 m!1300651))

(assert (=> b!1410652 m!1300635))

(declare-fun m!1300653 () Bool)

(assert (=> b!1410652 m!1300653))

(assert (=> b!1410652 m!1300651))

(assert (=> b!1410652 m!1300635))

(declare-fun m!1300655 () Bool)

(assert (=> b!1410652 m!1300655))

(declare-fun m!1300657 () Bool)

(assert (=> b!1410652 m!1300657))

(declare-fun m!1300659 () Bool)

(assert (=> b!1410651 m!1300659))

(assert (=> b!1410655 m!1300635))

(assert (=> b!1410655 m!1300635))

(declare-fun m!1300661 () Bool)

(assert (=> b!1410655 m!1300661))

(push 1)

(assert (not start!121410))

(assert (not b!1410653))

(assert (not b!1410652))

(assert (not b!1410650))

(assert (not b!1410655))

(assert (not b!1410654))

(assert (not b!1410656))

(assert (not b!1410651))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

