; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92312 () Bool)

(assert start!92312)

(declare-fun b!1049181 () Bool)

(declare-fun e!595230 () Bool)

(declare-fun e!595234 () Bool)

(assert (=> b!1049181 (= e!595230 (not e!595234))))

(declare-fun res!698308 () Bool)

(assert (=> b!1049181 (=> res!698308 e!595234)))

(declare-fun lt!463414 () (_ BitVec 32))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1049181 (= res!698308 (bvsle lt!463414 i!1381))))

(declare-fun e!595228 () Bool)

(assert (=> b!1049181 e!595228))

(declare-fun res!698311 () Bool)

(assert (=> b!1049181 (=> (not res!698311) (not e!595228))))

(declare-datatypes ((array!66113 0))(
  ( (array!66114 (arr!31796 (Array (_ BitVec 32) (_ BitVec 64))) (size!32332 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66113)

(declare-fun k0!2747 () (_ BitVec 64))

(assert (=> b!1049181 (= res!698311 (= (select (store (arr!31796 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!463414) k0!2747))))

(declare-fun b!1049182 () Bool)

(declare-fun res!698313 () Bool)

(declare-fun e!595232 () Bool)

(assert (=> b!1049182 (=> (not res!698313) (not e!595232))))

(declare-datatypes ((List!22108 0))(
  ( (Nil!22105) (Cons!22104 (h!23313 (_ BitVec 64)) (t!31415 List!22108)) )
))
(declare-fun arrayNoDuplicates!0 (array!66113 (_ BitVec 32) List!22108) Bool)

(assert (=> b!1049182 (= res!698313 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22105))))

(declare-fun res!698307 () Bool)

(assert (=> start!92312 (=> (not res!698307) (not e!595232))))

(assert (=> start!92312 (= res!698307 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32332 a!3488)) (bvslt (size!32332 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92312 e!595232))

(assert (=> start!92312 true))

(declare-fun array_inv!24576 (array!66113) Bool)

(assert (=> start!92312 (array_inv!24576 a!3488)))

(declare-fun b!1049183 () Bool)

(declare-fun res!698315 () Bool)

(assert (=> b!1049183 (=> (not res!698315) (not e!595232))))

(assert (=> b!1049183 (= res!698315 (= (select (arr!31796 a!3488) i!1381) k0!2747))))

(declare-fun b!1049184 () Bool)

(declare-fun e!595229 () Bool)

(declare-fun arrayContainsKey!0 (array!66113 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1049184 (= e!595229 (arrayContainsKey!0 a!3488 k0!2747 lt!463414))))

(declare-fun b!1049185 () Bool)

(declare-fun res!698312 () Bool)

(assert (=> b!1049185 (=> (not res!698312) (not e!595232))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1049185 (= res!698312 (validKeyInArray!0 k0!2747))))

(declare-fun b!1049186 () Bool)

(declare-fun e!595233 () Bool)

(assert (=> b!1049186 (= e!595232 e!595233)))

(declare-fun res!698314 () Bool)

(assert (=> b!1049186 (=> (not res!698314) (not e!595233))))

(declare-fun lt!463415 () array!66113)

(assert (=> b!1049186 (= res!698314 (arrayContainsKey!0 lt!463415 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1049186 (= lt!463415 (array!66114 (store (arr!31796 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32332 a!3488)))))

(declare-fun b!1049187 () Bool)

(assert (=> b!1049187 (= e!595233 e!595230)))

(declare-fun res!698310 () Bool)

(assert (=> b!1049187 (=> (not res!698310) (not e!595230))))

(assert (=> b!1049187 (= res!698310 (not (= lt!463414 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66113 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1049187 (= lt!463414 (arrayScanForKey!0 lt!463415 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1049188 () Bool)

(assert (=> b!1049188 (= e!595228 e!595229)))

(declare-fun res!698309 () Bool)

(assert (=> b!1049188 (=> res!698309 e!595229)))

(assert (=> b!1049188 (= res!698309 (bvsle lt!463414 i!1381))))

(declare-fun b!1049189 () Bool)

(assert (=> b!1049189 (= e!595234 true)))

(assert (=> b!1049189 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22105)))

(declare-datatypes ((Unit!34312 0))(
  ( (Unit!34313) )
))
(declare-fun lt!463416 () Unit!34312)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66113 (_ BitVec 32) (_ BitVec 32)) Unit!34312)

(assert (=> b!1049189 (= lt!463416 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381))))

(assert (= (and start!92312 res!698307) b!1049182))

(assert (= (and b!1049182 res!698313) b!1049185))

(assert (= (and b!1049185 res!698312) b!1049183))

(assert (= (and b!1049183 res!698315) b!1049186))

(assert (= (and b!1049186 res!698314) b!1049187))

(assert (= (and b!1049187 res!698310) b!1049181))

(assert (= (and b!1049181 res!698311) b!1049188))

(assert (= (and b!1049188 (not res!698309)) b!1049184))

(assert (= (and b!1049181 (not res!698308)) b!1049189))

(declare-fun m!969987 () Bool)

(assert (=> b!1049183 m!969987))

(declare-fun m!969989 () Bool)

(assert (=> b!1049187 m!969989))

(declare-fun m!969991 () Bool)

(assert (=> start!92312 m!969991))

(declare-fun m!969993 () Bool)

(assert (=> b!1049185 m!969993))

(declare-fun m!969995 () Bool)

(assert (=> b!1049182 m!969995))

(declare-fun m!969997 () Bool)

(assert (=> b!1049184 m!969997))

(declare-fun m!969999 () Bool)

(assert (=> b!1049181 m!969999))

(declare-fun m!970001 () Bool)

(assert (=> b!1049181 m!970001))

(declare-fun m!970003 () Bool)

(assert (=> b!1049186 m!970003))

(assert (=> b!1049186 m!969999))

(declare-fun m!970005 () Bool)

(assert (=> b!1049189 m!970005))

(declare-fun m!970007 () Bool)

(assert (=> b!1049189 m!970007))

(check-sat (not b!1049184) (not b!1049182) (not b!1049187) (not b!1049189) (not start!92312) (not b!1049185) (not b!1049186))
