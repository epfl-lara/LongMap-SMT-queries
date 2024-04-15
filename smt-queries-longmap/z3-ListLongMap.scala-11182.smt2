; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130674 () Bool)

(assert start!130674)

(declare-fun b!1532815 () Bool)

(declare-fun e!853953 () Bool)

(assert (=> b!1532815 (= e!853953 false)))

(declare-datatypes ((SeekEntryResult!13259 0))(
  ( (MissingZero!13259 (index!55431 (_ BitVec 32))) (Found!13259 (index!55432 (_ BitVec 32))) (Intermediate!13259 (undefined!14071 Bool) (index!55433 (_ BitVec 32)) (x!137208 (_ BitVec 32))) (Undefined!13259) (MissingVacant!13259 (index!55434 (_ BitVec 32))) )
))
(declare-fun lt!663492 () SeekEntryResult!13259)

(declare-datatypes ((array!101770 0))(
  ( (array!101771 (arr!49102 (Array (_ BitVec 32) (_ BitVec 64))) (size!49654 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101770)

(declare-fun j!64 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101770 (_ BitVec 32)) SeekEntryResult!13259)

(assert (=> b!1532815 (= lt!663492 (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49102 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1532816 () Bool)

(declare-fun res!1050091 () Bool)

(assert (=> b!1532816 (=> (not res!1050091) (not e!853953))))

(declare-datatypes ((List!35654 0))(
  ( (Nil!35651) (Cons!35650 (h!37096 (_ BitVec 64)) (t!50340 List!35654)) )
))
(declare-fun arrayNoDuplicates!0 (array!101770 (_ BitVec 32) List!35654) Bool)

(assert (=> b!1532816 (= res!1050091 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35651))))

(declare-fun b!1532817 () Bool)

(declare-fun res!1050086 () Bool)

(assert (=> b!1532817 (=> (not res!1050086) (not e!853953))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1532817 (= res!1050086 (validKeyInArray!0 (select (arr!49102 a!2792) j!64)))))

(declare-fun b!1532818 () Bool)

(declare-fun res!1050088 () Bool)

(assert (=> b!1532818 (=> (not res!1050088) (not e!853953))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1532818 (= res!1050088 (and (= (size!49654 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49654 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49654 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1532819 () Bool)

(declare-fun res!1050089 () Bool)

(assert (=> b!1532819 (=> (not res!1050089) (not e!853953))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101770 (_ BitVec 32)) Bool)

(assert (=> b!1532819 (= res!1050089 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1532820 () Bool)

(declare-fun res!1050085 () Bool)

(assert (=> b!1532820 (=> (not res!1050085) (not e!853953))))

(assert (=> b!1532820 (= res!1050085 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49654 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49654 a!2792)) (= (select (arr!49102 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!1050090 () Bool)

(assert (=> start!130674 (=> (not res!1050090) (not e!853953))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130674 (= res!1050090 (validMask!0 mask!2480))))

(assert (=> start!130674 e!853953))

(assert (=> start!130674 true))

(declare-fun array_inv!38335 (array!101770) Bool)

(assert (=> start!130674 (array_inv!38335 a!2792)))

(declare-fun b!1532821 () Bool)

(declare-fun res!1050087 () Bool)

(assert (=> b!1532821 (=> (not res!1050087) (not e!853953))))

(assert (=> b!1532821 (= res!1050087 (validKeyInArray!0 (select (arr!49102 a!2792) i!951)))))

(assert (= (and start!130674 res!1050090) b!1532818))

(assert (= (and b!1532818 res!1050088) b!1532821))

(assert (= (and b!1532821 res!1050087) b!1532817))

(assert (= (and b!1532817 res!1050086) b!1532819))

(assert (= (and b!1532819 res!1050089) b!1532816))

(assert (= (and b!1532816 res!1050091) b!1532820))

(assert (= (and b!1532820 res!1050085) b!1532815))

(declare-fun m!1414949 () Bool)

(assert (=> b!1532821 m!1414949))

(assert (=> b!1532821 m!1414949))

(declare-fun m!1414951 () Bool)

(assert (=> b!1532821 m!1414951))

(declare-fun m!1414953 () Bool)

(assert (=> b!1532816 m!1414953))

(declare-fun m!1414955 () Bool)

(assert (=> b!1532820 m!1414955))

(declare-fun m!1414957 () Bool)

(assert (=> b!1532819 m!1414957))

(declare-fun m!1414959 () Bool)

(assert (=> b!1532817 m!1414959))

(assert (=> b!1532817 m!1414959))

(declare-fun m!1414961 () Bool)

(assert (=> b!1532817 m!1414961))

(assert (=> b!1532815 m!1414959))

(assert (=> b!1532815 m!1414959))

(declare-fun m!1414963 () Bool)

(assert (=> b!1532815 m!1414963))

(declare-fun m!1414965 () Bool)

(assert (=> start!130674 m!1414965))

(declare-fun m!1414967 () Bool)

(assert (=> start!130674 m!1414967))

(check-sat (not start!130674) (not b!1532815) (not b!1532816) (not b!1532821) (not b!1532817) (not b!1532819))
(check-sat)
