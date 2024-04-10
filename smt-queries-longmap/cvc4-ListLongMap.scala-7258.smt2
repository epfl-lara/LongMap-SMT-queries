; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92644 () Bool)

(assert start!92644)

(declare-fun b!1053154 () Bool)

(declare-fun res!702245 () Bool)

(declare-fun e!598080 () Bool)

(assert (=> b!1053154 (=> (not res!702245) (not e!598080))))

(declare-datatypes ((array!66418 0))(
  ( (array!66419 (arr!31947 (Array (_ BitVec 32) (_ BitVec 64))) (size!32483 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66418)

(declare-fun i!1381 () (_ BitVec 32))

(declare-fun k!2747 () (_ BitVec 64))

(assert (=> b!1053154 (= res!702245 (= (select (arr!31947 a!3488) i!1381) k!2747))))

(declare-fun b!1053155 () Bool)

(declare-fun e!598081 () Bool)

(assert (=> b!1053155 (= e!598080 e!598081)))

(declare-fun res!702248 () Bool)

(assert (=> b!1053155 (=> (not res!702248) (not e!598081))))

(declare-fun lt!465081 () array!66418)

(declare-fun arrayContainsKey!0 (array!66418 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1053155 (= res!702248 (arrayContainsKey!0 lt!465081 k!2747 #b00000000000000000000000000000000))))

(assert (=> b!1053155 (= lt!465081 (array!66419 (store (arr!31947 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32483 a!3488)))))

(declare-fun res!702247 () Bool)

(assert (=> start!92644 (=> (not res!702247) (not e!598080))))

(assert (=> start!92644 (= res!702247 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32483 a!3488)) (bvslt (size!32483 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92644 e!598080))

(assert (=> start!92644 true))

(declare-fun array_inv!24727 (array!66418) Bool)

(assert (=> start!92644 (array_inv!24727 a!3488)))

(declare-fun b!1053156 () Bool)

(assert (=> b!1053156 (= e!598081 false)))

(declare-fun lt!465080 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!66418 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1053156 (= lt!465080 (arrayScanForKey!0 lt!465081 k!2747 #b00000000000000000000000000000000))))

(declare-fun b!1053157 () Bool)

(declare-fun res!702244 () Bool)

(assert (=> b!1053157 (=> (not res!702244) (not e!598080))))

(declare-datatypes ((List!22259 0))(
  ( (Nil!22256) (Cons!22255 (h!23464 (_ BitVec 64)) (t!31566 List!22259)) )
))
(declare-fun arrayNoDuplicates!0 (array!66418 (_ BitVec 32) List!22259) Bool)

(assert (=> b!1053157 (= res!702244 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22256))))

(declare-fun b!1053158 () Bool)

(declare-fun res!702246 () Bool)

(assert (=> b!1053158 (=> (not res!702246) (not e!598080))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1053158 (= res!702246 (validKeyInArray!0 k!2747))))

(assert (= (and start!92644 res!702247) b!1053157))

(assert (= (and b!1053157 res!702244) b!1053158))

(assert (= (and b!1053158 res!702246) b!1053154))

(assert (= (and b!1053154 res!702245) b!1053155))

(assert (= (and b!1053155 res!702248) b!1053156))

(declare-fun m!973515 () Bool)

(assert (=> b!1053155 m!973515))

(declare-fun m!973517 () Bool)

(assert (=> b!1053155 m!973517))

(declare-fun m!973519 () Bool)

(assert (=> b!1053156 m!973519))

(declare-fun m!973521 () Bool)

(assert (=> b!1053154 m!973521))

(declare-fun m!973523 () Bool)

(assert (=> b!1053158 m!973523))

(declare-fun m!973525 () Bool)

(assert (=> start!92644 m!973525))

(declare-fun m!973527 () Bool)

(assert (=> b!1053157 m!973527))

(push 1)

(assert (not b!1053156))

(assert (not b!1053157))

(assert (not b!1053158))

(assert (not b!1053155))

(assert (not start!92644))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

