; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36404 () Bool)

(assert start!36404)

(declare-fun res!203389 () Bool)

(declare-fun e!222970 () Bool)

(assert (=> start!36404 (=> (not res!203389) (not e!222970))))

(declare-fun i!1472 () (_ BitVec 32))

(declare-datatypes ((array!20679 0))(
  ( (array!20680 (arr!9818 (Array (_ BitVec 32) (_ BitVec 64))) (size!10170 (_ BitVec 32))) )
))
(declare-fun a!4289 () array!20679)

(assert (=> start!36404 (= res!203389 (and (bvsge i!1472 #b00000000000000000000000000000000) (bvslt i!1472 (size!10170 a!4289))))))

(assert (=> start!36404 e!222970))

(assert (=> start!36404 true))

(declare-fun array_inv!7290 (array!20679) Bool)

(assert (=> start!36404 (array_inv!7290 a!4289)))

(declare-fun b!364182 () Bool)

(declare-fun res!203391 () Bool)

(assert (=> b!364182 (=> (not res!203391) (not e!222970))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!364182 (= res!203391 (not (validKeyInArray!0 (select (arr!9818 a!4289) i!1472))))))

(declare-fun b!364184 () Bool)

(declare-fun res!203392 () Bool)

(assert (=> b!364184 (=> (not res!203392) (not e!222970))))

(declare-fun from!3650 () (_ BitVec 32))

(assert (=> b!364184 (= res!203392 (and (bvslt (size!10170 a!4289) #b01111111111111111111111111111111) (bvsge from!3650 #b00000000000000000000000000000000) (bvsle from!3650 (size!10170 a!4289)) (bvsge i!1472 from!3650)))))

(declare-fun b!364185 () Bool)

(assert (=> b!364185 (= e!222970 false)))

(declare-fun lt!168464 () (_ BitVec 32))

(declare-fun k!2974 () (_ BitVec 64))

(declare-fun arrayCountValidKeys!0 (array!20679 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!364185 (= lt!168464 (arrayCountValidKeys!0 (array!20680 (store (arr!9818 a!4289) i!1472 k!2974) (size!10170 a!4289)) from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-fun lt!168463 () (_ BitVec 32))

(assert (=> b!364185 (= lt!168463 (arrayCountValidKeys!0 a!4289 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-fun b!364183 () Bool)

(declare-fun res!203390 () Bool)

(assert (=> b!364183 (=> (not res!203390) (not e!222970))))

(assert (=> b!364183 (= res!203390 (validKeyInArray!0 k!2974))))

(assert (= (and start!36404 res!203389) b!364182))

(assert (= (and b!364182 res!203391) b!364183))

(assert (= (and b!364183 res!203390) b!364184))

(assert (= (and b!364184 res!203392) b!364185))

(declare-fun m!361961 () Bool)

(assert (=> start!36404 m!361961))

(declare-fun m!361963 () Bool)

(assert (=> b!364182 m!361963))

(assert (=> b!364182 m!361963))

(declare-fun m!361965 () Bool)

(assert (=> b!364182 m!361965))

(declare-fun m!361967 () Bool)

(assert (=> b!364185 m!361967))

(declare-fun m!361969 () Bool)

(assert (=> b!364185 m!361969))

(declare-fun m!361971 () Bool)

(assert (=> b!364185 m!361971))

(declare-fun m!361973 () Bool)

(assert (=> b!364183 m!361973))

(push 1)

(assert (not b!364182))

(assert (not b!364183))

(assert (not b!364185))

(assert (not start!36404))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

