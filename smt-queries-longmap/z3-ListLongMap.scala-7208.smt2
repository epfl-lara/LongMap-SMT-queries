; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92308 () Bool)

(assert start!92308)

(declare-fun b!1049003 () Bool)

(declare-fun res!698216 () Bool)

(declare-fun e!595117 () Bool)

(assert (=> b!1049003 (=> (not res!698216) (not e!595117))))

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1049003 (= res!698216 (validKeyInArray!0 k0!2747))))

(declare-fun b!1049004 () Bool)

(declare-fun e!595119 () Bool)

(declare-fun e!595118 () Bool)

(assert (=> b!1049004 (= e!595119 (not e!595118))))

(declare-fun res!698213 () Bool)

(assert (=> b!1049004 (=> res!698213 e!595118)))

(declare-fun lt!463207 () (_ BitVec 32))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1049004 (= res!698213 (bvsle lt!463207 i!1381))))

(declare-fun e!595120 () Bool)

(assert (=> b!1049004 e!595120))

(declare-fun res!698214 () Bool)

(assert (=> b!1049004 (=> (not res!698214) (not e!595120))))

(declare-datatypes ((array!66050 0))(
  ( (array!66051 (arr!31764 (Array (_ BitVec 32) (_ BitVec 64))) (size!32302 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66050)

(assert (=> b!1049004 (= res!698214 (= (select (store (arr!31764 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!463207) k0!2747))))

(declare-fun b!1049005 () Bool)

(declare-fun e!595116 () Bool)

(assert (=> b!1049005 (= e!595120 e!595116)))

(declare-fun res!698215 () Bool)

(assert (=> b!1049005 (=> res!698215 e!595116)))

(assert (=> b!1049005 (= res!698215 (bvsle lt!463207 i!1381))))

(declare-fun b!1049006 () Bool)

(declare-fun e!595122 () Bool)

(assert (=> b!1049006 (= e!595117 e!595122)))

(declare-fun res!698217 () Bool)

(assert (=> b!1049006 (=> (not res!698217) (not e!595122))))

(declare-fun lt!463206 () array!66050)

(declare-fun arrayContainsKey!0 (array!66050 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1049006 (= res!698217 (arrayContainsKey!0 lt!463206 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1049006 (= lt!463206 (array!66051 (store (arr!31764 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32302 a!3488)))))

(declare-fun b!1049007 () Bool)

(assert (=> b!1049007 (= e!595116 (arrayContainsKey!0 a!3488 k0!2747 lt!463207))))

(declare-fun b!1049008 () Bool)

(assert (=> b!1049008 (= e!595122 e!595119)))

(declare-fun res!698221 () Bool)

(assert (=> b!1049008 (=> (not res!698221) (not e!595119))))

(assert (=> b!1049008 (= res!698221 (not (= lt!463207 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66050 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1049008 (= lt!463207 (arrayScanForKey!0 lt!463206 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1049009 () Bool)

(declare-fun res!698218 () Bool)

(assert (=> b!1049009 (=> (not res!698218) (not e!595117))))

(assert (=> b!1049009 (= res!698218 (= (select (arr!31764 a!3488) i!1381) k0!2747))))

(declare-fun res!698219 () Bool)

(assert (=> start!92308 (=> (not res!698219) (not e!595117))))

(assert (=> start!92308 (= res!698219 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32302 a!3488)) (bvslt (size!32302 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92308 e!595117))

(assert (=> start!92308 true))

(declare-fun array_inv!24547 (array!66050) Bool)

(assert (=> start!92308 (array_inv!24547 a!3488)))

(declare-fun b!1049010 () Bool)

(declare-fun res!698220 () Bool)

(assert (=> b!1049010 (=> (not res!698220) (not e!595117))))

(declare-datatypes ((List!22135 0))(
  ( (Nil!22132) (Cons!22131 (h!23340 (_ BitVec 64)) (t!31433 List!22135)) )
))
(declare-fun arrayNoDuplicates!0 (array!66050 (_ BitVec 32) List!22135) Bool)

(assert (=> b!1049010 (= res!698220 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22132))))

(declare-fun b!1049011 () Bool)

(assert (=> b!1049011 (= e!595118 true)))

(assert (=> b!1049011 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22132)))

(declare-datatypes ((Unit!34181 0))(
  ( (Unit!34182) )
))
(declare-fun lt!463205 () Unit!34181)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66050 (_ BitVec 32) (_ BitVec 32)) Unit!34181)

(assert (=> b!1049011 (= lt!463205 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381))))

(assert (= (and start!92308 res!698219) b!1049010))

(assert (= (and b!1049010 res!698220) b!1049003))

(assert (= (and b!1049003 res!698216) b!1049009))

(assert (= (and b!1049009 res!698218) b!1049006))

(assert (= (and b!1049006 res!698217) b!1049008))

(assert (= (and b!1049008 res!698221) b!1049004))

(assert (= (and b!1049004 res!698214) b!1049005))

(assert (= (and b!1049005 (not res!698215)) b!1049007))

(assert (= (and b!1049004 (not res!698213)) b!1049011))

(declare-fun m!969349 () Bool)

(assert (=> b!1049010 m!969349))

(declare-fun m!969351 () Bool)

(assert (=> b!1049003 m!969351))

(declare-fun m!969353 () Bool)

(assert (=> b!1049008 m!969353))

(declare-fun m!969355 () Bool)

(assert (=> b!1049009 m!969355))

(declare-fun m!969357 () Bool)

(assert (=> b!1049007 m!969357))

(declare-fun m!969359 () Bool)

(assert (=> start!92308 m!969359))

(declare-fun m!969361 () Bool)

(assert (=> b!1049011 m!969361))

(declare-fun m!969363 () Bool)

(assert (=> b!1049011 m!969363))

(declare-fun m!969365 () Bool)

(assert (=> b!1049006 m!969365))

(declare-fun m!969367 () Bool)

(assert (=> b!1049006 m!969367))

(assert (=> b!1049004 m!969367))

(declare-fun m!969369 () Bool)

(assert (=> b!1049004 m!969369))

(check-sat (not b!1049007) (not b!1049008) (not b!1049011) (not b!1049003) (not b!1049006) (not start!92308) (not b!1049010))
(check-sat)
