; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93458 () Bool)

(assert start!93458)

(declare-fun b!1058616 () Bool)

(declare-fun e!602284 () Bool)

(declare-fun e!602282 () Bool)

(assert (=> b!1058616 (= e!602284 e!602282)))

(declare-fun res!707195 () Bool)

(assert (=> b!1058616 (=> (not res!707195) (not e!602282))))

(declare-datatypes ((array!66761 0))(
  ( (array!66762 (arr!32099 (Array (_ BitVec 32) (_ BitVec 64))) (size!32635 (_ BitVec 32))) )
))
(declare-fun lt!466997 () array!66761)

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!66761 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1058616 (= res!707195 (arrayContainsKey!0 lt!466997 k0!2747 #b00000000000000000000000000000000))))

(declare-fun a!3488 () array!66761)

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1058616 (= lt!466997 (array!66762 (store (arr!32099 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32635 a!3488)))))

(declare-fun res!707193 () Bool)

(assert (=> start!93458 (=> (not res!707193) (not e!602284))))

(assert (=> start!93458 (= res!707193 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32635 a!3488)) (bvslt (size!32635 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!93458 e!602284))

(assert (=> start!93458 true))

(declare-fun array_inv!24879 (array!66761) Bool)

(assert (=> start!93458 (array_inv!24879 a!3488)))

(declare-fun b!1058617 () Bool)

(declare-fun res!707191 () Bool)

(assert (=> b!1058617 (=> (not res!707191) (not e!602284))))

(declare-datatypes ((List!22411 0))(
  ( (Nil!22408) (Cons!22407 (h!23616 (_ BitVec 64)) (t!31718 List!22411)) )
))
(declare-fun arrayNoDuplicates!0 (array!66761 (_ BitVec 32) List!22411) Bool)

(assert (=> b!1058617 (= res!707191 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22408))))

(declare-fun b!1058618 () Bool)

(declare-fun res!707192 () Bool)

(assert (=> b!1058618 (=> (not res!707192) (not e!602284))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1058618 (= res!707192 (validKeyInArray!0 k0!2747))))

(declare-fun b!1058619 () Bool)

(declare-fun res!707194 () Bool)

(assert (=> b!1058619 (=> (not res!707194) (not e!602284))))

(assert (=> b!1058619 (= res!707194 (= (select (arr!32099 a!3488) i!1381) k0!2747))))

(declare-fun b!1058620 () Bool)

(declare-fun e!602281 () Bool)

(assert (=> b!1058620 (= e!602281 (not true))))

(declare-fun lt!466998 () (_ BitVec 32))

(assert (=> b!1058620 (= (select (store (arr!32099 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!466998) k0!2747)))

(declare-fun b!1058621 () Bool)

(assert (=> b!1058621 (= e!602282 e!602281)))

(declare-fun res!707190 () Bool)

(assert (=> b!1058621 (=> (not res!707190) (not e!602281))))

(assert (=> b!1058621 (= res!707190 (not (= lt!466998 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66761 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1058621 (= lt!466998 (arrayScanForKey!0 lt!466997 k0!2747 #b00000000000000000000000000000000))))

(assert (= (and start!93458 res!707193) b!1058617))

(assert (= (and b!1058617 res!707191) b!1058618))

(assert (= (and b!1058618 res!707192) b!1058619))

(assert (= (and b!1058619 res!707194) b!1058616))

(assert (= (and b!1058616 res!707195) b!1058621))

(assert (= (and b!1058621 res!707190) b!1058620))

(declare-fun m!978273 () Bool)

(assert (=> b!1058618 m!978273))

(declare-fun m!978275 () Bool)

(assert (=> b!1058619 m!978275))

(declare-fun m!978277 () Bool)

(assert (=> b!1058617 m!978277))

(declare-fun m!978279 () Bool)

(assert (=> b!1058620 m!978279))

(declare-fun m!978281 () Bool)

(assert (=> b!1058620 m!978281))

(declare-fun m!978283 () Bool)

(assert (=> b!1058621 m!978283))

(declare-fun m!978285 () Bool)

(assert (=> start!93458 m!978285))

(declare-fun m!978287 () Bool)

(assert (=> b!1058616 m!978287))

(assert (=> b!1058616 m!978279))

(check-sat (not b!1058621) (not b!1058618) (not start!93458) (not b!1058616) (not b!1058617))
(check-sat)
