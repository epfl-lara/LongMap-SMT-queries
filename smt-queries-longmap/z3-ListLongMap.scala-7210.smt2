; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92324 () Bool)

(assert start!92324)

(declare-fun b!1049358 () Bool)

(declare-fun e!595363 () Bool)

(declare-fun e!595360 () Bool)

(assert (=> b!1049358 (= e!595363 (not e!595360))))

(declare-fun res!698489 () Bool)

(assert (=> b!1049358 (=> res!698489 e!595360)))

(declare-fun lt!463480 () (_ BitVec 32))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1049358 (= res!698489 (bvsle lt!463480 i!1381))))

(declare-fun e!595365 () Bool)

(assert (=> b!1049358 e!595365))

(declare-fun res!698487 () Bool)

(assert (=> b!1049358 (=> (not res!698487) (not e!595365))))

(declare-datatypes ((array!66125 0))(
  ( (array!66126 (arr!31802 (Array (_ BitVec 32) (_ BitVec 64))) (size!32338 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66125)

(declare-fun k0!2747 () (_ BitVec 64))

(assert (=> b!1049358 (= res!698487 (= (select (store (arr!31802 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!463480) k0!2747))))

(declare-fun b!1049359 () Bool)

(declare-fun e!595362 () Bool)

(assert (=> b!1049359 (= e!595362 e!595363)))

(declare-fun res!698491 () Bool)

(assert (=> b!1049359 (=> (not res!698491) (not e!595363))))

(assert (=> b!1049359 (= res!698491 (not (= lt!463480 i!1381)))))

(declare-fun lt!463482 () array!66125)

(declare-fun arrayScanForKey!0 (array!66125 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1049359 (= lt!463480 (arrayScanForKey!0 lt!463482 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1049360 () Bool)

(declare-fun e!595366 () Bool)

(assert (=> b!1049360 (= e!595360 e!595366)))

(declare-fun res!698492 () Bool)

(assert (=> b!1049360 (=> res!698492 e!595366)))

(assert (=> b!1049360 (= res!698492 (bvsge (bvadd #b00000000000000000000000000000001 i!1381) (size!32338 a!3488)))))

(declare-fun arrayContainsKey!0 (array!66125 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1049360 (arrayContainsKey!0 a!3488 k0!2747 (bvadd #b00000000000000000000000000000001 i!1381))))

(declare-datatypes ((Unit!34324 0))(
  ( (Unit!34325) )
))
(declare-fun lt!463479 () Unit!34324)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66125 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34324)

(assert (=> b!1049360 (= lt!463479 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k0!2747 lt!463480 (bvadd #b00000000000000000000000000000001 i!1381)))))

(declare-datatypes ((List!22114 0))(
  ( (Nil!22111) (Cons!22110 (h!23319 (_ BitVec 64)) (t!31421 List!22114)) )
))
(declare-fun arrayNoDuplicates!0 (array!66125 (_ BitVec 32) List!22114) Bool)

(assert (=> b!1049360 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22111)))

(declare-fun lt!463481 () Unit!34324)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66125 (_ BitVec 32) (_ BitVec 32)) Unit!34324)

(assert (=> b!1049360 (= lt!463481 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381))))

(declare-fun res!698493 () Bool)

(declare-fun e!595361 () Bool)

(assert (=> start!92324 (=> (not res!698493) (not e!595361))))

(assert (=> start!92324 (= res!698493 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32338 a!3488)) (bvslt (size!32338 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92324 e!595361))

(assert (=> start!92324 true))

(declare-fun array_inv!24582 (array!66125) Bool)

(assert (=> start!92324 (array_inv!24582 a!3488)))

(declare-fun b!1049361 () Bool)

(declare-fun e!595364 () Bool)

(assert (=> b!1049361 (= e!595365 e!595364)))

(declare-fun res!698486 () Bool)

(assert (=> b!1049361 (=> res!698486 e!595364)))

(assert (=> b!1049361 (= res!698486 (bvsle lt!463480 i!1381))))

(declare-fun b!1049362 () Bool)

(declare-fun res!698495 () Bool)

(assert (=> b!1049362 (=> res!698495 e!595366)))

(declare-fun contains!6107 (List!22114 (_ BitVec 64)) Bool)

(assert (=> b!1049362 (= res!698495 (contains!6107 Nil!22111 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1049363 () Bool)

(assert (=> b!1049363 (= e!595364 (arrayContainsKey!0 a!3488 k0!2747 lt!463480))))

(declare-fun b!1049364 () Bool)

(declare-fun res!698484 () Bool)

(assert (=> b!1049364 (=> res!698484 e!595366)))

(declare-fun noDuplicate!1492 (List!22114) Bool)

(assert (=> b!1049364 (= res!698484 (not (noDuplicate!1492 Nil!22111)))))

(declare-fun b!1049365 () Bool)

(declare-fun res!698485 () Bool)

(assert (=> b!1049365 (=> (not res!698485) (not e!595361))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1049365 (= res!698485 (validKeyInArray!0 k0!2747))))

(declare-fun b!1049366 () Bool)

(assert (=> b!1049366 (= e!595366 true)))

(declare-fun lt!463478 () Bool)

(assert (=> b!1049366 (= lt!463478 (contains!6107 Nil!22111 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1049367 () Bool)

(declare-fun res!698494 () Bool)

(assert (=> b!1049367 (=> (not res!698494) (not e!595361))))

(assert (=> b!1049367 (= res!698494 (= (select (arr!31802 a!3488) i!1381) k0!2747))))

(declare-fun b!1049368 () Bool)

(declare-fun res!698490 () Bool)

(assert (=> b!1049368 (=> (not res!698490) (not e!595361))))

(assert (=> b!1049368 (= res!698490 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22111))))

(declare-fun b!1049369 () Bool)

(assert (=> b!1049369 (= e!595361 e!595362)))

(declare-fun res!698488 () Bool)

(assert (=> b!1049369 (=> (not res!698488) (not e!595362))))

(assert (=> b!1049369 (= res!698488 (arrayContainsKey!0 lt!463482 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1049369 (= lt!463482 (array!66126 (store (arr!31802 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32338 a!3488)))))

(assert (= (and start!92324 res!698493) b!1049368))

(assert (= (and b!1049368 res!698490) b!1049365))

(assert (= (and b!1049365 res!698485) b!1049367))

(assert (= (and b!1049367 res!698494) b!1049369))

(assert (= (and b!1049369 res!698488) b!1049359))

(assert (= (and b!1049359 res!698491) b!1049358))

(assert (= (and b!1049358 res!698487) b!1049361))

(assert (= (and b!1049361 (not res!698486)) b!1049363))

(assert (= (and b!1049358 (not res!698489)) b!1049360))

(assert (= (and b!1049360 (not res!698492)) b!1049364))

(assert (= (and b!1049364 (not res!698484)) b!1049362))

(assert (= (and b!1049362 (not res!698495)) b!1049366))

(declare-fun m!970129 () Bool)

(assert (=> b!1049362 m!970129))

(declare-fun m!970131 () Bool)

(assert (=> b!1049360 m!970131))

(declare-fun m!970133 () Bool)

(assert (=> b!1049360 m!970133))

(declare-fun m!970135 () Bool)

(assert (=> b!1049360 m!970135))

(declare-fun m!970137 () Bool)

(assert (=> b!1049360 m!970137))

(declare-fun m!970139 () Bool)

(assert (=> b!1049366 m!970139))

(declare-fun m!970141 () Bool)

(assert (=> b!1049367 m!970141))

(declare-fun m!970143 () Bool)

(assert (=> b!1049365 m!970143))

(declare-fun m!970145 () Bool)

(assert (=> b!1049368 m!970145))

(declare-fun m!970147 () Bool)

(assert (=> b!1049359 m!970147))

(declare-fun m!970149 () Bool)

(assert (=> b!1049363 m!970149))

(declare-fun m!970151 () Bool)

(assert (=> b!1049364 m!970151))

(declare-fun m!970153 () Bool)

(assert (=> b!1049358 m!970153))

(declare-fun m!970155 () Bool)

(assert (=> b!1049358 m!970155))

(declare-fun m!970157 () Bool)

(assert (=> b!1049369 m!970157))

(assert (=> b!1049369 m!970153))

(declare-fun m!970159 () Bool)

(assert (=> start!92324 m!970159))

(check-sat (not b!1049366) (not b!1049369) (not b!1049359) (not b!1049368) (not b!1049364) (not start!92324) (not b!1049362) (not b!1049365) (not b!1049360) (not b!1049363))
