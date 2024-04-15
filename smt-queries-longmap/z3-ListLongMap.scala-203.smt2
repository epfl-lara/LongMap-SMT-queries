; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3890 () Bool)

(assert start!3890)

(declare-fun b_free!805 () Bool)

(declare-fun b_next!805 () Bool)

(assert (=> start!3890 (= b_free!805 (not b_next!805))))

(declare-fun tp!3834 () Bool)

(declare-fun b_and!1609 () Bool)

(assert (=> start!3890 (= tp!3834 b_and!1609)))

(declare-fun mapIsEmpty!1267 () Bool)

(declare-fun mapRes!1267 () Bool)

(assert (=> mapIsEmpty!1267 mapRes!1267))

(declare-fun res!16222 () Bool)

(declare-fun e!17845 () Bool)

(assert (=> start!3890 (=> (not res!16222) (not e!17845))))

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!3890 (= res!16222 (validMask!0 mask!2294))))

(assert (=> start!3890 e!17845))

(assert (=> start!3890 true))

(assert (=> start!3890 tp!3834))

(declare-datatypes ((V!1371 0))(
  ( (V!1372 (val!606 Int)) )
))
(declare-datatypes ((ValueCell!380 0))(
  ( (ValueCellFull!380 (v!1694 V!1371)) (EmptyCell!380) )
))
(declare-datatypes ((array!1535 0))(
  ( (array!1536 (arr!721 (Array (_ BitVec 32) ValueCell!380)) (size!822 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1535)

(declare-fun e!17844 () Bool)

(declare-fun array_inv!513 (array!1535) Bool)

(assert (=> start!3890 (and (array_inv!513 _values!1501) e!17844)))

(declare-datatypes ((array!1537 0))(
  ( (array!1538 (arr!722 (Array (_ BitVec 32) (_ BitVec 64))) (size!823 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1537)

(declare-fun array_inv!514 (array!1537) Bool)

(assert (=> start!3890 (array_inv!514 _keys!1833)))

(declare-fun tp_is_empty!1159 () Bool)

(assert (=> start!3890 tp_is_empty!1159))

(declare-fun b!27402 () Bool)

(declare-fun res!16220 () Bool)

(assert (=> b!27402 (=> (not res!16220) (not e!17845))))

(declare-fun extraKeys!1422 () (_ BitVec 32))

(assert (=> b!27402 (= res!16220 (and (= (size!822 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!823 _keys!1833) (size!822 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!27403 () Bool)

(declare-fun e!17841 () Bool)

(assert (=> b!27403 (= e!17844 (and e!17841 mapRes!1267))))

(declare-fun condMapEmpty!1267 () Bool)

(declare-fun mapDefault!1267 () ValueCell!380)

(assert (=> b!27403 (= condMapEmpty!1267 (= (arr!721 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!380)) mapDefault!1267)))))

(declare-fun b!27404 () Bool)

(declare-fun res!16223 () Bool)

(assert (=> b!27404 (=> (not res!16223) (not e!17845))))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!1537 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!27404 (= res!16223 (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun b!27405 () Bool)

(declare-fun res!16225 () Bool)

(assert (=> b!27405 (=> (not res!16225) (not e!17845))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!27405 (= res!16225 (validKeyInArray!0 k0!1304))))

(declare-fun b!27406 () Bool)

(declare-fun e!17843 () Bool)

(assert (=> b!27406 (= e!17843 tp_is_empty!1159)))

(declare-fun mapNonEmpty!1267 () Bool)

(declare-fun tp!3835 () Bool)

(assert (=> mapNonEmpty!1267 (= mapRes!1267 (and tp!3835 e!17843))))

(declare-fun mapValue!1267 () ValueCell!380)

(declare-fun mapKey!1267 () (_ BitVec 32))

(declare-fun mapRest!1267 () (Array (_ BitVec 32) ValueCell!380))

(assert (=> mapNonEmpty!1267 (= (arr!721 _values!1501) (store mapRest!1267 mapKey!1267 mapValue!1267))))

(declare-fun b!27407 () Bool)

(assert (=> b!27407 (= e!17841 tp_is_empty!1159)))

(declare-fun b!27408 () Bool)

(declare-fun res!16224 () Bool)

(assert (=> b!27408 (=> (not res!16224) (not e!17845))))

(declare-datatypes ((List!613 0))(
  ( (Nil!610) (Cons!609 (h!1176 (_ BitVec 64)) (t!3299 List!613)) )
))
(declare-fun arrayNoDuplicates!0 (array!1537 (_ BitVec 32) List!613) Bool)

(assert (=> b!27408 (= res!16224 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!610))))

(declare-fun b!27409 () Bool)

(assert (=> b!27409 (= e!17845 false)))

(declare-fun lt!10678 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!1537 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!27409 (= lt!10678 (arrayScanForKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun b!27410 () Bool)

(declare-fun res!16219 () Bool)

(assert (=> b!27410 (=> (not res!16219) (not e!17845))))

(declare-fun defaultEntry!1504 () Int)

(declare-fun zeroValue!1443 () V!1371)

(declare-fun minValue!1443 () V!1371)

(declare-datatypes ((tuple2!1028 0))(
  ( (tuple2!1029 (_1!525 (_ BitVec 64)) (_2!525 V!1371)) )
))
(declare-datatypes ((List!614 0))(
  ( (Nil!611) (Cons!610 (h!1177 tuple2!1028) (t!3300 List!614)) )
))
(declare-datatypes ((ListLongMap!593 0))(
  ( (ListLongMap!594 (toList!312 List!614)) )
))
(declare-fun contains!253 (ListLongMap!593 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!142 (array!1537 array!1535 (_ BitVec 32) (_ BitVec 32) V!1371 V!1371 (_ BitVec 32) Int) ListLongMap!593)

(assert (=> b!27410 (= res!16219 (not (contains!253 (getCurrentListMap!142 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k0!1304)))))

(declare-fun b!27411 () Bool)

(declare-fun res!16221 () Bool)

(assert (=> b!27411 (=> (not res!16221) (not e!17845))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1537 (_ BitVec 32)) Bool)

(assert (=> b!27411 (= res!16221 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(assert (= (and start!3890 res!16222) b!27402))

(assert (= (and b!27402 res!16220) b!27411))

(assert (= (and b!27411 res!16221) b!27408))

(assert (= (and b!27408 res!16224) b!27405))

(assert (= (and b!27405 res!16225) b!27410))

(assert (= (and b!27410 res!16219) b!27404))

(assert (= (and b!27404 res!16223) b!27409))

(assert (= (and b!27403 condMapEmpty!1267) mapIsEmpty!1267))

(assert (= (and b!27403 (not condMapEmpty!1267)) mapNonEmpty!1267))

(get-info :version)

(assert (= (and mapNonEmpty!1267 ((_ is ValueCellFull!380) mapValue!1267)) b!27406))

(assert (= (and b!27403 ((_ is ValueCellFull!380) mapDefault!1267)) b!27407))

(assert (= start!3890 b!27403))

(declare-fun m!21837 () Bool)

(assert (=> b!27409 m!21837))

(declare-fun m!21839 () Bool)

(assert (=> b!27410 m!21839))

(assert (=> b!27410 m!21839))

(declare-fun m!21841 () Bool)

(assert (=> b!27410 m!21841))

(declare-fun m!21843 () Bool)

(assert (=> b!27411 m!21843))

(declare-fun m!21845 () Bool)

(assert (=> start!3890 m!21845))

(declare-fun m!21847 () Bool)

(assert (=> start!3890 m!21847))

(declare-fun m!21849 () Bool)

(assert (=> start!3890 m!21849))

(declare-fun m!21851 () Bool)

(assert (=> b!27405 m!21851))

(declare-fun m!21853 () Bool)

(assert (=> b!27408 m!21853))

(declare-fun m!21855 () Bool)

(assert (=> b!27404 m!21855))

(declare-fun m!21857 () Bool)

(assert (=> mapNonEmpty!1267 m!21857))

(check-sat (not b!27410) (not b!27405) (not start!3890) (not b!27411) (not mapNonEmpty!1267) (not b!27408) (not b!27409) b_and!1609 (not b_next!805) tp_is_empty!1159 (not b!27404))
(check-sat b_and!1609 (not b_next!805))
