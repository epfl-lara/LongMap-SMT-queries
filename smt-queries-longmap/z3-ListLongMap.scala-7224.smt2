; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92408 () Bool)

(assert start!92408)

(declare-fun b!1050651 () Bool)

(declare-fun res!699781 () Bool)

(declare-fun e!596250 () Bool)

(assert (=> b!1050651 (=> (not res!699781) (not e!596250))))

(declare-datatypes ((array!66209 0))(
  ( (array!66210 (arr!31844 (Array (_ BitVec 32) (_ BitVec 64))) (size!32380 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66209)

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1050651 (= res!699781 (= (select (arr!31844 a!3488) i!1381) k0!2747))))

(declare-fun b!1050652 () Bool)

(declare-fun res!699779 () Bool)

(assert (=> b!1050652 (=> (not res!699779) (not e!596250))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1050652 (= res!699779 (validKeyInArray!0 k0!2747))))

(declare-fun res!699780 () Bool)

(assert (=> start!92408 (=> (not res!699780) (not e!596250))))

(assert (=> start!92408 (= res!699780 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32380 a!3488)) (bvslt (size!32380 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92408 e!596250))

(assert (=> start!92408 true))

(declare-fun array_inv!24624 (array!66209) Bool)

(assert (=> start!92408 (array_inv!24624 a!3488)))

(declare-fun b!1050653 () Bool)

(declare-fun res!699777 () Bool)

(assert (=> b!1050653 (=> (not res!699777) (not e!596250))))

(declare-datatypes ((List!22156 0))(
  ( (Nil!22153) (Cons!22152 (h!23361 (_ BitVec 64)) (t!31463 List!22156)) )
))
(declare-fun arrayNoDuplicates!0 (array!66209 (_ BitVec 32) List!22156) Bool)

(assert (=> b!1050653 (= res!699777 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22153))))

(declare-fun b!1050654 () Bool)

(declare-fun e!596251 () Bool)

(assert (=> b!1050654 (= e!596250 e!596251)))

(declare-fun res!699782 () Bool)

(assert (=> b!1050654 (=> (not res!699782) (not e!596251))))

(declare-fun lt!464039 () array!66209)

(declare-fun arrayContainsKey!0 (array!66209 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1050654 (= res!699782 (arrayContainsKey!0 lt!464039 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1050654 (= lt!464039 (array!66210 (store (arr!31844 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32380 a!3488)))))

(declare-fun b!1050655 () Bool)

(declare-fun e!596249 () Bool)

(assert (=> b!1050655 (= e!596249 (not true))))

(declare-fun lt!464040 () (_ BitVec 32))

(assert (=> b!1050655 (= (select (store (arr!31844 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!464040) k0!2747)))

(declare-fun b!1050656 () Bool)

(assert (=> b!1050656 (= e!596251 e!596249)))

(declare-fun res!699778 () Bool)

(assert (=> b!1050656 (=> (not res!699778) (not e!596249))))

(assert (=> b!1050656 (= res!699778 (not (= lt!464040 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66209 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1050656 (= lt!464040 (arrayScanForKey!0 lt!464039 k0!2747 #b00000000000000000000000000000000))))

(assert (= (and start!92408 res!699780) b!1050653))

(assert (= (and b!1050653 res!699777) b!1050652))

(assert (= (and b!1050652 res!699779) b!1050651))

(assert (= (and b!1050651 res!699781) b!1050654))

(assert (= (and b!1050654 res!699782) b!1050656))

(assert (= (and b!1050656 res!699778) b!1050655))

(declare-fun m!971325 () Bool)

(assert (=> b!1050654 m!971325))

(declare-fun m!971327 () Bool)

(assert (=> b!1050654 m!971327))

(declare-fun m!971329 () Bool)

(assert (=> b!1050651 m!971329))

(declare-fun m!971331 () Bool)

(assert (=> start!92408 m!971331))

(declare-fun m!971333 () Bool)

(assert (=> b!1050653 m!971333))

(declare-fun m!971335 () Bool)

(assert (=> b!1050652 m!971335))

(declare-fun m!971337 () Bool)

(assert (=> b!1050656 m!971337))

(assert (=> b!1050655 m!971327))

(declare-fun m!971339 () Bool)

(assert (=> b!1050655 m!971339))

(check-sat (not b!1050652) (not b!1050653) (not b!1050654) (not b!1050656) (not start!92408))
(check-sat)
