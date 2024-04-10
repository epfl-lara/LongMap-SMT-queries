; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93306 () Bool)

(assert start!93306)

(declare-fun b!1057590 () Bool)

(declare-fun e!601495 () Bool)

(declare-fun e!601493 () Bool)

(assert (=> b!1057590 (= e!601495 e!601493)))

(declare-fun res!706248 () Bool)

(assert (=> b!1057590 (=> res!706248 e!601493)))

(declare-fun lt!466528 () (_ BitVec 32))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1057590 (= res!706248 (or (bvsgt lt!466528 i!1381) (bvsle i!1381 lt!466528)))))

(declare-datatypes ((array!66705 0))(
  ( (array!66706 (arr!32074 (Array (_ BitVec 32) (_ BitVec 64))) (size!32610 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66705)

(declare-fun b!1057591 () Bool)

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!66705 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1057591 (= e!601493 (arrayContainsKey!0 a!3488 k!2747 i!1381))))

(declare-fun b!1057592 () Bool)

(declare-fun e!601498 () Bool)

(declare-fun e!601497 () Bool)

(assert (=> b!1057592 (= e!601498 e!601497)))

(declare-fun res!706252 () Bool)

(assert (=> b!1057592 (=> (not res!706252) (not e!601497))))

(declare-fun lt!466527 () array!66705)

(assert (=> b!1057592 (= res!706252 (arrayContainsKey!0 lt!466527 k!2747 #b00000000000000000000000000000000))))

(assert (=> b!1057592 (= lt!466527 (array!66706 (store (arr!32074 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32610 a!3488)))))

(declare-fun b!1057593 () Bool)

(declare-fun e!601496 () Bool)

(declare-fun e!601494 () Bool)

(assert (=> b!1057593 (= e!601496 (not e!601494))))

(declare-fun res!706250 () Bool)

(assert (=> b!1057593 (=> res!706250 e!601494)))

(assert (=> b!1057593 (= res!706250 (or (bvsgt lt!466528 i!1381) (bvsle i!1381 lt!466528)))))

(assert (=> b!1057593 e!601495))

(declare-fun res!706253 () Bool)

(assert (=> b!1057593 (=> (not res!706253) (not e!601495))))

(assert (=> b!1057593 (= res!706253 (= (select (store (arr!32074 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!466528) k!2747))))

(declare-fun b!1057595 () Bool)

(declare-fun res!706254 () Bool)

(assert (=> b!1057595 (=> (not res!706254) (not e!601498))))

(assert (=> b!1057595 (= res!706254 (= (select (arr!32074 a!3488) i!1381) k!2747))))

(declare-fun b!1057596 () Bool)

(declare-fun res!706255 () Bool)

(assert (=> b!1057596 (=> (not res!706255) (not e!601498))))

(declare-datatypes ((List!22386 0))(
  ( (Nil!22383) (Cons!22382 (h!23591 (_ BitVec 64)) (t!31693 List!22386)) )
))
(declare-fun arrayNoDuplicates!0 (array!66705 (_ BitVec 32) List!22386) Bool)

(assert (=> b!1057596 (= res!706255 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22383))))

(declare-fun b!1057594 () Bool)

(declare-fun res!706249 () Bool)

(assert (=> b!1057594 (=> (not res!706249) (not e!601498))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1057594 (= res!706249 (validKeyInArray!0 k!2747))))

(declare-fun res!706256 () Bool)

(assert (=> start!93306 (=> (not res!706256) (not e!601498))))

(assert (=> start!93306 (= res!706256 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32610 a!3488)) (bvslt (size!32610 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!93306 e!601498))

(assert (=> start!93306 true))

(declare-fun array_inv!24854 (array!66705) Bool)

(assert (=> start!93306 (array_inv!24854 a!3488)))

(declare-fun b!1057597 () Bool)

(assert (=> b!1057597 (= e!601497 e!601496)))

(declare-fun res!706251 () Bool)

(assert (=> b!1057597 (=> (not res!706251) (not e!601496))))

(assert (=> b!1057597 (= res!706251 (not (= lt!466528 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66705 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1057597 (= lt!466528 (arrayScanForKey!0 lt!466527 k!2747 #b00000000000000000000000000000000))))

(declare-fun lt!466529 () (_ BitVec 32))

(declare-fun b!1057598 () Bool)

(assert (=> b!1057598 (= e!601494 (or (bvslt lt!466528 #b00000000000000000000000000000000) (bvsge lt!466529 (size!32610 a!3488)) (bvslt lt!466528 (size!32610 a!3488))))))

(assert (=> b!1057598 (arrayContainsKey!0 a!3488 k!2747 lt!466529)))

(declare-datatypes ((Unit!34670 0))(
  ( (Unit!34671) )
))
(declare-fun lt!466530 () Unit!34670)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66705 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34670)

(assert (=> b!1057598 (= lt!466530 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k!2747 i!1381 lt!466529))))

(assert (=> b!1057598 (= lt!466529 (bvadd #b00000000000000000000000000000001 lt!466528))))

(assert (=> b!1057598 (arrayNoDuplicates!0 a!3488 lt!466528 Nil!22383)))

(declare-fun lt!466526 () Unit!34670)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66705 (_ BitVec 32) (_ BitVec 32)) Unit!34670)

(assert (=> b!1057598 (= lt!466526 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 lt!466528))))

(assert (= (and start!93306 res!706256) b!1057596))

(assert (= (and b!1057596 res!706255) b!1057594))

(assert (= (and b!1057594 res!706249) b!1057595))

(assert (= (and b!1057595 res!706254) b!1057592))

(assert (= (and b!1057592 res!706252) b!1057597))

(assert (= (and b!1057597 res!706251) b!1057593))

(assert (= (and b!1057593 res!706253) b!1057590))

(assert (= (and b!1057590 (not res!706248)) b!1057591))

(assert (= (and b!1057593 (not res!706250)) b!1057598))

(declare-fun m!977279 () Bool)

(assert (=> b!1057592 m!977279))

(declare-fun m!977281 () Bool)

(assert (=> b!1057592 m!977281))

(declare-fun m!977283 () Bool)

(assert (=> start!93306 m!977283))

(assert (=> b!1057593 m!977281))

(declare-fun m!977285 () Bool)

(assert (=> b!1057593 m!977285))

(declare-fun m!977287 () Bool)

(assert (=> b!1057596 m!977287))

(declare-fun m!977289 () Bool)

(assert (=> b!1057597 m!977289))

(declare-fun m!977291 () Bool)

(assert (=> b!1057594 m!977291))

(declare-fun m!977293 () Bool)

(assert (=> b!1057595 m!977293))

(declare-fun m!977295 () Bool)

(assert (=> b!1057591 m!977295))

(declare-fun m!977297 () Bool)

(assert (=> b!1057598 m!977297))

(declare-fun m!977299 () Bool)

(assert (=> b!1057598 m!977299))

(declare-fun m!977301 () Bool)

(assert (=> b!1057598 m!977301))

(declare-fun m!977303 () Bool)

(assert (=> b!1057598 m!977303))

(push 1)

(assert (not b!1057594))

(assert (not b!1057596))

(assert (not b!1057598))

(assert (not start!93306))

(assert (not b!1057597))

(assert (not b!1057591))

(assert (not b!1057592))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

