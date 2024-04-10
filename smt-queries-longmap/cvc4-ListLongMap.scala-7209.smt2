; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92320 () Bool)

(assert start!92320)

(declare-fun b!1049289 () Bool)

(declare-fun res!698415 () Bool)

(declare-fun e!595317 () Bool)

(assert (=> b!1049289 (=> (not res!698415) (not e!595317))))

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1049289 (= res!698415 (validKeyInArray!0 k!2747))))

(declare-fun b!1049290 () Bool)

(declare-fun lt!463450 () (_ BitVec 32))

(declare-datatypes ((array!66121 0))(
  ( (array!66122 (arr!31800 (Array (_ BitVec 32) (_ BitVec 64))) (size!32336 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66121)

(declare-fun e!595316 () Bool)

(declare-fun arrayContainsKey!0 (array!66121 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1049290 (= e!595316 (arrayContainsKey!0 a!3488 k!2747 lt!463450))))

(declare-fun b!1049291 () Bool)

(declare-fun e!595312 () Bool)

(assert (=> b!1049291 (= e!595312 true)))

(declare-fun i!1381 () (_ BitVec 32))

(declare-datatypes ((List!22112 0))(
  ( (Nil!22109) (Cons!22108 (h!23317 (_ BitVec 64)) (t!31419 List!22112)) )
))
(declare-fun arrayNoDuplicates!0 (array!66121 (_ BitVec 32) List!22112) Bool)

(assert (=> b!1049291 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22109)))

(declare-datatypes ((Unit!34320 0))(
  ( (Unit!34321) )
))
(declare-fun lt!463451 () Unit!34320)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66121 (_ BitVec 32) (_ BitVec 32)) Unit!34320)

(assert (=> b!1049291 (= lt!463451 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381))))

(declare-fun b!1049292 () Bool)

(declare-fun e!595318 () Bool)

(declare-fun e!595315 () Bool)

(assert (=> b!1049292 (= e!595318 e!595315)))

(declare-fun res!698420 () Bool)

(assert (=> b!1049292 (=> (not res!698420) (not e!595315))))

(assert (=> b!1049292 (= res!698420 (not (= lt!463450 i!1381)))))

(declare-fun lt!463452 () array!66121)

(declare-fun arrayScanForKey!0 (array!66121 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1049292 (= lt!463450 (arrayScanForKey!0 lt!463452 k!2747 #b00000000000000000000000000000000))))

(declare-fun res!698417 () Bool)

(assert (=> start!92320 (=> (not res!698417) (not e!595317))))

(assert (=> start!92320 (= res!698417 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32336 a!3488)) (bvslt (size!32336 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92320 e!595317))

(assert (=> start!92320 true))

(declare-fun array_inv!24580 (array!66121) Bool)

(assert (=> start!92320 (array_inv!24580 a!3488)))

(declare-fun b!1049293 () Bool)

(declare-fun e!595313 () Bool)

(assert (=> b!1049293 (= e!595313 e!595316)))

(declare-fun res!698416 () Bool)

(assert (=> b!1049293 (=> res!698416 e!595316)))

(assert (=> b!1049293 (= res!698416 (bvsle lt!463450 i!1381))))

(declare-fun b!1049294 () Bool)

(assert (=> b!1049294 (= e!595315 (not e!595312))))

(declare-fun res!698421 () Bool)

(assert (=> b!1049294 (=> res!698421 e!595312)))

(assert (=> b!1049294 (= res!698421 (bvsle lt!463450 i!1381))))

(assert (=> b!1049294 e!595313))

(declare-fun res!698423 () Bool)

(assert (=> b!1049294 (=> (not res!698423) (not e!595313))))

(assert (=> b!1049294 (= res!698423 (= (select (store (arr!31800 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!463450) k!2747))))

(declare-fun b!1049295 () Bool)

(declare-fun res!698418 () Bool)

(assert (=> b!1049295 (=> (not res!698418) (not e!595317))))

(assert (=> b!1049295 (= res!698418 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22109))))

(declare-fun b!1049296 () Bool)

(assert (=> b!1049296 (= e!595317 e!595318)))

(declare-fun res!698419 () Bool)

(assert (=> b!1049296 (=> (not res!698419) (not e!595318))))

(assert (=> b!1049296 (= res!698419 (arrayContainsKey!0 lt!463452 k!2747 #b00000000000000000000000000000000))))

(assert (=> b!1049296 (= lt!463452 (array!66122 (store (arr!31800 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32336 a!3488)))))

(declare-fun b!1049297 () Bool)

(declare-fun res!698422 () Bool)

(assert (=> b!1049297 (=> (not res!698422) (not e!595317))))

(assert (=> b!1049297 (= res!698422 (= (select (arr!31800 a!3488) i!1381) k!2747))))

(assert (= (and start!92320 res!698417) b!1049295))

(assert (= (and b!1049295 res!698418) b!1049289))

(assert (= (and b!1049289 res!698415) b!1049297))

(assert (= (and b!1049297 res!698422) b!1049296))

(assert (= (and b!1049296 res!698419) b!1049292))

(assert (= (and b!1049292 res!698420) b!1049294))

(assert (= (and b!1049294 res!698423) b!1049293))

(assert (= (and b!1049293 (not res!698416)) b!1049290))

(assert (= (and b!1049294 (not res!698421)) b!1049291))

(declare-fun m!970075 () Bool)

(assert (=> b!1049290 m!970075))

(declare-fun m!970077 () Bool)

(assert (=> b!1049296 m!970077))

(declare-fun m!970079 () Bool)

(assert (=> b!1049296 m!970079))

(declare-fun m!970081 () Bool)

(assert (=> b!1049289 m!970081))

(declare-fun m!970083 () Bool)

(assert (=> b!1049297 m!970083))

(declare-fun m!970085 () Bool)

(assert (=> b!1049291 m!970085))

(declare-fun m!970087 () Bool)

(assert (=> b!1049291 m!970087))

(assert (=> b!1049294 m!970079))

(declare-fun m!970089 () Bool)

(assert (=> b!1049294 m!970089))

(declare-fun m!970091 () Bool)

(assert (=> b!1049295 m!970091))

(declare-fun m!970093 () Bool)

(assert (=> b!1049292 m!970093))

(declare-fun m!970095 () Bool)

(assert (=> start!92320 m!970095))

(push 1)

(assert (not b!1049292))

(assert (not b!1049291))

(assert (not start!92320))

(assert (not b!1049296))

(assert (not b!1049290))

(assert (not b!1049295))

(assert (not b!1049289))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

