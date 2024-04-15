; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119610 () Bool)

(assert start!119610)

(declare-fun res!932687 () Bool)

(declare-fun e!788914 () Bool)

(assert (=> start!119610 (=> (not res!932687) (not e!788914))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119610 (= res!932687 (validMask!0 mask!2840))))

(assert (=> start!119610 e!788914))

(assert (=> start!119610 true))

(declare-datatypes ((array!95245 0))(
  ( (array!95246 (arr!45981 (Array (_ BitVec 32) (_ BitVec 64))) (size!46533 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95245)

(declare-fun array_inv!35214 (array!95245) Bool)

(assert (=> start!119610 (array_inv!35214 a!2901)))

(declare-fun b!1393226 () Bool)

(declare-fun res!932690 () Bool)

(assert (=> b!1393226 (=> (not res!932690) (not e!788914))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1393226 (= res!932690 (validKeyInArray!0 (select (arr!45981 a!2901) i!1037)))))

(declare-fun b!1393227 () Bool)

(declare-fun res!932685 () Bool)

(assert (=> b!1393227 (=> (not res!932685) (not e!788914))))

(declare-datatypes ((List!32578 0))(
  ( (Nil!32575) (Cons!32574 (h!33807 (_ BitVec 64)) (t!47264 List!32578)) )
))
(declare-fun arrayNoDuplicates!0 (array!95245 (_ BitVec 32) List!32578) Bool)

(assert (=> b!1393227 (= res!932685 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32575))))

(declare-fun b!1393228 () Bool)

(declare-fun res!932692 () Bool)

(assert (=> b!1393228 (=> (not res!932692) (not e!788914))))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1393228 (= res!932692 (validKeyInArray!0 (select (arr!45981 a!2901) j!112)))))

(declare-fun e!788913 () Bool)

(declare-fun b!1393229 () Bool)

(declare-datatypes ((SeekEntryResult!10324 0))(
  ( (MissingZero!10324 (index!43667 (_ BitVec 32))) (Found!10324 (index!43668 (_ BitVec 32))) (Intermediate!10324 (undefined!11136 Bool) (index!43669 (_ BitVec 32)) (x!125341 (_ BitVec 32))) (Undefined!10324) (MissingVacant!10324 (index!43670 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95245 (_ BitVec 32)) SeekEntryResult!10324)

(assert (=> b!1393229 (= e!788913 (= (seekEntryOrOpen!0 (select (arr!45981 a!2901) j!112) a!2901 mask!2840) (Found!10324 j!112)))))

(declare-fun b!1393230 () Bool)

(declare-fun res!932689 () Bool)

(assert (=> b!1393230 (=> (not res!932689) (not e!788914))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95245 (_ BitVec 32)) Bool)

(assert (=> b!1393230 (= res!932689 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1393231 () Bool)

(declare-fun e!788915 () Bool)

(assert (=> b!1393231 (= e!788914 (not e!788915))))

(declare-fun res!932686 () Bool)

(assert (=> b!1393231 (=> res!932686 e!788915)))

(declare-fun lt!611752 () SeekEntryResult!10324)

(assert (=> b!1393231 (= res!932686 (or (not (is-Intermediate!10324 lt!611752)) (undefined!11136 lt!611752)))))

(assert (=> b!1393231 e!788913))

(declare-fun res!932688 () Bool)

(assert (=> b!1393231 (=> (not res!932688) (not e!788913))))

(assert (=> b!1393231 (= res!932688 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46495 0))(
  ( (Unit!46496) )
))
(declare-fun lt!611751 () Unit!46495)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95245 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46495)

(assert (=> b!1393231 (= lt!611751 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95245 (_ BitVec 32)) SeekEntryResult!10324)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1393231 (= lt!611752 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45981 a!2901) j!112) mask!2840) (select (arr!45981 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1393232 () Bool)

(assert (=> b!1393232 (= e!788915 true)))

(declare-fun lt!611753 () SeekEntryResult!10324)

(assert (=> b!1393232 (= lt!611753 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!45981 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!45981 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95246 (store (arr!45981 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46533 a!2901)) mask!2840))))

(declare-fun b!1393233 () Bool)

(declare-fun res!932691 () Bool)

(assert (=> b!1393233 (=> (not res!932691) (not e!788914))))

(assert (=> b!1393233 (= res!932691 (and (= (size!46533 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46533 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46533 a!2901)) (not (= i!1037 j!112))))))

(assert (= (and start!119610 res!932687) b!1393233))

(assert (= (and b!1393233 res!932691) b!1393226))

(assert (= (and b!1393226 res!932690) b!1393228))

(assert (= (and b!1393228 res!932692) b!1393230))

(assert (= (and b!1393230 res!932689) b!1393227))

(assert (= (and b!1393227 res!932685) b!1393231))

(assert (= (and b!1393231 res!932688) b!1393229))

(assert (= (and b!1393231 (not res!932686)) b!1393232))

(declare-fun m!1278627 () Bool)

(assert (=> b!1393230 m!1278627))

(declare-fun m!1278629 () Bool)

(assert (=> b!1393229 m!1278629))

(assert (=> b!1393229 m!1278629))

(declare-fun m!1278631 () Bool)

(assert (=> b!1393229 m!1278631))

(declare-fun m!1278633 () Bool)

(assert (=> b!1393232 m!1278633))

(declare-fun m!1278635 () Bool)

(assert (=> b!1393232 m!1278635))

(assert (=> b!1393232 m!1278635))

(declare-fun m!1278637 () Bool)

(assert (=> b!1393232 m!1278637))

(assert (=> b!1393232 m!1278637))

(assert (=> b!1393232 m!1278635))

(declare-fun m!1278639 () Bool)

(assert (=> b!1393232 m!1278639))

(declare-fun m!1278641 () Bool)

(assert (=> b!1393226 m!1278641))

(assert (=> b!1393226 m!1278641))

(declare-fun m!1278643 () Bool)

(assert (=> b!1393226 m!1278643))

(declare-fun m!1278645 () Bool)

(assert (=> start!119610 m!1278645))

(declare-fun m!1278647 () Bool)

(assert (=> start!119610 m!1278647))

(declare-fun m!1278649 () Bool)

(assert (=> b!1393227 m!1278649))

(assert (=> b!1393231 m!1278629))

(declare-fun m!1278651 () Bool)

(assert (=> b!1393231 m!1278651))

(assert (=> b!1393231 m!1278629))

(declare-fun m!1278653 () Bool)

(assert (=> b!1393231 m!1278653))

(assert (=> b!1393231 m!1278651))

(assert (=> b!1393231 m!1278629))

(declare-fun m!1278655 () Bool)

(assert (=> b!1393231 m!1278655))

(declare-fun m!1278657 () Bool)

(assert (=> b!1393231 m!1278657))

(assert (=> b!1393228 m!1278629))

(assert (=> b!1393228 m!1278629))

(declare-fun m!1278659 () Bool)

(assert (=> b!1393228 m!1278659))

(push 1)

(assert (not b!1393230))

(assert (not b!1393226))

(assert (not b!1393231))

(assert (not b!1393228))

(assert (not b!1393232))

(assert (not b!1393229))

(assert (not b!1393227))

(assert (not start!119610))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

