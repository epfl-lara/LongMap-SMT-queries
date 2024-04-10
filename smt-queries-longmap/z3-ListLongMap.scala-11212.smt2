; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130906 () Bool)

(assert start!130906)

(declare-fun b!1535423 () Bool)

(declare-fun res!1052517 () Bool)

(declare-fun e!854794 () Bool)

(assert (=> b!1535423 (=> (not res!1052517) (not e!854794))))

(declare-datatypes ((array!102004 0))(
  ( (array!102005 (arr!49218 (Array (_ BitVec 32) (_ BitVec 64))) (size!49768 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102004)

(declare-datatypes ((List!35692 0))(
  ( (Nil!35689) (Cons!35688 (h!37133 (_ BitVec 64)) (t!50386 List!35692)) )
))
(declare-fun arrayNoDuplicates!0 (array!102004 (_ BitVec 32) List!35692) Bool)

(assert (=> b!1535423 (= res!1052517 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35689))))

(declare-fun b!1535424 () Bool)

(declare-fun res!1052512 () Bool)

(assert (=> b!1535424 (=> (not res!1052512) (not e!854794))))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(assert (=> b!1535424 (= res!1052512 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49768 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49768 a!2792)) (= (select (arr!49218 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1535425 () Bool)

(declare-fun res!1052515 () Bool)

(assert (=> b!1535425 (=> (not res!1052515) (not e!854794))))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1535425 (= res!1052515 (validKeyInArray!0 (select (arr!49218 a!2792) j!64)))))

(declare-fun b!1535426 () Bool)

(declare-fun res!1052513 () Bool)

(assert (=> b!1535426 (=> (not res!1052513) (not e!854794))))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102004 (_ BitVec 32)) Bool)

(assert (=> b!1535426 (= res!1052513 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1535427 () Bool)

(declare-fun res!1052510 () Bool)

(assert (=> b!1535427 (=> (not res!1052510) (not e!854794))))

(declare-datatypes ((SeekEntryResult!13350 0))(
  ( (MissingZero!13350 (index!55795 (_ BitVec 32))) (Found!13350 (index!55796 (_ BitVec 32))) (Intermediate!13350 (undefined!14162 Bool) (index!55797 (_ BitVec 32)) (x!137544 (_ BitVec 32))) (Undefined!13350) (MissingVacant!13350 (index!55798 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102004 (_ BitVec 32)) SeekEntryResult!13350)

(assert (=> b!1535427 (= res!1052510 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49218 a!2792) j!64) a!2792 mask!2480) (Found!13350 j!64)))))

(declare-fun b!1535428 () Bool)

(declare-fun res!1052511 () Bool)

(assert (=> b!1535428 (=> (not res!1052511) (not e!854794))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1535428 (= res!1052511 (validKeyInArray!0 (select (arr!49218 a!2792) i!951)))))

(declare-fun b!1535429 () Bool)

(declare-fun e!854793 () Bool)

(assert (=> b!1535429 (= e!854793 false)))

(declare-fun lt!664056 () (_ BitVec 32))

(declare-fun lt!664057 () SeekEntryResult!13350)

(assert (=> b!1535429 (= lt!664057 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!664056 vacantIndex!5 (select (arr!49218 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1535430 () Bool)

(declare-fun res!1052518 () Bool)

(assert (=> b!1535430 (=> (not res!1052518) (not e!854794))))

(assert (=> b!1535430 (= res!1052518 (and (= (size!49768 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49768 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49768 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1535431 () Bool)

(assert (=> b!1535431 (= e!854794 e!854793)))

(declare-fun res!1052516 () Bool)

(assert (=> b!1535431 (=> (not res!1052516) (not e!854793))))

(assert (=> b!1535431 (= res!1052516 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvsge lt!664056 #b00000000000000000000000000000000) (bvslt lt!664056 (size!49768 a!2792))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1535431 (= lt!664056 (nextIndex!0 index!463 x!510 mask!2480))))

(declare-fun res!1052509 () Bool)

(assert (=> start!130906 (=> (not res!1052509) (not e!854794))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130906 (= res!1052509 (validMask!0 mask!2480))))

(assert (=> start!130906 e!854794))

(assert (=> start!130906 true))

(declare-fun array_inv!38246 (array!102004) Bool)

(assert (=> start!130906 (array_inv!38246 a!2792)))

(declare-fun b!1535432 () Bool)

(declare-fun res!1052514 () Bool)

(assert (=> b!1535432 (=> (not res!1052514) (not e!854794))))

(assert (=> b!1535432 (= res!1052514 (not (= (select (arr!49218 a!2792) index!463) (select (arr!49218 a!2792) j!64))))))

(assert (= (and start!130906 res!1052509) b!1535430))

(assert (= (and b!1535430 res!1052518) b!1535428))

(assert (= (and b!1535428 res!1052511) b!1535425))

(assert (= (and b!1535425 res!1052515) b!1535426))

(assert (= (and b!1535426 res!1052513) b!1535423))

(assert (= (and b!1535423 res!1052517) b!1535424))

(assert (= (and b!1535424 res!1052512) b!1535427))

(assert (= (and b!1535427 res!1052510) b!1535432))

(assert (= (and b!1535432 res!1052514) b!1535431))

(assert (= (and b!1535431 res!1052516) b!1535429))

(declare-fun m!1417943 () Bool)

(assert (=> b!1535432 m!1417943))

(declare-fun m!1417945 () Bool)

(assert (=> b!1535432 m!1417945))

(assert (=> b!1535425 m!1417945))

(assert (=> b!1535425 m!1417945))

(declare-fun m!1417947 () Bool)

(assert (=> b!1535425 m!1417947))

(assert (=> b!1535429 m!1417945))

(assert (=> b!1535429 m!1417945))

(declare-fun m!1417949 () Bool)

(assert (=> b!1535429 m!1417949))

(declare-fun m!1417951 () Bool)

(assert (=> b!1535426 m!1417951))

(declare-fun m!1417953 () Bool)

(assert (=> b!1535431 m!1417953))

(assert (=> b!1535427 m!1417945))

(assert (=> b!1535427 m!1417945))

(declare-fun m!1417955 () Bool)

(assert (=> b!1535427 m!1417955))

(declare-fun m!1417957 () Bool)

(assert (=> b!1535424 m!1417957))

(declare-fun m!1417959 () Bool)

(assert (=> b!1535428 m!1417959))

(assert (=> b!1535428 m!1417959))

(declare-fun m!1417961 () Bool)

(assert (=> b!1535428 m!1417961))

(declare-fun m!1417963 () Bool)

(assert (=> b!1535423 m!1417963))

(declare-fun m!1417965 () Bool)

(assert (=> start!130906 m!1417965))

(declare-fun m!1417967 () Bool)

(assert (=> start!130906 m!1417967))

(check-sat (not start!130906) (not b!1535427) (not b!1535426) (not b!1535429) (not b!1535431) (not b!1535428) (not b!1535425) (not b!1535423))
(check-sat)
