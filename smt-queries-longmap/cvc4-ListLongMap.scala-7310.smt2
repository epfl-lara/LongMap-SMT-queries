; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93466 () Bool)

(assert start!93466)

(declare-fun b!1058688 () Bool)

(declare-fun res!707265 () Bool)

(declare-fun e!602330 () Bool)

(assert (=> b!1058688 (=> (not res!707265) (not e!602330))))

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1058688 (= res!707265 (validKeyInArray!0 k!2747))))

(declare-fun b!1058689 () Bool)

(declare-fun e!602332 () Bool)

(declare-fun e!602329 () Bool)

(assert (=> b!1058689 (= e!602332 e!602329)))

(declare-fun res!707267 () Bool)

(assert (=> b!1058689 (=> (not res!707267) (not e!602329))))

(declare-fun lt!467022 () (_ BitVec 32))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1058689 (= res!707267 (not (= lt!467022 i!1381)))))

(declare-datatypes ((array!66769 0))(
  ( (array!66770 (arr!32103 (Array (_ BitVec 32) (_ BitVec 64))) (size!32639 (_ BitVec 32))) )
))
(declare-fun lt!467021 () array!66769)

(declare-fun arrayScanForKey!0 (array!66769 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1058689 (= lt!467022 (arrayScanForKey!0 lt!467021 k!2747 #b00000000000000000000000000000000))))

(declare-fun b!1058690 () Bool)

(declare-fun res!707263 () Bool)

(assert (=> b!1058690 (=> (not res!707263) (not e!602330))))

(declare-fun a!3488 () array!66769)

(assert (=> b!1058690 (= res!707263 (= (select (arr!32103 a!3488) i!1381) k!2747))))

(declare-fun b!1058691 () Bool)

(assert (=> b!1058691 (= e!602329 (not (or (bvsgt lt!467022 i!1381) (bvsgt i!1381 lt!467022))))))

(assert (=> b!1058691 (= (select (store (arr!32103 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!467022) k!2747)))

(declare-fun b!1058692 () Bool)

(assert (=> b!1058692 (= e!602330 e!602332)))

(declare-fun res!707262 () Bool)

(assert (=> b!1058692 (=> (not res!707262) (not e!602332))))

(declare-fun arrayContainsKey!0 (array!66769 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1058692 (= res!707262 (arrayContainsKey!0 lt!467021 k!2747 #b00000000000000000000000000000000))))

(assert (=> b!1058692 (= lt!467021 (array!66770 (store (arr!32103 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32639 a!3488)))))

(declare-fun b!1058693 () Bool)

(declare-fun res!707264 () Bool)

(assert (=> b!1058693 (=> (not res!707264) (not e!602330))))

(declare-datatypes ((List!22415 0))(
  ( (Nil!22412) (Cons!22411 (h!23620 (_ BitVec 64)) (t!31722 List!22415)) )
))
(declare-fun arrayNoDuplicates!0 (array!66769 (_ BitVec 32) List!22415) Bool)

(assert (=> b!1058693 (= res!707264 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22412))))

(declare-fun res!707266 () Bool)

(assert (=> start!93466 (=> (not res!707266) (not e!602330))))

(assert (=> start!93466 (= res!707266 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32639 a!3488)) (bvslt (size!32639 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!93466 e!602330))

(assert (=> start!93466 true))

(declare-fun array_inv!24883 (array!66769) Bool)

(assert (=> start!93466 (array_inv!24883 a!3488)))

(assert (= (and start!93466 res!707266) b!1058693))

(assert (= (and b!1058693 res!707264) b!1058688))

(assert (= (and b!1058688 res!707265) b!1058690))

(assert (= (and b!1058690 res!707263) b!1058692))

(assert (= (and b!1058692 res!707262) b!1058689))

(assert (= (and b!1058689 res!707267) b!1058691))

(declare-fun m!978337 () Bool)

(assert (=> b!1058688 m!978337))

(declare-fun m!978339 () Bool)

(assert (=> b!1058690 m!978339))

(declare-fun m!978341 () Bool)

(assert (=> b!1058692 m!978341))

(declare-fun m!978343 () Bool)

(assert (=> b!1058692 m!978343))

(assert (=> b!1058691 m!978343))

(declare-fun m!978345 () Bool)

(assert (=> b!1058691 m!978345))

(declare-fun m!978347 () Bool)

(assert (=> b!1058693 m!978347))

(declare-fun m!978349 () Bool)

(assert (=> b!1058689 m!978349))

(declare-fun m!978351 () Bool)

(assert (=> start!93466 m!978351))

(push 1)

(assert (not b!1058688))

(assert (not b!1058692))

(assert (not start!93466))

(assert (not b!1058689))

(assert (not b!1058693))

(check-sat)

(pop 1)

(push 1)

(check-sat)

