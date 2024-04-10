; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93170 () Bool)

(assert start!93170)

(declare-fun res!705342 () Bool)

(declare-fun e!600718 () Bool)

(assert (=> start!93170 (=> (not res!705342) (not e!600718))))

(declare-fun i!1381 () (_ BitVec 32))

(declare-datatypes ((array!66641 0))(
  ( (array!66642 (arr!32045 (Array (_ BitVec 32) (_ BitVec 64))) (size!32581 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66641)

(assert (=> start!93170 (= res!705342 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32581 a!3488)) (bvslt (size!32581 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!93170 e!600718))

(assert (=> start!93170 true))

(declare-fun array_inv!24825 (array!66641) Bool)

(assert (=> start!93170 (array_inv!24825 a!3488)))

(declare-fun b!1056597 () Bool)

(declare-fun e!600716 () Bool)

(declare-fun e!600717 () Bool)

(assert (=> b!1056597 (= e!600716 e!600717)))

(declare-fun res!705341 () Bool)

(assert (=> b!1056597 (=> res!705341 e!600717)))

(declare-fun lt!466144 () (_ BitVec 32))

(assert (=> b!1056597 (= res!705341 (or (bvsgt lt!466144 i!1381) (bvsle i!1381 lt!466144)))))

(declare-fun b!1056598 () Bool)

(declare-fun e!600719 () Bool)

(declare-fun e!600715 () Bool)

(assert (=> b!1056598 (= e!600719 (not e!600715))))

(declare-fun res!705339 () Bool)

(assert (=> b!1056598 (=> res!705339 e!600715)))

(assert (=> b!1056598 (= res!705339 (or (bvsgt lt!466144 i!1381) (bvsle i!1381 lt!466144)))))

(assert (=> b!1056598 e!600716))

(declare-fun res!705345 () Bool)

(assert (=> b!1056598 (=> (not res!705345) (not e!600716))))

(declare-fun k0!2747 () (_ BitVec 64))

(assert (=> b!1056598 (= res!705345 (= (select (store (arr!32045 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!466144) k0!2747))))

(declare-fun b!1056599 () Bool)

(assert (=> b!1056599 (= e!600715 true)))

(declare-datatypes ((List!22357 0))(
  ( (Nil!22354) (Cons!22353 (h!23562 (_ BitVec 64)) (t!31664 List!22357)) )
))
(declare-fun arrayNoDuplicates!0 (array!66641 (_ BitVec 32) List!22357) Bool)

(assert (=> b!1056599 (arrayNoDuplicates!0 a!3488 lt!466144 Nil!22354)))

(declare-datatypes ((Unit!34612 0))(
  ( (Unit!34613) )
))
(declare-fun lt!466145 () Unit!34612)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66641 (_ BitVec 32) (_ BitVec 32)) Unit!34612)

(assert (=> b!1056599 (= lt!466145 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 lt!466144))))

(declare-fun b!1056600 () Bool)

(declare-fun res!705343 () Bool)

(assert (=> b!1056600 (=> (not res!705343) (not e!600718))))

(assert (=> b!1056600 (= res!705343 (= (select (arr!32045 a!3488) i!1381) k0!2747))))

(declare-fun b!1056601 () Bool)

(declare-fun arrayContainsKey!0 (array!66641 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1056601 (= e!600717 (arrayContainsKey!0 a!3488 k0!2747 i!1381))))

(declare-fun b!1056602 () Bool)

(declare-fun e!600720 () Bool)

(assert (=> b!1056602 (= e!600720 e!600719)))

(declare-fun res!705340 () Bool)

(assert (=> b!1056602 (=> (not res!705340) (not e!600719))))

(assert (=> b!1056602 (= res!705340 (not (= lt!466144 i!1381)))))

(declare-fun lt!466146 () array!66641)

(declare-fun arrayScanForKey!0 (array!66641 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1056602 (= lt!466144 (arrayScanForKey!0 lt!466146 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1056603 () Bool)

(declare-fun res!705346 () Bool)

(assert (=> b!1056603 (=> (not res!705346) (not e!600718))))

(assert (=> b!1056603 (= res!705346 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22354))))

(declare-fun b!1056604 () Bool)

(assert (=> b!1056604 (= e!600718 e!600720)))

(declare-fun res!705344 () Bool)

(assert (=> b!1056604 (=> (not res!705344) (not e!600720))))

(assert (=> b!1056604 (= res!705344 (arrayContainsKey!0 lt!466146 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1056604 (= lt!466146 (array!66642 (store (arr!32045 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32581 a!3488)))))

(declare-fun b!1056605 () Bool)

(declare-fun res!705347 () Bool)

(assert (=> b!1056605 (=> (not res!705347) (not e!600718))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1056605 (= res!705347 (validKeyInArray!0 k0!2747))))

(assert (= (and start!93170 res!705342) b!1056603))

(assert (= (and b!1056603 res!705346) b!1056605))

(assert (= (and b!1056605 res!705347) b!1056600))

(assert (= (and b!1056600 res!705343) b!1056604))

(assert (= (and b!1056604 res!705344) b!1056602))

(assert (= (and b!1056602 res!705340) b!1056598))

(assert (= (and b!1056598 res!705345) b!1056597))

(assert (= (and b!1056597 (not res!705341)) b!1056601))

(assert (= (and b!1056598 (not res!705339)) b!1056599))

(declare-fun m!976407 () Bool)

(assert (=> b!1056600 m!976407))

(declare-fun m!976409 () Bool)

(assert (=> b!1056605 m!976409))

(declare-fun m!976411 () Bool)

(assert (=> b!1056602 m!976411))

(declare-fun m!976413 () Bool)

(assert (=> b!1056601 m!976413))

(declare-fun m!976415 () Bool)

(assert (=> b!1056599 m!976415))

(declare-fun m!976417 () Bool)

(assert (=> b!1056599 m!976417))

(declare-fun m!976419 () Bool)

(assert (=> b!1056603 m!976419))

(declare-fun m!976421 () Bool)

(assert (=> b!1056598 m!976421))

(declare-fun m!976423 () Bool)

(assert (=> b!1056598 m!976423))

(declare-fun m!976425 () Bool)

(assert (=> b!1056604 m!976425))

(assert (=> b!1056604 m!976421))

(declare-fun m!976427 () Bool)

(assert (=> start!93170 m!976427))

(check-sat (not b!1056603) (not start!93170) (not b!1056602) (not b!1056599) (not b!1056604) (not b!1056605) (not b!1056601))
(check-sat)
