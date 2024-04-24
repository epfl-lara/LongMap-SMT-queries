; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92808 () Bool)

(assert start!92808)

(declare-fun b!1054232 () Bool)

(declare-fun res!702555 () Bool)

(declare-fun e!598722 () Bool)

(assert (=> b!1054232 (=> (not res!702555) (not e!598722))))

(declare-datatypes ((array!66424 0))(
  ( (array!66425 (arr!31945 (Array (_ BitVec 32) (_ BitVec 64))) (size!32482 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66424)

(declare-fun i!1381 () (_ BitVec 32))

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!66424 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1054232 (= res!702555 (not (arrayContainsKey!0 (array!66425 (store (arr!31945 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32482 a!3488)) k0!2747 #b00000000000000000000000000000000)))))

(declare-fun b!1054233 () Bool)

(declare-fun res!702553 () Bool)

(assert (=> b!1054233 (=> (not res!702553) (not e!598722))))

(declare-datatypes ((List!22227 0))(
  ( (Nil!22224) (Cons!22223 (h!23441 (_ BitVec 64)) (t!31526 List!22227)) )
))
(declare-fun arrayNoDuplicates!0 (array!66424 (_ BitVec 32) List!22227) Bool)

(assert (=> b!1054233 (= res!702553 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22224))))

(declare-fun b!1054234 () Bool)

(declare-fun res!702556 () Bool)

(assert (=> b!1054234 (=> (not res!702556) (not e!598722))))

(assert (=> b!1054234 (= res!702556 (= (select (arr!31945 a!3488) i!1381) k0!2747))))

(declare-fun res!702554 () Bool)

(assert (=> start!92808 (=> (not res!702554) (not e!598722))))

(assert (=> start!92808 (= res!702554 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32482 a!3488)) (bvslt (size!32482 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92808 e!598722))

(assert (=> start!92808 true))

(declare-fun array_inv!24727 (array!66424) Bool)

(assert (=> start!92808 (array_inv!24727 a!3488)))

(declare-fun b!1054235 () Bool)

(assert (=> b!1054235 (= e!598722 (bvsge #b00000000000000000000000000000000 (size!32482 a!3488)))))

(declare-fun b!1054236 () Bool)

(declare-fun res!702557 () Bool)

(assert (=> b!1054236 (=> (not res!702557) (not e!598722))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1054236 (= res!702557 (validKeyInArray!0 k0!2747))))

(assert (= (and start!92808 res!702554) b!1054233))

(assert (= (and b!1054233 res!702553) b!1054236))

(assert (= (and b!1054236 res!702557) b!1054234))

(assert (= (and b!1054234 res!702556) b!1054232))

(assert (= (and b!1054232 res!702555) b!1054235))

(declare-fun m!974981 () Bool)

(assert (=> b!1054234 m!974981))

(declare-fun m!974983 () Bool)

(assert (=> b!1054236 m!974983))

(declare-fun m!974985 () Bool)

(assert (=> b!1054233 m!974985))

(declare-fun m!974987 () Bool)

(assert (=> b!1054232 m!974987))

(declare-fun m!974989 () Bool)

(assert (=> b!1054232 m!974989))

(declare-fun m!974991 () Bool)

(assert (=> start!92808 m!974991))

(check-sat (not b!1054232) (not start!92808) (not b!1054233) (not b!1054236))
(check-sat)
