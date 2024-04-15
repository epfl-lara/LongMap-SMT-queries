; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36404 () Bool)

(assert start!36404)

(declare-fun res!203266 () Bool)

(declare-fun e!222829 () Bool)

(assert (=> start!36404 (=> (not res!203266) (not e!222829))))

(declare-fun i!1472 () (_ BitVec 32))

(declare-datatypes ((array!20680 0))(
  ( (array!20681 (arr!9819 (Array (_ BitVec 32) (_ BitVec 64))) (size!10172 (_ BitVec 32))) )
))
(declare-fun a!4289 () array!20680)

(assert (=> start!36404 (= res!203266 (and (bvsge i!1472 #b00000000000000000000000000000000) (bvslt i!1472 (size!10172 a!4289))))))

(assert (=> start!36404 e!222829))

(assert (=> start!36404 true))

(declare-fun array_inv!7268 (array!20680) Bool)

(assert (=> start!36404 (array_inv!7268 a!4289)))

(declare-fun b!363962 () Bool)

(declare-fun res!203263 () Bool)

(assert (=> b!363962 (=> (not res!203263) (not e!222829))))

(declare-fun from!3650 () (_ BitVec 32))

(assert (=> b!363962 (= res!203263 (and (bvslt (size!10172 a!4289) #b01111111111111111111111111111111) (bvsge from!3650 #b00000000000000000000000000000000) (bvsle from!3650 (size!10172 a!4289)) (bvsge i!1472 from!3650)))))

(declare-fun b!363961 () Bool)

(declare-fun res!203264 () Bool)

(assert (=> b!363961 (=> (not res!203264) (not e!222829))))

(declare-fun k!2974 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!363961 (= res!203264 (validKeyInArray!0 k!2974))))

(declare-fun b!363960 () Bool)

(declare-fun res!203265 () Bool)

(assert (=> b!363960 (=> (not res!203265) (not e!222829))))

(assert (=> b!363960 (= res!203265 (not (validKeyInArray!0 (select (arr!9819 a!4289) i!1472))))))

(declare-fun b!363963 () Bool)

(assert (=> b!363963 (= e!222829 false)))

(declare-fun lt!168211 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!20680 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!363963 (= lt!168211 (arrayCountValidKeys!0 (array!20681 (store (arr!9819 a!4289) i!1472 k!2974) (size!10172 a!4289)) from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-fun lt!168210 () (_ BitVec 32))

(assert (=> b!363963 (= lt!168210 (arrayCountValidKeys!0 a!4289 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (= (and start!36404 res!203266) b!363960))

(assert (= (and b!363960 res!203265) b!363961))

(assert (= (and b!363961 res!203264) b!363962))

(assert (= (and b!363962 res!203263) b!363963))

(declare-fun m!361007 () Bool)

(assert (=> start!36404 m!361007))

(declare-fun m!361009 () Bool)

(assert (=> b!363961 m!361009))

(declare-fun m!361011 () Bool)

(assert (=> b!363960 m!361011))

(assert (=> b!363960 m!361011))

(declare-fun m!361013 () Bool)

(assert (=> b!363960 m!361013))

(declare-fun m!361015 () Bool)

(assert (=> b!363963 m!361015))

(declare-fun m!361017 () Bool)

(assert (=> b!363963 m!361017))

(declare-fun m!361019 () Bool)

(assert (=> b!363963 m!361019))

(push 1)

(assert (not b!363963))

(assert (not start!36404))

(assert (not b!363960))

(assert (not b!363961))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

