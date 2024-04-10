; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36516 () Bool)

(assert start!36516)

(declare-fun b!364881 () Bool)

(declare-fun e!223347 () Bool)

(declare-fun e!223346 () Bool)

(assert (=> b!364881 (= e!223347 e!223346)))

(declare-fun res!203949 () Bool)

(assert (=> b!364881 (=> (not res!203949) (not e!223346))))

(declare-fun lt!168882 () (_ BitVec 32))

(declare-fun from!3650 () (_ BitVec 32))

(declare-fun lt!168879 () (_ BitVec 32))

(assert (=> b!364881 (= res!203949 (and (= lt!168879 (bvadd #b00000000000000000000000000000001 lt!168882)) (bvsgt from!3650 #b00000000000000000000000000000000)))))

(declare-datatypes ((array!20775 0))(
  ( (array!20776 (arr!9865 (Array (_ BitVec 32) (_ BitVec 64))) (size!10217 (_ BitVec 32))) )
))
(declare-fun lt!168881 () array!20775)

(declare-fun i!1472 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!20775 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!364881 (= lt!168879 (arrayCountValidKeys!0 lt!168881 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-fun a!4289 () array!20775)

(assert (=> b!364881 (= lt!168882 (arrayCountValidKeys!0 a!4289 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-fun k!2974 () (_ BitVec 64))

(assert (=> b!364881 (= lt!168881 (array!20776 (store (arr!9865 a!4289) i!1472 k!2974) (size!10217 a!4289)))))

(declare-fun b!364882 () Bool)

(declare-fun res!203950 () Bool)

(assert (=> b!364882 (=> (not res!203950) (not e!223347))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!364882 (= res!203950 (not (validKeyInArray!0 (select (arr!9865 a!4289) i!1472))))))

(declare-fun b!364883 () Bool)

(declare-fun res!203947 () Bool)

(assert (=> b!364883 (=> (not res!203947) (not e!223347))))

(assert (=> b!364883 (= res!203947 (and (bvslt (size!10217 a!4289) #b01111111111111111111111111111111) (bvsge from!3650 #b00000000000000000000000000000000) (bvsle from!3650 (size!10217 a!4289)) (bvsge i!1472 from!3650)))))

(declare-fun b!364884 () Bool)

(declare-fun lt!168885 () (_ BitVec 32))

(declare-fun lt!168878 () (_ BitVec 32))

(assert (=> b!364884 (= e!223346 (not (or (bvsgt (bvsub from!3650 #b00000000000000000000000000000001) (size!10217 a!4289)) (bvslt i!1472 (bvsub from!3650 #b00000000000000000000000000000001)) (not (= lt!168885 (bvadd #b00000000000000000000000000000001 lt!168878))) (bvslt (bvsub from!3650 #b00000000000000000000000000000001) from!3650))))))

(declare-fun lt!168886 () (_ BitVec 32))

(assert (=> b!364884 (= (bvadd lt!168886 lt!168879) lt!168885)))

(assert (=> b!364884 (= lt!168885 (arrayCountValidKeys!0 lt!168881 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!364884 (= lt!168886 (arrayCountValidKeys!0 lt!168881 (bvsub from!3650 #b00000000000000000000000000000001) from!3650))))

(declare-datatypes ((Unit!11364 0))(
  ( (Unit!11365) )
))
(declare-fun lt!168883 () Unit!11364)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!20775 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11364)

(assert (=> b!364884 (= lt!168883 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!168881 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(declare-fun lt!168880 () (_ BitVec 32))

(assert (=> b!364884 (= (bvadd lt!168880 lt!168882) lt!168878)))

(assert (=> b!364884 (= lt!168878 (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!364884 (= lt!168880 (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) from!3650))))

(declare-fun lt!168884 () Unit!11364)

(assert (=> b!364884 (= lt!168884 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(declare-fun b!364885 () Bool)

(declare-fun res!203948 () Bool)

(assert (=> b!364885 (=> (not res!203948) (not e!223347))))

(assert (=> b!364885 (= res!203948 (validKeyInArray!0 k!2974))))

(declare-fun res!203946 () Bool)

(assert (=> start!36516 (=> (not res!203946) (not e!223347))))

(assert (=> start!36516 (= res!203946 (and (bvsge i!1472 #b00000000000000000000000000000000) (bvslt i!1472 (size!10217 a!4289))))))

(assert (=> start!36516 e!223347))

(assert (=> start!36516 true))

(declare-fun array_inv!7307 (array!20775) Bool)

(assert (=> start!36516 (array_inv!7307 a!4289)))

(assert (= (and start!36516 res!203946) b!364882))

(assert (= (and b!364882 res!203950) b!364885))

(assert (= (and b!364885 res!203948) b!364883))

(assert (= (and b!364883 res!203947) b!364881))

(assert (= (and b!364881 res!203949) b!364884))

(declare-fun m!362597 () Bool)

(assert (=> b!364885 m!362597))

(declare-fun m!362599 () Bool)

(assert (=> b!364882 m!362599))

(assert (=> b!364882 m!362599))

(declare-fun m!362601 () Bool)

(assert (=> b!364882 m!362601))

(declare-fun m!362603 () Bool)

(assert (=> b!364884 m!362603))

(declare-fun m!362605 () Bool)

(assert (=> b!364884 m!362605))

(declare-fun m!362607 () Bool)

(assert (=> b!364884 m!362607))

(declare-fun m!362609 () Bool)

(assert (=> b!364884 m!362609))

(declare-fun m!362611 () Bool)

(assert (=> b!364884 m!362611))

(declare-fun m!362613 () Bool)

(assert (=> b!364884 m!362613))

(declare-fun m!362615 () Bool)

(assert (=> start!36516 m!362615))

(declare-fun m!362617 () Bool)

(assert (=> b!364881 m!362617))

(declare-fun m!362619 () Bool)

(assert (=> b!364881 m!362619))

(declare-fun m!362621 () Bool)

(assert (=> b!364881 m!362621))

(push 1)

(assert (not b!364882))

(assert (not b!364885))

(assert (not b!364884))

(assert (not start!36516))

(assert (not b!364881))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

