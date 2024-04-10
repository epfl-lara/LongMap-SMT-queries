; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122108 () Bool)

(assert start!122108)

(declare-fun b!1416974 () Bool)

(declare-fun res!952858 () Bool)

(declare-fun e!801957 () Bool)

(assert (=> b!1416974 (=> (not res!952858) (not e!801957))))

(declare-datatypes ((array!96743 0))(
  ( (array!96744 (arr!46701 (Array (_ BitVec 32) (_ BitVec 64))) (size!47251 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96743)

(declare-datatypes ((List!33220 0))(
  ( (Nil!33217) (Cons!33216 (h!34506 (_ BitVec 64)) (t!47914 List!33220)) )
))
(declare-fun arrayNoDuplicates!0 (array!96743 (_ BitVec 32) List!33220) Bool)

(assert (=> b!1416974 (= res!952858 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33217))))

(declare-fun b!1416975 () Bool)

(declare-fun res!952856 () Bool)

(assert (=> b!1416975 (=> (not res!952856) (not e!801957))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1416975 (= res!952856 (validKeyInArray!0 (select (arr!46701 a!2901) i!1037)))))

(declare-fun b!1416976 () Bool)

(declare-fun e!801958 () Bool)

(assert (=> b!1416976 (= e!801958 true)))

(declare-datatypes ((SeekEntryResult!11012 0))(
  ( (MissingZero!11012 (index!46440 (_ BitVec 32))) (Found!11012 (index!46441 (_ BitVec 32))) (Intermediate!11012 (undefined!11824 Bool) (index!46442 (_ BitVec 32)) (x!128041 (_ BitVec 32))) (Undefined!11012) (MissingVacant!11012 (index!46443 (_ BitVec 32))) )
))
(declare-fun lt!625186 () SeekEntryResult!11012)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96743 (_ BitVec 32)) SeekEntryResult!11012)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1416976 (= lt!625186 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46701 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46701 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96744 (store (arr!46701 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47251 a!2901)) mask!2840))))

(declare-fun b!1416977 () Bool)

(assert (=> b!1416977 (= e!801957 (not e!801958))))

(declare-fun res!952857 () Bool)

(assert (=> b!1416977 (=> res!952857 e!801958)))

(declare-fun lt!625187 () SeekEntryResult!11012)

(get-info :version)

(assert (=> b!1416977 (= res!952857 (or (not ((_ is Intermediate!11012) lt!625187)) (undefined!11824 lt!625187)))))

(declare-fun e!801956 () Bool)

(assert (=> b!1416977 e!801956))

(declare-fun res!952855 () Bool)

(assert (=> b!1416977 (=> (not res!952855) (not e!801956))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96743 (_ BitVec 32)) Bool)

(assert (=> b!1416977 (= res!952855 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47998 0))(
  ( (Unit!47999) )
))
(declare-fun lt!625188 () Unit!47998)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96743 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47998)

(assert (=> b!1416977 (= lt!625188 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1416977 (= lt!625187 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46701 a!2901) j!112) mask!2840) (select (arr!46701 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1416978 () Bool)

(declare-fun res!952852 () Bool)

(assert (=> b!1416978 (=> (not res!952852) (not e!801957))))

(assert (=> b!1416978 (= res!952852 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1416979 () Bool)

(declare-fun res!952853 () Bool)

(assert (=> b!1416979 (=> (not res!952853) (not e!801957))))

(assert (=> b!1416979 (= res!952853 (and (= (size!47251 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47251 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47251 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1416981 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96743 (_ BitVec 32)) SeekEntryResult!11012)

(assert (=> b!1416981 (= e!801956 (= (seekEntryOrOpen!0 (select (arr!46701 a!2901) j!112) a!2901 mask!2840) (Found!11012 j!112)))))

(declare-fun b!1416980 () Bool)

(declare-fun res!952851 () Bool)

(assert (=> b!1416980 (=> (not res!952851) (not e!801957))))

(assert (=> b!1416980 (= res!952851 (validKeyInArray!0 (select (arr!46701 a!2901) j!112)))))

(declare-fun res!952854 () Bool)

(assert (=> start!122108 (=> (not res!952854) (not e!801957))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122108 (= res!952854 (validMask!0 mask!2840))))

(assert (=> start!122108 e!801957))

(assert (=> start!122108 true))

(declare-fun array_inv!35729 (array!96743) Bool)

(assert (=> start!122108 (array_inv!35729 a!2901)))

(assert (= (and start!122108 res!952854) b!1416979))

(assert (= (and b!1416979 res!952853) b!1416975))

(assert (= (and b!1416975 res!952856) b!1416980))

(assert (= (and b!1416980 res!952851) b!1416978))

(assert (= (and b!1416978 res!952852) b!1416974))

(assert (= (and b!1416974 res!952858) b!1416977))

(assert (= (and b!1416977 res!952855) b!1416981))

(assert (= (and b!1416977 (not res!952857)) b!1416976))

(declare-fun m!1307713 () Bool)

(assert (=> b!1416977 m!1307713))

(declare-fun m!1307715 () Bool)

(assert (=> b!1416977 m!1307715))

(assert (=> b!1416977 m!1307713))

(declare-fun m!1307717 () Bool)

(assert (=> b!1416977 m!1307717))

(assert (=> b!1416977 m!1307715))

(assert (=> b!1416977 m!1307713))

(declare-fun m!1307719 () Bool)

(assert (=> b!1416977 m!1307719))

(declare-fun m!1307721 () Bool)

(assert (=> b!1416977 m!1307721))

(declare-fun m!1307723 () Bool)

(assert (=> b!1416978 m!1307723))

(declare-fun m!1307725 () Bool)

(assert (=> start!122108 m!1307725))

(declare-fun m!1307727 () Bool)

(assert (=> start!122108 m!1307727))

(assert (=> b!1416981 m!1307713))

(assert (=> b!1416981 m!1307713))

(declare-fun m!1307729 () Bool)

(assert (=> b!1416981 m!1307729))

(assert (=> b!1416980 m!1307713))

(assert (=> b!1416980 m!1307713))

(declare-fun m!1307731 () Bool)

(assert (=> b!1416980 m!1307731))

(declare-fun m!1307733 () Bool)

(assert (=> b!1416975 m!1307733))

(assert (=> b!1416975 m!1307733))

(declare-fun m!1307735 () Bool)

(assert (=> b!1416975 m!1307735))

(declare-fun m!1307737 () Bool)

(assert (=> b!1416976 m!1307737))

(declare-fun m!1307739 () Bool)

(assert (=> b!1416976 m!1307739))

(assert (=> b!1416976 m!1307739))

(declare-fun m!1307741 () Bool)

(assert (=> b!1416976 m!1307741))

(assert (=> b!1416976 m!1307741))

(assert (=> b!1416976 m!1307739))

(declare-fun m!1307743 () Bool)

(assert (=> b!1416976 m!1307743))

(declare-fun m!1307745 () Bool)

(assert (=> b!1416974 m!1307745))

(check-sat (not b!1416975) (not b!1416980) (not b!1416976) (not b!1416974) (not b!1416978) (not start!122108) (not b!1416977) (not b!1416981))
