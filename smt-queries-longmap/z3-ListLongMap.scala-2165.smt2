; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36326 () Bool)

(assert start!36326)

(declare-fun res!202701 () Bool)

(declare-fun e!222591 () Bool)

(assert (=> start!36326 (=> (not res!202701) (not e!222591))))

(declare-fun i!1472 () (_ BitVec 32))

(declare-datatypes ((array!20606 0))(
  ( (array!20607 (arr!9782 (Array (_ BitVec 32) (_ BitVec 64))) (size!10134 (_ BitVec 32))) )
))
(declare-fun a!4289 () array!20606)

(assert (=> start!36326 (= res!202701 (and (bvsge i!1472 #b00000000000000000000000000000000) (bvslt i!1472 (size!10134 a!4289))))))

(assert (=> start!36326 e!222591))

(assert (=> start!36326 true))

(declare-fun array_inv!7224 (array!20606) Bool)

(assert (=> start!36326 (array_inv!7224 a!4289)))

(declare-fun b!363539 () Bool)

(declare-fun res!202700 () Bool)

(assert (=> b!363539 (=> (not res!202700) (not e!222591))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!363539 (= res!202700 (not (validKeyInArray!0 (select (arr!9782 a!4289) i!1472))))))

(declare-fun b!363540 () Bool)

(declare-fun res!202702 () Bool)

(assert (=> b!363540 (=> (not res!202702) (not e!222591))))

(declare-fun k0!2974 () (_ BitVec 64))

(assert (=> b!363540 (= res!202702 (validKeyInArray!0 k0!2974))))

(declare-fun from!3650 () (_ BitVec 32))

(declare-fun b!363541 () Bool)

(assert (=> b!363541 (= e!222591 (and (bvslt (size!10134 a!4289) #b01111111111111111111111111111111) (bvsge from!3650 #b00000000000000000000000000000000) (bvsle from!3650 (size!10134 a!4289)) (bvsge i!1472 from!3650) (bvsgt from!3650 (bvadd #b00000000000000000000000000000001 i!1472))))))

(assert (= (and start!36326 res!202701) b!363539))

(assert (= (and b!363539 res!202700) b!363540))

(assert (= (and b!363540 res!202702) b!363541))

(declare-fun m!360667 () Bool)

(assert (=> start!36326 m!360667))

(declare-fun m!360669 () Bool)

(assert (=> b!363539 m!360669))

(assert (=> b!363539 m!360669))

(declare-fun m!360671 () Bool)

(assert (=> b!363539 m!360671))

(declare-fun m!360673 () Bool)

(assert (=> b!363540 m!360673))

(check-sat (not b!363539) (not start!36326) (not b!363540))
(check-sat)
