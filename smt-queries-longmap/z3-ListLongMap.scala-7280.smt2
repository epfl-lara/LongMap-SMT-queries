; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93040 () Bool)

(assert start!93040)

(declare-fun b!1055369 () Bool)

(declare-fun e!599825 () Bool)

(declare-fun e!599819 () Bool)

(assert (=> b!1055369 (= e!599825 e!599819)))

(declare-fun res!704268 () Bool)

(assert (=> b!1055369 (=> res!704268 e!599819)))

(declare-fun lt!465591 () (_ BitVec 32))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1055369 (= res!704268 (bvsle lt!465591 i!1381))))

(declare-fun b!1055370 () Bool)

(declare-fun e!599823 () Bool)

(declare-fun e!599826 () Bool)

(assert (=> b!1055370 (= e!599823 e!599826)))

(declare-fun res!704275 () Bool)

(assert (=> b!1055370 (=> (not res!704275) (not e!599826))))

(assert (=> b!1055370 (= res!704275 (not (= lt!465591 i!1381)))))

(declare-datatypes ((array!66506 0))(
  ( (array!66507 (arr!31980 (Array (_ BitVec 32) (_ BitVec 64))) (size!32518 (_ BitVec 32))) )
))
(declare-fun lt!465589 () array!66506)

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!66506 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1055370 (= lt!465591 (arrayScanForKey!0 lt!465589 k0!2747 #b00000000000000000000000000000000))))

(declare-fun res!704272 () Bool)

(declare-fun e!599821 () Bool)

(assert (=> start!93040 (=> (not res!704272) (not e!599821))))

(declare-fun a!3488 () array!66506)

(assert (=> start!93040 (= res!704272 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32518 a!3488)) (bvslt (size!32518 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!93040 e!599821))

(assert (=> start!93040 true))

(declare-fun array_inv!24763 (array!66506) Bool)

(assert (=> start!93040 (array_inv!24763 a!3488)))

(declare-fun b!1055371 () Bool)

(declare-fun e!599822 () Bool)

(assert (=> b!1055371 (= e!599822 true)))

(declare-fun lt!465592 () Bool)

(declare-datatypes ((List!22351 0))(
  ( (Nil!22348) (Cons!22347 (h!23556 (_ BitVec 64)) (t!31649 List!22351)) )
))
(declare-fun contains!6154 (List!22351 (_ BitVec 64)) Bool)

(assert (=> b!1055371 (= lt!465592 (contains!6154 Nil!22348 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1055372 () Bool)

(declare-fun res!704278 () Bool)

(assert (=> b!1055372 (=> (not res!704278) (not e!599821))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1055372 (= res!704278 (validKeyInArray!0 k0!2747))))

(declare-fun b!1055373 () Bool)

(declare-fun res!704267 () Bool)

(assert (=> b!1055373 (=> (not res!704267) (not e!599821))))

(declare-fun arrayNoDuplicates!0 (array!66506 (_ BitVec 32) List!22351) Bool)

(assert (=> b!1055373 (= res!704267 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22348))))

(declare-fun b!1055374 () Bool)

(assert (=> b!1055374 (= e!599821 e!599823)))

(declare-fun res!704274 () Bool)

(assert (=> b!1055374 (=> (not res!704274) (not e!599823))))

(declare-fun arrayContainsKey!0 (array!66506 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1055374 (= res!704274 (arrayContainsKey!0 lt!465589 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1055374 (= lt!465589 (array!66507 (store (arr!31980 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32518 a!3488)))))

(declare-fun b!1055375 () Bool)

(declare-fun res!704269 () Bool)

(assert (=> b!1055375 (=> res!704269 e!599822)))

(declare-fun noDuplicate!1564 (List!22351) Bool)

(assert (=> b!1055375 (= res!704269 (not (noDuplicate!1564 Nil!22348)))))

(declare-fun b!1055376 () Bool)

(declare-fun e!599820 () Bool)

(assert (=> b!1055376 (= e!599826 (not e!599820))))

(declare-fun res!704270 () Bool)

(assert (=> b!1055376 (=> res!704270 e!599820)))

(assert (=> b!1055376 (= res!704270 (bvsle lt!465591 i!1381))))

(assert (=> b!1055376 e!599825))

(declare-fun res!704271 () Bool)

(assert (=> b!1055376 (=> (not res!704271) (not e!599825))))

(assert (=> b!1055376 (= res!704271 (= (select (store (arr!31980 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!465591) k0!2747))))

(declare-fun b!1055377 () Bool)

(declare-fun res!704273 () Bool)

(assert (=> b!1055377 (=> res!704273 e!599822)))

(assert (=> b!1055377 (= res!704273 (contains!6154 Nil!22348 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1055378 () Bool)

(assert (=> b!1055378 (= e!599819 (arrayContainsKey!0 a!3488 k0!2747 lt!465591))))

(declare-fun b!1055379 () Bool)

(declare-fun res!704276 () Bool)

(assert (=> b!1055379 (=> (not res!704276) (not e!599821))))

(assert (=> b!1055379 (= res!704276 (= (select (arr!31980 a!3488) i!1381) k0!2747))))

(declare-fun b!1055380 () Bool)

(assert (=> b!1055380 (= e!599820 e!599822)))

(declare-fun res!704277 () Bool)

(assert (=> b!1055380 (=> res!704277 e!599822)))

(assert (=> b!1055380 (= res!704277 (bvsge (bvadd #b00000000000000000000000000000001 i!1381) (size!32518 a!3488)))))

(assert (=> b!1055380 (arrayContainsKey!0 a!3488 k0!2747 (bvadd #b00000000000000000000000000000001 i!1381))))

(declare-datatypes ((Unit!34451 0))(
  ( (Unit!34452) )
))
(declare-fun lt!465588 () Unit!34451)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66506 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34451)

(assert (=> b!1055380 (= lt!465588 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k0!2747 lt!465591 (bvadd #b00000000000000000000000000000001 i!1381)))))

(assert (=> b!1055380 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22348)))

(declare-fun lt!465590 () Unit!34451)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66506 (_ BitVec 32) (_ BitVec 32)) Unit!34451)

(assert (=> b!1055380 (= lt!465590 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381))))

(assert (= (and start!93040 res!704272) b!1055373))

(assert (= (and b!1055373 res!704267) b!1055372))

(assert (= (and b!1055372 res!704278) b!1055379))

(assert (= (and b!1055379 res!704276) b!1055374))

(assert (= (and b!1055374 res!704274) b!1055370))

(assert (= (and b!1055370 res!704275) b!1055376))

(assert (= (and b!1055376 res!704271) b!1055369))

(assert (= (and b!1055369 (not res!704268)) b!1055378))

(assert (= (and b!1055376 (not res!704270)) b!1055380))

(assert (= (and b!1055380 (not res!704277)) b!1055375))

(assert (= (and b!1055375 (not res!704269)) b!1055377))

(assert (= (and b!1055377 (not res!704273)) b!1055371))

(declare-fun m!974893 () Bool)

(assert (=> b!1055370 m!974893))

(declare-fun m!974895 () Bool)

(assert (=> b!1055380 m!974895))

(declare-fun m!974897 () Bool)

(assert (=> b!1055380 m!974897))

(declare-fun m!974899 () Bool)

(assert (=> b!1055380 m!974899))

(declare-fun m!974901 () Bool)

(assert (=> b!1055380 m!974901))

(declare-fun m!974903 () Bool)

(assert (=> b!1055379 m!974903))

(declare-fun m!974905 () Bool)

(assert (=> b!1055371 m!974905))

(declare-fun m!974907 () Bool)

(assert (=> b!1055374 m!974907))

(declare-fun m!974909 () Bool)

(assert (=> b!1055374 m!974909))

(declare-fun m!974911 () Bool)

(assert (=> start!93040 m!974911))

(assert (=> b!1055376 m!974909))

(declare-fun m!974913 () Bool)

(assert (=> b!1055376 m!974913))

(declare-fun m!974915 () Bool)

(assert (=> b!1055373 m!974915))

(declare-fun m!974917 () Bool)

(assert (=> b!1055375 m!974917))

(declare-fun m!974919 () Bool)

(assert (=> b!1055377 m!974919))

(declare-fun m!974921 () Bool)

(assert (=> b!1055378 m!974921))

(declare-fun m!974923 () Bool)

(assert (=> b!1055372 m!974923))

(check-sat (not b!1055372) (not b!1055374) (not b!1055371) (not b!1055378) (not b!1055380) (not b!1055370) (not b!1055373) (not b!1055375) (not b!1055377) (not start!93040))
(check-sat)
