; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135146 () Bool)

(assert start!135146)

(declare-fun b!1572925 () Bool)

(declare-fun res!1074735 () Bool)

(declare-fun e!877118 () Bool)

(assert (=> b!1572925 (=> (not res!1074735) (not e!877118))))

(declare-fun k!754 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1572925 (= res!1074735 (validKeyInArray!0 k!754))))

(declare-fun b!1572924 () Bool)

(declare-fun res!1074736 () Bool)

(assert (=> b!1572924 (=> (not res!1074736) (not e!877118))))

(declare-datatypes ((array!105081 0))(
  ( (array!105082 (arr!50701 (Array (_ BitVec 32) (_ BitVec 64))) (size!51251 (_ BitVec 32))) )
))
(declare-fun _keys!600 () array!105081)

(declare-fun mask!889 () (_ BitVec 32))

(assert (=> b!1572924 (= res!1074736 (= (size!51251 _keys!600) (bvadd #b00000000000000000000000000000001 mask!889)))))

(declare-fun b!1572926 () Bool)

(declare-fun e!877117 () Bool)

(assert (=> b!1572926 (= e!877118 e!877117)))

(declare-fun res!1074737 () Bool)

(assert (=> b!1572926 (=> (not res!1074737) (not e!877117))))

(declare-datatypes ((SeekEntryResult!13614 0))(
  ( (MissingZero!13614 (index!56854 (_ BitVec 32))) (Found!13614 (index!56855 (_ BitVec 32))) (Intermediate!13614 (undefined!14426 Bool) (index!56856 (_ BitVec 32)) (x!141638 (_ BitVec 32))) (Undefined!13614) (MissingVacant!13614 (index!56857 (_ BitVec 32))) )
))
(declare-fun lt!674187 () SeekEntryResult!13614)

(assert (=> b!1572926 (= res!1074737 (and (not (undefined!14426 lt!674187)) (is-Intermediate!13614 lt!674187) (not (= (select (arr!50701 _keys!600) (index!56856 lt!674187)) k!754)) (not (= (select (arr!50701 _keys!600) (index!56856 lt!674187)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!50701 _keys!600) (index!56856 lt!674187)) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge (index!56856 lt!674187) #b00000000000000000000000000000000) (bvslt (index!56856 lt!674187) (bvadd #b00000000000000000000000000000001 mask!889))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105081 (_ BitVec 32)) SeekEntryResult!13614)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1572926 (= lt!674187 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!754 mask!889) k!754 _keys!600 mask!889))))

(declare-fun b!1572927 () Bool)

(assert (=> b!1572927 (= e!877117 false)))

(declare-fun lt!674188 () SeekEntryResult!13614)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105081 (_ BitVec 32)) SeekEntryResult!13614)

(assert (=> b!1572927 (= lt!674188 (seekKeyOrZeroReturnVacant!0 (x!141638 lt!674187) (index!56856 lt!674187) (index!56856 lt!674187) k!754 _keys!600 mask!889))))

(declare-fun res!1074738 () Bool)

(assert (=> start!135146 (=> (not res!1074738) (not e!877118))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135146 (= res!1074738 (validMask!0 mask!889))))

(assert (=> start!135146 e!877118))

(assert (=> start!135146 true))

(declare-fun array_inv!39428 (array!105081) Bool)

(assert (=> start!135146 (array_inv!39428 _keys!600)))

(assert (= (and start!135146 res!1074738) b!1572924))

(assert (= (and b!1572924 res!1074736) b!1572925))

(assert (= (and b!1572925 res!1074735) b!1572926))

(assert (= (and b!1572926 res!1074737) b!1572927))

(declare-fun m!1446565 () Bool)

(assert (=> b!1572925 m!1446565))

(declare-fun m!1446567 () Bool)

(assert (=> b!1572926 m!1446567))

(declare-fun m!1446569 () Bool)

(assert (=> b!1572926 m!1446569))

(assert (=> b!1572926 m!1446569))

(declare-fun m!1446571 () Bool)

(assert (=> b!1572926 m!1446571))

(declare-fun m!1446573 () Bool)

(assert (=> b!1572927 m!1446573))

(declare-fun m!1446575 () Bool)

(assert (=> start!135146 m!1446575))

(declare-fun m!1446577 () Bool)

(assert (=> start!135146 m!1446577))

(push 1)

(assert (not b!1572925))

(assert (not start!135146))

(assert (not b!1572926))

(assert (not b!1572927))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

