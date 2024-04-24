; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!135558 () Bool)

(assert start!135558)

(declare-fun b!1575363 () Bool)

(declare-fun e!878625 () Bool)

(assert (=> b!1575363 (= e!878625 false)))

(declare-datatypes ((SeekEntryResult!13562 0))(
  ( (MissingZero!13562 (index!56646 (_ BitVec 32))) (Found!13562 (index!56647 (_ BitVec 32))) (Intermediate!13562 (undefined!14374 Bool) (index!56648 (_ BitVec 32)) (x!141637 (_ BitVec 32))) (Undefined!13562) (MissingVacant!13562 (index!56649 (_ BitVec 32))) )
))
(declare-fun lt!675096 () SeekEntryResult!13562)

(declare-fun k0!754 () (_ BitVec 64))

(declare-fun mask!889 () (_ BitVec 32))

(declare-fun lt!675095 () SeekEntryResult!13562)

(declare-datatypes ((array!105203 0))(
  ( (array!105204 (arr!50755 (Array (_ BitVec 32) (_ BitVec 64))) (size!51306 (_ BitVec 32))) )
))
(declare-fun _keys!600 () array!105203)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105203 (_ BitVec 32)) SeekEntryResult!13562)

(assert (=> b!1575363 (= lt!675095 (seekKeyOrZeroReturnVacant!0 (x!141637 lt!675096) (index!56648 lt!675096) (index!56648 lt!675096) k0!754 _keys!600 mask!889))))

(declare-fun b!1575362 () Bool)

(declare-fun e!878626 () Bool)

(assert (=> b!1575362 (= e!878626 e!878625)))

(declare-fun res!1075596 () Bool)

(assert (=> b!1575362 (=> (not res!1075596) (not e!878625))))

(get-info :version)

(assert (=> b!1575362 (= res!1075596 (and (not (undefined!14374 lt!675096)) ((_ is Intermediate!13562) lt!675096) (not (= (select (arr!50755 _keys!600) (index!56648 lt!675096)) k0!754)) (not (= (select (arr!50755 _keys!600) (index!56648 lt!675096)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!50755 _keys!600) (index!56648 lt!675096)) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge (index!56648 lt!675096) #b00000000000000000000000000000000) (bvslt (index!56648 lt!675096) (bvadd #b00000000000000000000000000000001 mask!889))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105203 (_ BitVec 32)) SeekEntryResult!13562)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1575362 (= lt!675096 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!754 mask!889) k0!754 _keys!600 mask!889))))

(declare-fun b!1575360 () Bool)

(declare-fun res!1075595 () Bool)

(assert (=> b!1575360 (=> (not res!1075595) (not e!878626))))

(assert (=> b!1575360 (= res!1075595 (= (size!51306 _keys!600) (bvadd #b00000000000000000000000000000001 mask!889)))))

(declare-fun res!1075598 () Bool)

(assert (=> start!135558 (=> (not res!1075598) (not e!878626))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135558 (= res!1075598 (validMask!0 mask!889))))

(assert (=> start!135558 e!878626))

(assert (=> start!135558 true))

(declare-fun array_inv!39710 (array!105203) Bool)

(assert (=> start!135558 (array_inv!39710 _keys!600)))

(declare-fun b!1575361 () Bool)

(declare-fun res!1075597 () Bool)

(assert (=> b!1575361 (=> (not res!1075597) (not e!878626))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1575361 (= res!1075597 (validKeyInArray!0 k0!754))))

(assert (= (and start!135558 res!1075598) b!1575360))

(assert (= (and b!1575360 res!1075595) b!1575361))

(assert (= (and b!1575361 res!1075597) b!1575362))

(assert (= (and b!1575362 res!1075596) b!1575363))

(declare-fun m!1448823 () Bool)

(assert (=> b!1575363 m!1448823))

(declare-fun m!1448825 () Bool)

(assert (=> b!1575362 m!1448825))

(declare-fun m!1448827 () Bool)

(assert (=> b!1575362 m!1448827))

(assert (=> b!1575362 m!1448827))

(declare-fun m!1448829 () Bool)

(assert (=> b!1575362 m!1448829))

(declare-fun m!1448831 () Bool)

(assert (=> start!135558 m!1448831))

(declare-fun m!1448833 () Bool)

(assert (=> start!135558 m!1448833))

(declare-fun m!1448835 () Bool)

(assert (=> b!1575361 m!1448835))

(check-sat (not b!1575363) (not b!1575362) (not start!135558) (not b!1575361))
(check-sat)
