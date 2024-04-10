; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36172 () Bool)

(assert start!36172)

(declare-fun b!362680 () Bool)

(declare-fun res!201970 () Bool)

(declare-fun e!222120 () Bool)

(assert (=> b!362680 (=> (not res!201970) (not e!222120))))

(declare-datatypes ((array!20488 0))(
  ( (array!20489 (arr!9726 (Array (_ BitVec 32) (_ BitVec 64))) (size!10078 (_ BitVec 32))) )
))
(declare-fun a!4337 () array!20488)

(assert (=> b!362680 (= res!201970 (bvslt (size!10078 a!4337) #b01111111111111111111111111111111))))

(declare-fun b!362681 () Bool)

(declare-fun e!222118 () Bool)

(assert (=> b!362681 (= e!222120 (not e!222118))))

(declare-fun res!201969 () Bool)

(assert (=> b!362681 (=> res!201969 e!222118)))

(declare-fun i!1478 () (_ BitVec 32))

(assert (=> b!362681 (= res!201969 (or (bvslt (bvadd #b00000000000000000000000000000001 i!1478) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1478) i!1478)))))

(declare-fun lt!166916 () array!20488)

(declare-fun arrayCountValidKeys!0 (array!20488 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!362681 (= (arrayCountValidKeys!0 lt!166916 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478)) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 a!4337 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478))))))

(declare-fun k!2980 () (_ BitVec 64))

(assert (=> b!362681 (= lt!166916 (array!20489 (store (arr!9726 a!4337) i!1478 k!2980) (size!10078 a!4337)))))

(declare-datatypes ((Unit!11152 0))(
  ( (Unit!11153) )
))
(declare-fun lt!166917 () Unit!11152)

(declare-fun lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 (array!20488 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!11152)

(assert (=> b!362681 (= lt!166917 (lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 a!4337 i!1478 k!2980 i!1478))))

(declare-fun b!362682 () Bool)

(assert (=> b!362682 (= e!222118 true)))

(declare-fun lt!166918 () (_ BitVec 32))

(assert (=> b!362682 (= lt!166918 (arrayCountValidKeys!0 a!4337 (bvadd #b00000000000000000000000000000001 i!1478) (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun lt!166919 () (_ BitVec 32))

(assert (=> b!362682 (= lt!166919 (arrayCountValidKeys!0 lt!166916 (bvadd #b00000000000000000000000000000001 i!1478) (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun res!201971 () Bool)

(assert (=> start!36172 (=> (not res!201971) (not e!222120))))

(assert (=> start!36172 (= res!201971 (and (bvsge i!1478 #b00000000000000000000000000000000) (bvslt i!1478 (size!10078 a!4337))))))

(assert (=> start!36172 e!222120))

(assert (=> start!36172 true))

(declare-fun array_inv!7168 (array!20488) Bool)

(assert (=> start!36172 (array_inv!7168 a!4337)))

(declare-fun b!362683 () Bool)

(declare-fun res!201972 () Bool)

(assert (=> b!362683 (=> (not res!201972) (not e!222120))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!362683 (= res!201972 (not (validKeyInArray!0 (select (arr!9726 a!4337) i!1478))))))

(declare-fun b!362684 () Bool)

(declare-fun res!201973 () Bool)

(assert (=> b!362684 (=> (not res!201973) (not e!222120))))

(assert (=> b!362684 (= res!201973 (validKeyInArray!0 k!2980))))

(assert (= (and start!36172 res!201971) b!362683))

(assert (= (and b!362683 res!201972) b!362684))

(assert (= (and b!362684 res!201973) b!362680))

(assert (= (and b!362680 res!201970) b!362681))

(assert (= (and b!362681 (not res!201969)) b!362682))

(declare-fun m!359289 () Bool)

(assert (=> b!362683 m!359289))

(assert (=> b!362683 m!359289))

(declare-fun m!359291 () Bool)

(assert (=> b!362683 m!359291))

(declare-fun m!359293 () Bool)

(assert (=> b!362684 m!359293))

(declare-fun m!359295 () Bool)

(assert (=> b!362682 m!359295))

(declare-fun m!359297 () Bool)

(assert (=> b!362682 m!359297))

(declare-fun m!359299 () Bool)

(assert (=> b!362681 m!359299))

(declare-fun m!359301 () Bool)

(assert (=> b!362681 m!359301))

(declare-fun m!359303 () Bool)

(assert (=> b!362681 m!359303))

(declare-fun m!359305 () Bool)

(assert (=> b!362681 m!359305))

(declare-fun m!359307 () Bool)

(assert (=> start!36172 m!359307))

(push 1)

(assert (not b!362682))

(assert (not b!362683))

(assert (not b!362684))

(assert (not b!362681))

(assert (not start!36172))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

