; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92632 () Bool)

(assert start!92632)

(declare-fun res!702130 () Bool)

(declare-fun e!597950 () Bool)

(assert (=> start!92632 (=> (not res!702130) (not e!597950))))

(declare-fun i!1381 () (_ BitVec 32))

(declare-datatypes ((array!66347 0))(
  ( (array!66348 (arr!31911 (Array (_ BitVec 32) (_ BitVec 64))) (size!32449 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66347)

(assert (=> start!92632 (= res!702130 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32449 a!3488)) (bvslt (size!32449 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92632 e!597950))

(assert (=> start!92632 true))

(declare-fun array_inv!24694 (array!66347) Bool)

(assert (=> start!92632 (array_inv!24694 a!3488)))

(declare-fun b!1052956 () Bool)

(assert (=> b!1052956 (= e!597950 false)))

(declare-fun lt!464857 () Bool)

(declare-datatypes ((List!22282 0))(
  ( (Nil!22279) (Cons!22278 (h!23487 (_ BitVec 64)) (t!31580 List!22282)) )
))
(declare-fun arrayNoDuplicates!0 (array!66347 (_ BitVec 32) List!22282) Bool)

(assert (=> b!1052956 (= lt!464857 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22279))))

(assert (= (and start!92632 res!702130) b!1052956))

(declare-fun m!972859 () Bool)

(assert (=> start!92632 m!972859))

(declare-fun m!972861 () Bool)

(assert (=> b!1052956 m!972861))

(check-sat (not b!1052956) (not start!92632))
(check-sat)
