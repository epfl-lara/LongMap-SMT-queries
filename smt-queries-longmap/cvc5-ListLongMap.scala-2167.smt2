; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36336 () Bool)

(assert start!36336)

(declare-fun b!363587 () Bool)

(declare-fun res!202747 () Bool)

(declare-fun e!222621 () Bool)

(assert (=> b!363587 (=> (not res!202747) (not e!222621))))

(declare-fun k!2974 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!363587 (= res!202747 (validKeyInArray!0 k!2974))))

(declare-fun b!363589 () Bool)

(assert (=> b!363589 (= e!222621 false)))

(declare-fun from!3650 () (_ BitVec 32))

(declare-fun lt!167767 () (_ BitVec 32))

(declare-fun i!1472 () (_ BitVec 32))

(declare-datatypes ((array!20616 0))(
  ( (array!20617 (arr!9787 (Array (_ BitVec 32) (_ BitVec 64))) (size!10139 (_ BitVec 32))) )
))
(declare-fun a!4289 () array!20616)

(declare-fun arrayCountValidKeys!0 (array!20616 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!363589 (= lt!167767 (arrayCountValidKeys!0 (array!20617 (store (arr!9787 a!4289) i!1472 k!2974) (size!10139 a!4289)) from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-fun lt!167766 () (_ BitVec 32))

(assert (=> b!363589 (= lt!167766 (arrayCountValidKeys!0 a!4289 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-fun res!202750 () Bool)

(assert (=> start!36336 (=> (not res!202750) (not e!222621))))

(assert (=> start!36336 (= res!202750 (and (bvsge i!1472 #b00000000000000000000000000000000) (bvslt i!1472 (size!10139 a!4289))))))

(assert (=> start!36336 e!222621))

(assert (=> start!36336 true))

(declare-fun array_inv!7229 (array!20616) Bool)

(assert (=> start!36336 (array_inv!7229 a!4289)))

(declare-fun b!363588 () Bool)

(declare-fun res!202749 () Bool)

(assert (=> b!363588 (=> (not res!202749) (not e!222621))))

(assert (=> b!363588 (= res!202749 (and (bvslt (size!10139 a!4289) #b01111111111111111111111111111111) (bvsge from!3650 #b00000000000000000000000000000000) (bvsle from!3650 (size!10139 a!4289)) (bvsge i!1472 from!3650)))))

(declare-fun b!363586 () Bool)

(declare-fun res!202748 () Bool)

(assert (=> b!363586 (=> (not res!202748) (not e!222621))))

(assert (=> b!363586 (= res!202748 (not (validKeyInArray!0 (select (arr!9787 a!4289) i!1472))))))

(assert (= (and start!36336 res!202750) b!363586))

(assert (= (and b!363586 res!202748) b!363587))

(assert (= (and b!363587 res!202747) b!363588))

(assert (= (and b!363588 res!202749) b!363589))

(declare-fun m!360707 () Bool)

(assert (=> b!363587 m!360707))

(declare-fun m!360709 () Bool)

(assert (=> b!363589 m!360709))

(declare-fun m!360711 () Bool)

(assert (=> b!363589 m!360711))

(declare-fun m!360713 () Bool)

(assert (=> b!363589 m!360713))

(declare-fun m!360715 () Bool)

(assert (=> start!36336 m!360715))

(declare-fun m!360717 () Bool)

(assert (=> b!363586 m!360717))

(assert (=> b!363586 m!360717))

(declare-fun m!360719 () Bool)

(assert (=> b!363586 m!360719))

(push 1)

(assert (not b!363587))

(assert (not b!363586))

(assert (not start!36336))

(assert (not b!363589))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

