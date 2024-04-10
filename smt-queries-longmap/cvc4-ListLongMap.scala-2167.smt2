; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36340 () Bool)

(assert start!36340)

(declare-fun b!363612 () Bool)

(declare-fun res!202774 () Bool)

(declare-fun e!222633 () Bool)

(assert (=> b!363612 (=> (not res!202774) (not e!222633))))

(declare-fun from!3650 () (_ BitVec 32))

(declare-fun i!1472 () (_ BitVec 32))

(declare-datatypes ((array!20620 0))(
  ( (array!20621 (arr!9789 (Array (_ BitVec 32) (_ BitVec 64))) (size!10141 (_ BitVec 32))) )
))
(declare-fun a!4289 () array!20620)

(assert (=> b!363612 (= res!202774 (and (bvslt (size!10141 a!4289) #b01111111111111111111111111111111) (bvsge from!3650 #b00000000000000000000000000000000) (bvsle from!3650 (size!10141 a!4289)) (bvsge i!1472 from!3650)))))

(declare-fun res!202772 () Bool)

(assert (=> start!36340 (=> (not res!202772) (not e!222633))))

(assert (=> start!36340 (= res!202772 (and (bvsge i!1472 #b00000000000000000000000000000000) (bvslt i!1472 (size!10141 a!4289))))))

(assert (=> start!36340 e!222633))

(assert (=> start!36340 true))

(declare-fun array_inv!7231 (array!20620) Bool)

(assert (=> start!36340 (array_inv!7231 a!4289)))

(declare-fun b!363613 () Bool)

(assert (=> b!363613 (= e!222633 false)))

(declare-fun lt!167778 () (_ BitVec 32))

(declare-fun k!2974 () (_ BitVec 64))

(declare-fun arrayCountValidKeys!0 (array!20620 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!363613 (= lt!167778 (arrayCountValidKeys!0 (array!20621 (store (arr!9789 a!4289) i!1472 k!2974) (size!10141 a!4289)) from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-fun lt!167779 () (_ BitVec 32))

(assert (=> b!363613 (= lt!167779 (arrayCountValidKeys!0 a!4289 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-fun b!363610 () Bool)

(declare-fun res!202771 () Bool)

(assert (=> b!363610 (=> (not res!202771) (not e!222633))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!363610 (= res!202771 (not (validKeyInArray!0 (select (arr!9789 a!4289) i!1472))))))

(declare-fun b!363611 () Bool)

(declare-fun res!202773 () Bool)

(assert (=> b!363611 (=> (not res!202773) (not e!222633))))

(assert (=> b!363611 (= res!202773 (validKeyInArray!0 k!2974))))

(assert (= (and start!36340 res!202772) b!363610))

(assert (= (and b!363610 res!202771) b!363611))

(assert (= (and b!363611 res!202773) b!363612))

(assert (= (and b!363612 res!202774) b!363613))

(declare-fun m!360735 () Bool)

(assert (=> start!36340 m!360735))

(declare-fun m!360737 () Bool)

(assert (=> b!363613 m!360737))

(declare-fun m!360739 () Bool)

(assert (=> b!363613 m!360739))

(declare-fun m!360741 () Bool)

(assert (=> b!363613 m!360741))

(declare-fun m!360743 () Bool)

(assert (=> b!363610 m!360743))

(assert (=> b!363610 m!360743))

(declare-fun m!360745 () Bool)

(assert (=> b!363610 m!360745))

(declare-fun m!360747 () Bool)

(assert (=> b!363611 m!360747))

(push 1)

(assert (not start!36340))

(assert (not b!363610))

(assert (not b!363613))

(assert (not b!363611))

(check-sat)

(pop 1)

(push 1)

(check-sat)

