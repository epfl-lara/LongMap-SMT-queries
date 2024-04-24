; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117374 () Bool)

(assert start!117374)

(declare-fun b!1380059 () Bool)

(declare-fun e!781908 () Bool)

(assert (=> b!1380059 (= e!781908 false)))

(declare-fun k!2953 () (_ BitVec 64))

(declare-fun from!3466 () (_ BitVec 32))

(declare-fun i!1451 () (_ BitVec 32))

(declare-datatypes ((array!93875 0))(
  ( (array!93876 (arr!45333 (Array (_ BitVec 32) (_ BitVec 64))) (size!45884 (_ BitVec 32))) )
))
(declare-fun a!4094 () array!93875)

(declare-fun lt!607459 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93875 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1380059 (= lt!607459 (arrayCountValidKeys!0 (array!93876 (store (arr!45333 a!4094) i!1451 k!2953) (size!45884 a!4094)) from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun lt!607458 () (_ BitVec 32))

(assert (=> b!1380059 (= lt!607458 (arrayCountValidKeys!0 a!4094 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun b!1380057 () Bool)

(declare-fun res!921802 () Bool)

(assert (=> b!1380057 (=> (not res!921802) (not e!781908))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1380057 (= res!921802 (not (validKeyInArray!0 k!2953)))))

(declare-fun b!1380056 () Bool)

(declare-fun res!921801 () Bool)

(assert (=> b!1380056 (=> (not res!921801) (not e!781908))))

(assert (=> b!1380056 (= res!921801 (validKeyInArray!0 (select (arr!45333 a!4094) i!1451)))))

(declare-fun b!1380058 () Bool)

(declare-fun res!921803 () Bool)

(assert (=> b!1380058 (=> (not res!921803) (not e!781908))))

(assert (=> b!1380058 (= res!921803 (and (bvslt (size!45884 a!4094) #b01111111111111111111111111111111) (bvsge from!3466 #b00000000000000000000000000000000) (bvsle from!3466 (size!45884 a!4094)) (bvsge i!1451 from!3466)))))

(declare-fun res!921804 () Bool)

(assert (=> start!117374 (=> (not res!921804) (not e!781908))))

(assert (=> start!117374 (= res!921804 (and (bvsge i!1451 #b00000000000000000000000000000000) (bvslt i!1451 (size!45884 a!4094))))))

(assert (=> start!117374 e!781908))

(assert (=> start!117374 true))

(declare-fun array_inv!34614 (array!93875) Bool)

(assert (=> start!117374 (array_inv!34614 a!4094)))

(assert (= (and start!117374 res!921804) b!1380056))

(assert (= (and b!1380056 res!921801) b!1380057))

(assert (= (and b!1380057 res!921802) b!1380058))

(assert (= (and b!1380058 res!921803) b!1380059))

(declare-fun m!1265201 () Bool)

(assert (=> b!1380059 m!1265201))

(declare-fun m!1265203 () Bool)

(assert (=> b!1380059 m!1265203))

(declare-fun m!1265205 () Bool)

(assert (=> b!1380059 m!1265205))

(declare-fun m!1265207 () Bool)

(assert (=> b!1380057 m!1265207))

(declare-fun m!1265209 () Bool)

(assert (=> b!1380056 m!1265209))

(assert (=> b!1380056 m!1265209))

(declare-fun m!1265211 () Bool)

(assert (=> b!1380056 m!1265211))

(declare-fun m!1265213 () Bool)

(assert (=> start!117374 m!1265213))

(push 1)

(assert (not b!1380059))

(assert (not start!117374))

(assert (not b!1380056))

(assert (not b!1380057))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

