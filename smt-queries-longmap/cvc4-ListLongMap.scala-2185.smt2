; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36448 () Bool)

(assert start!36448)

(declare-fun b!364445 () Bool)

(declare-fun e!223101 () Bool)

(declare-fun e!223100 () Bool)

(assert (=> b!364445 (= e!223101 e!223100)))

(declare-fun res!203610 () Bool)

(assert (=> b!364445 (=> (not res!203610) (not e!223100))))

(declare-fun from!3650 () (_ BitVec 32))

(declare-fun i!1472 () (_ BitVec 32))

(declare-fun k!2974 () (_ BitVec 64))

(declare-fun lt!168499 () (_ BitVec 32))

(declare-datatypes ((array!20728 0))(
  ( (array!20729 (arr!9843 (Array (_ BitVec 32) (_ BitVec 64))) (size!10195 (_ BitVec 32))) )
))
(declare-fun a!4289 () array!20728)

(declare-fun arrayCountValidKeys!0 (array!20728 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!364445 (= res!203610 (= (arrayCountValidKeys!0 (array!20729 (store (arr!9843 a!4289) i!1472 k!2974) (size!10195 a!4289)) from!3650 (bvadd #b00000000000000000000000000000001 i!1472)) (bvadd #b00000000000000000000000000000001 lt!168499)))))

(assert (=> b!364445 (= lt!168499 (arrayCountValidKeys!0 a!4289 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-fun b!364446 () Bool)

(declare-fun res!203607 () Bool)

(assert (=> b!364446 (=> (not res!203607) (not e!223101))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!364446 (= res!203607 (validKeyInArray!0 k!2974))))

(declare-fun b!364447 () Bool)

(assert (=> b!364447 (= e!223100 (not true))))

(assert (=> b!364447 (= (bvadd (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) from!3650) lt!168499) (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-datatypes ((Unit!11320 0))(
  ( (Unit!11321) )
))
(declare-fun lt!168498 () Unit!11320)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!20728 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11320)

(assert (=> b!364447 (= lt!168498 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(declare-fun b!364448 () Bool)

(declare-fun res!203608 () Bool)

(assert (=> b!364448 (=> (not res!203608) (not e!223101))))

(assert (=> b!364448 (= res!203608 (and (bvslt (size!10195 a!4289) #b01111111111111111111111111111111) (bvsge from!3650 #b00000000000000000000000000000000) (bvsle from!3650 (size!10195 a!4289)) (bvsge i!1472 from!3650)))))

(declare-fun b!364449 () Bool)

(declare-fun res!203609 () Bool)

(assert (=> b!364449 (=> (not res!203609) (not e!223101))))

(assert (=> b!364449 (= res!203609 (not (validKeyInArray!0 (select (arr!9843 a!4289) i!1472))))))

(declare-fun b!364450 () Bool)

(declare-fun res!203606 () Bool)

(assert (=> b!364450 (=> (not res!203606) (not e!223100))))

(assert (=> b!364450 (= res!203606 (bvsgt from!3650 #b00000000000000000000000000000000))))

(declare-fun res!203611 () Bool)

(assert (=> start!36448 (=> (not res!203611) (not e!223101))))

(assert (=> start!36448 (= res!203611 (and (bvsge i!1472 #b00000000000000000000000000000000) (bvslt i!1472 (size!10195 a!4289))))))

(assert (=> start!36448 e!223101))

(assert (=> start!36448 true))

(declare-fun array_inv!7285 (array!20728) Bool)

(assert (=> start!36448 (array_inv!7285 a!4289)))

(assert (= (and start!36448 res!203611) b!364449))

(assert (= (and b!364449 res!203609) b!364446))

(assert (= (and b!364446 res!203607) b!364448))

(assert (= (and b!364448 res!203608) b!364445))

(assert (= (and b!364445 res!203610) b!364450))

(assert (= (and b!364450 res!203606) b!364447))

(declare-fun m!361953 () Bool)

(assert (=> b!364445 m!361953))

(declare-fun m!361955 () Bool)

(assert (=> b!364445 m!361955))

(declare-fun m!361957 () Bool)

(assert (=> b!364445 m!361957))

(declare-fun m!361959 () Bool)

(assert (=> b!364449 m!361959))

(assert (=> b!364449 m!361959))

(declare-fun m!361961 () Bool)

(assert (=> b!364449 m!361961))

(declare-fun m!361963 () Bool)

(assert (=> b!364447 m!361963))

(declare-fun m!361965 () Bool)

(assert (=> b!364447 m!361965))

(declare-fun m!361967 () Bool)

(assert (=> b!364447 m!361967))

(declare-fun m!361969 () Bool)

(assert (=> start!36448 m!361969))

(declare-fun m!361971 () Bool)

(assert (=> b!364446 m!361971))

(push 1)

(assert (not b!364447))

(assert (not start!36448))

(assert (not b!364449))

(assert (not b!364445))

(assert (not b!364446))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

