; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130878 () Bool)

(assert start!130878)

(declare-fun b!1535003 () Bool)

(declare-fun res!1052097 () Bool)

(declare-fun e!854667 () Bool)

(assert (=> b!1535003 (=> (not res!1052097) (not e!854667))))

(declare-datatypes ((array!101976 0))(
  ( (array!101977 (arr!49204 (Array (_ BitVec 32) (_ BitVec 64))) (size!49754 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101976)

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101976 (_ BitVec 32)) Bool)

(assert (=> b!1535003 (= res!1052097 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1535004 () Bool)

(declare-fun res!1052089 () Bool)

(assert (=> b!1535004 (=> (not res!1052089) (not e!854667))))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1535004 (= res!1052089 (validKeyInArray!0 (select (arr!49204 a!2792) j!64)))))

(declare-fun b!1535005 () Bool)

(declare-fun e!854668 () Bool)

(assert (=> b!1535005 (= e!854668 false)))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13336 0))(
  ( (MissingZero!13336 (index!55739 (_ BitVec 32))) (Found!13336 (index!55740 (_ BitVec 32))) (Intermediate!13336 (undefined!14148 Bool) (index!55741 (_ BitVec 32)) (x!137490 (_ BitVec 32))) (Undefined!13336) (MissingVacant!13336 (index!55742 (_ BitVec 32))) )
))
(declare-fun lt!663972 () SeekEntryResult!13336)

(declare-fun lt!663973 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101976 (_ BitVec 32)) SeekEntryResult!13336)

(assert (=> b!1535005 (= lt!663972 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!663973 vacantIndex!5 (select (arr!49204 a!2792) j!64) a!2792 mask!2480))))

(declare-fun res!1052098 () Bool)

(assert (=> start!130878 (=> (not res!1052098) (not e!854667))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130878 (= res!1052098 (validMask!0 mask!2480))))

(assert (=> start!130878 e!854667))

(assert (=> start!130878 true))

(declare-fun array_inv!38232 (array!101976) Bool)

(assert (=> start!130878 (array_inv!38232 a!2792)))

(declare-fun b!1535006 () Bool)

(declare-fun res!1052096 () Bool)

(assert (=> b!1535006 (=> (not res!1052096) (not e!854667))))

(declare-fun index!463 () (_ BitVec 32))

(assert (=> b!1535006 (= res!1052096 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49204 a!2792) j!64) a!2792 mask!2480) (Found!13336 j!64)))))

(declare-fun b!1535007 () Bool)

(declare-fun res!1052090 () Bool)

(assert (=> b!1535007 (=> (not res!1052090) (not e!854667))))

(assert (=> b!1535007 (= res!1052090 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49754 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49754 a!2792)) (= (select (arr!49204 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1535008 () Bool)

(declare-fun res!1052092 () Bool)

(assert (=> b!1535008 (=> (not res!1052092) (not e!854667))))

(declare-datatypes ((List!35678 0))(
  ( (Nil!35675) (Cons!35674 (h!37119 (_ BitVec 64)) (t!50372 List!35678)) )
))
(declare-fun arrayNoDuplicates!0 (array!101976 (_ BitVec 32) List!35678) Bool)

(assert (=> b!1535008 (= res!1052092 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35675))))

(declare-fun b!1535009 () Bool)

(assert (=> b!1535009 (= e!854667 e!854668)))

(declare-fun res!1052093 () Bool)

(assert (=> b!1535009 (=> (not res!1052093) (not e!854668))))

(assert (=> b!1535009 (= res!1052093 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvsge lt!663973 #b00000000000000000000000000000000) (bvslt lt!663973 (size!49754 a!2792))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1535009 (= lt!663973 (nextIndex!0 index!463 x!510 mask!2480))))

(declare-fun b!1535010 () Bool)

(declare-fun res!1052094 () Bool)

(assert (=> b!1535010 (=> (not res!1052094) (not e!854667))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1535010 (= res!1052094 (validKeyInArray!0 (select (arr!49204 a!2792) i!951)))))

(declare-fun b!1535011 () Bool)

(declare-fun res!1052091 () Bool)

(assert (=> b!1535011 (=> (not res!1052091) (not e!854667))))

(assert (=> b!1535011 (= res!1052091 (not (= (select (arr!49204 a!2792) index!463) (select (arr!49204 a!2792) j!64))))))

(declare-fun b!1535012 () Bool)

(declare-fun res!1052095 () Bool)

(assert (=> b!1535012 (=> (not res!1052095) (not e!854667))))

(assert (=> b!1535012 (= res!1052095 (and (= (size!49754 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49754 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49754 a!2792)) (not (= i!951 j!64))))))

(assert (= (and start!130878 res!1052098) b!1535012))

(assert (= (and b!1535012 res!1052095) b!1535010))

(assert (= (and b!1535010 res!1052094) b!1535004))

(assert (= (and b!1535004 res!1052089) b!1535003))

(assert (= (and b!1535003 res!1052097) b!1535008))

(assert (= (and b!1535008 res!1052092) b!1535007))

(assert (= (and b!1535007 res!1052090) b!1535006))

(assert (= (and b!1535006 res!1052096) b!1535011))

(assert (= (and b!1535011 res!1052091) b!1535009))

(assert (= (and b!1535009 res!1052093) b!1535005))

(declare-fun m!1417579 () Bool)

(assert (=> b!1535010 m!1417579))

(assert (=> b!1535010 m!1417579))

(declare-fun m!1417581 () Bool)

(assert (=> b!1535010 m!1417581))

(declare-fun m!1417583 () Bool)

(assert (=> start!130878 m!1417583))

(declare-fun m!1417585 () Bool)

(assert (=> start!130878 m!1417585))

(declare-fun m!1417587 () Bool)

(assert (=> b!1535003 m!1417587))

(declare-fun m!1417589 () Bool)

(assert (=> b!1535006 m!1417589))

(assert (=> b!1535006 m!1417589))

(declare-fun m!1417591 () Bool)

(assert (=> b!1535006 m!1417591))

(assert (=> b!1535005 m!1417589))

(assert (=> b!1535005 m!1417589))

(declare-fun m!1417593 () Bool)

(assert (=> b!1535005 m!1417593))

(declare-fun m!1417595 () Bool)

(assert (=> b!1535011 m!1417595))

(assert (=> b!1535011 m!1417589))

(declare-fun m!1417597 () Bool)

(assert (=> b!1535007 m!1417597))

(assert (=> b!1535004 m!1417589))

(assert (=> b!1535004 m!1417589))

(declare-fun m!1417599 () Bool)

(assert (=> b!1535004 m!1417599))

(declare-fun m!1417601 () Bool)

(assert (=> b!1535009 m!1417601))

(declare-fun m!1417603 () Bool)

(assert (=> b!1535008 m!1417603))

(push 1)

(assert (not b!1535004))

(assert (not start!130878))

(assert (not b!1535006))

(assert (not b!1535003))

(assert (not b!1535008))

(assert (not b!1535010))

(assert (not b!1535005))

(assert (not b!1535009))

(check-sat)

