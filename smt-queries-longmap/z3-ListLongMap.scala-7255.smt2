; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92624 () Bool)

(assert start!92624)

(declare-fun res!702182 () Bool)

(declare-fun e!598011 () Bool)

(assert (=> start!92624 (=> (not res!702182) (not e!598011))))

(declare-fun i!1381 () (_ BitVec 32))

(declare-datatypes ((array!66398 0))(
  ( (array!66399 (arr!31937 (Array (_ BitVec 32) (_ BitVec 64))) (size!32473 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66398)

(assert (=> start!92624 (= res!702182 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32473 a!3488)) (bvslt (size!32473 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92624 e!598011))

(assert (=> start!92624 true))

(declare-fun array_inv!24717 (array!66398) Bool)

(assert (=> start!92624 (array_inv!24717 a!3488)))

(declare-fun b!1053092 () Bool)

(assert (=> b!1053092 (= e!598011 false)))

(declare-fun lt!465042 () Bool)

(declare-datatypes ((List!22249 0))(
  ( (Nil!22246) (Cons!22245 (h!23454 (_ BitVec 64)) (t!31556 List!22249)) )
))
(declare-fun arrayNoDuplicates!0 (array!66398 (_ BitVec 32) List!22249) Bool)

(assert (=> b!1053092 (= lt!465042 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22246))))

(assert (= (and start!92624 res!702182) b!1053092))

(declare-fun m!973455 () Bool)

(assert (=> start!92624 m!973455))

(declare-fun m!973457 () Bool)

(assert (=> b!1053092 m!973457))

(check-sat (not start!92624) (not b!1053092))
