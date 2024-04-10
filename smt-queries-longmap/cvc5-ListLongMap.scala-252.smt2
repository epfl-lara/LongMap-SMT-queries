; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4194 () Bool)

(assert start!4194)

(declare-fun b_free!1099 () Bool)

(declare-fun b_next!1099 () Bool)

(assert (=> start!4194 (= b_free!1099 (not b_next!1099))))

(declare-fun tp!4716 () Bool)

(declare-fun b_and!1909 () Bool)

(assert (=> start!4194 (= tp!4716 b_and!1909)))

(declare-fun b!31857 () Bool)

(declare-fun e!20305 () Bool)

(assert (=> b!31857 (= e!20305 false)))

(declare-fun lt!11609 () (_ BitVec 32))

(declare-datatypes ((array!2121 0))(
  ( (array!2122 (arr!1014 (Array (_ BitVec 32) (_ BitVec 64))) (size!1115 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2121)

(declare-fun k!1304 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!2121 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!31857 (= lt!11609 (arrayScanForKey!0 _keys!1833 k!1304 #b00000000000000000000000000000000))))

(declare-fun b!31858 () Bool)

(declare-fun e!20308 () Bool)

(declare-fun tp_is_empty!1453 () Bool)

(assert (=> b!31858 (= e!20308 tp_is_empty!1453)))

(declare-fun b!31859 () Bool)

(declare-fun res!19330 () Bool)

(assert (=> b!31859 (=> (not res!19330) (not e!20305))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!31859 (= res!19330 (validKeyInArray!0 k!1304))))

(declare-fun res!19332 () Bool)

(assert (=> start!4194 (=> (not res!19332) (not e!20305))))

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4194 (= res!19332 (validMask!0 mask!2294))))

(assert (=> start!4194 e!20305))

(assert (=> start!4194 true))

(assert (=> start!4194 tp!4716))

(declare-datatypes ((V!1763 0))(
  ( (V!1764 (val!753 Int)) )
))
(declare-datatypes ((ValueCell!527 0))(
  ( (ValueCellFull!527 (v!1842 V!1763)) (EmptyCell!527) )
))
(declare-datatypes ((array!2123 0))(
  ( (array!2124 (arr!1015 (Array (_ BitVec 32) ValueCell!527)) (size!1116 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2123)

(declare-fun e!20306 () Bool)

(declare-fun array_inv!707 (array!2123) Bool)

(assert (=> start!4194 (and (array_inv!707 _values!1501) e!20306)))

(declare-fun array_inv!708 (array!2121) Bool)

(assert (=> start!4194 (array_inv!708 _keys!1833)))

(assert (=> start!4194 tp_is_empty!1453))

(declare-fun b!31860 () Bool)

(declare-fun res!19333 () Bool)

(assert (=> b!31860 (=> (not res!19333) (not e!20305))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2121 (_ BitVec 32)) Bool)

(assert (=> b!31860 (= res!19333 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!31861 () Bool)

(declare-fun res!19331 () Bool)

(assert (=> b!31861 (=> (not res!19331) (not e!20305))))

(declare-fun extraKeys!1422 () (_ BitVec 32))

(assert (=> b!31861 (= res!19331 (and (= (size!1116 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1115 _keys!1833) (size!1116 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!31862 () Bool)

(declare-fun e!20307 () Bool)

(assert (=> b!31862 (= e!20307 tp_is_empty!1453)))

(declare-fun mapNonEmpty!1708 () Bool)

(declare-fun mapRes!1708 () Bool)

(declare-fun tp!4717 () Bool)

(assert (=> mapNonEmpty!1708 (= mapRes!1708 (and tp!4717 e!20308))))

(declare-fun mapRest!1708 () (Array (_ BitVec 32) ValueCell!527))

(declare-fun mapKey!1708 () (_ BitVec 32))

(declare-fun mapValue!1708 () ValueCell!527)

(assert (=> mapNonEmpty!1708 (= (arr!1015 _values!1501) (store mapRest!1708 mapKey!1708 mapValue!1708))))

(declare-fun mapIsEmpty!1708 () Bool)

(assert (=> mapIsEmpty!1708 mapRes!1708))

(declare-fun b!31863 () Bool)

(declare-fun res!19334 () Bool)

(assert (=> b!31863 (=> (not res!19334) (not e!20305))))

(declare-datatypes ((List!819 0))(
  ( (Nil!816) (Cons!815 (h!1382 (_ BitVec 64)) (t!3512 List!819)) )
))
(declare-fun arrayNoDuplicates!0 (array!2121 (_ BitVec 32) List!819) Bool)

(assert (=> b!31863 (= res!19334 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!816))))

(declare-fun b!31864 () Bool)

(declare-fun res!19329 () Bool)

(assert (=> b!31864 (=> (not res!19329) (not e!20305))))

(declare-fun arrayContainsKey!0 (array!2121 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!31864 (= res!19329 (arrayContainsKey!0 _keys!1833 k!1304 #b00000000000000000000000000000000))))

(declare-fun b!31865 () Bool)

(declare-fun res!19335 () Bool)

(assert (=> b!31865 (=> (not res!19335) (not e!20305))))

(declare-fun defaultEntry!1504 () Int)

(declare-fun zeroValue!1443 () V!1763)

(declare-fun minValue!1443 () V!1763)

(declare-datatypes ((tuple2!1226 0))(
  ( (tuple2!1227 (_1!624 (_ BitVec 64)) (_2!624 V!1763)) )
))
(declare-datatypes ((List!820 0))(
  ( (Nil!817) (Cons!816 (h!1383 tuple2!1226) (t!3513 List!820)) )
))
(declare-datatypes ((ListLongMap!803 0))(
  ( (ListLongMap!804 (toList!417 List!820)) )
))
(declare-fun contains!357 (ListLongMap!803 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!245 (array!2121 array!2123 (_ BitVec 32) (_ BitVec 32) V!1763 V!1763 (_ BitVec 32) Int) ListLongMap!803)

(assert (=> b!31865 (= res!19335 (not (contains!357 (getCurrentListMap!245 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k!1304)))))

(declare-fun b!31866 () Bool)

(assert (=> b!31866 (= e!20306 (and e!20307 mapRes!1708))))

(declare-fun condMapEmpty!1708 () Bool)

(declare-fun mapDefault!1708 () ValueCell!527)

