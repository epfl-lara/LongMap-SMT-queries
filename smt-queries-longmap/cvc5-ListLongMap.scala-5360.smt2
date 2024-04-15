; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71742 () Bool)

(assert start!71742)

(declare-fun b!833874 () Bool)

(declare-fun e!465221 () Bool)

(assert (=> b!833874 (= e!465221 false)))

(declare-datatypes ((array!46641 0))(
  ( (array!46642 (arr!22355 (Array (_ BitVec 32) (_ BitVec 64))) (size!22776 (_ BitVec 32))) )
))
(declare-fun a!4227 () array!46641)

(declare-fun lt!378538 () (_ BitVec 32))

(declare-fun i!1466 () (_ BitVec 32))

(declare-fun to!390 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!46641 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!833874 (= lt!378538 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun lt!378539 () (_ BitVec 32))

(declare-fun k!2968 () (_ BitVec 64))

(assert (=> b!833874 (= lt!378539 (arrayCountValidKeys!0 (array!46642 (store (arr!22355 a!4227) i!1466 k!2968) (size!22776 a!4227)) (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun b!833872 () Bool)

(declare-fun res!567040 () Bool)

(assert (=> b!833872 (=> (not res!567040) (not e!465221))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!833872 (= res!567040 (validKeyInArray!0 k!2968))))

(declare-fun b!833873 () Bool)

(declare-fun res!567041 () Bool)

(assert (=> b!833873 (=> (not res!567041) (not e!465221))))

(assert (=> b!833873 (= res!567041 (and (bvslt (size!22776 a!4227) #b01111111111111111111111111111111) (bvsge to!390 #b00000000000000000000000000000000) (bvsle to!390 (size!22776 a!4227)) (bvsgt to!390 i!1466)))))

(declare-fun b!833871 () Bool)

(declare-fun res!567043 () Bool)

(assert (=> b!833871 (=> (not res!567043) (not e!465221))))

(assert (=> b!833871 (= res!567043 (not (validKeyInArray!0 (select (arr!22355 a!4227) i!1466))))))

(declare-fun res!567042 () Bool)

(assert (=> start!71742 (=> (not res!567042) (not e!465221))))

(assert (=> start!71742 (= res!567042 (and (bvsge i!1466 #b00000000000000000000000000000000) (bvslt i!1466 (size!22776 a!4227))))))

(assert (=> start!71742 e!465221))

(assert (=> start!71742 true))

(declare-fun array_inv!17867 (array!46641) Bool)

(assert (=> start!71742 (array_inv!17867 a!4227)))

(assert (= (and start!71742 res!567042) b!833871))

(assert (= (and b!833871 res!567043) b!833872))

(assert (= (and b!833872 res!567040) b!833873))

(assert (= (and b!833873 res!567041) b!833874))

(declare-fun m!778291 () Bool)

(assert (=> b!833874 m!778291))

(declare-fun m!778293 () Bool)

(assert (=> b!833874 m!778293))

(declare-fun m!778295 () Bool)

(assert (=> b!833874 m!778295))

(declare-fun m!778297 () Bool)

(assert (=> b!833872 m!778297))

(declare-fun m!778299 () Bool)

(assert (=> b!833871 m!778299))

(assert (=> b!833871 m!778299))

(declare-fun m!778301 () Bool)

(assert (=> b!833871 m!778301))

(declare-fun m!778303 () Bool)

(assert (=> start!71742 m!778303))

(push 1)

(assert (not b!833874))

(assert (not b!833872))

(assert (not b!833871))

(assert (not start!71742))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

