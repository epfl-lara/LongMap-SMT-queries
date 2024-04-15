; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92248 () Bool)

(assert start!92248)

(declare-fun res!697474 () Bool)

(declare-fun e!594552 () Bool)

(assert (=> start!92248 (=> (not res!697474) (not e!594552))))

(declare-fun i!1381 () (_ BitVec 32))

(declare-datatypes ((array!65990 0))(
  ( (array!65991 (arr!31734 (Array (_ BitVec 32) (_ BitVec 64))) (size!32272 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!65990)

(assert (=> start!92248 (= res!697474 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32272 a!3488)) (bvslt (size!32272 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92248 e!594552))

(assert (=> start!92248 true))

(declare-fun array_inv!24517 (array!65990) Bool)

(assert (=> start!92248 (array_inv!24517 a!3488)))

(declare-fun b!1048259 () Bool)

(declare-fun e!594553 () Bool)

(assert (=> b!1048259 (= e!594552 e!594553)))

(declare-fun res!697472 () Bool)

(assert (=> b!1048259 (=> (not res!697472) (not e!594553))))

(declare-fun lt!462987 () array!65990)

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!65990 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1048259 (= res!697472 (arrayContainsKey!0 lt!462987 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1048259 (= lt!462987 (array!65991 (store (arr!31734 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32272 a!3488)))))

(declare-fun b!1048260 () Bool)

(declare-fun e!594555 () Bool)

(assert (=> b!1048260 (= e!594553 e!594555)))

(declare-fun res!697471 () Bool)

(assert (=> b!1048260 (=> (not res!697471) (not e!594555))))

(declare-fun lt!462988 () (_ BitVec 32))

(assert (=> b!1048260 (= res!697471 (not (= lt!462988 i!1381)))))

(declare-fun arrayScanForKey!0 (array!65990 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1048260 (= lt!462988 (arrayScanForKey!0 lt!462987 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1048261 () Bool)

(assert (=> b!1048261 (= e!594555 (not true))))

(assert (=> b!1048261 (= (select (store (arr!31734 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!462988) k0!2747)))

(declare-fun b!1048262 () Bool)

(declare-fun res!697473 () Bool)

(assert (=> b!1048262 (=> (not res!697473) (not e!594552))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1048262 (= res!697473 (validKeyInArray!0 k0!2747))))

(declare-fun b!1048263 () Bool)

(declare-fun res!697469 () Bool)

(assert (=> b!1048263 (=> (not res!697469) (not e!594552))))

(assert (=> b!1048263 (= res!697469 (= (select (arr!31734 a!3488) i!1381) k0!2747))))

(declare-fun b!1048264 () Bool)

(declare-fun res!697470 () Bool)

(assert (=> b!1048264 (=> (not res!697470) (not e!594552))))

(declare-datatypes ((List!22105 0))(
  ( (Nil!22102) (Cons!22101 (h!23310 (_ BitVec 64)) (t!31403 List!22105)) )
))
(declare-fun arrayNoDuplicates!0 (array!65990 (_ BitVec 32) List!22105) Bool)

(assert (=> b!1048264 (= res!697470 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22102))))

(assert (= (and start!92248 res!697474) b!1048264))

(assert (= (and b!1048264 res!697470) b!1048262))

(assert (= (and b!1048262 res!697473) b!1048263))

(assert (= (and b!1048263 res!697469) b!1048259))

(assert (= (and b!1048259 res!697472) b!1048260))

(assert (= (and b!1048260 res!697471) b!1048261))

(declare-fun m!968767 () Bool)

(assert (=> b!1048264 m!968767))

(declare-fun m!968769 () Bool)

(assert (=> start!92248 m!968769))

(declare-fun m!968771 () Bool)

(assert (=> b!1048262 m!968771))

(declare-fun m!968773 () Bool)

(assert (=> b!1048261 m!968773))

(declare-fun m!968775 () Bool)

(assert (=> b!1048261 m!968775))

(declare-fun m!968777 () Bool)

(assert (=> b!1048259 m!968777))

(assert (=> b!1048259 m!968773))

(declare-fun m!968779 () Bool)

(assert (=> b!1048260 m!968779))

(declare-fun m!968781 () Bool)

(assert (=> b!1048263 m!968781))

(check-sat (not b!1048260) (not b!1048259) (not b!1048264) (not start!92248) (not b!1048262))
(check-sat)
