; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116700 () Bool)

(assert start!116700)

(declare-fun res!918466 () Bool)

(declare-fun e!779154 () Bool)

(assert (=> start!116700 (=> (not res!918466) (not e!779154))))

(declare-fun i!1445 () (_ BitVec 32))

(declare-datatypes ((array!93369 0))(
  ( (array!93370 (arr!45088 (Array (_ BitVec 32) (_ BitVec 64))) (size!45638 (_ BitVec 32))) )
))
(declare-fun a!4032 () array!93369)

(assert (=> start!116700 (= res!918466 (and (bvsge i!1445 #b00000000000000000000000000000000) (bvslt i!1445 (size!45638 a!4032))))))

(assert (=> start!116700 e!779154))

(assert (=> start!116700 true))

(declare-fun array_inv!34116 (array!93369) Bool)

(assert (=> start!116700 (array_inv!34116 a!4032)))

(declare-fun b!1375400 () Bool)

(declare-fun res!918465 () Bool)

(assert (=> b!1375400 (=> (not res!918465) (not e!779154))))

(declare-fun k!2947 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1375400 (= res!918465 (not (validKeyInArray!0 k!2947)))))

(declare-fun b!1375401 () Bool)

(declare-fun res!918463 () Bool)

(assert (=> b!1375401 (=> (not res!918463) (not e!779154))))

(declare-fun to!206 () (_ BitVec 32))

(assert (=> b!1375401 (= res!918463 (and (bvslt (size!45638 a!4032) #b01111111111111111111111111111111) (bvsge to!206 #b00000000000000000000000000000000) (bvsle to!206 (size!45638 a!4032)) (bvsgt to!206 i!1445)))))

(declare-fun b!1375402 () Bool)

(assert (=> b!1375402 (= e!779154 false)))

(declare-fun lt!604357 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93369 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1375402 (= lt!604357 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun lt!604356 () (_ BitVec 32))

(assert (=> b!1375402 (= lt!604356 (arrayCountValidKeys!0 (array!93370 (store (arr!45088 a!4032) i!1445 k!2947) (size!45638 a!4032)) (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun b!1375399 () Bool)

(declare-fun res!918464 () Bool)

(assert (=> b!1375399 (=> (not res!918464) (not e!779154))))

(assert (=> b!1375399 (= res!918464 (validKeyInArray!0 (select (arr!45088 a!4032) i!1445)))))

(assert (= (and start!116700 res!918466) b!1375399))

(assert (= (and b!1375399 res!918464) b!1375400))

(assert (= (and b!1375400 res!918465) b!1375401))

(assert (= (and b!1375401 res!918463) b!1375402))

(declare-fun m!1259231 () Bool)

(assert (=> start!116700 m!1259231))

(declare-fun m!1259233 () Bool)

(assert (=> b!1375400 m!1259233))

(declare-fun m!1259235 () Bool)

(assert (=> b!1375402 m!1259235))

(declare-fun m!1259237 () Bool)

(assert (=> b!1375402 m!1259237))

(declare-fun m!1259239 () Bool)

(assert (=> b!1375402 m!1259239))

(declare-fun m!1259241 () Bool)

(assert (=> b!1375399 m!1259241))

(assert (=> b!1375399 m!1259241))

(declare-fun m!1259243 () Bool)

(assert (=> b!1375399 m!1259243))

(push 1)

