; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92320 () Bool)

(assert start!92320)

(declare-fun b!1049171 () Bool)

(declare-fun e!595247 () Bool)

(declare-fun e!595249 () Bool)

(assert (=> b!1049171 (= e!595247 e!595249)))

(declare-fun res!698388 () Bool)

(assert (=> b!1049171 (=> (not res!698388) (not e!595249))))

(declare-datatypes ((array!66062 0))(
  ( (array!66063 (arr!31770 (Array (_ BitVec 32) (_ BitVec 64))) (size!32308 (_ BitVec 32))) )
))
(declare-fun lt!463265 () array!66062)

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!66062 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1049171 (= res!698388 (arrayContainsKey!0 lt!463265 k0!2747 #b00000000000000000000000000000000))))

(declare-fun a!3488 () array!66062)

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1049171 (= lt!463265 (array!66063 (store (arr!31770 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32308 a!3488)))))

(declare-fun b!1049172 () Bool)

(declare-fun e!595246 () Bool)

(declare-fun e!595244 () Bool)

(assert (=> b!1049172 (= e!595246 e!595244)))

(declare-fun res!698387 () Bool)

(assert (=> b!1049172 (=> res!698387 e!595244)))

(assert (=> b!1049172 (= res!698387 (bvsge (bvadd #b00000000000000000000000000000001 i!1381) (size!32308 a!3488)))))

(assert (=> b!1049172 (arrayContainsKey!0 a!3488 k0!2747 (bvadd #b00000000000000000000000000000001 i!1381))))

(declare-fun lt!463267 () (_ BitVec 32))

(declare-datatypes ((Unit!34193 0))(
  ( (Unit!34194) )
))
(declare-fun lt!463264 () Unit!34193)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66062 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34193)

(assert (=> b!1049172 (= lt!463264 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k0!2747 lt!463267 (bvadd #b00000000000000000000000000000001 i!1381)))))

(declare-datatypes ((List!22141 0))(
  ( (Nil!22138) (Cons!22137 (h!23346 (_ BitVec 64)) (t!31439 List!22141)) )
))
(declare-fun arrayNoDuplicates!0 (array!66062 (_ BitVec 32) List!22141) Bool)

(assert (=> b!1049172 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22138)))

(declare-fun lt!463266 () Unit!34193)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66062 (_ BitVec 32) (_ BitVec 32)) Unit!34193)

(assert (=> b!1049172 (= lt!463266 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381))))

(declare-fun b!1049173 () Bool)

(declare-fun e!595248 () Bool)

(assert (=> b!1049173 (= e!595248 (not e!595246))))

(declare-fun res!698385 () Bool)

(assert (=> b!1049173 (=> res!698385 e!595246)))

(assert (=> b!1049173 (= res!698385 (bvsle lt!463267 i!1381))))

(declare-fun e!595250 () Bool)

(assert (=> b!1049173 e!595250))

(declare-fun res!698384 () Bool)

(assert (=> b!1049173 (=> (not res!698384) (not e!595250))))

(assert (=> b!1049173 (= res!698384 (= (select (store (arr!31770 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!463267) k0!2747))))

(declare-fun b!1049174 () Bool)

(declare-fun res!698391 () Bool)

(assert (=> b!1049174 (=> (not res!698391) (not e!595247))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1049174 (= res!698391 (validKeyInArray!0 k0!2747))))

(declare-fun b!1049175 () Bool)

(declare-fun res!698381 () Bool)

(assert (=> b!1049175 (=> res!698381 e!595244)))

(declare-fun contains!6079 (List!22141 (_ BitVec 64)) Bool)

(assert (=> b!1049175 (= res!698381 (contains!6079 Nil!22138 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!698390 () Bool)

(assert (=> start!92320 (=> (not res!698390) (not e!595247))))

(assert (=> start!92320 (= res!698390 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32308 a!3488)) (bvslt (size!32308 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92320 e!595247))

(assert (=> start!92320 true))

(declare-fun array_inv!24553 (array!66062) Bool)

(assert (=> start!92320 (array_inv!24553 a!3488)))

(declare-fun b!1049176 () Bool)

(declare-fun res!698389 () Bool)

(assert (=> b!1049176 (=> res!698389 e!595244)))

(declare-fun noDuplicate!1504 (List!22141) Bool)

(assert (=> b!1049176 (= res!698389 (not (noDuplicate!1504 Nil!22138)))))

(declare-fun b!1049177 () Bool)

(assert (=> b!1049177 (= e!595244 true)))

(declare-fun lt!463263 () Bool)

(assert (=> b!1049177 (= lt!463263 (contains!6079 Nil!22138 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!595245 () Bool)

(declare-fun b!1049178 () Bool)

(assert (=> b!1049178 (= e!595245 (arrayContainsKey!0 a!3488 k0!2747 lt!463267))))

(declare-fun b!1049179 () Bool)

(declare-fun res!698392 () Bool)

(assert (=> b!1049179 (=> (not res!698392) (not e!595247))))

(assert (=> b!1049179 (= res!698392 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22138))))

(declare-fun b!1049180 () Bool)

(declare-fun res!698382 () Bool)

(assert (=> b!1049180 (=> (not res!698382) (not e!595247))))

(assert (=> b!1049180 (= res!698382 (= (select (arr!31770 a!3488) i!1381) k0!2747))))

(declare-fun b!1049181 () Bool)

(assert (=> b!1049181 (= e!595249 e!595248)))

(declare-fun res!698386 () Bool)

(assert (=> b!1049181 (=> (not res!698386) (not e!595248))))

(assert (=> b!1049181 (= res!698386 (not (= lt!463267 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66062 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1049181 (= lt!463267 (arrayScanForKey!0 lt!463265 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1049182 () Bool)

(assert (=> b!1049182 (= e!595250 e!595245)))

(declare-fun res!698383 () Bool)

(assert (=> b!1049182 (=> res!698383 e!595245)))

(assert (=> b!1049182 (= res!698383 (bvsle lt!463267 i!1381))))

(assert (= (and start!92320 res!698390) b!1049179))

(assert (= (and b!1049179 res!698392) b!1049174))

(assert (= (and b!1049174 res!698391) b!1049180))

(assert (= (and b!1049180 res!698382) b!1049171))

(assert (= (and b!1049171 res!698388) b!1049181))

(assert (= (and b!1049181 res!698386) b!1049173))

(assert (= (and b!1049173 res!698384) b!1049182))

(assert (= (and b!1049182 (not res!698383)) b!1049178))

(assert (= (and b!1049173 (not res!698385)) b!1049172))

(assert (= (and b!1049172 (not res!698387)) b!1049176))

(assert (= (and b!1049176 (not res!698389)) b!1049175))

(assert (= (and b!1049175 (not res!698381)) b!1049177))

(declare-fun m!969481 () Bool)

(assert (=> b!1049179 m!969481))

(declare-fun m!969483 () Bool)

(assert (=> b!1049177 m!969483))

(declare-fun m!969485 () Bool)

(assert (=> b!1049173 m!969485))

(declare-fun m!969487 () Bool)

(assert (=> b!1049173 m!969487))

(declare-fun m!969489 () Bool)

(assert (=> b!1049174 m!969489))

(declare-fun m!969491 () Bool)

(assert (=> start!92320 m!969491))

(declare-fun m!969493 () Bool)

(assert (=> b!1049181 m!969493))

(declare-fun m!969495 () Bool)

(assert (=> b!1049175 m!969495))

(declare-fun m!969497 () Bool)

(assert (=> b!1049180 m!969497))

(declare-fun m!969499 () Bool)

(assert (=> b!1049171 m!969499))

(assert (=> b!1049171 m!969485))

(declare-fun m!969501 () Bool)

(assert (=> b!1049172 m!969501))

(declare-fun m!969503 () Bool)

(assert (=> b!1049172 m!969503))

(declare-fun m!969505 () Bool)

(assert (=> b!1049172 m!969505))

(declare-fun m!969507 () Bool)

(assert (=> b!1049172 m!969507))

(declare-fun m!969509 () Bool)

(assert (=> b!1049178 m!969509))

(declare-fun m!969511 () Bool)

(assert (=> b!1049176 m!969511))

(check-sat (not b!1049172) (not b!1049171) (not b!1049175) (not b!1049176) (not b!1049181) (not b!1049178) (not start!92320) (not b!1049179) (not b!1049174) (not b!1049177))
(check-sat)
