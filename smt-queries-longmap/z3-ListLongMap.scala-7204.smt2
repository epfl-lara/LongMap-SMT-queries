; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92520 () Bool)

(assert start!92520)

(declare-fun b!1050145 () Bool)

(declare-fun res!698469 () Bool)

(declare-fun e!595803 () Bool)

(assert (=> b!1050145 (=> (not res!698469) (not e!595803))))

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1050145 (= res!698469 (validKeyInArray!0 k0!2747))))

(declare-fun b!1050146 () Bool)

(declare-fun e!595798 () Bool)

(declare-fun e!595801 () Bool)

(assert (=> b!1050146 (= e!595798 (not e!595801))))

(declare-fun res!698474 () Bool)

(assert (=> b!1050146 (=> res!698474 e!595801)))

(declare-fun lt!463814 () (_ BitVec 32))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1050146 (= res!698474 (bvsle lt!463814 i!1381))))

(declare-fun e!595799 () Bool)

(assert (=> b!1050146 e!595799))

(declare-fun res!698467 () Bool)

(assert (=> b!1050146 (=> (not res!698467) (not e!595799))))

(declare-datatypes ((array!66136 0))(
  ( (array!66137 (arr!31801 (Array (_ BitVec 32) (_ BitVec 64))) (size!32338 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66136)

(assert (=> b!1050146 (= res!698467 (= (select (store (arr!31801 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!463814) k0!2747))))

(declare-fun b!1050147 () Bool)

(assert (=> b!1050147 (= e!595801 true)))

(declare-datatypes ((List!22083 0))(
  ( (Nil!22080) (Cons!22079 (h!23297 (_ BitVec 64)) (t!31382 List!22083)) )
))
(declare-fun arrayNoDuplicates!0 (array!66136 (_ BitVec 32) List!22083) Bool)

(assert (=> b!1050147 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22080)))

(declare-datatypes ((Unit!34291 0))(
  ( (Unit!34292) )
))
(declare-fun lt!463812 () Unit!34291)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66136 (_ BitVec 32) (_ BitVec 32)) Unit!34291)

(assert (=> b!1050147 (= lt!463812 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381))))

(declare-fun b!1050148 () Bool)

(declare-fun res!698471 () Bool)

(assert (=> b!1050148 (=> (not res!698471) (not e!595803))))

(assert (=> b!1050148 (= res!698471 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22080))))

(declare-fun b!1050149 () Bool)

(declare-fun e!595802 () Bool)

(declare-fun arrayContainsKey!0 (array!66136 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1050149 (= e!595802 (arrayContainsKey!0 a!3488 k0!2747 lt!463814))))

(declare-fun b!1050150 () Bool)

(declare-fun e!595800 () Bool)

(assert (=> b!1050150 (= e!595803 e!595800)))

(declare-fun res!698472 () Bool)

(assert (=> b!1050150 (=> (not res!698472) (not e!595800))))

(declare-fun lt!463813 () array!66136)

(assert (=> b!1050150 (= res!698472 (arrayContainsKey!0 lt!463813 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1050150 (= lt!463813 (array!66137 (store (arr!31801 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32338 a!3488)))))

(declare-fun b!1050151 () Bool)

(declare-fun res!698468 () Bool)

(assert (=> b!1050151 (=> (not res!698468) (not e!595803))))

(assert (=> b!1050151 (= res!698468 (= (select (arr!31801 a!3488) i!1381) k0!2747))))

(declare-fun res!698470 () Bool)

(assert (=> start!92520 (=> (not res!698470) (not e!595803))))

(assert (=> start!92520 (= res!698470 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32338 a!3488)) (bvslt (size!32338 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92520 e!595803))

(assert (=> start!92520 true))

(declare-fun array_inv!24583 (array!66136) Bool)

(assert (=> start!92520 (array_inv!24583 a!3488)))

(declare-fun b!1050152 () Bool)

(assert (=> b!1050152 (= e!595800 e!595798)))

(declare-fun res!698466 () Bool)

(assert (=> b!1050152 (=> (not res!698466) (not e!595798))))

(assert (=> b!1050152 (= res!698466 (not (= lt!463814 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66136 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1050152 (= lt!463814 (arrayScanForKey!0 lt!463813 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1050153 () Bool)

(assert (=> b!1050153 (= e!595799 e!595802)))

(declare-fun res!698473 () Bool)

(assert (=> b!1050153 (=> res!698473 e!595802)))

(assert (=> b!1050153 (= res!698473 (bvsle lt!463814 i!1381))))

(assert (= (and start!92520 res!698470) b!1050148))

(assert (= (and b!1050148 res!698471) b!1050145))

(assert (= (and b!1050145 res!698469) b!1050151))

(assert (= (and b!1050151 res!698468) b!1050150))

(assert (= (and b!1050150 res!698472) b!1050152))

(assert (= (and b!1050152 res!698466) b!1050146))

(assert (= (and b!1050146 res!698467) b!1050153))

(assert (= (and b!1050153 (not res!698473)) b!1050149))

(assert (= (and b!1050146 (not res!698474)) b!1050147))

(declare-fun m!971369 () Bool)

(assert (=> b!1050152 m!971369))

(declare-fun m!971371 () Bool)

(assert (=> b!1050149 m!971371))

(declare-fun m!971373 () Bool)

(assert (=> b!1050148 m!971373))

(declare-fun m!971375 () Bool)

(assert (=> start!92520 m!971375))

(declare-fun m!971377 () Bool)

(assert (=> b!1050151 m!971377))

(declare-fun m!971379 () Bool)

(assert (=> b!1050147 m!971379))

(declare-fun m!971381 () Bool)

(assert (=> b!1050147 m!971381))

(declare-fun m!971383 () Bool)

(assert (=> b!1050146 m!971383))

(declare-fun m!971385 () Bool)

(assert (=> b!1050146 m!971385))

(declare-fun m!971387 () Bool)

(assert (=> b!1050150 m!971387))

(assert (=> b!1050150 m!971383))

(declare-fun m!971389 () Bool)

(assert (=> b!1050145 m!971389))

(check-sat (not b!1050148) (not b!1050150) (not b!1050145) (not start!92520) (not b!1050147) (not b!1050152) (not b!1050149))
(check-sat)
