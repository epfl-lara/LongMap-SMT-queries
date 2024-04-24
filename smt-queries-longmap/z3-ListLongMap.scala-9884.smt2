; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117280 () Bool)

(assert start!117280)

(declare-fun res!921100 () Bool)

(declare-fun e!781490 () Bool)

(assert (=> start!117280 (=> (not res!921100) (not e!781490))))

(declare-fun i!1451 () (_ BitVec 32))

(declare-datatypes ((array!93781 0))(
  ( (array!93782 (arr!45286 (Array (_ BitVec 32) (_ BitVec 64))) (size!45837 (_ BitVec 32))) )
))
(declare-fun a!4094 () array!93781)

(assert (=> start!117280 (= res!921100 (and (bvsge i!1451 #b00000000000000000000000000000000) (bvslt i!1451 (size!45837 a!4094))))))

(assert (=> start!117280 e!781490))

(assert (=> start!117280 true))

(declare-fun array_inv!34567 (array!93781) Bool)

(assert (=> start!117280 (array_inv!34567 a!4094)))

(declare-fun b!1379355 () Bool)

(declare-fun res!921101 () Bool)

(assert (=> b!1379355 (=> (not res!921101) (not e!781490))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1379355 (= res!921101 (validKeyInArray!0 (select (arr!45286 a!4094) i!1451)))))

(declare-fun b!1379356 () Bool)

(declare-fun res!921102 () Bool)

(assert (=> b!1379356 (=> (not res!921102) (not e!781490))))

(declare-fun k0!2953 () (_ BitVec 64))

(assert (=> b!1379356 (= res!921102 (not (validKeyInArray!0 k0!2953)))))

(declare-fun b!1379357 () Bool)

(declare-fun from!3466 () (_ BitVec 32))

(assert (=> b!1379357 (= e!781490 (and (bvslt (size!45837 a!4094) #b01111111111111111111111111111111) (bvsge from!3466 #b00000000000000000000000000000000) (bvsle from!3466 (size!45837 a!4094)) (bvsge i!1451 from!3466) (bvsgt from!3466 (bvadd #b00000000000000000000000000000001 i!1451))))))

(assert (= (and start!117280 res!921100) b!1379355))

(assert (= (and b!1379355 res!921101) b!1379356))

(assert (= (and b!1379356 res!921102) b!1379357))

(declare-fun m!1264129 () Bool)

(assert (=> start!117280 m!1264129))

(declare-fun m!1264131 () Bool)

(assert (=> b!1379355 m!1264131))

(assert (=> b!1379355 m!1264131))

(declare-fun m!1264133 () Bool)

(assert (=> b!1379355 m!1264133))

(declare-fun m!1264135 () Bool)

(assert (=> b!1379356 m!1264135))

(check-sat (not start!117280) (not b!1379356) (not b!1379355))
(check-sat)
