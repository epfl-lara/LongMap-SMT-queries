; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36450 () Bool)

(assert start!36450)

(declare-fun b!364463 () Bool)

(declare-fun res!203624 () Bool)

(declare-fun e!223110 () Bool)

(assert (=> b!364463 (=> (not res!203624) (not e!223110))))

(declare-fun from!3650 () (_ BitVec 32))

(assert (=> b!364463 (= res!203624 (bvsgt from!3650 #b00000000000000000000000000000000))))

(declare-fun b!364464 () Bool)

(declare-fun i!1472 () (_ BitVec 32))

(assert (=> b!364464 (= e!223110 (not (and (bvsge (bvadd #b00000000000000000000000000000001 i!1472) (bvsub from!3650 #b00000000000000000000000000000001)) (bvsge from!3650 (bvsub from!3650 #b00000000000000000000000000000001)) (bvsle from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))))

(declare-datatypes ((array!20730 0))(
  ( (array!20731 (arr!9844 (Array (_ BitVec 32) (_ BitVec 64))) (size!10196 (_ BitVec 32))) )
))
(declare-fun a!4289 () array!20730)

(declare-fun lt!168505 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!20730 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!364464 (= (bvadd (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) from!3650) lt!168505) (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-datatypes ((Unit!11322 0))(
  ( (Unit!11323) )
))
(declare-fun lt!168504 () Unit!11322)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!20730 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11322)

(assert (=> b!364464 (= lt!168504 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(declare-fun b!364466 () Bool)

(declare-fun e!223109 () Bool)

(assert (=> b!364466 (= e!223109 e!223110)))

(declare-fun res!203628 () Bool)

(assert (=> b!364466 (=> (not res!203628) (not e!223110))))

(declare-fun k!2974 () (_ BitVec 64))

(assert (=> b!364466 (= res!203628 (= (arrayCountValidKeys!0 (array!20731 (store (arr!9844 a!4289) i!1472 k!2974) (size!10196 a!4289)) from!3650 (bvadd #b00000000000000000000000000000001 i!1472)) (bvadd #b00000000000000000000000000000001 lt!168505)))))

(assert (=> b!364466 (= lt!168505 (arrayCountValidKeys!0 a!4289 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-fun res!203629 () Bool)

(assert (=> start!36450 (=> (not res!203629) (not e!223109))))

(assert (=> start!36450 (= res!203629 (and (bvsge i!1472 #b00000000000000000000000000000000) (bvslt i!1472 (size!10196 a!4289))))))

(assert (=> start!36450 e!223109))

(assert (=> start!36450 true))

(declare-fun array_inv!7286 (array!20730) Bool)

(assert (=> start!36450 (array_inv!7286 a!4289)))

(declare-fun b!364465 () Bool)

(declare-fun res!203625 () Bool)

(assert (=> b!364465 (=> (not res!203625) (not e!223109))))

(assert (=> b!364465 (= res!203625 (and (bvslt (size!10196 a!4289) #b01111111111111111111111111111111) (bvsge from!3650 #b00000000000000000000000000000000) (bvsle from!3650 (size!10196 a!4289)) (bvsge i!1472 from!3650)))))

(declare-fun b!364467 () Bool)

(declare-fun res!203627 () Bool)

(assert (=> b!364467 (=> (not res!203627) (not e!223109))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!364467 (= res!203627 (validKeyInArray!0 k!2974))))

(declare-fun b!364468 () Bool)

(declare-fun res!203626 () Bool)

(assert (=> b!364468 (=> (not res!203626) (not e!223109))))

(assert (=> b!364468 (= res!203626 (not (validKeyInArray!0 (select (arr!9844 a!4289) i!1472))))))

(assert (= (and start!36450 res!203629) b!364468))

(assert (= (and b!364468 res!203626) b!364467))

(assert (= (and b!364467 res!203627) b!364465))

(assert (= (and b!364465 res!203625) b!364466))

(assert (= (and b!364466 res!203628) b!364463))

(assert (= (and b!364463 res!203624) b!364464))

(declare-fun m!361973 () Bool)

(assert (=> b!364468 m!361973))

(assert (=> b!364468 m!361973))

(declare-fun m!361975 () Bool)

(assert (=> b!364468 m!361975))

(declare-fun m!361977 () Bool)

(assert (=> b!364467 m!361977))

(declare-fun m!361979 () Bool)

(assert (=> start!36450 m!361979))

(declare-fun m!361981 () Bool)

(assert (=> b!364464 m!361981))

(declare-fun m!361983 () Bool)

(assert (=> b!364464 m!361983))

(declare-fun m!361985 () Bool)

(assert (=> b!364464 m!361985))

(declare-fun m!361987 () Bool)

(assert (=> b!364466 m!361987))

(declare-fun m!361989 () Bool)

(assert (=> b!364466 m!361989))

(declare-fun m!361991 () Bool)

(assert (=> b!364466 m!361991))

(push 1)

(assert (not start!36450))

(assert (not b!364467))

(assert (not b!364464))

(assert (not b!364468))

(assert (not b!364466))

(check-sat)

(pop 1)

(push 1)

(check-sat)

