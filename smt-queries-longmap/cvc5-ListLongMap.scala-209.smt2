; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3936 () Bool)

(assert start!3936)

(declare-fun b_free!841 () Bool)

(declare-fun b_next!841 () Bool)

(assert (=> start!3936 (= b_free!841 (not b_next!841))))

(declare-fun tp!3942 () Bool)

(declare-fun b_and!1651 () Bool)

(assert (=> start!3936 (= tp!3942 b_and!1651)))

(declare-fun b!27996 () Bool)

(declare-fun res!16630 () Bool)

(declare-fun e!18154 () Bool)

(assert (=> b!27996 (=> (not res!16630) (not e!18154))))

(declare-datatypes ((V!1419 0))(
  ( (V!1420 (val!624 Int)) )
))
(declare-datatypes ((ValueCell!398 0))(
  ( (ValueCellFull!398 (v!1713 V!1419)) (EmptyCell!398) )
))
(declare-datatypes ((array!1631 0))(
  ( (array!1632 (arr!769 (Array (_ BitVec 32) ValueCell!398)) (size!870 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1631)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-fun mask!2294 () (_ BitVec 32))

(declare-datatypes ((array!1633 0))(
  ( (array!1634 (arr!770 (Array (_ BitVec 32) (_ BitVec 64))) (size!871 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1633)

(assert (=> b!27996 (= res!16630 (and (= (size!870 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!871 _keys!1833) (size!870 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!27997 () Bool)

(declare-fun res!16632 () Bool)

(assert (=> b!27997 (=> (not res!16632) (not e!18154))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1633 (_ BitVec 32)) Bool)

(assert (=> b!27997 (= res!16632 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!27998 () Bool)

(declare-fun res!16629 () Bool)

(assert (=> b!27998 (=> (not res!16629) (not e!18154))))

(declare-datatypes ((List!643 0))(
  ( (Nil!640) (Cons!639 (h!1206 (_ BitVec 64)) (t!3336 List!643)) )
))
(declare-fun arrayNoDuplicates!0 (array!1633 (_ BitVec 32) List!643) Bool)

(assert (=> b!27998 (= res!16629 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!640))))

(declare-fun b!27999 () Bool)

(declare-fun res!16634 () Bool)

(assert (=> b!27999 (=> (not res!16634) (not e!18154))))

(declare-fun k!1304 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!27999 (= res!16634 (validKeyInArray!0 k!1304))))

(declare-fun mapNonEmpty!1321 () Bool)

(declare-fun mapRes!1321 () Bool)

(declare-fun tp!3943 () Bool)

(declare-fun e!18156 () Bool)

(assert (=> mapNonEmpty!1321 (= mapRes!1321 (and tp!3943 e!18156))))

(declare-fun mapKey!1321 () (_ BitVec 32))

(declare-fun mapRest!1321 () (Array (_ BitVec 32) ValueCell!398))

(declare-fun mapValue!1321 () ValueCell!398)

(assert (=> mapNonEmpty!1321 (= (arr!769 _values!1501) (store mapRest!1321 mapKey!1321 mapValue!1321))))

(declare-fun res!16631 () Bool)

(assert (=> start!3936 (=> (not res!16631) (not e!18154))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!3936 (= res!16631 (validMask!0 mask!2294))))

(assert (=> start!3936 e!18154))

(assert (=> start!3936 true))

(assert (=> start!3936 tp!3942))

(declare-fun e!18155 () Bool)

(declare-fun array_inv!529 (array!1631) Bool)

(assert (=> start!3936 (and (array_inv!529 _values!1501) e!18155)))

(declare-fun array_inv!530 (array!1633) Bool)

(assert (=> start!3936 (array_inv!530 _keys!1833)))

(declare-fun tp_is_empty!1195 () Bool)

(assert (=> start!3936 tp_is_empty!1195))

(declare-fun b!28000 () Bool)

(declare-fun e!18158 () Bool)

(assert (=> b!28000 (= e!18158 tp_is_empty!1195)))

(declare-fun b!28001 () Bool)

(assert (=> b!28001 (= e!18156 tp_is_empty!1195)))

(declare-fun mapIsEmpty!1321 () Bool)

(assert (=> mapIsEmpty!1321 mapRes!1321))

(declare-fun b!28002 () Bool)

(declare-fun res!16633 () Bool)

(assert (=> b!28002 (=> (not res!16633) (not e!18154))))

(declare-fun arrayContainsKey!0 (array!1633 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!28002 (= res!16633 (arrayContainsKey!0 _keys!1833 k!1304 #b00000000000000000000000000000000))))

(declare-fun b!28003 () Bool)

(declare-fun res!16635 () Bool)

(assert (=> b!28003 (=> (not res!16635) (not e!18154))))

(declare-fun defaultEntry!1504 () Int)

(declare-fun zeroValue!1443 () V!1419)

(declare-fun minValue!1443 () V!1419)

(declare-datatypes ((tuple2!1042 0))(
  ( (tuple2!1043 (_1!532 (_ BitVec 64)) (_2!532 V!1419)) )
))
(declare-datatypes ((List!644 0))(
  ( (Nil!641) (Cons!640 (h!1207 tuple2!1042) (t!3337 List!644)) )
))
(declare-datatypes ((ListLongMap!619 0))(
  ( (ListLongMap!620 (toList!325 List!644)) )
))
(declare-fun contains!265 (ListLongMap!619 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!155 (array!1633 array!1631 (_ BitVec 32) (_ BitVec 32) V!1419 V!1419 (_ BitVec 32) Int) ListLongMap!619)

(assert (=> b!28003 (= res!16635 (not (contains!265 (getCurrentListMap!155 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k!1304)))))

(declare-fun b!28004 () Bool)

(assert (=> b!28004 (= e!18154 false)))

(declare-fun lt!10736 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!1633 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!28004 (= lt!10736 (arrayScanForKey!0 _keys!1833 k!1304 #b00000000000000000000000000000000))))

(declare-fun b!28005 () Bool)

(assert (=> b!28005 (= e!18155 (and e!18158 mapRes!1321))))

(declare-fun condMapEmpty!1321 () Bool)

(declare-fun mapDefault!1321 () ValueCell!398)

