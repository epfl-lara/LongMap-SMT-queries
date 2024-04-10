; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116682 () Bool)

(assert start!116682)

(declare-fun res!918340 () Bool)

(declare-fun e!779092 () Bool)

(assert (=> start!116682 (=> (not res!918340) (not e!779092))))

(declare-fun i!1445 () (_ BitVec 32))

(declare-datatypes ((array!93351 0))(
  ( (array!93352 (arr!45079 (Array (_ BitVec 32) (_ BitVec 64))) (size!45629 (_ BitVec 32))) )
))
(declare-fun a!4032 () array!93351)

(assert (=> start!116682 (= res!918340 (and (bvsge i!1445 #b00000000000000000000000000000000) (bvslt i!1445 (size!45629 a!4032))))))

(assert (=> start!116682 e!779092))

(assert (=> start!116682 true))

(declare-fun array_inv!34107 (array!93351) Bool)

(assert (=> start!116682 (array_inv!34107 a!4032)))

(declare-fun b!1375274 () Bool)

(declare-fun res!918338 () Bool)

(assert (=> b!1375274 (=> (not res!918338) (not e!779092))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1375274 (= res!918338 (validKeyInArray!0 (select (arr!45079 a!4032) i!1445)))))

(declare-fun b!1375275 () Bool)

(declare-fun res!918339 () Bool)

(assert (=> b!1375275 (=> (not res!918339) (not e!779092))))

(declare-fun k!2947 () (_ BitVec 64))

(assert (=> b!1375275 (= res!918339 (not (validKeyInArray!0 k!2947)))))

(declare-fun to!206 () (_ BitVec 32))

(declare-fun b!1375276 () Bool)

(assert (=> b!1375276 (= e!779092 (and (bvslt (size!45629 a!4032) #b01111111111111111111111111111111) (bvsge to!206 #b00000000000000000000000000000000) (bvsle to!206 (size!45629 a!4032)) (bvsgt to!206 i!1445) (bvslt (bvadd #b00000000000000000000000000000001 i!1445) #b00000000000000000000000000000000)))))

(assert (= (and start!116682 res!918340) b!1375274))

(assert (= (and b!1375274 res!918338) b!1375275))

(assert (= (and b!1375275 res!918339) b!1375276))

(declare-fun m!1259087 () Bool)

(assert (=> start!116682 m!1259087))

(declare-fun m!1259089 () Bool)

(assert (=> b!1375274 m!1259089))

(assert (=> b!1375274 m!1259089))

(declare-fun m!1259091 () Bool)

(assert (=> b!1375274 m!1259091))

(declare-fun m!1259093 () Bool)

(assert (=> b!1375275 m!1259093))

(push 1)

(assert (not b!1375274))

(assert (not b!1375275))

(assert (not start!116682))

(check-sat)

(pop 1)

(push 1)

(check-sat)

