; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117394 () Bool)

(assert start!117394)

(declare-fun b!1380187 () Bool)

(declare-fun res!921935 () Bool)

(declare-fun e!781968 () Bool)

(assert (=> b!1380187 (=> (not res!921935) (not e!781968))))

(declare-datatypes ((array!93895 0))(
  ( (array!93896 (arr!45343 (Array (_ BitVec 32) (_ BitVec 64))) (size!45894 (_ BitVec 32))) )
))
(declare-fun a!4094 () array!93895)

(declare-fun k0!2953 () (_ BitVec 64))

(declare-fun from!3466 () (_ BitVec 32))

(declare-fun i!1451 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93895 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1380187 (= res!921935 (= (arrayCountValidKeys!0 (array!93896 (store (arr!45343 a!4094) i!1451 k0!2953) (size!45894 a!4094)) from!3466 (bvadd #b00000000000000000000000000000001 i!1451)) (bvsub (arrayCountValidKeys!0 a!4094 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)) #b00000000000000000000000000000001)))))

(declare-fun res!921932 () Bool)

(assert (=> start!117394 (=> (not res!921932) (not e!781968))))

(assert (=> start!117394 (= res!921932 (and (bvsge i!1451 #b00000000000000000000000000000000) (bvslt i!1451 (size!45894 a!4094))))))

(assert (=> start!117394 e!781968))

(assert (=> start!117394 true))

(declare-fun array_inv!34624 (array!93895) Bool)

(assert (=> start!117394 (array_inv!34624 a!4094)))

(declare-fun b!1380188 () Bool)

(assert (=> b!1380188 (= e!781968 (and (bvsgt from!3466 #b00000000000000000000000000000000) (or (bvslt (bvadd #b00000000000000000000000000000001 i!1451) (bvsub from!3466 #b00000000000000000000000000000001)) (bvslt from!3466 (bvsub from!3466 #b00000000000000000000000000000001)) (bvsgt from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))))

(declare-fun b!1380189 () Bool)

(declare-fun res!921934 () Bool)

(assert (=> b!1380189 (=> (not res!921934) (not e!781968))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1380189 (= res!921934 (not (validKeyInArray!0 k0!2953)))))

(declare-fun b!1380190 () Bool)

(declare-fun res!921933 () Bool)

(assert (=> b!1380190 (=> (not res!921933) (not e!781968))))

(assert (=> b!1380190 (= res!921933 (validKeyInArray!0 (select (arr!45343 a!4094) i!1451)))))

(declare-fun b!1380191 () Bool)

(declare-fun res!921936 () Bool)

(assert (=> b!1380191 (=> (not res!921936) (not e!781968))))

(assert (=> b!1380191 (= res!921936 (and (bvslt (size!45894 a!4094) #b01111111111111111111111111111111) (bvsge from!3466 #b00000000000000000000000000000000) (bvsle from!3466 (size!45894 a!4094)) (bvsge i!1451 from!3466)))))

(assert (= (and start!117394 res!921932) b!1380190))

(assert (= (and b!1380190 res!921933) b!1380189))

(assert (= (and b!1380189 res!921934) b!1380191))

(assert (= (and b!1380191 res!921936) b!1380187))

(assert (= (and b!1380187 res!921935) b!1380188))

(declare-fun m!1265341 () Bool)

(assert (=> b!1380187 m!1265341))

(declare-fun m!1265343 () Bool)

(assert (=> b!1380187 m!1265343))

(declare-fun m!1265345 () Bool)

(assert (=> b!1380187 m!1265345))

(declare-fun m!1265347 () Bool)

(assert (=> start!117394 m!1265347))

(declare-fun m!1265349 () Bool)

(assert (=> b!1380189 m!1265349))

(declare-fun m!1265351 () Bool)

(assert (=> b!1380190 m!1265351))

(assert (=> b!1380190 m!1265351))

(declare-fun m!1265353 () Bool)

(assert (=> b!1380190 m!1265353))

(check-sat (not start!117394) (not b!1380187) (not b!1380189) (not b!1380190))
(check-sat)
