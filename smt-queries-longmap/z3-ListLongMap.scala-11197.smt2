; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130816 () Bool)

(assert start!130816)

(declare-fun b!1534175 () Bool)

(declare-fun res!1051264 () Bool)

(declare-fun e!854427 () Bool)

(assert (=> b!1534175 (=> (not res!1051264) (not e!854427))))

(declare-datatypes ((array!101914 0))(
  ( (array!101915 (arr!49173 (Array (_ BitVec 32) (_ BitVec 64))) (size!49723 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101914)

(declare-fun i!951 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1534175 (= res!1051264 (validKeyInArray!0 (select (arr!49173 a!2792) i!951)))))

(declare-fun b!1534176 () Bool)

(declare-fun res!1051266 () Bool)

(assert (=> b!1534176 (=> (not res!1051266) (not e!854427))))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(assert (=> b!1534176 (= res!1051266 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49723 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49723 a!2792)) (= (select (arr!49173 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1534177 () Bool)

(declare-fun res!1051261 () Bool)

(assert (=> b!1534177 (=> (not res!1051261) (not e!854427))))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101914 (_ BitVec 32)) Bool)

(assert (=> b!1534177 (= res!1051261 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1534178 () Bool)

(declare-fun res!1051263 () Bool)

(assert (=> b!1534178 (=> (not res!1051263) (not e!854427))))

(declare-fun j!64 () (_ BitVec 32))

(assert (=> b!1534178 (= res!1051263 (validKeyInArray!0 (select (arr!49173 a!2792) j!64)))))

(declare-fun res!1051265 () Bool)

(assert (=> start!130816 (=> (not res!1051265) (not e!854427))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130816 (= res!1051265 (validMask!0 mask!2480))))

(assert (=> start!130816 e!854427))

(assert (=> start!130816 true))

(declare-fun array_inv!38201 (array!101914) Bool)

(assert (=> start!130816 (array_inv!38201 a!2792)))

(declare-fun b!1534179 () Bool)

(declare-fun res!1051262 () Bool)

(assert (=> b!1534179 (=> (not res!1051262) (not e!854427))))

(declare-datatypes ((List!35647 0))(
  ( (Nil!35644) (Cons!35643 (h!37088 (_ BitVec 64)) (t!50341 List!35647)) )
))
(declare-fun arrayNoDuplicates!0 (array!101914 (_ BitVec 32) List!35647) Bool)

(assert (=> b!1534179 (= res!1051262 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35644))))

(declare-fun b!1534180 () Bool)

(assert (=> b!1534180 (= e!854427 false)))

(declare-datatypes ((SeekEntryResult!13305 0))(
  ( (MissingZero!13305 (index!55615 (_ BitVec 32))) (Found!13305 (index!55616 (_ BitVec 32))) (Intermediate!13305 (undefined!14117 Bool) (index!55617 (_ BitVec 32)) (x!137379 (_ BitVec 32))) (Undefined!13305) (MissingVacant!13305 (index!55618 (_ BitVec 32))) )
))
(declare-fun lt!663844 () SeekEntryResult!13305)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101914 (_ BitVec 32)) SeekEntryResult!13305)

(assert (=> b!1534180 (= lt!663844 (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49173 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1534181 () Bool)

(declare-fun res!1051267 () Bool)

(assert (=> b!1534181 (=> (not res!1051267) (not e!854427))))

(assert (=> b!1534181 (= res!1051267 (and (= (size!49723 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49723 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49723 a!2792)) (not (= i!951 j!64))))))

(assert (= (and start!130816 res!1051265) b!1534181))

(assert (= (and b!1534181 res!1051267) b!1534175))

(assert (= (and b!1534175 res!1051264) b!1534178))

(assert (= (and b!1534178 res!1051263) b!1534177))

(assert (= (and b!1534177 res!1051261) b!1534179))

(assert (= (and b!1534179 res!1051262) b!1534176))

(assert (= (and b!1534176 res!1051266) b!1534180))

(declare-fun m!1416845 () Bool)

(assert (=> b!1534175 m!1416845))

(assert (=> b!1534175 m!1416845))

(declare-fun m!1416847 () Bool)

(assert (=> b!1534175 m!1416847))

(declare-fun m!1416849 () Bool)

(assert (=> start!130816 m!1416849))

(declare-fun m!1416851 () Bool)

(assert (=> start!130816 m!1416851))

(declare-fun m!1416853 () Bool)

(assert (=> b!1534176 m!1416853))

(declare-fun m!1416855 () Bool)

(assert (=> b!1534177 m!1416855))

(declare-fun m!1416857 () Bool)

(assert (=> b!1534178 m!1416857))

(assert (=> b!1534178 m!1416857))

(declare-fun m!1416859 () Bool)

(assert (=> b!1534178 m!1416859))

(declare-fun m!1416861 () Bool)

(assert (=> b!1534179 m!1416861))

(assert (=> b!1534180 m!1416857))

(assert (=> b!1534180 m!1416857))

(declare-fun m!1416863 () Bool)

(assert (=> b!1534180 m!1416863))

(check-sat (not b!1534175) (not b!1534178) (not b!1534180) (not start!130816) (not b!1534177) (not b!1534179))
