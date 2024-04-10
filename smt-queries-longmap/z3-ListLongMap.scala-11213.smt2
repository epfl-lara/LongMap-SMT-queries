; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130912 () Bool)

(assert start!130912)

(declare-fun b!1535513 () Bool)

(declare-fun res!1052605 () Bool)

(declare-fun e!854821 () Bool)

(assert (=> b!1535513 (=> (not res!1052605) (not e!854821))))

(declare-datatypes ((array!102010 0))(
  ( (array!102011 (arr!49221 (Array (_ BitVec 32) (_ BitVec 64))) (size!49771 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102010)

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102010 (_ BitVec 32)) Bool)

(assert (=> b!1535513 (= res!1052605 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun res!1052608 () Bool)

(assert (=> start!130912 (=> (not res!1052608) (not e!854821))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130912 (= res!1052608 (validMask!0 mask!2480))))

(assert (=> start!130912 e!854821))

(assert (=> start!130912 true))

(declare-fun array_inv!38249 (array!102010) Bool)

(assert (=> start!130912 (array_inv!38249 a!2792)))

(declare-fun b!1535514 () Bool)

(declare-fun res!1052599 () Bool)

(assert (=> b!1535514 (=> (not res!1052599) (not e!854821))))

(declare-fun i!951 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1535514 (= res!1052599 (validKeyInArray!0 (select (arr!49221 a!2792) i!951)))))

(declare-fun b!1535515 () Bool)

(declare-fun res!1052603 () Bool)

(assert (=> b!1535515 (=> (not res!1052603) (not e!854821))))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13353 0))(
  ( (MissingZero!13353 (index!55807 (_ BitVec 32))) (Found!13353 (index!55808 (_ BitVec 32))) (Intermediate!13353 (undefined!14165 Bool) (index!55809 (_ BitVec 32)) (x!137555 (_ BitVec 32))) (Undefined!13353) (MissingVacant!13353 (index!55810 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102010 (_ BitVec 32)) SeekEntryResult!13353)

(assert (=> b!1535515 (= res!1052603 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49221 a!2792) j!64) a!2792 mask!2480) (Found!13353 j!64)))))

(declare-fun b!1535516 () Bool)

(declare-fun res!1052606 () Bool)

(assert (=> b!1535516 (=> (not res!1052606) (not e!854821))))

(assert (=> b!1535516 (= res!1052606 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49771 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49771 a!2792)) (= (select (arr!49221 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1535517 () Bool)

(declare-fun e!854820 () Bool)

(assert (=> b!1535517 (= e!854821 e!854820)))

(declare-fun res!1052607 () Bool)

(assert (=> b!1535517 (=> (not res!1052607) (not e!854820))))

(declare-fun lt!664074 () (_ BitVec 32))

(assert (=> b!1535517 (= res!1052607 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvsge lt!664074 #b00000000000000000000000000000000) (bvslt lt!664074 (size!49771 a!2792))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1535517 (= lt!664074 (nextIndex!0 index!463 x!510 mask!2480))))

(declare-fun b!1535518 () Bool)

(declare-fun res!1052602 () Bool)

(assert (=> b!1535518 (=> (not res!1052602) (not e!854821))))

(assert (=> b!1535518 (= res!1052602 (validKeyInArray!0 (select (arr!49221 a!2792) j!64)))))

(declare-fun b!1535519 () Bool)

(declare-fun res!1052604 () Bool)

(assert (=> b!1535519 (=> (not res!1052604) (not e!854821))))

(assert (=> b!1535519 (= res!1052604 (and (= (size!49771 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49771 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49771 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1535520 () Bool)

(assert (=> b!1535520 (= e!854820 false)))

(declare-fun lt!664075 () SeekEntryResult!13353)

(assert (=> b!1535520 (= lt!664075 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!664074 vacantIndex!5 (select (arr!49221 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1535521 () Bool)

(declare-fun res!1052601 () Bool)

(assert (=> b!1535521 (=> (not res!1052601) (not e!854821))))

(assert (=> b!1535521 (= res!1052601 (not (= (select (arr!49221 a!2792) index!463) (select (arr!49221 a!2792) j!64))))))

(declare-fun b!1535522 () Bool)

(declare-fun res!1052600 () Bool)

(assert (=> b!1535522 (=> (not res!1052600) (not e!854821))))

(declare-datatypes ((List!35695 0))(
  ( (Nil!35692) (Cons!35691 (h!37136 (_ BitVec 64)) (t!50389 List!35695)) )
))
(declare-fun arrayNoDuplicates!0 (array!102010 (_ BitVec 32) List!35695) Bool)

(assert (=> b!1535522 (= res!1052600 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35692))))

(assert (= (and start!130912 res!1052608) b!1535519))

(assert (= (and b!1535519 res!1052604) b!1535514))

(assert (= (and b!1535514 res!1052599) b!1535518))

(assert (= (and b!1535518 res!1052602) b!1535513))

(assert (= (and b!1535513 res!1052605) b!1535522))

(assert (= (and b!1535522 res!1052600) b!1535516))

(assert (= (and b!1535516 res!1052606) b!1535515))

(assert (= (and b!1535515 res!1052603) b!1535521))

(assert (= (and b!1535521 res!1052601) b!1535517))

(assert (= (and b!1535517 res!1052607) b!1535520))

(declare-fun m!1418021 () Bool)

(assert (=> b!1535514 m!1418021))

(assert (=> b!1535514 m!1418021))

(declare-fun m!1418023 () Bool)

(assert (=> b!1535514 m!1418023))

(declare-fun m!1418025 () Bool)

(assert (=> b!1535516 m!1418025))

(declare-fun m!1418027 () Bool)

(assert (=> start!130912 m!1418027))

(declare-fun m!1418029 () Bool)

(assert (=> start!130912 m!1418029))

(declare-fun m!1418031 () Bool)

(assert (=> b!1535522 m!1418031))

(declare-fun m!1418033 () Bool)

(assert (=> b!1535515 m!1418033))

(assert (=> b!1535515 m!1418033))

(declare-fun m!1418035 () Bool)

(assert (=> b!1535515 m!1418035))

(assert (=> b!1535518 m!1418033))

(assert (=> b!1535518 m!1418033))

(declare-fun m!1418037 () Bool)

(assert (=> b!1535518 m!1418037))

(declare-fun m!1418039 () Bool)

(assert (=> b!1535513 m!1418039))

(assert (=> b!1535520 m!1418033))

(assert (=> b!1535520 m!1418033))

(declare-fun m!1418041 () Bool)

(assert (=> b!1535520 m!1418041))

(declare-fun m!1418043 () Bool)

(assert (=> b!1535517 m!1418043))

(declare-fun m!1418045 () Bool)

(assert (=> b!1535521 m!1418045))

(assert (=> b!1535521 m!1418033))

(check-sat (not b!1535515) (not b!1535513) (not b!1535520) (not b!1535518) (not start!130912) (not b!1535517) (not b!1535522) (not b!1535514))
(check-sat)
