; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3938 () Bool)

(assert start!3938)

(declare-fun b_free!843 () Bool)

(declare-fun b_next!843 () Bool)

(assert (=> start!3938 (= b_free!843 (not b_next!843))))

(declare-fun tp!3949 () Bool)

(declare-fun b_and!1653 () Bool)

(assert (=> start!3938 (= tp!3949 b_and!1653)))

(declare-fun b!28026 () Bool)

(declare-fun res!16650 () Bool)

(declare-fun e!18172 () Bool)

(assert (=> b!28026 (=> (not res!16650) (not e!18172))))

(declare-datatypes ((array!1635 0))(
  ( (array!1636 (arr!771 (Array (_ BitVec 32) (_ BitVec 64))) (size!872 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1635)

(declare-datatypes ((List!645 0))(
  ( (Nil!642) (Cons!641 (h!1208 (_ BitVec 64)) (t!3338 List!645)) )
))
(declare-fun arrayNoDuplicates!0 (array!1635 (_ BitVec 32) List!645) Bool)

(assert (=> b!28026 (= res!16650 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!642))))

(declare-fun b!28027 () Bool)

(declare-fun e!18170 () Bool)

(declare-fun tp_is_empty!1197 () Bool)

(assert (=> b!28027 (= e!18170 tp_is_empty!1197)))

(declare-fun b!28028 () Bool)

(declare-fun res!16651 () Bool)

(assert (=> b!28028 (=> (not res!16651) (not e!18172))))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!28028 (= res!16651 (validKeyInArray!0 k0!1304))))

(declare-fun mapNonEmpty!1324 () Bool)

(declare-fun mapRes!1324 () Bool)

(declare-fun tp!3948 () Bool)

(assert (=> mapNonEmpty!1324 (= mapRes!1324 (and tp!3948 e!18170))))

(declare-datatypes ((V!1421 0))(
  ( (V!1422 (val!625 Int)) )
))
(declare-datatypes ((ValueCell!399 0))(
  ( (ValueCellFull!399 (v!1714 V!1421)) (EmptyCell!399) )
))
(declare-datatypes ((array!1637 0))(
  ( (array!1638 (arr!772 (Array (_ BitVec 32) ValueCell!399)) (size!873 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1637)

(declare-fun mapRest!1324 () (Array (_ BitVec 32) ValueCell!399))

(declare-fun mapValue!1324 () ValueCell!399)

(declare-fun mapKey!1324 () (_ BitVec 32))

(assert (=> mapNonEmpty!1324 (= (arr!772 _values!1501) (store mapRest!1324 mapKey!1324 mapValue!1324))))

(declare-fun b!28030 () Bool)

(declare-fun res!16652 () Bool)

(assert (=> b!28030 (=> (not res!16652) (not e!18172))))

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun extraKeys!1422 () (_ BitVec 32))

(assert (=> b!28030 (= res!16652 (and (= (size!873 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!872 _keys!1833) (size!873 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!28031 () Bool)

(declare-fun res!16653 () Bool)

(assert (=> b!28031 (=> (not res!16653) (not e!18172))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1635 (_ BitVec 32)) Bool)

(assert (=> b!28031 (= res!16653 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!28032 () Bool)

(declare-fun e!18171 () Bool)

(declare-fun e!18173 () Bool)

(assert (=> b!28032 (= e!18171 (and e!18173 mapRes!1324))))

(declare-fun condMapEmpty!1324 () Bool)

(declare-fun mapDefault!1324 () ValueCell!399)

(assert (=> b!28032 (= condMapEmpty!1324 (= (arr!772 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!399)) mapDefault!1324)))))

(declare-fun b!28033 () Bool)

(assert (=> b!28033 (= e!18173 tp_is_empty!1197)))

(declare-fun b!28034 () Bool)

(declare-fun res!16654 () Bool)

(assert (=> b!28034 (=> (not res!16654) (not e!18172))))

(declare-fun defaultEntry!1504 () Int)

(declare-fun zeroValue!1443 () V!1421)

(declare-fun minValue!1443 () V!1421)

(declare-datatypes ((tuple2!1044 0))(
  ( (tuple2!1045 (_1!533 (_ BitVec 64)) (_2!533 V!1421)) )
))
(declare-datatypes ((List!646 0))(
  ( (Nil!643) (Cons!642 (h!1209 tuple2!1044) (t!3339 List!646)) )
))
(declare-datatypes ((ListLongMap!621 0))(
  ( (ListLongMap!622 (toList!326 List!646)) )
))
(declare-fun contains!266 (ListLongMap!621 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!156 (array!1635 array!1637 (_ BitVec 32) (_ BitVec 32) V!1421 V!1421 (_ BitVec 32) Int) ListLongMap!621)

(assert (=> b!28034 (= res!16654 (not (contains!266 (getCurrentListMap!156 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k0!1304)))))

(declare-fun mapIsEmpty!1324 () Bool)

(assert (=> mapIsEmpty!1324 mapRes!1324))

(declare-fun b!28035 () Bool)

(assert (=> b!28035 (= e!18172 false)))

(declare-fun lt!10739 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!1635 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!28035 (= lt!10739 (arrayScanForKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun res!16655 () Bool)

(assert (=> start!3938 (=> (not res!16655) (not e!18172))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!3938 (= res!16655 (validMask!0 mask!2294))))

(assert (=> start!3938 e!18172))

(assert (=> start!3938 true))

(assert (=> start!3938 tp!3949))

(declare-fun array_inv!531 (array!1637) Bool)

(assert (=> start!3938 (and (array_inv!531 _values!1501) e!18171)))

(declare-fun array_inv!532 (array!1635) Bool)

(assert (=> start!3938 (array_inv!532 _keys!1833)))

(assert (=> start!3938 tp_is_empty!1197))

(declare-fun b!28029 () Bool)

(declare-fun res!16656 () Bool)

(assert (=> b!28029 (=> (not res!16656) (not e!18172))))

(declare-fun arrayContainsKey!0 (array!1635 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!28029 (= res!16656 (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(assert (= (and start!3938 res!16655) b!28030))

(assert (= (and b!28030 res!16652) b!28031))

(assert (= (and b!28031 res!16653) b!28026))

(assert (= (and b!28026 res!16650) b!28028))

(assert (= (and b!28028 res!16651) b!28034))

(assert (= (and b!28034 res!16654) b!28029))

(assert (= (and b!28029 res!16656) b!28035))

(assert (= (and b!28032 condMapEmpty!1324) mapIsEmpty!1324))

(assert (= (and b!28032 (not condMapEmpty!1324)) mapNonEmpty!1324))

(get-info :version)

(assert (= (and mapNonEmpty!1324 ((_ is ValueCellFull!399) mapValue!1324)) b!28027))

(assert (= (and b!28032 ((_ is ValueCellFull!399) mapDefault!1324)) b!28033))

(assert (= start!3938 b!28032))

(declare-fun m!22325 () Bool)

(assert (=> b!28034 m!22325))

(assert (=> b!28034 m!22325))

(declare-fun m!22327 () Bool)

(assert (=> b!28034 m!22327))

(declare-fun m!22329 () Bool)

(assert (=> b!28026 m!22329))

(declare-fun m!22331 () Bool)

(assert (=> b!28031 m!22331))

(declare-fun m!22333 () Bool)

(assert (=> b!28029 m!22333))

(declare-fun m!22335 () Bool)

(assert (=> mapNonEmpty!1324 m!22335))

(declare-fun m!22337 () Bool)

(assert (=> start!3938 m!22337))

(declare-fun m!22339 () Bool)

(assert (=> start!3938 m!22339))

(declare-fun m!22341 () Bool)

(assert (=> start!3938 m!22341))

(declare-fun m!22343 () Bool)

(assert (=> b!28028 m!22343))

(declare-fun m!22345 () Bool)

(assert (=> b!28035 m!22345))

(check-sat (not b!28031) (not b!28034) b_and!1653 (not b!28029) (not b!28026) (not b!28035) (not start!3938) (not b!28028) (not mapNonEmpty!1324) (not b_next!843) tp_is_empty!1197)
(check-sat b_and!1653 (not b_next!843))
