; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120562 () Bool)

(assert start!120562)

(declare-fun b!1403826 () Bool)

(declare-fun res!942343 () Bool)

(declare-fun e!794814 () Bool)

(assert (=> b!1403826 (=> (not res!942343) (not e!794814))))

(declare-datatypes ((array!95971 0))(
  ( (array!95972 (arr!46336 (Array (_ BitVec 32) (_ BitVec 64))) (size!46886 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95971)

(declare-datatypes ((List!32855 0))(
  ( (Nil!32852) (Cons!32851 (h!34099 (_ BitVec 64)) (t!47549 List!32855)) )
))
(declare-fun arrayNoDuplicates!0 (array!95971 (_ BitVec 32) List!32855) Bool)

(assert (=> b!1403826 (= res!942343 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32852))))

(declare-fun b!1403827 () Bool)

(declare-fun res!942339 () Bool)

(assert (=> b!1403827 (=> (not res!942339) (not e!794814))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95971 (_ BitVec 32)) Bool)

(assert (=> b!1403827 (= res!942339 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1403828 () Bool)

(declare-fun res!942340 () Bool)

(assert (=> b!1403828 (=> (not res!942340) (not e!794814))))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1403828 (= res!942340 (validKeyInArray!0 (select (arr!46336 a!2901) j!112)))))

(declare-fun b!1403829 () Bool)

(declare-fun res!942338 () Bool)

(assert (=> b!1403829 (=> (not res!942338) (not e!794814))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1403829 (= res!942338 (and (= (size!46886 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46886 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46886 a!2901)) (not (= i!1037 j!112))))))

(declare-fun res!942337 () Bool)

(assert (=> start!120562 (=> (not res!942337) (not e!794814))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120562 (= res!942337 (validMask!0 mask!2840))))

(assert (=> start!120562 e!794814))

(assert (=> start!120562 true))

(declare-fun array_inv!35364 (array!95971) Bool)

(assert (=> start!120562 (array_inv!35364 a!2901)))

(declare-fun b!1403830 () Bool)

(assert (=> b!1403830 (= e!794814 (not true))))

(declare-fun e!794815 () Bool)

(assert (=> b!1403830 e!794815))

(declare-fun res!942341 () Bool)

(assert (=> b!1403830 (=> (not res!942341) (not e!794815))))

(assert (=> b!1403830 (= res!942341 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47310 0))(
  ( (Unit!47311) )
))
(declare-fun lt!618518 () Unit!47310)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95971 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47310)

(assert (=> b!1403830 (= lt!618518 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-datatypes ((SeekEntryResult!10653 0))(
  ( (MissingZero!10653 (index!44989 (_ BitVec 32))) (Found!10653 (index!44990 (_ BitVec 32))) (Intermediate!10653 (undefined!11465 Bool) (index!44991 (_ BitVec 32)) (x!126592 (_ BitVec 32))) (Undefined!10653) (MissingVacant!10653 (index!44992 (_ BitVec 32))) )
))
(declare-fun lt!618519 () SeekEntryResult!10653)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95971 (_ BitVec 32)) SeekEntryResult!10653)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1403830 (= lt!618519 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46336 a!2901) j!112) mask!2840) (select (arr!46336 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1403831 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95971 (_ BitVec 32)) SeekEntryResult!10653)

(assert (=> b!1403831 (= e!794815 (= (seekEntryOrOpen!0 (select (arr!46336 a!2901) j!112) a!2901 mask!2840) (Found!10653 j!112)))))

(declare-fun b!1403832 () Bool)

(declare-fun res!942342 () Bool)

(assert (=> b!1403832 (=> (not res!942342) (not e!794814))))

(assert (=> b!1403832 (= res!942342 (validKeyInArray!0 (select (arr!46336 a!2901) i!1037)))))

(assert (= (and start!120562 res!942337) b!1403829))

(assert (= (and b!1403829 res!942338) b!1403832))

(assert (= (and b!1403832 res!942342) b!1403828))

(assert (= (and b!1403828 res!942340) b!1403827))

(assert (= (and b!1403827 res!942339) b!1403826))

(assert (= (and b!1403826 res!942343) b!1403830))

(assert (= (and b!1403830 res!942341) b!1403831))

(declare-fun m!1292575 () Bool)

(assert (=> b!1403826 m!1292575))

(declare-fun m!1292577 () Bool)

(assert (=> b!1403830 m!1292577))

(declare-fun m!1292579 () Bool)

(assert (=> b!1403830 m!1292579))

(assert (=> b!1403830 m!1292577))

(declare-fun m!1292581 () Bool)

(assert (=> b!1403830 m!1292581))

(assert (=> b!1403830 m!1292579))

(assert (=> b!1403830 m!1292577))

(declare-fun m!1292583 () Bool)

(assert (=> b!1403830 m!1292583))

(declare-fun m!1292585 () Bool)

(assert (=> b!1403830 m!1292585))

(declare-fun m!1292587 () Bool)

(assert (=> b!1403832 m!1292587))

(assert (=> b!1403832 m!1292587))

(declare-fun m!1292589 () Bool)

(assert (=> b!1403832 m!1292589))

(declare-fun m!1292591 () Bool)

(assert (=> b!1403827 m!1292591))

(assert (=> b!1403828 m!1292577))

(assert (=> b!1403828 m!1292577))

(declare-fun m!1292593 () Bool)

(assert (=> b!1403828 m!1292593))

(assert (=> b!1403831 m!1292577))

(assert (=> b!1403831 m!1292577))

(declare-fun m!1292595 () Bool)

(assert (=> b!1403831 m!1292595))

(declare-fun m!1292597 () Bool)

(assert (=> start!120562 m!1292597))

(declare-fun m!1292599 () Bool)

(assert (=> start!120562 m!1292599))

(push 1)

(assert (not b!1403828))

(assert (not b!1403827))

(assert (not start!120562))

(assert (not b!1403826))

(assert (not b!1403830))

(assert (not b!1403831))

(assert (not b!1403832))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

