; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92186 () Bool)

(assert start!92186)

(declare-fun res!697296 () Bool)

(declare-fun e!594438 () Bool)

(assert (=> start!92186 (=> (not res!697296) (not e!594438))))

(declare-fun i!1381 () (_ BitVec 32))

(declare-datatypes ((array!66014 0))(
  ( (array!66015 (arr!31748 (Array (_ BitVec 32) (_ BitVec 64))) (size!32284 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66014)

(assert (=> start!92186 (= res!697296 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32284 a!3488)) (bvslt (size!32284 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92186 e!594438))

(assert (=> start!92186 true))

(declare-fun array_inv!24528 (array!66014) Bool)

(assert (=> start!92186 (array_inv!24528 a!3488)))

(declare-fun b!1048134 () Bool)

(declare-fun res!697298 () Bool)

(assert (=> b!1048134 (=> (not res!697298) (not e!594438))))

(declare-datatypes ((List!22060 0))(
  ( (Nil!22057) (Cons!22056 (h!23265 (_ BitVec 64)) (t!31367 List!22060)) )
))
(declare-fun arrayNoDuplicates!0 (array!66014 (_ BitVec 32) List!22060) Bool)

(assert (=> b!1048134 (= res!697298 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22057))))

(declare-fun b!1048135 () Bool)

(declare-fun res!697297 () Bool)

(assert (=> b!1048135 (=> (not res!697297) (not e!594438))))

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1048135 (= res!697297 (validKeyInArray!0 k0!2747))))

(declare-fun b!1048136 () Bool)

(assert (=> b!1048136 (= e!594438 (and (= (select (arr!31748 a!3488) i!1381) k0!2747) (bvsge #b00000000000000000000000000000000 (size!32284 a!3488))))))

(assert (= (and start!92186 res!697296) b!1048134))

(assert (= (and b!1048134 res!697298) b!1048135))

(assert (= (and b!1048135 res!697297) b!1048136))

(declare-fun m!969163 () Bool)

(assert (=> start!92186 m!969163))

(declare-fun m!969165 () Bool)

(assert (=> b!1048134 m!969165))

(declare-fun m!969167 () Bool)

(assert (=> b!1048135 m!969167))

(declare-fun m!969169 () Bool)

(assert (=> b!1048136 m!969169))

(check-sat (not start!92186) (not b!1048135) (not b!1048134))
(check-sat)
