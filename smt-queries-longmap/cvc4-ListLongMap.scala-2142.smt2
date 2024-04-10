; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36148 () Bool)

(assert start!36148)

(declare-fun b!362500 () Bool)

(declare-fun e!222010 () Bool)

(declare-fun e!222011 () Bool)

(assert (=> b!362500 (= e!222010 (not e!222011))))

(declare-fun res!201790 () Bool)

(assert (=> b!362500 (=> res!201790 e!222011)))

(declare-fun i!1478 () (_ BitVec 32))

(assert (=> b!362500 (= res!201790 (or (bvslt (bvadd #b00000000000000000000000000000001 i!1478) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1478) i!1478)))))

(declare-datatypes ((array!20464 0))(
  ( (array!20465 (arr!9714 (Array (_ BitVec 32) (_ BitVec 64))) (size!10066 (_ BitVec 32))) )
))
(declare-fun lt!166773 () array!20464)

(declare-fun a!4337 () array!20464)

(declare-fun arrayCountValidKeys!0 (array!20464 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!362500 (= (arrayCountValidKeys!0 lt!166773 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478)) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 a!4337 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478))))))

(declare-fun k!2980 () (_ BitVec 64))

(assert (=> b!362500 (= lt!166773 (array!20465 (store (arr!9714 a!4337) i!1478 k!2980) (size!10066 a!4337)))))

(declare-datatypes ((Unit!11128 0))(
  ( (Unit!11129) )
))
(declare-fun lt!166772 () Unit!11128)

(declare-fun lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 (array!20464 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!11128)

(assert (=> b!362500 (= lt!166772 (lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 a!4337 i!1478 k!2980 i!1478))))

(declare-fun b!362501 () Bool)

(assert (=> b!362501 (= e!222011 true)))

(declare-fun lt!166775 () (_ BitVec 32))

(assert (=> b!362501 (= lt!166775 (arrayCountValidKeys!0 a!4337 (bvadd #b00000000000000000000000000000001 i!1478) (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun lt!166774 () (_ BitVec 32))

(assert (=> b!362501 (= lt!166774 (arrayCountValidKeys!0 lt!166773 (bvadd #b00000000000000000000000000000001 i!1478) (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun b!362502 () Bool)

(declare-fun res!201792 () Bool)

(assert (=> b!362502 (=> (not res!201792) (not e!222010))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!362502 (= res!201792 (not (validKeyInArray!0 (select (arr!9714 a!4337) i!1478))))))

(declare-fun b!362503 () Bool)

(declare-fun res!201793 () Bool)

(assert (=> b!362503 (=> (not res!201793) (not e!222010))))

(assert (=> b!362503 (= res!201793 (bvslt (size!10066 a!4337) #b01111111111111111111111111111111))))

(declare-fun res!201789 () Bool)

(assert (=> start!36148 (=> (not res!201789) (not e!222010))))

(assert (=> start!36148 (= res!201789 (and (bvsge i!1478 #b00000000000000000000000000000000) (bvslt i!1478 (size!10066 a!4337))))))

(assert (=> start!36148 e!222010))

(assert (=> start!36148 true))

(declare-fun array_inv!7156 (array!20464) Bool)

(assert (=> start!36148 (array_inv!7156 a!4337)))

(declare-fun b!362504 () Bool)

(declare-fun res!201791 () Bool)

(assert (=> b!362504 (=> (not res!201791) (not e!222010))))

(assert (=> b!362504 (= res!201791 (validKeyInArray!0 k!2980))))

(assert (= (and start!36148 res!201789) b!362502))

(assert (= (and b!362502 res!201792) b!362504))

(assert (= (and b!362504 res!201791) b!362503))

(assert (= (and b!362503 res!201793) b!362500))

(assert (= (and b!362500 (not res!201790)) b!362501))

(declare-fun m!359049 () Bool)

(assert (=> start!36148 m!359049))

(declare-fun m!359051 () Bool)

(assert (=> b!362501 m!359051))

(declare-fun m!359053 () Bool)

(assert (=> b!362501 m!359053))

(declare-fun m!359055 () Bool)

(assert (=> b!362502 m!359055))

(assert (=> b!362502 m!359055))

(declare-fun m!359057 () Bool)

(assert (=> b!362502 m!359057))

(declare-fun m!359059 () Bool)

(assert (=> b!362500 m!359059))

(declare-fun m!359061 () Bool)

(assert (=> b!362500 m!359061))

(declare-fun m!359063 () Bool)

(assert (=> b!362500 m!359063))

(declare-fun m!359065 () Bool)

(assert (=> b!362500 m!359065))

(declare-fun m!359067 () Bool)

(assert (=> b!362504 m!359067))

(push 1)

(assert (not b!362502))

(assert (not start!36148))

(assert (not b!362501))

(assert (not b!362500))

(assert (not b!362504))

(check-sat)

