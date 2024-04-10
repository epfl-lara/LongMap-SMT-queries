; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92456 () Bool)

(assert start!92456)

(declare-fun b!1051242 () Bool)

(declare-fun e!596697 () Bool)

(declare-fun e!596696 () Bool)

(assert (=> b!1051242 (= e!596697 e!596696)))

(declare-fun res!700371 () Bool)

(assert (=> b!1051242 (=> res!700371 e!596696)))

(declare-fun lt!464207 () (_ BitVec 32))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1051242 (= res!700371 (or (bvsgt lt!464207 i!1381) (bvsle i!1381 lt!464207)))))

(declare-fun b!1051243 () Bool)

(declare-fun res!700374 () Bool)

(declare-fun e!596700 () Bool)

(assert (=> b!1051243 (=> (not res!700374) (not e!596700))))

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1051243 (= res!700374 (validKeyInArray!0 k0!2747))))

(declare-fun b!1051244 () Bool)

(declare-fun res!700370 () Bool)

(assert (=> b!1051244 (=> (not res!700370) (not e!596700))))

(declare-datatypes ((array!66257 0))(
  ( (array!66258 (arr!31868 (Array (_ BitVec 32) (_ BitVec 64))) (size!32404 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66257)

(assert (=> b!1051244 (= res!700370 (= (select (arr!31868 a!3488) i!1381) k0!2747))))

(declare-fun b!1051245 () Bool)

(declare-fun e!596699 () Bool)

(declare-fun e!596695 () Bool)

(assert (=> b!1051245 (= e!596699 (not e!596695))))

(declare-fun res!700373 () Bool)

(assert (=> b!1051245 (=> res!700373 e!596695)))

(assert (=> b!1051245 (= res!700373 (or (bvsgt lt!464207 i!1381) (bvsle i!1381 lt!464207)))))

(assert (=> b!1051245 e!596697))

(declare-fun res!700369 () Bool)

(assert (=> b!1051245 (=> (not res!700369) (not e!596697))))

(assert (=> b!1051245 (= res!700369 (= (select (store (arr!31868 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!464207) k0!2747))))

(declare-fun res!700372 () Bool)

(assert (=> start!92456 (=> (not res!700372) (not e!596700))))

(assert (=> start!92456 (= res!700372 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32404 a!3488)) (bvslt (size!32404 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92456 e!596700))

(assert (=> start!92456 true))

(declare-fun array_inv!24648 (array!66257) Bool)

(assert (=> start!92456 (array_inv!24648 a!3488)))

(declare-fun b!1051246 () Bool)

(declare-fun e!596701 () Bool)

(assert (=> b!1051246 (= e!596700 e!596701)))

(declare-fun res!700376 () Bool)

(assert (=> b!1051246 (=> (not res!700376) (not e!596701))))

(declare-fun lt!464208 () array!66257)

(declare-fun arrayContainsKey!0 (array!66257 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1051246 (= res!700376 (arrayContainsKey!0 lt!464208 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1051246 (= lt!464208 (array!66258 (store (arr!31868 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32404 a!3488)))))

(declare-fun b!1051247 () Bool)

(assert (=> b!1051247 (= e!596701 e!596699)))

(declare-fun res!700368 () Bool)

(assert (=> b!1051247 (=> (not res!700368) (not e!596699))))

(assert (=> b!1051247 (= res!700368 (not (= lt!464207 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66257 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1051247 (= lt!464207 (arrayScanForKey!0 lt!464208 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1051248 () Bool)

(assert (=> b!1051248 (= e!596695 true)))

(declare-datatypes ((List!22180 0))(
  ( (Nil!22177) (Cons!22176 (h!23385 (_ BitVec 64)) (t!31487 List!22180)) )
))
(declare-fun arrayNoDuplicates!0 (array!66257 (_ BitVec 32) List!22180) Bool)

(assert (=> b!1051248 (arrayNoDuplicates!0 a!3488 lt!464207 Nil!22177)))

(declare-datatypes ((Unit!34408 0))(
  ( (Unit!34409) )
))
(declare-fun lt!464206 () Unit!34408)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66257 (_ BitVec 32) (_ BitVec 32)) Unit!34408)

(assert (=> b!1051248 (= lt!464206 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 lt!464207))))

(declare-fun b!1051249 () Bool)

(declare-fun res!700375 () Bool)

(assert (=> b!1051249 (=> (not res!700375) (not e!596700))))

(assert (=> b!1051249 (= res!700375 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22177))))

(declare-fun b!1051250 () Bool)

(assert (=> b!1051250 (= e!596696 (arrayContainsKey!0 a!3488 k0!2747 i!1381))))

(assert (= (and start!92456 res!700372) b!1051249))

(assert (= (and b!1051249 res!700375) b!1051243))

(assert (= (and b!1051243 res!700374) b!1051244))

(assert (= (and b!1051244 res!700370) b!1051246))

(assert (= (and b!1051246 res!700376) b!1051247))

(assert (= (and b!1051247 res!700368) b!1051245))

(assert (= (and b!1051245 res!700369) b!1051242))

(assert (= (and b!1051242 (not res!700371)) b!1051250))

(assert (= (and b!1051245 (not res!700373)) b!1051248))

(declare-fun m!971781 () Bool)

(assert (=> b!1051249 m!971781))

(declare-fun m!971783 () Bool)

(assert (=> b!1051246 m!971783))

(declare-fun m!971785 () Bool)

(assert (=> b!1051246 m!971785))

(declare-fun m!971787 () Bool)

(assert (=> b!1051248 m!971787))

(declare-fun m!971789 () Bool)

(assert (=> b!1051248 m!971789))

(declare-fun m!971791 () Bool)

(assert (=> start!92456 m!971791))

(assert (=> b!1051245 m!971785))

(declare-fun m!971793 () Bool)

(assert (=> b!1051245 m!971793))

(declare-fun m!971795 () Bool)

(assert (=> b!1051247 m!971795))

(declare-fun m!971797 () Bool)

(assert (=> b!1051250 m!971797))

(declare-fun m!971799 () Bool)

(assert (=> b!1051244 m!971799))

(declare-fun m!971801 () Bool)

(assert (=> b!1051243 m!971801))

(check-sat (not b!1051243) (not b!1051247) (not b!1051246) (not start!92456) (not b!1051249) (not b!1051250) (not b!1051248))
(check-sat)
