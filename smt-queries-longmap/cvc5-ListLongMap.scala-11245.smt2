; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131138 () Bool)

(assert start!131138)

(declare-fun res!1055342 () Bool)

(declare-fun e!855978 () Bool)

(assert (=> start!131138 (=> (not res!1055342) (not e!855978))))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131138 (= res!1055342 (validMask!0 mask!2480))))

(assert (=> start!131138 e!855978))

(assert (=> start!131138 true))

(declare-datatypes ((array!102203 0))(
  ( (array!102204 (arr!49316 (Array (_ BitVec 32) (_ BitVec 64))) (size!49866 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102203)

(declare-fun array_inv!38344 (array!102203) Bool)

(assert (=> start!131138 (array_inv!38344 a!2792)))

(declare-fun b!1538361 () Bool)

(declare-fun res!1055345 () Bool)

(assert (=> b!1538361 (=> (not res!1055345) (not e!855978))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102203 (_ BitVec 32)) Bool)

(assert (=> b!1538361 (= res!1055345 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1538362 () Bool)

(declare-fun res!1055347 () Bool)

(assert (=> b!1538362 (=> (not res!1055347) (not e!855978))))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13442 0))(
  ( (MissingZero!13442 (index!56163 (_ BitVec 32))) (Found!13442 (index!56164 (_ BitVec 32))) (Intermediate!13442 (undefined!14254 Bool) (index!56165 (_ BitVec 32)) (x!137903 (_ BitVec 32))) (Undefined!13442) (MissingVacant!13442 (index!56166 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102203 (_ BitVec 32)) SeekEntryResult!13442)

(assert (=> b!1538362 (= res!1055347 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49316 a!2792) j!64) a!2792 mask!2480) (Found!13442 j!64)))))

(declare-fun b!1538363 () Bool)

(assert (=> b!1538363 (= e!855978 false)))

(declare-fun lt!664891 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1538363 (= lt!664891 (nextIndex!0 index!463 x!510 mask!2480))))

(declare-fun b!1538364 () Bool)

(declare-fun res!1055346 () Bool)

(assert (=> b!1538364 (=> (not res!1055346) (not e!855978))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1538364 (= res!1055346 (and (= (size!49866 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49866 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49866 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1538365 () Bool)

(declare-fun res!1055343 () Bool)

(assert (=> b!1538365 (=> (not res!1055343) (not e!855978))))

(assert (=> b!1538365 (= res!1055343 (not (= (select (arr!49316 a!2792) index!463) (select (arr!49316 a!2792) j!64))))))

(declare-fun b!1538366 () Bool)

(declare-fun res!1055340 () Bool)

(assert (=> b!1538366 (=> (not res!1055340) (not e!855978))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1538366 (= res!1055340 (validKeyInArray!0 (select (arr!49316 a!2792) j!64)))))

(declare-fun b!1538367 () Bool)

(declare-fun res!1055341 () Bool)

(assert (=> b!1538367 (=> (not res!1055341) (not e!855978))))

(assert (=> b!1538367 (= res!1055341 (validKeyInArray!0 (select (arr!49316 a!2792) i!951)))))

(declare-fun b!1538368 () Bool)

(declare-fun res!1055339 () Bool)

(assert (=> b!1538368 (=> (not res!1055339) (not e!855978))))

(declare-datatypes ((List!35790 0))(
  ( (Nil!35787) (Cons!35786 (h!37231 (_ BitVec 64)) (t!50484 List!35790)) )
))
(declare-fun arrayNoDuplicates!0 (array!102203 (_ BitVec 32) List!35790) Bool)

(assert (=> b!1538368 (= res!1055339 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35787))))

(declare-fun b!1538369 () Bool)

(declare-fun res!1055344 () Bool)

(assert (=> b!1538369 (=> (not res!1055344) (not e!855978))))

(assert (=> b!1538369 (= res!1055344 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49866 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49866 a!2792)) (= (select (arr!49316 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!131138 res!1055342) b!1538364))

(assert (= (and b!1538364 res!1055346) b!1538367))

(assert (= (and b!1538367 res!1055341) b!1538366))

(assert (= (and b!1538366 res!1055340) b!1538361))

(assert (= (and b!1538361 res!1055345) b!1538368))

(assert (= (and b!1538368 res!1055339) b!1538369))

(assert (= (and b!1538369 res!1055344) b!1538362))

(assert (= (and b!1538362 res!1055347) b!1538365))

(assert (= (and b!1538365 res!1055343) b!1538363))

(declare-fun m!1420803 () Bool)

(assert (=> b!1538363 m!1420803))

(declare-fun m!1420805 () Bool)

(assert (=> b!1538366 m!1420805))

(assert (=> b!1538366 m!1420805))

(declare-fun m!1420807 () Bool)

(assert (=> b!1538366 m!1420807))

(declare-fun m!1420809 () Bool)

(assert (=> b!1538368 m!1420809))

(declare-fun m!1420811 () Bool)

(assert (=> b!1538361 m!1420811))

(declare-fun m!1420813 () Bool)

(assert (=> b!1538365 m!1420813))

(assert (=> b!1538365 m!1420805))

(assert (=> b!1538362 m!1420805))

(assert (=> b!1538362 m!1420805))

(declare-fun m!1420815 () Bool)

(assert (=> b!1538362 m!1420815))

(declare-fun m!1420817 () Bool)

(assert (=> b!1538367 m!1420817))

(assert (=> b!1538367 m!1420817))

(declare-fun m!1420819 () Bool)

(assert (=> b!1538367 m!1420819))

(declare-fun m!1420821 () Bool)

(assert (=> start!131138 m!1420821))

(declare-fun m!1420823 () Bool)

(assert (=> start!131138 m!1420823))

(declare-fun m!1420825 () Bool)

(assert (=> b!1538369 m!1420825))

(push 1)

(assert (not b!1538362))

(assert (not start!131138))

(assert (not b!1538361))

(assert (not b!1538368))

(assert (not b!1538366))

(assert (not b!1538367))

(assert (not b!1538363))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

