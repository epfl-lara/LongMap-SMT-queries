; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!119588 () Bool)

(assert start!119588)

(declare-fun b!1392995 () Bool)

(declare-fun res!932405 () Bool)

(declare-fun e!788796 () Bool)

(assert (=> b!1392995 (=> (not res!932405) (not e!788796))))

(declare-datatypes ((array!95270 0))(
  ( (array!95271 (arr!45993 (Array (_ BitVec 32) (_ BitVec 64))) (size!46543 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95270)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun mask!2840 () (_ BitVec 32))

(assert (=> b!1392995 (= res!932405 (and (= (size!46543 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46543 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46543 a!2901)) (not (= i!1037 j!112))))))

(declare-fun e!788795 () Bool)

(declare-fun b!1392996 () Bool)

(declare-datatypes ((SeekEntryResult!10310 0))(
  ( (MissingZero!10310 (index!43611 (_ BitVec 32))) (Found!10310 (index!43612 (_ BitVec 32))) (Intermediate!10310 (undefined!11122 Bool) (index!43613 (_ BitVec 32)) (x!125298 (_ BitVec 32))) (Undefined!10310) (MissingVacant!10310 (index!43614 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95270 (_ BitVec 32)) SeekEntryResult!10310)

(assert (=> b!1392996 (= e!788795 (= (seekEntryOrOpen!0 (select (arr!45993 a!2901) j!112) a!2901 mask!2840) (Found!10310 j!112)))))

(declare-fun b!1392997 () Bool)

(declare-fun e!788798 () Bool)

(assert (=> b!1392997 (= e!788798 true)))

(declare-fun lt!611826 () SeekEntryResult!10310)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95270 (_ BitVec 32)) SeekEntryResult!10310)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1392997 (= lt!611826 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!45993 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!45993 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95271 (store (arr!45993 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46543 a!2901)) mask!2840))))

(declare-fun b!1392998 () Bool)

(declare-fun res!932404 () Bool)

(assert (=> b!1392998 (=> (not res!932404) (not e!788796))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95270 (_ BitVec 32)) Bool)

(assert (=> b!1392998 (= res!932404 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1392999 () Bool)

(declare-fun res!932410 () Bool)

(assert (=> b!1392999 (=> (not res!932410) (not e!788796))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1392999 (= res!932410 (validKeyInArray!0 (select (arr!45993 a!2901) j!112)))))

(declare-fun b!1393000 () Bool)

(declare-fun res!932406 () Bool)

(assert (=> b!1393000 (=> (not res!932406) (not e!788796))))

(declare-datatypes ((List!32512 0))(
  ( (Nil!32509) (Cons!32508 (h!33741 (_ BitVec 64)) (t!47206 List!32512)) )
))
(declare-fun arrayNoDuplicates!0 (array!95270 (_ BitVec 32) List!32512) Bool)

(assert (=> b!1393000 (= res!932406 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32509))))

(declare-fun b!1393001 () Bool)

(assert (=> b!1393001 (= e!788796 (not e!788798))))

(declare-fun res!932408 () Bool)

(assert (=> b!1393001 (=> res!932408 e!788798)))

(declare-fun lt!611825 () SeekEntryResult!10310)

(get-info :version)

(assert (=> b!1393001 (= res!932408 (or (not ((_ is Intermediate!10310) lt!611825)) (undefined!11122 lt!611825)))))

(assert (=> b!1393001 e!788795))

(declare-fun res!932407 () Bool)

(assert (=> b!1393001 (=> (not res!932407) (not e!788795))))

(assert (=> b!1393001 (= res!932407 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46624 0))(
  ( (Unit!46625) )
))
(declare-fun lt!611824 () Unit!46624)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95270 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46624)

(assert (=> b!1393001 (= lt!611824 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1393001 (= lt!611825 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45993 a!2901) j!112) mask!2840) (select (arr!45993 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1393002 () Bool)

(declare-fun res!932409 () Bool)

(assert (=> b!1393002 (=> (not res!932409) (not e!788796))))

(assert (=> b!1393002 (= res!932409 (validKeyInArray!0 (select (arr!45993 a!2901) i!1037)))))

(declare-fun res!932403 () Bool)

(assert (=> start!119588 (=> (not res!932403) (not e!788796))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119588 (= res!932403 (validMask!0 mask!2840))))

(assert (=> start!119588 e!788796))

(assert (=> start!119588 true))

(declare-fun array_inv!35021 (array!95270) Bool)

(assert (=> start!119588 (array_inv!35021 a!2901)))

(assert (= (and start!119588 res!932403) b!1392995))

(assert (= (and b!1392995 res!932405) b!1393002))

(assert (= (and b!1393002 res!932409) b!1392999))

(assert (= (and b!1392999 res!932410) b!1392998))

(assert (= (and b!1392998 res!932404) b!1393000))

(assert (= (and b!1393000 res!932406) b!1393001))

(assert (= (and b!1393001 res!932407) b!1392996))

(assert (= (and b!1393001 (not res!932408)) b!1392997))

(declare-fun m!1278721 () Bool)

(assert (=> b!1393002 m!1278721))

(assert (=> b!1393002 m!1278721))

(declare-fun m!1278723 () Bool)

(assert (=> b!1393002 m!1278723))

(declare-fun m!1278725 () Bool)

(assert (=> b!1393001 m!1278725))

(declare-fun m!1278727 () Bool)

(assert (=> b!1393001 m!1278727))

(assert (=> b!1393001 m!1278725))

(declare-fun m!1278729 () Bool)

(assert (=> b!1393001 m!1278729))

(assert (=> b!1393001 m!1278727))

(assert (=> b!1393001 m!1278725))

(declare-fun m!1278731 () Bool)

(assert (=> b!1393001 m!1278731))

(declare-fun m!1278733 () Bool)

(assert (=> b!1393001 m!1278733))

(declare-fun m!1278735 () Bool)

(assert (=> start!119588 m!1278735))

(declare-fun m!1278737 () Bool)

(assert (=> start!119588 m!1278737))

(declare-fun m!1278739 () Bool)

(assert (=> b!1392998 m!1278739))

(assert (=> b!1392999 m!1278725))

(assert (=> b!1392999 m!1278725))

(declare-fun m!1278741 () Bool)

(assert (=> b!1392999 m!1278741))

(assert (=> b!1392996 m!1278725))

(assert (=> b!1392996 m!1278725))

(declare-fun m!1278743 () Bool)

(assert (=> b!1392996 m!1278743))

(declare-fun m!1278745 () Bool)

(assert (=> b!1392997 m!1278745))

(declare-fun m!1278747 () Bool)

(assert (=> b!1392997 m!1278747))

(assert (=> b!1392997 m!1278747))

(declare-fun m!1278749 () Bool)

(assert (=> b!1392997 m!1278749))

(assert (=> b!1392997 m!1278749))

(assert (=> b!1392997 m!1278747))

(declare-fun m!1278751 () Bool)

(assert (=> b!1392997 m!1278751))

(declare-fun m!1278753 () Bool)

(assert (=> b!1393000 m!1278753))

(check-sat (not b!1393001) (not start!119588) (not b!1392999) (not b!1392998) (not b!1392997) (not b!1393000) (not b!1392996) (not b!1393002))
