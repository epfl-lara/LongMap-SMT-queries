; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116786 () Bool)

(assert start!116786)

(declare-fun b!1376313 () Bool)

(declare-fun e!779677 () Bool)

(assert (=> b!1376313 (= e!779677 false)))

(declare-fun to!206 () (_ BitVec 32))

(declare-fun i!1445 () (_ BitVec 32))

(declare-datatypes ((array!93409 0))(
  ( (array!93410 (arr!45108 (Array (_ BitVec 32) (_ BitVec 64))) (size!45660 (_ BitVec 32))) )
))
(declare-fun a!4032 () array!93409)

(declare-fun lt!605101 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93409 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1376313 (= lt!605101 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun k!2947 () (_ BitVec 64))

(declare-fun lt!605102 () (_ BitVec 32))

(assert (=> b!1376313 (= lt!605102 (arrayCountValidKeys!0 (array!93410 (store (arr!45108 a!4032) i!1445 k!2947) (size!45660 a!4032)) (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun b!1376312 () Bool)

(declare-fun res!919232 () Bool)

(assert (=> b!1376312 (=> (not res!919232) (not e!779677))))

(assert (=> b!1376312 (= res!919232 (and (bvslt (size!45660 a!4032) #b01111111111111111111111111111111) (bvsge to!206 #b00000000000000000000000000000000) (bvsle to!206 (size!45660 a!4032)) (bvsgt to!206 i!1445)))))

(declare-fun b!1376311 () Bool)

(declare-fun res!919230 () Bool)

(assert (=> b!1376311 (=> (not res!919230) (not e!779677))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1376311 (= res!919230 (not (validKeyInArray!0 k!2947)))))

(declare-fun res!919231 () Bool)

(assert (=> start!116786 (=> (not res!919231) (not e!779677))))

(assert (=> start!116786 (= res!919231 (and (bvsge i!1445 #b00000000000000000000000000000000) (bvslt i!1445 (size!45660 a!4032))))))

(assert (=> start!116786 e!779677))

(assert (=> start!116786 true))

(declare-fun array_inv!34341 (array!93409) Bool)

(assert (=> start!116786 (array_inv!34341 a!4032)))

(declare-fun b!1376310 () Bool)

(declare-fun res!919229 () Bool)

(assert (=> b!1376310 (=> (not res!919229) (not e!779677))))

(assert (=> b!1376310 (= res!919229 (validKeyInArray!0 (select (arr!45108 a!4032) i!1445)))))

(assert (= (and start!116786 res!919231) b!1376310))

(assert (= (and b!1376310 res!919229) b!1376311))

(assert (= (and b!1376311 res!919230) b!1376312))

(assert (= (and b!1376312 res!919232) b!1376313))

(declare-fun m!1259943 () Bool)

(assert (=> b!1376313 m!1259943))

(declare-fun m!1259945 () Bool)

(assert (=> b!1376313 m!1259945))

(declare-fun m!1259947 () Bool)

(assert (=> b!1376313 m!1259947))

(declare-fun m!1259949 () Bool)

(assert (=> b!1376311 m!1259949))

(declare-fun m!1259951 () Bool)

(assert (=> start!116786 m!1259951))

(declare-fun m!1259953 () Bool)

(assert (=> b!1376310 m!1259953))

(assert (=> b!1376310 m!1259953))

(declare-fun m!1259955 () Bool)

(assert (=> b!1376310 m!1259955))

(push 1)

(assert (not b!1376310))

(assert (not b!1376311))

(assert (not b!1376313))

(assert (not start!116786))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

