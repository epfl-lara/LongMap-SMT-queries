; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92570 () Bool)

(assert start!92570)

(declare-fun res!702029 () Bool)

(declare-fun e!597867 () Bool)

(assert (=> start!92570 (=> (not res!702029) (not e!597867))))

(declare-fun i!1381 () (_ BitVec 32))

(declare-datatypes ((array!66371 0))(
  ( (array!66372 (arr!31925 (Array (_ BitVec 32) (_ BitVec 64))) (size!32461 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66371)

(assert (=> start!92570 (= res!702029 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32461 a!3488)) (bvslt (size!32461 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92570 e!597867))

(assert (=> start!92570 true))

(declare-fun array_inv!24705 (array!66371) Bool)

(assert (=> start!92570 (array_inv!24705 a!3488)))

(declare-fun b!1052903 () Bool)

(assert (=> b!1052903 (= e!597867 false)))

(declare-fun lt!465006 () Bool)

(declare-datatypes ((List!22237 0))(
  ( (Nil!22234) (Cons!22233 (h!23442 (_ BitVec 64)) (t!31544 List!22237)) )
))
(declare-fun arrayNoDuplicates!0 (array!66371 (_ BitVec 32) List!22237) Bool)

(assert (=> b!1052903 (= lt!465006 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22234))))

(assert (= (and start!92570 res!702029) b!1052903))

(declare-fun m!973305 () Bool)

(assert (=> start!92570 m!973305))

(declare-fun m!973307 () Bool)

(assert (=> b!1052903 m!973307))

(check-sat (not start!92570) (not b!1052903))
