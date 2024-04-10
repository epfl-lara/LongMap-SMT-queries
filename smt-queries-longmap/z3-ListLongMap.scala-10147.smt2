; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!119648 () Bool)

(assert start!119648)

(declare-fun res!933130 () Bool)

(declare-fun e!789156 () Bool)

(assert (=> start!119648 (=> (not res!933130) (not e!789156))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119648 (= res!933130 (validMask!0 mask!2840))))

(assert (=> start!119648 e!789156))

(assert (=> start!119648 true))

(declare-datatypes ((array!95330 0))(
  ( (array!95331 (arr!46023 (Array (_ BitVec 32) (_ BitVec 64))) (size!46573 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95330)

(declare-fun array_inv!35051 (array!95330) Bool)

(assert (=> start!119648 (array_inv!35051 a!2901)))

(declare-fun b!1393715 () Bool)

(declare-fun res!933127 () Bool)

(assert (=> b!1393715 (=> (not res!933127) (not e!789156))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1393715 (= res!933127 (and (= (size!46573 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46573 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46573 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1393716 () Bool)

(declare-fun res!933129 () Bool)

(assert (=> b!1393716 (=> (not res!933129) (not e!789156))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95330 (_ BitVec 32)) Bool)

(assert (=> b!1393716 (= res!933129 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1393717 () Bool)

(declare-fun res!933125 () Bool)

(assert (=> b!1393717 (=> (not res!933125) (not e!789156))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1393717 (= res!933125 (validKeyInArray!0 (select (arr!46023 a!2901) j!112)))))

(declare-fun b!1393718 () Bool)

(declare-fun res!933124 () Bool)

(assert (=> b!1393718 (=> (not res!933124) (not e!789156))))

(declare-datatypes ((List!32542 0))(
  ( (Nil!32539) (Cons!32538 (h!33771 (_ BitVec 64)) (t!47236 List!32542)) )
))
(declare-fun arrayNoDuplicates!0 (array!95330 (_ BitVec 32) List!32542) Bool)

(assert (=> b!1393718 (= res!933124 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32539))))

(declare-fun b!1393719 () Bool)

(declare-fun res!933123 () Bool)

(assert (=> b!1393719 (=> (not res!933123) (not e!789156))))

(assert (=> b!1393719 (= res!933123 (validKeyInArray!0 (select (arr!46023 a!2901) i!1037)))))

(declare-fun b!1393720 () Bool)

(declare-fun e!789157 () Bool)

(assert (=> b!1393720 (= e!789156 (not e!789157))))

(declare-fun res!933128 () Bool)

(assert (=> b!1393720 (=> res!933128 e!789157)))

(declare-datatypes ((SeekEntryResult!10340 0))(
  ( (MissingZero!10340 (index!43731 (_ BitVec 32))) (Found!10340 (index!43732 (_ BitVec 32))) (Intermediate!10340 (undefined!11152 Bool) (index!43733 (_ BitVec 32)) (x!125408 (_ BitVec 32))) (Undefined!10340) (MissingVacant!10340 (index!43734 (_ BitVec 32))) )
))
(declare-fun lt!612095 () SeekEntryResult!10340)

(get-info :version)

(assert (=> b!1393720 (= res!933128 (or (not ((_ is Intermediate!10340) lt!612095)) (undefined!11152 lt!612095)))))

(declare-fun e!789155 () Bool)

(assert (=> b!1393720 e!789155))

(declare-fun res!933126 () Bool)

(assert (=> b!1393720 (=> (not res!933126) (not e!789155))))

(assert (=> b!1393720 (= res!933126 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46684 0))(
  ( (Unit!46685) )
))
(declare-fun lt!612094 () Unit!46684)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95330 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46684)

(assert (=> b!1393720 (= lt!612094 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95330 (_ BitVec 32)) SeekEntryResult!10340)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1393720 (= lt!612095 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46023 a!2901) j!112) mask!2840) (select (arr!46023 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1393721 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95330 (_ BitVec 32)) SeekEntryResult!10340)

(assert (=> b!1393721 (= e!789155 (= (seekEntryOrOpen!0 (select (arr!46023 a!2901) j!112) a!2901 mask!2840) (Found!10340 j!112)))))

(declare-fun b!1393722 () Bool)

(assert (=> b!1393722 (= e!789157 true)))

(declare-fun lt!612096 () SeekEntryResult!10340)

(assert (=> b!1393722 (= lt!612096 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46023 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46023 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95331 (store (arr!46023 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46573 a!2901)) mask!2840))))

(assert (= (and start!119648 res!933130) b!1393715))

(assert (= (and b!1393715 res!933127) b!1393719))

(assert (= (and b!1393719 res!933123) b!1393717))

(assert (= (and b!1393717 res!933125) b!1393716))

(assert (= (and b!1393716 res!933129) b!1393718))

(assert (= (and b!1393718 res!933124) b!1393720))

(assert (= (and b!1393720 res!933126) b!1393721))

(assert (= (and b!1393720 (not res!933128)) b!1393722))

(declare-fun m!1279741 () Bool)

(assert (=> b!1393717 m!1279741))

(assert (=> b!1393717 m!1279741))

(declare-fun m!1279743 () Bool)

(assert (=> b!1393717 m!1279743))

(declare-fun m!1279745 () Bool)

(assert (=> b!1393718 m!1279745))

(declare-fun m!1279747 () Bool)

(assert (=> start!119648 m!1279747))

(declare-fun m!1279749 () Bool)

(assert (=> start!119648 m!1279749))

(assert (=> b!1393721 m!1279741))

(assert (=> b!1393721 m!1279741))

(declare-fun m!1279751 () Bool)

(assert (=> b!1393721 m!1279751))

(declare-fun m!1279753 () Bool)

(assert (=> b!1393722 m!1279753))

(declare-fun m!1279755 () Bool)

(assert (=> b!1393722 m!1279755))

(assert (=> b!1393722 m!1279755))

(declare-fun m!1279757 () Bool)

(assert (=> b!1393722 m!1279757))

(assert (=> b!1393722 m!1279757))

(assert (=> b!1393722 m!1279755))

(declare-fun m!1279759 () Bool)

(assert (=> b!1393722 m!1279759))

(assert (=> b!1393720 m!1279741))

(declare-fun m!1279761 () Bool)

(assert (=> b!1393720 m!1279761))

(assert (=> b!1393720 m!1279741))

(declare-fun m!1279763 () Bool)

(assert (=> b!1393720 m!1279763))

(assert (=> b!1393720 m!1279761))

(assert (=> b!1393720 m!1279741))

(declare-fun m!1279765 () Bool)

(assert (=> b!1393720 m!1279765))

(declare-fun m!1279767 () Bool)

(assert (=> b!1393720 m!1279767))

(declare-fun m!1279769 () Bool)

(assert (=> b!1393719 m!1279769))

(assert (=> b!1393719 m!1279769))

(declare-fun m!1279771 () Bool)

(assert (=> b!1393719 m!1279771))

(declare-fun m!1279773 () Bool)

(assert (=> b!1393716 m!1279773))

(check-sat (not b!1393717) (not b!1393719) (not b!1393720) (not b!1393718) (not b!1393721) (not b!1393722) (not b!1393716) (not start!119648))
