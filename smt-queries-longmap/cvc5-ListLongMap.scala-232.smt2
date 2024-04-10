; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4074 () Bool)

(assert start!4074)

(declare-fun b_free!979 () Bool)

(declare-fun b_next!979 () Bool)

(assert (=> start!4074 (= b_free!979 (not b_next!979))))

(declare-fun tp!4357 () Bool)

(declare-fun b_and!1789 () Bool)

(assert (=> start!4074 (= tp!4357 b_and!1789)))

(declare-fun mapIsEmpty!1528 () Bool)

(declare-fun mapRes!1528 () Bool)

(assert (=> mapIsEmpty!1528 mapRes!1528))

(declare-fun b!30075 () Bool)

(declare-fun e!19353 () Bool)

(assert (=> b!30075 (= e!19353 false)))

(declare-fun k!1304 () (_ BitVec 64))

(declare-datatypes ((array!1895 0))(
  ( (array!1896 (arr!901 (Array (_ BitVec 32) (_ BitVec 64))) (size!1002 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1895)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!96 0))(
  ( (MissingZero!96 (index!2506 (_ BitVec 32))) (Found!96 (index!2507 (_ BitVec 32))) (Intermediate!96 (undefined!908 Bool) (index!2508 (_ BitVec 32)) (x!6494 (_ BitVec 32))) (Undefined!96) (MissingVacant!96 (index!2509 (_ BitVec 32))) )
))
(declare-fun lt!11384 () SeekEntryResult!96)

(declare-fun seekEntry!0 ((_ BitVec 64) array!1895 (_ BitVec 32)) SeekEntryResult!96)

(assert (=> b!30075 (= lt!11384 (seekEntry!0 k!1304 _keys!1833 mask!2294))))

(declare-fun b!30076 () Bool)

(declare-fun res!18091 () Bool)

(assert (=> b!30076 (=> (not res!18091) (not e!19353))))

(declare-datatypes ((List!744 0))(
  ( (Nil!741) (Cons!740 (h!1307 (_ BitVec 64)) (t!3437 List!744)) )
))
(declare-fun arrayNoDuplicates!0 (array!1895 (_ BitVec 32) List!744) Bool)

(assert (=> b!30076 (= res!18091 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!741))))

(declare-fun b!30077 () Bool)

(declare-fun e!19351 () Bool)

(declare-fun tp_is_empty!1333 () Bool)

(assert (=> b!30077 (= e!19351 tp_is_empty!1333)))

(declare-fun b!30078 () Bool)

(declare-fun res!18093 () Bool)

(assert (=> b!30078 (=> (not res!18093) (not e!19353))))

(declare-datatypes ((V!1603 0))(
  ( (V!1604 (val!693 Int)) )
))
(declare-datatypes ((ValueCell!467 0))(
  ( (ValueCellFull!467 (v!1782 V!1603)) (EmptyCell!467) )
))
(declare-datatypes ((array!1897 0))(
  ( (array!1898 (arr!902 (Array (_ BitVec 32) ValueCell!467)) (size!1003 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1897)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(assert (=> b!30078 (= res!18093 (and (= (size!1003 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1002 _keys!1833) (size!1003 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!30079 () Bool)

(declare-fun res!18090 () Bool)

(assert (=> b!30079 (=> (not res!18090) (not e!19353))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1895 (_ BitVec 32)) Bool)

(assert (=> b!30079 (= res!18090 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun mapNonEmpty!1528 () Bool)

(declare-fun tp!4356 () Bool)

(assert (=> mapNonEmpty!1528 (= mapRes!1528 (and tp!4356 e!19351))))

(declare-fun mapValue!1528 () ValueCell!467)

(declare-fun mapKey!1528 () (_ BitVec 32))

(declare-fun mapRest!1528 () (Array (_ BitVec 32) ValueCell!467))

(assert (=> mapNonEmpty!1528 (= (arr!902 _values!1501) (store mapRest!1528 mapKey!1528 mapValue!1528))))

(declare-fun b!30080 () Bool)

(declare-fun e!19355 () Bool)

(assert (=> b!30080 (= e!19355 tp_is_empty!1333)))

(declare-fun b!30081 () Bool)

(declare-fun res!18089 () Bool)

(assert (=> b!30081 (=> (not res!18089) (not e!19353))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!30081 (= res!18089 (validKeyInArray!0 k!1304))))

(declare-fun b!30083 () Bool)

(declare-fun res!18092 () Bool)

(assert (=> b!30083 (=> (not res!18092) (not e!19353))))

(declare-fun arrayContainsKey!0 (array!1895 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!30083 (= res!18092 (not (arrayContainsKey!0 _keys!1833 k!1304 #b00000000000000000000000000000000)))))

(declare-fun b!30084 () Bool)

(declare-fun res!18087 () Bool)

(assert (=> b!30084 (=> (not res!18087) (not e!19353))))

(declare-fun defaultEntry!1504 () Int)

(declare-fun zeroValue!1443 () V!1603)

(declare-fun minValue!1443 () V!1603)

(declare-datatypes ((tuple2!1148 0))(
  ( (tuple2!1149 (_1!585 (_ BitVec 64)) (_2!585 V!1603)) )
))
(declare-datatypes ((List!745 0))(
  ( (Nil!742) (Cons!741 (h!1308 tuple2!1148) (t!3438 List!745)) )
))
(declare-datatypes ((ListLongMap!725 0))(
  ( (ListLongMap!726 (toList!378 List!745)) )
))
(declare-fun contains!318 (ListLongMap!725 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!206 (array!1895 array!1897 (_ BitVec 32) (_ BitVec 32) V!1603 V!1603 (_ BitVec 32) Int) ListLongMap!725)

(assert (=> b!30084 (= res!18087 (not (contains!318 (getCurrentListMap!206 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k!1304)))))

(declare-fun res!18088 () Bool)

(assert (=> start!4074 (=> (not res!18088) (not e!19353))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4074 (= res!18088 (validMask!0 mask!2294))))

(assert (=> start!4074 e!19353))

(assert (=> start!4074 true))

(assert (=> start!4074 tp!4357))

(declare-fun e!19352 () Bool)

(declare-fun array_inv!629 (array!1897) Bool)

(assert (=> start!4074 (and (array_inv!629 _values!1501) e!19352)))

(declare-fun array_inv!630 (array!1895) Bool)

(assert (=> start!4074 (array_inv!630 _keys!1833)))

(assert (=> start!4074 tp_is_empty!1333))

(declare-fun b!30082 () Bool)

(assert (=> b!30082 (= e!19352 (and e!19355 mapRes!1528))))

(declare-fun condMapEmpty!1528 () Bool)

(declare-fun mapDefault!1528 () ValueCell!467)

