; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36510 () Bool)

(assert start!36510)

(declare-fun b!364675 () Bool)

(declare-fun e!223214 () Bool)

(declare-fun e!223213 () Bool)

(assert (=> b!364675 (= e!223214 (not e!223213))))

(declare-fun res!203885 () Bool)

(assert (=> b!364675 (=> res!203885 e!223213)))

(declare-fun from!3650 () (_ BitVec 32))

(declare-fun lt!168763 () (_ BitVec 32))

(declare-fun lt!168762 () (_ BitVec 32))

(declare-fun i!1472 () (_ BitVec 32))

(declare-datatypes ((array!20765 0))(
  ( (array!20766 (arr!9860 (Array (_ BitVec 32) (_ BitVec 64))) (size!10213 (_ BitVec 32))) )
))
(declare-fun a!4289 () array!20765)

(assert (=> b!364675 (= res!203885 (or (bvsgt (bvsub from!3650 #b00000000000000000000000000000001) (size!10213 a!4289)) (bvslt i!1472 (bvsub from!3650 #b00000000000000000000000000000001)) (not (= lt!168763 (bvadd #b00000000000000000000000000000001 lt!168762)))))))

(declare-fun lt!168761 () (_ BitVec 32))

(declare-fun lt!168758 () (_ BitVec 32))

(assert (=> b!364675 (= (bvadd lt!168761 lt!168758) lt!168763)))

(declare-fun lt!168760 () array!20765)

(declare-fun arrayCountValidKeys!0 (array!20765 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!364675 (= lt!168763 (arrayCountValidKeys!0 lt!168760 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!364675 (= lt!168761 (arrayCountValidKeys!0 lt!168760 (bvsub from!3650 #b00000000000000000000000000000001) from!3650))))

(declare-datatypes ((Unit!11350 0))(
  ( (Unit!11351) )
))
(declare-fun lt!168765 () Unit!11350)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!20765 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11350)

(assert (=> b!364675 (= lt!168765 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!168760 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(declare-fun lt!168764 () (_ BitVec 32))

(declare-fun lt!168759 () (_ BitVec 32))

(assert (=> b!364675 (= (bvadd lt!168764 lt!168759) lt!168762)))

(assert (=> b!364675 (= lt!168762 (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!364675 (= lt!168764 (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) from!3650))))

(declare-fun lt!168757 () Unit!11350)

(assert (=> b!364675 (= lt!168757 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(declare-fun b!364677 () Bool)

(declare-fun res!203884 () Bool)

(declare-fun e!223215 () Bool)

(assert (=> b!364677 (=> (not res!203884) (not e!223215))))

(declare-fun k!2974 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!364677 (= res!203884 (validKeyInArray!0 k!2974))))

(declare-fun b!364678 () Bool)

(declare-fun res!203887 () Bool)

(assert (=> b!364678 (=> (not res!203887) (not e!223215))))

(assert (=> b!364678 (= res!203887 (not (validKeyInArray!0 (select (arr!9860 a!4289) i!1472))))))

(declare-fun b!364679 () Bool)

(assert (=> b!364679 (= e!223215 e!223214)))

(declare-fun res!203883 () Bool)

(assert (=> b!364679 (=> (not res!203883) (not e!223214))))

(assert (=> b!364679 (= res!203883 (and (= lt!168758 (bvadd #b00000000000000000000000000000001 lt!168759)) (bvsgt from!3650 #b00000000000000000000000000000000)))))

(assert (=> b!364679 (= lt!168758 (arrayCountValidKeys!0 lt!168760 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!364679 (= lt!168759 (arrayCountValidKeys!0 a!4289 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!364679 (= lt!168760 (array!20766 (store (arr!9860 a!4289) i!1472 k!2974) (size!10213 a!4289)))))

(declare-fun b!364680 () Bool)

(declare-fun res!203886 () Bool)

(assert (=> b!364680 (=> (not res!203886) (not e!223215))))

(assert (=> b!364680 (= res!203886 (and (bvslt (size!10213 a!4289) #b01111111111111111111111111111111) (bvsge from!3650 #b00000000000000000000000000000000) (bvsle from!3650 (size!10213 a!4289)) (bvsge i!1472 from!3650)))))

(declare-fun b!364676 () Bool)

(assert (=> b!364676 (= e!223213 true)))

(assert (=> b!364676 (= (arrayCountValidKeys!0 lt!168760 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1472)) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 a!4289 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1472))))))

(declare-fun lt!168766 () Unit!11350)

(declare-fun lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 (array!20765 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!11350)

(assert (=> b!364676 (= lt!168766 (lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 a!4289 i!1472 k!2974 (bvsub from!3650 #b00000000000000000000000000000001)))))

(declare-fun res!203882 () Bool)

(assert (=> start!36510 (=> (not res!203882) (not e!223215))))

(assert (=> start!36510 (= res!203882 (and (bvsge i!1472 #b00000000000000000000000000000000) (bvslt i!1472 (size!10213 a!4289))))))

(assert (=> start!36510 e!223215))

(assert (=> start!36510 true))

(declare-fun array_inv!7309 (array!20765) Bool)

(assert (=> start!36510 (array_inv!7309 a!4289)))

(assert (= (and start!36510 res!203882) b!364678))

(assert (= (and b!364678 res!203887) b!364677))

(assert (= (and b!364677 res!203884) b!364680))

(assert (= (and b!364680 res!203886) b!364679))

(assert (= (and b!364679 res!203883) b!364675))

(assert (= (and b!364675 (not res!203885)) b!364676))

(declare-fun m!361983 () Bool)

(assert (=> start!36510 m!361983))

(declare-fun m!361985 () Bool)

(assert (=> b!364678 m!361985))

(assert (=> b!364678 m!361985))

(declare-fun m!361987 () Bool)

(assert (=> b!364678 m!361987))

(declare-fun m!361989 () Bool)

(assert (=> b!364677 m!361989))

(declare-fun m!361991 () Bool)

(assert (=> b!364676 m!361991))

(declare-fun m!361993 () Bool)

(assert (=> b!364676 m!361993))

(declare-fun m!361995 () Bool)

(assert (=> b!364676 m!361995))

(declare-fun m!361997 () Bool)

(assert (=> b!364679 m!361997))

(declare-fun m!361999 () Bool)

(assert (=> b!364679 m!361999))

(declare-fun m!362001 () Bool)

(assert (=> b!364679 m!362001))

(declare-fun m!362003 () Bool)

(assert (=> b!364675 m!362003))

(declare-fun m!362005 () Bool)

(assert (=> b!364675 m!362005))

(declare-fun m!362007 () Bool)

(assert (=> b!364675 m!362007))

(declare-fun m!362009 () Bool)

(assert (=> b!364675 m!362009))

(declare-fun m!362011 () Bool)

(assert (=> b!364675 m!362011))

(declare-fun m!362013 () Bool)

(assert (=> b!364675 m!362013))

(push 1)

(assert (not b!364677))

(assert (not b!364676))

(assert (not b!364675))

(assert (not start!36510))

(assert (not b!364678))

(assert (not b!364679))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

