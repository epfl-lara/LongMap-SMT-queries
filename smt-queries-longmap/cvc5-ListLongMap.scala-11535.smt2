; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!134294 () Bool)

(assert start!134294)

(declare-fun b!1568398 () Bool)

(declare-fun res!1072089 () Bool)

(declare-fun e!874332 () Bool)

(assert (=> b!1568398 (=> (not res!1072089) (not e!874332))))

(declare-datatypes ((List!36704 0))(
  ( (Nil!36701) (Cons!36700 (h!38147 (_ BitVec 64)) (t!51612 List!36704)) )
))
(declare-fun acc!619 () List!36704)

(declare-fun contains!10406 (List!36704 (_ BitVec 64)) Bool)

(assert (=> b!1568398 (= res!1072089 (not (contains!10406 acc!619 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1568399 () Bool)

(declare-fun res!1072087 () Bool)

(assert (=> b!1568399 (=> (not res!1072087) (not e!874332))))

(declare-fun from!2856 () (_ BitVec 32))

(declare-datatypes ((array!104784 0))(
  ( (array!104785 (arr!50572 (Array (_ BitVec 32) (_ BitVec 64))) (size!51122 (_ BitVec 32))) )
))
(declare-fun a!3481 () array!104784)

(assert (=> b!1568399 (= res!1072087 (bvslt from!2856 (size!51122 a!3481)))))

(declare-fun b!1568400 () Bool)

(declare-fun res!1072084 () Bool)

(assert (=> b!1568400 (=> (not res!1072084) (not e!874332))))

(assert (=> b!1568400 (= res!1072084 (not (contains!10406 acc!619 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!1072088 () Bool)

(assert (=> start!134294 (=> (not res!1072088) (not e!874332))))

(assert (=> start!134294 (= res!1072088 (and (bvsge from!2856 #b00000000000000000000000000000000) (bvsle from!2856 (size!51122 a!3481)) (bvslt (size!51122 a!3481) #b01111111111111111111111111111111)))))

(assert (=> start!134294 e!874332))

(assert (=> start!134294 true))

(declare-fun array_inv!39299 (array!104784) Bool)

(assert (=> start!134294 (array_inv!39299 a!3481)))

(declare-fun b!1568401 () Bool)

(declare-fun e!874333 () Bool)

(assert (=> b!1568401 (= e!874333 (not (contains!10406 acc!619 (select (arr!50572 a!3481) from!2856))))))

(declare-fun b!1568402 () Bool)

(assert (=> b!1568402 (= e!874332 false)))

(declare-fun lt!673177 () Bool)

(assert (=> b!1568402 (= lt!673177 e!874333)))

(declare-fun res!1072086 () Bool)

(assert (=> b!1568402 (=> res!1072086 e!874333)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1568402 (= res!1072086 (not (validKeyInArray!0 (select (arr!50572 a!3481) from!2856))))))

(declare-fun b!1568403 () Bool)

(declare-fun res!1072085 () Bool)

(assert (=> b!1568403 (=> (not res!1072085) (not e!874332))))

(declare-fun noDuplicate!2678 (List!36704) Bool)

(assert (=> b!1568403 (= res!1072085 (noDuplicate!2678 acc!619))))

(assert (= (and start!134294 res!1072088) b!1568403))

(assert (= (and b!1568403 res!1072085) b!1568400))

(assert (= (and b!1568400 res!1072084) b!1568398))

(assert (= (and b!1568398 res!1072089) b!1568399))

(assert (= (and b!1568399 res!1072087) b!1568402))

(assert (= (and b!1568402 (not res!1072086)) b!1568401))

(declare-fun m!1443073 () Bool)

(assert (=> b!1568398 m!1443073))

(declare-fun m!1443075 () Bool)

(assert (=> b!1568402 m!1443075))

(assert (=> b!1568402 m!1443075))

(declare-fun m!1443077 () Bool)

(assert (=> b!1568402 m!1443077))

(assert (=> b!1568401 m!1443075))

(assert (=> b!1568401 m!1443075))

(declare-fun m!1443079 () Bool)

(assert (=> b!1568401 m!1443079))

(declare-fun m!1443081 () Bool)

(assert (=> b!1568400 m!1443081))

(declare-fun m!1443083 () Bool)

(assert (=> start!134294 m!1443083))

(declare-fun m!1443085 () Bool)

(assert (=> b!1568403 m!1443085))

(push 1)

(assert (not b!1568400))

(assert (not b!1568403))

(assert (not b!1568398))

(assert (not b!1568401))

(assert (not start!134294))

(assert (not b!1568402))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

