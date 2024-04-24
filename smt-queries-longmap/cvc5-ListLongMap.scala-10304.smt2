; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121338 () Bool)

(assert start!121338)

(declare-fun b!1409786 () Bool)

(declare-fun e!797938 () Bool)

(assert (=> b!1409786 (= e!797938 true)))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96414 0))(
  ( (array!96415 (arr!46548 (Array (_ BitVec 32) (_ BitVec 64))) (size!47099 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96414)

(declare-datatypes ((SeekEntryResult!10762 0))(
  ( (MissingZero!10762 (index!45425 (_ BitVec 32))) (Found!10762 (index!45426 (_ BitVec 32))) (Intermediate!10762 (undefined!11574 Bool) (index!45427 (_ BitVec 32)) (x!127174 (_ BitVec 32))) (Undefined!10762) (MissingVacant!10762 (index!45428 (_ BitVec 32))) )
))
(declare-fun lt!620825 () SeekEntryResult!10762)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96414 (_ BitVec 32)) SeekEntryResult!10762)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1409786 (= lt!620825 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46548 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46548 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96415 (store (arr!46548 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47099 a!2901)) mask!2840))))

(declare-fun b!1409787 () Bool)

(declare-fun res!946830 () Bool)

(declare-fun e!797937 () Bool)

(assert (=> b!1409787 (=> (not res!946830) (not e!797937))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1409787 (= res!946830 (validKeyInArray!0 (select (arr!46548 a!2901) i!1037)))))

(declare-fun b!1409788 () Bool)

(declare-fun res!946828 () Bool)

(assert (=> b!1409788 (=> (not res!946828) (not e!797937))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96414 (_ BitVec 32)) Bool)

(assert (=> b!1409788 (= res!946828 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1409789 () Bool)

(declare-fun e!797939 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96414 (_ BitVec 32)) SeekEntryResult!10762)

(assert (=> b!1409789 (= e!797939 (= (seekEntryOrOpen!0 (select (arr!46548 a!2901) j!112) a!2901 mask!2840) (Found!10762 j!112)))))

(declare-fun b!1409790 () Bool)

(declare-fun res!946827 () Bool)

(assert (=> b!1409790 (=> (not res!946827) (not e!797937))))

(assert (=> b!1409790 (= res!946827 (validKeyInArray!0 (select (arr!46548 a!2901) j!112)))))

(declare-fun b!1409791 () Bool)

(declare-fun res!946829 () Bool)

(assert (=> b!1409791 (=> (not res!946829) (not e!797937))))

(assert (=> b!1409791 (= res!946829 (and (= (size!47099 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47099 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47099 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1409792 () Bool)

(declare-fun res!946824 () Bool)

(assert (=> b!1409792 (=> (not res!946824) (not e!797937))))

(declare-datatypes ((List!33054 0))(
  ( (Nil!33051) (Cons!33050 (h!34321 (_ BitVec 64)) (t!47740 List!33054)) )
))
(declare-fun arrayNoDuplicates!0 (array!96414 (_ BitVec 32) List!33054) Bool)

(assert (=> b!1409792 (= res!946824 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33051))))

(declare-fun b!1409793 () Bool)

(assert (=> b!1409793 (= e!797937 (not e!797938))))

(declare-fun res!946825 () Bool)

(assert (=> b!1409793 (=> res!946825 e!797938)))

(declare-fun lt!620823 () SeekEntryResult!10762)

(assert (=> b!1409793 (= res!946825 (or (not (is-Intermediate!10762 lt!620823)) (undefined!11574 lt!620823)))))

(assert (=> b!1409793 e!797939))

(declare-fun res!946831 () Bool)

(assert (=> b!1409793 (=> (not res!946831) (not e!797939))))

(assert (=> b!1409793 (= res!946831 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47525 0))(
  ( (Unit!47526) )
))
(declare-fun lt!620824 () Unit!47525)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96414 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47525)

(assert (=> b!1409793 (= lt!620824 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1409793 (= lt!620823 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46548 a!2901) j!112) mask!2840) (select (arr!46548 a!2901) j!112) a!2901 mask!2840))))

(declare-fun res!946826 () Bool)

(assert (=> start!121338 (=> (not res!946826) (not e!797937))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121338 (= res!946826 (validMask!0 mask!2840))))

(assert (=> start!121338 e!797937))

(assert (=> start!121338 true))

(declare-fun array_inv!35829 (array!96414) Bool)

(assert (=> start!121338 (array_inv!35829 a!2901)))

(assert (= (and start!121338 res!946826) b!1409791))

(assert (= (and b!1409791 res!946829) b!1409787))

(assert (= (and b!1409787 res!946830) b!1409790))

(assert (= (and b!1409790 res!946827) b!1409788))

(assert (= (and b!1409788 res!946828) b!1409792))

(assert (= (and b!1409792 res!946824) b!1409793))

(assert (= (and b!1409793 res!946831) b!1409789))

(assert (= (and b!1409793 (not res!946825)) b!1409786))

(declare-fun m!1299405 () Bool)

(assert (=> b!1409790 m!1299405))

(assert (=> b!1409790 m!1299405))

(declare-fun m!1299407 () Bool)

(assert (=> b!1409790 m!1299407))

(declare-fun m!1299409 () Bool)

(assert (=> b!1409788 m!1299409))

(declare-fun m!1299411 () Bool)

(assert (=> b!1409792 m!1299411))

(assert (=> b!1409793 m!1299405))

(declare-fun m!1299413 () Bool)

(assert (=> b!1409793 m!1299413))

(assert (=> b!1409793 m!1299405))

(declare-fun m!1299415 () Bool)

(assert (=> b!1409793 m!1299415))

(assert (=> b!1409793 m!1299413))

(assert (=> b!1409793 m!1299405))

(declare-fun m!1299417 () Bool)

(assert (=> b!1409793 m!1299417))

(declare-fun m!1299419 () Bool)

(assert (=> b!1409793 m!1299419))

(declare-fun m!1299421 () Bool)

(assert (=> start!121338 m!1299421))

(declare-fun m!1299423 () Bool)

(assert (=> start!121338 m!1299423))

(assert (=> b!1409789 m!1299405))

(assert (=> b!1409789 m!1299405))

(declare-fun m!1299425 () Bool)

(assert (=> b!1409789 m!1299425))

(declare-fun m!1299427 () Bool)

(assert (=> b!1409786 m!1299427))

(declare-fun m!1299429 () Bool)

(assert (=> b!1409786 m!1299429))

(assert (=> b!1409786 m!1299429))

(declare-fun m!1299431 () Bool)

(assert (=> b!1409786 m!1299431))

(assert (=> b!1409786 m!1299431))

(assert (=> b!1409786 m!1299429))

(declare-fun m!1299433 () Bool)

(assert (=> b!1409786 m!1299433))

(declare-fun m!1299435 () Bool)

(assert (=> b!1409787 m!1299435))

(assert (=> b!1409787 m!1299435))

(declare-fun m!1299437 () Bool)

(assert (=> b!1409787 m!1299437))

(push 1)

(assert (not b!1409787))

(assert (not b!1409788))

(assert (not start!121338))

(assert (not b!1409790))

(assert (not b!1409792))

(assert (not b!1409789))

(assert (not b!1409793))

(assert (not b!1409786))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

