; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116894 () Bool)

(assert start!116894)

(declare-fun b!1377429 () Bool)

(declare-fun e!780253 () Bool)

(assert (=> b!1377429 (= e!780253 false)))

(declare-fun to!206 () (_ BitVec 32))

(declare-fun lt!605893 () (_ BitVec 32))

(declare-fun i!1445 () (_ BitVec 32))

(declare-datatypes ((array!93517 0))(
  ( (array!93518 (arr!45162 (Array (_ BitVec 32) (_ BitVec 64))) (size!45714 (_ BitVec 32))) )
))
(declare-fun a!4032 () array!93517)

(declare-fun arrayCountValidKeys!0 (array!93517 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1377429 (= lt!605893 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun k!2947 () (_ BitVec 64))

(declare-fun lt!605894 () (_ BitVec 32))

(assert (=> b!1377429 (= lt!605894 (arrayCountValidKeys!0 (array!93518 (store (arr!45162 a!4032) i!1445 k!2947) (size!45714 a!4032)) (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun b!1377426 () Bool)

(declare-fun res!920184 () Bool)

(assert (=> b!1377426 (=> (not res!920184) (not e!780253))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1377426 (= res!920184 (validKeyInArray!0 (select (arr!45162 a!4032) i!1445)))))

(declare-fun b!1377428 () Bool)

(declare-fun res!920185 () Bool)

(assert (=> b!1377428 (=> (not res!920185) (not e!780253))))

(assert (=> b!1377428 (= res!920185 (and (bvslt (size!45714 a!4032) #b01111111111111111111111111111111) (bvsge to!206 #b00000000000000000000000000000000) (bvsle to!206 (size!45714 a!4032)) (bvsgt to!206 i!1445)))))

(declare-fun res!920186 () Bool)

(assert (=> start!116894 (=> (not res!920186) (not e!780253))))

(assert (=> start!116894 (= res!920186 (and (bvsge i!1445 #b00000000000000000000000000000000) (bvslt i!1445 (size!45714 a!4032))))))

(assert (=> start!116894 e!780253))

(assert (=> start!116894 true))

(declare-fun array_inv!34395 (array!93517) Bool)

(assert (=> start!116894 (array_inv!34395 a!4032)))

(declare-fun b!1377427 () Bool)

(declare-fun res!920183 () Bool)

(assert (=> b!1377427 (=> (not res!920183) (not e!780253))))

(assert (=> b!1377427 (= res!920183 (not (validKeyInArray!0 k!2947)))))

(assert (= (and start!116894 res!920186) b!1377426))

(assert (= (and b!1377426 res!920184) b!1377427))

(assert (= (and b!1377427 res!920183) b!1377428))

(assert (= (and b!1377428 res!920185) b!1377429))

(declare-fun m!1261311 () Bool)

(assert (=> b!1377429 m!1261311))

(declare-fun m!1261313 () Bool)

(assert (=> b!1377429 m!1261313))

(declare-fun m!1261315 () Bool)

(assert (=> b!1377429 m!1261315))

(declare-fun m!1261317 () Bool)

(assert (=> b!1377426 m!1261317))

(assert (=> b!1377426 m!1261317))

(declare-fun m!1261319 () Bool)

(assert (=> b!1377426 m!1261319))

(declare-fun m!1261321 () Bool)

(assert (=> start!116894 m!1261321))

(declare-fun m!1261323 () Bool)

(assert (=> b!1377427 m!1261323))

(push 1)

(assert (not b!1377427))

(assert (not b!1377429))

(assert (not start!116894))

(assert (not b!1377426))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

