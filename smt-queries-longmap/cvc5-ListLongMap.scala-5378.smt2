; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71866 () Bool)

(assert start!71866)

(declare-fun b!835162 () Bool)

(declare-fun res!568033 () Bool)

(declare-fun e!465942 () Bool)

(assert (=> b!835162 (=> (not res!568033) (not e!465942))))

(declare-datatypes ((array!46776 0))(
  ( (array!46777 (arr!22422 (Array (_ BitVec 32) (_ BitVec 64))) (size!22843 (_ BitVec 32))) )
))
(declare-fun a!4227 () array!46776)

(declare-fun i!1466 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!835162 (= res!568033 (not (validKeyInArray!0 (select (arr!22422 a!4227) i!1466))))))

(declare-fun res!568036 () Bool)

(assert (=> start!71866 (=> (not res!568036) (not e!465942))))

(assert (=> start!71866 (= res!568036 (and (bvsge i!1466 #b00000000000000000000000000000000) (bvslt i!1466 (size!22843 a!4227))))))

(assert (=> start!71866 e!465942))

(assert (=> start!71866 true))

(declare-fun array_inv!17869 (array!46776) Bool)

(assert (=> start!71866 (array_inv!17869 a!4227)))

(declare-fun b!835163 () Bool)

(declare-fun to!390 () (_ BitVec 32))

(assert (=> b!835163 (= e!465942 (and (not (= to!390 (size!22843 a!4227))) (bvsge to!390 (size!22843 a!4227))))))

(declare-fun b!835164 () Bool)

(declare-fun res!568034 () Bool)

(assert (=> b!835164 (=> (not res!568034) (not e!465942))))

(declare-fun k!2968 () (_ BitVec 64))

(declare-fun arrayCountValidKeys!0 (array!46776 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!835164 (= res!568034 (= (arrayCountValidKeys!0 (array!46777 (store (arr!22422 a!4227) i!1466 k!2968) (size!22843 a!4227)) (bvadd #b00000000000000000000000000000001 i!1466) to!390) (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390)))))

(declare-fun b!835165 () Bool)

(declare-fun res!568035 () Bool)

(assert (=> b!835165 (=> (not res!568035) (not e!465942))))

(assert (=> b!835165 (= res!568035 (validKeyInArray!0 k!2968))))

(declare-fun b!835166 () Bool)

(declare-fun res!568037 () Bool)

(assert (=> b!835166 (=> (not res!568037) (not e!465942))))

(assert (=> b!835166 (= res!568037 (and (bvslt (size!22843 a!4227) #b01111111111111111111111111111111) (bvsge to!390 #b00000000000000000000000000000000) (bvsle to!390 (size!22843 a!4227)) (bvsgt to!390 i!1466)))))

(assert (= (and start!71866 res!568036) b!835162))

(assert (= (and b!835162 res!568033) b!835165))

(assert (= (and b!835165 res!568035) b!835166))

(assert (= (and b!835166 res!568037) b!835164))

(assert (= (and b!835164 res!568034) b!835163))

(declare-fun m!780327 () Bool)

(assert (=> b!835162 m!780327))

(assert (=> b!835162 m!780327))

(declare-fun m!780329 () Bool)

(assert (=> b!835162 m!780329))

(declare-fun m!780331 () Bool)

(assert (=> start!71866 m!780331))

(declare-fun m!780333 () Bool)

(assert (=> b!835164 m!780333))

(declare-fun m!780335 () Bool)

(assert (=> b!835164 m!780335))

(declare-fun m!780337 () Bool)

(assert (=> b!835164 m!780337))

(declare-fun m!780339 () Bool)

(assert (=> b!835165 m!780339))

(push 1)

(assert (not b!835162))

(assert (not start!71866))

(assert (not b!835165))

(assert (not b!835164))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

