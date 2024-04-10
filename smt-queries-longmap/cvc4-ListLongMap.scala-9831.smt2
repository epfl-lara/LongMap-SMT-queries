; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116676 () Bool)

(assert start!116676)

(declare-fun res!918313 () Bool)

(declare-fun e!779074 () Bool)

(assert (=> start!116676 (=> (not res!918313) (not e!779074))))

(declare-fun i!1445 () (_ BitVec 32))

(declare-datatypes ((array!93345 0))(
  ( (array!93346 (arr!45076 (Array (_ BitVec 32) (_ BitVec 64))) (size!45626 (_ BitVec 32))) )
))
(declare-fun a!4032 () array!93345)

(assert (=> start!116676 (= res!918313 (and (bvsge i!1445 #b00000000000000000000000000000000) (bvslt i!1445 (size!45626 a!4032))))))

(assert (=> start!116676 e!779074))

(assert (=> start!116676 true))

(declare-fun array_inv!34104 (array!93345) Bool)

(assert (=> start!116676 (array_inv!34104 a!4032)))

(declare-fun b!1375247 () Bool)

(declare-fun res!918311 () Bool)

(assert (=> b!1375247 (=> (not res!918311) (not e!779074))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1375247 (= res!918311 (validKeyInArray!0 (select (arr!45076 a!4032) i!1445)))))

(declare-fun b!1375248 () Bool)

(declare-fun res!918312 () Bool)

(assert (=> b!1375248 (=> (not res!918312) (not e!779074))))

(declare-fun k!2947 () (_ BitVec 64))

(assert (=> b!1375248 (= res!918312 (not (validKeyInArray!0 k!2947)))))

(declare-fun to!206 () (_ BitVec 32))

(declare-fun b!1375249 () Bool)

(assert (=> b!1375249 (= e!779074 (and (bvslt (size!45626 a!4032) #b01111111111111111111111111111111) (bvsge to!206 #b00000000000000000000000000000000) (bvsle to!206 (size!45626 a!4032)) (bvsgt to!206 i!1445) (bvslt (bvadd #b00000000000000000000000000000001 i!1445) #b00000000000000000000000000000000)))))

(assert (= (and start!116676 res!918313) b!1375247))

(assert (= (and b!1375247 res!918311) b!1375248))

(assert (= (and b!1375248 res!918312) b!1375249))

(declare-fun m!1259063 () Bool)

(assert (=> start!116676 m!1259063))

(declare-fun m!1259065 () Bool)

(assert (=> b!1375247 m!1259065))

(assert (=> b!1375247 m!1259065))

(declare-fun m!1259067 () Bool)

(assert (=> b!1375247 m!1259067))

(declare-fun m!1259069 () Bool)

(assert (=> b!1375248 m!1259069))

(push 1)

(assert (not b!1375247))

(assert (not start!116676))

(assert (not b!1375248))

(check-sat)

(pop 1)

(push 1)

(check-sat)

