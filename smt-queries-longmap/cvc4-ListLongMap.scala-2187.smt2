; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36460 () Bool)

(assert start!36460)

(declare-fun b!364545 () Bool)

(declare-fun e!223155 () Bool)

(assert (=> b!364545 (= e!223155 (not true))))

(declare-datatypes ((array!20740 0))(
  ( (array!20741 (arr!9849 (Array (_ BitVec 32) (_ BitVec 64))) (size!10201 (_ BitVec 32))) )
))
(declare-fun lt!168560 () array!20740)

(declare-fun from!3650 () (_ BitVec 32))

(declare-fun i!1472 () (_ BitVec 32))

(declare-fun lt!168562 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!20740 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!364545 (= (bvadd (arrayCountValidKeys!0 lt!168560 (bvsub from!3650 #b00000000000000000000000000000001) from!3650) lt!168562) (arrayCountValidKeys!0 lt!168560 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-datatypes ((Unit!11332 0))(
  ( (Unit!11333) )
))
(declare-fun lt!168561 () Unit!11332)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!20740 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11332)

(assert (=> b!364545 (= lt!168561 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!168560 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(declare-fun a!4289 () array!20740)

(declare-fun lt!168559 () (_ BitVec 32))

(assert (=> b!364545 (= (bvadd (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) from!3650) lt!168559) (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-fun lt!168558 () Unit!11332)

(assert (=> b!364545 (= lt!168558 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(declare-fun res!203707 () Bool)

(declare-fun e!223156 () Bool)

(assert (=> start!36460 (=> (not res!203707) (not e!223156))))

(assert (=> start!36460 (= res!203707 (and (bvsge i!1472 #b00000000000000000000000000000000) (bvslt i!1472 (size!10201 a!4289))))))

(assert (=> start!36460 e!223156))

(assert (=> start!36460 true))

(declare-fun array_inv!7291 (array!20740) Bool)

(assert (=> start!36460 (array_inv!7291 a!4289)))

(declare-fun b!364546 () Bool)

(declare-fun res!203710 () Bool)

(assert (=> b!364546 (=> (not res!203710) (not e!223156))))

(assert (=> b!364546 (= res!203710 (and (bvslt (size!10201 a!4289) #b01111111111111111111111111111111) (bvsge from!3650 #b00000000000000000000000000000000) (bvsle from!3650 (size!10201 a!4289)) (bvsge i!1472 from!3650)))))

(declare-fun b!364547 () Bool)

(declare-fun res!203706 () Bool)

(assert (=> b!364547 (=> (not res!203706) (not e!223156))))

(declare-fun k!2974 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!364547 (= res!203706 (validKeyInArray!0 k!2974))))

(declare-fun b!364548 () Bool)

(declare-fun res!203709 () Bool)

(assert (=> b!364548 (=> (not res!203709) (not e!223156))))

(assert (=> b!364548 (= res!203709 (not (validKeyInArray!0 (select (arr!9849 a!4289) i!1472))))))

(declare-fun b!364549 () Bool)

(assert (=> b!364549 (= e!223156 e!223155)))

(declare-fun res!203708 () Bool)

(assert (=> b!364549 (=> (not res!203708) (not e!223155))))

(assert (=> b!364549 (= res!203708 (and (= lt!168562 (bvadd #b00000000000000000000000000000001 lt!168559)) (bvsgt from!3650 #b00000000000000000000000000000000)))))

(assert (=> b!364549 (= lt!168562 (arrayCountValidKeys!0 lt!168560 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!364549 (= lt!168559 (arrayCountValidKeys!0 a!4289 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!364549 (= lt!168560 (array!20741 (store (arr!9849 a!4289) i!1472 k!2974) (size!10201 a!4289)))))

(assert (= (and start!36460 res!203707) b!364548))

(assert (= (and b!364548 res!203709) b!364547))

(assert (= (and b!364547 res!203706) b!364546))

(assert (= (and b!364546 res!203710) b!364549))

(assert (= (and b!364549 res!203708) b!364545))

(declare-fun m!362085 () Bool)

(assert (=> b!364548 m!362085))

(assert (=> b!364548 m!362085))

(declare-fun m!362087 () Bool)

(assert (=> b!364548 m!362087))

(declare-fun m!362089 () Bool)

(assert (=> b!364549 m!362089))

(declare-fun m!362091 () Bool)

(assert (=> b!364549 m!362091))

(declare-fun m!362093 () Bool)

(assert (=> b!364549 m!362093))

(declare-fun m!362095 () Bool)

(assert (=> b!364547 m!362095))

(declare-fun m!362097 () Bool)

(assert (=> b!364545 m!362097))

(declare-fun m!362099 () Bool)

(assert (=> b!364545 m!362099))

(declare-fun m!362101 () Bool)

(assert (=> b!364545 m!362101))

(declare-fun m!362103 () Bool)

(assert (=> b!364545 m!362103))

(declare-fun m!362105 () Bool)

(assert (=> b!364545 m!362105))

(declare-fun m!362107 () Bool)

(assert (=> b!364545 m!362107))

(declare-fun m!362109 () Bool)

(assert (=> start!36460 m!362109))

(push 1)

(assert (not b!364547))

(assert (not b!364549))

(assert (not b!364548))

(assert (not b!364545))

(assert (not start!36460))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

