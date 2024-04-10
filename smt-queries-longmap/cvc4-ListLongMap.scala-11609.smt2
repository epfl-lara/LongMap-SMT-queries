; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135464 () Bool)

(assert start!135464)

(declare-fun res!1075440 () Bool)

(declare-fun e!877865 () Bool)

(assert (=> start!135464 (=> (not res!1075440) (not e!877865))))

(declare-fun mask!877 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135464 (= res!1075440 (validMask!0 mask!877))))

(assert (=> start!135464 e!877865))

(assert (=> start!135464 true))

(declare-datatypes ((array!105195 0))(
  ( (array!105196 (arr!50748 (Array (_ BitVec 32) (_ BitVec 64))) (size!51298 (_ BitVec 32))) )
))
(declare-fun _keys!591 () array!105195)

(declare-fun array_inv!39475 (array!105195) Bool)

(assert (=> start!135464 (array_inv!39475 _keys!591)))

(declare-fun b!1574146 () Bool)

(declare-fun res!1075439 () Bool)

(assert (=> b!1574146 (=> (not res!1075439) (not e!877865))))

(declare-fun i!537 () (_ BitVec 32))

(assert (=> b!1574146 (= res!1075439 (and (= (size!51298 _keys!591) (bvadd #b00000000000000000000000000000001 mask!877)) (bvsge i!537 #b00000000000000000000000000000000) (bvsle i!537 (size!51298 _keys!591)) (bvslt i!537 (size!51298 _keys!591))))))

(declare-fun b!1574147 () Bool)

(declare-fun res!1075438 () Bool)

(assert (=> b!1574147 (=> (not res!1075438) (not e!877865))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1574147 (= res!1075438 (validKeyInArray!0 (select (arr!50748 _keys!591) i!537)))))

(declare-fun b!1574148 () Bool)

(assert (=> b!1574148 (= e!877865 (not true))))

(declare-datatypes ((SeekEntryResult!13649 0))(
  ( (MissingZero!13649 (index!56994 (_ BitVec 32))) (Found!13649 (index!56995 (_ BitVec 32))) (Intermediate!13649 (undefined!14461 Bool) (index!56996 (_ BitVec 32)) (x!141844 (_ BitVec 32))) (Undefined!13649) (MissingVacant!13649 (index!56997 (_ BitVec 32))) )
))
(declare-fun lt!674757 () SeekEntryResult!13649)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!105195 (_ BitVec 32)) SeekEntryResult!13649)

(assert (=> b!1574148 (= lt!674757 (seekEntryOrOpen!0 (select (arr!50748 _keys!591) i!537) _keys!591 mask!877))))

(declare-fun arrayContainsKey!0 (array!105195 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1574148 (arrayContainsKey!0 _keys!591 (select (arr!50748 _keys!591) i!537) #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!52160 0))(
  ( (Unit!52161) )
))
(declare-fun lt!674758 () Unit!52160)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!105195 (_ BitVec 64) (_ BitVec 32)) Unit!52160)

(assert (=> b!1574148 (= lt!674758 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!591 (select (arr!50748 _keys!591) i!537) i!537))))

(assert (= (and start!135464 res!1075440) b!1574146))

(assert (= (and b!1574146 res!1075439) b!1574147))

(assert (= (and b!1574147 res!1075438) b!1574148))

(declare-fun m!1447403 () Bool)

(assert (=> start!135464 m!1447403))

(declare-fun m!1447405 () Bool)

(assert (=> start!135464 m!1447405))

(declare-fun m!1447407 () Bool)

(assert (=> b!1574147 m!1447407))

(assert (=> b!1574147 m!1447407))

(declare-fun m!1447409 () Bool)

(assert (=> b!1574147 m!1447409))

(assert (=> b!1574148 m!1447407))

(assert (=> b!1574148 m!1447407))

(declare-fun m!1447411 () Bool)

(assert (=> b!1574148 m!1447411))

(assert (=> b!1574148 m!1447407))

(declare-fun m!1447413 () Bool)

(assert (=> b!1574148 m!1447413))

(assert (=> b!1574148 m!1447407))

(declare-fun m!1447415 () Bool)

(assert (=> b!1574148 m!1447415))

(push 1)

(assert (not b!1574148))

(assert (not b!1574147))

(assert (not start!135464))

(check-sat)

(pop 1)

(push 1)

(check-sat)

