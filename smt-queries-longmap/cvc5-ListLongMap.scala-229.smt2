; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4056 () Bool)

(assert start!4056)

(declare-fun b_free!961 () Bool)

(declare-fun b_next!961 () Bool)

(assert (=> start!4056 (= b_free!961 (not b_next!961))))

(declare-fun tp!4303 () Bool)

(declare-fun b_and!1771 () Bool)

(assert (=> start!4056 (= tp!4303 b_and!1771)))

(declare-fun b!29805 () Bool)

(declare-fun res!17899 () Bool)

(declare-fun e!19219 () Bool)

(assert (=> b!29805 (=> (not res!17899) (not e!19219))))

(declare-fun k!1304 () (_ BitVec 64))

(declare-fun defaultEntry!1504 () Int)

(declare-datatypes ((V!1579 0))(
  ( (V!1580 (val!684 Int)) )
))
(declare-datatypes ((ValueCell!458 0))(
  ( (ValueCellFull!458 (v!1773 V!1579)) (EmptyCell!458) )
))
(declare-datatypes ((array!1861 0))(
  ( (array!1862 (arr!884 (Array (_ BitVec 32) ValueCell!458)) (size!985 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1861)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-datatypes ((array!1863 0))(
  ( (array!1864 (arr!885 (Array (_ BitVec 32) (_ BitVec 64))) (size!986 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1863)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun zeroValue!1443 () V!1579)

(declare-fun minValue!1443 () V!1579)

(declare-datatypes ((tuple2!1134 0))(
  ( (tuple2!1135 (_1!578 (_ BitVec 64)) (_2!578 V!1579)) )
))
(declare-datatypes ((List!731 0))(
  ( (Nil!728) (Cons!727 (h!1294 tuple2!1134) (t!3424 List!731)) )
))
(declare-datatypes ((ListLongMap!711 0))(
  ( (ListLongMap!712 (toList!371 List!731)) )
))
(declare-fun contains!311 (ListLongMap!711 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!199 (array!1863 array!1861 (_ BitVec 32) (_ BitVec 32) V!1579 V!1579 (_ BitVec 32) Int) ListLongMap!711)

(assert (=> b!29805 (= res!17899 (not (contains!311 (getCurrentListMap!199 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k!1304)))))

(declare-fun b!29806 () Bool)

(assert (=> b!29806 (= e!19219 false)))

(declare-datatypes ((SeekEntryResult!90 0))(
  ( (MissingZero!90 (index!2482 (_ BitVec 32))) (Found!90 (index!2483 (_ BitVec 32))) (Intermediate!90 (undefined!902 Bool) (index!2484 (_ BitVec 32)) (x!6464 (_ BitVec 32))) (Undefined!90) (MissingVacant!90 (index!2485 (_ BitVec 32))) )
))
(declare-fun lt!11357 () SeekEntryResult!90)

(declare-fun seekEntry!0 ((_ BitVec 64) array!1863 (_ BitVec 32)) SeekEntryResult!90)

(assert (=> b!29806 (= lt!11357 (seekEntry!0 k!1304 _keys!1833 mask!2294))))

(declare-fun b!29807 () Bool)

(declare-fun res!17902 () Bool)

(assert (=> b!29807 (=> (not res!17902) (not e!19219))))

(declare-datatypes ((List!732 0))(
  ( (Nil!729) (Cons!728 (h!1295 (_ BitVec 64)) (t!3425 List!732)) )
))
(declare-fun arrayNoDuplicates!0 (array!1863 (_ BitVec 32) List!732) Bool)

(assert (=> b!29807 (= res!17902 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!729))))

(declare-fun mapNonEmpty!1501 () Bool)

(declare-fun mapRes!1501 () Bool)

(declare-fun tp!4302 () Bool)

(declare-fun e!19217 () Bool)

(assert (=> mapNonEmpty!1501 (= mapRes!1501 (and tp!4302 e!19217))))

(declare-fun mapValue!1501 () ValueCell!458)

(declare-fun mapRest!1501 () (Array (_ BitVec 32) ValueCell!458))

(declare-fun mapKey!1501 () (_ BitVec 32))

(assert (=> mapNonEmpty!1501 (= (arr!884 _values!1501) (store mapRest!1501 mapKey!1501 mapValue!1501))))

(declare-fun b!29809 () Bool)

(declare-fun tp_is_empty!1315 () Bool)

(assert (=> b!29809 (= e!19217 tp_is_empty!1315)))

(declare-fun b!29810 () Bool)

(declare-fun e!19216 () Bool)

(assert (=> b!29810 (= e!19216 tp_is_empty!1315)))

(declare-fun b!29811 () Bool)

(declare-fun res!17901 () Bool)

(assert (=> b!29811 (=> (not res!17901) (not e!19219))))

(declare-fun arrayContainsKey!0 (array!1863 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!29811 (= res!17901 (not (arrayContainsKey!0 _keys!1833 k!1304 #b00000000000000000000000000000000)))))

(declare-fun b!29812 () Bool)

(declare-fun res!17900 () Bool)

(assert (=> b!29812 (=> (not res!17900) (not e!19219))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1863 (_ BitVec 32)) Bool)

(assert (=> b!29812 (= res!17900 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!29813 () Bool)

(declare-fun res!17904 () Bool)

(assert (=> b!29813 (=> (not res!17904) (not e!19219))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!29813 (= res!17904 (validKeyInArray!0 k!1304))))

(declare-fun b!29814 () Bool)

(declare-fun res!17898 () Bool)

(assert (=> b!29814 (=> (not res!17898) (not e!19219))))

(assert (=> b!29814 (= res!17898 (and (= (size!985 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!986 _keys!1833) (size!985 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!1501 () Bool)

(assert (=> mapIsEmpty!1501 mapRes!1501))

(declare-fun res!17903 () Bool)

(assert (=> start!4056 (=> (not res!17903) (not e!19219))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4056 (= res!17903 (validMask!0 mask!2294))))

(assert (=> start!4056 e!19219))

(assert (=> start!4056 true))

(assert (=> start!4056 tp!4303))

(declare-fun e!19218 () Bool)

(declare-fun array_inv!615 (array!1861) Bool)

(assert (=> start!4056 (and (array_inv!615 _values!1501) e!19218)))

(declare-fun array_inv!616 (array!1863) Bool)

(assert (=> start!4056 (array_inv!616 _keys!1833)))

(assert (=> start!4056 tp_is_empty!1315))

(declare-fun b!29808 () Bool)

(assert (=> b!29808 (= e!19218 (and e!19216 mapRes!1501))))

(declare-fun condMapEmpty!1501 () Bool)

(declare-fun mapDefault!1501 () ValueCell!458)

