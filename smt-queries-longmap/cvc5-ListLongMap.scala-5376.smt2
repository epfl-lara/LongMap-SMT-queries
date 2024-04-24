; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72024 () Bool)

(assert start!72024)

(declare-fun res!568323 () Bool)

(declare-fun e!466498 () Bool)

(assert (=> start!72024 (=> (not res!568323) (not e!466498))))

(declare-fun i!1466 () (_ BitVec 32))

(declare-datatypes ((array!46771 0))(
  ( (array!46772 (arr!22415 (Array (_ BitVec 32) (_ BitVec 64))) (size!22835 (_ BitVec 32))) )
))
(declare-fun a!4227 () array!46771)

(assert (=> start!72024 (= res!568323 (and (bvsge i!1466 #b00000000000000000000000000000000) (bvslt i!1466 (size!22835 a!4227))))))

(assert (=> start!72024 e!466498))

(assert (=> start!72024 true))

(declare-fun array_inv!17901 (array!46771) Bool)

(assert (=> start!72024 (array_inv!17901 a!4227)))

(declare-fun b!836004 () Bool)

(assert (=> b!836004 (= e!466498 false)))

(declare-fun to!390 () (_ BitVec 32))

(declare-fun lt!380018 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!46771 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!836004 (= lt!380018 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun lt!380017 () (_ BitVec 32))

(declare-fun k!2968 () (_ BitVec 64))

(assert (=> b!836004 (= lt!380017 (arrayCountValidKeys!0 (array!46772 (store (arr!22415 a!4227) i!1466 k!2968) (size!22835 a!4227)) (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun b!836001 () Bool)

(declare-fun res!568320 () Bool)

(assert (=> b!836001 (=> (not res!568320) (not e!466498))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!836001 (= res!568320 (not (validKeyInArray!0 (select (arr!22415 a!4227) i!1466))))))

(declare-fun b!836002 () Bool)

(declare-fun res!568321 () Bool)

(assert (=> b!836002 (=> (not res!568321) (not e!466498))))

(assert (=> b!836002 (= res!568321 (validKeyInArray!0 k!2968))))

(declare-fun b!836003 () Bool)

(declare-fun res!568322 () Bool)

(assert (=> b!836003 (=> (not res!568322) (not e!466498))))

(assert (=> b!836003 (= res!568322 (and (bvslt (size!22835 a!4227) #b01111111111111111111111111111111) (bvsge to!390 #b00000000000000000000000000000000) (bvsle to!390 (size!22835 a!4227)) (bvsgt to!390 i!1466)))))

(assert (= (and start!72024 res!568323) b!836001))

(assert (= (and b!836001 res!568320) b!836002))

(assert (= (and b!836002 res!568321) b!836003))

(assert (= (and b!836003 res!568322) b!836004))

(declare-fun m!781565 () Bool)

(assert (=> start!72024 m!781565))

(declare-fun m!781567 () Bool)

(assert (=> b!836004 m!781567))

(declare-fun m!781569 () Bool)

(assert (=> b!836004 m!781569))

(declare-fun m!781571 () Bool)

(assert (=> b!836004 m!781571))

(declare-fun m!781573 () Bool)

(assert (=> b!836001 m!781573))

(assert (=> b!836001 m!781573))

(declare-fun m!781575 () Bool)

(assert (=> b!836001 m!781575))

(declare-fun m!781577 () Bool)

(assert (=> b!836002 m!781577))

(push 1)

(assert (not b!836002))

(assert (not b!836001))

(assert (not b!836004))

(assert (not start!72024))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

