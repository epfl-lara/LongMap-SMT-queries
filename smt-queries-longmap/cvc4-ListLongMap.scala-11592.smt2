; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135138 () Bool)

(assert start!135138)

(declare-fun b!1572876 () Bool)

(declare-fun res!1074687 () Bool)

(declare-fun e!877081 () Bool)

(assert (=> b!1572876 (=> (not res!1074687) (not e!877081))))

(declare-datatypes ((array!105073 0))(
  ( (array!105074 (arr!50697 (Array (_ BitVec 32) (_ BitVec 64))) (size!51247 (_ BitVec 32))) )
))
(declare-fun _keys!600 () array!105073)

(declare-fun mask!889 () (_ BitVec 32))

(assert (=> b!1572876 (= res!1074687 (= (size!51247 _keys!600) (bvadd #b00000000000000000000000000000001 mask!889)))))

(declare-fun b!1572877 () Bool)

(declare-fun res!1074688 () Bool)

(assert (=> b!1572877 (=> (not res!1074688) (not e!877081))))

(declare-fun k!754 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1572877 (= res!1074688 (validKeyInArray!0 k!754))))

(declare-fun b!1572879 () Bool)

(declare-fun e!877080 () Bool)

(assert (=> b!1572879 (= e!877080 false)))

(declare-datatypes ((SeekEntryResult!13610 0))(
  ( (MissingZero!13610 (index!56838 (_ BitVec 32))) (Found!13610 (index!56839 (_ BitVec 32))) (Intermediate!13610 (undefined!14422 Bool) (index!56840 (_ BitVec 32)) (x!141618 (_ BitVec 32))) (Undefined!13610) (MissingVacant!13610 (index!56841 (_ BitVec 32))) )
))
(declare-fun lt!674163 () SeekEntryResult!13610)

(declare-fun lt!674164 () SeekEntryResult!13610)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105073 (_ BitVec 32)) SeekEntryResult!13610)

(assert (=> b!1572879 (= lt!674164 (seekKeyOrZeroReturnVacant!0 (x!141618 lt!674163) (index!56840 lt!674163) (index!56840 lt!674163) k!754 _keys!600 mask!889))))

(declare-fun res!1074689 () Bool)

(assert (=> start!135138 (=> (not res!1074689) (not e!877081))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135138 (= res!1074689 (validMask!0 mask!889))))

(assert (=> start!135138 e!877081))

(assert (=> start!135138 true))

(declare-fun array_inv!39424 (array!105073) Bool)

(assert (=> start!135138 (array_inv!39424 _keys!600)))

(declare-fun b!1572878 () Bool)

(assert (=> b!1572878 (= e!877081 e!877080)))

(declare-fun res!1074690 () Bool)

(assert (=> b!1572878 (=> (not res!1074690) (not e!877080))))

(assert (=> b!1572878 (= res!1074690 (and (not (undefined!14422 lt!674163)) (is-Intermediate!13610 lt!674163) (not (= (select (arr!50697 _keys!600) (index!56840 lt!674163)) k!754)) (not (= (select (arr!50697 _keys!600) (index!56840 lt!674163)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!50697 _keys!600) (index!56840 lt!674163)) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge (index!56840 lt!674163) #b00000000000000000000000000000000) (bvslt (index!56840 lt!674163) (bvadd #b00000000000000000000000000000001 mask!889))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105073 (_ BitVec 32)) SeekEntryResult!13610)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1572878 (= lt!674163 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!754 mask!889) k!754 _keys!600 mask!889))))

(assert (= (and start!135138 res!1074689) b!1572876))

(assert (= (and b!1572876 res!1074687) b!1572877))

(assert (= (and b!1572877 res!1074688) b!1572878))

(assert (= (and b!1572878 res!1074690) b!1572879))

(declare-fun m!1446509 () Bool)

(assert (=> b!1572877 m!1446509))

(declare-fun m!1446511 () Bool)

(assert (=> b!1572879 m!1446511))

(declare-fun m!1446513 () Bool)

(assert (=> start!135138 m!1446513))

(declare-fun m!1446515 () Bool)

(assert (=> start!135138 m!1446515))

(declare-fun m!1446517 () Bool)

(assert (=> b!1572878 m!1446517))

(declare-fun m!1446519 () Bool)

(assert (=> b!1572878 m!1446519))

(assert (=> b!1572878 m!1446519))

(declare-fun m!1446521 () Bool)

(assert (=> b!1572878 m!1446521))

(push 1)

(assert (not b!1572878))

(assert (not start!135138))

(assert (not b!1572879))

(assert (not b!1572877))

(check-sat)

