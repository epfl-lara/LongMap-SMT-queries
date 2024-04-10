; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116900 () Bool)

(assert start!116900)

(declare-fun res!920228 () Bool)

(declare-fun e!780289 () Bool)

(assert (=> start!116900 (=> (not res!920228) (not e!780289))))

(declare-fun i!1445 () (_ BitVec 32))

(declare-datatypes ((array!93569 0))(
  ( (array!93570 (arr!45188 (Array (_ BitVec 32) (_ BitVec 64))) (size!45738 (_ BitVec 32))) )
))
(declare-fun a!4032 () array!93569)

(assert (=> start!116900 (= res!920228 (and (bvsge i!1445 #b00000000000000000000000000000000) (bvslt i!1445 (size!45738 a!4032))))))

(assert (=> start!116900 e!780289))

(assert (=> start!116900 true))

(declare-fun array_inv!34216 (array!93569) Bool)

(assert (=> start!116900 (array_inv!34216 a!4032)))

(declare-fun b!1377503 () Bool)

(declare-fun res!920227 () Bool)

(declare-fun e!780288 () Bool)

(assert (=> b!1377503 (=> (not res!920227) (not e!780288))))

(declare-fun to!206 () (_ BitVec 32))

(assert (=> b!1377503 (= res!920227 (= to!206 (size!45738 a!4032)))))

(declare-fun b!1377504 () Bool)

(declare-fun res!920229 () Bool)

(assert (=> b!1377504 (=> (not res!920229) (not e!780289))))

(declare-fun k!2947 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1377504 (= res!920229 (not (validKeyInArray!0 k!2947)))))

(declare-fun b!1377505 () Bool)

(declare-fun res!920225 () Bool)

(assert (=> b!1377505 (=> (not res!920225) (not e!780289))))

(assert (=> b!1377505 (= res!920225 (and (bvslt (size!45738 a!4032) #b01111111111111111111111111111111) (bvsge to!206 #b00000000000000000000000000000000) (bvsle to!206 (size!45738 a!4032)) (bvsgt to!206 i!1445)))))

(declare-fun b!1377506 () Bool)

(assert (=> b!1377506 (= e!780289 e!780288)))

(declare-fun res!920226 () Bool)

(assert (=> b!1377506 (=> (not res!920226) (not e!780288))))

(declare-fun lt!606079 () array!93569)

(declare-fun arrayCountValidKeys!0 (array!93569 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1377506 (= res!920226 (= (arrayCountValidKeys!0 lt!606079 (bvadd #b00000000000000000000000000000001 i!1445) to!206) (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206)))))

(assert (=> b!1377506 (= lt!606079 (array!93570 (store (arr!45188 a!4032) i!1445 k!2947) (size!45738 a!4032)))))

(declare-fun b!1377507 () Bool)

(assert (=> b!1377507 (= e!780288 (not (= (arrayCountValidKeys!0 lt!606079 (bvadd #b00000000000000000000000000000001 i!1445) (size!45738 a!4032)) (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (size!45738 a!4032)))))))

(declare-fun b!1377508 () Bool)

(declare-fun res!920230 () Bool)

(assert (=> b!1377508 (=> (not res!920230) (not e!780289))))

(assert (=> b!1377508 (= res!920230 (validKeyInArray!0 (select (arr!45188 a!4032) i!1445)))))

(assert (= (and start!116900 res!920228) b!1377508))

(assert (= (and b!1377508 res!920230) b!1377504))

(assert (= (and b!1377504 res!920229) b!1377505))

(assert (= (and b!1377505 res!920225) b!1377506))

(assert (= (and b!1377506 res!920226) b!1377503))

(assert (= (and b!1377503 res!920227) b!1377507))

(declare-fun m!1261823 () Bool)

(assert (=> b!1377504 m!1261823))

(declare-fun m!1261825 () Bool)

(assert (=> b!1377508 m!1261825))

(assert (=> b!1377508 m!1261825))

(declare-fun m!1261827 () Bool)

(assert (=> b!1377508 m!1261827))

(declare-fun m!1261829 () Bool)

(assert (=> start!116900 m!1261829))

(declare-fun m!1261831 () Bool)

(assert (=> b!1377506 m!1261831))

(declare-fun m!1261833 () Bool)

(assert (=> b!1377506 m!1261833))

(declare-fun m!1261835 () Bool)

(assert (=> b!1377506 m!1261835))

(declare-fun m!1261837 () Bool)

(assert (=> b!1377507 m!1261837))

(declare-fun m!1261839 () Bool)

(assert (=> b!1377507 m!1261839))

(push 1)

(assert (not b!1377508))

(assert (not start!116900))

(assert (not b!1377507))

(assert (not b!1377504))

(assert (not b!1377506))

(check-sat)

(pop 1)

(push 1)

(check-sat)

