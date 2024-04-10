; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!119732 () Bool)

(assert start!119732)

(declare-fun b!1394796 () Bool)

(declare-fun res!934209 () Bool)

(declare-fun e!789667 () Bool)

(assert (=> b!1394796 (=> res!934209 e!789667)))

(declare-datatypes ((array!95414 0))(
  ( (array!95415 (arr!46065 (Array (_ BitVec 32) (_ BitVec 64))) (size!46615 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95414)

(declare-datatypes ((SeekEntryResult!10382 0))(
  ( (MissingZero!10382 (index!43899 (_ BitVec 32))) (Found!10382 (index!43900 (_ BitVec 32))) (Intermediate!10382 (undefined!11194 Bool) (index!43901 (_ BitVec 32)) (x!125562 (_ BitVec 32))) (Undefined!10382) (MissingVacant!10382 (index!43902 (_ BitVec 32))) )
))
(declare-fun lt!612746 () SeekEntryResult!10382)

(declare-fun lt!612744 () (_ BitVec 32))

(assert (=> b!1394796 (= res!934209 (or (bvslt (x!125562 lt!612746) #b00000000000000000000000000000000) (bvsgt (x!125562 lt!612746) #b01111111111111111111111111111110) (bvslt lt!612744 #b00000000000000000000000000000000) (bvsge lt!612744 (size!46615 a!2901)) (bvslt (index!43901 lt!612746) #b00000000000000000000000000000000) (bvsge (index!43901 lt!612746) (size!46615 a!2901)) (not (= lt!612746 (Intermediate!10382 false (index!43901 lt!612746) (x!125562 lt!612746))))))))

(declare-fun b!1394798 () Bool)

(declare-fun res!934213 () Bool)

(declare-fun e!789666 () Bool)

(assert (=> b!1394798 (=> (not res!934213) (not e!789666))))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1394798 (= res!934213 (validKeyInArray!0 (select (arr!46065 a!2901) j!112)))))

(declare-fun b!1394799 () Bool)

(declare-fun e!789664 () Bool)

(declare-fun lt!612745 () (_ BitVec 64))

(assert (=> b!1394799 (= e!789664 (validKeyInArray!0 lt!612745))))

(declare-fun b!1394800 () Bool)

(declare-fun res!934207 () Bool)

(assert (=> b!1394800 (=> (not res!934207) (not e!789666))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95414 (_ BitVec 32)) Bool)

(assert (=> b!1394800 (= res!934207 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1394801 () Bool)

(declare-fun res!934204 () Bool)

(assert (=> b!1394801 (=> (not res!934204) (not e!789666))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1394801 (= res!934204 (validKeyInArray!0 (select (arr!46065 a!2901) i!1037)))))

(declare-fun b!1394802 () Bool)

(declare-fun e!789668 () Bool)

(assert (=> b!1394802 (= e!789668 e!789667)))

(declare-fun res!934206 () Bool)

(assert (=> b!1394802 (=> res!934206 e!789667)))

(declare-fun lt!612749 () array!95414)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95414 (_ BitVec 32)) SeekEntryResult!10382)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1394802 (= res!934206 (not (= lt!612746 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!612745 mask!2840) lt!612745 lt!612749 mask!2840))))))

(assert (=> b!1394802 (= lt!612745 (select (store (arr!46065 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1394802 (= lt!612749 (array!95415 (store (arr!46065 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46615 a!2901)))))

(declare-fun b!1394803 () Bool)

(declare-fun res!934205 () Bool)

(assert (=> b!1394803 (=> (not res!934205) (not e!789666))))

(assert (=> b!1394803 (= res!934205 (and (= (size!46615 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46615 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46615 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1394804 () Bool)

(declare-fun res!934208 () Bool)

(assert (=> b!1394804 (=> (not res!934208) (not e!789666))))

(declare-datatypes ((List!32584 0))(
  ( (Nil!32581) (Cons!32580 (h!33813 (_ BitVec 64)) (t!47278 List!32584)) )
))
(declare-fun arrayNoDuplicates!0 (array!95414 (_ BitVec 32) List!32584) Bool)

(assert (=> b!1394804 (= res!934208 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32581))))

(declare-fun b!1394805 () Bool)

(assert (=> b!1394805 (= e!789667 e!789664)))

(declare-fun res!934210 () Bool)

(assert (=> b!1394805 (=> res!934210 e!789664)))

(assert (=> b!1394805 (= res!934210 (bvslt mask!2840 #b00000000000000000000000000000000))))

(declare-fun lt!612748 () SeekEntryResult!10382)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95414 (_ BitVec 32)) SeekEntryResult!10382)

(assert (=> b!1394805 (= lt!612748 (seekEntryOrOpen!0 lt!612745 lt!612749 mask!2840))))

(declare-datatypes ((Unit!46768 0))(
  ( (Unit!46769) )
))
(declare-fun lt!612750 () Unit!46768)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 (array!95414 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46768)

(assert (=> b!1394805 (= lt!612750 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!612744 (x!125562 lt!612746) (index!43901 lt!612746) mask!2840))))

(declare-fun b!1394797 () Bool)

(assert (=> b!1394797 (= e!789666 (not e!789668))))

(declare-fun res!934212 () Bool)

(assert (=> b!1394797 (=> res!934212 e!789668)))

(get-info :version)

(assert (=> b!1394797 (= res!934212 (or (not ((_ is Intermediate!10382) lt!612746)) (undefined!11194 lt!612746)))))

(assert (=> b!1394797 (= lt!612748 (Found!10382 j!112))))

(assert (=> b!1394797 (= lt!612748 (seekEntryOrOpen!0 (select (arr!46065 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1394797 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!612747 () Unit!46768)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95414 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46768)

(assert (=> b!1394797 (= lt!612747 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1394797 (= lt!612746 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!612744 (select (arr!46065 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1394797 (= lt!612744 (toIndex!0 (select (arr!46065 a!2901) j!112) mask!2840))))

(declare-fun res!934211 () Bool)

(assert (=> start!119732 (=> (not res!934211) (not e!789666))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119732 (= res!934211 (validMask!0 mask!2840))))

(assert (=> start!119732 e!789666))

(assert (=> start!119732 true))

(declare-fun array_inv!35093 (array!95414) Bool)

(assert (=> start!119732 (array_inv!35093 a!2901)))

(assert (= (and start!119732 res!934211) b!1394803))

(assert (= (and b!1394803 res!934205) b!1394801))

(assert (= (and b!1394801 res!934204) b!1394798))

(assert (= (and b!1394798 res!934213) b!1394800))

(assert (= (and b!1394800 res!934207) b!1394804))

(assert (= (and b!1394804 res!934208) b!1394797))

(assert (= (and b!1394797 (not res!934212)) b!1394802))

(assert (= (and b!1394802 (not res!934206)) b!1394796))

(assert (= (and b!1394796 (not res!934209)) b!1394805))

(assert (= (and b!1394805 (not res!934210)) b!1394799))

(declare-fun m!1281259 () Bool)

(assert (=> b!1394801 m!1281259))

(assert (=> b!1394801 m!1281259))

(declare-fun m!1281261 () Bool)

(assert (=> b!1394801 m!1281261))

(declare-fun m!1281263 () Bool)

(assert (=> b!1394797 m!1281263))

(declare-fun m!1281265 () Bool)

(assert (=> b!1394797 m!1281265))

(assert (=> b!1394797 m!1281263))

(declare-fun m!1281267 () Bool)

(assert (=> b!1394797 m!1281267))

(assert (=> b!1394797 m!1281263))

(declare-fun m!1281269 () Bool)

(assert (=> b!1394797 m!1281269))

(assert (=> b!1394797 m!1281263))

(declare-fun m!1281271 () Bool)

(assert (=> b!1394797 m!1281271))

(declare-fun m!1281273 () Bool)

(assert (=> b!1394797 m!1281273))

(declare-fun m!1281275 () Bool)

(assert (=> b!1394799 m!1281275))

(assert (=> b!1394798 m!1281263))

(assert (=> b!1394798 m!1281263))

(declare-fun m!1281277 () Bool)

(assert (=> b!1394798 m!1281277))

(declare-fun m!1281279 () Bool)

(assert (=> b!1394805 m!1281279))

(declare-fun m!1281281 () Bool)

(assert (=> b!1394805 m!1281281))

(declare-fun m!1281283 () Bool)

(assert (=> start!119732 m!1281283))

(declare-fun m!1281285 () Bool)

(assert (=> start!119732 m!1281285))

(declare-fun m!1281287 () Bool)

(assert (=> b!1394804 m!1281287))

(declare-fun m!1281289 () Bool)

(assert (=> b!1394800 m!1281289))

(declare-fun m!1281291 () Bool)

(assert (=> b!1394802 m!1281291))

(assert (=> b!1394802 m!1281291))

(declare-fun m!1281293 () Bool)

(assert (=> b!1394802 m!1281293))

(declare-fun m!1281295 () Bool)

(assert (=> b!1394802 m!1281295))

(declare-fun m!1281297 () Bool)

(assert (=> b!1394802 m!1281297))

(check-sat (not b!1394805) (not start!119732) (not b!1394804) (not b!1394798) (not b!1394799) (not b!1394797) (not b!1394801) (not b!1394802) (not b!1394800))
(check-sat)
