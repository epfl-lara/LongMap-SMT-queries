; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36528 () Bool)

(assert start!36528)

(declare-fun b!364982 () Bool)

(declare-fun res!204050 () Bool)

(declare-fun e!223414 () Bool)

(assert (=> b!364982 (=> (not res!204050) (not e!223414))))

(declare-fun k!2974 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!364982 (= res!204050 (validKeyInArray!0 k!2974))))

(declare-fun b!364983 () Bool)

(declare-fun res!204052 () Bool)

(assert (=> b!364983 (=> (not res!204052) (not e!223414))))

(declare-fun from!3650 () (_ BitVec 32))

(declare-fun i!1472 () (_ BitVec 32))

(declare-datatypes ((array!20787 0))(
  ( (array!20788 (arr!9871 (Array (_ BitVec 32) (_ BitVec 64))) (size!10223 (_ BitVec 32))) )
))
(declare-fun a!4289 () array!20787)

(assert (=> b!364983 (= res!204052 (and (bvslt (size!10223 a!4289) #b01111111111111111111111111111111) (bvsge from!3650 #b00000000000000000000000000000000) (bvsle from!3650 (size!10223 a!4289)) (bvsge i!1472 from!3650)))))

(declare-fun b!364984 () Bool)

(declare-fun res!204049 () Bool)

(assert (=> b!364984 (=> (not res!204049) (not e!223414))))

(assert (=> b!364984 (= res!204049 (not (validKeyInArray!0 (select (arr!9871 a!4289) i!1472))))))

(declare-fun b!364985 () Bool)

(declare-fun e!223413 () Bool)

(declare-fun e!223412 () Bool)

(assert (=> b!364985 (= e!223413 (not e!223412))))

(declare-fun res!204048 () Bool)

(assert (=> b!364985 (=> res!204048 e!223412)))

(declare-fun lt!169051 () (_ BitVec 32))

(declare-fun lt!169057 () (_ BitVec 32))

(assert (=> b!364985 (= res!204048 (or (bvsgt (bvsub from!3650 #b00000000000000000000000000000001) (size!10223 a!4289)) (bvslt i!1472 (bvsub from!3650 #b00000000000000000000000000000001)) (not (= lt!169057 (bvadd #b00000000000000000000000000000001 lt!169051)))))))

(declare-fun lt!169056 () (_ BitVec 32))

(declare-fun lt!169053 () (_ BitVec 32))

(assert (=> b!364985 (= (bvadd lt!169056 lt!169053) lt!169057)))

(declare-fun lt!169055 () array!20787)

(declare-fun arrayCountValidKeys!0 (array!20787 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!364985 (= lt!169057 (arrayCountValidKeys!0 lt!169055 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!364985 (= lt!169056 (arrayCountValidKeys!0 lt!169055 (bvsub from!3650 #b00000000000000000000000000000001) from!3650))))

(declare-datatypes ((Unit!11376 0))(
  ( (Unit!11377) )
))
(declare-fun lt!169052 () Unit!11376)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!20787 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11376)

(assert (=> b!364985 (= lt!169052 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!169055 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(declare-fun lt!169058 () (_ BitVec 32))

(declare-fun lt!169060 () (_ BitVec 32))

(assert (=> b!364985 (= (bvadd lt!169058 lt!169060) lt!169051)))

(assert (=> b!364985 (= lt!169051 (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!364985 (= lt!169058 (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) from!3650))))

(declare-fun lt!169054 () Unit!11376)

(assert (=> b!364985 (= lt!169054 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(declare-fun b!364986 () Bool)

(assert (=> b!364986 (= e!223412 true)))

(assert (=> b!364986 (= (arrayCountValidKeys!0 lt!169055 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1472)) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 a!4289 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1472))))))

(declare-fun lt!169059 () Unit!11376)

(declare-fun lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 (array!20787 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!11376)

(assert (=> b!364986 (= lt!169059 (lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 a!4289 i!1472 k!2974 (bvsub from!3650 #b00000000000000000000000000000001)))))

(declare-fun res!204051 () Bool)

(assert (=> start!36528 (=> (not res!204051) (not e!223414))))

(assert (=> start!36528 (= res!204051 (and (bvsge i!1472 #b00000000000000000000000000000000) (bvslt i!1472 (size!10223 a!4289))))))

(assert (=> start!36528 e!223414))

(assert (=> start!36528 true))

(declare-fun array_inv!7313 (array!20787) Bool)

(assert (=> start!36528 (array_inv!7313 a!4289)))

(declare-fun b!364987 () Bool)

(assert (=> b!364987 (= e!223414 e!223413)))

(declare-fun res!204047 () Bool)

(assert (=> b!364987 (=> (not res!204047) (not e!223413))))

(assert (=> b!364987 (= res!204047 (and (= lt!169053 (bvadd #b00000000000000000000000000000001 lt!169060)) (bvsgt from!3650 #b00000000000000000000000000000000)))))

(assert (=> b!364987 (= lt!169053 (arrayCountValidKeys!0 lt!169055 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!364987 (= lt!169060 (arrayCountValidKeys!0 a!4289 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!364987 (= lt!169055 (array!20788 (store (arr!9871 a!4289) i!1472 k!2974) (size!10223 a!4289)))))

(assert (= (and start!36528 res!204051) b!364984))

(assert (= (and b!364984 res!204049) b!364982))

(assert (= (and b!364982 res!204050) b!364983))

(assert (= (and b!364983 res!204052) b!364987))

(assert (= (and b!364987 res!204047) b!364985))

(assert (= (and b!364985 (not res!204048)) b!364986))

(declare-fun m!362771 () Bool)

(assert (=> b!364986 m!362771))

(declare-fun m!362773 () Bool)

(assert (=> b!364986 m!362773))

(declare-fun m!362775 () Bool)

(assert (=> b!364986 m!362775))

(declare-fun m!362777 () Bool)

(assert (=> start!36528 m!362777))

(declare-fun m!362779 () Bool)

(assert (=> b!364984 m!362779))

(assert (=> b!364984 m!362779))

(declare-fun m!362781 () Bool)

(assert (=> b!364984 m!362781))

(declare-fun m!362783 () Bool)

(assert (=> b!364987 m!362783))

(declare-fun m!362785 () Bool)

(assert (=> b!364987 m!362785))

(declare-fun m!362787 () Bool)

(assert (=> b!364987 m!362787))

(declare-fun m!362789 () Bool)

(assert (=> b!364982 m!362789))

(declare-fun m!362791 () Bool)

(assert (=> b!364985 m!362791))

(declare-fun m!362793 () Bool)

(assert (=> b!364985 m!362793))

(declare-fun m!362795 () Bool)

(assert (=> b!364985 m!362795))

(declare-fun m!362797 () Bool)

(assert (=> b!364985 m!362797))

(declare-fun m!362799 () Bool)

(assert (=> b!364985 m!362799))

(declare-fun m!362801 () Bool)

(assert (=> b!364985 m!362801))

(push 1)

(assert (not b!364985))

(assert (not b!364984))

(assert (not b!364987))

(assert (not b!364982))

(assert (not b!364986))

(assert (not start!36528))

(check-sat)

