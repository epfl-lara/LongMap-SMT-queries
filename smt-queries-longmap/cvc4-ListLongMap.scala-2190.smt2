; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36478 () Bool)

(assert start!36478)

(declare-fun b!364680 () Bool)

(declare-fun res!203844 () Bool)

(declare-fun e!223236 () Bool)

(assert (=> b!364680 (=> (not res!203844) (not e!223236))))

(declare-fun k!2974 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!364680 (= res!203844 (validKeyInArray!0 k!2974))))

(declare-fun b!364681 () Bool)

(declare-fun e!223237 () Bool)

(assert (=> b!364681 (= e!223237 (not true))))

(declare-fun from!3650 () (_ BitVec 32))

(declare-fun lt!168695 () (_ BitVec 32))

(declare-fun i!1472 () (_ BitVec 32))

(declare-datatypes ((array!20758 0))(
  ( (array!20759 (arr!9858 (Array (_ BitVec 32) (_ BitVec 64))) (size!10210 (_ BitVec 32))) )
))
(declare-fun lt!168693 () array!20758)

(declare-fun arrayCountValidKeys!0 (array!20758 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!364681 (= (bvadd (arrayCountValidKeys!0 lt!168693 (bvsub from!3650 #b00000000000000000000000000000001) from!3650) lt!168695) (arrayCountValidKeys!0 lt!168693 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-datatypes ((Unit!11350 0))(
  ( (Unit!11351) )
))
(declare-fun lt!168694 () Unit!11350)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!20758 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11350)

(assert (=> b!364681 (= lt!168694 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!168693 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(declare-fun lt!168696 () (_ BitVec 32))

(declare-fun a!4289 () array!20758)

(assert (=> b!364681 (= (bvadd (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) from!3650) lt!168696) (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-fun lt!168697 () Unit!11350)

(assert (=> b!364681 (= lt!168697 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(declare-fun res!203843 () Bool)

(assert (=> start!36478 (=> (not res!203843) (not e!223236))))

(assert (=> start!36478 (= res!203843 (and (bvsge i!1472 #b00000000000000000000000000000000) (bvslt i!1472 (size!10210 a!4289))))))

(assert (=> start!36478 e!223236))

(assert (=> start!36478 true))

(declare-fun array_inv!7300 (array!20758) Bool)

(assert (=> start!36478 (array_inv!7300 a!4289)))

(declare-fun b!364682 () Bool)

(declare-fun res!203841 () Bool)

(assert (=> b!364682 (=> (not res!203841) (not e!223236))))

(assert (=> b!364682 (= res!203841 (and (bvslt (size!10210 a!4289) #b01111111111111111111111111111111) (bvsge from!3650 #b00000000000000000000000000000000) (bvsle from!3650 (size!10210 a!4289)) (bvsge i!1472 from!3650)))))

(declare-fun b!364683 () Bool)

(declare-fun res!203842 () Bool)

(assert (=> b!364683 (=> (not res!203842) (not e!223236))))

(assert (=> b!364683 (= res!203842 (not (validKeyInArray!0 (select (arr!9858 a!4289) i!1472))))))

(declare-fun b!364684 () Bool)

(assert (=> b!364684 (= e!223236 e!223237)))

(declare-fun res!203845 () Bool)

(assert (=> b!364684 (=> (not res!203845) (not e!223237))))

(assert (=> b!364684 (= res!203845 (and (= lt!168695 (bvadd #b00000000000000000000000000000001 lt!168696)) (bvsgt from!3650 #b00000000000000000000000000000000)))))

(assert (=> b!364684 (= lt!168695 (arrayCountValidKeys!0 lt!168693 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!364684 (= lt!168696 (arrayCountValidKeys!0 a!4289 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!364684 (= lt!168693 (array!20759 (store (arr!9858 a!4289) i!1472 k!2974) (size!10210 a!4289)))))

(assert (= (and start!36478 res!203843) b!364683))

(assert (= (and b!364683 res!203842) b!364680))

(assert (= (and b!364680 res!203844) b!364682))

(assert (= (and b!364682 res!203841) b!364684))

(assert (= (and b!364684 res!203845) b!364681))

(declare-fun m!362319 () Bool)

(assert (=> b!364680 m!362319))

(declare-fun m!362321 () Bool)

(assert (=> b!364681 m!362321))

(declare-fun m!362323 () Bool)

(assert (=> b!364681 m!362323))

(declare-fun m!362325 () Bool)

(assert (=> b!364681 m!362325))

(declare-fun m!362327 () Bool)

(assert (=> b!364681 m!362327))

(declare-fun m!362329 () Bool)

(assert (=> b!364681 m!362329))

(declare-fun m!362331 () Bool)

(assert (=> b!364681 m!362331))

(declare-fun m!362333 () Bool)

(assert (=> start!36478 m!362333))

(declare-fun m!362335 () Bool)

(assert (=> b!364683 m!362335))

(assert (=> b!364683 m!362335))

(declare-fun m!362337 () Bool)

(assert (=> b!364683 m!362337))

(declare-fun m!362339 () Bool)

(assert (=> b!364684 m!362339))

(declare-fun m!362341 () Bool)

(assert (=> b!364684 m!362341))

(declare-fun m!362343 () Bool)

(assert (=> b!364684 m!362343))

(push 1)

(assert (not b!364681))

(assert (not b!364684))

(assert (not start!36478))

(assert (not b!364680))

(assert (not b!364683))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

