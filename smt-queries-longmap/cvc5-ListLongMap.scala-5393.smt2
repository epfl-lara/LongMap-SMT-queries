; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72126 () Bool)

(assert start!72126)

(declare-fun res!569231 () Bool)

(declare-fun e!467038 () Bool)

(assert (=> start!72126 (=> (not res!569231) (not e!467038))))

(declare-fun i!1466 () (_ BitVec 32))

(declare-datatypes ((array!46873 0))(
  ( (array!46874 (arr!22466 (Array (_ BitVec 32) (_ BitVec 64))) (size!22886 (_ BitVec 32))) )
))
(declare-fun a!4227 () array!46873)

(assert (=> start!72126 (= res!569231 (and (bvsge i!1466 #b00000000000000000000000000000000) (bvslt i!1466 (size!22886 a!4227))))))

(assert (=> start!72126 e!467038))

(assert (=> start!72126 true))

(declare-fun array_inv!17952 (array!46873) Bool)

(assert (=> start!72126 (array_inv!17952 a!4227)))

(declare-fun b!837056 () Bool)

(declare-fun res!569232 () Bool)

(assert (=> b!837056 (=> (not res!569232) (not e!467038))))

(declare-fun to!390 () (_ BitVec 32))

(assert (=> b!837056 (= res!569232 (and (bvslt (size!22886 a!4227) #b01111111111111111111111111111111) (bvsge to!390 #b00000000000000000000000000000000) (bvsle to!390 (size!22886 a!4227)) (bvsgt to!390 i!1466)))))

(declare-fun b!837054 () Bool)

(declare-fun res!569229 () Bool)

(assert (=> b!837054 (=> (not res!569229) (not e!467038))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!837054 (= res!569229 (not (validKeyInArray!0 (select (arr!22466 a!4227) i!1466))))))

(declare-fun b!837057 () Bool)

(assert (=> b!837057 (= e!467038 false)))

(declare-fun lt!380737 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!46873 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!837057 (= lt!380737 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun lt!380738 () (_ BitVec 32))

(declare-fun k!2968 () (_ BitVec 64))

(assert (=> b!837057 (= lt!380738 (arrayCountValidKeys!0 (array!46874 (store (arr!22466 a!4227) i!1466 k!2968) (size!22886 a!4227)) (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun b!837055 () Bool)

(declare-fun res!569230 () Bool)

(assert (=> b!837055 (=> (not res!569230) (not e!467038))))

(assert (=> b!837055 (= res!569230 (validKeyInArray!0 k!2968))))

(assert (= (and start!72126 res!569231) b!837054))

(assert (= (and b!837054 res!569229) b!837055))

(assert (= (and b!837055 res!569230) b!837056))

(assert (= (and b!837056 res!569232) b!837057))

(declare-fun m!782843 () Bool)

(assert (=> start!72126 m!782843))

(declare-fun m!782845 () Bool)

(assert (=> b!837054 m!782845))

(assert (=> b!837054 m!782845))

(declare-fun m!782847 () Bool)

(assert (=> b!837054 m!782847))

(declare-fun m!782849 () Bool)

(assert (=> b!837057 m!782849))

(declare-fun m!782851 () Bool)

(assert (=> b!837057 m!782851))

(declare-fun m!782853 () Bool)

(assert (=> b!837057 m!782853))

(declare-fun m!782855 () Bool)

(assert (=> b!837055 m!782855))

(push 1)

(assert (not b!837057))

(assert (not b!837054))

(assert (not start!72126))

(assert (not b!837055))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

