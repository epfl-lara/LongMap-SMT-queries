; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36326 () Bool)

(assert start!36326)

(declare-fun b!363340 () Bool)

(declare-fun res!202643 () Bool)

(declare-fun e!222460 () Bool)

(assert (=> b!363340 (=> (not res!202643) (not e!222460))))

(declare-fun k!2974 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!363340 (= res!202643 (validKeyInArray!0 k!2974))))

(declare-fun b!363341 () Bool)

(declare-fun res!202644 () Bool)

(assert (=> b!363341 (=> (not res!202644) (not e!222460))))

(declare-fun from!3650 () (_ BitVec 32))

(declare-fun i!1472 () (_ BitVec 32))

(declare-datatypes ((array!20602 0))(
  ( (array!20603 (arr!9780 (Array (_ BitVec 32) (_ BitVec 64))) (size!10133 (_ BitVec 32))) )
))
(declare-fun a!4289 () array!20602)

(assert (=> b!363341 (= res!202644 (and (bvslt (size!10133 a!4289) #b01111111111111111111111111111111) (bvsge from!3650 #b00000000000000000000000000000000) (bvsle from!3650 (size!10133 a!4289)) (bvsge i!1472 from!3650)))))

(declare-fun b!363342 () Bool)

(assert (=> b!363342 (= e!222460 false)))

(declare-fun lt!167545 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!20602 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!363342 (= lt!167545 (arrayCountValidKeys!0 (array!20603 (store (arr!9780 a!4289) i!1472 k!2974) (size!10133 a!4289)) from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-fun lt!167544 () (_ BitVec 32))

(assert (=> b!363342 (= lt!167544 (arrayCountValidKeys!0 a!4289 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-fun res!202645 () Bool)

(assert (=> start!36326 (=> (not res!202645) (not e!222460))))

(assert (=> start!36326 (= res!202645 (and (bvsge i!1472 #b00000000000000000000000000000000) (bvslt i!1472 (size!10133 a!4289))))))

(assert (=> start!36326 e!222460))

(assert (=> start!36326 true))

(declare-fun array_inv!7229 (array!20602) Bool)

(assert (=> start!36326 (array_inv!7229 a!4289)))

(declare-fun b!363339 () Bool)

(declare-fun res!202642 () Bool)

(assert (=> b!363339 (=> (not res!202642) (not e!222460))))

(assert (=> b!363339 (= res!202642 (not (validKeyInArray!0 (select (arr!9780 a!4289) i!1472))))))

(assert (= (and start!36326 res!202645) b!363339))

(assert (= (and b!363339 res!202642) b!363340))

(assert (= (and b!363340 res!202643) b!363341))

(assert (= (and b!363341 res!202644) b!363342))

(declare-fun m!360011 () Bool)

(assert (=> b!363340 m!360011))

(declare-fun m!360013 () Bool)

(assert (=> b!363342 m!360013))

(declare-fun m!360015 () Bool)

(assert (=> b!363342 m!360015))

(declare-fun m!360017 () Bool)

(assert (=> b!363342 m!360017))

(declare-fun m!360019 () Bool)

(assert (=> start!36326 m!360019))

(declare-fun m!360021 () Bool)

(assert (=> b!363339 m!360021))

(assert (=> b!363339 m!360021))

(declare-fun m!360023 () Bool)

(assert (=> b!363339 m!360023))

(push 1)

(assert (not b!363340))

(assert (not b!363339))

(assert (not start!36326))

(assert (not b!363342))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

