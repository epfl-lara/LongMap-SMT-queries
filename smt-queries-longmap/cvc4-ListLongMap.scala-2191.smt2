; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36484 () Bool)

(assert start!36484)

(declare-fun b!364725 () Bool)

(declare-fun res!203890 () Bool)

(declare-fun e!223263 () Bool)

(assert (=> b!364725 (=> (not res!203890) (not e!223263))))

(declare-fun from!3650 () (_ BitVec 32))

(declare-fun i!1472 () (_ BitVec 32))

(declare-datatypes ((array!20764 0))(
  ( (array!20765 (arr!9861 (Array (_ BitVec 32) (_ BitVec 64))) (size!10213 (_ BitVec 32))) )
))
(declare-fun a!4289 () array!20764)

(assert (=> b!364725 (= res!203890 (and (bvslt (size!10213 a!4289) #b01111111111111111111111111111111) (bvsge from!3650 #b00000000000000000000000000000000) (bvsle from!3650 (size!10213 a!4289)) (bvsge i!1472 from!3650)))))

(declare-fun res!203889 () Bool)

(assert (=> start!36484 (=> (not res!203889) (not e!223263))))

(assert (=> start!36484 (= res!203889 (and (bvsge i!1472 #b00000000000000000000000000000000) (bvslt i!1472 (size!10213 a!4289))))))

(assert (=> start!36484 e!223263))

(assert (=> start!36484 true))

(declare-fun array_inv!7303 (array!20764) Bool)

(assert (=> start!36484 (array_inv!7303 a!4289)))

(declare-fun b!364726 () Bool)

(declare-fun e!223264 () Bool)

(assert (=> b!364726 (= e!223263 e!223264)))

(declare-fun res!203887 () Bool)

(assert (=> b!364726 (=> (not res!203887) (not e!223264))))

(declare-fun lt!168741 () (_ BitVec 32))

(declare-fun lt!168742 () (_ BitVec 32))

(assert (=> b!364726 (= res!203887 (and (= lt!168741 (bvadd #b00000000000000000000000000000001 lt!168742)) (bvsgt from!3650 #b00000000000000000000000000000000)))))

(declare-fun lt!168738 () array!20764)

(declare-fun arrayCountValidKeys!0 (array!20764 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!364726 (= lt!168741 (arrayCountValidKeys!0 lt!168738 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!364726 (= lt!168742 (arrayCountValidKeys!0 a!4289 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-fun k!2974 () (_ BitVec 64))

(assert (=> b!364726 (= lt!168738 (array!20765 (store (arr!9861 a!4289) i!1472 k!2974) (size!10213 a!4289)))))

(declare-fun b!364727 () Bool)

(assert (=> b!364727 (= e!223264 (not (and (bvsle (bvsub from!3650 #b00000000000000000000000000000001) (size!10213 a!4289)) (bvsge i!1472 (bvsub from!3650 #b00000000000000000000000000000001)))))))

(assert (=> b!364727 (= (bvadd (arrayCountValidKeys!0 lt!168738 (bvsub from!3650 #b00000000000000000000000000000001) from!3650) lt!168741) (arrayCountValidKeys!0 lt!168738 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-datatypes ((Unit!11356 0))(
  ( (Unit!11357) )
))
(declare-fun lt!168739 () Unit!11356)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!20764 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11356)

(assert (=> b!364727 (= lt!168739 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!168738 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(assert (=> b!364727 (= (bvadd (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) from!3650) lt!168742) (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-fun lt!168740 () Unit!11356)

(assert (=> b!364727 (= lt!168740 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(declare-fun b!364728 () Bool)

(declare-fun res!203886 () Bool)

(assert (=> b!364728 (=> (not res!203886) (not e!223263))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!364728 (= res!203886 (validKeyInArray!0 k!2974))))

(declare-fun b!364729 () Bool)

(declare-fun res!203888 () Bool)

(assert (=> b!364729 (=> (not res!203888) (not e!223263))))

(assert (=> b!364729 (= res!203888 (not (validKeyInArray!0 (select (arr!9861 a!4289) i!1472))))))

(assert (= (and start!36484 res!203889) b!364729))

(assert (= (and b!364729 res!203888) b!364728))

(assert (= (and b!364728 res!203886) b!364725))

(assert (= (and b!364725 res!203890) b!364726))

(assert (= (and b!364726 res!203887) b!364727))

(declare-fun m!362397 () Bool)

(assert (=> b!364728 m!362397))

(declare-fun m!362399 () Bool)

(assert (=> b!364726 m!362399))

(declare-fun m!362401 () Bool)

(assert (=> b!364726 m!362401))

(declare-fun m!362403 () Bool)

(assert (=> b!364726 m!362403))

(declare-fun m!362405 () Bool)

(assert (=> b!364727 m!362405))

(declare-fun m!362407 () Bool)

(assert (=> b!364727 m!362407))

(declare-fun m!362409 () Bool)

(assert (=> b!364727 m!362409))

(declare-fun m!362411 () Bool)

(assert (=> b!364727 m!362411))

(declare-fun m!362413 () Bool)

(assert (=> b!364727 m!362413))

(declare-fun m!362415 () Bool)

(assert (=> b!364727 m!362415))

(declare-fun m!362417 () Bool)

(assert (=> start!36484 m!362417))

(declare-fun m!362419 () Bool)

(assert (=> b!364729 m!362419))

(assert (=> b!364729 m!362419))

(declare-fun m!362421 () Bool)

(assert (=> b!364729 m!362421))

(push 1)

(assert (not b!364728))

(assert (not b!364729))

(assert (not b!364727))

(assert (not b!364726))

(assert (not start!36484))

(check-sat)

(pop 1)

(push 1)

(check-sat)

