; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36158 () Bool)

(assert start!36158)

(declare-fun res!201867 () Bool)

(declare-fun e!222057 () Bool)

(assert (=> start!36158 (=> (not res!201867) (not e!222057))))

(declare-fun i!1478 () (_ BitVec 32))

(declare-datatypes ((array!20474 0))(
  ( (array!20475 (arr!9719 (Array (_ BitVec 32) (_ BitVec 64))) (size!10071 (_ BitVec 32))) )
))
(declare-fun a!4337 () array!20474)

(assert (=> start!36158 (= res!201867 (and (bvsge i!1478 #b00000000000000000000000000000000) (bvslt i!1478 (size!10071 a!4337))))))

(assert (=> start!36158 e!222057))

(assert (=> start!36158 true))

(declare-fun array_inv!7161 (array!20474) Bool)

(assert (=> start!36158 (array_inv!7161 a!4337)))

(declare-fun b!362575 () Bool)

(declare-fun res!201864 () Bool)

(assert (=> b!362575 (=> (not res!201864) (not e!222057))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!362575 (= res!201864 (not (validKeyInArray!0 (select (arr!9719 a!4337) i!1478))))))

(declare-fun b!362576 () Bool)

(declare-fun e!222055 () Bool)

(assert (=> b!362576 (= e!222057 (not e!222055))))

(declare-fun res!201865 () Bool)

(assert (=> b!362576 (=> res!201865 e!222055)))

(assert (=> b!362576 (= res!201865 (or (bvslt (bvadd #b00000000000000000000000000000001 i!1478) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1478) i!1478)))))

(declare-fun lt!166832 () array!20474)

(declare-fun arrayCountValidKeys!0 (array!20474 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!362576 (= (arrayCountValidKeys!0 lt!166832 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478)) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 a!4337 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478))))))

(declare-fun k0!2980 () (_ BitVec 64))

(assert (=> b!362576 (= lt!166832 (array!20475 (store (arr!9719 a!4337) i!1478 k0!2980) (size!10071 a!4337)))))

(declare-datatypes ((Unit!11138 0))(
  ( (Unit!11139) )
))
(declare-fun lt!166833 () Unit!11138)

(declare-fun lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 (array!20474 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!11138)

(assert (=> b!362576 (= lt!166833 (lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 a!4337 i!1478 k0!2980 i!1478))))

(declare-fun b!362577 () Bool)

(assert (=> b!362577 (= e!222055 true)))

(declare-fun lt!166835 () (_ BitVec 32))

(assert (=> b!362577 (= lt!166835 (arrayCountValidKeys!0 a!4337 (bvadd #b00000000000000000000000000000001 i!1478) (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun lt!166834 () (_ BitVec 32))

(assert (=> b!362577 (= lt!166834 (arrayCountValidKeys!0 lt!166832 (bvadd #b00000000000000000000000000000001 i!1478) (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun b!362578 () Bool)

(declare-fun res!201866 () Bool)

(assert (=> b!362578 (=> (not res!201866) (not e!222057))))

(assert (=> b!362578 (= res!201866 (validKeyInArray!0 k0!2980))))

(declare-fun b!362579 () Bool)

(declare-fun res!201868 () Bool)

(assert (=> b!362579 (=> (not res!201868) (not e!222057))))

(assert (=> b!362579 (= res!201868 (bvslt (size!10071 a!4337) #b01111111111111111111111111111111))))

(assert (= (and start!36158 res!201867) b!362575))

(assert (= (and b!362575 res!201864) b!362578))

(assert (= (and b!362578 res!201866) b!362579))

(assert (= (and b!362579 res!201868) b!362576))

(assert (= (and b!362576 (not res!201865)) b!362577))

(declare-fun m!359149 () Bool)

(assert (=> b!362576 m!359149))

(declare-fun m!359151 () Bool)

(assert (=> b!362576 m!359151))

(declare-fun m!359153 () Bool)

(assert (=> b!362576 m!359153))

(declare-fun m!359155 () Bool)

(assert (=> b!362576 m!359155))

(declare-fun m!359157 () Bool)

(assert (=> start!36158 m!359157))

(declare-fun m!359159 () Bool)

(assert (=> b!362577 m!359159))

(declare-fun m!359161 () Bool)

(assert (=> b!362577 m!359161))

(declare-fun m!359163 () Bool)

(assert (=> b!362575 m!359163))

(assert (=> b!362575 m!359163))

(declare-fun m!359165 () Bool)

(assert (=> b!362575 m!359165))

(declare-fun m!359167 () Bool)

(assert (=> b!362578 m!359167))

(check-sat (not b!362576) (not b!362578) (not start!36158) (not b!362575) (not b!362577))
