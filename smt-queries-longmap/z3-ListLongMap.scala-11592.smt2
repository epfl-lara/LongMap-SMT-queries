; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!135546 () Bool)

(assert start!135546)

(declare-fun b!1575290 () Bool)

(declare-fun e!878571 () Bool)

(declare-fun e!878573 () Bool)

(assert (=> b!1575290 (= e!878571 e!878573)))

(declare-fun res!1075526 () Bool)

(assert (=> b!1575290 (=> (not res!1075526) (not e!878573))))

(declare-fun k0!754 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!13556 0))(
  ( (MissingZero!13556 (index!56622 (_ BitVec 32))) (Found!13556 (index!56623 (_ BitVec 32))) (Intermediate!13556 (undefined!14368 Bool) (index!56624 (_ BitVec 32)) (x!141615 (_ BitVec 32))) (Undefined!13556) (MissingVacant!13556 (index!56625 (_ BitVec 32))) )
))
(declare-fun lt!675059 () SeekEntryResult!13556)

(declare-fun mask!889 () (_ BitVec 32))

(declare-datatypes ((array!105191 0))(
  ( (array!105192 (arr!50749 (Array (_ BitVec 32) (_ BitVec 64))) (size!51300 (_ BitVec 32))) )
))
(declare-fun _keys!600 () array!105191)

(get-info :version)

(assert (=> b!1575290 (= res!1075526 (and (not (undefined!14368 lt!675059)) ((_ is Intermediate!13556) lt!675059) (not (= (select (arr!50749 _keys!600) (index!56624 lt!675059)) k0!754)) (not (= (select (arr!50749 _keys!600) (index!56624 lt!675059)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!50749 _keys!600) (index!56624 lt!675059)) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge (index!56624 lt!675059) #b00000000000000000000000000000000) (bvslt (index!56624 lt!675059) (bvadd #b00000000000000000000000000000001 mask!889))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105191 (_ BitVec 32)) SeekEntryResult!13556)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1575290 (= lt!675059 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!754 mask!889) k0!754 _keys!600 mask!889))))

(declare-fun b!1575288 () Bool)

(declare-fun res!1075525 () Bool)

(assert (=> b!1575288 (=> (not res!1075525) (not e!878571))))

(assert (=> b!1575288 (= res!1075525 (= (size!51300 _keys!600) (bvadd #b00000000000000000000000000000001 mask!889)))))

(declare-fun b!1575289 () Bool)

(declare-fun res!1075523 () Bool)

(assert (=> b!1575289 (=> (not res!1075523) (not e!878571))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1575289 (= res!1075523 (validKeyInArray!0 k0!754))))

(declare-fun b!1575291 () Bool)

(assert (=> b!1575291 (= e!878573 false)))

(declare-fun lt!675060 () SeekEntryResult!13556)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105191 (_ BitVec 32)) SeekEntryResult!13556)

(assert (=> b!1575291 (= lt!675060 (seekKeyOrZeroReturnVacant!0 (x!141615 lt!675059) (index!56624 lt!675059) (index!56624 lt!675059) k0!754 _keys!600 mask!889))))

(declare-fun res!1075524 () Bool)

(assert (=> start!135546 (=> (not res!1075524) (not e!878571))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135546 (= res!1075524 (validMask!0 mask!889))))

(assert (=> start!135546 e!878571))

(assert (=> start!135546 true))

(declare-fun array_inv!39704 (array!105191) Bool)

(assert (=> start!135546 (array_inv!39704 _keys!600)))

(assert (= (and start!135546 res!1075524) b!1575288))

(assert (= (and b!1575288 res!1075525) b!1575289))

(assert (= (and b!1575289 res!1075523) b!1575290))

(assert (= (and b!1575290 res!1075526) b!1575291))

(declare-fun m!1448739 () Bool)

(assert (=> b!1575290 m!1448739))

(declare-fun m!1448741 () Bool)

(assert (=> b!1575290 m!1448741))

(assert (=> b!1575290 m!1448741))

(declare-fun m!1448743 () Bool)

(assert (=> b!1575290 m!1448743))

(declare-fun m!1448745 () Bool)

(assert (=> b!1575289 m!1448745))

(declare-fun m!1448747 () Bool)

(assert (=> b!1575291 m!1448747))

(declare-fun m!1448749 () Bool)

(assert (=> start!135546 m!1448749))

(declare-fun m!1448751 () Bool)

(assert (=> start!135546 m!1448751))

(check-sat (not b!1575289) (not start!135546) (not b!1575290) (not b!1575291))
(check-sat)
