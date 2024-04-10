; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92188 () Bool)

(assert start!92188)

(declare-fun res!697305 () Bool)

(declare-fun e!594445 () Bool)

(assert (=> start!92188 (=> (not res!697305) (not e!594445))))

(declare-fun i!1381 () (_ BitVec 32))

(declare-datatypes ((array!66016 0))(
  ( (array!66017 (arr!31749 (Array (_ BitVec 32) (_ BitVec 64))) (size!32285 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66016)

(assert (=> start!92188 (= res!697305 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32285 a!3488)) (bvslt (size!32285 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92188 e!594445))

(assert (=> start!92188 true))

(declare-fun array_inv!24529 (array!66016) Bool)

(assert (=> start!92188 (array_inv!24529 a!3488)))

(declare-fun b!1048143 () Bool)

(declare-fun res!697306 () Bool)

(assert (=> b!1048143 (=> (not res!697306) (not e!594445))))

(declare-datatypes ((List!22061 0))(
  ( (Nil!22058) (Cons!22057 (h!23266 (_ BitVec 64)) (t!31368 List!22061)) )
))
(declare-fun arrayNoDuplicates!0 (array!66016 (_ BitVec 32) List!22061) Bool)

(assert (=> b!1048143 (= res!697306 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22058))))

(declare-fun b!1048144 () Bool)

(declare-fun res!697307 () Bool)

(assert (=> b!1048144 (=> (not res!697307) (not e!594445))))

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1048144 (= res!697307 (validKeyInArray!0 k!2747))))

(declare-fun b!1048145 () Bool)

(assert (=> b!1048145 (= e!594445 (and (= (select (arr!31749 a!3488) i!1381) k!2747) (bvsge #b00000000000000000000000000000000 (size!32285 a!3488))))))

(assert (= (and start!92188 res!697305) b!1048143))

(assert (= (and b!1048143 res!697306) b!1048144))

(assert (= (and b!1048144 res!697307) b!1048145))

(declare-fun m!969171 () Bool)

(assert (=> start!92188 m!969171))

(declare-fun m!969173 () Bool)

(assert (=> b!1048143 m!969173))

(declare-fun m!969175 () Bool)

(assert (=> b!1048144 m!969175))

(declare-fun m!969177 () Bool)

(assert (=> b!1048145 m!969177))

(push 1)

(assert (not b!1048144))

(assert (not b!1048143))

(assert (not start!92188))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

