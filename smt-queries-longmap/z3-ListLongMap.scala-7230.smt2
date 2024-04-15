; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92440 () Bool)

(assert start!92440)

(declare-fun b!1050902 () Bool)

(declare-fun e!596462 () Bool)

(declare-fun e!596461 () Bool)

(assert (=> b!1050902 (= e!596462 e!596461)))

(declare-fun res!700112 () Bool)

(assert (=> b!1050902 (=> res!700112 e!596461)))

(declare-fun lt!463945 () (_ BitVec 32))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1050902 (= res!700112 (or (bvsgt lt!463945 i!1381) (bvsle i!1381 lt!463945)))))

(declare-fun res!700113 () Bool)

(declare-fun e!596460 () Bool)

(assert (=> start!92440 (=> (not res!700113) (not e!596460))))

(declare-datatypes ((array!66182 0))(
  ( (array!66183 (arr!31830 (Array (_ BitVec 32) (_ BitVec 64))) (size!32368 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66182)

(assert (=> start!92440 (= res!700113 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32368 a!3488)) (bvslt (size!32368 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92440 e!596460))

(assert (=> start!92440 true))

(declare-fun array_inv!24613 (array!66182) Bool)

(assert (=> start!92440 (array_inv!24613 a!3488)))

(declare-fun b!1050903 () Bool)

(declare-fun res!700116 () Bool)

(assert (=> b!1050903 (=> (not res!700116) (not e!596460))))

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1050903 (= res!700116 (validKeyInArray!0 k0!2747))))

(declare-fun b!1050904 () Bool)

(declare-fun e!596463 () Bool)

(declare-fun e!596458 () Bool)

(assert (=> b!1050904 (= e!596463 (not e!596458))))

(declare-fun res!700119 () Bool)

(assert (=> b!1050904 (=> res!700119 e!596458)))

(assert (=> b!1050904 (= res!700119 (or (bvsgt lt!463945 i!1381) (bvsle i!1381 lt!463945)))))

(assert (=> b!1050904 e!596462))

(declare-fun res!700120 () Bool)

(assert (=> b!1050904 (=> (not res!700120) (not e!596462))))

(assert (=> b!1050904 (= res!700120 (= (select (store (arr!31830 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!463945) k0!2747))))

(declare-fun b!1050905 () Bool)

(declare-fun arrayContainsKey!0 (array!66182 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1050905 (= e!596461 (arrayContainsKey!0 a!3488 k0!2747 i!1381))))

(declare-fun b!1050906 () Bool)

(declare-fun res!700117 () Bool)

(assert (=> b!1050906 (=> (not res!700117) (not e!596460))))

(assert (=> b!1050906 (= res!700117 (= (select (arr!31830 a!3488) i!1381) k0!2747))))

(declare-fun b!1050907 () Bool)

(declare-fun e!596459 () Bool)

(assert (=> b!1050907 (= e!596460 e!596459)))

(declare-fun res!700115 () Bool)

(assert (=> b!1050907 (=> (not res!700115) (not e!596459))))

(declare-fun lt!463944 () array!66182)

(assert (=> b!1050907 (= res!700115 (arrayContainsKey!0 lt!463944 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1050907 (= lt!463944 (array!66183 (store (arr!31830 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32368 a!3488)))))

(declare-fun b!1050908 () Bool)

(assert (=> b!1050908 (= e!596459 e!596463)))

(declare-fun res!700118 () Bool)

(assert (=> b!1050908 (=> (not res!700118) (not e!596463))))

(assert (=> b!1050908 (= res!700118 (not (= lt!463945 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66182 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1050908 (= lt!463945 (arrayScanForKey!0 lt!463944 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1050909 () Bool)

(assert (=> b!1050909 (= e!596458 true)))

(declare-datatypes ((List!22201 0))(
  ( (Nil!22198) (Cons!22197 (h!23406 (_ BitVec 64)) (t!31499 List!22201)) )
))
(declare-fun arrayNoDuplicates!0 (array!66182 (_ BitVec 32) List!22201) Bool)

(assert (=> b!1050909 (arrayNoDuplicates!0 a!3488 lt!463945 Nil!22198)))

(declare-datatypes ((Unit!34265 0))(
  ( (Unit!34266) )
))
(declare-fun lt!463943 () Unit!34265)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66182 (_ BitVec 32) (_ BitVec 32)) Unit!34265)

(assert (=> b!1050909 (= lt!463943 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 lt!463945))))

(declare-fun b!1050910 () Bool)

(declare-fun res!700114 () Bool)

(assert (=> b!1050910 (=> (not res!700114) (not e!596460))))

(assert (=> b!1050910 (= res!700114 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22198))))

(assert (= (and start!92440 res!700113) b!1050910))

(assert (= (and b!1050910 res!700114) b!1050903))

(assert (= (and b!1050903 res!700116) b!1050906))

(assert (= (and b!1050906 res!700117) b!1050907))

(assert (= (and b!1050907 res!700115) b!1050908))

(assert (= (and b!1050908 res!700118) b!1050904))

(assert (= (and b!1050904 res!700120) b!1050902))

(assert (= (and b!1050902 (not res!700112)) b!1050905))

(assert (= (and b!1050904 (not res!700119)) b!1050909))

(declare-fun m!971011 () Bool)

(assert (=> b!1050910 m!971011))

(declare-fun m!971013 () Bool)

(assert (=> b!1050907 m!971013))

(declare-fun m!971015 () Bool)

(assert (=> b!1050907 m!971015))

(declare-fun m!971017 () Bool)

(assert (=> b!1050905 m!971017))

(declare-fun m!971019 () Bool)

(assert (=> b!1050906 m!971019))

(declare-fun m!971021 () Bool)

(assert (=> b!1050909 m!971021))

(declare-fun m!971023 () Bool)

(assert (=> b!1050909 m!971023))

(assert (=> b!1050904 m!971015))

(declare-fun m!971025 () Bool)

(assert (=> b!1050904 m!971025))

(declare-fun m!971027 () Bool)

(assert (=> b!1050903 m!971027))

(declare-fun m!971029 () Bool)

(assert (=> b!1050908 m!971029))

(declare-fun m!971031 () Bool)

(assert (=> start!92440 m!971031))

(check-sat (not b!1050905) (not start!92440) (not b!1050907) (not b!1050908) (not b!1050909) (not b!1050903) (not b!1050910))
(check-sat)
