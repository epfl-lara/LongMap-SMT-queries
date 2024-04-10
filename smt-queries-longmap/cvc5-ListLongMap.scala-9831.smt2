; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116672 () Bool)

(assert start!116672)

(declare-fun res!918294 () Bool)

(declare-fun e!779061 () Bool)

(assert (=> start!116672 (=> (not res!918294) (not e!779061))))

(declare-fun i!1445 () (_ BitVec 32))

(declare-datatypes ((array!93341 0))(
  ( (array!93342 (arr!45074 (Array (_ BitVec 32) (_ BitVec 64))) (size!45624 (_ BitVec 32))) )
))
(declare-fun a!4032 () array!93341)

(assert (=> start!116672 (= res!918294 (and (bvsge i!1445 #b00000000000000000000000000000000) (bvslt i!1445 (size!45624 a!4032))))))

(assert (=> start!116672 e!779061))

(assert (=> start!116672 true))

(declare-fun array_inv!34102 (array!93341) Bool)

(assert (=> start!116672 (array_inv!34102 a!4032)))

(declare-fun b!1375229 () Bool)

(declare-fun res!918295 () Bool)

(assert (=> b!1375229 (=> (not res!918295) (not e!779061))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1375229 (= res!918295 (validKeyInArray!0 (select (arr!45074 a!4032) i!1445)))))

(declare-fun b!1375230 () Bool)

(declare-fun res!918293 () Bool)

(assert (=> b!1375230 (=> (not res!918293) (not e!779061))))

(declare-fun k!2947 () (_ BitVec 64))

(assert (=> b!1375230 (= res!918293 (not (validKeyInArray!0 k!2947)))))

(declare-fun b!1375231 () Bool)

(declare-fun to!206 () (_ BitVec 32))

(assert (=> b!1375231 (= e!779061 (and (bvslt (size!45624 a!4032) #b01111111111111111111111111111111) (bvsge to!206 #b00000000000000000000000000000000) (bvsle to!206 (size!45624 a!4032)) (bvsgt to!206 i!1445) (bvslt (bvadd #b00000000000000000000000000000001 i!1445) #b00000000000000000000000000000000)))))

(assert (= (and start!116672 res!918294) b!1375229))

(assert (= (and b!1375229 res!918295) b!1375230))

(assert (= (and b!1375230 res!918293) b!1375231))

(declare-fun m!1259047 () Bool)

(assert (=> start!116672 m!1259047))

(declare-fun m!1259049 () Bool)

(assert (=> b!1375229 m!1259049))

(assert (=> b!1375229 m!1259049))

(declare-fun m!1259051 () Bool)

(assert (=> b!1375229 m!1259051))

(declare-fun m!1259053 () Bool)

(assert (=> b!1375230 m!1259053))

(push 1)

(assert (not start!116672))

(assert (not b!1375229))

(assert (not b!1375230))

(check-sat)

(pop 1)

(push 1)

(check-sat)

