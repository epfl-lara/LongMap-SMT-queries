; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116898 () Bool)

(assert start!116898)

(declare-fun b!1377489 () Bool)

(declare-fun res!920209 () Bool)

(declare-fun e!780280 () Bool)

(assert (=> b!1377489 (=> (not res!920209) (not e!780280))))

(declare-fun to!206 () (_ BitVec 32))

(declare-fun i!1445 () (_ BitVec 32))

(declare-datatypes ((array!93567 0))(
  ( (array!93568 (arr!45187 (Array (_ BitVec 32) (_ BitVec 64))) (size!45737 (_ BitVec 32))) )
))
(declare-fun a!4032 () array!93567)

(assert (=> b!1377489 (= res!920209 (and (bvslt (size!45737 a!4032) #b01111111111111111111111111111111) (bvsge to!206 #b00000000000000000000000000000000) (bvsle to!206 (size!45737 a!4032)) (bvsgt to!206 i!1445)))))

(declare-fun b!1377488 () Bool)

(declare-fun res!920211 () Bool)

(assert (=> b!1377488 (=> (not res!920211) (not e!780280))))

(declare-fun k!2947 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1377488 (= res!920211 (not (validKeyInArray!0 k!2947)))))

(declare-fun b!1377490 () Bool)

(assert (=> b!1377490 (= e!780280 false)))

(declare-fun lt!606075 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93567 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1377490 (= lt!606075 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun lt!606076 () (_ BitVec 32))

(assert (=> b!1377490 (= lt!606076 (arrayCountValidKeys!0 (array!93568 (store (arr!45187 a!4032) i!1445 k!2947) (size!45737 a!4032)) (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun b!1377487 () Bool)

(declare-fun res!920212 () Bool)

(assert (=> b!1377487 (=> (not res!920212) (not e!780280))))

(assert (=> b!1377487 (= res!920212 (validKeyInArray!0 (select (arr!45187 a!4032) i!1445)))))

(declare-fun res!920210 () Bool)

(assert (=> start!116898 (=> (not res!920210) (not e!780280))))

(assert (=> start!116898 (= res!920210 (and (bvsge i!1445 #b00000000000000000000000000000000) (bvslt i!1445 (size!45737 a!4032))))))

(assert (=> start!116898 e!780280))

(assert (=> start!116898 true))

(declare-fun array_inv!34215 (array!93567) Bool)

(assert (=> start!116898 (array_inv!34215 a!4032)))

(assert (= (and start!116898 res!920210) b!1377487))

(assert (= (and b!1377487 res!920212) b!1377488))

(assert (= (and b!1377488 res!920211) b!1377489))

(assert (= (and b!1377489 res!920209) b!1377490))

(declare-fun m!1261809 () Bool)

(assert (=> b!1377488 m!1261809))

(declare-fun m!1261811 () Bool)

(assert (=> b!1377490 m!1261811))

(declare-fun m!1261813 () Bool)

(assert (=> b!1377490 m!1261813))

(declare-fun m!1261815 () Bool)

(assert (=> b!1377490 m!1261815))

(declare-fun m!1261817 () Bool)

(assert (=> b!1377487 m!1261817))

(assert (=> b!1377487 m!1261817))

(declare-fun m!1261819 () Bool)

(assert (=> b!1377487 m!1261819))

(declare-fun m!1261821 () Bool)

(assert (=> start!116898 m!1261821))

(push 1)

(assert (not start!116898))

(assert (not b!1377487))

(assert (not b!1377488))

(assert (not b!1377490))

(check-sat)

