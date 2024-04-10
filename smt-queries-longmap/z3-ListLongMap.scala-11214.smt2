; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130918 () Bool)

(assert start!130918)

(declare-fun b!1535603 () Bool)

(declare-fun res!1052690 () Bool)

(declare-fun e!854848 () Bool)

(assert (=> b!1535603 (=> (not res!1052690) (not e!854848))))

(declare-fun x!510 () (_ BitVec 32))

(declare-datatypes ((array!102016 0))(
  ( (array!102017 (arr!49224 (Array (_ BitVec 32) (_ BitVec 64))) (size!49774 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102016)

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(assert (=> b!1535603 (= res!1052690 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49774 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49774 a!2792)) (= (select (arr!49224 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!1052689 () Bool)

(assert (=> start!130918 (=> (not res!1052689) (not e!854848))))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130918 (= res!1052689 (validMask!0 mask!2480))))

(assert (=> start!130918 e!854848))

(assert (=> start!130918 true))

(declare-fun array_inv!38252 (array!102016) Bool)

(assert (=> start!130918 (array_inv!38252 a!2792)))

(declare-fun b!1535604 () Bool)

(declare-fun res!1052691 () Bool)

(assert (=> b!1535604 (=> (not res!1052691) (not e!854848))))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1535604 (= res!1052691 (and (= (size!49774 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49774 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49774 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1535605 () Bool)

(declare-fun e!854847 () Bool)

(assert (=> b!1535605 (= e!854847 false)))

(declare-datatypes ((SeekEntryResult!13356 0))(
  ( (MissingZero!13356 (index!55819 (_ BitVec 32))) (Found!13356 (index!55820 (_ BitVec 32))) (Intermediate!13356 (undefined!14168 Bool) (index!55821 (_ BitVec 32)) (x!137566 (_ BitVec 32))) (Undefined!13356) (MissingVacant!13356 (index!55822 (_ BitVec 32))) )
))
(declare-fun lt!664093 () SeekEntryResult!13356)

(declare-fun lt!664092 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102016 (_ BitVec 32)) SeekEntryResult!13356)

(assert (=> b!1535605 (= lt!664093 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!664092 vacantIndex!5 (select (arr!49224 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1535606 () Bool)

(declare-fun res!1052693 () Bool)

(assert (=> b!1535606 (=> (not res!1052693) (not e!854848))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102016 (_ BitVec 32)) Bool)

(assert (=> b!1535606 (= res!1052693 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1535607 () Bool)

(declare-fun res!1052694 () Bool)

(assert (=> b!1535607 (=> (not res!1052694) (not e!854848))))

(assert (=> b!1535607 (= res!1052694 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49224 a!2792) j!64) a!2792 mask!2480) (Found!13356 j!64)))))

(declare-fun b!1535608 () Bool)

(assert (=> b!1535608 (= e!854848 e!854847)))

(declare-fun res!1052695 () Bool)

(assert (=> b!1535608 (=> (not res!1052695) (not e!854847))))

(assert (=> b!1535608 (= res!1052695 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvsge lt!664092 #b00000000000000000000000000000000) (bvslt lt!664092 (size!49774 a!2792))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1535608 (= lt!664092 (nextIndex!0 index!463 x!510 mask!2480))))

(declare-fun b!1535609 () Bool)

(declare-fun res!1052698 () Bool)

(assert (=> b!1535609 (=> (not res!1052698) (not e!854848))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1535609 (= res!1052698 (validKeyInArray!0 (select (arr!49224 a!2792) i!951)))))

(declare-fun b!1535610 () Bool)

(declare-fun res!1052697 () Bool)

(assert (=> b!1535610 (=> (not res!1052697) (not e!854848))))

(assert (=> b!1535610 (= res!1052697 (not (= (select (arr!49224 a!2792) index!463) (select (arr!49224 a!2792) j!64))))))

(declare-fun b!1535611 () Bool)

(declare-fun res!1052692 () Bool)

(assert (=> b!1535611 (=> (not res!1052692) (not e!854848))))

(assert (=> b!1535611 (= res!1052692 (validKeyInArray!0 (select (arr!49224 a!2792) j!64)))))

(declare-fun b!1535612 () Bool)

(declare-fun res!1052696 () Bool)

(assert (=> b!1535612 (=> (not res!1052696) (not e!854848))))

(declare-datatypes ((List!35698 0))(
  ( (Nil!35695) (Cons!35694 (h!37139 (_ BitVec 64)) (t!50392 List!35698)) )
))
(declare-fun arrayNoDuplicates!0 (array!102016 (_ BitVec 32) List!35698) Bool)

(assert (=> b!1535612 (= res!1052696 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35695))))

(assert (= (and start!130918 res!1052689) b!1535604))

(assert (= (and b!1535604 res!1052691) b!1535609))

(assert (= (and b!1535609 res!1052698) b!1535611))

(assert (= (and b!1535611 res!1052692) b!1535606))

(assert (= (and b!1535606 res!1052693) b!1535612))

(assert (= (and b!1535612 res!1052696) b!1535603))

(assert (= (and b!1535603 res!1052690) b!1535607))

(assert (= (and b!1535607 res!1052694) b!1535610))

(assert (= (and b!1535610 res!1052697) b!1535608))

(assert (= (and b!1535608 res!1052695) b!1535605))

(declare-fun m!1418099 () Bool)

(assert (=> b!1535608 m!1418099))

(declare-fun m!1418101 () Bool)

(assert (=> b!1535606 m!1418101))

(declare-fun m!1418103 () Bool)

(assert (=> b!1535605 m!1418103))

(assert (=> b!1535605 m!1418103))

(declare-fun m!1418105 () Bool)

(assert (=> b!1535605 m!1418105))

(declare-fun m!1418107 () Bool)

(assert (=> b!1535603 m!1418107))

(assert (=> b!1535607 m!1418103))

(assert (=> b!1535607 m!1418103))

(declare-fun m!1418109 () Bool)

(assert (=> b!1535607 m!1418109))

(assert (=> b!1535611 m!1418103))

(assert (=> b!1535611 m!1418103))

(declare-fun m!1418111 () Bool)

(assert (=> b!1535611 m!1418111))

(declare-fun m!1418113 () Bool)

(assert (=> start!130918 m!1418113))

(declare-fun m!1418115 () Bool)

(assert (=> start!130918 m!1418115))

(declare-fun m!1418117 () Bool)

(assert (=> b!1535609 m!1418117))

(assert (=> b!1535609 m!1418117))

(declare-fun m!1418119 () Bool)

(assert (=> b!1535609 m!1418119))

(declare-fun m!1418121 () Bool)

(assert (=> b!1535610 m!1418121))

(assert (=> b!1535610 m!1418103))

(declare-fun m!1418123 () Bool)

(assert (=> b!1535612 m!1418123))

(check-sat (not b!1535609) (not start!130918) (not b!1535608) (not b!1535612) (not b!1535606) (not b!1535605) (not b!1535607) (not b!1535611))
(check-sat)
