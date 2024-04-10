; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!136784 () Bool)

(assert start!136784)

(declare-fun res!1078623 () Bool)

(declare-fun e!880553 () Bool)

(assert (=> start!136784 (=> (not res!1078623) (not e!880553))))

(declare-fun from!2937 () (_ BitVec 32))

(declare-datatypes ((array!105782 0))(
  ( (array!105783 (arr!51001 (Array (_ BitVec 32) (_ BitVec 64))) (size!51551 (_ BitVec 32))) )
))
(declare-fun a!3559 () array!105782)

(assert (=> start!136784 (= res!1078623 (and (bvsge from!2937 #b00000000000000000000000000000000) (bvslt from!2937 (size!51551 a!3559)) (bvslt (size!51551 a!3559) #b01111111111111111111111111111111)))))

(assert (=> start!136784 e!880553))

(assert (=> start!136784 true))

(declare-fun array_inv!39728 (array!105782) Bool)

(assert (=> start!136784 (array_inv!39728 a!3559)))

(declare-fun b!1578682 () Bool)

(declare-fun res!1078622 () Bool)

(assert (=> b!1578682 (=> (not res!1078622) (not e!880553))))

(declare-fun k!2792 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!105782 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1578682 (= res!1078622 (arrayContainsKey!0 a!3559 k!2792 from!2937))))

(declare-fun b!1578683 () Bool)

(declare-fun res!1078621 () Bool)

(assert (=> b!1578683 (=> (not res!1078621) (not e!880553))))

(assert (=> b!1578683 (= res!1078621 (and (bvsgt from!2937 #b00000000000000000000000000000000) (bvslt (bvsub from!2937 #b00000000000000000000000000000001) (size!51551 a!3559))))))

(declare-fun b!1578684 () Bool)

(assert (=> b!1578684 (= e!880553 (not (arrayContainsKey!0 a!3559 k!2792 (bvsub from!2937 #b00000000000000000000000000000001))))))

(assert (= (and start!136784 res!1078623) b!1578682))

(assert (= (and b!1578682 res!1078622) b!1578683))

(assert (= (and b!1578683 res!1078621) b!1578684))

(declare-fun m!1450735 () Bool)

(assert (=> start!136784 m!1450735))

(declare-fun m!1450737 () Bool)

(assert (=> b!1578682 m!1450737))

(declare-fun m!1450739 () Bool)

(assert (=> b!1578684 m!1450739))

(push 1)

(assert (not b!1578682))

(assert (not start!136784))

(assert (not b!1578684))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!166127 () Bool)

(declare-fun res!1078660 () Bool)

(declare-fun e!880584 () Bool)

(assert (=> d!166127 (=> res!1078660 e!880584)))

(assert (=> d!166127 (= res!1078660 (= (select (arr!51001 a!3559) from!2937) k!2792))))

