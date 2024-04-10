; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92636 () Bool)

(assert start!92636)

(declare-fun res!702200 () Bool)

(declare-fun e!598047 () Bool)

(assert (=> start!92636 (=> (not res!702200) (not e!598047))))

(declare-fun i!1381 () (_ BitVec 32))

(declare-datatypes ((array!66410 0))(
  ( (array!66411 (arr!31943 (Array (_ BitVec 32) (_ BitVec 64))) (size!32479 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66410)

(assert (=> start!92636 (= res!702200 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32479 a!3488)) (bvslt (size!32479 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92636 e!598047))

(assert (=> start!92636 true))

(declare-fun array_inv!24723 (array!66410) Bool)

(assert (=> start!92636 (array_inv!24723 a!3488)))

(declare-fun b!1053110 () Bool)

(assert (=> b!1053110 (= e!598047 false)))

(declare-fun lt!465060 () Bool)

(declare-datatypes ((List!22255 0))(
  ( (Nil!22252) (Cons!22251 (h!23460 (_ BitVec 64)) (t!31562 List!22255)) )
))
(declare-fun arrayNoDuplicates!0 (array!66410 (_ BitVec 32) List!22255) Bool)

(assert (=> b!1053110 (= lt!465060 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22252))))

(assert (= (and start!92636 res!702200) b!1053110))

(declare-fun m!973479 () Bool)

(assert (=> start!92636 m!973479))

(declare-fun m!973481 () Bool)

(assert (=> b!1053110 m!973481))

(check-sat (not start!92636) (not b!1053110))
