; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4154 () Bool)

(assert start!4154)

(declare-fun b_free!1069 () Bool)

(declare-fun b_next!1069 () Bool)

(assert (=> start!4154 (= b_free!1069 (not b_next!1069))))

(declare-fun tp!4627 () Bool)

(declare-fun b_and!1873 () Bool)

(assert (=> start!4154 (= tp!4627 b_and!1873)))

(declare-fun mapIsEmpty!1663 () Bool)

(declare-fun mapRes!1663 () Bool)

(assert (=> mapIsEmpty!1663 mapRes!1663))

(declare-fun res!18998 () Bool)

(declare-fun e!20041 () Bool)

(assert (=> start!4154 (=> (not res!18998) (not e!20041))))

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4154 (= res!18998 (validMask!0 mask!2294))))

(assert (=> start!4154 e!20041))

(assert (=> start!4154 true))

(assert (=> start!4154 tp!4627))

(declare-datatypes ((V!1723 0))(
  ( (V!1724 (val!738 Int)) )
))
(declare-datatypes ((ValueCell!512 0))(
  ( (ValueCellFull!512 (v!1826 V!1723)) (EmptyCell!512) )
))
(declare-datatypes ((array!2037 0))(
  ( (array!2038 (arr!972 (Array (_ BitVec 32) ValueCell!512)) (size!1073 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2037)

(declare-fun e!20038 () Bool)

(declare-fun array_inv!685 (array!2037) Bool)

(assert (=> start!4154 (and (array_inv!685 _values!1501) e!20038)))

(declare-datatypes ((array!2039 0))(
  ( (array!2040 (arr!973 (Array (_ BitVec 32) (_ BitVec 64))) (size!1074 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2039)

(declare-fun array_inv!686 (array!2039) Bool)

(assert (=> start!4154 (array_inv!686 _keys!1833)))

(declare-fun tp_is_empty!1423 () Bool)

(assert (=> start!4154 tp_is_empty!1423))

(declare-fun mapNonEmpty!1663 () Bool)

(declare-fun tp!4626 () Bool)

(declare-fun e!20037 () Bool)

(assert (=> mapNonEmpty!1663 (= mapRes!1663 (and tp!4626 e!20037))))

(declare-fun mapRest!1663 () (Array (_ BitVec 32) ValueCell!512))

(declare-fun mapKey!1663 () (_ BitVec 32))

(declare-fun mapValue!1663 () ValueCell!512)

(assert (=> mapNonEmpty!1663 (= (arr!972 _values!1501) (store mapRest!1663 mapKey!1663 mapValue!1663))))

(declare-fun b!31367 () Bool)

(declare-fun e!20039 () Bool)

(assert (=> b!31367 (= e!20039 tp_is_empty!1423)))

(declare-fun b!31368 () Bool)

(declare-fun res!19000 () Bool)

(assert (=> b!31368 (=> (not res!19000) (not e!20041))))

(declare-datatypes ((List!792 0))(
  ( (Nil!789) (Cons!788 (h!1355 (_ BitVec 64)) (t!3478 List!792)) )
))
(declare-fun arrayNoDuplicates!0 (array!2039 (_ BitVec 32) List!792) Bool)

(assert (=> b!31368 (= res!19000 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!789))))

(declare-fun b!31369 () Bool)

(assert (=> b!31369 (= e!20038 (and e!20039 mapRes!1663))))

(declare-fun condMapEmpty!1663 () Bool)

(declare-fun mapDefault!1663 () ValueCell!512)

(assert (=> b!31369 (= condMapEmpty!1663 (= (arr!972 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!512)) mapDefault!1663)))))

(declare-fun b!31370 () Bool)

(assert (=> b!31370 (= e!20037 tp_is_empty!1423)))

(declare-fun b!31371 () Bool)

(declare-fun res!18996 () Bool)

(assert (=> b!31371 (=> (not res!18996) (not e!20041))))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!31371 (= res!18996 (validKeyInArray!0 k0!1304))))

(declare-fun b!31372 () Bool)

(declare-fun res!18999 () Bool)

(assert (=> b!31372 (=> (not res!18999) (not e!20041))))

(declare-fun extraKeys!1422 () (_ BitVec 32))

(assert (=> b!31372 (= res!18999 (and (= (size!1073 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1074 _keys!1833) (size!1073 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!31373 () Bool)

(assert (=> b!31373 (= e!20041 false)))

(declare-fun defaultEntry!1504 () Int)

(declare-fun lt!11560 () Bool)

(declare-fun zeroValue!1443 () V!1723)

(declare-fun minValue!1443 () V!1723)

(declare-datatypes ((tuple2!1210 0))(
  ( (tuple2!1211 (_1!616 (_ BitVec 64)) (_2!616 V!1723)) )
))
(declare-datatypes ((List!793 0))(
  ( (Nil!790) (Cons!789 (h!1356 tuple2!1210) (t!3479 List!793)) )
))
(declare-datatypes ((ListLongMap!775 0))(
  ( (ListLongMap!776 (toList!403 List!793)) )
))
(declare-fun contains!344 (ListLongMap!775 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!226 (array!2039 array!2037 (_ BitVec 32) (_ BitVec 32) V!1723 V!1723 (_ BitVec 32) Int) ListLongMap!775)

(assert (=> b!31373 (= lt!11560 (contains!344 (getCurrentListMap!226 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k0!1304))))

(declare-fun b!31374 () Bool)

(declare-fun res!18997 () Bool)

(assert (=> b!31374 (=> (not res!18997) (not e!20041))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2039 (_ BitVec 32)) Bool)

(assert (=> b!31374 (= res!18997 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(assert (= (and start!4154 res!18998) b!31372))

(assert (= (and b!31372 res!18999) b!31374))

(assert (= (and b!31374 res!18997) b!31368))

(assert (= (and b!31368 res!19000) b!31371))

(assert (= (and b!31371 res!18996) b!31373))

(assert (= (and b!31369 condMapEmpty!1663) mapIsEmpty!1663))

(assert (= (and b!31369 (not condMapEmpty!1663)) mapNonEmpty!1663))

(get-info :version)

(assert (= (and mapNonEmpty!1663 ((_ is ValueCellFull!512) mapValue!1663)) b!31370))

(assert (= (and b!31369 ((_ is ValueCellFull!512) mapDefault!1663)) b!31367))

(assert (= start!4154 b!31369))

(declare-fun m!25137 () Bool)

(assert (=> mapNonEmpty!1663 m!25137))

(declare-fun m!25139 () Bool)

(assert (=> start!4154 m!25139))

(declare-fun m!25141 () Bool)

(assert (=> start!4154 m!25141))

(declare-fun m!25143 () Bool)

(assert (=> start!4154 m!25143))

(declare-fun m!25145 () Bool)

(assert (=> b!31374 m!25145))

(declare-fun m!25147 () Bool)

(assert (=> b!31368 m!25147))

(declare-fun m!25149 () Bool)

(assert (=> b!31373 m!25149))

(assert (=> b!31373 m!25149))

(declare-fun m!25151 () Bool)

(assert (=> b!31373 m!25151))

(declare-fun m!25153 () Bool)

(assert (=> b!31371 m!25153))

(check-sat (not start!4154) (not b!31368) (not b!31374) b_and!1873 (not b!31371) (not mapNonEmpty!1663) (not b_next!1069) (not b!31373) tp_is_empty!1423)
(check-sat b_and!1873 (not b_next!1069))
