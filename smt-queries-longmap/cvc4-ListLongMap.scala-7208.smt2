; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92314 () Bool)

(assert start!92314)

(declare-fun b!1049208 () Bool)

(declare-fun e!595253 () Bool)

(assert (=> b!1049208 (= e!595253 true)))

(declare-datatypes ((array!66115 0))(
  ( (array!66116 (arr!31797 (Array (_ BitVec 32) (_ BitVec 64))) (size!32333 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66115)

(declare-fun i!1381 () (_ BitVec 32))

(declare-datatypes ((List!22109 0))(
  ( (Nil!22106) (Cons!22105 (h!23314 (_ BitVec 64)) (t!31416 List!22109)) )
))
(declare-fun arrayNoDuplicates!0 (array!66115 (_ BitVec 32) List!22109) Bool)

(assert (=> b!1049208 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22106)))

(declare-datatypes ((Unit!34314 0))(
  ( (Unit!34315) )
))
(declare-fun lt!463424 () Unit!34314)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66115 (_ BitVec 32) (_ BitVec 32)) Unit!34314)

(assert (=> b!1049208 (= lt!463424 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381))))

(declare-fun b!1049209 () Bool)

(declare-fun e!595251 () Bool)

(declare-fun e!595249 () Bool)

(assert (=> b!1049209 (= e!595251 e!595249)))

(declare-fun res!698336 () Bool)

(assert (=> b!1049209 (=> (not res!698336) (not e!595249))))

(declare-fun lt!463423 () array!66115)

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!66115 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1049209 (= res!698336 (arrayContainsKey!0 lt!463423 k!2747 #b00000000000000000000000000000000))))

(assert (=> b!1049209 (= lt!463423 (array!66116 (store (arr!31797 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32333 a!3488)))))

(declare-fun res!698335 () Bool)

(assert (=> start!92314 (=> (not res!698335) (not e!595251))))

(assert (=> start!92314 (= res!698335 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32333 a!3488)) (bvslt (size!32333 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92314 e!595251))

(assert (=> start!92314 true))

(declare-fun array_inv!24577 (array!66115) Bool)

(assert (=> start!92314 (array_inv!24577 a!3488)))

(declare-fun b!1049210 () Bool)

(declare-fun res!698338 () Bool)

(assert (=> b!1049210 (=> (not res!698338) (not e!595251))))

(assert (=> b!1049210 (= res!698338 (= (select (arr!31797 a!3488) i!1381) k!2747))))

(declare-fun lt!463425 () (_ BitVec 32))

(declare-fun e!595250 () Bool)

(declare-fun b!1049211 () Bool)

(assert (=> b!1049211 (= e!595250 (arrayContainsKey!0 a!3488 k!2747 lt!463425))))

(declare-fun b!1049212 () Bool)

(declare-fun res!698342 () Bool)

(assert (=> b!1049212 (=> (not res!698342) (not e!595251))))

(assert (=> b!1049212 (= res!698342 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22106))))

(declare-fun b!1049213 () Bool)

(declare-fun e!595254 () Bool)

(assert (=> b!1049213 (= e!595254 (not e!595253))))

(declare-fun res!698334 () Bool)

(assert (=> b!1049213 (=> res!698334 e!595253)))

(assert (=> b!1049213 (= res!698334 (bvsle lt!463425 i!1381))))

(declare-fun e!595252 () Bool)

(assert (=> b!1049213 e!595252))

(declare-fun res!698337 () Bool)

(assert (=> b!1049213 (=> (not res!698337) (not e!595252))))

(assert (=> b!1049213 (= res!698337 (= (select (store (arr!31797 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!463425) k!2747))))

(declare-fun b!1049214 () Bool)

(declare-fun res!698340 () Bool)

(assert (=> b!1049214 (=> (not res!698340) (not e!595251))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1049214 (= res!698340 (validKeyInArray!0 k!2747))))

(declare-fun b!1049215 () Bool)

(assert (=> b!1049215 (= e!595249 e!595254)))

(declare-fun res!698339 () Bool)

(assert (=> b!1049215 (=> (not res!698339) (not e!595254))))

(assert (=> b!1049215 (= res!698339 (not (= lt!463425 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66115 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1049215 (= lt!463425 (arrayScanForKey!0 lt!463423 k!2747 #b00000000000000000000000000000000))))

(declare-fun b!1049216 () Bool)

(assert (=> b!1049216 (= e!595252 e!595250)))

(declare-fun res!698341 () Bool)

(assert (=> b!1049216 (=> res!698341 e!595250)))

(assert (=> b!1049216 (= res!698341 (bvsle lt!463425 i!1381))))

(assert (= (and start!92314 res!698335) b!1049212))

(assert (= (and b!1049212 res!698342) b!1049214))

(assert (= (and b!1049214 res!698340) b!1049210))

(assert (= (and b!1049210 res!698338) b!1049209))

(assert (= (and b!1049209 res!698336) b!1049215))

(assert (= (and b!1049215 res!698339) b!1049213))

(assert (= (and b!1049213 res!698337) b!1049216))

(assert (= (and b!1049216 (not res!698341)) b!1049211))

(assert (= (and b!1049213 (not res!698334)) b!1049208))

(declare-fun m!970009 () Bool)

(assert (=> b!1049215 m!970009))

(declare-fun m!970011 () Bool)

(assert (=> b!1049213 m!970011))

(declare-fun m!970013 () Bool)

(assert (=> b!1049213 m!970013))

(declare-fun m!970015 () Bool)

(assert (=> start!92314 m!970015))

(declare-fun m!970017 () Bool)

(assert (=> b!1049209 m!970017))

(assert (=> b!1049209 m!970011))

(declare-fun m!970019 () Bool)

(assert (=> b!1049210 m!970019))

(declare-fun m!970021 () Bool)

(assert (=> b!1049214 m!970021))

(declare-fun m!970023 () Bool)

(assert (=> b!1049208 m!970023))

(declare-fun m!970025 () Bool)

(assert (=> b!1049208 m!970025))

(declare-fun m!970027 () Bool)

(assert (=> b!1049211 m!970027))

(declare-fun m!970029 () Bool)

(assert (=> b!1049212 m!970029))

(push 1)

(assert (not b!1049209))

(assert (not b!1049215))

(assert (not b!1049208))

(assert (not b!1049211))

(assert (not start!92314))

(assert (not b!1049212))

(assert (not b!1049214))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

