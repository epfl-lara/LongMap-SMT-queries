; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92516 () Bool)

(assert start!92516)

(declare-fun b!1052229 () Bool)

(declare-fun e!597385 () Bool)

(declare-fun e!597384 () Bool)

(assert (=> b!1052229 (= e!597385 e!597384)))

(declare-fun res!701364 () Bool)

(assert (=> b!1052229 (=> res!701364 e!597384)))

(declare-fun lt!464656 () (_ BitVec 32))

(declare-datatypes ((array!66317 0))(
  ( (array!66318 (arr!31898 (Array (_ BitVec 32) (_ BitVec 64))) (size!32434 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66317)

(declare-fun lt!464654 () (_ BitVec 32))

(assert (=> b!1052229 (= res!701364 (or (bvslt lt!464656 #b00000000000000000000000000000000) (bvsge lt!464654 (size!32434 a!3488)) (bvsge lt!464656 (size!32434 a!3488))))))

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!66317 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1052229 (arrayContainsKey!0 a!3488 k0!2747 lt!464654)))

(declare-datatypes ((Unit!34468 0))(
  ( (Unit!34469) )
))
(declare-fun lt!464658 () Unit!34468)

(declare-fun i!1381 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66317 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34468)

(assert (=> b!1052229 (= lt!464658 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k0!2747 i!1381 lt!464654))))

(assert (=> b!1052229 (= lt!464654 (bvadd #b00000000000000000000000000000001 lt!464656))))

(declare-datatypes ((List!22210 0))(
  ( (Nil!22207) (Cons!22206 (h!23415 (_ BitVec 64)) (t!31517 List!22210)) )
))
(declare-fun arrayNoDuplicates!0 (array!66317 (_ BitVec 32) List!22210) Bool)

(assert (=> b!1052229 (arrayNoDuplicates!0 a!3488 lt!464656 Nil!22207)))

(declare-fun lt!464655 () Unit!34468)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66317 (_ BitVec 32) (_ BitVec 32)) Unit!34468)

(assert (=> b!1052229 (= lt!464655 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 lt!464656))))

(declare-fun b!1052230 () Bool)

(declare-fun e!597391 () Bool)

(declare-fun e!597387 () Bool)

(assert (=> b!1052230 (= e!597391 e!597387)))

(declare-fun res!701362 () Bool)

(assert (=> b!1052230 (=> (not res!701362) (not e!597387))))

(assert (=> b!1052230 (= res!701362 (not (= lt!464656 i!1381)))))

(declare-fun lt!464657 () array!66317)

(declare-fun arrayScanForKey!0 (array!66317 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1052230 (= lt!464656 (arrayScanForKey!0 lt!464657 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1052231 () Bool)

(assert (=> b!1052231 (= e!597387 (not e!597385))))

(declare-fun res!701359 () Bool)

(assert (=> b!1052231 (=> res!701359 e!597385)))

(assert (=> b!1052231 (= res!701359 (or (bvsgt lt!464656 i!1381) (bvsle i!1381 lt!464656)))))

(declare-fun e!597388 () Bool)

(assert (=> b!1052231 e!597388))

(declare-fun res!701361 () Bool)

(assert (=> b!1052231 (=> (not res!701361) (not e!597388))))

(assert (=> b!1052231 (= res!701361 (= (select (store (arr!31898 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!464656) k0!2747))))

(declare-fun b!1052232 () Bool)

(declare-fun res!701358 () Bool)

(declare-fun e!597389 () Bool)

(assert (=> b!1052232 (=> (not res!701358) (not e!597389))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1052232 (= res!701358 (validKeyInArray!0 k0!2747))))

(declare-fun b!1052233 () Bool)

(declare-fun e!597390 () Bool)

(assert (=> b!1052233 (= e!597388 e!597390)))

(declare-fun res!701355 () Bool)

(assert (=> b!1052233 (=> res!701355 e!597390)))

(assert (=> b!1052233 (= res!701355 (or (bvsgt lt!464656 i!1381) (bvsle i!1381 lt!464656)))))

(declare-fun b!1052234 () Bool)

(assert (=> b!1052234 (= e!597390 (arrayContainsKey!0 a!3488 k0!2747 i!1381))))

(declare-fun res!701365 () Bool)

(assert (=> start!92516 (=> (not res!701365) (not e!597389))))

(assert (=> start!92516 (= res!701365 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32434 a!3488)) (bvslt (size!32434 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92516 e!597389))

(assert (=> start!92516 true))

(declare-fun array_inv!24678 (array!66317) Bool)

(assert (=> start!92516 (array_inv!24678 a!3488)))

(declare-fun b!1052235 () Bool)

(assert (=> b!1052235 (= e!597384 true)))

(declare-fun lt!464653 () Bool)

(declare-fun contains!6152 (List!22210 (_ BitVec 64)) Bool)

(assert (=> b!1052235 (= lt!464653 (contains!6152 Nil!22207 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1052236 () Bool)

(declare-fun res!701357 () Bool)

(assert (=> b!1052236 (=> res!701357 e!597384)))

(assert (=> b!1052236 (= res!701357 (contains!6152 Nil!22207 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1052237 () Bool)

(declare-fun res!701366 () Bool)

(assert (=> b!1052237 (=> (not res!701366) (not e!597389))))

(assert (=> b!1052237 (= res!701366 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22207))))

(declare-fun b!1052238 () Bool)

(declare-fun res!701363 () Bool)

(assert (=> b!1052238 (=> (not res!701363) (not e!597389))))

(assert (=> b!1052238 (= res!701363 (= (select (arr!31898 a!3488) i!1381) k0!2747))))

(declare-fun b!1052239 () Bool)

(declare-fun res!701356 () Bool)

(assert (=> b!1052239 (=> res!701356 e!597384)))

(declare-fun noDuplicate!1537 (List!22210) Bool)

(assert (=> b!1052239 (= res!701356 (not (noDuplicate!1537 Nil!22207)))))

(declare-fun b!1052240 () Bool)

(assert (=> b!1052240 (= e!597389 e!597391)))

(declare-fun res!701360 () Bool)

(assert (=> b!1052240 (=> (not res!701360) (not e!597391))))

(assert (=> b!1052240 (= res!701360 (arrayContainsKey!0 lt!464657 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1052240 (= lt!464657 (array!66318 (store (arr!31898 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32434 a!3488)))))

(assert (= (and start!92516 res!701365) b!1052237))

(assert (= (and b!1052237 res!701366) b!1052232))

(assert (= (and b!1052232 res!701358) b!1052238))

(assert (= (and b!1052238 res!701363) b!1052240))

(assert (= (and b!1052240 res!701360) b!1052230))

(assert (= (and b!1052230 res!701362) b!1052231))

(assert (= (and b!1052231 res!701361) b!1052233))

(assert (= (and b!1052233 (not res!701355)) b!1052234))

(assert (= (and b!1052231 (not res!701359)) b!1052229))

(assert (= (and b!1052229 (not res!701364)) b!1052239))

(assert (= (and b!1052239 (not res!701356)) b!1052236))

(assert (= (and b!1052236 (not res!701357)) b!1052235))

(declare-fun m!972631 () Bool)

(assert (=> b!1052229 m!972631))

(declare-fun m!972633 () Bool)

(assert (=> b!1052229 m!972633))

(declare-fun m!972635 () Bool)

(assert (=> b!1052229 m!972635))

(declare-fun m!972637 () Bool)

(assert (=> b!1052229 m!972637))

(declare-fun m!972639 () Bool)

(assert (=> b!1052236 m!972639))

(declare-fun m!972641 () Bool)

(assert (=> b!1052230 m!972641))

(declare-fun m!972643 () Bool)

(assert (=> b!1052239 m!972643))

(declare-fun m!972645 () Bool)

(assert (=> b!1052232 m!972645))

(declare-fun m!972647 () Bool)

(assert (=> start!92516 m!972647))

(declare-fun m!972649 () Bool)

(assert (=> b!1052235 m!972649))

(declare-fun m!972651 () Bool)

(assert (=> b!1052237 m!972651))

(declare-fun m!972653 () Bool)

(assert (=> b!1052238 m!972653))

(declare-fun m!972655 () Bool)

(assert (=> b!1052240 m!972655))

(declare-fun m!972657 () Bool)

(assert (=> b!1052240 m!972657))

(assert (=> b!1052231 m!972657))

(declare-fun m!972659 () Bool)

(assert (=> b!1052231 m!972659))

(declare-fun m!972661 () Bool)

(assert (=> b!1052234 m!972661))

(check-sat (not b!1052234) (not b!1052240) (not b!1052237) (not b!1052229) (not b!1052236) (not start!92516) (not b!1052235) (not b!1052239) (not b!1052232) (not b!1052230))
(check-sat)
