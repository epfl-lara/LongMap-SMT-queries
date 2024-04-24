; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92640 () Bool)

(assert start!92640)

(declare-fun b!1051948 () Bool)

(declare-fun res!700272 () Bool)

(declare-fun e!597080 () Bool)

(assert (=> b!1051948 (=> (not res!700272) (not e!597080))))

(declare-datatypes ((array!66256 0))(
  ( (array!66257 (arr!31861 (Array (_ BitVec 32) (_ BitVec 64))) (size!32398 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66256)

(declare-datatypes ((List!22143 0))(
  ( (Nil!22140) (Cons!22139 (h!23357 (_ BitVec 64)) (t!31442 List!22143)) )
))
(declare-fun arrayNoDuplicates!0 (array!66256 (_ BitVec 32) List!22143) Bool)

(assert (=> b!1051948 (= res!700272 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22140))))

(declare-fun res!700270 () Bool)

(assert (=> start!92640 (=> (not res!700270) (not e!597080))))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> start!92640 (= res!700270 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32398 a!3488)) (bvslt (size!32398 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92640 e!597080))

(assert (=> start!92640 true))

(declare-fun array_inv!24643 (array!66256) Bool)

(assert (=> start!92640 (array_inv!24643 a!3488)))

(declare-fun b!1051949 () Bool)

(declare-fun e!597081 () Bool)

(assert (=> b!1051949 (= e!597081 (not true))))

(declare-fun lt!464549 () (_ BitVec 32))

(declare-fun k0!2747 () (_ BitVec 64))

(assert (=> b!1051949 (= (select (store (arr!31861 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!464549) k0!2747)))

(declare-fun b!1051950 () Bool)

(declare-fun e!597082 () Bool)

(assert (=> b!1051950 (= e!597082 e!597081)))

(declare-fun res!700271 () Bool)

(assert (=> b!1051950 (=> (not res!700271) (not e!597081))))

(assert (=> b!1051950 (= res!700271 (not (= lt!464549 i!1381)))))

(declare-fun lt!464548 () array!66256)

(declare-fun arrayScanForKey!0 (array!66256 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1051950 (= lt!464549 (arrayScanForKey!0 lt!464548 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1051951 () Bool)

(declare-fun res!700269 () Bool)

(assert (=> b!1051951 (=> (not res!700269) (not e!597080))))

(assert (=> b!1051951 (= res!700269 (= (select (arr!31861 a!3488) i!1381) k0!2747))))

(declare-fun b!1051952 () Bool)

(assert (=> b!1051952 (= e!597080 e!597082)))

(declare-fun res!700274 () Bool)

(assert (=> b!1051952 (=> (not res!700274) (not e!597082))))

(declare-fun arrayContainsKey!0 (array!66256 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1051952 (= res!700274 (arrayContainsKey!0 lt!464548 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1051952 (= lt!464548 (array!66257 (store (arr!31861 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32398 a!3488)))))

(declare-fun b!1051953 () Bool)

(declare-fun res!700273 () Bool)

(assert (=> b!1051953 (=> (not res!700273) (not e!597080))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1051953 (= res!700273 (validKeyInArray!0 k0!2747))))

(assert (= (and start!92640 res!700270) b!1051948))

(assert (= (and b!1051948 res!700272) b!1051953))

(assert (= (and b!1051953 res!700273) b!1051951))

(assert (= (and b!1051951 res!700269) b!1051952))

(assert (= (and b!1051952 res!700274) b!1051950))

(assert (= (and b!1051950 res!700271) b!1051949))

(declare-fun m!972977 () Bool)

(assert (=> b!1051950 m!972977))

(declare-fun m!972979 () Bool)

(assert (=> start!92640 m!972979))

(declare-fun m!972981 () Bool)

(assert (=> b!1051949 m!972981))

(declare-fun m!972983 () Bool)

(assert (=> b!1051949 m!972983))

(declare-fun m!972985 () Bool)

(assert (=> b!1051952 m!972985))

(assert (=> b!1051952 m!972981))

(declare-fun m!972987 () Bool)

(assert (=> b!1051948 m!972987))

(declare-fun m!972989 () Bool)

(assert (=> b!1051953 m!972989))

(declare-fun m!972991 () Bool)

(assert (=> b!1051951 m!972991))

(check-sat (not start!92640) (not b!1051953) (not b!1051952) (not b!1051950) (not b!1051948))
(check-sat)
