; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92642 () Bool)

(assert start!92642)

(declare-fun b!1053139 () Bool)

(declare-fun res!702232 () Bool)

(declare-fun e!598071 () Bool)

(assert (=> b!1053139 (=> (not res!702232) (not e!598071))))

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1053139 (= res!702232 (validKeyInArray!0 k0!2747))))

(declare-fun b!1053140 () Bool)

(declare-fun res!702231 () Bool)

(assert (=> b!1053140 (=> (not res!702231) (not e!598071))))

(declare-datatypes ((array!66416 0))(
  ( (array!66417 (arr!31946 (Array (_ BitVec 32) (_ BitVec 64))) (size!32482 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66416)

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1053140 (= res!702231 (= (select (arr!31946 a!3488) i!1381) k0!2747))))

(declare-fun b!1053141 () Bool)

(declare-fun res!702233 () Bool)

(assert (=> b!1053141 (=> (not res!702233) (not e!598071))))

(declare-datatypes ((List!22258 0))(
  ( (Nil!22255) (Cons!22254 (h!23463 (_ BitVec 64)) (t!31565 List!22258)) )
))
(declare-fun arrayNoDuplicates!0 (array!66416 (_ BitVec 32) List!22258) Bool)

(assert (=> b!1053141 (= res!702233 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22255))))

(declare-fun b!1053142 () Bool)

(declare-fun e!598072 () Bool)

(assert (=> b!1053142 (= e!598071 e!598072)))

(declare-fun res!702230 () Bool)

(assert (=> b!1053142 (=> (not res!702230) (not e!598072))))

(declare-fun lt!465075 () array!66416)

(declare-fun arrayContainsKey!0 (array!66416 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1053142 (= res!702230 (arrayContainsKey!0 lt!465075 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1053142 (= lt!465075 (array!66417 (store (arr!31946 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32482 a!3488)))))

(declare-fun res!702229 () Bool)

(assert (=> start!92642 (=> (not res!702229) (not e!598071))))

(assert (=> start!92642 (= res!702229 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32482 a!3488)) (bvslt (size!32482 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92642 e!598071))

(assert (=> start!92642 true))

(declare-fun array_inv!24726 (array!66416) Bool)

(assert (=> start!92642 (array_inv!24726 a!3488)))

(declare-fun b!1053143 () Bool)

(assert (=> b!1053143 (= e!598072 false)))

(declare-fun lt!465074 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!66416 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1053143 (= lt!465074 (arrayScanForKey!0 lt!465075 k0!2747 #b00000000000000000000000000000000))))

(assert (= (and start!92642 res!702229) b!1053141))

(assert (= (and b!1053141 res!702233) b!1053139))

(assert (= (and b!1053139 res!702232) b!1053140))

(assert (= (and b!1053140 res!702231) b!1053142))

(assert (= (and b!1053142 res!702230) b!1053143))

(declare-fun m!973501 () Bool)

(assert (=> b!1053141 m!973501))

(declare-fun m!973503 () Bool)

(assert (=> b!1053139 m!973503))

(declare-fun m!973505 () Bool)

(assert (=> b!1053140 m!973505))

(declare-fun m!973507 () Bool)

(assert (=> b!1053142 m!973507))

(declare-fun m!973509 () Bool)

(assert (=> b!1053142 m!973509))

(declare-fun m!973511 () Bool)

(assert (=> start!92642 m!973511))

(declare-fun m!973513 () Bool)

(assert (=> b!1053143 m!973513))

(check-sat (not b!1053142) (not start!92642) (not b!1053141) (not b!1053139) (not b!1053143))
