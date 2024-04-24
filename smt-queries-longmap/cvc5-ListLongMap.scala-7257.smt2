; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92872 () Bool)

(assert start!92872)

(declare-fun res!702713 () Bool)

(declare-fun e!598896 () Bool)

(assert (=> start!92872 (=> (not res!702713) (not e!598896))))

(declare-fun i!1381 () (_ BitVec 32))

(declare-datatypes ((array!66461 0))(
  ( (array!66462 (arr!31962 (Array (_ BitVec 32) (_ BitVec 64))) (size!32499 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66461)

(assert (=> start!92872 (= res!702713 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32499 a!3488)) (bvslt (size!32499 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92872 e!598896))

(assert (=> start!92872 true))

(declare-fun array_inv!24744 (array!66461) Bool)

(assert (=> start!92872 (array_inv!24744 a!3488)))

(declare-fun b!1054428 () Bool)

(assert (=> b!1054428 (= e!598896 false)))

(declare-fun lt!465578 () Bool)

(declare-datatypes ((List!22244 0))(
  ( (Nil!22241) (Cons!22240 (h!23458 (_ BitVec 64)) (t!31543 List!22244)) )
))
(declare-fun arrayNoDuplicates!0 (array!66461 (_ BitVec 32) List!22244) Bool)

(assert (=> b!1054428 (= lt!465578 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22241))))

(assert (= (and start!92872 res!702713) b!1054428))

(declare-fun m!975151 () Bool)

(assert (=> start!92872 m!975151))

(declare-fun m!975153 () Bool)

(assert (=> b!1054428 m!975153))

(push 1)

(assert (not start!92872))

(assert (not b!1054428))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

