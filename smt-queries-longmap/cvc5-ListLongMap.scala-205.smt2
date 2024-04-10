; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3912 () Bool)

(assert start!3912)

(declare-fun b_free!817 () Bool)

(declare-fun b_next!817 () Bool)

(assert (=> start!3912 (= b_free!817 (not b_next!817))))

(declare-fun tp!3871 () Bool)

(declare-fun b_and!1627 () Bool)

(assert (=> start!3912 (= tp!3871 b_and!1627)))

(declare-fun b!27636 () Bool)

(declare-fun res!16377 () Bool)

(declare-fun e!17977 () Bool)

(assert (=> b!27636 (=> (not res!16377) (not e!17977))))

(declare-fun k!1304 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!27636 (= res!16377 (validKeyInArray!0 k!1304))))

(declare-fun b!27637 () Bool)

(declare-fun e!17974 () Bool)

(declare-fun tp_is_empty!1171 () Bool)

(assert (=> b!27637 (= e!17974 tp_is_empty!1171)))

(declare-fun b!27638 () Bool)

(declare-fun res!16381 () Bool)

(assert (=> b!27638 (=> (not res!16381) (not e!17977))))

(declare-datatypes ((array!1583 0))(
  ( (array!1584 (arr!745 (Array (_ BitVec 32) (_ BitVec 64))) (size!846 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1583)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1583 (_ BitVec 32)) Bool)

(assert (=> b!27638 (= res!16381 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!27639 () Bool)

(declare-fun res!16378 () Bool)

(assert (=> b!27639 (=> (not res!16378) (not e!17977))))

(declare-datatypes ((V!1387 0))(
  ( (V!1388 (val!612 Int)) )
))
(declare-datatypes ((ValueCell!386 0))(
  ( (ValueCellFull!386 (v!1701 V!1387)) (EmptyCell!386) )
))
(declare-datatypes ((array!1585 0))(
  ( (array!1586 (arr!746 (Array (_ BitVec 32) ValueCell!386)) (size!847 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1585)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(assert (=> b!27639 (= res!16378 (and (= (size!847 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!846 _keys!1833) (size!847 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!27640 () Bool)

(assert (=> b!27640 (= e!17977 false)))

(declare-fun lt!10700 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!1583 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!27640 (= lt!10700 (arrayScanForKey!0 _keys!1833 k!1304 #b00000000000000000000000000000000))))

(declare-fun b!27641 () Bool)

(declare-fun res!16380 () Bool)

(assert (=> b!27641 (=> (not res!16380) (not e!17977))))

(declare-fun arrayContainsKey!0 (array!1583 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!27641 (= res!16380 (arrayContainsKey!0 _keys!1833 k!1304 #b00000000000000000000000000000000))))

(declare-fun b!27642 () Bool)

(declare-fun res!16383 () Bool)

(assert (=> b!27642 (=> (not res!16383) (not e!17977))))

(declare-fun defaultEntry!1504 () Int)

(declare-fun zeroValue!1443 () V!1387)

(declare-fun minValue!1443 () V!1387)

(declare-datatypes ((tuple2!1028 0))(
  ( (tuple2!1029 (_1!525 (_ BitVec 64)) (_2!525 V!1387)) )
))
(declare-datatypes ((List!628 0))(
  ( (Nil!625) (Cons!624 (h!1191 tuple2!1028) (t!3321 List!628)) )
))
(declare-datatypes ((ListLongMap!605 0))(
  ( (ListLongMap!606 (toList!318 List!628)) )
))
(declare-fun contains!258 (ListLongMap!605 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!148 (array!1583 array!1585 (_ BitVec 32) (_ BitVec 32) V!1387 V!1387 (_ BitVec 32) Int) ListLongMap!605)

(assert (=> b!27642 (= res!16383 (not (contains!258 (getCurrentListMap!148 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k!1304)))))

(declare-fun mapNonEmpty!1285 () Bool)

(declare-fun mapRes!1285 () Bool)

(declare-fun tp!3870 () Bool)

(declare-fun e!17975 () Bool)

(assert (=> mapNonEmpty!1285 (= mapRes!1285 (and tp!3870 e!17975))))

(declare-fun mapKey!1285 () (_ BitVec 32))

(declare-fun mapValue!1285 () ValueCell!386)

(declare-fun mapRest!1285 () (Array (_ BitVec 32) ValueCell!386))

(assert (=> mapNonEmpty!1285 (= (arr!746 _values!1501) (store mapRest!1285 mapKey!1285 mapValue!1285))))

(declare-fun b!27643 () Bool)

(declare-fun res!16382 () Bool)

(assert (=> b!27643 (=> (not res!16382) (not e!17977))))

(declare-datatypes ((List!629 0))(
  ( (Nil!626) (Cons!625 (h!1192 (_ BitVec 64)) (t!3322 List!629)) )
))
(declare-fun arrayNoDuplicates!0 (array!1583 (_ BitVec 32) List!629) Bool)

(assert (=> b!27643 (= res!16382 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!626))))

(declare-fun res!16379 () Bool)

(assert (=> start!3912 (=> (not res!16379) (not e!17977))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!3912 (= res!16379 (validMask!0 mask!2294))))

(assert (=> start!3912 e!17977))

(assert (=> start!3912 true))

(assert (=> start!3912 tp!3871))

(declare-fun e!17976 () Bool)

(declare-fun array_inv!511 (array!1585) Bool)

(assert (=> start!3912 (and (array_inv!511 _values!1501) e!17976)))

(declare-fun array_inv!512 (array!1583) Bool)

(assert (=> start!3912 (array_inv!512 _keys!1833)))

(assert (=> start!3912 tp_is_empty!1171))

(declare-fun b!27644 () Bool)

(assert (=> b!27644 (= e!17975 tp_is_empty!1171)))

(declare-fun b!27645 () Bool)

(assert (=> b!27645 (= e!17976 (and e!17974 mapRes!1285))))

(declare-fun condMapEmpty!1285 () Bool)

(declare-fun mapDefault!1285 () ValueCell!386)

