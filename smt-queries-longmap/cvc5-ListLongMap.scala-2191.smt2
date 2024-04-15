; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36470 () Bool)

(assert start!36470)

(declare-fun e!223089 () Bool)

(declare-fun from!3650 () (_ BitVec 32))

(declare-fun b!364454 () Bool)

(declare-fun i!1472 () (_ BitVec 32))

(declare-datatypes ((array!20746 0))(
  ( (array!20747 (arr!9852 (Array (_ BitVec 32) (_ BitVec 64))) (size!10205 (_ BitVec 32))) )
))
(declare-fun a!4289 () array!20746)

(assert (=> b!364454 (= e!223089 (not (and (bvsle (bvsub from!3650 #b00000000000000000000000000000001) (size!10205 a!4289)) (bvsge i!1472 (bvsub from!3650 #b00000000000000000000000000000001)))))))

(declare-fun lt!168504 () array!20746)

(declare-fun lt!168506 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!20746 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!364454 (= (bvadd (arrayCountValidKeys!0 lt!168504 (bvsub from!3650 #b00000000000000000000000000000001) from!3650) lt!168506) (arrayCountValidKeys!0 lt!168504 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-datatypes ((Unit!11334 0))(
  ( (Unit!11335) )
))
(declare-fun lt!168507 () Unit!11334)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!20746 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11334)

(assert (=> b!364454 (= lt!168507 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!168504 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(declare-fun lt!168508 () (_ BitVec 32))

(assert (=> b!364454 (= (bvadd (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) from!3650) lt!168508) (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-fun lt!168505 () Unit!11334)

(assert (=> b!364454 (= lt!168505 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(declare-fun b!364455 () Bool)

(declare-fun e!223088 () Bool)

(assert (=> b!364455 (= e!223088 e!223089)))

(declare-fun res!203760 () Bool)

(assert (=> b!364455 (=> (not res!203760) (not e!223089))))

(assert (=> b!364455 (= res!203760 (and (= lt!168506 (bvadd #b00000000000000000000000000000001 lt!168508)) (bvsgt from!3650 #b00000000000000000000000000000000)))))

(assert (=> b!364455 (= lt!168506 (arrayCountValidKeys!0 lt!168504 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!364455 (= lt!168508 (arrayCountValidKeys!0 a!4289 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-fun k!2974 () (_ BitVec 64))

(assert (=> b!364455 (= lt!168504 (array!20747 (store (arr!9852 a!4289) i!1472 k!2974) (size!10205 a!4289)))))

(declare-fun res!203758 () Bool)

(assert (=> start!36470 (=> (not res!203758) (not e!223088))))

(assert (=> start!36470 (= res!203758 (and (bvsge i!1472 #b00000000000000000000000000000000) (bvslt i!1472 (size!10205 a!4289))))))

(assert (=> start!36470 e!223088))

(assert (=> start!36470 true))

(declare-fun array_inv!7301 (array!20746) Bool)

(assert (=> start!36470 (array_inv!7301 a!4289)))

(declare-fun b!364456 () Bool)

(declare-fun res!203759 () Bool)

(assert (=> b!364456 (=> (not res!203759) (not e!223088))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!364456 (= res!203759 (validKeyInArray!0 k!2974))))

(declare-fun b!364457 () Bool)

(declare-fun res!203761 () Bool)

(assert (=> b!364457 (=> (not res!203761) (not e!223088))))

(assert (=> b!364457 (= res!203761 (and (bvslt (size!10205 a!4289) #b01111111111111111111111111111111) (bvsge from!3650 #b00000000000000000000000000000000) (bvsle from!3650 (size!10205 a!4289)) (bvsge i!1472 from!3650)))))

(declare-fun b!364458 () Bool)

(declare-fun res!203757 () Bool)

(assert (=> b!364458 (=> (not res!203757) (not e!223088))))

(assert (=> b!364458 (= res!203757 (not (validKeyInArray!0 (select (arr!9852 a!4289) i!1472))))))

(assert (= (and start!36470 res!203758) b!364458))

(assert (= (and b!364458 res!203757) b!364456))

(assert (= (and b!364456 res!203759) b!364457))

(assert (= (and b!364457 res!203761) b!364455))

(assert (= (and b!364455 res!203760) b!364454))

(declare-fun m!361673 () Bool)

(assert (=> start!36470 m!361673))

(declare-fun m!361675 () Bool)

(assert (=> b!364455 m!361675))

(declare-fun m!361677 () Bool)

(assert (=> b!364455 m!361677))

(declare-fun m!361679 () Bool)

(assert (=> b!364455 m!361679))

(declare-fun m!361681 () Bool)

(assert (=> b!364458 m!361681))

(assert (=> b!364458 m!361681))

(declare-fun m!361683 () Bool)

(assert (=> b!364458 m!361683))

(declare-fun m!361685 () Bool)

(assert (=> b!364454 m!361685))

(declare-fun m!361687 () Bool)

(assert (=> b!364454 m!361687))

(declare-fun m!361689 () Bool)

(assert (=> b!364454 m!361689))

(declare-fun m!361691 () Bool)

(assert (=> b!364454 m!361691))

(declare-fun m!361693 () Bool)

(assert (=> b!364454 m!361693))

(declare-fun m!361695 () Bool)

(assert (=> b!364454 m!361695))

(declare-fun m!361697 () Bool)

(assert (=> b!364456 m!361697))

(push 1)

(assert (not b!364458))

(assert (not start!36470))

(assert (not b!364455))

(assert (not b!364456))

(assert (not b!364454))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

