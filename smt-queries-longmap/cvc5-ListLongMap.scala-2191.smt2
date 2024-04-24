; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36470 () Bool)

(assert start!36470)

(declare-fun b!364676 () Bool)

(declare-fun res!203885 () Bool)

(declare-fun e!223232 () Bool)

(assert (=> b!364676 (=> (not res!203885) (not e!223232))))

(declare-fun k!2974 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!364676 (= res!203885 (validKeyInArray!0 k!2974))))

(declare-fun from!3650 () (_ BitVec 32))

(declare-fun e!223230 () Bool)

(declare-fun b!364677 () Bool)

(declare-fun i!1472 () (_ BitVec 32))

(declare-datatypes ((array!20745 0))(
  ( (array!20746 (arr!9851 (Array (_ BitVec 32) (_ BitVec 64))) (size!10203 (_ BitVec 32))) )
))
(declare-fun a!4289 () array!20745)

(assert (=> b!364677 (= e!223230 (not (and (bvsle (bvsub from!3650 #b00000000000000000000000000000001) (size!10203 a!4289)) (bvsge i!1472 (bvsub from!3650 #b00000000000000000000000000000001)))))))

(declare-fun lt!168758 () (_ BitVec 32))

(declare-fun lt!168760 () array!20745)

(declare-fun arrayCountValidKeys!0 (array!20745 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!364677 (= (bvadd (arrayCountValidKeys!0 lt!168760 (bvsub from!3650 #b00000000000000000000000000000001) from!3650) lt!168758) (arrayCountValidKeys!0 lt!168760 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-datatypes ((Unit!11345 0))(
  ( (Unit!11346) )
))
(declare-fun lt!168757 () Unit!11345)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!20745 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11345)

(assert (=> b!364677 (= lt!168757 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!168760 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(declare-fun lt!168759 () (_ BitVec 32))

(assert (=> b!364677 (= (bvadd (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) from!3650) lt!168759) (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-fun lt!168761 () Unit!11345)

(assert (=> b!364677 (= lt!168761 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(declare-fun b!364678 () Bool)

(assert (=> b!364678 (= e!223232 e!223230)))

(declare-fun res!203887 () Bool)

(assert (=> b!364678 (=> (not res!203887) (not e!223230))))

(assert (=> b!364678 (= res!203887 (and (= lt!168758 (bvadd #b00000000000000000000000000000001 lt!168759)) (bvsgt from!3650 #b00000000000000000000000000000000)))))

(assert (=> b!364678 (= lt!168758 (arrayCountValidKeys!0 lt!168760 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!364678 (= lt!168759 (arrayCountValidKeys!0 a!4289 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!364678 (= lt!168760 (array!20746 (store (arr!9851 a!4289) i!1472 k!2974) (size!10203 a!4289)))))

(declare-fun res!203884 () Bool)

(assert (=> start!36470 (=> (not res!203884) (not e!223232))))

(assert (=> start!36470 (= res!203884 (and (bvsge i!1472 #b00000000000000000000000000000000) (bvslt i!1472 (size!10203 a!4289))))))

(assert (=> start!36470 e!223232))

(assert (=> start!36470 true))

(declare-fun array_inv!7323 (array!20745) Bool)

(assert (=> start!36470 (array_inv!7323 a!4289)))

(declare-fun b!364679 () Bool)

(declare-fun res!203883 () Bool)

(assert (=> b!364679 (=> (not res!203883) (not e!223232))))

(assert (=> b!364679 (= res!203883 (not (validKeyInArray!0 (select (arr!9851 a!4289) i!1472))))))

(declare-fun b!364680 () Bool)

(declare-fun res!203886 () Bool)

(assert (=> b!364680 (=> (not res!203886) (not e!223232))))

(assert (=> b!364680 (= res!203886 (and (bvslt (size!10203 a!4289) #b01111111111111111111111111111111) (bvsge from!3650 #b00000000000000000000000000000000) (bvsle from!3650 (size!10203 a!4289)) (bvsge i!1472 from!3650)))))

(assert (= (and start!36470 res!203884) b!364679))

(assert (= (and b!364679 res!203883) b!364676))

(assert (= (and b!364676 res!203885) b!364680))

(assert (= (and b!364680 res!203886) b!364678))

(assert (= (and b!364678 res!203887) b!364677))

(declare-fun m!362627 () Bool)

(assert (=> start!36470 m!362627))

(declare-fun m!362629 () Bool)

(assert (=> b!364677 m!362629))

(declare-fun m!362631 () Bool)

(assert (=> b!364677 m!362631))

(declare-fun m!362633 () Bool)

(assert (=> b!364677 m!362633))

(declare-fun m!362635 () Bool)

(assert (=> b!364677 m!362635))

(declare-fun m!362637 () Bool)

(assert (=> b!364677 m!362637))

(declare-fun m!362639 () Bool)

(assert (=> b!364677 m!362639))

(declare-fun m!362641 () Bool)

(assert (=> b!364679 m!362641))

(assert (=> b!364679 m!362641))

(declare-fun m!362643 () Bool)

(assert (=> b!364679 m!362643))

(declare-fun m!362645 () Bool)

(assert (=> b!364678 m!362645))

(declare-fun m!362647 () Bool)

(assert (=> b!364678 m!362647))

(declare-fun m!362649 () Bool)

(assert (=> b!364678 m!362649))

(declare-fun m!362651 () Bool)

(assert (=> b!364676 m!362651))

(push 1)

(assert (not b!364679))

(assert (not b!364677))

(assert (not b!364676))

(assert (not start!36470))

(assert (not b!364678))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

