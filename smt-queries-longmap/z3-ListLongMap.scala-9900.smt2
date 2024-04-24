; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117376 () Bool)

(assert start!117376)

(declare-fun b!1380070 () Bool)

(declare-fun e!781913 () Bool)

(declare-fun from!3466 () (_ BitVec 32))

(declare-fun i!1451 () (_ BitVec 32))

(assert (=> b!1380070 (= e!781913 (and (bvsle from!3466 #b00000000000000000000000000000000) (bvsgt #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1451))))))

(declare-fun res!921819 () Bool)

(assert (=> start!117376 (=> (not res!921819) (not e!781913))))

(declare-datatypes ((array!93877 0))(
  ( (array!93878 (arr!45334 (Array (_ BitVec 32) (_ BitVec 64))) (size!45885 (_ BitVec 32))) )
))
(declare-fun a!4094 () array!93877)

(assert (=> start!117376 (= res!921819 (and (bvsge i!1451 #b00000000000000000000000000000000) (bvslt i!1451 (size!45885 a!4094))))))

(assert (=> start!117376 e!781913))

(assert (=> start!117376 true))

(declare-fun array_inv!34615 (array!93877) Bool)

(assert (=> start!117376 (array_inv!34615 a!4094)))

(declare-fun b!1380071 () Bool)

(declare-fun res!921816 () Bool)

(assert (=> b!1380071 (=> (not res!921816) (not e!781913))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1380071 (= res!921816 (validKeyInArray!0 (select (arr!45334 a!4094) i!1451)))))

(declare-fun b!1380072 () Bool)

(declare-fun res!921818 () Bool)

(assert (=> b!1380072 (=> (not res!921818) (not e!781913))))

(declare-fun k0!2953 () (_ BitVec 64))

(assert (=> b!1380072 (= res!921818 (not (validKeyInArray!0 k0!2953)))))

(declare-fun b!1380073 () Bool)

(declare-fun res!921817 () Bool)

(assert (=> b!1380073 (=> (not res!921817) (not e!781913))))

(declare-fun arrayCountValidKeys!0 (array!93877 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1380073 (= res!921817 (= (arrayCountValidKeys!0 (array!93878 (store (arr!45334 a!4094) i!1451 k0!2953) (size!45885 a!4094)) from!3466 (bvadd #b00000000000000000000000000000001 i!1451)) (bvsub (arrayCountValidKeys!0 a!4094 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)) #b00000000000000000000000000000001)))))

(declare-fun b!1380074 () Bool)

(declare-fun res!921815 () Bool)

(assert (=> b!1380074 (=> (not res!921815) (not e!781913))))

(assert (=> b!1380074 (= res!921815 (and (bvslt (size!45885 a!4094) #b01111111111111111111111111111111) (bvsge from!3466 #b00000000000000000000000000000000) (bvsle from!3466 (size!45885 a!4094)) (bvsge i!1451 from!3466)))))

(assert (= (and start!117376 res!921819) b!1380071))

(assert (= (and b!1380071 res!921816) b!1380072))

(assert (= (and b!1380072 res!921818) b!1380074))

(assert (= (and b!1380074 res!921815) b!1380073))

(assert (= (and b!1380073 res!921817) b!1380070))

(declare-fun m!1265215 () Bool)

(assert (=> start!117376 m!1265215))

(declare-fun m!1265217 () Bool)

(assert (=> b!1380071 m!1265217))

(assert (=> b!1380071 m!1265217))

(declare-fun m!1265219 () Bool)

(assert (=> b!1380071 m!1265219))

(declare-fun m!1265221 () Bool)

(assert (=> b!1380072 m!1265221))

(declare-fun m!1265223 () Bool)

(assert (=> b!1380073 m!1265223))

(declare-fun m!1265225 () Bool)

(assert (=> b!1380073 m!1265225))

(declare-fun m!1265227 () Bool)

(assert (=> b!1380073 m!1265227))

(check-sat (not b!1380071) (not b!1380072) (not b!1380073) (not start!117376))
(check-sat)
