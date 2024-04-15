; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93160 () Bool)

(assert start!93160)

(declare-fun b!1056345 () Bool)

(declare-fun res!705176 () Bool)

(declare-fun e!600548 () Bool)

(assert (=> b!1056345 (=> (not res!705176) (not e!600548))))

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1056345 (= res!705176 (validKeyInArray!0 k0!2747))))

(declare-fun b!1056346 () Bool)

(declare-fun e!600552 () Bool)

(assert (=> b!1056346 (= e!600552 (not true))))

(declare-fun e!600551 () Bool)

(assert (=> b!1056346 e!600551))

(declare-fun res!705174 () Bool)

(assert (=> b!1056346 (=> (not res!705174) (not e!600551))))

(declare-datatypes ((array!66572 0))(
  ( (array!66573 (arr!32010 (Array (_ BitVec 32) (_ BitVec 64))) (size!32548 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66572)

(declare-fun i!1381 () (_ BitVec 32))

(declare-fun lt!465915 () (_ BitVec 32))

(assert (=> b!1056346 (= res!705174 (= (select (store (arr!32010 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!465915) k0!2747))))

(declare-fun b!1056347 () Bool)

(declare-fun e!600550 () Bool)

(assert (=> b!1056347 (= e!600550 e!600552)))

(declare-fun res!705178 () Bool)

(assert (=> b!1056347 (=> (not res!705178) (not e!600552))))

(assert (=> b!1056347 (= res!705178 (not (= lt!465915 i!1381)))))

(declare-fun lt!465916 () array!66572)

(declare-fun arrayScanForKey!0 (array!66572 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1056347 (= lt!465915 (arrayScanForKey!0 lt!465916 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1056348 () Bool)

(assert (=> b!1056348 (= e!600548 e!600550)))

(declare-fun res!705171 () Bool)

(assert (=> b!1056348 (=> (not res!705171) (not e!600550))))

(declare-fun arrayContainsKey!0 (array!66572 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1056348 (= res!705171 (arrayContainsKey!0 lt!465916 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1056348 (= lt!465916 (array!66573 (store (arr!32010 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32548 a!3488)))))

(declare-fun res!705172 () Bool)

(assert (=> start!93160 (=> (not res!705172) (not e!600548))))

(assert (=> start!93160 (= res!705172 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32548 a!3488)) (bvslt (size!32548 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!93160 e!600548))

(assert (=> start!93160 true))

(declare-fun array_inv!24793 (array!66572) Bool)

(assert (=> start!93160 (array_inv!24793 a!3488)))

(declare-fun b!1056349 () Bool)

(declare-fun e!600547 () Bool)

(assert (=> b!1056349 (= e!600551 e!600547)))

(declare-fun res!705177 () Bool)

(assert (=> b!1056349 (=> res!705177 e!600547)))

(assert (=> b!1056349 (= res!705177 (or (bvsgt lt!465915 i!1381) (bvsle i!1381 lt!465915)))))

(declare-fun b!1056350 () Bool)

(declare-fun res!705173 () Bool)

(assert (=> b!1056350 (=> (not res!705173) (not e!600548))))

(declare-datatypes ((List!22381 0))(
  ( (Nil!22378) (Cons!22377 (h!23586 (_ BitVec 64)) (t!31679 List!22381)) )
))
(declare-fun arrayNoDuplicates!0 (array!66572 (_ BitVec 32) List!22381) Bool)

(assert (=> b!1056350 (= res!705173 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22378))))

(declare-fun b!1056351 () Bool)

(declare-fun res!705175 () Bool)

(assert (=> b!1056351 (=> (not res!705175) (not e!600548))))

(assert (=> b!1056351 (= res!705175 (= (select (arr!32010 a!3488) i!1381) k0!2747))))

(declare-fun b!1056352 () Bool)

(assert (=> b!1056352 (= e!600547 (arrayContainsKey!0 a!3488 k0!2747 i!1381))))

(assert (= (and start!93160 res!705172) b!1056350))

(assert (= (and b!1056350 res!705173) b!1056345))

(assert (= (and b!1056345 res!705176) b!1056351))

(assert (= (and b!1056351 res!705175) b!1056348))

(assert (= (and b!1056348 res!705171) b!1056347))

(assert (= (and b!1056347 res!705178) b!1056346))

(assert (= (and b!1056346 res!705174) b!1056349))

(assert (= (and b!1056349 (not res!705177)) b!1056352))

(declare-fun m!975707 () Bool)

(assert (=> b!1056345 m!975707))

(declare-fun m!975709 () Bool)

(assert (=> b!1056352 m!975709))

(declare-fun m!975711 () Bool)

(assert (=> b!1056346 m!975711))

(declare-fun m!975713 () Bool)

(assert (=> b!1056346 m!975713))

(declare-fun m!975715 () Bool)

(assert (=> start!93160 m!975715))

(declare-fun m!975717 () Bool)

(assert (=> b!1056350 m!975717))

(declare-fun m!975719 () Bool)

(assert (=> b!1056348 m!975719))

(assert (=> b!1056348 m!975711))

(declare-fun m!975721 () Bool)

(assert (=> b!1056347 m!975721))

(declare-fun m!975723 () Bool)

(assert (=> b!1056351 m!975723))

(check-sat (not start!93160) (not b!1056345) (not b!1056352) (not b!1056350) (not b!1056348) (not b!1056347))
(check-sat)
