; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36416 () Bool)

(assert start!36416)

(declare-fun b!364221 () Bool)

(declare-fun res!203381 () Bool)

(declare-fun e!222997 () Bool)

(assert (=> b!364221 (=> (not res!203381) (not e!222997))))

(declare-fun from!3650 () (_ BitVec 32))

(declare-fun i!1472 () (_ BitVec 32))

(declare-datatypes ((array!20696 0))(
  ( (array!20697 (arr!9827 (Array (_ BitVec 32) (_ BitVec 64))) (size!10179 (_ BitVec 32))) )
))
(declare-fun a!4289 () array!20696)

(assert (=> b!364221 (= res!203381 (and (bvslt (size!10179 a!4289) #b01111111111111111111111111111111) (bvsge from!3650 #b00000000000000000000000000000000) (bvsle from!3650 (size!10179 a!4289)) (bvsge i!1472 from!3650)))))

(declare-fun b!364219 () Bool)

(declare-fun res!203380 () Bool)

(assert (=> b!364219 (=> (not res!203380) (not e!222997))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!364219 (= res!203380 (not (validKeyInArray!0 (select (arr!9827 a!4289) i!1472))))))

(declare-fun res!203383 () Bool)

(assert (=> start!36416 (=> (not res!203383) (not e!222997))))

(assert (=> start!36416 (= res!203383 (and (bvsge i!1472 #b00000000000000000000000000000000) (bvslt i!1472 (size!10179 a!4289))))))

(assert (=> start!36416 e!222997))

(assert (=> start!36416 true))

(declare-fun array_inv!7269 (array!20696) Bool)

(assert (=> start!36416 (array_inv!7269 a!4289)))

(declare-fun b!364222 () Bool)

(assert (=> b!364222 (= e!222997 false)))

(declare-fun k0!2974 () (_ BitVec 64))

(declare-fun lt!168438 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!20696 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!364222 (= lt!168438 (arrayCountValidKeys!0 (array!20697 (store (arr!9827 a!4289) i!1472 k0!2974) (size!10179 a!4289)) from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-fun lt!168439 () (_ BitVec 32))

(assert (=> b!364222 (= lt!168439 (arrayCountValidKeys!0 a!4289 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-fun b!364220 () Bool)

(declare-fun res!203382 () Bool)

(assert (=> b!364220 (=> (not res!203382) (not e!222997))))

(assert (=> b!364220 (= res!203382 (validKeyInArray!0 k0!2974))))

(assert (= (and start!36416 res!203383) b!364219))

(assert (= (and b!364219 res!203380) b!364220))

(assert (= (and b!364220 res!203382) b!364221))

(assert (= (and b!364221 res!203381) b!364222))

(declare-fun m!361717 () Bool)

(assert (=> b!364219 m!361717))

(assert (=> b!364219 m!361717))

(declare-fun m!361719 () Bool)

(assert (=> b!364219 m!361719))

(declare-fun m!361721 () Bool)

(assert (=> start!36416 m!361721))

(declare-fun m!361723 () Bool)

(assert (=> b!364222 m!361723))

(declare-fun m!361725 () Bool)

(assert (=> b!364222 m!361725))

(declare-fun m!361727 () Bool)

(assert (=> b!364222 m!361727))

(declare-fun m!361729 () Bool)

(assert (=> b!364220 m!361729))

(check-sat (not b!364222) (not b!364220) (not b!364219) (not start!36416))
