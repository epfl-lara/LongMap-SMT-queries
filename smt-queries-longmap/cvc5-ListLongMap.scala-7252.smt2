; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92574 () Bool)

(assert start!92574)

(declare-fun b!1052917 () Bool)

(declare-fun res!702046 () Bool)

(declare-fun e!597879 () Bool)

(assert (=> b!1052917 (=> (not res!702046) (not e!597879))))

(declare-datatypes ((array!66375 0))(
  ( (array!66376 (arr!31927 (Array (_ BitVec 32) (_ BitVec 64))) (size!32463 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66375)

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1052917 (= res!702046 (= (select (arr!31927 a!3488) i!1381) k!2747))))

(declare-fun b!1052918 () Bool)

(declare-fun res!702044 () Bool)

(assert (=> b!1052918 (=> (not res!702044) (not e!597879))))

(declare-fun arrayContainsKey!0 (array!66375 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1052918 (= res!702044 (not (arrayContainsKey!0 (array!66376 (store (arr!31927 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32463 a!3488)) k!2747 #b00000000000000000000000000000000)))))

(declare-fun b!1052919 () Bool)

(assert (=> b!1052919 (= e!597879 (bvsge #b00000000000000000000000000000000 (size!32463 a!3488)))))

(declare-fun b!1052920 () Bool)

(declare-fun res!702047 () Bool)

(assert (=> b!1052920 (=> (not res!702047) (not e!597879))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1052920 (= res!702047 (validKeyInArray!0 k!2747))))

(declare-fun b!1052921 () Bool)

(declare-fun res!702043 () Bool)

(assert (=> b!1052921 (=> (not res!702043) (not e!597879))))

(declare-datatypes ((List!22239 0))(
  ( (Nil!22236) (Cons!22235 (h!23444 (_ BitVec 64)) (t!31546 List!22239)) )
))
(declare-fun arrayNoDuplicates!0 (array!66375 (_ BitVec 32) List!22239) Bool)

(assert (=> b!1052921 (= res!702043 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22236))))

(declare-fun res!702045 () Bool)

(assert (=> start!92574 (=> (not res!702045) (not e!597879))))

(assert (=> start!92574 (= res!702045 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32463 a!3488)) (bvslt (size!32463 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92574 e!597879))

(assert (=> start!92574 true))

(declare-fun array_inv!24707 (array!66375) Bool)

(assert (=> start!92574 (array_inv!24707 a!3488)))

(assert (= (and start!92574 res!702045) b!1052921))

(assert (= (and b!1052921 res!702043) b!1052920))

(assert (= (and b!1052920 res!702047) b!1052917))

(assert (= (and b!1052917 res!702046) b!1052918))

(assert (= (and b!1052918 res!702044) b!1052919))

(declare-fun m!973313 () Bool)

(assert (=> b!1052920 m!973313))

(declare-fun m!973315 () Bool)

(assert (=> b!1052917 m!973315))

(declare-fun m!973317 () Bool)

(assert (=> start!92574 m!973317))

(declare-fun m!973319 () Bool)

(assert (=> b!1052921 m!973319))

(declare-fun m!973321 () Bool)

(assert (=> b!1052918 m!973321))

(declare-fun m!973323 () Bool)

(assert (=> b!1052918 m!973323))

(push 1)

(assert (not b!1052921))

(assert (not b!1052920))

(assert (not b!1052918))

(assert (not start!92574))

(check-sat)

(pop 1)

(push 1)

(check-sat)

