; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93168 () Bool)

(assert start!93168)

(declare-fun b!1056571 () Bool)

(declare-fun res!705316 () Bool)

(declare-fun e!600698 () Bool)

(assert (=> b!1056571 (=> (not res!705316) (not e!600698))))

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1056571 (= res!705316 (validKeyInArray!0 k!2747))))

(declare-fun b!1056572 () Bool)

(declare-fun e!600696 () Bool)

(assert (=> b!1056572 (= e!600696 true)))

(declare-datatypes ((array!66639 0))(
  ( (array!66640 (arr!32044 (Array (_ BitVec 32) (_ BitVec 64))) (size!32580 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66639)

(declare-fun lt!466137 () (_ BitVec 32))

(declare-datatypes ((List!22356 0))(
  ( (Nil!22353) (Cons!22352 (h!23561 (_ BitVec 64)) (t!31663 List!22356)) )
))
(declare-fun arrayNoDuplicates!0 (array!66639 (_ BitVec 32) List!22356) Bool)

(assert (=> b!1056572 (arrayNoDuplicates!0 a!3488 lt!466137 Nil!22353)))

(declare-datatypes ((Unit!34610 0))(
  ( (Unit!34611) )
))
(declare-fun lt!466136 () Unit!34610)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66639 (_ BitVec 32) (_ BitVec 32)) Unit!34610)

(assert (=> b!1056572 (= lt!466136 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 lt!466137))))

(declare-fun b!1056573 () Bool)

(declare-fun res!705319 () Bool)

(assert (=> b!1056573 (=> (not res!705319) (not e!600698))))

(assert (=> b!1056573 (= res!705319 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22353))))

(declare-fun b!1056574 () Bool)

(declare-fun e!600695 () Bool)

(assert (=> b!1056574 (= e!600698 e!600695)))

(declare-fun res!705314 () Bool)

(assert (=> b!1056574 (=> (not res!705314) (not e!600695))))

(declare-fun lt!466135 () array!66639)

(declare-fun arrayContainsKey!0 (array!66639 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1056574 (= res!705314 (arrayContainsKey!0 lt!466135 k!2747 #b00000000000000000000000000000000))))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1056574 (= lt!466135 (array!66640 (store (arr!32044 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32580 a!3488)))))

(declare-fun b!1056575 () Bool)

(declare-fun res!705317 () Bool)

(assert (=> b!1056575 (=> (not res!705317) (not e!600698))))

(assert (=> b!1056575 (= res!705317 (= (select (arr!32044 a!3488) i!1381) k!2747))))

(declare-fun b!1056576 () Bool)

(declare-fun e!600699 () Bool)

(declare-fun e!600697 () Bool)

(assert (=> b!1056576 (= e!600699 e!600697)))

(declare-fun res!705313 () Bool)

(assert (=> b!1056576 (=> res!705313 e!600697)))

(assert (=> b!1056576 (= res!705313 (or (bvsgt lt!466137 i!1381) (bvsle i!1381 lt!466137)))))

(declare-fun b!1056577 () Bool)

(declare-fun e!600700 () Bool)

(assert (=> b!1056577 (= e!600700 (not e!600696))))

(declare-fun res!705318 () Bool)

(assert (=> b!1056577 (=> res!705318 e!600696)))

(assert (=> b!1056577 (= res!705318 (or (bvsgt lt!466137 i!1381) (bvsle i!1381 lt!466137)))))

(assert (=> b!1056577 e!600699))

(declare-fun res!705320 () Bool)

(assert (=> b!1056577 (=> (not res!705320) (not e!600699))))

(assert (=> b!1056577 (= res!705320 (= (select (store (arr!32044 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!466137) k!2747))))

(declare-fun b!1056578 () Bool)

(assert (=> b!1056578 (= e!600697 (arrayContainsKey!0 a!3488 k!2747 i!1381))))

(declare-fun res!705312 () Bool)

(assert (=> start!93168 (=> (not res!705312) (not e!600698))))

(assert (=> start!93168 (= res!705312 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32580 a!3488)) (bvslt (size!32580 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!93168 e!600698))

(assert (=> start!93168 true))

(declare-fun array_inv!24824 (array!66639) Bool)

(assert (=> start!93168 (array_inv!24824 a!3488)))

(declare-fun b!1056570 () Bool)

(assert (=> b!1056570 (= e!600695 e!600700)))

(declare-fun res!705315 () Bool)

(assert (=> b!1056570 (=> (not res!705315) (not e!600700))))

(assert (=> b!1056570 (= res!705315 (not (= lt!466137 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66639 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1056570 (= lt!466137 (arrayScanForKey!0 lt!466135 k!2747 #b00000000000000000000000000000000))))

(assert (= (and start!93168 res!705312) b!1056573))

(assert (= (and b!1056573 res!705319) b!1056571))

(assert (= (and b!1056571 res!705316) b!1056575))

(assert (= (and b!1056575 res!705317) b!1056574))

(assert (= (and b!1056574 res!705314) b!1056570))

(assert (= (and b!1056570 res!705315) b!1056577))

(assert (= (and b!1056577 res!705320) b!1056576))

(assert (= (and b!1056576 (not res!705313)) b!1056578))

(assert (= (and b!1056577 (not res!705318)) b!1056572))

(declare-fun m!976385 () Bool)

(assert (=> b!1056573 m!976385))

(declare-fun m!976387 () Bool)

(assert (=> b!1056577 m!976387))

(declare-fun m!976389 () Bool)

(assert (=> b!1056577 m!976389))

(declare-fun m!976391 () Bool)

(assert (=> b!1056575 m!976391))

(declare-fun m!976393 () Bool)

(assert (=> b!1056574 m!976393))

(assert (=> b!1056574 m!976387))

(declare-fun m!976395 () Bool)

(assert (=> b!1056571 m!976395))

(declare-fun m!976397 () Bool)

(assert (=> b!1056578 m!976397))

(declare-fun m!976399 () Bool)

(assert (=> b!1056572 m!976399))

(declare-fun m!976401 () Bool)

(assert (=> b!1056572 m!976401))

(declare-fun m!976403 () Bool)

(assert (=> b!1056570 m!976403))

(declare-fun m!976405 () Bool)

(assert (=> start!93168 m!976405))

(push 1)

