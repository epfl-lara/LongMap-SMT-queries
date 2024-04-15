; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!119426 () Bool)

(assert start!119426)

(declare-fun b!1391804 () Bool)

(declare-fun res!931576 () Bool)

(declare-fun e!788146 () Bool)

(assert (=> b!1391804 (=> (not res!931576) (not e!788146))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95163 0))(
  ( (array!95164 (arr!45943 (Array (_ BitVec 32) (_ BitVec 64))) (size!46495 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95163)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1391804 (= res!931576 (and (= (size!46495 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46495 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46495 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1391805 () Bool)

(declare-fun res!931578 () Bool)

(assert (=> b!1391805 (=> (not res!931578) (not e!788146))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1391805 (= res!931578 (validKeyInArray!0 (select (arr!45943 a!2901) j!112)))))

(declare-fun b!1391807 () Bool)

(declare-fun res!931577 () Bool)

(assert (=> b!1391807 (=> (not res!931577) (not e!788146))))

(declare-datatypes ((List!32540 0))(
  ( (Nil!32537) (Cons!32536 (h!33763 (_ BitVec 64)) (t!47226 List!32540)) )
))
(declare-fun arrayNoDuplicates!0 (array!95163 (_ BitVec 32) List!32540) Bool)

(assert (=> b!1391807 (= res!931577 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32537))))

(declare-fun b!1391808 () Bool)

(declare-fun e!788145 () Bool)

(assert (=> b!1391808 (= e!788146 (not e!788145))))

(declare-fun res!931581 () Bool)

(assert (=> b!1391808 (=> res!931581 e!788145)))

(declare-datatypes ((SeekEntryResult!10286 0))(
  ( (MissingZero!10286 (index!43515 (_ BitVec 32))) (Found!10286 (index!43516 (_ BitVec 32))) (Intermediate!10286 (undefined!11098 Bool) (index!43517 (_ BitVec 32)) (x!125195 (_ BitVec 32))) (Undefined!10286) (MissingVacant!10286 (index!43518 (_ BitVec 32))) )
))
(declare-fun lt!611193 () SeekEntryResult!10286)

(get-info :version)

(assert (=> b!1391808 (= res!931581 (or (not ((_ is Intermediate!10286) lt!611193)) (undefined!11098 lt!611193)))))

(declare-fun e!788147 () Bool)

(assert (=> b!1391808 e!788147))

(declare-fun res!931575 () Bool)

(assert (=> b!1391808 (=> (not res!931575) (not e!788147))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95163 (_ BitVec 32)) Bool)

(assert (=> b!1391808 (= res!931575 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46419 0))(
  ( (Unit!46420) )
))
(declare-fun lt!611195 () Unit!46419)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95163 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46419)

(assert (=> b!1391808 (= lt!611195 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95163 (_ BitVec 32)) SeekEntryResult!10286)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1391808 (= lt!611193 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45943 a!2901) j!112) mask!2840) (select (arr!45943 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1391809 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95163 (_ BitVec 32)) SeekEntryResult!10286)

(assert (=> b!1391809 (= e!788147 (= (seekEntryOrOpen!0 (select (arr!45943 a!2901) j!112) a!2901 mask!2840) (Found!10286 j!112)))))

(declare-fun res!931580 () Bool)

(assert (=> start!119426 (=> (not res!931580) (not e!788146))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119426 (= res!931580 (validMask!0 mask!2840))))

(assert (=> start!119426 e!788146))

(assert (=> start!119426 true))

(declare-fun array_inv!35176 (array!95163) Bool)

(assert (=> start!119426 (array_inv!35176 a!2901)))

(declare-fun b!1391806 () Bool)

(assert (=> b!1391806 (= e!788145 (bvsge mask!2840 #b00000000000000000000000000000000))))

(declare-fun lt!611194 () (_ BitVec 32))

(assert (=> b!1391806 (= lt!611194 (toIndex!0 (select (store (arr!45943 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840))))

(declare-fun b!1391810 () Bool)

(declare-fun res!931582 () Bool)

(assert (=> b!1391810 (=> (not res!931582) (not e!788146))))

(assert (=> b!1391810 (= res!931582 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1391811 () Bool)

(declare-fun res!931579 () Bool)

(assert (=> b!1391811 (=> (not res!931579) (not e!788146))))

(assert (=> b!1391811 (= res!931579 (validKeyInArray!0 (select (arr!45943 a!2901) i!1037)))))

(assert (= (and start!119426 res!931580) b!1391804))

(assert (= (and b!1391804 res!931576) b!1391811))

(assert (= (and b!1391811 res!931579) b!1391805))

(assert (= (and b!1391805 res!931578) b!1391810))

(assert (= (and b!1391810 res!931582) b!1391807))

(assert (= (and b!1391807 res!931577) b!1391808))

(assert (= (and b!1391808 res!931575) b!1391809))

(assert (= (and b!1391808 (not res!931581)) b!1391806))

(declare-fun m!1277083 () Bool)

(assert (=> b!1391811 m!1277083))

(assert (=> b!1391811 m!1277083))

(declare-fun m!1277085 () Bool)

(assert (=> b!1391811 m!1277085))

(declare-fun m!1277087 () Bool)

(assert (=> b!1391805 m!1277087))

(assert (=> b!1391805 m!1277087))

(declare-fun m!1277089 () Bool)

(assert (=> b!1391805 m!1277089))

(declare-fun m!1277091 () Bool)

(assert (=> b!1391807 m!1277091))

(assert (=> b!1391809 m!1277087))

(assert (=> b!1391809 m!1277087))

(declare-fun m!1277093 () Bool)

(assert (=> b!1391809 m!1277093))

(assert (=> b!1391808 m!1277087))

(declare-fun m!1277095 () Bool)

(assert (=> b!1391808 m!1277095))

(assert (=> b!1391808 m!1277087))

(declare-fun m!1277097 () Bool)

(assert (=> b!1391808 m!1277097))

(assert (=> b!1391808 m!1277095))

(assert (=> b!1391808 m!1277087))

(declare-fun m!1277099 () Bool)

(assert (=> b!1391808 m!1277099))

(declare-fun m!1277101 () Bool)

(assert (=> b!1391808 m!1277101))

(declare-fun m!1277103 () Bool)

(assert (=> b!1391810 m!1277103))

(declare-fun m!1277105 () Bool)

(assert (=> start!119426 m!1277105))

(declare-fun m!1277107 () Bool)

(assert (=> start!119426 m!1277107))

(declare-fun m!1277109 () Bool)

(assert (=> b!1391806 m!1277109))

(declare-fun m!1277111 () Bool)

(assert (=> b!1391806 m!1277111))

(assert (=> b!1391806 m!1277111))

(declare-fun m!1277113 () Bool)

(assert (=> b!1391806 m!1277113))

(check-sat (not b!1391807) (not b!1391806) (not b!1391811) (not b!1391805) (not b!1391808) (not start!119426) (not b!1391810) (not b!1391809))
(check-sat)
