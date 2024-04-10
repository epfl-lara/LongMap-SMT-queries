; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71876 () Bool)

(assert start!71876)

(declare-fun b!835253 () Bool)

(declare-fun res!568128 () Bool)

(declare-fun e!465971 () Bool)

(assert (=> b!835253 (=> (not res!568128) (not e!465971))))

(declare-fun k!2968 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!835253 (= res!568128 (validKeyInArray!0 k!2968))))

(declare-fun b!835254 () Bool)

(declare-fun res!568125 () Bool)

(assert (=> b!835254 (=> (not res!568125) (not e!465971))))

(declare-datatypes ((array!46786 0))(
  ( (array!46787 (arr!22427 (Array (_ BitVec 32) (_ BitVec 64))) (size!22848 (_ BitVec 32))) )
))
(declare-fun a!4227 () array!46786)

(declare-fun i!1466 () (_ BitVec 32))

(assert (=> b!835254 (= res!568125 (not (validKeyInArray!0 (select (arr!22427 a!4227) i!1466))))))

(declare-fun b!835255 () Bool)

(declare-fun res!568130 () Bool)

(assert (=> b!835255 (=> (not res!568130) (not e!465971))))

(declare-fun to!390 () (_ BitVec 32))

(assert (=> b!835255 (= res!568130 (not (= to!390 (size!22848 a!4227))))))

(declare-fun b!835256 () Bool)

(declare-fun res!568126 () Bool)

(assert (=> b!835256 (=> (not res!568126) (not e!465971))))

(assert (=> b!835256 (= res!568126 (and (bvslt (size!22848 a!4227) #b01111111111111111111111111111111) (bvsge to!390 #b00000000000000000000000000000000) (bvsle to!390 (size!22848 a!4227)) (bvsgt to!390 i!1466)))))

(declare-fun b!835257 () Bool)

(declare-fun res!568129 () Bool)

(assert (=> b!835257 (=> (not res!568129) (not e!465971))))

(declare-fun arrayCountValidKeys!0 (array!46786 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!835257 (= res!568129 (= (arrayCountValidKeys!0 (array!46787 (store (arr!22427 a!4227) i!1466 k!2968) (size!22848 a!4227)) (bvadd #b00000000000000000000000000000001 i!1466) to!390) (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390)))))

(declare-fun b!835258 () Bool)

(assert (=> b!835258 (= e!465971 (or (bvslt (bvadd #b00000000000000000000000000000001 i!1466) #b00000000000000000000000000000000) (bvsge to!390 (size!22848 a!4227))))))

(declare-fun res!568127 () Bool)

(assert (=> start!71876 (=> (not res!568127) (not e!465971))))

(assert (=> start!71876 (= res!568127 (and (bvsge i!1466 #b00000000000000000000000000000000) (bvslt i!1466 (size!22848 a!4227))))))

(assert (=> start!71876 e!465971))

(assert (=> start!71876 true))

(declare-fun array_inv!17874 (array!46786) Bool)

(assert (=> start!71876 (array_inv!17874 a!4227)))

(declare-fun b!835259 () Bool)

(declare-fun res!568124 () Bool)

(assert (=> b!835259 (=> (not res!568124) (not e!465971))))

(assert (=> b!835259 (= res!568124 (validKeyInArray!0 (select (arr!22427 a!4227) to!390)))))

(assert (= (and start!71876 res!568127) b!835254))

(assert (= (and b!835254 res!568125) b!835253))

(assert (= (and b!835253 res!568128) b!835256))

(assert (= (and b!835256 res!568126) b!835257))

(assert (= (and b!835257 res!568129) b!835255))

(assert (= (and b!835255 res!568130) b!835259))

(assert (= (and b!835259 res!568124) b!835258))

(declare-fun m!780405 () Bool)

(assert (=> b!835257 m!780405))

(declare-fun m!780407 () Bool)

(assert (=> b!835257 m!780407))

(declare-fun m!780409 () Bool)

(assert (=> b!835257 m!780409))

(declare-fun m!780411 () Bool)

(assert (=> b!835254 m!780411))

(assert (=> b!835254 m!780411))

(declare-fun m!780413 () Bool)

(assert (=> b!835254 m!780413))

(declare-fun m!780415 () Bool)

(assert (=> start!71876 m!780415))

(declare-fun m!780417 () Bool)

(assert (=> b!835253 m!780417))

(declare-fun m!780419 () Bool)

(assert (=> b!835259 m!780419))

(assert (=> b!835259 m!780419))

(declare-fun m!780421 () Bool)

(assert (=> b!835259 m!780421))

(push 1)

(assert (not b!835254))

(assert (not b!835259))

(assert (not b!835257))

(assert (not b!835253))

(assert (not start!71876))

(check-sat)

(pop 1)

(push 1)

(check-sat)

