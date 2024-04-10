; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36128 () Bool)

(assert start!36128)

(declare-fun b!362374 () Bool)

(declare-fun res!201664 () Bool)

(declare-fun e!221942 () Bool)

(assert (=> b!362374 (=> (not res!201664) (not e!221942))))

(declare-datatypes ((array!20444 0))(
  ( (array!20445 (arr!9704 (Array (_ BitVec 32) (_ BitVec 64))) (size!10056 (_ BitVec 32))) )
))
(declare-fun a!4337 () array!20444)

(declare-fun i!1478 () (_ BitVec 32))

(assert (=> b!362374 (= res!201664 (and (bvslt (size!10056 a!4337) #b01111111111111111111111111111111) (bvsle i!1478 (size!10056 a!4337))))))

(declare-fun b!362375 () Bool)

(assert (=> b!362375 (= e!221942 false)))

(declare-fun k0!2980 () (_ BitVec 64))

(declare-fun lt!166697 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!20444 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!362375 (= lt!166697 (arrayCountValidKeys!0 (array!20445 (store (arr!9704 a!4337) i!1478 k0!2980) (size!10056 a!4337)) i!1478 (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun lt!166696 () (_ BitVec 32))

(assert (=> b!362375 (= lt!166696 (arrayCountValidKeys!0 a!4337 i!1478 (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun res!201663 () Bool)

(assert (=> start!36128 (=> (not res!201663) (not e!221942))))

(assert (=> start!36128 (= res!201663 (and (bvsge i!1478 #b00000000000000000000000000000000) (bvslt i!1478 (size!10056 a!4337))))))

(assert (=> start!36128 e!221942))

(assert (=> start!36128 true))

(declare-fun array_inv!7146 (array!20444) Bool)

(assert (=> start!36128 (array_inv!7146 a!4337)))

(declare-fun b!362373 () Bool)

(declare-fun res!201661 () Bool)

(assert (=> b!362373 (=> (not res!201661) (not e!221942))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!362373 (= res!201661 (validKeyInArray!0 k0!2980))))

(declare-fun b!362372 () Bool)

(declare-fun res!201662 () Bool)

(assert (=> b!362372 (=> (not res!201662) (not e!221942))))

(assert (=> b!362372 (= res!201662 (not (validKeyInArray!0 (select (arr!9704 a!4337) i!1478))))))

(assert (= (and start!36128 res!201663) b!362372))

(assert (= (and b!362372 res!201662) b!362373))

(assert (= (and b!362373 res!201661) b!362374))

(assert (= (and b!362374 res!201664) b!362375))

(declare-fun m!358897 () Bool)

(assert (=> b!362375 m!358897))

(declare-fun m!358899 () Bool)

(assert (=> b!362375 m!358899))

(declare-fun m!358901 () Bool)

(assert (=> b!362375 m!358901))

(declare-fun m!358903 () Bool)

(assert (=> start!36128 m!358903))

(declare-fun m!358905 () Bool)

(assert (=> b!362373 m!358905))

(declare-fun m!358907 () Bool)

(assert (=> b!362372 m!358907))

(assert (=> b!362372 m!358907))

(declare-fun m!358909 () Bool)

(assert (=> b!362372 m!358909))

(check-sat (not b!362375) (not b!362373) (not b!362372) (not start!36128))
