; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3914 () Bool)

(assert start!3914)

(declare-fun b_free!829 () Bool)

(declare-fun b_next!829 () Bool)

(assert (=> start!3914 (= b_free!829 (not b_next!829))))

(declare-fun tp!3906 () Bool)

(declare-fun b_and!1633 () Bool)

(assert (=> start!3914 (= tp!3906 b_and!1633)))

(declare-fun b!27762 () Bool)

(declare-fun res!16471 () Bool)

(declare-fun e!18024 () Bool)

(assert (=> b!27762 (=> (not res!16471) (not e!18024))))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun defaultEntry!1504 () Int)

(declare-datatypes ((V!1403 0))(
  ( (V!1404 (val!618 Int)) )
))
(declare-datatypes ((ValueCell!392 0))(
  ( (ValueCellFull!392 (v!1706 V!1403)) (EmptyCell!392) )
))
(declare-datatypes ((array!1581 0))(
  ( (array!1582 (arr!744 (Array (_ BitVec 32) ValueCell!392)) (size!845 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1581)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-datatypes ((array!1583 0))(
  ( (array!1584 (arr!745 (Array (_ BitVec 32) (_ BitVec 64))) (size!846 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1583)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun zeroValue!1443 () V!1403)

(declare-fun minValue!1443 () V!1403)

(declare-datatypes ((tuple2!1044 0))(
  ( (tuple2!1045 (_1!533 (_ BitVec 64)) (_2!533 V!1403)) )
))
(declare-datatypes ((List!631 0))(
  ( (Nil!628) (Cons!627 (h!1194 tuple2!1044) (t!3317 List!631)) )
))
(declare-datatypes ((ListLongMap!609 0))(
  ( (ListLongMap!610 (toList!320 List!631)) )
))
(declare-fun contains!261 (ListLongMap!609 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!150 (array!1583 array!1581 (_ BitVec 32) (_ BitVec 32) V!1403 V!1403 (_ BitVec 32) Int) ListLongMap!609)

(assert (=> b!27762 (= res!16471 (not (contains!261 (getCurrentListMap!150 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k0!1304)))))

(declare-fun b!27763 () Bool)

(declare-fun e!18021 () Bool)

(declare-fun tp_is_empty!1183 () Bool)

(assert (=> b!27763 (= e!18021 tp_is_empty!1183)))

(declare-fun b!27764 () Bool)

(declare-fun e!18022 () Bool)

(declare-fun e!18025 () Bool)

(declare-fun mapRes!1303 () Bool)

(assert (=> b!27764 (= e!18022 (and e!18025 mapRes!1303))))

(declare-fun condMapEmpty!1303 () Bool)

(declare-fun mapDefault!1303 () ValueCell!392)

(assert (=> b!27764 (= condMapEmpty!1303 (= (arr!744 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!392)) mapDefault!1303)))))

(declare-fun mapNonEmpty!1303 () Bool)

(declare-fun tp!3907 () Bool)

(assert (=> mapNonEmpty!1303 (= mapRes!1303 (and tp!3907 e!18021))))

(declare-fun mapKey!1303 () (_ BitVec 32))

(declare-fun mapRest!1303 () (Array (_ BitVec 32) ValueCell!392))

(declare-fun mapValue!1303 () ValueCell!392)

(assert (=> mapNonEmpty!1303 (= (arr!744 _values!1501) (store mapRest!1303 mapKey!1303 mapValue!1303))))

(declare-fun b!27765 () Bool)

(declare-fun res!16472 () Bool)

(assert (=> b!27765 (=> (not res!16472) (not e!18024))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1583 (_ BitVec 32)) Bool)

(assert (=> b!27765 (= res!16472 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!27766 () Bool)

(assert (=> b!27766 (= e!18025 tp_is_empty!1183)))

(declare-fun mapIsEmpty!1303 () Bool)

(assert (=> mapIsEmpty!1303 mapRes!1303))

(declare-fun b!27767 () Bool)

(declare-fun res!16476 () Bool)

(assert (=> b!27767 (=> (not res!16476) (not e!18024))))

(assert (=> b!27767 (= res!16476 (and (= (size!845 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!846 _keys!1833) (size!845 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!27768 () Bool)

(declare-fun res!16473 () Bool)

(assert (=> b!27768 (=> (not res!16473) (not e!18024))))

(declare-datatypes ((List!632 0))(
  ( (Nil!629) (Cons!628 (h!1195 (_ BitVec 64)) (t!3318 List!632)) )
))
(declare-fun arrayNoDuplicates!0 (array!1583 (_ BitVec 32) List!632) Bool)

(assert (=> b!27768 (= res!16473 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!629))))

(declare-fun res!16474 () Bool)

(assert (=> start!3914 (=> (not res!16474) (not e!18024))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!3914 (= res!16474 (validMask!0 mask!2294))))

(assert (=> start!3914 e!18024))

(assert (=> start!3914 true))

(assert (=> start!3914 tp!3906))

(declare-fun array_inv!527 (array!1581) Bool)

(assert (=> start!3914 (and (array_inv!527 _values!1501) e!18022)))

(declare-fun array_inv!528 (array!1583) Bool)

(assert (=> start!3914 (array_inv!528 _keys!1833)))

(assert (=> start!3914 tp_is_empty!1183))

(declare-fun b!27769 () Bool)

(declare-fun res!16477 () Bool)

(assert (=> b!27769 (=> (not res!16477) (not e!18024))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!27769 (= res!16477 (validKeyInArray!0 k0!1304))))

(declare-fun b!27770 () Bool)

(declare-fun res!16475 () Bool)

(assert (=> b!27770 (=> (not res!16475) (not e!18024))))

(declare-fun arrayContainsKey!0 (array!1583 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!27770 (= res!16475 (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun b!27771 () Bool)

(assert (=> b!27771 (= e!18024 false)))

(declare-fun lt!10714 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!1583 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!27771 (= lt!10714 (arrayScanForKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(assert (= (and start!3914 res!16474) b!27767))

(assert (= (and b!27767 res!16476) b!27765))

(assert (= (and b!27765 res!16472) b!27768))

(assert (= (and b!27768 res!16473) b!27769))

(assert (= (and b!27769 res!16477) b!27762))

(assert (= (and b!27762 res!16471) b!27770))

(assert (= (and b!27770 res!16475) b!27771))

(assert (= (and b!27764 condMapEmpty!1303) mapIsEmpty!1303))

(assert (= (and b!27764 (not condMapEmpty!1303)) mapNonEmpty!1303))

(get-info :version)

(assert (= (and mapNonEmpty!1303 ((_ is ValueCellFull!392) mapValue!1303)) b!27763))

(assert (= (and b!27764 ((_ is ValueCellFull!392) mapDefault!1303)) b!27766))

(assert (= start!3914 b!27764))

(declare-fun m!22101 () Bool)

(assert (=> b!27771 m!22101))

(declare-fun m!22103 () Bool)

(assert (=> start!3914 m!22103))

(declare-fun m!22105 () Bool)

(assert (=> start!3914 m!22105))

(declare-fun m!22107 () Bool)

(assert (=> start!3914 m!22107))

(declare-fun m!22109 () Bool)

(assert (=> b!27768 m!22109))

(declare-fun m!22111 () Bool)

(assert (=> b!27770 m!22111))

(declare-fun m!22113 () Bool)

(assert (=> b!27765 m!22113))

(declare-fun m!22115 () Bool)

(assert (=> b!27762 m!22115))

(assert (=> b!27762 m!22115))

(declare-fun m!22117 () Bool)

(assert (=> b!27762 m!22117))

(declare-fun m!22119 () Bool)

(assert (=> b!27769 m!22119))

(declare-fun m!22121 () Bool)

(assert (=> mapNonEmpty!1303 m!22121))

(check-sat (not b!27771) (not b!27765) (not mapNonEmpty!1303) (not start!3914) (not b!27768) (not b!27769) b_and!1633 (not b!27770) (not b_next!829) (not b!27762) tp_is_empty!1183)
(check-sat b_and!1633 (not b_next!829))
