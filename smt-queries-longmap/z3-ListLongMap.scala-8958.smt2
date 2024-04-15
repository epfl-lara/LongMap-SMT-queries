; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108474 () Bool)

(assert start!108474)

(declare-fun b_free!28021 () Bool)

(declare-fun b_next!28021 () Bool)

(assert (=> start!108474 (= b_free!28021 (not b_next!28021))))

(declare-fun tp!99173 () Bool)

(declare-fun b_and!46063 () Bool)

(assert (=> start!108474 (= tp!99173 b_and!46063)))

(declare-fun b!1280201 () Bool)

(declare-fun res!850399 () Bool)

(declare-fun e!731496 () Bool)

(assert (=> b!1280201 (=> (not res!850399) (not e!731496))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((V!49985 0))(
  ( (V!49986 (val!16905 Int)) )
))
(declare-datatypes ((ValueCell!15932 0))(
  ( (ValueCellFull!15932 (v!19504 V!49985)) (EmptyCell!15932) )
))
(declare-datatypes ((array!84293 0))(
  ( (array!84294 (arr!40651 (Array (_ BitVec 32) ValueCell!15932)) (size!41203 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84293)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!84295 0))(
  ( (array!84296 (arr!40652 (Array (_ BitVec 32) (_ BitVec 64))) (size!41204 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84295)

(assert (=> b!1280201 (= res!850399 (and (= (size!41203 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41204 _keys!1741) (size!41203 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1280202 () Bool)

(declare-fun e!731494 () Bool)

(declare-fun tp_is_empty!33661 () Bool)

(assert (=> b!1280202 (= e!731494 tp_is_empty!33661)))

(declare-fun mapNonEmpty!52043 () Bool)

(declare-fun mapRes!52043 () Bool)

(declare-fun tp!99174 () Bool)

(assert (=> mapNonEmpty!52043 (= mapRes!52043 (and tp!99174 e!731494))))

(declare-fun mapRest!52043 () (Array (_ BitVec 32) ValueCell!15932))

(declare-fun mapValue!52043 () ValueCell!15932)

(declare-fun mapKey!52043 () (_ BitVec 32))

(assert (=> mapNonEmpty!52043 (= (arr!40651 _values!1445) (store mapRest!52043 mapKey!52043 mapValue!52043))))

(declare-fun b!1280203 () Bool)

(declare-fun e!731495 () Bool)

(assert (=> b!1280203 (= e!731495 tp_is_empty!33661)))

(declare-fun b!1280204 () Bool)

(declare-fun res!850400 () Bool)

(assert (=> b!1280204 (=> (not res!850400) (not e!731496))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84295 (_ BitVec 32)) Bool)

(assert (=> b!1280204 (= res!850400 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1280205 () Bool)

(assert (=> b!1280205 (= e!731496 false)))

(declare-fun minValue!1387 () V!49985)

(declare-fun zeroValue!1387 () V!49985)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun lt!575926 () Bool)

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!21706 0))(
  ( (tuple2!21707 (_1!10864 (_ BitVec 64)) (_2!10864 V!49985)) )
))
(declare-datatypes ((List!28898 0))(
  ( (Nil!28895) (Cons!28894 (h!30103 tuple2!21706) (t!42430 List!28898)) )
))
(declare-datatypes ((ListLongMap!19363 0))(
  ( (ListLongMap!19364 (toList!9697 List!28898)) )
))
(declare-fun contains!7742 (ListLongMap!19363 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4671 (array!84295 array!84293 (_ BitVec 32) (_ BitVec 32) V!49985 V!49985 (_ BitVec 32) Int) ListLongMap!19363)

(assert (=> b!1280205 (= lt!575926 (contains!7742 (getCurrentListMap!4671 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1280206 () Bool)

(declare-fun e!731492 () Bool)

(assert (=> b!1280206 (= e!731492 (and e!731495 mapRes!52043))))

(declare-fun condMapEmpty!52043 () Bool)

(declare-fun mapDefault!52043 () ValueCell!15932)

(assert (=> b!1280206 (= condMapEmpty!52043 (= (arr!40651 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!15932)) mapDefault!52043)))))

(declare-fun b!1280207 () Bool)

(declare-fun res!850402 () Bool)

(assert (=> b!1280207 (=> (not res!850402) (not e!731496))))

(declare-datatypes ((List!28899 0))(
  ( (Nil!28896) (Cons!28895 (h!30104 (_ BitVec 64)) (t!42431 List!28899)) )
))
(declare-fun arrayNoDuplicates!0 (array!84295 (_ BitVec 32) List!28899) Bool)

(assert (=> b!1280207 (= res!850402 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28896))))

(declare-fun b!1280208 () Bool)

(declare-fun res!850403 () Bool)

(assert (=> b!1280208 (=> (not res!850403) (not e!731496))))

(assert (=> b!1280208 (= res!850403 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41204 _keys!1741))))))

(declare-fun mapIsEmpty!52043 () Bool)

(assert (=> mapIsEmpty!52043 mapRes!52043))

(declare-fun res!850401 () Bool)

(assert (=> start!108474 (=> (not res!850401) (not e!731496))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108474 (= res!850401 (validMask!0 mask!2175))))

(assert (=> start!108474 e!731496))

(assert (=> start!108474 tp_is_empty!33661))

(assert (=> start!108474 true))

(declare-fun array_inv!31021 (array!84293) Bool)

(assert (=> start!108474 (and (array_inv!31021 _values!1445) e!731492)))

(declare-fun array_inv!31022 (array!84295) Bool)

(assert (=> start!108474 (array_inv!31022 _keys!1741)))

(assert (=> start!108474 tp!99173))

(assert (= (and start!108474 res!850401) b!1280201))

(assert (= (and b!1280201 res!850399) b!1280204))

(assert (= (and b!1280204 res!850400) b!1280207))

(assert (= (and b!1280207 res!850402) b!1280208))

(assert (= (and b!1280208 res!850403) b!1280205))

(assert (= (and b!1280206 condMapEmpty!52043) mapIsEmpty!52043))

(assert (= (and b!1280206 (not condMapEmpty!52043)) mapNonEmpty!52043))

(get-info :version)

(assert (= (and mapNonEmpty!52043 ((_ is ValueCellFull!15932) mapValue!52043)) b!1280202))

(assert (= (and b!1280206 ((_ is ValueCellFull!15932) mapDefault!52043)) b!1280203))

(assert (= start!108474 b!1280206))

(declare-fun m!1174449 () Bool)

(assert (=> b!1280204 m!1174449))

(declare-fun m!1174451 () Bool)

(assert (=> b!1280205 m!1174451))

(assert (=> b!1280205 m!1174451))

(declare-fun m!1174453 () Bool)

(assert (=> b!1280205 m!1174453))

(declare-fun m!1174455 () Bool)

(assert (=> start!108474 m!1174455))

(declare-fun m!1174457 () Bool)

(assert (=> start!108474 m!1174457))

(declare-fun m!1174459 () Bool)

(assert (=> start!108474 m!1174459))

(declare-fun m!1174461 () Bool)

(assert (=> b!1280207 m!1174461))

(declare-fun m!1174463 () Bool)

(assert (=> mapNonEmpty!52043 m!1174463))

(check-sat b_and!46063 (not b_next!28021) (not mapNonEmpty!52043) (not b!1280204) (not b!1280207) (not b!1280205) tp_is_empty!33661 (not start!108474))
(check-sat b_and!46063 (not b_next!28021))
