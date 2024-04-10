; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135490 () Bool)

(assert start!135490)

(declare-fun b!1574213 () Bool)

(declare-fun res!1075504 () Bool)

(declare-fun e!877907 () Bool)

(assert (=> b!1574213 (=> (not res!1075504) (not e!877907))))

(declare-datatypes ((array!105211 0))(
  ( (array!105212 (arr!50755 (Array (_ BitVec 32) (_ BitVec 64))) (size!51305 (_ BitVec 32))) )
))
(declare-fun _keys!591 () array!105211)

(assert (=> b!1574213 (= res!1075504 (bvslt (size!51305 _keys!591) #b01111111111111111111111111111111))))

(declare-fun b!1574214 () Bool)

(declare-fun i!537 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!105211 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1574214 (= e!877907 (not (arrayContainsKey!0 _keys!591 (select (arr!50755 _keys!591) i!537) i!537)))))

(declare-fun b!1574212 () Bool)

(declare-fun res!1075505 () Bool)

(assert (=> b!1574212 (=> (not res!1075505) (not e!877907))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1574212 (= res!1075505 (validKeyInArray!0 (select (arr!50755 _keys!591) i!537)))))

(declare-fun b!1574211 () Bool)

(declare-fun res!1075506 () Bool)

(assert (=> b!1574211 (=> (not res!1075506) (not e!877907))))

(declare-fun mask!877 () (_ BitVec 32))

(assert (=> b!1574211 (= res!1075506 (and (= (size!51305 _keys!591) (bvadd #b00000000000000000000000000000001 mask!877)) (bvsge i!537 #b00000000000000000000000000000000) (bvsle i!537 (size!51305 _keys!591)) (bvslt i!537 (size!51305 _keys!591))))))

(declare-fun res!1075503 () Bool)

(assert (=> start!135490 (=> (not res!1075503) (not e!877907))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135490 (= res!1075503 (validMask!0 mask!877))))

(assert (=> start!135490 e!877907))

(assert (=> start!135490 true))

(declare-fun array_inv!39482 (array!105211) Bool)

(assert (=> start!135490 (array_inv!39482 _keys!591)))

(assert (= (and start!135490 res!1075503) b!1574211))

(assert (= (and b!1574211 res!1075506) b!1574212))

(assert (= (and b!1574212 res!1075505) b!1574213))

(assert (= (and b!1574213 res!1075504) b!1574214))

(declare-fun m!1447465 () Bool)

(assert (=> b!1574214 m!1447465))

(assert (=> b!1574214 m!1447465))

(declare-fun m!1447467 () Bool)

(assert (=> b!1574214 m!1447467))

(assert (=> b!1574212 m!1447465))

(assert (=> b!1574212 m!1447465))

(declare-fun m!1447469 () Bool)

(assert (=> b!1574212 m!1447469))

(declare-fun m!1447471 () Bool)

(assert (=> start!135490 m!1447471))

(declare-fun m!1447473 () Bool)

(assert (=> start!135490 m!1447473))

(push 1)

(assert (not b!1574212))

(assert (not b!1574214))

(assert (not start!135490))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!165167 () Bool)

(assert (=> d!165167 (= (validKeyInArray!0 (select (arr!50755 _keys!591) i!537)) (and (not (= (select (arr!50755 _keys!591) i!537) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!50755 _keys!591) i!537) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1574212 d!165167))

(declare-fun d!165169 () Bool)

(declare-fun res!1075541 () Bool)

(declare-fun e!877930 () Bool)

(assert (=> d!165169 (=> res!1075541 e!877930)))

(assert (=> d!165169 (= res!1075541 (= (select (arr!50755 _keys!591) i!537) (select (arr!50755 _keys!591) i!537)))))

(assert (=> d!165169 (= (arrayContainsKey!0 _keys!591 (select (arr!50755 _keys!591) i!537) i!537) e!877930)))

(declare-fun b!1574249 () Bool)

(declare-fun e!877931 () Bool)

(assert (=> b!1574249 (= e!877930 e!877931)))

(declare-fun res!1075542 () Bool)

(assert (=> b!1574249 (=> (not res!1075542) (not e!877931))))

(assert (=> b!1574249 (= res!1075542 (bvslt (bvadd i!537 #b00000000000000000000000000000001) (size!51305 _keys!591)))))

(declare-fun b!1574250 () Bool)

(assert (=> b!1574250 (= e!877931 (arrayContainsKey!0 _keys!591 (select (arr!50755 _keys!591) i!537) (bvadd i!537 #b00000000000000000000000000000001)))))

