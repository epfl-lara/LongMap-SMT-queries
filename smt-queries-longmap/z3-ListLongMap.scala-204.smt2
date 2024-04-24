; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3902 () Bool)

(assert start!3902)

(declare-fun b_free!811 () Bool)

(declare-fun b_next!811 () Bool)

(assert (=> start!3902 (= b_free!811 (not b_next!811))))

(declare-fun tp!3852 () Bool)

(declare-fun b_and!1611 () Bool)

(assert (=> start!3902 (= tp!3852 b_and!1611)))

(declare-fun b!27474 () Bool)

(declare-fun res!16275 () Bool)

(declare-fun e!17880 () Bool)

(assert (=> b!27474 (=> (not res!16275) (not e!17880))))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!27474 (= res!16275 (validKeyInArray!0 k0!1304))))

(declare-fun b!27475 () Bool)

(declare-fun res!16278 () Bool)

(assert (=> b!27475 (=> (not res!16278) (not e!17880))))

(declare-datatypes ((array!1553 0))(
  ( (array!1554 (arr!730 (Array (_ BitVec 32) (_ BitVec 64))) (size!831 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1553)

(declare-datatypes ((List!614 0))(
  ( (Nil!611) (Cons!610 (h!1177 (_ BitVec 64)) (t!3301 List!614)) )
))
(declare-fun arrayNoDuplicates!0 (array!1553 (_ BitVec 32) List!614) Bool)

(assert (=> b!27475 (= res!16278 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!611))))

(declare-fun mapIsEmpty!1276 () Bool)

(declare-fun mapRes!1276 () Bool)

(assert (=> mapIsEmpty!1276 mapRes!1276))

(declare-fun b!27476 () Bool)

(declare-fun e!17881 () Bool)

(declare-fun tp_is_empty!1165 () Bool)

(assert (=> b!27476 (= e!17881 tp_is_empty!1165)))

(declare-fun b!27477 () Bool)

(declare-fun e!17878 () Bool)

(assert (=> b!27477 (= e!17878 (and e!17881 mapRes!1276))))

(declare-fun condMapEmpty!1276 () Bool)

(declare-datatypes ((V!1379 0))(
  ( (V!1380 (val!609 Int)) )
))
(declare-datatypes ((ValueCell!383 0))(
  ( (ValueCellFull!383 (v!1698 V!1379)) (EmptyCell!383) )
))
(declare-datatypes ((array!1555 0))(
  ( (array!1556 (arr!731 (Array (_ BitVec 32) ValueCell!383)) (size!832 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1555)

(declare-fun mapDefault!1276 () ValueCell!383)

(assert (=> b!27477 (= condMapEmpty!1276 (= (arr!731 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!383)) mapDefault!1276)))))

(declare-fun b!27478 () Bool)

(declare-fun res!16277 () Bool)

(assert (=> b!27478 (=> (not res!16277) (not e!17880))))

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-fun mask!2294 () (_ BitVec 32))

(assert (=> b!27478 (= res!16277 (and (= (size!832 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!831 _keys!1833) (size!832 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!27479 () Bool)

(declare-fun res!16274 () Bool)

(assert (=> b!27479 (=> (not res!16274) (not e!17880))))

(declare-fun defaultEntry!1504 () Int)

(declare-fun zeroValue!1443 () V!1379)

(declare-fun minValue!1443 () V!1379)

(declare-datatypes ((tuple2!1020 0))(
  ( (tuple2!1021 (_1!521 (_ BitVec 64)) (_2!521 V!1379)) )
))
(declare-datatypes ((List!615 0))(
  ( (Nil!612) (Cons!611 (h!1178 tuple2!1020) (t!3302 List!615)) )
))
(declare-datatypes ((ListLongMap!591 0))(
  ( (ListLongMap!592 (toList!311 List!615)) )
))
(declare-fun contains!253 (ListLongMap!591 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!141 (array!1553 array!1555 (_ BitVec 32) (_ BitVec 32) V!1379 V!1379 (_ BitVec 32) Int) ListLongMap!591)

(assert (=> b!27479 (= res!16274 (not (contains!253 (getCurrentListMap!141 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k0!1304)))))

(declare-fun b!27480 () Bool)

(assert (=> b!27480 (= e!17880 false)))

(declare-fun lt!10647 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!1553 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!27480 (= lt!10647 (arrayScanForKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun res!16280 () Bool)

(assert (=> start!3902 (=> (not res!16280) (not e!17880))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!3902 (= res!16280 (validMask!0 mask!2294))))

(assert (=> start!3902 e!17880))

(assert (=> start!3902 true))

(assert (=> start!3902 tp!3852))

(declare-fun array_inv!511 (array!1555) Bool)

(assert (=> start!3902 (and (array_inv!511 _values!1501) e!17878)))

(declare-fun array_inv!512 (array!1553) Bool)

(assert (=> start!3902 (array_inv!512 _keys!1833)))

(assert (=> start!3902 tp_is_empty!1165))

(declare-fun b!27481 () Bool)

(declare-fun res!16279 () Bool)

(assert (=> b!27481 (=> (not res!16279) (not e!17880))))

(declare-fun arrayContainsKey!0 (array!1553 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!27481 (= res!16279 (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun b!27482 () Bool)

(declare-fun res!16276 () Bool)

(assert (=> b!27482 (=> (not res!16276) (not e!17880))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1553 (_ BitVec 32)) Bool)

(assert (=> b!27482 (= res!16276 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!27483 () Bool)

(declare-fun e!17879 () Bool)

(assert (=> b!27483 (= e!17879 tp_is_empty!1165)))

(declare-fun mapNonEmpty!1276 () Bool)

(declare-fun tp!3853 () Bool)

(assert (=> mapNonEmpty!1276 (= mapRes!1276 (and tp!3853 e!17879))))

(declare-fun mapRest!1276 () (Array (_ BitVec 32) ValueCell!383))

(declare-fun mapValue!1276 () ValueCell!383)

(declare-fun mapKey!1276 () (_ BitVec 32))

(assert (=> mapNonEmpty!1276 (= (arr!731 _values!1501) (store mapRest!1276 mapKey!1276 mapValue!1276))))

(assert (= (and start!3902 res!16280) b!27478))

(assert (= (and b!27478 res!16277) b!27482))

(assert (= (and b!27482 res!16276) b!27475))

(assert (= (and b!27475 res!16278) b!27474))

(assert (= (and b!27474 res!16275) b!27479))

(assert (= (and b!27479 res!16274) b!27481))

(assert (= (and b!27481 res!16279) b!27480))

(assert (= (and b!27477 condMapEmpty!1276) mapIsEmpty!1276))

(assert (= (and b!27477 (not condMapEmpty!1276)) mapNonEmpty!1276))

(get-info :version)

(assert (= (and mapNonEmpty!1276 ((_ is ValueCellFull!383) mapValue!1276)) b!27483))

(assert (= (and b!27477 ((_ is ValueCellFull!383) mapDefault!1276)) b!27476))

(assert (= start!3902 b!27477))

(declare-fun m!21821 () Bool)

(assert (=> mapNonEmpty!1276 m!21821))

(declare-fun m!21823 () Bool)

(assert (=> b!27479 m!21823))

(assert (=> b!27479 m!21823))

(declare-fun m!21825 () Bool)

(assert (=> b!27479 m!21825))

(declare-fun m!21827 () Bool)

(assert (=> b!27475 m!21827))

(declare-fun m!21829 () Bool)

(assert (=> b!27482 m!21829))

(declare-fun m!21831 () Bool)

(assert (=> b!27481 m!21831))

(declare-fun m!21833 () Bool)

(assert (=> b!27474 m!21833))

(declare-fun m!21835 () Bool)

(assert (=> b!27480 m!21835))

(declare-fun m!21837 () Bool)

(assert (=> start!3902 m!21837))

(declare-fun m!21839 () Bool)

(assert (=> start!3902 m!21839))

(declare-fun m!21841 () Bool)

(assert (=> start!3902 m!21841))

(check-sat (not b!27482) tp_is_empty!1165 (not b!27475) (not mapNonEmpty!1276) b_and!1611 (not b!27481) (not b!27474) (not b_next!811) (not b!27480) (not start!3902) (not b!27479))
(check-sat b_and!1611 (not b_next!811))
