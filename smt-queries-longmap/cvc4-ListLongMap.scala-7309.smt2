; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93460 () Bool)

(assert start!93460)

(declare-fun b!1058634 () Bool)

(declare-fun e!602295 () Bool)

(declare-fun e!602296 () Bool)

(assert (=> b!1058634 (= e!602295 e!602296)))

(declare-fun res!707208 () Bool)

(assert (=> b!1058634 (=> (not res!707208) (not e!602296))))

(declare-fun lt!467003 () (_ BitVec 32))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1058634 (= res!707208 (not (= lt!467003 i!1381)))))

(declare-datatypes ((array!66763 0))(
  ( (array!66764 (arr!32100 (Array (_ BitVec 32) (_ BitVec 64))) (size!32636 (_ BitVec 32))) )
))
(declare-fun lt!467004 () array!66763)

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!66763 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1058634 (= lt!467003 (arrayScanForKey!0 lt!467004 k!2747 #b00000000000000000000000000000000))))

(declare-fun b!1058635 () Bool)

(assert (=> b!1058635 (= e!602296 (not true))))

(declare-fun a!3488 () array!66763)

(assert (=> b!1058635 (= (select (store (arr!32100 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!467003) k!2747)))

(declare-fun b!1058636 () Bool)

(declare-fun res!707211 () Bool)

(declare-fun e!602294 () Bool)

(assert (=> b!1058636 (=> (not res!707211) (not e!602294))))

(declare-datatypes ((List!22412 0))(
  ( (Nil!22409) (Cons!22408 (h!23617 (_ BitVec 64)) (t!31719 List!22412)) )
))
(declare-fun arrayNoDuplicates!0 (array!66763 (_ BitVec 32) List!22412) Bool)

(assert (=> b!1058636 (= res!707211 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22409))))

(declare-fun b!1058637 () Bool)

(declare-fun res!707210 () Bool)

(assert (=> b!1058637 (=> (not res!707210) (not e!602294))))

(assert (=> b!1058637 (= res!707210 (= (select (arr!32100 a!3488) i!1381) k!2747))))

(declare-fun b!1058638 () Bool)

(declare-fun res!707213 () Bool)

(assert (=> b!1058638 (=> (not res!707213) (not e!602294))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1058638 (= res!707213 (validKeyInArray!0 k!2747))))

(declare-fun res!707209 () Bool)

(assert (=> start!93460 (=> (not res!707209) (not e!602294))))

(assert (=> start!93460 (= res!707209 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32636 a!3488)) (bvslt (size!32636 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!93460 e!602294))

(assert (=> start!93460 true))

(declare-fun array_inv!24880 (array!66763) Bool)

(assert (=> start!93460 (array_inv!24880 a!3488)))

(declare-fun b!1058639 () Bool)

(assert (=> b!1058639 (= e!602294 e!602295)))

(declare-fun res!707212 () Bool)

(assert (=> b!1058639 (=> (not res!707212) (not e!602295))))

(declare-fun arrayContainsKey!0 (array!66763 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1058639 (= res!707212 (arrayContainsKey!0 lt!467004 k!2747 #b00000000000000000000000000000000))))

(assert (=> b!1058639 (= lt!467004 (array!66764 (store (arr!32100 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32636 a!3488)))))

(assert (= (and start!93460 res!707209) b!1058636))

(assert (= (and b!1058636 res!707211) b!1058638))

(assert (= (and b!1058638 res!707213) b!1058637))

(assert (= (and b!1058637 res!707210) b!1058639))

(assert (= (and b!1058639 res!707212) b!1058634))

(assert (= (and b!1058634 res!707208) b!1058635))

(declare-fun m!978289 () Bool)

(assert (=> b!1058634 m!978289))

(declare-fun m!978291 () Bool)

(assert (=> b!1058635 m!978291))

(declare-fun m!978293 () Bool)

(assert (=> b!1058635 m!978293))

(declare-fun m!978295 () Bool)

(assert (=> b!1058638 m!978295))

(declare-fun m!978297 () Bool)

(assert (=> start!93460 m!978297))

(declare-fun m!978299 () Bool)

(assert (=> b!1058639 m!978299))

(assert (=> b!1058639 m!978291))

(declare-fun m!978301 () Bool)

(assert (=> b!1058637 m!978301))

(declare-fun m!978303 () Bool)

(assert (=> b!1058636 m!978303))

(push 1)

(assert (not start!93460))

(assert (not b!1058634))

(assert (not b!1058638))

(assert (not b!1058639))

