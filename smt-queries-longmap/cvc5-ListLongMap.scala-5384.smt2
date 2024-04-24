; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72072 () Bool)

(assert start!72072)

(declare-datatypes ((array!46819 0))(
  ( (array!46820 (arr!22439 (Array (_ BitVec 32) (_ BitVec 64))) (size!22859 (_ BitVec 32))) )
))
(declare-fun a!4227 () array!46819)

(declare-fun e!466696 () Bool)

(declare-fun b!836448 () Bool)

(declare-fun k!2968 () (_ BitVec 64))

(declare-fun i!1466 () (_ BitVec 32))

(declare-fun to!390 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!836448 (= e!466696 (not (validKeyInArray!0 (select (store (arr!22439 a!4227) i!1466 k!2968) to!390))))))

(declare-fun b!836449 () Bool)

(declare-fun e!466694 () Bool)

(declare-fun e!466693 () Bool)

(assert (=> b!836449 (= e!466694 e!466693)))

(declare-fun res!568773 () Bool)

(assert (=> b!836449 (=> (not res!568773) (not e!466693))))

(declare-fun lt!380125 () (_ BitVec 32))

(declare-fun lt!380126 () (_ BitVec 32))

(assert (=> b!836449 (= res!568773 (and (= lt!380126 lt!380125) (not (= to!390 (size!22859 a!4227)))))))

(declare-fun arrayCountValidKeys!0 (array!46819 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!836449 (= lt!380125 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!836449 (= lt!380126 (arrayCountValidKeys!0 (array!46820 (store (arr!22439 a!4227) i!1466 k!2968) (size!22859 a!4227)) (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun b!836450 () Bool)

(assert (=> b!836450 (= e!466693 (not e!466696))))

(declare-fun res!568771 () Bool)

(assert (=> b!836450 (=> (not res!568771) (not e!466696))))

(assert (=> b!836450 (= res!568771 (and (bvsge (bvadd #b00000000000000000000000000000001 i!1466) #b00000000000000000000000000000000) (bvslt to!390 (size!22859 a!4227))))))

(assert (=> b!836450 (= (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)) lt!380125)))

(declare-datatypes ((Unit!28742 0))(
  ( (Unit!28743) )
))
(declare-fun lt!380124 () Unit!28742)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!46819 (_ BitVec 32) (_ BitVec 32)) Unit!28742)

(assert (=> b!836450 (= lt!380124 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun res!568769 () Bool)

(assert (=> start!72072 (=> (not res!568769) (not e!466694))))

(assert (=> start!72072 (= res!568769 (and (bvsge i!1466 #b00000000000000000000000000000000) (bvslt i!1466 (size!22859 a!4227))))))

(assert (=> start!72072 e!466694))

(assert (=> start!72072 true))

(declare-fun array_inv!17925 (array!46819) Bool)

(assert (=> start!72072 (array_inv!17925 a!4227)))

(declare-fun b!836451 () Bool)

(declare-fun res!568767 () Bool)

(assert (=> b!836451 (=> (not res!568767) (not e!466694))))

(assert (=> b!836451 (= res!568767 (and (bvslt (size!22859 a!4227) #b01111111111111111111111111111111) (bvsge to!390 #b00000000000000000000000000000000) (bvsle to!390 (size!22859 a!4227)) (bvsgt to!390 i!1466)))))

(declare-fun b!836452 () Bool)

(declare-fun res!568770 () Bool)

(assert (=> b!836452 (=> (not res!568770) (not e!466694))))

(assert (=> b!836452 (= res!568770 (validKeyInArray!0 k!2968))))

(declare-fun b!836453 () Bool)

(declare-fun res!568772 () Bool)

(assert (=> b!836453 (=> (not res!568772) (not e!466694))))

(assert (=> b!836453 (= res!568772 (not (validKeyInArray!0 (select (arr!22439 a!4227) i!1466))))))

(declare-fun b!836454 () Bool)

(declare-fun res!568768 () Bool)

(assert (=> b!836454 (=> (not res!568768) (not e!466693))))

(assert (=> b!836454 (= res!568768 (not (validKeyInArray!0 (select (arr!22439 a!4227) to!390))))))

(assert (= (and start!72072 res!568769) b!836453))

(assert (= (and b!836453 res!568772) b!836452))

(assert (= (and b!836452 res!568770) b!836451))

(assert (= (and b!836451 res!568767) b!836449))

(assert (= (and b!836449 res!568773) b!836454))

(assert (= (and b!836454 res!568768) b!836450))

(assert (= (and b!836450 res!568771) b!836448))

(declare-fun m!782033 () Bool)

(assert (=> b!836454 m!782033))

(assert (=> b!836454 m!782033))

(declare-fun m!782035 () Bool)

(assert (=> b!836454 m!782035))

(declare-fun m!782037 () Bool)

(assert (=> start!72072 m!782037))

(declare-fun m!782039 () Bool)

(assert (=> b!836452 m!782039))

(declare-fun m!782041 () Bool)

(assert (=> b!836448 m!782041))

(declare-fun m!782043 () Bool)

(assert (=> b!836448 m!782043))

(assert (=> b!836448 m!782043))

(declare-fun m!782045 () Bool)

(assert (=> b!836448 m!782045))

(declare-fun m!782047 () Bool)

(assert (=> b!836453 m!782047))

(assert (=> b!836453 m!782047))

(declare-fun m!782049 () Bool)

(assert (=> b!836453 m!782049))

(declare-fun m!782051 () Bool)

(assert (=> b!836450 m!782051))

(declare-fun m!782053 () Bool)

(assert (=> b!836450 m!782053))

(declare-fun m!782055 () Bool)

(assert (=> b!836449 m!782055))

(assert (=> b!836449 m!782041))

(declare-fun m!782057 () Bool)

(assert (=> b!836449 m!782057))

(push 1)

(assert (not b!836448))

(assert (not b!836453))

(assert (not b!836454))

(assert (not b!836450))

(assert (not start!72072))

(assert (not b!836452))

(assert (not b!836449))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

