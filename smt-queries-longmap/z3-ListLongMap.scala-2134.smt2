; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36080 () Bool)

(assert start!36080)

(declare-fun res!201498 () Bool)

(declare-fun e!221830 () Bool)

(assert (=> start!36080 (=> (not res!201498) (not e!221830))))

(declare-fun i!1487 () (_ BitVec 32))

(declare-datatypes ((array!20411 0))(
  ( (array!20412 (arr!9689 (Array (_ BitVec 32) (_ BitVec 64))) (size!10041 (_ BitVec 32))) )
))
(declare-fun a!4392 () array!20411)

(assert (=> start!36080 (= res!201498 (and (bvsge i!1487 #b00000000000000000000000000000000) (bvslt i!1487 (size!10041 a!4392))))))

(assert (=> start!36080 e!221830))

(assert (=> start!36080 true))

(declare-fun array_inv!7131 (array!20411) Bool)

(assert (=> start!36080 (array_inv!7131 a!4392)))

(declare-fun b!362165 () Bool)

(declare-fun res!201499 () Bool)

(assert (=> b!362165 (=> (not res!201499) (not e!221830))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!362165 (= res!201499 (validKeyInArray!0 (select (arr!9689 a!4392) i!1487)))))

(declare-fun b!362166 () Bool)

(assert (=> b!362166 (= e!221830 (and (bvslt (size!10041 a!4392) #b01111111111111111111111111111111) (bvsgt i!1487 (bvadd #b00000000000000000000000000000001 i!1487))))))

(assert (= (and start!36080 res!201498) b!362165))

(assert (= (and b!362165 res!201499) b!362166))

(declare-fun m!358703 () Bool)

(assert (=> start!36080 m!358703))

(declare-fun m!358705 () Bool)

(assert (=> b!362165 m!358705))

(assert (=> b!362165 m!358705))

(declare-fun m!358707 () Bool)

(assert (=> b!362165 m!358707))

(check-sat (not start!36080) (not b!362165))
(check-sat)
