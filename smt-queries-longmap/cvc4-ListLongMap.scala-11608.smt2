; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135458 () Bool)

(assert start!135458)

(declare-fun res!1075413 () Bool)

(declare-fun e!877845 () Bool)

(assert (=> start!135458 (=> (not res!1075413) (not e!877845))))

(declare-fun mask!877 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135458 (= res!1075413 (validMask!0 mask!877))))

(assert (=> start!135458 e!877845))

(assert (=> start!135458 true))

(declare-datatypes ((array!105189 0))(
  ( (array!105190 (arr!50745 (Array (_ BitVec 32) (_ BitVec 64))) (size!51295 (_ BitVec 32))) )
))
(declare-fun _keys!591 () array!105189)

(declare-fun array_inv!39472 (array!105189) Bool)

(assert (=> start!135458 (array_inv!39472 _keys!591)))

(declare-fun b!1574121 () Bool)

(declare-fun e!877847 () Bool)

(declare-fun i!537 () (_ BitVec 32))

(assert (=> b!1574121 (= e!877847 (bvsge (bvadd #b00000000000000000000000000000001 i!537) #b00000000000000000000000000000000))))

(declare-fun b!1574118 () Bool)

(declare-fun res!1075410 () Bool)

(assert (=> b!1574118 (=> (not res!1075410) (not e!877845))))

(assert (=> b!1574118 (= res!1075410 (and (= (size!51295 _keys!591) (bvadd #b00000000000000000000000000000001 mask!877)) (bvsge i!537 #b00000000000000000000000000000000) (bvsle i!537 (size!51295 _keys!591)) (bvslt i!537 (size!51295 _keys!591))))))

(declare-fun b!1574120 () Bool)

(assert (=> b!1574120 (= e!877845 (not e!877847))))

(declare-fun res!1075411 () Bool)

(assert (=> b!1574120 (=> res!1075411 e!877847)))

(declare-datatypes ((SeekEntryResult!13646 0))(
  ( (MissingZero!13646 (index!56982 (_ BitVec 32))) (Found!13646 (index!56983 (_ BitVec 32))) (Intermediate!13646 (undefined!14458 Bool) (index!56984 (_ BitVec 32)) (x!141833 (_ BitVec 32))) (Undefined!13646) (MissingVacant!13646 (index!56985 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!105189 (_ BitVec 32)) SeekEntryResult!13646)

(assert (=> b!1574120 (= res!1075411 (not (= (seekEntryOrOpen!0 (select (arr!50745 _keys!591) i!537) _keys!591 mask!877) (Found!13646 i!537))))))

(declare-fun arrayContainsKey!0 (array!105189 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1574120 (arrayContainsKey!0 _keys!591 (select (arr!50745 _keys!591) i!537) #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!52154 0))(
  ( (Unit!52155) )
))
(declare-fun lt!674740 () Unit!52154)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!105189 (_ BitVec 64) (_ BitVec 32)) Unit!52154)

(assert (=> b!1574120 (= lt!674740 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!591 (select (arr!50745 _keys!591) i!537) i!537))))

(declare-fun b!1574119 () Bool)

(declare-fun res!1075412 () Bool)

(assert (=> b!1574119 (=> (not res!1075412) (not e!877845))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1574119 (= res!1075412 (validKeyInArray!0 (select (arr!50745 _keys!591) i!537)))))

(assert (= (and start!135458 res!1075413) b!1574118))

(assert (= (and b!1574118 res!1075410) b!1574119))

(assert (= (and b!1574119 res!1075412) b!1574120))

(assert (= (and b!1574120 (not res!1075411)) b!1574121))

(declare-fun m!1447361 () Bool)

(assert (=> start!135458 m!1447361))

(declare-fun m!1447363 () Bool)

(assert (=> start!135458 m!1447363))

(declare-fun m!1447365 () Bool)

(assert (=> b!1574120 m!1447365))

(assert (=> b!1574120 m!1447365))

(declare-fun m!1447367 () Bool)

(assert (=> b!1574120 m!1447367))

(assert (=> b!1574120 m!1447365))

(declare-fun m!1447369 () Bool)

(assert (=> b!1574120 m!1447369))

(assert (=> b!1574120 m!1447365))

(declare-fun m!1447371 () Bool)

(assert (=> b!1574120 m!1447371))

(assert (=> b!1574119 m!1447365))

(assert (=> b!1574119 m!1447365))

(declare-fun m!1447373 () Bool)

(assert (=> b!1574119 m!1447373))

(push 1)

(assert (not b!1574120))

(assert (not b!1574119))

(assert (not start!135458))

(check-sat)

(pop 1)

(push 1)

(check-sat)

