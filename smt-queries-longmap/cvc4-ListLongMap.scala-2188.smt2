; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36450 () Bool)

(assert start!36450)

(declare-fun b!364304 () Bool)

(declare-fun e!222998 () Bool)

(declare-fun e!222999 () Bool)

(assert (=> b!364304 (= e!222998 e!222999)))

(declare-fun res!203611 () Bool)

(assert (=> b!364304 (=> (not res!203611) (not e!222999))))

(declare-fun from!3650 () (_ BitVec 32))

(declare-fun lt!168356 () (_ BitVec 32))

(declare-fun lt!168357 () (_ BitVec 32))

(assert (=> b!364304 (= res!203611 (and (= lt!168356 (bvadd #b00000000000000000000000000000001 lt!168357)) (bvsgt from!3650 #b00000000000000000000000000000000)))))

(declare-datatypes ((array!20726 0))(
  ( (array!20727 (arr!9842 (Array (_ BitVec 32) (_ BitVec 64))) (size!10195 (_ BitVec 32))) )
))
(declare-fun lt!168355 () array!20726)

(declare-fun i!1472 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!20726 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!364304 (= lt!168356 (arrayCountValidKeys!0 lt!168355 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-fun a!4289 () array!20726)

(assert (=> b!364304 (= lt!168357 (arrayCountValidKeys!0 a!4289 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-fun k!2974 () (_ BitVec 64))

(assert (=> b!364304 (= lt!168355 (array!20727 (store (arr!9842 a!4289) i!1472 k!2974) (size!10195 a!4289)))))

(declare-fun b!364305 () Bool)

(declare-fun res!203610 () Bool)

(assert (=> b!364305 (=> (not res!203610) (not e!222998))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!364305 (= res!203610 (validKeyInArray!0 k!2974))))

(declare-fun b!364306 () Bool)

(declare-fun res!203609 () Bool)

(assert (=> b!364306 (=> (not res!203609) (not e!222998))))

(assert (=> b!364306 (= res!203609 (not (validKeyInArray!0 (select (arr!9842 a!4289) i!1472))))))

(declare-fun res!203607 () Bool)

(assert (=> start!36450 (=> (not res!203607) (not e!222998))))

(assert (=> start!36450 (= res!203607 (and (bvsge i!1472 #b00000000000000000000000000000000) (bvslt i!1472 (size!10195 a!4289))))))

(assert (=> start!36450 e!222998))

(assert (=> start!36450 true))

(declare-fun array_inv!7291 (array!20726) Bool)

(assert (=> start!36450 (array_inv!7291 a!4289)))

(declare-fun b!364307 () Bool)

(assert (=> b!364307 (= e!222999 (not true))))

(assert (=> b!364307 (= (bvadd (arrayCountValidKeys!0 lt!168355 (bvsub from!3650 #b00000000000000000000000000000001) from!3650) lt!168356) (arrayCountValidKeys!0 lt!168355 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-datatypes ((Unit!11314 0))(
  ( (Unit!11315) )
))
(declare-fun lt!168358 () Unit!11314)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!20726 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11314)

(assert (=> b!364307 (= lt!168358 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!168355 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(assert (=> b!364307 (= (bvadd (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) from!3650) lt!168357) (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-fun lt!168354 () Unit!11314)

(assert (=> b!364307 (= lt!168354 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(declare-fun b!364308 () Bool)

(declare-fun res!203608 () Bool)

(assert (=> b!364308 (=> (not res!203608) (not e!222998))))

(assert (=> b!364308 (= res!203608 (and (bvslt (size!10195 a!4289) #b01111111111111111111111111111111) (bvsge from!3650 #b00000000000000000000000000000000) (bvsle from!3650 (size!10195 a!4289)) (bvsge i!1472 from!3650)))))

(assert (= (and start!36450 res!203607) b!364306))

(assert (= (and b!364306 res!203609) b!364305))

(assert (= (and b!364305 res!203610) b!364308))

(assert (= (and b!364308 res!203608) b!364304))

(assert (= (and b!364304 res!203611) b!364307))

(declare-fun m!361413 () Bool)

(assert (=> b!364307 m!361413))

(declare-fun m!361415 () Bool)

(assert (=> b!364307 m!361415))

(declare-fun m!361417 () Bool)

(assert (=> b!364307 m!361417))

(declare-fun m!361419 () Bool)

(assert (=> b!364307 m!361419))

(declare-fun m!361421 () Bool)

(assert (=> b!364307 m!361421))

(declare-fun m!361423 () Bool)

(assert (=> b!364307 m!361423))

(declare-fun m!361425 () Bool)

(assert (=> b!364306 m!361425))

(assert (=> b!364306 m!361425))

(declare-fun m!361427 () Bool)

(assert (=> b!364306 m!361427))

(declare-fun m!361429 () Bool)

(assert (=> b!364304 m!361429))

(declare-fun m!361431 () Bool)

(assert (=> b!364304 m!361431))

(declare-fun m!361433 () Bool)

(assert (=> b!364304 m!361433))

(declare-fun m!361435 () Bool)

(assert (=> b!364305 m!361435))

(declare-fun m!361437 () Bool)

(assert (=> start!36450 m!361437))

(push 1)

(assert (not b!364304))

(assert (not b!364307))

(assert (not b!364305))

(assert (not start!36450))

(assert (not b!364306))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

