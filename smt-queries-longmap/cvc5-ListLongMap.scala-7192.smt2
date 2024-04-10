; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92184 () Bool)

(assert start!92184)

(declare-fun res!697289 () Bool)

(declare-fun e!594433 () Bool)

(assert (=> start!92184 (=> (not res!697289) (not e!594433))))

(declare-fun i!1381 () (_ BitVec 32))

(declare-datatypes ((array!66012 0))(
  ( (array!66013 (arr!31747 (Array (_ BitVec 32) (_ BitVec 64))) (size!32283 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66012)

(assert (=> start!92184 (= res!697289 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32283 a!3488)) (bvslt (size!32283 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92184 e!594433))

(assert (=> start!92184 true))

(declare-fun array_inv!24527 (array!66012) Bool)

(assert (=> start!92184 (array_inv!24527 a!3488)))

(declare-fun b!1048125 () Bool)

(declare-fun res!697288 () Bool)

(assert (=> b!1048125 (=> (not res!697288) (not e!594433))))

(declare-datatypes ((List!22059 0))(
  ( (Nil!22056) (Cons!22055 (h!23264 (_ BitVec 64)) (t!31366 List!22059)) )
))
(declare-fun arrayNoDuplicates!0 (array!66012 (_ BitVec 32) List!22059) Bool)

(assert (=> b!1048125 (= res!697288 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22056))))

(declare-fun b!1048126 () Bool)

(declare-fun res!697287 () Bool)

(assert (=> b!1048126 (=> (not res!697287) (not e!594433))))

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1048126 (= res!697287 (validKeyInArray!0 k!2747))))

(declare-fun b!1048127 () Bool)

(assert (=> b!1048127 (= e!594433 (and (= (select (arr!31747 a!3488) i!1381) k!2747) (bvsge #b00000000000000000000000000000000 (size!32283 a!3488))))))

(assert (= (and start!92184 res!697289) b!1048125))

(assert (= (and b!1048125 res!697288) b!1048126))

(assert (= (and b!1048126 res!697287) b!1048127))

(declare-fun m!969155 () Bool)

(assert (=> start!92184 m!969155))

(declare-fun m!969157 () Bool)

(assert (=> b!1048125 m!969157))

(declare-fun m!969159 () Bool)

(assert (=> b!1048126 m!969159))

(declare-fun m!969161 () Bool)

(assert (=> b!1048127 m!969161))

(push 1)

(assert (not start!92184))

(assert (not b!1048126))

(assert (not b!1048125))

(check-sat)

(pop 1)

