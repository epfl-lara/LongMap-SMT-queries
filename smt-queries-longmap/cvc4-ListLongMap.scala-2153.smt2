; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36214 () Bool)

(assert start!36214)

(declare-fun res!202251 () Bool)

(declare-fun e!222282 () Bool)

(assert (=> start!36214 (=> (not res!202251) (not e!222282))))

(declare-fun i!1478 () (_ BitVec 32))

(declare-datatypes ((array!20530 0))(
  ( (array!20531 (arr!9747 (Array (_ BitVec 32) (_ BitVec 64))) (size!10099 (_ BitVec 32))) )
))
(declare-fun a!4337 () array!20530)

(assert (=> start!36214 (= res!202251 (and (bvsge i!1478 #b00000000000000000000000000000000) (bvslt i!1478 (size!10099 a!4337))))))

(assert (=> start!36214 e!222282))

(assert (=> start!36214 true))

(declare-fun array_inv!7189 (array!20530) Bool)

(assert (=> start!36214 (array_inv!7189 a!4337)))

(declare-fun b!362961 () Bool)

(declare-fun res!202250 () Bool)

(assert (=> b!362961 (=> (not res!202250) (not e!222282))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!362961 (= res!202250 (not (validKeyInArray!0 (select (arr!9747 a!4337) i!1478))))))

(declare-fun b!362962 () Bool)

(declare-fun res!202252 () Bool)

(assert (=> b!362962 (=> (not res!202252) (not e!222282))))

(declare-fun k!2980 () (_ BitVec 64))

(assert (=> b!362962 (= res!202252 (validKeyInArray!0 k!2980))))

(declare-fun b!362963 () Bool)

(assert (=> b!362963 (= e!222282 (and (bvslt (size!10099 a!4337) #b01111111111111111111111111111111) (bvsgt i!1478 (size!10099 a!4337))))))

(assert (= (and start!36214 res!202251) b!362961))

(assert (= (and b!362961 res!202250) b!362962))

(assert (= (and b!362962 res!202252) b!362963))

(declare-fun m!359829 () Bool)

(assert (=> start!36214 m!359829))

(declare-fun m!359831 () Bool)

(assert (=> b!362961 m!359831))

(assert (=> b!362961 m!359831))

(declare-fun m!359833 () Bool)

(assert (=> b!362961 m!359833))

(declare-fun m!359835 () Bool)

(assert (=> b!362962 m!359835))

(push 1)

(assert (not start!36214))

(assert (not b!362961))

(assert (not b!362962))

(check-sat)

(pop 1)

(push 1)

(check-sat)

