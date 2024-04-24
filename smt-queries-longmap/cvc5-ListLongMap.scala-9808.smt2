; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116726 () Bool)

(assert start!116726)

(declare-fun b!1375518 () Bool)

(declare-fun e!779346 () Bool)

(assert (=> b!1375518 (= e!779346 true)))

(declare-fun lt!603816 () (_ BitVec 32))

(declare-datatypes ((array!93317 0))(
  ( (array!93318 (arr!45060 (Array (_ BitVec 32) (_ BitVec 64))) (size!45611 (_ BitVec 32))) )
))
(declare-fun a!4142 () array!93317)

(declare-fun i!1457 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93317 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1375518 (= lt!603816 (arrayCountValidKeys!0 a!4142 (bvadd #b00000000000000000000000000000001 i!1457) (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun lt!603814 () (_ BitVec 32))

(declare-fun lt!603813 () array!93317)

(assert (=> b!1375518 (= lt!603814 (arrayCountValidKeys!0 lt!603813 (bvadd #b00000000000000000000000000000001 i!1457) (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun b!1375519 () Bool)

(declare-fun e!779345 () Bool)

(assert (=> b!1375519 (= e!779345 (not e!779346))))

(declare-fun res!917925 () Bool)

(assert (=> b!1375519 (=> res!917925 e!779346)))

(assert (=> b!1375519 (= res!917925 (or (bvslt (bvadd #b00000000000000000000000000000001 i!1457) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1457) i!1457)))))

(assert (=> b!1375519 (= (arrayCountValidKeys!0 lt!603813 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)) (bvsub (arrayCountValidKeys!0 a!4142 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)) #b00000000000000000000000000000001))))

(declare-fun k!2959 () (_ BitVec 64))

(assert (=> b!1375519 (= lt!603813 (array!93318 (store (arr!45060 a!4142) i!1457 k!2959) (size!45611 a!4142)))))

(declare-datatypes ((Unit!45354 0))(
  ( (Unit!45355) )
))
(declare-fun lt!603815 () Unit!45354)

(declare-fun lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 (array!93317 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45354)

(assert (=> b!1375519 (= lt!603815 (lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 a!4142 i!1457 k!2959 i!1457))))

(declare-fun res!917924 () Bool)

(assert (=> start!116726 (=> (not res!917924) (not e!779345))))

(assert (=> start!116726 (= res!917924 (and (bvsge i!1457 #b00000000000000000000000000000000) (bvslt i!1457 (size!45611 a!4142))))))

(assert (=> start!116726 e!779345))

(assert (=> start!116726 true))

(declare-fun array_inv!34341 (array!93317) Bool)

(assert (=> start!116726 (array_inv!34341 a!4142)))

(declare-fun b!1375520 () Bool)

(declare-fun res!917921 () Bool)

(assert (=> b!1375520 (=> (not res!917921) (not e!779345))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1375520 (= res!917921 (validKeyInArray!0 (select (arr!45060 a!4142) i!1457)))))

(declare-fun b!1375521 () Bool)

(declare-fun res!917923 () Bool)

(assert (=> b!1375521 (=> (not res!917923) (not e!779345))))

(assert (=> b!1375521 (= res!917923 (bvslt (size!45611 a!4142) #b01111111111111111111111111111111))))

(declare-fun b!1375522 () Bool)

(declare-fun res!917922 () Bool)

(assert (=> b!1375522 (=> (not res!917922) (not e!779345))))

(assert (=> b!1375522 (= res!917922 (not (validKeyInArray!0 k!2959)))))

(assert (= (and start!116726 res!917924) b!1375520))

(assert (= (and b!1375520 res!917921) b!1375522))

(assert (= (and b!1375522 res!917922) b!1375521))

(assert (= (and b!1375521 res!917923) b!1375519))

(assert (= (and b!1375519 (not res!917925)) b!1375518))

(declare-fun m!1259069 () Bool)

(assert (=> b!1375520 m!1259069))

(assert (=> b!1375520 m!1259069))

(declare-fun m!1259071 () Bool)

(assert (=> b!1375520 m!1259071))

(declare-fun m!1259073 () Bool)

(assert (=> b!1375522 m!1259073))

(declare-fun m!1259075 () Bool)

(assert (=> start!116726 m!1259075))

(declare-fun m!1259077 () Bool)

(assert (=> b!1375519 m!1259077))

(declare-fun m!1259079 () Bool)

(assert (=> b!1375519 m!1259079))

(declare-fun m!1259081 () Bool)

(assert (=> b!1375519 m!1259081))

(declare-fun m!1259083 () Bool)

(assert (=> b!1375519 m!1259083))

(declare-fun m!1259085 () Bool)

(assert (=> b!1375518 m!1259085))

(declare-fun m!1259087 () Bool)

(assert (=> b!1375518 m!1259087))

(push 1)

(assert (not b!1375519))

(assert (not b!1375520))

(assert (not start!116726))

(assert (not b!1375522))

(assert (not b!1375518))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

