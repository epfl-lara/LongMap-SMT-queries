; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92204 () Bool)

(assert start!92204)

(declare-fun res!697367 () Bool)

(declare-fun e!594492 () Bool)

(assert (=> start!92204 (=> (not res!697367) (not e!594492))))

(declare-fun i!1381 () (_ BitVec 32))

(declare-datatypes ((array!66032 0))(
  ( (array!66033 (arr!31757 (Array (_ BitVec 32) (_ BitVec 64))) (size!32293 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66032)

(assert (=> start!92204 (= res!697367 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32293 a!3488)) (bvslt (size!32293 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92204 e!594492))

(assert (=> start!92204 true))

(declare-fun array_inv!24537 (array!66032) Bool)

(assert (=> start!92204 (array_inv!24537 a!3488)))

(declare-fun b!1048205 () Bool)

(assert (=> b!1048205 (= e!594492 false)))

(declare-fun lt!463134 () Bool)

(declare-datatypes ((List!22069 0))(
  ( (Nil!22066) (Cons!22065 (h!23274 (_ BitVec 64)) (t!31376 List!22069)) )
))
(declare-fun arrayNoDuplicates!0 (array!66032 (_ BitVec 32) List!22069) Bool)

(assert (=> b!1048205 (= lt!463134 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22066))))

(assert (= (and start!92204 res!697367) b!1048205))

(declare-fun m!969231 () Bool)

(assert (=> start!92204 m!969231))

(declare-fun m!969233 () Bool)

(assert (=> b!1048205 m!969233))

(check-sat (not start!92204) (not b!1048205))
