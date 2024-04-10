; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116684 () Bool)

(assert start!116684)

(declare-fun b!1375287 () Bool)

(declare-fun res!918352 () Bool)

(declare-fun e!779097 () Bool)

(assert (=> b!1375287 (=> (not res!918352) (not e!779097))))

(declare-fun to!206 () (_ BitVec 32))

(declare-fun i!1445 () (_ BitVec 32))

(declare-datatypes ((array!93353 0))(
  ( (array!93354 (arr!45080 (Array (_ BitVec 32) (_ BitVec 64))) (size!45630 (_ BitVec 32))) )
))
(declare-fun a!4032 () array!93353)

(assert (=> b!1375287 (= res!918352 (and (bvslt (size!45630 a!4032) #b01111111111111111111111111111111) (bvsge to!206 #b00000000000000000000000000000000) (bvsle to!206 (size!45630 a!4032)) (bvsgt to!206 i!1445)))))

(declare-fun res!918349 () Bool)

(assert (=> start!116684 (=> (not res!918349) (not e!779097))))

(assert (=> start!116684 (= res!918349 (and (bvsge i!1445 #b00000000000000000000000000000000) (bvslt i!1445 (size!45630 a!4032))))))

(assert (=> start!116684 e!779097))

(assert (=> start!116684 true))

(declare-fun array_inv!34108 (array!93353) Bool)

(assert (=> start!116684 (array_inv!34108 a!4032)))

(declare-fun b!1375285 () Bool)

(declare-fun res!918350 () Bool)

(assert (=> b!1375285 (=> (not res!918350) (not e!779097))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1375285 (= res!918350 (validKeyInArray!0 (select (arr!45080 a!4032) i!1445)))))

(declare-fun b!1375288 () Bool)

(assert (=> b!1375288 (= e!779097 false)))

(declare-fun lt!604299 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93353 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1375288 (= lt!604299 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun k!2947 () (_ BitVec 64))

(declare-fun lt!604300 () (_ BitVec 32))

(assert (=> b!1375288 (= lt!604300 (arrayCountValidKeys!0 (array!93354 (store (arr!45080 a!4032) i!1445 k!2947) (size!45630 a!4032)) (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun b!1375286 () Bool)

(declare-fun res!918351 () Bool)

(assert (=> b!1375286 (=> (not res!918351) (not e!779097))))

(assert (=> b!1375286 (= res!918351 (not (validKeyInArray!0 k!2947)))))

(assert (= (and start!116684 res!918349) b!1375285))

(assert (= (and b!1375285 res!918350) b!1375286))

(assert (= (and b!1375286 res!918351) b!1375287))

(assert (= (and b!1375287 res!918352) b!1375288))

(declare-fun m!1259095 () Bool)

(assert (=> start!116684 m!1259095))

(declare-fun m!1259097 () Bool)

(assert (=> b!1375285 m!1259097))

(assert (=> b!1375285 m!1259097))

(declare-fun m!1259099 () Bool)

(assert (=> b!1375285 m!1259099))

(declare-fun m!1259101 () Bool)

(assert (=> b!1375288 m!1259101))

(declare-fun m!1259103 () Bool)

(assert (=> b!1375288 m!1259103))

(declare-fun m!1259105 () Bool)

(assert (=> b!1375288 m!1259105))

(declare-fun m!1259107 () Bool)

(assert (=> b!1375286 m!1259107))

(push 1)

(assert (not b!1375288))

(assert (not start!116684))

(assert (not b!1375285))

(assert (not b!1375286))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

