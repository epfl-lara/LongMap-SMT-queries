; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36520 () Bool)

(assert start!36520)

(declare-fun b!364911 () Bool)

(declare-fun res!203977 () Bool)

(declare-fun e!223365 () Bool)

(assert (=> b!364911 (=> (not res!203977) (not e!223365))))

(declare-fun from!3650 () (_ BitVec 32))

(declare-fun i!1472 () (_ BitVec 32))

(declare-datatypes ((array!20779 0))(
  ( (array!20780 (arr!9867 (Array (_ BitVec 32) (_ BitVec 64))) (size!10219 (_ BitVec 32))) )
))
(declare-fun a!4289 () array!20779)

(assert (=> b!364911 (= res!203977 (and (bvslt (size!10219 a!4289) #b01111111111111111111111111111111) (bvsge from!3650 #b00000000000000000000000000000000) (bvsle from!3650 (size!10219 a!4289)) (bvsge i!1472 from!3650)))))

(declare-fun b!364912 () Bool)

(declare-fun res!203980 () Bool)

(assert (=> b!364912 (=> (not res!203980) (not e!223365))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!364912 (= res!203980 (not (validKeyInArray!0 (select (arr!9867 a!4289) i!1472))))))

(declare-fun res!203978 () Bool)

(assert (=> start!36520 (=> (not res!203978) (not e!223365))))

(assert (=> start!36520 (= res!203978 (and (bvsge i!1472 #b00000000000000000000000000000000) (bvslt i!1472 (size!10219 a!4289))))))

(assert (=> start!36520 e!223365))

(assert (=> start!36520 true))

(declare-fun array_inv!7309 (array!20779) Bool)

(assert (=> start!36520 (array_inv!7309 a!4289)))

(declare-fun b!364913 () Bool)

(declare-fun lt!168938 () (_ BitVec 32))

(declare-fun lt!168935 () (_ BitVec 32))

(declare-fun e!223366 () Bool)

(assert (=> b!364913 (= e!223366 (not (or (bvsgt (bvsub from!3650 #b00000000000000000000000000000001) (size!10219 a!4289)) (bvslt i!1472 (bvsub from!3650 #b00000000000000000000000000000001)) (not (= lt!168938 (bvadd #b00000000000000000000000000000001 lt!168935))) (bvslt (bvsub from!3650 #b00000000000000000000000000000001) from!3650))))))

(declare-fun lt!168937 () (_ BitVec 32))

(declare-fun lt!168939 () (_ BitVec 32))

(assert (=> b!364913 (= (bvadd lt!168937 lt!168939) lt!168938)))

(declare-fun lt!168933 () array!20779)

(declare-fun arrayCountValidKeys!0 (array!20779 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!364913 (= lt!168938 (arrayCountValidKeys!0 lt!168933 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!364913 (= lt!168937 (arrayCountValidKeys!0 lt!168933 (bvsub from!3650 #b00000000000000000000000000000001) from!3650))))

(declare-datatypes ((Unit!11368 0))(
  ( (Unit!11369) )
))
(declare-fun lt!168940 () Unit!11368)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!20779 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11368)

(assert (=> b!364913 (= lt!168940 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!168933 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(declare-fun lt!168934 () (_ BitVec 32))

(declare-fun lt!168932 () (_ BitVec 32))

(assert (=> b!364913 (= (bvadd lt!168934 lt!168932) lt!168935)))

(assert (=> b!364913 (= lt!168935 (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!364913 (= lt!168934 (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) from!3650))))

(declare-fun lt!168936 () Unit!11368)

(assert (=> b!364913 (= lt!168936 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(declare-fun b!364914 () Bool)

(declare-fun res!203979 () Bool)

(assert (=> b!364914 (=> (not res!203979) (not e!223365))))

(declare-fun k!2974 () (_ BitVec 64))

(assert (=> b!364914 (= res!203979 (validKeyInArray!0 k!2974))))

(declare-fun b!364915 () Bool)

(assert (=> b!364915 (= e!223365 e!223366)))

(declare-fun res!203976 () Bool)

(assert (=> b!364915 (=> (not res!203976) (not e!223366))))

(assert (=> b!364915 (= res!203976 (and (= lt!168939 (bvadd #b00000000000000000000000000000001 lt!168932)) (bvsgt from!3650 #b00000000000000000000000000000000)))))

(assert (=> b!364915 (= lt!168939 (arrayCountValidKeys!0 lt!168933 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!364915 (= lt!168932 (arrayCountValidKeys!0 a!4289 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!364915 (= lt!168933 (array!20780 (store (arr!9867 a!4289) i!1472 k!2974) (size!10219 a!4289)))))

(assert (= (and start!36520 res!203978) b!364912))

(assert (= (and b!364912 res!203980) b!364914))

(assert (= (and b!364914 res!203979) b!364911))

(assert (= (and b!364911 res!203977) b!364915))

(assert (= (and b!364915 res!203976) b!364913))

(declare-fun m!362649 () Bool)

(assert (=> b!364915 m!362649))

(declare-fun m!362651 () Bool)

(assert (=> b!364915 m!362651))

(declare-fun m!362653 () Bool)

(assert (=> b!364915 m!362653))

(declare-fun m!362655 () Bool)

(assert (=> b!364912 m!362655))

(assert (=> b!364912 m!362655))

(declare-fun m!362657 () Bool)

(assert (=> b!364912 m!362657))

(declare-fun m!362659 () Bool)

(assert (=> start!36520 m!362659))

(declare-fun m!362661 () Bool)

(assert (=> b!364913 m!362661))

(declare-fun m!362663 () Bool)

(assert (=> b!364913 m!362663))

(declare-fun m!362665 () Bool)

(assert (=> b!364913 m!362665))

(declare-fun m!362667 () Bool)

(assert (=> b!364913 m!362667))

(declare-fun m!362669 () Bool)

(assert (=> b!364913 m!362669))

(declare-fun m!362671 () Bool)

(assert (=> b!364913 m!362671))

(declare-fun m!362673 () Bool)

(assert (=> b!364914 m!362673))

(push 1)

(assert (not start!36520))

(assert (not b!364915))

(assert (not b!364912))

(assert (not b!364913))

(assert (not b!364914))

(check-sat)

(pop 1)

(push 1)

(check-sat)

