; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!135552 () Bool)

(assert start!135552)

(declare-fun b!1575327 () Bool)

(declare-fun e!878599 () Bool)

(assert (=> b!1575327 (= e!878599 false)))

(declare-fun k0!754 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!13559 0))(
  ( (MissingZero!13559 (index!56634 (_ BitVec 32))) (Found!13559 (index!56635 (_ BitVec 32))) (Intermediate!13559 (undefined!14371 Bool) (index!56636 (_ BitVec 32)) (x!141626 (_ BitVec 32))) (Undefined!13559) (MissingVacant!13559 (index!56637 (_ BitVec 32))) )
))
(declare-fun lt!675078 () SeekEntryResult!13559)

(declare-fun mask!889 () (_ BitVec 32))

(declare-datatypes ((array!105197 0))(
  ( (array!105198 (arr!50752 (Array (_ BitVec 32) (_ BitVec 64))) (size!51303 (_ BitVec 32))) )
))
(declare-fun _keys!600 () array!105197)

(declare-fun lt!675077 () SeekEntryResult!13559)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105197 (_ BitVec 32)) SeekEntryResult!13559)

(assert (=> b!1575327 (= lt!675077 (seekKeyOrZeroReturnVacant!0 (x!141626 lt!675078) (index!56636 lt!675078) (index!56636 lt!675078) k0!754 _keys!600 mask!889))))

(declare-fun res!1075562 () Bool)

(declare-fun e!878598 () Bool)

(assert (=> start!135552 (=> (not res!1075562) (not e!878598))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135552 (= res!1075562 (validMask!0 mask!889))))

(assert (=> start!135552 e!878598))

(assert (=> start!135552 true))

(declare-fun array_inv!39707 (array!105197) Bool)

(assert (=> start!135552 (array_inv!39707 _keys!600)))

(declare-fun b!1575325 () Bool)

(declare-fun res!1075560 () Bool)

(assert (=> b!1575325 (=> (not res!1075560) (not e!878598))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1575325 (= res!1075560 (validKeyInArray!0 k0!754))))

(declare-fun b!1575324 () Bool)

(declare-fun res!1075561 () Bool)

(assert (=> b!1575324 (=> (not res!1075561) (not e!878598))))

(assert (=> b!1575324 (= res!1075561 (= (size!51303 _keys!600) (bvadd #b00000000000000000000000000000001 mask!889)))))

(declare-fun b!1575326 () Bool)

(assert (=> b!1575326 (= e!878598 e!878599)))

(declare-fun res!1075559 () Bool)

(assert (=> b!1575326 (=> (not res!1075559) (not e!878599))))

(get-info :version)

(assert (=> b!1575326 (= res!1075559 (and (not (undefined!14371 lt!675078)) ((_ is Intermediate!13559) lt!675078) (not (= (select (arr!50752 _keys!600) (index!56636 lt!675078)) k0!754)) (not (= (select (arr!50752 _keys!600) (index!56636 lt!675078)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!50752 _keys!600) (index!56636 lt!675078)) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge (index!56636 lt!675078) #b00000000000000000000000000000000) (bvslt (index!56636 lt!675078) (bvadd #b00000000000000000000000000000001 mask!889))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105197 (_ BitVec 32)) SeekEntryResult!13559)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1575326 (= lt!675078 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!754 mask!889) k0!754 _keys!600 mask!889))))

(assert (= (and start!135552 res!1075562) b!1575324))

(assert (= (and b!1575324 res!1075561) b!1575325))

(assert (= (and b!1575325 res!1075560) b!1575326))

(assert (= (and b!1575326 res!1075559) b!1575327))

(declare-fun m!1448781 () Bool)

(assert (=> b!1575327 m!1448781))

(declare-fun m!1448783 () Bool)

(assert (=> start!135552 m!1448783))

(declare-fun m!1448785 () Bool)

(assert (=> start!135552 m!1448785))

(declare-fun m!1448787 () Bool)

(assert (=> b!1575325 m!1448787))

(declare-fun m!1448789 () Bool)

(assert (=> b!1575326 m!1448789))

(declare-fun m!1448791 () Bool)

(assert (=> b!1575326 m!1448791))

(assert (=> b!1575326 m!1448791))

(declare-fun m!1448793 () Bool)

(assert (=> b!1575326 m!1448793))

(check-sat (not start!135552) (not b!1575325) (not b!1575327) (not b!1575326))
(check-sat)
