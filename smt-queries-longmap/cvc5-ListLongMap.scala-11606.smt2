; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135442 () Bool)

(assert start!135442)

(declare-fun res!1075330 () Bool)

(declare-fun e!877790 () Bool)

(assert (=> start!135442 (=> (not res!1075330) (not e!877790))))

(declare-fun mask!877 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135442 (= res!1075330 (validMask!0 mask!877))))

(assert (=> start!135442 e!877790))

(assert (=> start!135442 true))

(declare-datatypes ((array!105173 0))(
  ( (array!105174 (arr!50737 (Array (_ BitVec 32) (_ BitVec 64))) (size!51287 (_ BitVec 32))) )
))
(declare-fun _keys!591 () array!105173)

(declare-fun array_inv!39464 (array!105173) Bool)

(assert (=> start!135442 (array_inv!39464 _keys!591)))

(declare-fun b!1574038 () Bool)

(declare-fun res!1075332 () Bool)

(assert (=> b!1574038 (=> (not res!1075332) (not e!877790))))

(declare-fun i!537 () (_ BitVec 32))

(assert (=> b!1574038 (= res!1075332 (and (= (size!51287 _keys!591) (bvadd #b00000000000000000000000000000001 mask!877)) (bvsge i!537 #b00000000000000000000000000000000) (bvsle i!537 (size!51287 _keys!591)) (bvslt i!537 (size!51287 _keys!591))))))

(declare-fun b!1574039 () Bool)

(declare-fun res!1075331 () Bool)

(assert (=> b!1574039 (=> (not res!1075331) (not e!877790))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1574039 (= res!1075331 (validKeyInArray!0 (select (arr!50737 _keys!591) i!537)))))

(declare-fun b!1574040 () Bool)

(assert (=> b!1574040 (= e!877790 (not true))))

(declare-datatypes ((SeekEntryResult!13638 0))(
  ( (MissingZero!13638 (index!56950 (_ BitVec 32))) (Found!13638 (index!56951 (_ BitVec 32))) (Intermediate!13638 (undefined!14450 Bool) (index!56952 (_ BitVec 32)) (x!141809 (_ BitVec 32))) (Undefined!13638) (MissingVacant!13638 (index!56953 (_ BitVec 32))) )
))
(declare-fun lt!674701 () SeekEntryResult!13638)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!105173 (_ BitVec 32)) SeekEntryResult!13638)

(assert (=> b!1574040 (= lt!674701 (seekEntryOrOpen!0 (select (arr!50737 _keys!591) i!537) _keys!591 mask!877))))

(declare-fun arrayContainsKey!0 (array!105173 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1574040 (arrayContainsKey!0 _keys!591 (select (arr!50737 _keys!591) i!537) #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!52138 0))(
  ( (Unit!52139) )
))
(declare-fun lt!674700 () Unit!52138)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!105173 (_ BitVec 64) (_ BitVec 32)) Unit!52138)

(assert (=> b!1574040 (= lt!674700 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!591 (select (arr!50737 _keys!591) i!537) i!537))))

(assert (= (and start!135442 res!1075330) b!1574038))

(assert (= (and b!1574038 res!1075332) b!1574039))

(assert (= (and b!1574039 res!1075331) b!1574040))

(declare-fun m!1447249 () Bool)

(assert (=> start!135442 m!1447249))

(declare-fun m!1447251 () Bool)

(assert (=> start!135442 m!1447251))

(declare-fun m!1447253 () Bool)

(assert (=> b!1574039 m!1447253))

(assert (=> b!1574039 m!1447253))

(declare-fun m!1447255 () Bool)

(assert (=> b!1574039 m!1447255))

(assert (=> b!1574040 m!1447253))

(assert (=> b!1574040 m!1447253))

(declare-fun m!1447257 () Bool)

(assert (=> b!1574040 m!1447257))

(assert (=> b!1574040 m!1447253))

(declare-fun m!1447259 () Bool)

(assert (=> b!1574040 m!1447259))

(assert (=> b!1574040 m!1447253))

(declare-fun m!1447261 () Bool)

(assert (=> b!1574040 m!1447261))

(push 1)

(assert (not b!1574040))

(assert (not b!1574039))

(assert (not start!135442))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

