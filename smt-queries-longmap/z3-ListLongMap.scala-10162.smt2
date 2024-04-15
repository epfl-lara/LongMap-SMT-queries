; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!119732 () Bool)

(assert start!119732)

(declare-fun b!1394773 () Bool)

(declare-fun res!934238 () Bool)

(declare-fun e!789656 () Bool)

(assert (=> b!1394773 (=> res!934238 e!789656)))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95367 0))(
  ( (array!95368 (arr!46042 (Array (_ BitVec 32) (_ BitVec 64))) (size!46594 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95367)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10385 0))(
  ( (MissingZero!10385 (index!43911 (_ BitVec 32))) (Found!10385 (index!43912 (_ BitVec 32))) (Intermediate!10385 (undefined!11197 Bool) (index!43913 (_ BitVec 32)) (x!125570 (_ BitVec 32))) (Undefined!10385) (MissingVacant!10385 (index!43914 (_ BitVec 32))) )
))
(declare-fun lt!612587 () SeekEntryResult!10385)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95367 (_ BitVec 32)) SeekEntryResult!10385)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1394773 (= res!934238 (= lt!612587 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46042 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46042 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95368 (store (arr!46042 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46594 a!2901)) mask!2840)))))

(declare-fun b!1394774 () Bool)

(declare-fun res!934240 () Bool)

(declare-fun e!789654 () Bool)

(assert (=> b!1394774 (=> (not res!934240) (not e!789654))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95367 (_ BitVec 32)) Bool)

(assert (=> b!1394774 (= res!934240 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun e!789653 () Bool)

(declare-fun b!1394775 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95367 (_ BitVec 32)) SeekEntryResult!10385)

(assert (=> b!1394775 (= e!789653 (= (seekEntryOrOpen!0 (select (arr!46042 a!2901) j!112) a!2901 mask!2840) (Found!10385 j!112)))))

(declare-fun b!1394776 () Bool)

(declare-fun res!934232 () Bool)

(assert (=> b!1394776 (=> (not res!934232) (not e!789654))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1394776 (= res!934232 (validKeyInArray!0 (select (arr!46042 a!2901) j!112)))))

(declare-fun b!1394777 () Bool)

(assert (=> b!1394777 (= e!789656 (bvsge mask!2840 #b00000000000000000000000000000000))))

(declare-fun b!1394778 () Bool)

(declare-fun res!934235 () Bool)

(assert (=> b!1394778 (=> (not res!934235) (not e!789654))))

(assert (=> b!1394778 (= res!934235 (and (= (size!46594 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46594 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46594 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1394779 () Bool)

(assert (=> b!1394779 (= e!789654 (not e!789656))))

(declare-fun res!934233 () Bool)

(assert (=> b!1394779 (=> res!934233 e!789656)))

(get-info :version)

(assert (=> b!1394779 (= res!934233 (or (not ((_ is Intermediate!10385) lt!612587)) (undefined!11197 lt!612587)))))

(assert (=> b!1394779 e!789653))

(declare-fun res!934236 () Bool)

(assert (=> b!1394779 (=> (not res!934236) (not e!789653))))

(assert (=> b!1394779 (= res!934236 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46617 0))(
  ( (Unit!46618) )
))
(declare-fun lt!612586 () Unit!46617)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95367 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46617)

(assert (=> b!1394779 (= lt!612586 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1394779 (= lt!612587 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46042 a!2901) j!112) mask!2840) (select (arr!46042 a!2901) j!112) a!2901 mask!2840))))

(declare-fun res!934234 () Bool)

(assert (=> start!119732 (=> (not res!934234) (not e!789654))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119732 (= res!934234 (validMask!0 mask!2840))))

(assert (=> start!119732 e!789654))

(assert (=> start!119732 true))

(declare-fun array_inv!35275 (array!95367) Bool)

(assert (=> start!119732 (array_inv!35275 a!2901)))

(declare-fun b!1394780 () Bool)

(declare-fun res!934237 () Bool)

(assert (=> b!1394780 (=> (not res!934237) (not e!789654))))

(assert (=> b!1394780 (= res!934237 (validKeyInArray!0 (select (arr!46042 a!2901) i!1037)))))

(declare-fun b!1394781 () Bool)

(declare-fun res!934239 () Bool)

(assert (=> b!1394781 (=> (not res!934239) (not e!789654))))

(declare-datatypes ((List!32639 0))(
  ( (Nil!32636) (Cons!32635 (h!33868 (_ BitVec 64)) (t!47325 List!32639)) )
))
(declare-fun arrayNoDuplicates!0 (array!95367 (_ BitVec 32) List!32639) Bool)

(assert (=> b!1394781 (= res!934239 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32636))))

(assert (= (and start!119732 res!934234) b!1394778))

(assert (= (and b!1394778 res!934235) b!1394780))

(assert (= (and b!1394780 res!934237) b!1394776))

(assert (= (and b!1394776 res!934232) b!1394774))

(assert (= (and b!1394774 res!934240) b!1394781))

(assert (= (and b!1394781 res!934239) b!1394779))

(assert (= (and b!1394779 res!934236) b!1394775))

(assert (= (and b!1394779 (not res!934233)) b!1394773))

(assert (= (and b!1394773 (not res!934238)) b!1394777))

(declare-fun m!1280803 () Bool)

(assert (=> b!1394775 m!1280803))

(assert (=> b!1394775 m!1280803))

(declare-fun m!1280805 () Bool)

(assert (=> b!1394775 m!1280805))

(declare-fun m!1280807 () Bool)

(assert (=> start!119732 m!1280807))

(declare-fun m!1280809 () Bool)

(assert (=> start!119732 m!1280809))

(assert (=> b!1394779 m!1280803))

(declare-fun m!1280811 () Bool)

(assert (=> b!1394779 m!1280811))

(assert (=> b!1394779 m!1280803))

(declare-fun m!1280813 () Bool)

(assert (=> b!1394779 m!1280813))

(assert (=> b!1394779 m!1280811))

(assert (=> b!1394779 m!1280803))

(declare-fun m!1280815 () Bool)

(assert (=> b!1394779 m!1280815))

(declare-fun m!1280817 () Bool)

(assert (=> b!1394779 m!1280817))

(declare-fun m!1280819 () Bool)

(assert (=> b!1394773 m!1280819))

(declare-fun m!1280821 () Bool)

(assert (=> b!1394773 m!1280821))

(assert (=> b!1394773 m!1280821))

(declare-fun m!1280823 () Bool)

(assert (=> b!1394773 m!1280823))

(assert (=> b!1394773 m!1280823))

(assert (=> b!1394773 m!1280821))

(declare-fun m!1280825 () Bool)

(assert (=> b!1394773 m!1280825))

(declare-fun m!1280827 () Bool)

(assert (=> b!1394781 m!1280827))

(declare-fun m!1280829 () Bool)

(assert (=> b!1394780 m!1280829))

(assert (=> b!1394780 m!1280829))

(declare-fun m!1280831 () Bool)

(assert (=> b!1394780 m!1280831))

(declare-fun m!1280833 () Bool)

(assert (=> b!1394774 m!1280833))

(assert (=> b!1394776 m!1280803))

(assert (=> b!1394776 m!1280803))

(declare-fun m!1280835 () Bool)

(assert (=> b!1394776 m!1280835))

(check-sat (not b!1394774) (not b!1394773) (not b!1394780) (not b!1394775) (not start!119732) (not b!1394776) (not b!1394779) (not b!1394781))
(check-sat)
