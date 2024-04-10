; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116894 () Bool)

(assert start!116894)

(declare-fun b!1377466 () Bool)

(declare-fun e!780268 () Bool)

(assert (=> b!1377466 (= e!780268 false)))

(declare-fun to!206 () (_ BitVec 32))

(declare-fun i!1445 () (_ BitVec 32))

(declare-datatypes ((array!93563 0))(
  ( (array!93564 (arr!45185 (Array (_ BitVec 32) (_ BitVec 64))) (size!45735 (_ BitVec 32))) )
))
(declare-fun a!4032 () array!93563)

(declare-fun lt!606063 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93563 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1377466 (= lt!606063 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun lt!606064 () (_ BitVec 32))

(declare-fun k!2947 () (_ BitVec 64))

(assert (=> b!1377466 (= lt!606064 (arrayCountValidKeys!0 (array!93564 (store (arr!45185 a!4032) i!1445 k!2947) (size!45735 a!4032)) (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun res!920187 () Bool)

(assert (=> start!116894 (=> (not res!920187) (not e!780268))))

(assert (=> start!116894 (= res!920187 (and (bvsge i!1445 #b00000000000000000000000000000000) (bvslt i!1445 (size!45735 a!4032))))))

(assert (=> start!116894 e!780268))

(assert (=> start!116894 true))

(declare-fun array_inv!34213 (array!93563) Bool)

(assert (=> start!116894 (array_inv!34213 a!4032)))

(declare-fun b!1377463 () Bool)

(declare-fun res!920186 () Bool)

(assert (=> b!1377463 (=> (not res!920186) (not e!780268))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1377463 (= res!920186 (validKeyInArray!0 (select (arr!45185 a!4032) i!1445)))))

(declare-fun b!1377464 () Bool)

(declare-fun res!920188 () Bool)

(assert (=> b!1377464 (=> (not res!920188) (not e!780268))))

(assert (=> b!1377464 (= res!920188 (not (validKeyInArray!0 k!2947)))))

(declare-fun b!1377465 () Bool)

(declare-fun res!920185 () Bool)

(assert (=> b!1377465 (=> (not res!920185) (not e!780268))))

(assert (=> b!1377465 (= res!920185 (and (bvslt (size!45735 a!4032) #b01111111111111111111111111111111) (bvsge to!206 #b00000000000000000000000000000000) (bvsle to!206 (size!45735 a!4032)) (bvsgt to!206 i!1445)))))

(assert (= (and start!116894 res!920187) b!1377463))

(assert (= (and b!1377463 res!920186) b!1377464))

(assert (= (and b!1377464 res!920188) b!1377465))

(assert (= (and b!1377465 res!920185) b!1377466))

(declare-fun m!1261781 () Bool)

(assert (=> b!1377466 m!1261781))

(declare-fun m!1261783 () Bool)

(assert (=> b!1377466 m!1261783))

(declare-fun m!1261785 () Bool)

(assert (=> b!1377466 m!1261785))

(declare-fun m!1261787 () Bool)

(assert (=> start!116894 m!1261787))

(declare-fun m!1261789 () Bool)

(assert (=> b!1377463 m!1261789))

(assert (=> b!1377463 m!1261789))

(declare-fun m!1261791 () Bool)

(assert (=> b!1377463 m!1261791))

(declare-fun m!1261793 () Bool)

(assert (=> b!1377464 m!1261793))

(push 1)

(assert (not b!1377464))

(assert (not b!1377463))

(assert (not b!1377466))

(assert (not start!116894))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

