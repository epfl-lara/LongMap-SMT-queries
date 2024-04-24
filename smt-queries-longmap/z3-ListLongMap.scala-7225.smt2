; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92646 () Bool)

(assert start!92646)

(declare-fun b!1052006 () Bool)

(declare-fun e!597124 () Bool)

(declare-fun e!597122 () Bool)

(assert (=> b!1052006 (= e!597124 e!597122)))

(declare-fun res!700334 () Bool)

(assert (=> b!1052006 (=> (not res!700334) (not e!597122))))

(declare-fun lt!464567 () (_ BitVec 32))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1052006 (= res!700334 (not (= lt!464567 i!1381)))))

(declare-datatypes ((array!66262 0))(
  ( (array!66263 (arr!31864 (Array (_ BitVec 32) (_ BitVec 64))) (size!32401 (_ BitVec 32))) )
))
(declare-fun lt!464566 () array!66262)

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!66262 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1052006 (= lt!464567 (arrayScanForKey!0 lt!464566 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1052007 () Bool)

(declare-fun e!597123 () Bool)

(assert (=> b!1052007 (= e!597123 e!597124)))

(declare-fun res!700333 () Bool)

(assert (=> b!1052007 (=> (not res!700333) (not e!597124))))

(declare-fun arrayContainsKey!0 (array!66262 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1052007 (= res!700333 (arrayContainsKey!0 lt!464566 k0!2747 #b00000000000000000000000000000000))))

(declare-fun a!3488 () array!66262)

(assert (=> b!1052007 (= lt!464566 (array!66263 (store (arr!31864 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32401 a!3488)))))

(declare-fun b!1052008 () Bool)

(declare-fun res!700328 () Bool)

(assert (=> b!1052008 (=> (not res!700328) (not e!597123))))

(assert (=> b!1052008 (= res!700328 (= (select (arr!31864 a!3488) i!1381) k0!2747))))

(declare-fun b!1052009 () Bool)

(declare-fun res!700330 () Bool)

(assert (=> b!1052009 (=> (not res!700330) (not e!597123))))

(declare-datatypes ((List!22146 0))(
  ( (Nil!22143) (Cons!22142 (h!23360 (_ BitVec 64)) (t!31445 List!22146)) )
))
(declare-fun arrayNoDuplicates!0 (array!66262 (_ BitVec 32) List!22146) Bool)

(assert (=> b!1052009 (= res!700330 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22143))))

(declare-fun b!1052010 () Bool)

(declare-fun e!597120 () Bool)

(declare-fun e!597119 () Bool)

(assert (=> b!1052010 (= e!597120 e!597119)))

(declare-fun res!700332 () Bool)

(assert (=> b!1052010 (=> res!700332 e!597119)))

(assert (=> b!1052010 (= res!700332 (or (bvsgt lt!464567 i!1381) (bvsle i!1381 lt!464567)))))

(declare-fun b!1052011 () Bool)

(assert (=> b!1052011 (= e!597122 (not true))))

(assert (=> b!1052011 e!597120))

(declare-fun res!700331 () Bool)

(assert (=> b!1052011 (=> (not res!700331) (not e!597120))))

(assert (=> b!1052011 (= res!700331 (= (select (store (arr!31864 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!464567) k0!2747))))

(declare-fun res!700327 () Bool)

(assert (=> start!92646 (=> (not res!700327) (not e!597123))))

(assert (=> start!92646 (= res!700327 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32401 a!3488)) (bvslt (size!32401 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92646 e!597123))

(assert (=> start!92646 true))

(declare-fun array_inv!24646 (array!66262) Bool)

(assert (=> start!92646 (array_inv!24646 a!3488)))

(declare-fun b!1052012 () Bool)

(assert (=> b!1052012 (= e!597119 (arrayContainsKey!0 a!3488 k0!2747 i!1381))))

(declare-fun b!1052013 () Bool)

(declare-fun res!700329 () Bool)

(assert (=> b!1052013 (=> (not res!700329) (not e!597123))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1052013 (= res!700329 (validKeyInArray!0 k0!2747))))

(assert (= (and start!92646 res!700327) b!1052009))

(assert (= (and b!1052009 res!700330) b!1052013))

(assert (= (and b!1052013 res!700329) b!1052008))

(assert (= (and b!1052008 res!700328) b!1052007))

(assert (= (and b!1052007 res!700333) b!1052006))

(assert (= (and b!1052006 res!700334) b!1052011))

(assert (= (and b!1052011 res!700331) b!1052010))

(assert (= (and b!1052010 (not res!700332)) b!1052012))

(declare-fun m!973025 () Bool)

(assert (=> b!1052011 m!973025))

(declare-fun m!973027 () Bool)

(assert (=> b!1052011 m!973027))

(declare-fun m!973029 () Bool)

(assert (=> b!1052007 m!973029))

(assert (=> b!1052007 m!973025))

(declare-fun m!973031 () Bool)

(assert (=> b!1052008 m!973031))

(declare-fun m!973033 () Bool)

(assert (=> b!1052009 m!973033))

(declare-fun m!973035 () Bool)

(assert (=> start!92646 m!973035))

(declare-fun m!973037 () Bool)

(assert (=> b!1052006 m!973037))

(declare-fun m!973039 () Bool)

(assert (=> b!1052013 m!973039))

(declare-fun m!973041 () Bool)

(assert (=> b!1052012 m!973041))

(check-sat (not b!1052009) (not b!1052006) (not b!1052007) (not start!92646) (not b!1052012) (not b!1052013))
(check-sat)
