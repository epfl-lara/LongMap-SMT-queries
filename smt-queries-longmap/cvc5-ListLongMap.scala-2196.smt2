; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36534 () Bool)

(assert start!36534)

(declare-fun res!204099 () Bool)

(declare-fun e!223443 () Bool)

(assert (=> start!36534 (=> (not res!204099) (not e!223443))))

(declare-fun i!1472 () (_ BitVec 32))

(declare-datatypes ((array!20793 0))(
  ( (array!20794 (arr!9874 (Array (_ BitVec 32) (_ BitVec 64))) (size!10226 (_ BitVec 32))) )
))
(declare-fun a!4289 () array!20793)

(assert (=> start!36534 (= res!204099 (and (bvsge i!1472 #b00000000000000000000000000000000) (bvslt i!1472 (size!10226 a!4289))))))

(assert (=> start!36534 e!223443))

(assert (=> start!36534 true))

(declare-fun array_inv!7316 (array!20793) Bool)

(assert (=> start!36534 (array_inv!7316 a!4289)))

(declare-fun b!365034 () Bool)

(declare-fun res!204098 () Bool)

(assert (=> b!365034 (=> (not res!204098) (not e!223443))))

(declare-fun from!3650 () (_ BitVec 32))

(assert (=> b!365034 (= res!204098 (and (bvslt (size!10226 a!4289) #b01111111111111111111111111111111) (bvsge from!3650 #b00000000000000000000000000000000) (bvsle from!3650 (size!10226 a!4289)) (bvsge i!1472 from!3650)))))

(declare-fun b!365035 () Bool)

(assert (=> b!365035 (= e!223443 false)))

(declare-fun lt!169125 () (_ BitVec 32))

(declare-fun k!2974 () (_ BitVec 64))

(declare-fun arrayCountValidKeys!0 (array!20793 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!365035 (= lt!169125 (arrayCountValidKeys!0 (array!20794 (store (arr!9874 a!4289) i!1472 k!2974) (size!10226 a!4289)) from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-fun lt!169126 () (_ BitVec 32))

(assert (=> b!365035 (= lt!169126 (arrayCountValidKeys!0 a!4289 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-fun b!365033 () Bool)

(declare-fun res!204100 () Bool)

(assert (=> b!365033 (=> (not res!204100) (not e!223443))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!365033 (= res!204100 (validKeyInArray!0 k!2974))))

(declare-fun b!365032 () Bool)

(declare-fun res!204097 () Bool)

(assert (=> b!365032 (=> (not res!204097) (not e!223443))))

(assert (=> b!365032 (= res!204097 (not (validKeyInArray!0 (select (arr!9874 a!4289) i!1472))))))

(assert (= (and start!36534 res!204099) b!365032))

(assert (= (and b!365032 res!204097) b!365033))

(assert (= (and b!365033 res!204100) b!365034))

(assert (= (and b!365034 res!204098) b!365035))

(declare-fun m!362867 () Bool)

(assert (=> start!36534 m!362867))

(declare-fun m!362869 () Bool)

(assert (=> b!365035 m!362869))

(declare-fun m!362871 () Bool)

(assert (=> b!365035 m!362871))

(declare-fun m!362873 () Bool)

(assert (=> b!365035 m!362873))

(declare-fun m!362875 () Bool)

(assert (=> b!365033 m!362875))

(declare-fun m!362877 () Bool)

(assert (=> b!365032 m!362877))

(assert (=> b!365032 m!362877))

(declare-fun m!362879 () Bool)

(assert (=> b!365032 m!362879))

(push 1)

(assert (not b!365035))

(assert (not start!36534))

(assert (not b!365032))

(assert (not b!365033))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

