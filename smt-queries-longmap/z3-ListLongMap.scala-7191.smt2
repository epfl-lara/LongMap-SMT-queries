; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92180 () Bool)

(assert start!92180)

(declare-fun res!697277 () Bool)

(declare-fun e!594420 () Bool)

(assert (=> start!92180 (=> (not res!697277) (not e!594420))))

(declare-fun i!1381 () (_ BitVec 32))

(declare-datatypes ((array!66008 0))(
  ( (array!66009 (arr!31745 (Array (_ BitVec 32) (_ BitVec 64))) (size!32281 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66008)

(assert (=> start!92180 (= res!697277 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32281 a!3488)) (bvslt (size!32281 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92180 e!594420))

(assert (=> start!92180 true))

(declare-fun array_inv!24525 (array!66008) Bool)

(assert (=> start!92180 (array_inv!24525 a!3488)))

(declare-fun b!1048115 () Bool)

(assert (=> b!1048115 (= e!594420 false)))

(declare-fun lt!463116 () Bool)

(declare-datatypes ((List!22057 0))(
  ( (Nil!22054) (Cons!22053 (h!23262 (_ BitVec 64)) (t!31364 List!22057)) )
))
(declare-fun arrayNoDuplicates!0 (array!66008 (_ BitVec 32) List!22057) Bool)

(assert (=> b!1048115 (= lt!463116 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22054))))

(assert (= (and start!92180 res!697277) b!1048115))

(declare-fun m!969147 () Bool)

(assert (=> start!92180 m!969147))

(declare-fun m!969149 () Bool)

(assert (=> b!1048115 m!969149))

(check-sat (not b!1048115) (not start!92180))
