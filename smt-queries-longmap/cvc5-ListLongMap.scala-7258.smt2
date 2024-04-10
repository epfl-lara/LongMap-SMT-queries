; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92640 () Bool)

(assert start!92640)

(declare-fun b!1053124 () Bool)

(declare-fun res!702218 () Bool)

(declare-fun e!598062 () Bool)

(assert (=> b!1053124 (=> (not res!702218) (not e!598062))))

(declare-datatypes ((array!66414 0))(
  ( (array!66415 (arr!31945 (Array (_ BitVec 32) (_ BitVec 64))) (size!32481 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66414)

(declare-datatypes ((List!22257 0))(
  ( (Nil!22254) (Cons!22253 (h!23462 (_ BitVec 64)) (t!31564 List!22257)) )
))
(declare-fun arrayNoDuplicates!0 (array!66414 (_ BitVec 32) List!22257) Bool)

(assert (=> b!1053124 (= res!702218 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22254))))

(declare-fun b!1053125 () Bool)

(declare-fun res!702217 () Bool)

(assert (=> b!1053125 (=> (not res!702217) (not e!598062))))

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1053125 (= res!702217 (= (select (arr!31945 a!3488) i!1381) k!2747))))

(declare-fun b!1053126 () Bool)

(declare-fun e!598063 () Bool)

(assert (=> b!1053126 (= e!598062 e!598063)))

(declare-fun res!702216 () Bool)

(assert (=> b!1053126 (=> (not res!702216) (not e!598063))))

(declare-fun lt!465068 () array!66414)

(declare-fun arrayContainsKey!0 (array!66414 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1053126 (= res!702216 (arrayContainsKey!0 lt!465068 k!2747 #b00000000000000000000000000000000))))

(assert (=> b!1053126 (= lt!465068 (array!66415 (store (arr!31945 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32481 a!3488)))))

(declare-fun b!1053127 () Bool)

(assert (=> b!1053127 (= e!598063 false)))

(declare-fun lt!465069 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!66414 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1053127 (= lt!465069 (arrayScanForKey!0 lt!465068 k!2747 #b00000000000000000000000000000000))))

(declare-fun b!1053128 () Bool)

(declare-fun res!702215 () Bool)

(assert (=> b!1053128 (=> (not res!702215) (not e!598062))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1053128 (= res!702215 (validKeyInArray!0 k!2747))))

(declare-fun res!702214 () Bool)

(assert (=> start!92640 (=> (not res!702214) (not e!598062))))

(assert (=> start!92640 (= res!702214 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32481 a!3488)) (bvslt (size!32481 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92640 e!598062))

(assert (=> start!92640 true))

(declare-fun array_inv!24725 (array!66414) Bool)

(assert (=> start!92640 (array_inv!24725 a!3488)))

(assert (= (and start!92640 res!702214) b!1053124))

(assert (= (and b!1053124 res!702218) b!1053128))

(assert (= (and b!1053128 res!702215) b!1053125))

(assert (= (and b!1053125 res!702217) b!1053126))

(assert (= (and b!1053126 res!702216) b!1053127))

(declare-fun m!973487 () Bool)

(assert (=> b!1053127 m!973487))

(declare-fun m!973489 () Bool)

(assert (=> b!1053128 m!973489))

(declare-fun m!973491 () Bool)

(assert (=> b!1053124 m!973491))

(declare-fun m!973493 () Bool)

(assert (=> start!92640 m!973493))

(declare-fun m!973495 () Bool)

(assert (=> b!1053125 m!973495))

(declare-fun m!973497 () Bool)

(assert (=> b!1053126 m!973497))

(declare-fun m!973499 () Bool)

(assert (=> b!1053126 m!973499))

(push 1)

(assert (not b!1053127))

(assert (not start!92640))

(assert (not b!1053126))

(assert (not b!1053124))

(assert (not b!1053128))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

