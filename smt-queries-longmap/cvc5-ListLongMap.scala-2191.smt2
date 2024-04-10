; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36480 () Bool)

(assert start!36480)

(declare-fun b!364695 () Bool)

(declare-fun e!223246 () Bool)

(declare-fun e!223244 () Bool)

(assert (=> b!364695 (= e!223246 e!223244)))

(declare-fun res!203857 () Bool)

(assert (=> b!364695 (=> (not res!203857) (not e!223244))))

(declare-fun from!3650 () (_ BitVec 32))

(declare-fun lt!168710 () (_ BitVec 32))

(declare-fun lt!168712 () (_ BitVec 32))

(assert (=> b!364695 (= res!203857 (and (= lt!168710 (bvadd #b00000000000000000000000000000001 lt!168712)) (bvsgt from!3650 #b00000000000000000000000000000000)))))

(declare-fun i!1472 () (_ BitVec 32))

(declare-datatypes ((array!20760 0))(
  ( (array!20761 (arr!9859 (Array (_ BitVec 32) (_ BitVec 64))) (size!10211 (_ BitVec 32))) )
))
(declare-fun lt!168711 () array!20760)

(declare-fun arrayCountValidKeys!0 (array!20760 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!364695 (= lt!168710 (arrayCountValidKeys!0 lt!168711 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-fun a!4289 () array!20760)

(assert (=> b!364695 (= lt!168712 (arrayCountValidKeys!0 a!4289 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-fun k!2974 () (_ BitVec 64))

(assert (=> b!364695 (= lt!168711 (array!20761 (store (arr!9859 a!4289) i!1472 k!2974) (size!10211 a!4289)))))

(declare-fun b!364696 () Bool)

(declare-fun res!203859 () Bool)

(assert (=> b!364696 (=> (not res!203859) (not e!223246))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!364696 (= res!203859 (not (validKeyInArray!0 (select (arr!9859 a!4289) i!1472))))))

(declare-fun res!203858 () Bool)

(assert (=> start!36480 (=> (not res!203858) (not e!223246))))

(assert (=> start!36480 (= res!203858 (and (bvsge i!1472 #b00000000000000000000000000000000) (bvslt i!1472 (size!10211 a!4289))))))

(assert (=> start!36480 e!223246))

(assert (=> start!36480 true))

(declare-fun array_inv!7301 (array!20760) Bool)

(assert (=> start!36480 (array_inv!7301 a!4289)))

(declare-fun b!364697 () Bool)

(declare-fun res!203856 () Bool)

(assert (=> b!364697 (=> (not res!203856) (not e!223246))))

(assert (=> b!364697 (= res!203856 (and (bvslt (size!10211 a!4289) #b01111111111111111111111111111111) (bvsge from!3650 #b00000000000000000000000000000000) (bvsle from!3650 (size!10211 a!4289)) (bvsge i!1472 from!3650)))))

(declare-fun b!364698 () Bool)

(assert (=> b!364698 (= e!223244 (not (and (bvsle (bvsub from!3650 #b00000000000000000000000000000001) (size!10211 a!4289)) (bvsge i!1472 (bvsub from!3650 #b00000000000000000000000000000001)))))))

(assert (=> b!364698 (= (bvadd (arrayCountValidKeys!0 lt!168711 (bvsub from!3650 #b00000000000000000000000000000001) from!3650) lt!168710) (arrayCountValidKeys!0 lt!168711 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-datatypes ((Unit!11352 0))(
  ( (Unit!11353) )
))
(declare-fun lt!168708 () Unit!11352)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!20760 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11352)

(assert (=> b!364698 (= lt!168708 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!168711 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(assert (=> b!364698 (= (bvadd (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) from!3650) lt!168712) (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-fun lt!168709 () Unit!11352)

(assert (=> b!364698 (= lt!168709 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(declare-fun b!364699 () Bool)

(declare-fun res!203860 () Bool)

(assert (=> b!364699 (=> (not res!203860) (not e!223246))))

(assert (=> b!364699 (= res!203860 (validKeyInArray!0 k!2974))))

(assert (= (and start!36480 res!203858) b!364696))

(assert (= (and b!364696 res!203859) b!364699))

(assert (= (and b!364699 res!203860) b!364697))

(assert (= (and b!364697 res!203856) b!364695))

(assert (= (and b!364695 res!203857) b!364698))

(declare-fun m!362345 () Bool)

(assert (=> b!364695 m!362345))

(declare-fun m!362347 () Bool)

(assert (=> b!364695 m!362347))

(declare-fun m!362349 () Bool)

(assert (=> b!364695 m!362349))

(declare-fun m!362351 () Bool)

(assert (=> b!364698 m!362351))

(declare-fun m!362353 () Bool)

(assert (=> b!364698 m!362353))

(declare-fun m!362355 () Bool)

(assert (=> b!364698 m!362355))

(declare-fun m!362357 () Bool)

(assert (=> b!364698 m!362357))

(declare-fun m!362359 () Bool)

(assert (=> b!364698 m!362359))

(declare-fun m!362361 () Bool)

(assert (=> b!364698 m!362361))

(declare-fun m!362363 () Bool)

(assert (=> b!364699 m!362363))

(declare-fun m!362365 () Bool)

(assert (=> b!364696 m!362365))

(assert (=> b!364696 m!362365))

(declare-fun m!362367 () Bool)

(assert (=> b!364696 m!362367))

(declare-fun m!362369 () Bool)

(assert (=> start!36480 m!362369))

(push 1)

(assert (not b!364695))

(assert (not b!364696))

(assert (not b!364699))

(assert (not b!364698))

(assert (not start!36480))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

