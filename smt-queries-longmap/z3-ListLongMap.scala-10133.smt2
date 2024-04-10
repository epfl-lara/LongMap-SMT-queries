; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!119510 () Bool)

(assert start!119510)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun e!788491 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun b!1392430 () Bool)

(declare-datatypes ((array!95243 0))(
  ( (array!95244 (arr!45981 (Array (_ BitVec 32) (_ BitVec 64))) (size!46531 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95243)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1392430 (= e!788491 (validKeyInArray!0 (select (store (arr!45981 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112)))))

(declare-fun b!1392431 () Bool)

(declare-fun res!932006 () Bool)

(declare-fun e!788488 () Bool)

(assert (=> b!1392431 (=> (not res!932006) (not e!788488))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95243 (_ BitVec 32)) Bool)

(assert (=> b!1392431 (= res!932006 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1392432 () Bool)

(declare-fun res!932010 () Bool)

(assert (=> b!1392432 (=> (not res!932010) (not e!788488))))

(assert (=> b!1392432 (= res!932010 (validKeyInArray!0 (select (arr!45981 a!2901) j!112)))))

(declare-fun b!1392433 () Bool)

(declare-fun res!932004 () Bool)

(assert (=> b!1392433 (=> (not res!932004) (not e!788488))))

(declare-datatypes ((List!32500 0))(
  ( (Nil!32497) (Cons!32496 (h!33726 (_ BitVec 64)) (t!47194 List!32500)) )
))
(declare-fun arrayNoDuplicates!0 (array!95243 (_ BitVec 32) List!32500) Bool)

(assert (=> b!1392433 (= res!932004 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32497))))

(declare-fun b!1392434 () Bool)

(declare-fun res!932007 () Bool)

(assert (=> b!1392434 (=> (not res!932007) (not e!788488))))

(assert (=> b!1392434 (= res!932007 (validKeyInArray!0 (select (arr!45981 a!2901) i!1037)))))

(declare-fun b!1392435 () Bool)

(declare-fun e!788489 () Bool)

(declare-datatypes ((SeekEntryResult!10298 0))(
  ( (MissingZero!10298 (index!43563 (_ BitVec 32))) (Found!10298 (index!43564 (_ BitVec 32))) (Intermediate!10298 (undefined!11110 Bool) (index!43565 (_ BitVec 32)) (x!125248 (_ BitVec 32))) (Undefined!10298) (MissingVacant!10298 (index!43566 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95243 (_ BitVec 32)) SeekEntryResult!10298)

(assert (=> b!1392435 (= e!788489 (= (seekEntryOrOpen!0 (select (arr!45981 a!2901) j!112) a!2901 mask!2840) (Found!10298 j!112)))))

(declare-fun b!1392436 () Bool)

(declare-fun e!788490 () Bool)

(assert (=> b!1392436 (= e!788488 (not e!788490))))

(declare-fun res!932008 () Bool)

(assert (=> b!1392436 (=> res!932008 e!788490)))

(declare-fun lt!611616 () SeekEntryResult!10298)

(get-info :version)

(assert (=> b!1392436 (= res!932008 (or (not ((_ is Intermediate!10298) lt!611616)) (undefined!11110 lt!611616)))))

(assert (=> b!1392436 e!788489))

(declare-fun res!932011 () Bool)

(assert (=> b!1392436 (=> (not res!932011) (not e!788489))))

(assert (=> b!1392436 (= res!932011 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46600 0))(
  ( (Unit!46601) )
))
(declare-fun lt!611615 () Unit!46600)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95243 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46600)

(assert (=> b!1392436 (= lt!611615 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95243 (_ BitVec 32)) SeekEntryResult!10298)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1392436 (= lt!611616 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45981 a!2901) j!112) mask!2840) (select (arr!45981 a!2901) j!112) a!2901 mask!2840))))

(declare-fun res!932003 () Bool)

(assert (=> start!119510 (=> (not res!932003) (not e!788488))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119510 (= res!932003 (validMask!0 mask!2840))))

(assert (=> start!119510 e!788488))

(assert (=> start!119510 true))

(declare-fun array_inv!35009 (array!95243) Bool)

(assert (=> start!119510 (array_inv!35009 a!2901)))

(declare-fun b!1392437 () Bool)

(declare-fun res!932005 () Bool)

(assert (=> b!1392437 (=> (not res!932005) (not e!788488))))

(assert (=> b!1392437 (= res!932005 (and (= (size!46531 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46531 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46531 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1392438 () Bool)

(assert (=> b!1392438 (= e!788490 e!788491)))

(declare-fun res!932009 () Bool)

(assert (=> b!1392438 (=> res!932009 e!788491)))

(declare-fun lt!611614 () (_ BitVec 32))

(assert (=> b!1392438 (= res!932009 (or (bvslt mask!2840 #b00000000000000000000000000000000) (bvslt lt!611614 #b00000000000000000000000000000000) (bvsge lt!611614 (bvadd #b00000000000000000000000000000001 mask!2840))))))

(assert (=> b!1392438 (= lt!611614 (toIndex!0 (select (store (arr!45981 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840))))

(assert (= (and start!119510 res!932003) b!1392437))

(assert (= (and b!1392437 res!932005) b!1392434))

(assert (= (and b!1392434 res!932007) b!1392432))

(assert (= (and b!1392432 res!932010) b!1392431))

(assert (= (and b!1392431 res!932006) b!1392433))

(assert (= (and b!1392433 res!932004) b!1392436))

(assert (= (and b!1392436 res!932011) b!1392435))

(assert (= (and b!1392436 (not res!932008)) b!1392438))

(assert (= (and b!1392438 (not res!932009)) b!1392430))

(declare-fun m!1278163 () Bool)

(assert (=> b!1392438 m!1278163))

(declare-fun m!1278165 () Bool)

(assert (=> b!1392438 m!1278165))

(assert (=> b!1392438 m!1278165))

(declare-fun m!1278167 () Bool)

(assert (=> b!1392438 m!1278167))

(declare-fun m!1278169 () Bool)

(assert (=> b!1392433 m!1278169))

(declare-fun m!1278171 () Bool)

(assert (=> b!1392432 m!1278171))

(assert (=> b!1392432 m!1278171))

(declare-fun m!1278173 () Bool)

(assert (=> b!1392432 m!1278173))

(declare-fun m!1278175 () Bool)

(assert (=> start!119510 m!1278175))

(declare-fun m!1278177 () Bool)

(assert (=> start!119510 m!1278177))

(declare-fun m!1278179 () Bool)

(assert (=> b!1392434 m!1278179))

(assert (=> b!1392434 m!1278179))

(declare-fun m!1278181 () Bool)

(assert (=> b!1392434 m!1278181))

(declare-fun m!1278183 () Bool)

(assert (=> b!1392431 m!1278183))

(assert (=> b!1392435 m!1278171))

(assert (=> b!1392435 m!1278171))

(declare-fun m!1278185 () Bool)

(assert (=> b!1392435 m!1278185))

(assert (=> b!1392436 m!1278171))

(declare-fun m!1278187 () Bool)

(assert (=> b!1392436 m!1278187))

(assert (=> b!1392436 m!1278171))

(declare-fun m!1278189 () Bool)

(assert (=> b!1392436 m!1278189))

(assert (=> b!1392436 m!1278187))

(assert (=> b!1392436 m!1278171))

(declare-fun m!1278191 () Bool)

(assert (=> b!1392436 m!1278191))

(declare-fun m!1278193 () Bool)

(assert (=> b!1392436 m!1278193))

(assert (=> b!1392430 m!1278163))

(assert (=> b!1392430 m!1278165))

(assert (=> b!1392430 m!1278165))

(declare-fun m!1278195 () Bool)

(assert (=> b!1392430 m!1278195))

(check-sat (not b!1392434) (not b!1392430) (not b!1392431) (not b!1392438) (not start!119510) (not b!1392432) (not b!1392436) (not b!1392433) (not b!1392435))
(check-sat)
