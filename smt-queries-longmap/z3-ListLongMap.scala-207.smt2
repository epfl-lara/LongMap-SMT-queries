; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3920 () Bool)

(assert start!3920)

(declare-fun b_free!829 () Bool)

(declare-fun b_next!829 () Bool)

(assert (=> start!3920 (= b_free!829 (not b_next!829))))

(declare-fun tp!3907 () Bool)

(declare-fun b_and!1629 () Bool)

(assert (=> start!3920 (= tp!3907 b_and!1629)))

(declare-fun b!27744 () Bool)

(declare-fun res!16466 () Bool)

(declare-fun e!18016 () Bool)

(assert (=> b!27744 (=> (not res!16466) (not e!18016))))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!27744 (= res!16466 (validKeyInArray!0 k0!1304))))

(declare-fun b!27745 () Bool)

(declare-fun res!16465 () Bool)

(assert (=> b!27745 (=> (not res!16465) (not e!18016))))

(declare-fun defaultEntry!1504 () Int)

(declare-datatypes ((V!1403 0))(
  ( (V!1404 (val!618 Int)) )
))
(declare-datatypes ((ValueCell!392 0))(
  ( (ValueCellFull!392 (v!1707 V!1403)) (EmptyCell!392) )
))
(declare-datatypes ((array!1587 0))(
  ( (array!1588 (arr!747 (Array (_ BitVec 32) ValueCell!392)) (size!848 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1587)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-datatypes ((array!1589 0))(
  ( (array!1590 (arr!748 (Array (_ BitVec 32) (_ BitVec 64))) (size!849 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1589)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun zeroValue!1443 () V!1403)

(declare-fun minValue!1443 () V!1403)

(declare-datatypes ((tuple2!1034 0))(
  ( (tuple2!1035 (_1!528 (_ BitVec 64)) (_2!528 V!1403)) )
))
(declare-datatypes ((List!627 0))(
  ( (Nil!624) (Cons!623 (h!1190 tuple2!1034) (t!3314 List!627)) )
))
(declare-datatypes ((ListLongMap!605 0))(
  ( (ListLongMap!606 (toList!318 List!627)) )
))
(declare-fun contains!260 (ListLongMap!605 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!148 (array!1589 array!1587 (_ BitVec 32) (_ BitVec 32) V!1403 V!1403 (_ BitVec 32) Int) ListLongMap!605)

(assert (=> b!27745 (= res!16465 (not (contains!260 (getCurrentListMap!148 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k0!1304)))))

(declare-fun mapIsEmpty!1303 () Bool)

(declare-fun mapRes!1303 () Bool)

(assert (=> mapIsEmpty!1303 mapRes!1303))

(declare-fun res!16469 () Bool)

(assert (=> start!3920 (=> (not res!16469) (not e!18016))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!3920 (= res!16469 (validMask!0 mask!2294))))

(assert (=> start!3920 e!18016))

(assert (=> start!3920 true))

(assert (=> start!3920 tp!3907))

(declare-fun e!18015 () Bool)

(declare-fun array_inv!521 (array!1587) Bool)

(assert (=> start!3920 (and (array_inv!521 _values!1501) e!18015)))

(declare-fun array_inv!522 (array!1589) Bool)

(assert (=> start!3920 (array_inv!522 _keys!1833)))

(declare-fun tp_is_empty!1183 () Bool)

(assert (=> start!3920 tp_is_empty!1183))

(declare-fun b!27746 () Bool)

(declare-fun e!18012 () Bool)

(assert (=> b!27746 (= e!18012 tp_is_empty!1183)))

(declare-fun b!27747 () Bool)

(declare-fun res!16463 () Bool)

(assert (=> b!27747 (=> (not res!16463) (not e!18016))))

(declare-fun arrayContainsKey!0 (array!1589 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!27747 (= res!16463 (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun b!27748 () Bool)

(declare-fun res!16468 () Bool)

(assert (=> b!27748 (=> (not res!16468) (not e!18016))))

(declare-datatypes ((List!628 0))(
  ( (Nil!625) (Cons!624 (h!1191 (_ BitVec 64)) (t!3315 List!628)) )
))
(declare-fun arrayNoDuplicates!0 (array!1589 (_ BitVec 32) List!628) Bool)

(assert (=> b!27748 (= res!16468 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!625))))

(declare-fun b!27749 () Bool)

(declare-fun e!18014 () Bool)

(assert (=> b!27749 (= e!18015 (and e!18014 mapRes!1303))))

(declare-fun condMapEmpty!1303 () Bool)

(declare-fun mapDefault!1303 () ValueCell!392)

(assert (=> b!27749 (= condMapEmpty!1303 (= (arr!747 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!392)) mapDefault!1303)))))

(declare-fun b!27750 () Bool)

(declare-fun res!16464 () Bool)

(assert (=> b!27750 (=> (not res!16464) (not e!18016))))

(assert (=> b!27750 (= res!16464 (and (= (size!848 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!849 _keys!1833) (size!848 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!27751 () Bool)

(declare-fun res!16467 () Bool)

(assert (=> b!27751 (=> (not res!16467) (not e!18016))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1589 (_ BitVec 32)) Bool)

(assert (=> b!27751 (= res!16467 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!27752 () Bool)

(assert (=> b!27752 (= e!18014 tp_is_empty!1183)))

(declare-fun b!27753 () Bool)

(assert (=> b!27753 (= e!18016 false)))

(declare-fun lt!10674 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!1589 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!27753 (= lt!10674 (arrayScanForKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun mapNonEmpty!1303 () Bool)

(declare-fun tp!3906 () Bool)

(assert (=> mapNonEmpty!1303 (= mapRes!1303 (and tp!3906 e!18012))))

(declare-fun mapRest!1303 () (Array (_ BitVec 32) ValueCell!392))

(declare-fun mapValue!1303 () ValueCell!392)

(declare-fun mapKey!1303 () (_ BitVec 32))

(assert (=> mapNonEmpty!1303 (= (arr!747 _values!1501) (store mapRest!1303 mapKey!1303 mapValue!1303))))

(assert (= (and start!3920 res!16469) b!27750))

(assert (= (and b!27750 res!16464) b!27751))

(assert (= (and b!27751 res!16467) b!27748))

(assert (= (and b!27748 res!16468) b!27744))

(assert (= (and b!27744 res!16466) b!27745))

(assert (= (and b!27745 res!16465) b!27747))

(assert (= (and b!27747 res!16463) b!27753))

(assert (= (and b!27749 condMapEmpty!1303) mapIsEmpty!1303))

(assert (= (and b!27749 (not condMapEmpty!1303)) mapNonEmpty!1303))

(get-info :version)

(assert (= (and mapNonEmpty!1303 ((_ is ValueCellFull!392) mapValue!1303)) b!27746))

(assert (= (and b!27749 ((_ is ValueCellFull!392) mapDefault!1303)) b!27752))

(assert (= start!3920 b!27749))

(declare-fun m!22019 () Bool)

(assert (=> b!27753 m!22019))

(declare-fun m!22021 () Bool)

(assert (=> b!27744 m!22021))

(declare-fun m!22023 () Bool)

(assert (=> start!3920 m!22023))

(declare-fun m!22025 () Bool)

(assert (=> start!3920 m!22025))

(declare-fun m!22027 () Bool)

(assert (=> start!3920 m!22027))

(declare-fun m!22029 () Bool)

(assert (=> b!27747 m!22029))

(declare-fun m!22031 () Bool)

(assert (=> b!27745 m!22031))

(assert (=> b!27745 m!22031))

(declare-fun m!22033 () Bool)

(assert (=> b!27745 m!22033))

(declare-fun m!22035 () Bool)

(assert (=> mapNonEmpty!1303 m!22035))

(declare-fun m!22037 () Bool)

(assert (=> b!27751 m!22037))

(declare-fun m!22039 () Bool)

(assert (=> b!27748 m!22039))

(check-sat (not b!27745) (not start!3920) (not b!27751) b_and!1629 tp_is_empty!1183 (not b!27744) (not b_next!829) (not b!27748) (not b!27753) (not b!27747) (not mapNonEmpty!1303))
(check-sat b_and!1629 (not b_next!829))
