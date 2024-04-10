; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92630 () Bool)

(assert start!92630)

(declare-fun res!702191 () Bool)

(declare-fun e!598029 () Bool)

(assert (=> start!92630 (=> (not res!702191) (not e!598029))))

(declare-fun i!1381 () (_ BitVec 32))

(declare-datatypes ((array!66404 0))(
  ( (array!66405 (arr!31940 (Array (_ BitVec 32) (_ BitVec 64))) (size!32476 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66404)

(assert (=> start!92630 (= res!702191 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32476 a!3488)) (bvslt (size!32476 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92630 e!598029))

(assert (=> start!92630 true))

(declare-fun array_inv!24720 (array!66404) Bool)

(assert (=> start!92630 (array_inv!24720 a!3488)))

(declare-fun b!1053101 () Bool)

(assert (=> b!1053101 (= e!598029 false)))

(declare-fun lt!465051 () Bool)

(declare-datatypes ((List!22252 0))(
  ( (Nil!22249) (Cons!22248 (h!23457 (_ BitVec 64)) (t!31559 List!22252)) )
))
(declare-fun arrayNoDuplicates!0 (array!66404 (_ BitVec 32) List!22252) Bool)

(assert (=> b!1053101 (= lt!465051 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22249))))

(assert (= (and start!92630 res!702191) b!1053101))

(declare-fun m!973467 () Bool)

(assert (=> start!92630 m!973467))

(declare-fun m!973469 () Bool)

(assert (=> b!1053101 m!973469))

(check-sat (not start!92630) (not b!1053101))
