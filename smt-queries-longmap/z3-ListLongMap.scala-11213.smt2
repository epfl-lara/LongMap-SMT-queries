; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130860 () Bool)

(assert start!130860)

(declare-fun b!1535170 () Bool)

(declare-fun res!1052442 () Bool)

(declare-fun e!854612 () Bool)

(assert (=> b!1535170 (=> (not res!1052442) (not e!854612))))

(declare-datatypes ((array!101956 0))(
  ( (array!101957 (arr!49195 (Array (_ BitVec 32) (_ BitVec 64))) (size!49747 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101956)

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101956 (_ BitVec 32)) Bool)

(assert (=> b!1535170 (= res!1052442 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1535171 () Bool)

(declare-fun res!1052445 () Bool)

(assert (=> b!1535171 (=> (not res!1052445) (not e!854612))))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13352 0))(
  ( (MissingZero!13352 (index!55803 (_ BitVec 32))) (Found!13352 (index!55804 (_ BitVec 32))) (Intermediate!13352 (undefined!14164 Bool) (index!55805 (_ BitVec 32)) (x!137549 (_ BitVec 32))) (Undefined!13352) (MissingVacant!13352 (index!55806 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101956 (_ BitVec 32)) SeekEntryResult!13352)

(assert (=> b!1535171 (= res!1052445 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49195 a!2792) j!64) a!2792 mask!2480) (Found!13352 j!64)))))

(declare-fun b!1535172 () Bool)

(declare-fun res!1052447 () Bool)

(assert (=> b!1535172 (=> (not res!1052447) (not e!854612))))

(assert (=> b!1535172 (= res!1052447 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49747 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49747 a!2792)) (= (select (arr!49195 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!1052448 () Bool)

(assert (=> start!130860 (=> (not res!1052448) (not e!854612))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130860 (= res!1052448 (validMask!0 mask!2480))))

(assert (=> start!130860 e!854612))

(assert (=> start!130860 true))

(declare-fun array_inv!38428 (array!101956) Bool)

(assert (=> start!130860 (array_inv!38428 a!2792)))

(declare-fun b!1535173 () Bool)

(declare-fun res!1052443 () Bool)

(assert (=> b!1535173 (=> (not res!1052443) (not e!854612))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1535173 (= res!1052443 (validKeyInArray!0 (select (arr!49195 a!2792) j!64)))))

(declare-fun b!1535174 () Bool)

(declare-fun e!854614 () Bool)

(assert (=> b!1535174 (= e!854612 e!854614)))

(declare-fun res!1052441 () Bool)

(assert (=> b!1535174 (=> (not res!1052441) (not e!854614))))

(declare-fun lt!663783 () (_ BitVec 32))

(assert (=> b!1535174 (= res!1052441 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvsge lt!663783 #b00000000000000000000000000000000) (bvslt lt!663783 (size!49747 a!2792))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1535174 (= lt!663783 (nextIndex!0 index!463 x!510 mask!2480))))

(declare-fun b!1535175 () Bool)

(assert (=> b!1535175 (= e!854614 false)))

(declare-fun lt!663782 () SeekEntryResult!13352)

(assert (=> b!1535175 (= lt!663782 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!663783 vacantIndex!5 (select (arr!49195 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1535176 () Bool)

(declare-fun res!1052446 () Bool)

(assert (=> b!1535176 (=> (not res!1052446) (not e!854612))))

(declare-datatypes ((List!35747 0))(
  ( (Nil!35744) (Cons!35743 (h!37189 (_ BitVec 64)) (t!50433 List!35747)) )
))
(declare-fun arrayNoDuplicates!0 (array!101956 (_ BitVec 32) List!35747) Bool)

(assert (=> b!1535176 (= res!1052446 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35744))))

(declare-fun b!1535177 () Bool)

(declare-fun res!1052449 () Bool)

(assert (=> b!1535177 (=> (not res!1052449) (not e!854612))))

(assert (=> b!1535177 (= res!1052449 (not (= (select (arr!49195 a!2792) index!463) (select (arr!49195 a!2792) j!64))))))

(declare-fun b!1535178 () Bool)

(declare-fun res!1052440 () Bool)

(assert (=> b!1535178 (=> (not res!1052440) (not e!854612))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1535178 (= res!1052440 (validKeyInArray!0 (select (arr!49195 a!2792) i!951)))))

(declare-fun b!1535179 () Bool)

(declare-fun res!1052444 () Bool)

(assert (=> b!1535179 (=> (not res!1052444) (not e!854612))))

(assert (=> b!1535179 (= res!1052444 (and (= (size!49747 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49747 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49747 a!2792)) (not (= i!951 j!64))))))

(assert (= (and start!130860 res!1052448) b!1535179))

(assert (= (and b!1535179 res!1052444) b!1535178))

(assert (= (and b!1535178 res!1052440) b!1535173))

(assert (= (and b!1535173 res!1052443) b!1535170))

(assert (= (and b!1535170 res!1052442) b!1535176))

(assert (= (and b!1535176 res!1052446) b!1535172))

(assert (= (and b!1535172 res!1052447) b!1535171))

(assert (= (and b!1535171 res!1052445) b!1535177))

(assert (= (and b!1535177 res!1052449) b!1535174))

(assert (= (and b!1535174 res!1052441) b!1535175))

(declare-fun m!1417103 () Bool)

(assert (=> b!1535178 m!1417103))

(assert (=> b!1535178 m!1417103))

(declare-fun m!1417105 () Bool)

(assert (=> b!1535178 m!1417105))

(declare-fun m!1417107 () Bool)

(assert (=> b!1535174 m!1417107))

(declare-fun m!1417109 () Bool)

(assert (=> b!1535175 m!1417109))

(assert (=> b!1535175 m!1417109))

(declare-fun m!1417111 () Bool)

(assert (=> b!1535175 m!1417111))

(declare-fun m!1417113 () Bool)

(assert (=> b!1535172 m!1417113))

(assert (=> b!1535173 m!1417109))

(assert (=> b!1535173 m!1417109))

(declare-fun m!1417115 () Bool)

(assert (=> b!1535173 m!1417115))

(declare-fun m!1417117 () Bool)

(assert (=> b!1535177 m!1417117))

(assert (=> b!1535177 m!1417109))

(assert (=> b!1535171 m!1417109))

(assert (=> b!1535171 m!1417109))

(declare-fun m!1417119 () Bool)

(assert (=> b!1535171 m!1417119))

(declare-fun m!1417121 () Bool)

(assert (=> b!1535176 m!1417121))

(declare-fun m!1417123 () Bool)

(assert (=> start!130860 m!1417123))

(declare-fun m!1417125 () Bool)

(assert (=> start!130860 m!1417125))

(declare-fun m!1417127 () Bool)

(assert (=> b!1535170 m!1417127))

(check-sat (not start!130860) (not b!1535175) (not b!1535171) (not b!1535173) (not b!1535176) (not b!1535174) (not b!1535170) (not b!1535178))
(check-sat)
