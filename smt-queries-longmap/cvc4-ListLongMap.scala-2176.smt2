; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36394 () Bool)

(assert start!36394)

(declare-fun b!364040 () Bool)

(declare-fun e!222893 () Bool)

(assert (=> b!364040 (= e!222893 true)))

(declare-datatypes ((array!20674 0))(
  ( (array!20675 (arr!9816 (Array (_ BitVec 32) (_ BitVec 64))) (size!10168 (_ BitVec 32))) )
))
(declare-fun lt!168243 () array!20674)

(declare-fun i!1472 () (_ BitVec 32))

(declare-fun a!4289 () array!20674)

(declare-fun arrayCountValidKeys!0 (array!20674 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!364040 (= (arrayCountValidKeys!0 lt!168243 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1472)) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 a!4289 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1472))))))

(declare-fun from!3650 () (_ BitVec 32))

(declare-datatypes ((Unit!11302 0))(
  ( (Unit!11303) )
))
(declare-fun lt!168241 () Unit!11302)

(declare-fun k!2974 () (_ BitVec 64))

(declare-fun lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 (array!20674 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!11302)

(assert (=> b!364040 (= lt!168241 (lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 a!4289 i!1472 k!2974 (bvsub from!3650 #b00000000000000000000000000000001)))))

(declare-fun res!203205 () Bool)

(declare-fun e!222895 () Bool)

(assert (=> start!36394 (=> (not res!203205) (not e!222895))))

(assert (=> start!36394 (= res!203205 (and (bvsge i!1472 #b00000000000000000000000000000000) (bvslt i!1472 (size!10168 a!4289))))))

(assert (=> start!36394 e!222895))

(assert (=> start!36394 true))

(declare-fun array_inv!7258 (array!20674) Bool)

(assert (=> start!36394 (array_inv!7258 a!4289)))

(declare-fun b!364041 () Bool)

(declare-fun res!203203 () Bool)

(assert (=> b!364041 (=> (not res!203203) (not e!222895))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!364041 (= res!203203 (validKeyInArray!0 k!2974))))

(declare-fun b!364042 () Bool)

(declare-fun res!203204 () Bool)

(assert (=> b!364042 (=> (not res!203204) (not e!222895))))

(assert (=> b!364042 (= res!203204 (not (validKeyInArray!0 (select (arr!9816 a!4289) i!1472))))))

(declare-fun b!364043 () Bool)

(declare-fun e!222894 () Bool)

(assert (=> b!364043 (= e!222895 e!222894)))

(declare-fun res!203202 () Bool)

(assert (=> b!364043 (=> (not res!203202) (not e!222894))))

(declare-fun lt!168242 () (_ BitVec 32))

(declare-fun lt!168238 () (_ BitVec 32))

(assert (=> b!364043 (= res!203202 (and (= lt!168242 (bvadd #b00000000000000000000000000000001 lt!168238)) (bvsgt from!3650 #b00000000000000000000000000000000)))))

(assert (=> b!364043 (= lt!168242 (arrayCountValidKeys!0 lt!168243 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!364043 (= lt!168238 (arrayCountValidKeys!0 a!4289 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!364043 (= lt!168243 (array!20675 (store (arr!9816 a!4289) i!1472 k!2974) (size!10168 a!4289)))))

(declare-fun b!364044 () Bool)

(declare-fun res!203201 () Bool)

(assert (=> b!364044 (=> (not res!203201) (not e!222895))))

(assert (=> b!364044 (= res!203201 (and (bvslt (size!10168 a!4289) #b01111111111111111111111111111111) (bvsge from!3650 #b00000000000000000000000000000000) (bvsle from!3650 (size!10168 a!4289)) (bvsge i!1472 from!3650)))))

(declare-fun b!364045 () Bool)

(assert (=> b!364045 (= e!222894 (not e!222893))))

(declare-fun res!203206 () Bool)

(assert (=> b!364045 (=> res!203206 e!222893)))

(declare-fun lt!168239 () (_ BitVec 32))

(declare-fun lt!168247 () (_ BitVec 32))

(assert (=> b!364045 (= res!203206 (or (bvsgt (bvsub from!3650 #b00000000000000000000000000000001) (size!10168 a!4289)) (bvslt i!1472 (bvsub from!3650 #b00000000000000000000000000000001)) (not (= lt!168239 (bvadd #b00000000000000000000000000000001 lt!168247)))))))

(declare-fun lt!168240 () (_ BitVec 32))

(assert (=> b!364045 (= (bvadd lt!168240 lt!168242) lt!168239)))

(assert (=> b!364045 (= lt!168239 (arrayCountValidKeys!0 lt!168243 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!364045 (= lt!168240 (arrayCountValidKeys!0 lt!168243 (bvsub from!3650 #b00000000000000000000000000000001) from!3650))))

(declare-fun lt!168245 () Unit!11302)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!20674 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11302)

(assert (=> b!364045 (= lt!168245 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!168243 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(declare-fun lt!168244 () (_ BitVec 32))

(assert (=> b!364045 (= (bvadd lt!168244 lt!168238) lt!168247)))

(assert (=> b!364045 (= lt!168247 (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!364045 (= lt!168244 (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) from!3650))))

(declare-fun lt!168246 () Unit!11302)

(assert (=> b!364045 (= lt!168246 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(assert (= (and start!36394 res!203205) b!364042))

(assert (= (and b!364042 res!203204) b!364041))

(assert (= (and b!364041 res!203203) b!364044))

(assert (= (and b!364044 res!203201) b!364043))

(assert (= (and b!364043 res!203202) b!364045))

(assert (= (and b!364045 (not res!203206)) b!364040))

(declare-fun m!361437 () Bool)

(assert (=> b!364041 m!361437))

(declare-fun m!361439 () Bool)

(assert (=> b!364045 m!361439))

(declare-fun m!361441 () Bool)

(assert (=> b!364045 m!361441))

(declare-fun m!361443 () Bool)

(assert (=> b!364045 m!361443))

(declare-fun m!361445 () Bool)

(assert (=> b!364045 m!361445))

(declare-fun m!361447 () Bool)

(assert (=> b!364045 m!361447))

(declare-fun m!361449 () Bool)

(assert (=> b!364045 m!361449))

(declare-fun m!361451 () Bool)

(assert (=> b!364043 m!361451))

(declare-fun m!361453 () Bool)

(assert (=> b!364043 m!361453))

(declare-fun m!361455 () Bool)

(assert (=> b!364043 m!361455))

(declare-fun m!361457 () Bool)

(assert (=> b!364040 m!361457))

(declare-fun m!361459 () Bool)

(assert (=> b!364040 m!361459))

(declare-fun m!361461 () Bool)

(assert (=> b!364040 m!361461))

(declare-fun m!361463 () Bool)

(assert (=> start!36394 m!361463))

(declare-fun m!361465 () Bool)

(assert (=> b!364042 m!361465))

(assert (=> b!364042 m!361465))

(declare-fun m!361467 () Bool)

(assert (=> b!364042 m!361467))

(push 1)

(assert (not b!364042))

(assert (not b!364043))

(assert (not b!364040))

(assert (not b!364045))

(assert (not b!364041))

(assert (not start!36394))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

