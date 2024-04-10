; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130924 () Bool)

(assert start!130924)

(declare-fun b!1535693 () Bool)

(declare-fun res!1052779 () Bool)

(declare-fun e!854873 () Bool)

(assert (=> b!1535693 (=> (not res!1052779) (not e!854873))))

(declare-datatypes ((array!102022 0))(
  ( (array!102023 (arr!49227 (Array (_ BitVec 32) (_ BitVec 64))) (size!49777 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102022)

(declare-datatypes ((List!35701 0))(
  ( (Nil!35698) (Cons!35697 (h!37142 (_ BitVec 64)) (t!50395 List!35701)) )
))
(declare-fun arrayNoDuplicates!0 (array!102022 (_ BitVec 32) List!35701) Bool)

(assert (=> b!1535693 (= res!1052779 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35698))))

(declare-fun b!1535694 () Bool)

(declare-fun res!1052788 () Bool)

(assert (=> b!1535694 (=> (not res!1052788) (not e!854873))))

(declare-fun i!951 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1535694 (= res!1052788 (validKeyInArray!0 (select (arr!49227 a!2792) i!951)))))

(declare-fun b!1535695 () Bool)

(declare-fun e!854874 () Bool)

(assert (=> b!1535695 (= e!854873 e!854874)))

(declare-fun res!1052786 () Bool)

(assert (=> b!1535695 (=> (not res!1052786) (not e!854874))))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun lt!664111 () (_ BitVec 32))

(assert (=> b!1535695 (= res!1052786 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvsge lt!664111 #b00000000000000000000000000000000) (bvslt lt!664111 (size!49777 a!2792))))))

(declare-fun index!463 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1535695 (= lt!664111 (nextIndex!0 index!463 x!510 mask!2480))))

(declare-fun b!1535696 () Bool)

(declare-fun res!1052782 () Bool)

(assert (=> b!1535696 (=> (not res!1052782) (not e!854873))))

(declare-fun j!64 () (_ BitVec 32))

(assert (=> b!1535696 (= res!1052782 (not (= (select (arr!49227 a!2792) index!463) (select (arr!49227 a!2792) j!64))))))

(declare-fun b!1535697 () Bool)

(declare-fun res!1052785 () Bool)

(assert (=> b!1535697 (=> (not res!1052785) (not e!854873))))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13359 0))(
  ( (MissingZero!13359 (index!55831 (_ BitVec 32))) (Found!13359 (index!55832 (_ BitVec 32))) (Intermediate!13359 (undefined!14171 Bool) (index!55833 (_ BitVec 32)) (x!137577 (_ BitVec 32))) (Undefined!13359) (MissingVacant!13359 (index!55834 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102022 (_ BitVec 32)) SeekEntryResult!13359)

(assert (=> b!1535697 (= res!1052785 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49227 a!2792) j!64) a!2792 mask!2480) (Found!13359 j!64)))))

(declare-fun b!1535698 () Bool)

(declare-fun res!1052780 () Bool)

(assert (=> b!1535698 (=> (not res!1052780) (not e!854873))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102022 (_ BitVec 32)) Bool)

(assert (=> b!1535698 (= res!1052780 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1535699 () Bool)

(declare-fun res!1052783 () Bool)

(assert (=> b!1535699 (=> (not res!1052783) (not e!854873))))

(assert (=> b!1535699 (= res!1052783 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49777 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49777 a!2792)) (= (select (arr!49227 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1535700 () Bool)

(declare-fun res!1052784 () Bool)

(assert (=> b!1535700 (=> (not res!1052784) (not e!854873))))

(assert (=> b!1535700 (= res!1052784 (and (= (size!49777 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49777 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49777 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1535701 () Bool)

(declare-fun res!1052781 () Bool)

(assert (=> b!1535701 (=> (not res!1052781) (not e!854873))))

(assert (=> b!1535701 (= res!1052781 (validKeyInArray!0 (select (arr!49227 a!2792) j!64)))))

(declare-fun b!1535702 () Bool)

(assert (=> b!1535702 (= e!854874 false)))

(declare-fun lt!664110 () SeekEntryResult!13359)

(assert (=> b!1535702 (= lt!664110 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!664111 vacantIndex!5 (select (arr!49227 a!2792) j!64) a!2792 mask!2480))))

(declare-fun res!1052787 () Bool)

(assert (=> start!130924 (=> (not res!1052787) (not e!854873))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130924 (= res!1052787 (validMask!0 mask!2480))))

(assert (=> start!130924 e!854873))

(assert (=> start!130924 true))

(declare-fun array_inv!38255 (array!102022) Bool)

(assert (=> start!130924 (array_inv!38255 a!2792)))

(assert (= (and start!130924 res!1052787) b!1535700))

(assert (= (and b!1535700 res!1052784) b!1535694))

(assert (= (and b!1535694 res!1052788) b!1535701))

(assert (= (and b!1535701 res!1052781) b!1535698))

(assert (= (and b!1535698 res!1052780) b!1535693))

(assert (= (and b!1535693 res!1052779) b!1535699))

(assert (= (and b!1535699 res!1052783) b!1535697))

(assert (= (and b!1535697 res!1052785) b!1535696))

(assert (= (and b!1535696 res!1052782) b!1535695))

(assert (= (and b!1535695 res!1052786) b!1535702))

(declare-fun m!1418177 () Bool)

(assert (=> b!1535695 m!1418177))

(declare-fun m!1418179 () Bool)

(assert (=> b!1535699 m!1418179))

(declare-fun m!1418181 () Bool)

(assert (=> b!1535694 m!1418181))

(assert (=> b!1535694 m!1418181))

(declare-fun m!1418183 () Bool)

(assert (=> b!1535694 m!1418183))

(declare-fun m!1418185 () Bool)

(assert (=> b!1535697 m!1418185))

(assert (=> b!1535697 m!1418185))

(declare-fun m!1418187 () Bool)

(assert (=> b!1535697 m!1418187))

(declare-fun m!1418189 () Bool)

(assert (=> start!130924 m!1418189))

(declare-fun m!1418191 () Bool)

(assert (=> start!130924 m!1418191))

(assert (=> b!1535701 m!1418185))

(assert (=> b!1535701 m!1418185))

(declare-fun m!1418193 () Bool)

(assert (=> b!1535701 m!1418193))

(assert (=> b!1535702 m!1418185))

(assert (=> b!1535702 m!1418185))

(declare-fun m!1418195 () Bool)

(assert (=> b!1535702 m!1418195))

(declare-fun m!1418197 () Bool)

(assert (=> b!1535696 m!1418197))

(assert (=> b!1535696 m!1418185))

(declare-fun m!1418199 () Bool)

(assert (=> b!1535698 m!1418199))

(declare-fun m!1418201 () Bool)

(assert (=> b!1535693 m!1418201))

(check-sat (not b!1535693) (not b!1535698) (not b!1535702) (not b!1535697) (not b!1535695) (not start!130924) (not b!1535701) (not b!1535694))
(check-sat)
