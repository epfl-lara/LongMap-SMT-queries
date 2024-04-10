; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92310 () Bool)

(assert start!92310)

(declare-fun b!1049154 () Bool)

(declare-fun e!595209 () Bool)

(assert (=> b!1049154 (= e!595209 true)))

(declare-datatypes ((array!66111 0))(
  ( (array!66112 (arr!31795 (Array (_ BitVec 32) (_ BitVec 64))) (size!32331 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66111)

(declare-fun i!1381 () (_ BitVec 32))

(declare-datatypes ((List!22107 0))(
  ( (Nil!22104) (Cons!22103 (h!23312 (_ BitVec 64)) (t!31414 List!22107)) )
))
(declare-fun arrayNoDuplicates!0 (array!66111 (_ BitVec 32) List!22107) Bool)

(assert (=> b!1049154 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22104)))

(declare-datatypes ((Unit!34310 0))(
  ( (Unit!34311) )
))
(declare-fun lt!463405 () Unit!34310)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66111 (_ BitVec 32) (_ BitVec 32)) Unit!34310)

(assert (=> b!1049154 (= lt!463405 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381))))

(declare-fun b!1049155 () Bool)

(declare-fun e!595210 () Bool)

(declare-fun lt!463406 () (_ BitVec 32))

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!66111 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1049155 (= e!595210 (arrayContainsKey!0 a!3488 k!2747 lt!463406))))

(declare-fun res!698284 () Bool)

(declare-fun e!595211 () Bool)

(assert (=> start!92310 (=> (not res!698284) (not e!595211))))

(assert (=> start!92310 (= res!698284 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32331 a!3488)) (bvslt (size!32331 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92310 e!595211))

(assert (=> start!92310 true))

(declare-fun array_inv!24575 (array!66111) Bool)

(assert (=> start!92310 (array_inv!24575 a!3488)))

(declare-fun b!1049156 () Bool)

(declare-fun e!595212 () Bool)

(assert (=> b!1049156 (= e!595212 e!595210)))

(declare-fun res!698288 () Bool)

(assert (=> b!1049156 (=> res!698288 e!595210)))

(assert (=> b!1049156 (= res!698288 (bvsle lt!463406 i!1381))))

(declare-fun b!1049157 () Bool)

(declare-fun res!698281 () Bool)

(assert (=> b!1049157 (=> (not res!698281) (not e!595211))))

(assert (=> b!1049157 (= res!698281 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22104))))

(declare-fun b!1049158 () Bool)

(declare-fun e!595213 () Bool)

(declare-fun e!595207 () Bool)

(assert (=> b!1049158 (= e!595213 e!595207)))

(declare-fun res!698282 () Bool)

(assert (=> b!1049158 (=> (not res!698282) (not e!595207))))

(assert (=> b!1049158 (= res!698282 (not (= lt!463406 i!1381)))))

(declare-fun lt!463407 () array!66111)

(declare-fun arrayScanForKey!0 (array!66111 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1049158 (= lt!463406 (arrayScanForKey!0 lt!463407 k!2747 #b00000000000000000000000000000000))))

(declare-fun b!1049159 () Bool)

(assert (=> b!1049159 (= e!595211 e!595213)))

(declare-fun res!698283 () Bool)

(assert (=> b!1049159 (=> (not res!698283) (not e!595213))))

(assert (=> b!1049159 (= res!698283 (arrayContainsKey!0 lt!463407 k!2747 #b00000000000000000000000000000000))))

(assert (=> b!1049159 (= lt!463407 (array!66112 (store (arr!31795 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32331 a!3488)))))

(declare-fun b!1049160 () Bool)

(declare-fun res!698286 () Bool)

(assert (=> b!1049160 (=> (not res!698286) (not e!595211))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1049160 (= res!698286 (validKeyInArray!0 k!2747))))

(declare-fun b!1049161 () Bool)

(declare-fun res!698287 () Bool)

(assert (=> b!1049161 (=> (not res!698287) (not e!595211))))

(assert (=> b!1049161 (= res!698287 (= (select (arr!31795 a!3488) i!1381) k!2747))))

(declare-fun b!1049162 () Bool)

(assert (=> b!1049162 (= e!595207 (not e!595209))))

(declare-fun res!698280 () Bool)

(assert (=> b!1049162 (=> res!698280 e!595209)))

(assert (=> b!1049162 (= res!698280 (bvsle lt!463406 i!1381))))

(assert (=> b!1049162 e!595212))

(declare-fun res!698285 () Bool)

(assert (=> b!1049162 (=> (not res!698285) (not e!595212))))

(assert (=> b!1049162 (= res!698285 (= (select (store (arr!31795 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!463406) k!2747))))

(assert (= (and start!92310 res!698284) b!1049157))

(assert (= (and b!1049157 res!698281) b!1049160))

(assert (= (and b!1049160 res!698286) b!1049161))

(assert (= (and b!1049161 res!698287) b!1049159))

(assert (= (and b!1049159 res!698283) b!1049158))

(assert (= (and b!1049158 res!698282) b!1049162))

(assert (= (and b!1049162 res!698285) b!1049156))

(assert (= (and b!1049156 (not res!698288)) b!1049155))

(assert (= (and b!1049162 (not res!698280)) b!1049154))

(declare-fun m!969965 () Bool)

(assert (=> b!1049157 m!969965))

(declare-fun m!969967 () Bool)

(assert (=> b!1049154 m!969967))

(declare-fun m!969969 () Bool)

(assert (=> b!1049154 m!969969))

(declare-fun m!969971 () Bool)

(assert (=> b!1049161 m!969971))

(declare-fun m!969973 () Bool)

(assert (=> b!1049155 m!969973))

(declare-fun m!969975 () Bool)

(assert (=> b!1049158 m!969975))

(declare-fun m!969977 () Bool)

(assert (=> b!1049159 m!969977))

(declare-fun m!969979 () Bool)

(assert (=> b!1049159 m!969979))

(declare-fun m!969981 () Bool)

(assert (=> b!1049160 m!969981))

(assert (=> b!1049162 m!969979))

(declare-fun m!969983 () Bool)

(assert (=> b!1049162 m!969983))

(declare-fun m!969985 () Bool)

(assert (=> start!92310 m!969985))

(push 1)

(assert (not b!1049155))

(assert (not b!1049154))

(assert (not b!1049158))

(assert (not start!92310))

(assert (not b!1049160))

(assert (not b!1049157))

(assert (not b!1049159))

(check-sat)

