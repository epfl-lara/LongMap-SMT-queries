; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!135136 () Bool)

(assert start!135136)

(declare-fun b!1572867 () Bool)

(declare-fun e!877071 () Bool)

(assert (=> b!1572867 (= e!877071 false)))

(declare-datatypes ((SeekEntryResult!13609 0))(
  ( (MissingZero!13609 (index!56834 (_ BitVec 32))) (Found!13609 (index!56835 (_ BitVec 32))) (Intermediate!13609 (undefined!14421 Bool) (index!56836 (_ BitVec 32)) (x!141617 (_ BitVec 32))) (Undefined!13609) (MissingVacant!13609 (index!56837 (_ BitVec 32))) )
))
(declare-fun lt!674158 () SeekEntryResult!13609)

(declare-fun k0!754 () (_ BitVec 64))

(declare-fun mask!889 () (_ BitVec 32))

(declare-datatypes ((array!105071 0))(
  ( (array!105072 (arr!50696 (Array (_ BitVec 32) (_ BitVec 64))) (size!51246 (_ BitVec 32))) )
))
(declare-fun _keys!600 () array!105071)

(declare-fun lt!674157 () SeekEntryResult!13609)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105071 (_ BitVec 32)) SeekEntryResult!13609)

(assert (=> b!1572867 (= lt!674158 (seekKeyOrZeroReturnVacant!0 (x!141617 lt!674157) (index!56836 lt!674157) (index!56836 lt!674157) k0!754 _keys!600 mask!889))))

(declare-fun b!1572865 () Bool)

(declare-fun res!1074677 () Bool)

(declare-fun e!877072 () Bool)

(assert (=> b!1572865 (=> (not res!1074677) (not e!877072))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1572865 (= res!1074677 (validKeyInArray!0 k0!754))))

(declare-fun b!1572864 () Bool)

(declare-fun res!1074675 () Bool)

(assert (=> b!1572864 (=> (not res!1074675) (not e!877072))))

(assert (=> b!1572864 (= res!1074675 (= (size!51246 _keys!600) (bvadd #b00000000000000000000000000000001 mask!889)))))

(declare-fun b!1572866 () Bool)

(assert (=> b!1572866 (= e!877072 e!877071)))

(declare-fun res!1074676 () Bool)

(assert (=> b!1572866 (=> (not res!1074676) (not e!877071))))

(get-info :version)

(assert (=> b!1572866 (= res!1074676 (and (not (undefined!14421 lt!674157)) ((_ is Intermediate!13609) lt!674157) (not (= (select (arr!50696 _keys!600) (index!56836 lt!674157)) k0!754)) (not (= (select (arr!50696 _keys!600) (index!56836 lt!674157)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!50696 _keys!600) (index!56836 lt!674157)) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge (index!56836 lt!674157) #b00000000000000000000000000000000) (bvslt (index!56836 lt!674157) (bvadd #b00000000000000000000000000000001 mask!889))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105071 (_ BitVec 32)) SeekEntryResult!13609)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1572866 (= lt!674157 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!754 mask!889) k0!754 _keys!600 mask!889))))

(declare-fun res!1074678 () Bool)

(assert (=> start!135136 (=> (not res!1074678) (not e!877072))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135136 (= res!1074678 (validMask!0 mask!889))))

(assert (=> start!135136 e!877072))

(assert (=> start!135136 true))

(declare-fun array_inv!39423 (array!105071) Bool)

(assert (=> start!135136 (array_inv!39423 _keys!600)))

(assert (= (and start!135136 res!1074678) b!1572864))

(assert (= (and b!1572864 res!1074675) b!1572865))

(assert (= (and b!1572865 res!1074677) b!1572866))

(assert (= (and b!1572866 res!1074676) b!1572867))

(declare-fun m!1446495 () Bool)

(assert (=> b!1572867 m!1446495))

(declare-fun m!1446497 () Bool)

(assert (=> b!1572865 m!1446497))

(declare-fun m!1446499 () Bool)

(assert (=> b!1572866 m!1446499))

(declare-fun m!1446501 () Bool)

(assert (=> b!1572866 m!1446501))

(assert (=> b!1572866 m!1446501))

(declare-fun m!1446503 () Bool)

(assert (=> b!1572866 m!1446503))

(declare-fun m!1446505 () Bool)

(assert (=> start!135136 m!1446505))

(declare-fun m!1446507 () Bool)

(assert (=> start!135136 m!1446507))

(check-sat (not b!1572865) (not b!1572866) (not start!135136) (not b!1572867))
(check-sat)
