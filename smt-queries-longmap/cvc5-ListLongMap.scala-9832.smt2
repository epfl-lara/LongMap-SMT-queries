; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116678 () Bool)

(assert start!116678)

(declare-fun res!918322 () Bool)

(declare-fun e!779080 () Bool)

(assert (=> start!116678 (=> (not res!918322) (not e!779080))))

(declare-fun i!1445 () (_ BitVec 32))

(declare-datatypes ((array!93347 0))(
  ( (array!93348 (arr!45077 (Array (_ BitVec 32) (_ BitVec 64))) (size!45627 (_ BitVec 32))) )
))
(declare-fun a!4032 () array!93347)

(assert (=> start!116678 (= res!918322 (and (bvsge i!1445 #b00000000000000000000000000000000) (bvslt i!1445 (size!45627 a!4032))))))

(assert (=> start!116678 e!779080))

(assert (=> start!116678 true))

(declare-fun array_inv!34105 (array!93347) Bool)

(assert (=> start!116678 (array_inv!34105 a!4032)))

(declare-fun b!1375256 () Bool)

(declare-fun res!918321 () Bool)

(assert (=> b!1375256 (=> (not res!918321) (not e!779080))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1375256 (= res!918321 (validKeyInArray!0 (select (arr!45077 a!4032) i!1445)))))

(declare-fun b!1375257 () Bool)

(declare-fun res!918320 () Bool)

(assert (=> b!1375257 (=> (not res!918320) (not e!779080))))

(declare-fun k!2947 () (_ BitVec 64))

(assert (=> b!1375257 (= res!918320 (not (validKeyInArray!0 k!2947)))))

(declare-fun to!206 () (_ BitVec 32))

(declare-fun b!1375258 () Bool)

(assert (=> b!1375258 (= e!779080 (and (bvslt (size!45627 a!4032) #b01111111111111111111111111111111) (bvsge to!206 #b00000000000000000000000000000000) (bvsle to!206 (size!45627 a!4032)) (bvsgt to!206 i!1445) (bvslt (bvadd #b00000000000000000000000000000001 i!1445) #b00000000000000000000000000000000)))))

(assert (= (and start!116678 res!918322) b!1375256))

(assert (= (and b!1375256 res!918321) b!1375257))

(assert (= (and b!1375257 res!918320) b!1375258))

(declare-fun m!1259071 () Bool)

(assert (=> start!116678 m!1259071))

(declare-fun m!1259073 () Bool)

(assert (=> b!1375256 m!1259073))

(assert (=> b!1375256 m!1259073))

(declare-fun m!1259075 () Bool)

(assert (=> b!1375256 m!1259075))

(declare-fun m!1259077 () Bool)

(assert (=> b!1375257 m!1259077))

(push 1)

(assert (not start!116678))

(assert (not b!1375256))

(assert (not b!1375257))

(check-sat)

(pop 1)

(push 1)

(check-sat)

