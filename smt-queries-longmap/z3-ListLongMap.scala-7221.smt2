; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92390 () Bool)

(assert start!92390)

(declare-fun b!1050477 () Bool)

(declare-fun e!596132 () Bool)

(declare-fun e!596133 () Bool)

(assert (=> b!1050477 (= e!596132 e!596133)))

(declare-fun res!699604 () Bool)

(assert (=> b!1050477 (=> (not res!699604) (not e!596133))))

(declare-fun lt!463974 () (_ BitVec 32))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1050477 (= res!699604 (not (= lt!463974 i!1381)))))

(declare-datatypes ((array!66191 0))(
  ( (array!66192 (arr!31835 (Array (_ BitVec 32) (_ BitVec 64))) (size!32371 (_ BitVec 32))) )
))
(declare-fun lt!463976 () array!66191)

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!66191 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1050477 (= lt!463974 (arrayScanForKey!0 lt!463976 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1050478 () Bool)

(declare-fun e!596131 () Bool)

(assert (=> b!1050478 (= e!596131 e!596132)))

(declare-fun res!699605 () Bool)

(assert (=> b!1050478 (=> (not res!699605) (not e!596132))))

(declare-fun arrayContainsKey!0 (array!66191 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1050478 (= res!699605 (arrayContainsKey!0 lt!463976 k0!2747 #b00000000000000000000000000000000))))

(declare-fun a!3488 () array!66191)

(assert (=> b!1050478 (= lt!463976 (array!66192 (store (arr!31835 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32371 a!3488)))))

(declare-fun b!1050479 () Bool)

(declare-fun e!596134 () Bool)

(assert (=> b!1050479 (= e!596134 true)))

(assert (=> b!1050479 false))

(declare-datatypes ((Unit!34390 0))(
  ( (Unit!34391) )
))
(declare-fun lt!463973 () Unit!34390)

(declare-datatypes ((List!22147 0))(
  ( (Nil!22144) (Cons!22143 (h!23352 (_ BitVec 64)) (t!31454 List!22147)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!66191 (_ BitVec 64) (_ BitVec 32) List!22147) Unit!34390)

(assert (=> b!1050479 (= lt!463973 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 a!3488 k0!2747 i!1381 Nil!22144))))

(assert (=> b!1050479 (arrayContainsKey!0 a!3488 k0!2747 (bvadd #b00000000000000000000000000000001 i!1381))))

(declare-fun lt!463977 () Unit!34390)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66191 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34390)

(assert (=> b!1050479 (= lt!463977 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k0!2747 lt!463974 (bvadd #b00000000000000000000000000000001 i!1381)))))

(declare-fun arrayNoDuplicates!0 (array!66191 (_ BitVec 32) List!22147) Bool)

(assert (=> b!1050479 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22144)))

(declare-fun lt!463975 () Unit!34390)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66191 (_ BitVec 32) (_ BitVec 32)) Unit!34390)

(assert (=> b!1050479 (= lt!463975 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381))))

(declare-fun b!1050480 () Bool)

(declare-fun res!699606 () Bool)

(assert (=> b!1050480 (=> (not res!699606) (not e!596131))))

(assert (=> b!1050480 (= res!699606 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22144))))

(declare-fun b!1050481 () Bool)

(declare-fun res!699603 () Bool)

(assert (=> b!1050481 (=> (not res!699603) (not e!596131))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1050481 (= res!699603 (validKeyInArray!0 k0!2747))))

(declare-fun b!1050482 () Bool)

(declare-fun e!596128 () Bool)

(declare-fun e!596130 () Bool)

(assert (=> b!1050482 (= e!596128 e!596130)))

(declare-fun res!699607 () Bool)

(assert (=> b!1050482 (=> res!699607 e!596130)))

(assert (=> b!1050482 (= res!699607 (bvsle lt!463974 i!1381))))

(declare-fun b!1050483 () Bool)

(assert (=> b!1050483 (= e!596133 (not e!596134))))

(declare-fun res!699609 () Bool)

(assert (=> b!1050483 (=> res!699609 e!596134)))

(assert (=> b!1050483 (= res!699609 (bvsle lt!463974 i!1381))))

(assert (=> b!1050483 e!596128))

(declare-fun res!699610 () Bool)

(assert (=> b!1050483 (=> (not res!699610) (not e!596128))))

(assert (=> b!1050483 (= res!699610 (= (select (store (arr!31835 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!463974) k0!2747))))

(declare-fun res!699608 () Bool)

(assert (=> start!92390 (=> (not res!699608) (not e!596131))))

(assert (=> start!92390 (= res!699608 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32371 a!3488)) (bvslt (size!32371 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92390 e!596131))

(assert (=> start!92390 true))

(declare-fun array_inv!24615 (array!66191) Bool)

(assert (=> start!92390 (array_inv!24615 a!3488)))

(declare-fun b!1050484 () Bool)

(assert (=> b!1050484 (= e!596130 (arrayContainsKey!0 a!3488 k0!2747 lt!463974))))

(declare-fun b!1050485 () Bool)

(declare-fun res!699611 () Bool)

(assert (=> b!1050485 (=> (not res!699611) (not e!596131))))

(assert (=> b!1050485 (= res!699611 (= (select (arr!31835 a!3488) i!1381) k0!2747))))

(assert (= (and start!92390 res!699608) b!1050480))

(assert (= (and b!1050480 res!699606) b!1050481))

(assert (= (and b!1050481 res!699603) b!1050485))

(assert (= (and b!1050485 res!699611) b!1050478))

(assert (= (and b!1050478 res!699605) b!1050477))

(assert (= (and b!1050477 res!699604) b!1050483))

(assert (= (and b!1050483 res!699610) b!1050482))

(assert (= (and b!1050482 (not res!699607)) b!1050484))

(assert (= (and b!1050483 (not res!699609)) b!1050479))

(declare-fun m!971157 () Bool)

(assert (=> b!1050485 m!971157))

(declare-fun m!971159 () Bool)

(assert (=> b!1050480 m!971159))

(declare-fun m!971161 () Bool)

(assert (=> b!1050483 m!971161))

(declare-fun m!971163 () Bool)

(assert (=> b!1050483 m!971163))

(declare-fun m!971165 () Bool)

(assert (=> b!1050477 m!971165))

(declare-fun m!971167 () Bool)

(assert (=> b!1050481 m!971167))

(declare-fun m!971169 () Bool)

(assert (=> b!1050479 m!971169))

(declare-fun m!971171 () Bool)

(assert (=> b!1050479 m!971171))

(declare-fun m!971173 () Bool)

(assert (=> b!1050479 m!971173))

(declare-fun m!971175 () Bool)

(assert (=> b!1050479 m!971175))

(declare-fun m!971177 () Bool)

(assert (=> b!1050479 m!971177))

(declare-fun m!971179 () Bool)

(assert (=> b!1050484 m!971179))

(declare-fun m!971181 () Bool)

(assert (=> b!1050478 m!971181))

(assert (=> b!1050478 m!971161))

(declare-fun m!971183 () Bool)

(assert (=> start!92390 m!971183))

(check-sat (not b!1050479) (not b!1050481) (not b!1050478) (not start!92390) (not b!1050480) (not b!1050484) (not b!1050477))
