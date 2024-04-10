; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36466 () Bool)

(assert start!36466)

(declare-fun b!364590 () Bool)

(declare-fun res!203753 () Bool)

(declare-fun e!223181 () Bool)

(assert (=> b!364590 (=> (not res!203753) (not e!223181))))

(declare-fun k!2974 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!364590 (= res!203753 (validKeyInArray!0 k!2974))))

(declare-fun b!364591 () Bool)

(declare-fun res!203755 () Bool)

(assert (=> b!364591 (=> (not res!203755) (not e!223181))))

(declare-datatypes ((array!20746 0))(
  ( (array!20747 (arr!9852 (Array (_ BitVec 32) (_ BitVec 64))) (size!10204 (_ BitVec 32))) )
))
(declare-fun a!4289 () array!20746)

(declare-fun i!1472 () (_ BitVec 32))

(assert (=> b!364591 (= res!203755 (not (validKeyInArray!0 (select (arr!9852 a!4289) i!1472))))))

(declare-fun b!364592 () Bool)

(declare-fun res!203754 () Bool)

(assert (=> b!364592 (=> (not res!203754) (not e!223181))))

(declare-fun from!3650 () (_ BitVec 32))

(assert (=> b!364592 (= res!203754 (and (bvslt (size!10204 a!4289) #b01111111111111111111111111111111) (bvsge from!3650 #b00000000000000000000000000000000) (bvsle from!3650 (size!10204 a!4289)) (bvsge i!1472 from!3650)))))

(declare-fun res!203752 () Bool)

(assert (=> start!36466 (=> (not res!203752) (not e!223181))))

(assert (=> start!36466 (= res!203752 (and (bvsge i!1472 #b00000000000000000000000000000000) (bvslt i!1472 (size!10204 a!4289))))))

(assert (=> start!36466 e!223181))

(assert (=> start!36466 true))

(declare-fun array_inv!7294 (array!20746) Bool)

(assert (=> start!36466 (array_inv!7294 a!4289)))

(declare-fun b!364593 () Bool)

(declare-fun e!223182 () Bool)

(assert (=> b!364593 (= e!223181 e!223182)))

(declare-fun res!203751 () Bool)

(assert (=> b!364593 (=> (not res!203751) (not e!223182))))

(declare-fun lt!168606 () (_ BitVec 32))

(declare-fun lt!168605 () (_ BitVec 32))

(assert (=> b!364593 (= res!203751 (and (= lt!168605 (bvadd #b00000000000000000000000000000001 lt!168606)) (bvsgt from!3650 #b00000000000000000000000000000000)))))

(declare-fun lt!168604 () array!20746)

(declare-fun arrayCountValidKeys!0 (array!20746 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!364593 (= lt!168605 (arrayCountValidKeys!0 lt!168604 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!364593 (= lt!168606 (arrayCountValidKeys!0 a!4289 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!364593 (= lt!168604 (array!20747 (store (arr!9852 a!4289) i!1472 k!2974) (size!10204 a!4289)))))

(declare-fun b!364594 () Bool)

(assert (=> b!364594 (= e!223182 (not true))))

(assert (=> b!364594 (= (bvadd (arrayCountValidKeys!0 lt!168604 (bvsub from!3650 #b00000000000000000000000000000001) from!3650) lt!168605) (arrayCountValidKeys!0 lt!168604 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-datatypes ((Unit!11338 0))(
  ( (Unit!11339) )
))
(declare-fun lt!168607 () Unit!11338)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!20746 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11338)

(assert (=> b!364594 (= lt!168607 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!168604 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(assert (=> b!364594 (= (bvadd (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) from!3650) lt!168606) (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-fun lt!168603 () Unit!11338)

(assert (=> b!364594 (= lt!168603 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(assert (= (and start!36466 res!203752) b!364591))

(assert (= (and b!364591 res!203755) b!364590))

(assert (= (and b!364590 res!203753) b!364592))

(assert (= (and b!364592 res!203754) b!364593))

(assert (= (and b!364593 res!203751) b!364594))

(declare-fun m!362163 () Bool)

(assert (=> b!364594 m!362163))

(declare-fun m!362165 () Bool)

(assert (=> b!364594 m!362165))

(declare-fun m!362167 () Bool)

(assert (=> b!364594 m!362167))

(declare-fun m!362169 () Bool)

(assert (=> b!364594 m!362169))

(declare-fun m!362171 () Bool)

(assert (=> b!364594 m!362171))

(declare-fun m!362173 () Bool)

(assert (=> b!364594 m!362173))

(declare-fun m!362175 () Bool)

(assert (=> b!364593 m!362175))

(declare-fun m!362177 () Bool)

(assert (=> b!364593 m!362177))

(declare-fun m!362179 () Bool)

(assert (=> b!364593 m!362179))

(declare-fun m!362181 () Bool)

(assert (=> start!36466 m!362181))

(declare-fun m!362183 () Bool)

(assert (=> b!364590 m!362183))

(declare-fun m!362185 () Bool)

(assert (=> b!364591 m!362185))

(assert (=> b!364591 m!362185))

(declare-fun m!362187 () Bool)

(assert (=> b!364591 m!362187))

(push 1)

(assert (not start!36466))

(assert (not b!364591))

(assert (not b!364593))

(assert (not b!364594))

(assert (not b!364590))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

