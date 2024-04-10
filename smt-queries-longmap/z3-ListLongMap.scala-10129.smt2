; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!119432 () Bool)

(assert start!119432)

(declare-fun b!1391909 () Bool)

(declare-fun e!788195 () Bool)

(declare-fun mask!2840 () (_ BitVec 32))

(assert (=> b!1391909 (= e!788195 (bvsge mask!2840 #b00000000000000000000000000000000))))

(declare-datatypes ((array!95216 0))(
  ( (array!95217 (arr!45969 (Array (_ BitVec 32) (_ BitVec 64))) (size!46519 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95216)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun lt!611392 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1391909 (= lt!611392 (toIndex!0 (select (store (arr!45969 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840))))

(declare-fun b!1391910 () Bool)

(declare-fun res!931633 () Bool)

(declare-fun e!788198 () Bool)

(assert (=> b!1391910 (=> (not res!931633) (not e!788198))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95216 (_ BitVec 32)) Bool)

(assert (=> b!1391910 (= res!931633 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1391911 () Bool)

(declare-fun res!931634 () Bool)

(assert (=> b!1391911 (=> (not res!931634) (not e!788198))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1391911 (= res!931634 (validKeyInArray!0 (select (arr!45969 a!2901) j!112)))))

(declare-fun b!1391913 () Bool)

(assert (=> b!1391913 (= e!788198 (not e!788195))))

(declare-fun res!931630 () Bool)

(assert (=> b!1391913 (=> res!931630 e!788195)))

(declare-datatypes ((SeekEntryResult!10286 0))(
  ( (MissingZero!10286 (index!43515 (_ BitVec 32))) (Found!10286 (index!43516 (_ BitVec 32))) (Intermediate!10286 (undefined!11098 Bool) (index!43517 (_ BitVec 32)) (x!125198 (_ BitVec 32))) (Undefined!10286) (MissingVacant!10286 (index!43518 (_ BitVec 32))) )
))
(declare-fun lt!611393 () SeekEntryResult!10286)

(get-info :version)

(assert (=> b!1391913 (= res!931630 (or (not ((_ is Intermediate!10286) lt!611393)) (undefined!11098 lt!611393)))))

(declare-fun e!788197 () Bool)

(assert (=> b!1391913 e!788197))

(declare-fun res!931636 () Bool)

(assert (=> b!1391913 (=> (not res!931636) (not e!788197))))

(assert (=> b!1391913 (= res!931636 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46576 0))(
  ( (Unit!46577) )
))
(declare-fun lt!611394 () Unit!46576)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95216 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46576)

(assert (=> b!1391913 (= lt!611394 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95216 (_ BitVec 32)) SeekEntryResult!10286)

(assert (=> b!1391913 (= lt!611393 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45969 a!2901) j!112) mask!2840) (select (arr!45969 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1391914 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95216 (_ BitVec 32)) SeekEntryResult!10286)

(assert (=> b!1391914 (= e!788197 (= (seekEntryOrOpen!0 (select (arr!45969 a!2901) j!112) a!2901 mask!2840) (Found!10286 j!112)))))

(declare-fun b!1391915 () Bool)

(declare-fun res!931629 () Bool)

(assert (=> b!1391915 (=> (not res!931629) (not e!788198))))

(assert (=> b!1391915 (= res!931629 (validKeyInArray!0 (select (arr!45969 a!2901) i!1037)))))

(declare-fun b!1391916 () Bool)

(declare-fun res!931631 () Bool)

(assert (=> b!1391916 (=> (not res!931631) (not e!788198))))

(declare-datatypes ((List!32488 0))(
  ( (Nil!32485) (Cons!32484 (h!33711 (_ BitVec 64)) (t!47182 List!32488)) )
))
(declare-fun arrayNoDuplicates!0 (array!95216 (_ BitVec 32) List!32488) Bool)

(assert (=> b!1391916 (= res!931631 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32485))))

(declare-fun res!931632 () Bool)

(assert (=> start!119432 (=> (not res!931632) (not e!788198))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119432 (= res!931632 (validMask!0 mask!2840))))

(assert (=> start!119432 e!788198))

(assert (=> start!119432 true))

(declare-fun array_inv!34997 (array!95216) Bool)

(assert (=> start!119432 (array_inv!34997 a!2901)))

(declare-fun b!1391912 () Bool)

(declare-fun res!931635 () Bool)

(assert (=> b!1391912 (=> (not res!931635) (not e!788198))))

(assert (=> b!1391912 (= res!931635 (and (= (size!46519 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46519 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46519 a!2901)) (not (= i!1037 j!112))))))

(assert (= (and start!119432 res!931632) b!1391912))

(assert (= (and b!1391912 res!931635) b!1391915))

(assert (= (and b!1391915 res!931629) b!1391911))

(assert (= (and b!1391911 res!931634) b!1391910))

(assert (= (and b!1391910 res!931633) b!1391916))

(assert (= (and b!1391916 res!931631) b!1391913))

(assert (= (and b!1391913 res!931636) b!1391914))

(assert (= (and b!1391913 (not res!931630)) b!1391909))

(declare-fun m!1277651 () Bool)

(assert (=> b!1391916 m!1277651))

(declare-fun m!1277653 () Bool)

(assert (=> b!1391909 m!1277653))

(declare-fun m!1277655 () Bool)

(assert (=> b!1391909 m!1277655))

(assert (=> b!1391909 m!1277655))

(declare-fun m!1277657 () Bool)

(assert (=> b!1391909 m!1277657))

(declare-fun m!1277659 () Bool)

(assert (=> b!1391914 m!1277659))

(assert (=> b!1391914 m!1277659))

(declare-fun m!1277661 () Bool)

(assert (=> b!1391914 m!1277661))

(declare-fun m!1277663 () Bool)

(assert (=> b!1391915 m!1277663))

(assert (=> b!1391915 m!1277663))

(declare-fun m!1277665 () Bool)

(assert (=> b!1391915 m!1277665))

(declare-fun m!1277667 () Bool)

(assert (=> start!119432 m!1277667))

(declare-fun m!1277669 () Bool)

(assert (=> start!119432 m!1277669))

(declare-fun m!1277671 () Bool)

(assert (=> b!1391910 m!1277671))

(assert (=> b!1391913 m!1277659))

(declare-fun m!1277673 () Bool)

(assert (=> b!1391913 m!1277673))

(assert (=> b!1391913 m!1277659))

(declare-fun m!1277675 () Bool)

(assert (=> b!1391913 m!1277675))

(assert (=> b!1391913 m!1277673))

(assert (=> b!1391913 m!1277659))

(declare-fun m!1277677 () Bool)

(assert (=> b!1391913 m!1277677))

(declare-fun m!1277679 () Bool)

(assert (=> b!1391913 m!1277679))

(assert (=> b!1391911 m!1277659))

(assert (=> b!1391911 m!1277659))

(declare-fun m!1277681 () Bool)

(assert (=> b!1391911 m!1277681))

(check-sat (not b!1391913) (not b!1391909) (not b!1391914) (not b!1391911) (not start!119432) (not b!1391910) (not b!1391915) (not b!1391916))
(check-sat)
