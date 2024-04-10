; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71890 () Bool)

(assert start!71890)

(declare-datatypes ((array!46800 0))(
  ( (array!46801 (arr!22434 (Array (_ BitVec 32) (_ BitVec 64))) (size!22855 (_ BitVec 32))) )
))
(declare-fun a!4227 () array!46800)

(declare-fun e!466041 () Bool)

(declare-fun to!390 () (_ BitVec 32))

(declare-fun i!1466 () (_ BitVec 32))

(declare-fun b!835391 () Bool)

(assert (=> b!835391 (= e!466041 (or (bvslt (bvadd #b00000000000000000000000000000001 i!1466) #b00000000000000000000000000000000) (bvsge to!390 (size!22855 a!4227))))))

(declare-fun b!835392 () Bool)

(declare-fun res!568265 () Bool)

(assert (=> b!835392 (=> (not res!568265) (not e!466041))))

(declare-fun k!2968 () (_ BitVec 64))

(declare-fun arrayCountValidKeys!0 (array!46800 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!835392 (= res!568265 (= (arrayCountValidKeys!0 (array!46801 (store (arr!22434 a!4227) i!1466 k!2968) (size!22855 a!4227)) (bvadd #b00000000000000000000000000000001 i!1466) to!390) (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390)))))

(declare-fun b!835393 () Bool)

(declare-fun res!568262 () Bool)

(assert (=> b!835393 (=> (not res!568262) (not e!466041))))

(assert (=> b!835393 (= res!568262 (and (bvslt (size!22855 a!4227) #b01111111111111111111111111111111) (bvsge to!390 #b00000000000000000000000000000000) (bvsle to!390 (size!22855 a!4227)) (bvsgt to!390 i!1466)))))

(declare-fun res!568268 () Bool)

(assert (=> start!71890 (=> (not res!568268) (not e!466041))))

(assert (=> start!71890 (= res!568268 (and (bvsge i!1466 #b00000000000000000000000000000000) (bvslt i!1466 (size!22855 a!4227))))))

(assert (=> start!71890 e!466041))

(assert (=> start!71890 true))

(declare-fun array_inv!17881 (array!46800) Bool)

(assert (=> start!71890 (array_inv!17881 a!4227)))

(declare-fun b!835394 () Bool)

(declare-fun res!568263 () Bool)

(assert (=> b!835394 (=> (not res!568263) (not e!466041))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!835394 (= res!568263 (not (validKeyInArray!0 (select (arr!22434 a!4227) to!390))))))

(declare-fun b!835395 () Bool)

(declare-fun res!568266 () Bool)

(assert (=> b!835395 (=> (not res!568266) (not e!466041))))

(assert (=> b!835395 (= res!568266 (not (validKeyInArray!0 (select (arr!22434 a!4227) i!1466))))))

(declare-fun b!835396 () Bool)

(declare-fun res!568264 () Bool)

(assert (=> b!835396 (=> (not res!568264) (not e!466041))))

(assert (=> b!835396 (= res!568264 (not (= to!390 (size!22855 a!4227))))))

(declare-fun b!835397 () Bool)

(declare-fun res!568267 () Bool)

(assert (=> b!835397 (=> (not res!568267) (not e!466041))))

(assert (=> b!835397 (= res!568267 (validKeyInArray!0 k!2968))))

(assert (= (and start!71890 res!568268) b!835395))

(assert (= (and b!835395 res!568266) b!835397))

(assert (= (and b!835397 res!568267) b!835393))

(assert (= (and b!835393 res!568262) b!835392))

(assert (= (and b!835392 res!568265) b!835396))

(assert (= (and b!835396 res!568264) b!835394))

(assert (= (and b!835394 res!568263) b!835391))

(declare-fun m!780567 () Bool)

(assert (=> start!71890 m!780567))

(declare-fun m!780569 () Bool)

(assert (=> b!835394 m!780569))

(assert (=> b!835394 m!780569))

(declare-fun m!780571 () Bool)

(assert (=> b!835394 m!780571))

(declare-fun m!780573 () Bool)

(assert (=> b!835392 m!780573))

(declare-fun m!780575 () Bool)

(assert (=> b!835392 m!780575))

(declare-fun m!780577 () Bool)

(assert (=> b!835392 m!780577))

(declare-fun m!780579 () Bool)

(assert (=> b!835397 m!780579))

(declare-fun m!780581 () Bool)

(assert (=> b!835395 m!780581))

(assert (=> b!835395 m!780581))

(declare-fun m!780583 () Bool)

(assert (=> b!835395 m!780583))

(push 1)

(assert (not b!835395))

(assert (not b!835397))

(assert (not b!835392))

(assert (not start!71890))

(assert (not b!835394))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

