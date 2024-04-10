; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93124 () Bool)

(assert start!93124)

(declare-fun e!600497 () Bool)

(declare-datatypes ((array!66622 0))(
  ( (array!66623 (arr!32037 (Array (_ BitVec 32) (_ BitVec 64))) (size!32573 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66622)

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun i!1381 () (_ BitVec 32))

(declare-fun b!1056313 () Bool)

(declare-fun arrayContainsKey!0 (array!66622 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1056313 (= e!600497 (arrayContainsKey!0 a!3488 k!2747 i!1381))))

(declare-fun b!1056314 () Bool)

(declare-fun res!705094 () Bool)

(declare-fun e!600502 () Bool)

(assert (=> b!1056314 (=> (not res!705094) (not e!600502))))

(assert (=> b!1056314 (= res!705094 (= (select (arr!32037 a!3488) i!1381) k!2747))))

(declare-fun b!1056316 () Bool)

(declare-fun res!705095 () Bool)

(assert (=> b!1056316 (=> (not res!705095) (not e!600502))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1056316 (= res!705095 (validKeyInArray!0 k!2747))))

(declare-fun b!1056317 () Bool)

(declare-fun e!600500 () Bool)

(assert (=> b!1056317 (= e!600502 e!600500)))

(declare-fun res!705093 () Bool)

(assert (=> b!1056317 (=> (not res!705093) (not e!600500))))

(declare-fun lt!466082 () array!66622)

(assert (=> b!1056317 (= res!705093 (arrayContainsKey!0 lt!466082 k!2747 #b00000000000000000000000000000000))))

(assert (=> b!1056317 (= lt!466082 (array!66623 (store (arr!32037 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32573 a!3488)))))

(declare-fun b!1056318 () Bool)

(declare-fun e!600499 () Bool)

(assert (=> b!1056318 (= e!600500 e!600499)))

(declare-fun res!705096 () Bool)

(assert (=> b!1056318 (=> (not res!705096) (not e!600499))))

(declare-fun lt!466083 () (_ BitVec 32))

(assert (=> b!1056318 (= res!705096 (not (= lt!466083 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66622 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1056318 (= lt!466083 (arrayScanForKey!0 lt!466082 k!2747 #b00000000000000000000000000000000))))

(declare-fun b!1056319 () Bool)

(declare-fun res!705098 () Bool)

(assert (=> b!1056319 (=> (not res!705098) (not e!600502))))

(declare-datatypes ((List!22349 0))(
  ( (Nil!22346) (Cons!22345 (h!23554 (_ BitVec 64)) (t!31656 List!22349)) )
))
(declare-fun arrayNoDuplicates!0 (array!66622 (_ BitVec 32) List!22349) Bool)

(assert (=> b!1056319 (= res!705098 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22346))))

(declare-fun b!1056320 () Bool)

(declare-fun e!600501 () Bool)

(assert (=> b!1056320 (= e!600501 e!600497)))

(declare-fun res!705091 () Bool)

(assert (=> b!1056320 (=> res!705091 e!600497)))

(assert (=> b!1056320 (= res!705091 (or (bvsgt lt!466083 i!1381) (bvsle i!1381 lt!466083)))))

(declare-fun b!1056315 () Bool)

(assert (=> b!1056315 (= e!600499 (not (or (bvsgt lt!466083 i!1381) (bvsle i!1381 lt!466083) (bvsle #b00000000000000000000000000000000 (size!32573 a!3488)))))))

(assert (=> b!1056315 e!600501))

(declare-fun res!705097 () Bool)

(assert (=> b!1056315 (=> (not res!705097) (not e!600501))))

(assert (=> b!1056315 (= res!705097 (= (select (store (arr!32037 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!466083) k!2747))))

(declare-fun res!705092 () Bool)

(assert (=> start!93124 (=> (not res!705092) (not e!600502))))

(assert (=> start!93124 (= res!705092 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32573 a!3488)) (bvslt (size!32573 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!93124 e!600502))

(assert (=> start!93124 true))

(declare-fun array_inv!24817 (array!66622) Bool)

(assert (=> start!93124 (array_inv!24817 a!3488)))

(assert (= (and start!93124 res!705092) b!1056319))

(assert (= (and b!1056319 res!705098) b!1056316))

(assert (= (and b!1056316 res!705095) b!1056314))

(assert (= (and b!1056314 res!705094) b!1056317))

(assert (= (and b!1056317 res!705093) b!1056318))

(assert (= (and b!1056318 res!705096) b!1056315))

(assert (= (and b!1056315 res!705097) b!1056320))

(assert (= (and b!1056320 (not res!705091)) b!1056313))

(declare-fun m!976205 () Bool)

(assert (=> b!1056318 m!976205))

(declare-fun m!976207 () Bool)

(assert (=> b!1056317 m!976207))

(declare-fun m!976209 () Bool)

(assert (=> b!1056317 m!976209))

(declare-fun m!976211 () Bool)

(assert (=> b!1056319 m!976211))

(declare-fun m!976213 () Bool)

(assert (=> start!93124 m!976213))

(declare-fun m!976215 () Bool)

(assert (=> b!1056314 m!976215))

(assert (=> b!1056315 m!976209))

(declare-fun m!976217 () Bool)

(assert (=> b!1056315 m!976217))

(declare-fun m!976219 () Bool)

(assert (=> b!1056313 m!976219))

(declare-fun m!976221 () Bool)

(assert (=> b!1056316 m!976221))

(push 1)

(assert (not b!1056318))

(assert (not start!93124))

