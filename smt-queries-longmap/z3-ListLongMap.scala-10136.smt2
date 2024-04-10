; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!119582 () Bool)

(assert start!119582)

(declare-fun b!1392923 () Bool)

(declare-fun res!932332 () Bool)

(declare-fun e!788762 () Bool)

(assert (=> b!1392923 (=> (not res!932332) (not e!788762))))

(declare-datatypes ((array!95264 0))(
  ( (array!95265 (arr!45990 (Array (_ BitVec 32) (_ BitVec 64))) (size!46540 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95264)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95264 (_ BitVec 32)) Bool)

(assert (=> b!1392923 (= res!932332 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1392924 () Bool)

(declare-fun res!932336 () Bool)

(assert (=> b!1392924 (=> (not res!932336) (not e!788762))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1392924 (= res!932336 (validKeyInArray!0 (select (arr!45990 a!2901) i!1037)))))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun b!1392925 () Bool)

(declare-fun e!788760 () Bool)

(declare-datatypes ((SeekEntryResult!10307 0))(
  ( (MissingZero!10307 (index!43599 (_ BitVec 32))) (Found!10307 (index!43600 (_ BitVec 32))) (Intermediate!10307 (undefined!11119 Bool) (index!43601 (_ BitVec 32)) (x!125287 (_ BitVec 32))) (Undefined!10307) (MissingVacant!10307 (index!43602 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95264 (_ BitVec 32)) SeekEntryResult!10307)

(assert (=> b!1392925 (= e!788760 (= (seekEntryOrOpen!0 (select (arr!45990 a!2901) j!112) a!2901 mask!2840) (Found!10307 j!112)))))

(declare-fun b!1392926 () Bool)

(declare-fun e!788761 () Bool)

(assert (=> b!1392926 (= e!788762 (not e!788761))))

(declare-fun res!932338 () Bool)

(assert (=> b!1392926 (=> res!932338 e!788761)))

(declare-fun lt!611799 () SeekEntryResult!10307)

(get-info :version)

(assert (=> b!1392926 (= res!932338 (or (not ((_ is Intermediate!10307) lt!611799)) (undefined!11119 lt!611799)))))

(assert (=> b!1392926 e!788760))

(declare-fun res!932331 () Bool)

(assert (=> b!1392926 (=> (not res!932331) (not e!788760))))

(assert (=> b!1392926 (= res!932331 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46618 0))(
  ( (Unit!46619) )
))
(declare-fun lt!611797 () Unit!46618)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95264 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46618)

(assert (=> b!1392926 (= lt!611797 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95264 (_ BitVec 32)) SeekEntryResult!10307)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1392926 (= lt!611799 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45990 a!2901) j!112) mask!2840) (select (arr!45990 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1392927 () Bool)

(declare-fun res!932333 () Bool)

(assert (=> b!1392927 (=> (not res!932333) (not e!788762))))

(assert (=> b!1392927 (= res!932333 (and (= (size!46540 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46540 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46540 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1392928 () Bool)

(declare-fun res!932337 () Bool)

(assert (=> b!1392928 (=> (not res!932337) (not e!788762))))

(declare-datatypes ((List!32509 0))(
  ( (Nil!32506) (Cons!32505 (h!33738 (_ BitVec 64)) (t!47203 List!32509)) )
))
(declare-fun arrayNoDuplicates!0 (array!95264 (_ BitVec 32) List!32509) Bool)

(assert (=> b!1392928 (= res!932337 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32506))))

(declare-fun b!1392929 () Bool)

(assert (=> b!1392929 (= e!788761 true)))

(declare-fun lt!611798 () SeekEntryResult!10307)

(assert (=> b!1392929 (= lt!611798 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!45990 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!45990 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95265 (store (arr!45990 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46540 a!2901)) mask!2840))))

(declare-fun res!932335 () Bool)

(assert (=> start!119582 (=> (not res!932335) (not e!788762))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119582 (= res!932335 (validMask!0 mask!2840))))

(assert (=> start!119582 e!788762))

(assert (=> start!119582 true))

(declare-fun array_inv!35018 (array!95264) Bool)

(assert (=> start!119582 (array_inv!35018 a!2901)))

(declare-fun b!1392930 () Bool)

(declare-fun res!932334 () Bool)

(assert (=> b!1392930 (=> (not res!932334) (not e!788762))))

(assert (=> b!1392930 (= res!932334 (validKeyInArray!0 (select (arr!45990 a!2901) j!112)))))

(assert (= (and start!119582 res!932335) b!1392927))

(assert (= (and b!1392927 res!932333) b!1392924))

(assert (= (and b!1392924 res!932336) b!1392930))

(assert (= (and b!1392930 res!932334) b!1392923))

(assert (= (and b!1392923 res!932332) b!1392928))

(assert (= (and b!1392928 res!932337) b!1392926))

(assert (= (and b!1392926 res!932331) b!1392925))

(assert (= (and b!1392926 (not res!932338)) b!1392929))

(declare-fun m!1278619 () Bool)

(assert (=> b!1392929 m!1278619))

(declare-fun m!1278621 () Bool)

(assert (=> b!1392929 m!1278621))

(assert (=> b!1392929 m!1278621))

(declare-fun m!1278623 () Bool)

(assert (=> b!1392929 m!1278623))

(assert (=> b!1392929 m!1278623))

(assert (=> b!1392929 m!1278621))

(declare-fun m!1278625 () Bool)

(assert (=> b!1392929 m!1278625))

(declare-fun m!1278627 () Bool)

(assert (=> b!1392930 m!1278627))

(assert (=> b!1392930 m!1278627))

(declare-fun m!1278629 () Bool)

(assert (=> b!1392930 m!1278629))

(assert (=> b!1392925 m!1278627))

(assert (=> b!1392925 m!1278627))

(declare-fun m!1278631 () Bool)

(assert (=> b!1392925 m!1278631))

(declare-fun m!1278633 () Bool)

(assert (=> b!1392924 m!1278633))

(assert (=> b!1392924 m!1278633))

(declare-fun m!1278635 () Bool)

(assert (=> b!1392924 m!1278635))

(declare-fun m!1278637 () Bool)

(assert (=> b!1392923 m!1278637))

(declare-fun m!1278639 () Bool)

(assert (=> b!1392928 m!1278639))

(assert (=> b!1392926 m!1278627))

(declare-fun m!1278641 () Bool)

(assert (=> b!1392926 m!1278641))

(assert (=> b!1392926 m!1278627))

(declare-fun m!1278643 () Bool)

(assert (=> b!1392926 m!1278643))

(assert (=> b!1392926 m!1278641))

(assert (=> b!1392926 m!1278627))

(declare-fun m!1278645 () Bool)

(assert (=> b!1392926 m!1278645))

(declare-fun m!1278647 () Bool)

(assert (=> b!1392926 m!1278647))

(declare-fun m!1278649 () Bool)

(assert (=> start!119582 m!1278649))

(declare-fun m!1278651 () Bool)

(assert (=> start!119582 m!1278651))

(check-sat (not start!119582) (not b!1392926) (not b!1392929) (not b!1392928) (not b!1392925) (not b!1392924) (not b!1392923) (not b!1392930))
