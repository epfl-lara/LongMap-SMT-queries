; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116804 () Bool)

(assert start!116804)

(declare-fun b!1376460 () Bool)

(declare-fun res!919382 () Bool)

(declare-fun e!779730 () Bool)

(assert (=> b!1376460 (=> (not res!919382) (not e!779730))))

(declare-fun to!206 () (_ BitVec 32))

(declare-fun k!2947 () (_ BitVec 64))

(declare-fun i!1445 () (_ BitVec 32))

(declare-datatypes ((array!93427 0))(
  ( (array!93428 (arr!45117 (Array (_ BitVec 32) (_ BitVec 64))) (size!45669 (_ BitVec 32))) )
))
(declare-fun a!4032 () array!93427)

(declare-fun arrayCountValidKeys!0 (array!93427 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1376460 (= res!919382 (= (arrayCountValidKeys!0 (array!93428 (store (arr!45117 a!4032) i!1445 k!2947) (size!45669 a!4032)) (bvadd #b00000000000000000000000000000001 i!1445) to!206) (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206)))))

(declare-fun res!919383 () Bool)

(assert (=> start!116804 (=> (not res!919383) (not e!779730))))

(assert (=> start!116804 (= res!919383 (and (bvsge i!1445 #b00000000000000000000000000000000) (bvslt i!1445 (size!45669 a!4032))))))

(assert (=> start!116804 e!779730))

(assert (=> start!116804 true))

(declare-fun array_inv!34350 (array!93427) Bool)

(assert (=> start!116804 (array_inv!34350 a!4032)))

(declare-fun b!1376461 () Bool)

(assert (=> b!1376461 (= e!779730 (or (bvslt (bvadd #b00000000000000000000000000000001 i!1445) #b00000000000000000000000000000000) (bvsge to!206 (size!45669 a!4032))))))

(declare-fun b!1376462 () Bool)

(declare-fun res!919385 () Bool)

(assert (=> b!1376462 (=> (not res!919385) (not e!779730))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1376462 (= res!919385 (not (validKeyInArray!0 k!2947)))))

(declare-fun b!1376463 () Bool)

(declare-fun res!919380 () Bool)

(assert (=> b!1376463 (=> (not res!919380) (not e!779730))))

(assert (=> b!1376463 (= res!919380 (validKeyInArray!0 (select (arr!45117 a!4032) i!1445)))))

(declare-fun b!1376464 () Bool)

(declare-fun res!919379 () Bool)

(assert (=> b!1376464 (=> (not res!919379) (not e!779730))))

(assert (=> b!1376464 (= res!919379 (validKeyInArray!0 (select (arr!45117 a!4032) to!206)))))

(declare-fun b!1376465 () Bool)

(declare-fun res!919384 () Bool)

(assert (=> b!1376465 (=> (not res!919384) (not e!779730))))

(assert (=> b!1376465 (= res!919384 (and (bvslt (size!45669 a!4032) #b01111111111111111111111111111111) (bvsge to!206 #b00000000000000000000000000000000) (bvsle to!206 (size!45669 a!4032)) (bvsgt to!206 i!1445)))))

(declare-fun b!1376466 () Bool)

(declare-fun res!919381 () Bool)

(assert (=> b!1376466 (=> (not res!919381) (not e!779730))))

(assert (=> b!1376466 (= res!919381 (not (= to!206 (size!45669 a!4032))))))

(assert (= (and start!116804 res!919383) b!1376463))

(assert (= (and b!1376463 res!919380) b!1376462))

(assert (= (and b!1376462 res!919385) b!1376465))

(assert (= (and b!1376465 res!919384) b!1376460))

(assert (= (and b!1376460 res!919382) b!1376466))

(assert (= (and b!1376466 res!919381) b!1376464))

(assert (= (and b!1376464 res!919379) b!1376461))

(declare-fun m!1260077 () Bool)

(assert (=> b!1376460 m!1260077))

(declare-fun m!1260079 () Bool)

(assert (=> b!1376460 m!1260079))

(declare-fun m!1260081 () Bool)

(assert (=> b!1376460 m!1260081))

(declare-fun m!1260083 () Bool)

(assert (=> start!116804 m!1260083))

(declare-fun m!1260085 () Bool)

(assert (=> b!1376462 m!1260085))

(declare-fun m!1260087 () Bool)

(assert (=> b!1376463 m!1260087))

(assert (=> b!1376463 m!1260087))

(declare-fun m!1260089 () Bool)

(assert (=> b!1376463 m!1260089))

(declare-fun m!1260091 () Bool)

(assert (=> b!1376464 m!1260091))

(assert (=> b!1376464 m!1260091))

(declare-fun m!1260093 () Bool)

(assert (=> b!1376464 m!1260093))

(push 1)

(assert (not b!1376460))

(assert (not b!1376464))

(assert (not b!1376463))

(assert (not b!1376462))

(assert (not start!116804))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

