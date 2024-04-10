; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92192 () Bool)

(assert start!92192)

(declare-fun res!697313 () Bool)

(declare-fun e!594456 () Bool)

(assert (=> start!92192 (=> (not res!697313) (not e!594456))))

(declare-fun i!1381 () (_ BitVec 32))

(declare-datatypes ((array!66020 0))(
  ( (array!66021 (arr!31751 (Array (_ BitVec 32) (_ BitVec 64))) (size!32287 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66020)

(assert (=> start!92192 (= res!697313 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32287 a!3488)) (bvslt (size!32287 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92192 e!594456))

(assert (=> start!92192 true))

(declare-fun array_inv!24531 (array!66020) Bool)

(assert (=> start!92192 (array_inv!24531 a!3488)))

(declare-fun b!1048151 () Bool)

(assert (=> b!1048151 (= e!594456 false)))

(declare-fun lt!463125 () Bool)

(declare-datatypes ((List!22063 0))(
  ( (Nil!22060) (Cons!22059 (h!23268 (_ BitVec 64)) (t!31370 List!22063)) )
))
(declare-fun arrayNoDuplicates!0 (array!66020 (_ BitVec 32) List!22063) Bool)

(assert (=> b!1048151 (= lt!463125 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22060))))

(assert (= (and start!92192 res!697313) b!1048151))

(declare-fun m!969183 () Bool)

(assert (=> start!92192 m!969183))

(declare-fun m!969185 () Bool)

(assert (=> b!1048151 m!969185))

(check-sat (not start!92192) (not b!1048151))
