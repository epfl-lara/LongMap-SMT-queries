; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121438 () Bool)

(assert start!121438)

(declare-fun b!1410939 () Bool)

(declare-fun res!948166 () Bool)

(declare-fun e!798450 () Bool)

(assert (=> b!1410939 (=> (not res!948166) (not e!798450))))

(declare-datatypes ((array!96439 0))(
  ( (array!96440 (arr!46558 (Array (_ BitVec 32) (_ BitVec 64))) (size!47108 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96439)

(declare-datatypes ((List!33077 0))(
  ( (Nil!33074) (Cons!33073 (h!34345 (_ BitVec 64)) (t!47771 List!33077)) )
))
(declare-fun arrayNoDuplicates!0 (array!96439 (_ BitVec 32) List!33077) Bool)

(assert (=> b!1410939 (= res!948166 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33074))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun e!798447 () Bool)

(declare-fun b!1410940 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10869 0))(
  ( (MissingZero!10869 (index!45853 (_ BitVec 32))) (Found!10869 (index!45854 (_ BitVec 32))) (Intermediate!10869 (undefined!11681 Bool) (index!45855 (_ BitVec 32)) (x!127448 (_ BitVec 32))) (Undefined!10869) (MissingVacant!10869 (index!45856 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96439 (_ BitVec 32)) SeekEntryResult!10869)

(assert (=> b!1410940 (= e!798447 (= (seekEntryOrOpen!0 (select (arr!46558 a!2901) j!112) a!2901 mask!2840) (Found!10869 j!112)))))

(declare-fun b!1410941 () Bool)

(declare-fun res!948171 () Bool)

(assert (=> b!1410941 (=> (not res!948171) (not e!798450))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1410941 (= res!948171 (and (= (size!47108 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47108 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47108 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1410942 () Bool)

(declare-fun res!948173 () Bool)

(assert (=> b!1410942 (=> (not res!948173) (not e!798450))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1410942 (= res!948173 (validKeyInArray!0 (select (arr!46558 a!2901) j!112)))))

(declare-fun b!1410943 () Bool)

(declare-fun e!798452 () Bool)

(assert (=> b!1410943 (= e!798450 (not e!798452))))

(declare-fun res!948174 () Bool)

(assert (=> b!1410943 (=> res!948174 e!798452)))

(declare-fun lt!621421 () SeekEntryResult!10869)

(assert (=> b!1410943 (= res!948174 (or (not (is-Intermediate!10869 lt!621421)) (undefined!11681 lt!621421)))))

(assert (=> b!1410943 e!798447))

(declare-fun res!948168 () Bool)

(assert (=> b!1410943 (=> (not res!948168) (not e!798447))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96439 (_ BitVec 32)) Bool)

(assert (=> b!1410943 (= res!948168 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47712 0))(
  ( (Unit!47713) )
))
(declare-fun lt!621425 () Unit!47712)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96439 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47712)

(assert (=> b!1410943 (= lt!621425 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!621426 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96439 (_ BitVec 32)) SeekEntryResult!10869)

(assert (=> b!1410943 (= lt!621421 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!621426 (select (arr!46558 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1410943 (= lt!621426 (toIndex!0 (select (arr!46558 a!2901) j!112) mask!2840))))

(declare-fun res!948170 () Bool)

(assert (=> start!121438 (=> (not res!948170) (not e!798450))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121438 (= res!948170 (validMask!0 mask!2840))))

(assert (=> start!121438 e!798450))

(assert (=> start!121438 true))

(declare-fun array_inv!35586 (array!96439) Bool)

(assert (=> start!121438 (array_inv!35586 a!2901)))

(declare-fun e!798449 () Bool)

(declare-fun lt!621423 () array!96439)

(declare-fun lt!621420 () SeekEntryResult!10869)

(declare-fun lt!621424 () (_ BitVec 64))

(declare-fun b!1410944 () Bool)

(assert (=> b!1410944 (= e!798449 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!621426 lt!621424 lt!621423 mask!2840) lt!621420))))

(declare-fun b!1410945 () Bool)

(declare-fun res!948169 () Bool)

(assert (=> b!1410945 (=> (not res!948169) (not e!798450))))

(assert (=> b!1410945 (= res!948169 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1410946 () Bool)

(declare-fun e!798451 () Bool)

(assert (=> b!1410946 (= e!798452 e!798451)))

(declare-fun res!948167 () Bool)

(assert (=> b!1410946 (=> res!948167 e!798451)))

(declare-fun lt!621422 () SeekEntryResult!10869)

(assert (=> b!1410946 (= res!948167 (or (= lt!621421 lt!621422) (not (is-Intermediate!10869 lt!621422)) (bvslt (x!127448 lt!621421) #b00000000000000000000000000000000) (bvsgt (x!127448 lt!621421) #b01111111111111111111111111111110) (bvslt lt!621426 #b00000000000000000000000000000000) (bvsge lt!621426 (size!47108 a!2901)) (bvslt (index!45855 lt!621421) #b00000000000000000000000000000000) (bvsge (index!45855 lt!621421) (size!47108 a!2901)) (not (= lt!621421 (Intermediate!10869 false (index!45855 lt!621421) (x!127448 lt!621421))))))))

(assert (=> b!1410946 (= lt!621422 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!621424 mask!2840) lt!621424 lt!621423 mask!2840))))

(assert (=> b!1410946 (= lt!621424 (select (store (arr!46558 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1410946 (= lt!621423 (array!96440 (store (arr!46558 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47108 a!2901)))))

(declare-fun b!1410947 () Bool)

(declare-fun res!948175 () Bool)

(assert (=> b!1410947 (=> (not res!948175) (not e!798450))))

(assert (=> b!1410947 (= res!948175 (validKeyInArray!0 (select (arr!46558 a!2901) i!1037)))))

(declare-fun b!1410948 () Bool)

(assert (=> b!1410948 (= e!798451 e!798449)))

(declare-fun res!948172 () Bool)

(assert (=> b!1410948 (=> res!948172 e!798449)))

(assert (=> b!1410948 (= res!948172 (not (= lt!621422 lt!621420)))))

(assert (=> b!1410948 (= lt!621420 (Intermediate!10869 (undefined!11681 lt!621422) (index!45855 lt!621422) (x!127448 lt!621422)))))

(assert (= (and start!121438 res!948170) b!1410941))

(assert (= (and b!1410941 res!948171) b!1410947))

(assert (= (and b!1410947 res!948175) b!1410942))

(assert (= (and b!1410942 res!948173) b!1410945))

(assert (= (and b!1410945 res!948169) b!1410939))

(assert (= (and b!1410939 res!948166) b!1410943))

(assert (= (and b!1410943 res!948168) b!1410940))

(assert (= (and b!1410943 (not res!948174)) b!1410946))

(assert (= (and b!1410946 (not res!948167)) b!1410948))

(assert (= (and b!1410948 (not res!948172)) b!1410944))

(declare-fun m!1300641 () Bool)

(assert (=> start!121438 m!1300641))

(declare-fun m!1300643 () Bool)

(assert (=> start!121438 m!1300643))

(declare-fun m!1300645 () Bool)

(assert (=> b!1410943 m!1300645))

(declare-fun m!1300647 () Bool)

(assert (=> b!1410943 m!1300647))

(assert (=> b!1410943 m!1300645))

(assert (=> b!1410943 m!1300645))

(declare-fun m!1300649 () Bool)

(assert (=> b!1410943 m!1300649))

(declare-fun m!1300651 () Bool)

(assert (=> b!1410943 m!1300651))

(declare-fun m!1300653 () Bool)

(assert (=> b!1410943 m!1300653))

(declare-fun m!1300655 () Bool)

(assert (=> b!1410944 m!1300655))

(assert (=> b!1410940 m!1300645))

(assert (=> b!1410940 m!1300645))

(declare-fun m!1300657 () Bool)

(assert (=> b!1410940 m!1300657))

(declare-fun m!1300659 () Bool)

(assert (=> b!1410945 m!1300659))

(declare-fun m!1300661 () Bool)

(assert (=> b!1410946 m!1300661))

(assert (=> b!1410946 m!1300661))

(declare-fun m!1300663 () Bool)

(assert (=> b!1410946 m!1300663))

(declare-fun m!1300665 () Bool)

(assert (=> b!1410946 m!1300665))

(declare-fun m!1300667 () Bool)

(assert (=> b!1410946 m!1300667))

(declare-fun m!1300669 () Bool)

(assert (=> b!1410939 m!1300669))

(assert (=> b!1410942 m!1300645))

(assert (=> b!1410942 m!1300645))

(declare-fun m!1300671 () Bool)

(assert (=> b!1410942 m!1300671))

(declare-fun m!1300673 () Bool)

(assert (=> b!1410947 m!1300673))

(assert (=> b!1410947 m!1300673))

(declare-fun m!1300675 () Bool)

(assert (=> b!1410947 m!1300675))

(push 1)

