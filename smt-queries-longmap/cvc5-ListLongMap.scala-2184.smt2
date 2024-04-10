; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36438 () Bool)

(assert start!36438)

(declare-fun res!203525 () Bool)

(declare-fun e!223063 () Bool)

(assert (=> start!36438 (=> (not res!203525) (not e!223063))))

(declare-fun i!1472 () (_ BitVec 32))

(declare-datatypes ((array!20718 0))(
  ( (array!20719 (arr!9838 (Array (_ BitVec 32) (_ BitVec 64))) (size!10190 (_ BitVec 32))) )
))
(declare-fun a!4289 () array!20718)

(assert (=> start!36438 (= res!203525 (and (bvsge i!1472 #b00000000000000000000000000000000) (bvslt i!1472 (size!10190 a!4289))))))

(assert (=> start!36438 e!223063))

(assert (=> start!36438 true))

(declare-fun array_inv!7280 (array!20718) Bool)

(assert (=> start!36438 (array_inv!7280 a!4289)))

(declare-fun b!364362 () Bool)

(declare-fun res!203527 () Bool)

(assert (=> b!364362 (=> (not res!203527) (not e!223063))))

(declare-fun from!3650 () (_ BitVec 32))

(declare-fun k!2974 () (_ BitVec 64))

(declare-fun arrayCountValidKeys!0 (array!20718 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!364362 (= res!203527 (= (arrayCountValidKeys!0 (array!20719 (store (arr!9838 a!4289) i!1472 k!2974) (size!10190 a!4289)) from!3650 (bvadd #b00000000000000000000000000000001 i!1472)) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 a!4289 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))))

(declare-fun b!364363 () Bool)

(declare-fun res!203524 () Bool)

(assert (=> b!364363 (=> (not res!203524) (not e!223063))))

(assert (=> b!364363 (= res!203524 (and (bvslt (size!10190 a!4289) #b01111111111111111111111111111111) (bvsge from!3650 #b00000000000000000000000000000000) (bvsle from!3650 (size!10190 a!4289)) (bvsge i!1472 from!3650)))))

(declare-fun b!364364 () Bool)

(declare-fun res!203526 () Bool)

(assert (=> b!364364 (=> (not res!203526) (not e!223063))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!364364 (= res!203526 (not (validKeyInArray!0 (select (arr!9838 a!4289) i!1472))))))

(declare-fun b!364365 () Bool)

(declare-fun res!203523 () Bool)

(assert (=> b!364365 (=> (not res!203523) (not e!223063))))

(assert (=> b!364365 (= res!203523 (validKeyInArray!0 k!2974))))

(declare-fun b!364366 () Bool)

(assert (=> b!364366 (= e!223063 (and (bvsgt from!3650 #b00000000000000000000000000000000) (or (bvslt (bvadd #b00000000000000000000000000000001 i!1472) (bvsub from!3650 #b00000000000000000000000000000001)) (bvslt from!3650 (bvsub from!3650 #b00000000000000000000000000000001)) (bvsgt from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))))

(assert (= (and start!36438 res!203525) b!364364))

(assert (= (and b!364364 res!203526) b!364365))

(assert (= (and b!364365 res!203523) b!364363))

(assert (= (and b!364363 res!203524) b!364362))

(assert (= (and b!364362 res!203527) b!364366))

(declare-fun m!361871 () Bool)

(assert (=> start!36438 m!361871))

(declare-fun m!361873 () Bool)

(assert (=> b!364362 m!361873))

(declare-fun m!361875 () Bool)

(assert (=> b!364362 m!361875))

(declare-fun m!361877 () Bool)

(assert (=> b!364362 m!361877))

(declare-fun m!361879 () Bool)

(assert (=> b!364364 m!361879))

(assert (=> b!364364 m!361879))

(declare-fun m!361881 () Bool)

(assert (=> b!364364 m!361881))

(declare-fun m!361883 () Bool)

(assert (=> b!364365 m!361883))

(push 1)

(assert (not start!36438))

(assert (not b!364362))

(assert (not b!364365))

(assert (not b!364364))

(check-sat)

(pop 1)

(push 1)

(check-sat)

