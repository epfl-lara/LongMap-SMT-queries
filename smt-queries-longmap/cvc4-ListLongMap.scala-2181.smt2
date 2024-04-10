; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36424 () Bool)

(assert start!36424)

(declare-fun b!364275 () Bool)

(declare-fun res!203439 () Bool)

(declare-fun e!223021 () Bool)

(assert (=> b!364275 (=> (not res!203439) (not e!223021))))

(declare-datatypes ((array!20704 0))(
  ( (array!20705 (arr!9831 (Array (_ BitVec 32) (_ BitVec 64))) (size!10183 (_ BitVec 32))) )
))
(declare-fun a!4289 () array!20704)

(declare-fun i!1472 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!364275 (= res!203439 (not (validKeyInArray!0 (select (arr!9831 a!4289) i!1472))))))

(declare-fun b!364276 () Bool)

(declare-fun res!203437 () Bool)

(assert (=> b!364276 (=> (not res!203437) (not e!223021))))

(declare-fun k!2974 () (_ BitVec 64))

(assert (=> b!364276 (= res!203437 (validKeyInArray!0 k!2974))))

(declare-fun res!203436 () Bool)

(assert (=> start!36424 (=> (not res!203436) (not e!223021))))

(assert (=> start!36424 (= res!203436 (and (bvsge i!1472 #b00000000000000000000000000000000) (bvslt i!1472 (size!10183 a!4289))))))

(assert (=> start!36424 e!223021))

(assert (=> start!36424 true))

(declare-fun array_inv!7273 (array!20704) Bool)

(assert (=> start!36424 (array_inv!7273 a!4289)))

(declare-fun b!364277 () Bool)

(declare-fun res!203438 () Bool)

(assert (=> b!364277 (=> (not res!203438) (not e!223021))))

(declare-fun from!3650 () (_ BitVec 32))

(assert (=> b!364277 (= res!203438 (and (bvslt (size!10183 a!4289) #b01111111111111111111111111111111) (bvsge from!3650 #b00000000000000000000000000000000) (bvsle from!3650 (size!10183 a!4289)) (bvsge i!1472 from!3650)))))

(declare-fun b!364278 () Bool)

(declare-fun res!203440 () Bool)

(assert (=> b!364278 (=> (not res!203440) (not e!223021))))

(declare-fun arrayCountValidKeys!0 (array!20704 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!364278 (= res!203440 (= (arrayCountValidKeys!0 (array!20705 (store (arr!9831 a!4289) i!1472 k!2974) (size!10183 a!4289)) from!3650 (bvadd #b00000000000000000000000000000001 i!1472)) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 a!4289 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))))

(declare-fun b!364279 () Bool)

(assert (=> b!364279 (= e!223021 (and (bvsle from!3650 #b00000000000000000000000000000000) (bvsgt #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1472))))))

(assert (= (and start!36424 res!203436) b!364275))

(assert (= (and b!364275 res!203439) b!364276))

(assert (= (and b!364276 res!203437) b!364277))

(assert (= (and b!364277 res!203438) b!364278))

(assert (= (and b!364278 res!203440) b!364279))

(declare-fun m!361773 () Bool)

(assert (=> b!364275 m!361773))

(assert (=> b!364275 m!361773))

(declare-fun m!361775 () Bool)

(assert (=> b!364275 m!361775))

(declare-fun m!361777 () Bool)

(assert (=> b!364276 m!361777))

(declare-fun m!361779 () Bool)

(assert (=> start!36424 m!361779))

(declare-fun m!361781 () Bool)

(assert (=> b!364278 m!361781))

(declare-fun m!361783 () Bool)

(assert (=> b!364278 m!361783))

(declare-fun m!361785 () Bool)

(assert (=> b!364278 m!361785))

(push 1)

(assert (not b!364276))

(assert (not start!36424))

(assert (not b!364275))

(assert (not b!364278))

(check-sat)

(pop 1)

