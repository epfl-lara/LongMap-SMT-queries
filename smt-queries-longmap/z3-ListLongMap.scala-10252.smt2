; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120566 () Bool)

(assert start!120566)

(declare-fun b!1403868 () Bool)

(declare-fun res!942380 () Bool)

(declare-fun e!794833 () Bool)

(assert (=> b!1403868 (=> (not res!942380) (not e!794833))))

(declare-datatypes ((array!95975 0))(
  ( (array!95976 (arr!46338 (Array (_ BitVec 32) (_ BitVec 64))) (size!46888 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95975)

(declare-datatypes ((List!32857 0))(
  ( (Nil!32854) (Cons!32853 (h!34101 (_ BitVec 64)) (t!47551 List!32857)) )
))
(declare-fun arrayNoDuplicates!0 (array!95975 (_ BitVec 32) List!32857) Bool)

(assert (=> b!1403868 (= res!942380 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32854))))

(declare-fun b!1403870 () Bool)

(declare-fun res!942379 () Bool)

(assert (=> b!1403870 (=> (not res!942379) (not e!794833))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1403870 (= res!942379 (validKeyInArray!0 (select (arr!46338 a!2901) i!1037)))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun e!794832 () Bool)

(declare-fun b!1403871 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10655 0))(
  ( (MissingZero!10655 (index!44997 (_ BitVec 32))) (Found!10655 (index!44998 (_ BitVec 32))) (Intermediate!10655 (undefined!11467 Bool) (index!44999 (_ BitVec 32)) (x!126602 (_ BitVec 32))) (Undefined!10655) (MissingVacant!10655 (index!45000 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95975 (_ BitVec 32)) SeekEntryResult!10655)

(assert (=> b!1403871 (= e!794832 (= (seekEntryOrOpen!0 (select (arr!46338 a!2901) j!112) a!2901 mask!2840) (Found!10655 j!112)))))

(declare-fun b!1403872 () Bool)

(declare-fun res!942382 () Bool)

(assert (=> b!1403872 (=> (not res!942382) (not e!794833))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95975 (_ BitVec 32)) Bool)

(assert (=> b!1403872 (= res!942382 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1403873 () Bool)

(declare-fun res!942385 () Bool)

(assert (=> b!1403873 (=> (not res!942385) (not e!794833))))

(assert (=> b!1403873 (= res!942385 (validKeyInArray!0 (select (arr!46338 a!2901) j!112)))))

(declare-fun b!1403874 () Bool)

(assert (=> b!1403874 (= e!794833 (not true))))

(assert (=> b!1403874 e!794832))

(declare-fun res!942383 () Bool)

(assert (=> b!1403874 (=> (not res!942383) (not e!794832))))

(assert (=> b!1403874 (= res!942383 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47314 0))(
  ( (Unit!47315) )
))
(declare-fun lt!618530 () Unit!47314)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95975 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47314)

(assert (=> b!1403874 (= lt!618530 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!618531 () SeekEntryResult!10655)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95975 (_ BitVec 32)) SeekEntryResult!10655)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1403874 (= lt!618531 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46338 a!2901) j!112) mask!2840) (select (arr!46338 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1403869 () Bool)

(declare-fun res!942381 () Bool)

(assert (=> b!1403869 (=> (not res!942381) (not e!794833))))

(assert (=> b!1403869 (= res!942381 (and (= (size!46888 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46888 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46888 a!2901)) (not (= i!1037 j!112))))))

(declare-fun res!942384 () Bool)

(assert (=> start!120566 (=> (not res!942384) (not e!794833))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120566 (= res!942384 (validMask!0 mask!2840))))

(assert (=> start!120566 e!794833))

(assert (=> start!120566 true))

(declare-fun array_inv!35366 (array!95975) Bool)

(assert (=> start!120566 (array_inv!35366 a!2901)))

(assert (= (and start!120566 res!942384) b!1403869))

(assert (= (and b!1403869 res!942381) b!1403870))

(assert (= (and b!1403870 res!942379) b!1403873))

(assert (= (and b!1403873 res!942385) b!1403872))

(assert (= (and b!1403872 res!942382) b!1403868))

(assert (= (and b!1403868 res!942380) b!1403874))

(assert (= (and b!1403874 res!942383) b!1403871))

(declare-fun m!1292627 () Bool)

(assert (=> b!1403874 m!1292627))

(declare-fun m!1292629 () Bool)

(assert (=> b!1403874 m!1292629))

(assert (=> b!1403874 m!1292627))

(declare-fun m!1292631 () Bool)

(assert (=> b!1403874 m!1292631))

(assert (=> b!1403874 m!1292629))

(assert (=> b!1403874 m!1292627))

(declare-fun m!1292633 () Bool)

(assert (=> b!1403874 m!1292633))

(declare-fun m!1292635 () Bool)

(assert (=> b!1403874 m!1292635))

(assert (=> b!1403873 m!1292627))

(assert (=> b!1403873 m!1292627))

(declare-fun m!1292637 () Bool)

(assert (=> b!1403873 m!1292637))

(declare-fun m!1292639 () Bool)

(assert (=> b!1403872 m!1292639))

(declare-fun m!1292641 () Bool)

(assert (=> b!1403870 m!1292641))

(assert (=> b!1403870 m!1292641))

(declare-fun m!1292643 () Bool)

(assert (=> b!1403870 m!1292643))

(declare-fun m!1292645 () Bool)

(assert (=> b!1403868 m!1292645))

(assert (=> b!1403871 m!1292627))

(assert (=> b!1403871 m!1292627))

(declare-fun m!1292647 () Bool)

(assert (=> b!1403871 m!1292647))

(declare-fun m!1292649 () Bool)

(assert (=> start!120566 m!1292649))

(declare-fun m!1292651 () Bool)

(assert (=> start!120566 m!1292651))

(check-sat (not b!1403874) (not b!1403872) (not b!1403870) (not b!1403871) (not b!1403873) (not start!120566) (not b!1403868))
