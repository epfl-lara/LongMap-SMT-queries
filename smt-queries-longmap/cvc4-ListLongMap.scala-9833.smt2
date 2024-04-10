; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116688 () Bool)

(assert start!116688)

(declare-fun b!1375309 () Bool)

(declare-fun res!918376 () Bool)

(declare-fun e!779109 () Bool)

(assert (=> b!1375309 (=> (not res!918376) (not e!779109))))

(declare-datatypes ((array!93357 0))(
  ( (array!93358 (arr!45082 (Array (_ BitVec 32) (_ BitVec 64))) (size!45632 (_ BitVec 32))) )
))
(declare-fun a!4032 () array!93357)

(declare-fun i!1445 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1375309 (= res!918376 (validKeyInArray!0 (select (arr!45082 a!4032) i!1445)))))

(declare-fun b!1375311 () Bool)

(declare-fun res!918375 () Bool)

(assert (=> b!1375311 (=> (not res!918375) (not e!779109))))

(declare-fun to!206 () (_ BitVec 32))

(assert (=> b!1375311 (= res!918375 (and (bvslt (size!45632 a!4032) #b01111111111111111111111111111111) (bvsge to!206 #b00000000000000000000000000000000) (bvsle to!206 (size!45632 a!4032)) (bvsgt to!206 i!1445)))))

(declare-fun res!918374 () Bool)

(assert (=> start!116688 (=> (not res!918374) (not e!779109))))

(assert (=> start!116688 (= res!918374 (and (bvsge i!1445 #b00000000000000000000000000000000) (bvslt i!1445 (size!45632 a!4032))))))

(assert (=> start!116688 e!779109))

(assert (=> start!116688 true))

(declare-fun array_inv!34110 (array!93357) Bool)

(assert (=> start!116688 (array_inv!34110 a!4032)))

(declare-fun b!1375312 () Bool)

(assert (=> b!1375312 (= e!779109 false)))

(declare-fun lt!604312 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93357 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1375312 (= lt!604312 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun k!2947 () (_ BitVec 64))

(declare-fun lt!604311 () (_ BitVec 32))

(assert (=> b!1375312 (= lt!604311 (arrayCountValidKeys!0 (array!93358 (store (arr!45082 a!4032) i!1445 k!2947) (size!45632 a!4032)) (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun b!1375310 () Bool)

(declare-fun res!918373 () Bool)

(assert (=> b!1375310 (=> (not res!918373) (not e!779109))))

(assert (=> b!1375310 (= res!918373 (not (validKeyInArray!0 k!2947)))))

(assert (= (and start!116688 res!918374) b!1375309))

(assert (= (and b!1375309 res!918376) b!1375310))

(assert (= (and b!1375310 res!918373) b!1375311))

(assert (= (and b!1375311 res!918375) b!1375312))

(declare-fun m!1259123 () Bool)

(assert (=> b!1375309 m!1259123))

(assert (=> b!1375309 m!1259123))

(declare-fun m!1259125 () Bool)

(assert (=> b!1375309 m!1259125))

(declare-fun m!1259127 () Bool)

(assert (=> start!116688 m!1259127))

(declare-fun m!1259129 () Bool)

(assert (=> b!1375312 m!1259129))

(declare-fun m!1259131 () Bool)

(assert (=> b!1375312 m!1259131))

(declare-fun m!1259133 () Bool)

(assert (=> b!1375312 m!1259133))

(declare-fun m!1259135 () Bool)

(assert (=> b!1375310 m!1259135))

(push 1)

(assert (not b!1375309))

(assert (not b!1375310))

(assert (not b!1375312))

(assert (not start!116688))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

