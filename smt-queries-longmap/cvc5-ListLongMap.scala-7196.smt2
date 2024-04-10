; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92208 () Bool)

(assert start!92208)

(declare-fun b!1048221 () Bool)

(declare-fun res!697385 () Bool)

(declare-fun e!594509 () Bool)

(assert (=> b!1048221 (=> (not res!697385) (not e!594509))))

(declare-datatypes ((array!66036 0))(
  ( (array!66037 (arr!31759 (Array (_ BitVec 32) (_ BitVec 64))) (size!32295 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66036)

(declare-datatypes ((List!22071 0))(
  ( (Nil!22068) (Cons!22067 (h!23276 (_ BitVec 64)) (t!31378 List!22071)) )
))
(declare-fun arrayNoDuplicates!0 (array!66036 (_ BitVec 32) List!22071) Bool)

(assert (=> b!1048221 (= res!697385 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22068))))

(declare-fun b!1048222 () Bool)

(declare-fun res!697387 () Bool)

(assert (=> b!1048222 (=> (not res!697387) (not e!594509))))

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1048222 (= res!697387 (validKeyInArray!0 k!2747))))

(declare-fun b!1048223 () Bool)

(declare-fun e!594511 () Bool)

(declare-fun lt!463143 () (_ BitVec 32))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1048223 (= e!594511 (not (or (bvsle lt!463143 i!1381) (bvsge lt!463143 #b00000000000000000000000000000000))))))

(assert (=> b!1048223 (= (select (store (arr!31759 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!463143) k!2747)))

(declare-fun b!1048224 () Bool)

(declare-fun res!697388 () Bool)

(assert (=> b!1048224 (=> (not res!697388) (not e!594509))))

(assert (=> b!1048224 (= res!697388 (= (select (arr!31759 a!3488) i!1381) k!2747))))

(declare-fun b!1048225 () Bool)

(declare-fun e!594510 () Bool)

(assert (=> b!1048225 (= e!594509 e!594510)))

(declare-fun res!697383 () Bool)

(assert (=> b!1048225 (=> (not res!697383) (not e!594510))))

(declare-fun lt!463142 () array!66036)

(declare-fun arrayContainsKey!0 (array!66036 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1048225 (= res!697383 (arrayContainsKey!0 lt!463142 k!2747 #b00000000000000000000000000000000))))

(assert (=> b!1048225 (= lt!463142 (array!66037 (store (arr!31759 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32295 a!3488)))))

(declare-fun b!1048226 () Bool)

(assert (=> b!1048226 (= e!594510 e!594511)))

(declare-fun res!697384 () Bool)

(assert (=> b!1048226 (=> (not res!697384) (not e!594511))))

(assert (=> b!1048226 (= res!697384 (not (= lt!463143 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66036 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1048226 (= lt!463143 (arrayScanForKey!0 lt!463142 k!2747 #b00000000000000000000000000000000))))

(declare-fun res!697386 () Bool)

(assert (=> start!92208 (=> (not res!697386) (not e!594509))))

(assert (=> start!92208 (= res!697386 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32295 a!3488)) (bvslt (size!32295 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92208 e!594509))

(assert (=> start!92208 true))

(declare-fun array_inv!24539 (array!66036) Bool)

(assert (=> start!92208 (array_inv!24539 a!3488)))

(assert (= (and start!92208 res!697386) b!1048221))

(assert (= (and b!1048221 res!697385) b!1048222))

(assert (= (and b!1048222 res!697387) b!1048224))

(assert (= (and b!1048224 res!697388) b!1048225))

(assert (= (and b!1048225 res!697383) b!1048226))

(assert (= (and b!1048226 res!697384) b!1048223))

(declare-fun m!969239 () Bool)

(assert (=> b!1048223 m!969239))

(declare-fun m!969241 () Bool)

(assert (=> b!1048223 m!969241))

(declare-fun m!969243 () Bool)

(assert (=> start!92208 m!969243))

(declare-fun m!969245 () Bool)

(assert (=> b!1048225 m!969245))

(assert (=> b!1048225 m!969239))

(declare-fun m!969247 () Bool)

(assert (=> b!1048221 m!969247))

(declare-fun m!969249 () Bool)

(assert (=> b!1048224 m!969249))

(declare-fun m!969251 () Bool)

(assert (=> b!1048222 m!969251))

(declare-fun m!969253 () Bool)

(assert (=> b!1048226 m!969253))

(push 1)

