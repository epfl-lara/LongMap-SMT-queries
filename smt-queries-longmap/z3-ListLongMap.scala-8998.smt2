; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108972 () Bool)

(assert start!108972)

(declare-fun b_free!28261 () Bool)

(declare-fun b_next!28261 () Bool)

(assert (=> start!108972 (= b_free!28261 (not b_next!28261))))

(declare-fun tp!99898 () Bool)

(declare-fun b_and!46329 () Bool)

(assert (=> start!108972 (= tp!99898 b_and!46329)))

(declare-fun b!1285441 () Bool)

(declare-fun e!734367 () Bool)

(declare-fun tp_is_empty!33901 () Bool)

(assert (=> b!1285441 (= e!734367 tp_is_empty!33901)))

(declare-fun b!1285442 () Bool)

(declare-fun e!734363 () Bool)

(assert (=> b!1285442 (= e!734363 tp_is_empty!33901)))

(declare-fun b!1285443 () Bool)

(declare-fun res!853593 () Bool)

(declare-fun e!734364 () Bool)

(assert (=> b!1285443 (=> (not res!853593) (not e!734364))))

(declare-datatypes ((array!84891 0))(
  ( (array!84892 (arr!40943 (Array (_ BitVec 32) (_ BitVec 64))) (size!41494 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84891)

(declare-datatypes ((List!29036 0))(
  ( (Nil!29033) (Cons!29032 (h!30250 (_ BitVec 64)) (t!42572 List!29036)) )
))
(declare-fun arrayNoDuplicates!0 (array!84891 (_ BitVec 32) List!29036) Bool)

(assert (=> b!1285443 (= res!853593 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29033))))

(declare-fun b!1285444 () Bool)

(declare-fun res!853592 () Bool)

(assert (=> b!1285444 (=> (not res!853592) (not e!734364))))

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1285444 (= res!853592 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41494 _keys!1741))))))

(declare-fun res!853591 () Bool)

(assert (=> start!108972 (=> (not res!853591) (not e!734364))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108972 (= res!853591 (validMask!0 mask!2175))))

(assert (=> start!108972 e!734364))

(assert (=> start!108972 tp_is_empty!33901))

(assert (=> start!108972 true))

(declare-datatypes ((V!50305 0))(
  ( (V!50306 (val!17025 Int)) )
))
(declare-datatypes ((ValueCell!16052 0))(
  ( (ValueCellFull!16052 (v!19622 V!50305)) (EmptyCell!16052) )
))
(declare-datatypes ((array!84893 0))(
  ( (array!84894 (arr!40944 (Array (_ BitVec 32) ValueCell!16052)) (size!41495 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84893)

(declare-fun e!734365 () Bool)

(declare-fun array_inv!31267 (array!84893) Bool)

(assert (=> start!108972 (and (array_inv!31267 _values!1445) e!734365)))

(declare-fun array_inv!31268 (array!84891) Bool)

(assert (=> start!108972 (array_inv!31268 _keys!1741)))

(assert (=> start!108972 tp!99898))

(declare-fun b!1285445 () Bool)

(declare-fun res!853596 () Bool)

(assert (=> b!1285445 (=> (not res!853596) (not e!734364))))

(declare-fun minValue!1387 () V!50305)

(declare-fun zeroValue!1387 () V!50305)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!21830 0))(
  ( (tuple2!21831 (_1!10926 (_ BitVec 64)) (_2!10926 V!50305)) )
))
(declare-datatypes ((List!29037 0))(
  ( (Nil!29034) (Cons!29033 (h!30251 tuple2!21830) (t!42573 List!29037)) )
))
(declare-datatypes ((ListLongMap!19495 0))(
  ( (ListLongMap!19496 (toList!9763 List!29037)) )
))
(declare-fun contains!7894 (ListLongMap!19495 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4828 (array!84891 array!84893 (_ BitVec 32) (_ BitVec 32) V!50305 V!50305 (_ BitVec 32) Int) ListLongMap!19495)

(assert (=> b!1285445 (= res!853596 (contains!7894 (getCurrentListMap!4828 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun mapNonEmpty!52409 () Bool)

(declare-fun mapRes!52409 () Bool)

(declare-fun tp!99899 () Bool)

(assert (=> mapNonEmpty!52409 (= mapRes!52409 (and tp!99899 e!734367))))

(declare-fun mapValue!52409 () ValueCell!16052)

(declare-fun mapRest!52409 () (Array (_ BitVec 32) ValueCell!16052))

(declare-fun mapKey!52409 () (_ BitVec 32))

(assert (=> mapNonEmpty!52409 (= (arr!40944 _values!1445) (store mapRest!52409 mapKey!52409 mapValue!52409))))

(declare-fun b!1285446 () Bool)

(declare-fun res!853597 () Bool)

(assert (=> b!1285446 (=> (not res!853597) (not e!734364))))

(assert (=> b!1285446 (= res!853597 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41494 _keys!1741))))))

(declare-fun b!1285447 () Bool)

(declare-fun res!853589 () Bool)

(assert (=> b!1285447 (=> (not res!853589) (not e!734364))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84891 (_ BitVec 32)) Bool)

(assert (=> b!1285447 (= res!853589 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1285448 () Bool)

(assert (=> b!1285448 (= e!734365 (and e!734363 mapRes!52409))))

(declare-fun condMapEmpty!52409 () Bool)

(declare-fun mapDefault!52409 () ValueCell!16052)

(assert (=> b!1285448 (= condMapEmpty!52409 (= (arr!40944 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16052)) mapDefault!52409)))))

(declare-fun b!1285449 () Bool)

(assert (=> b!1285449 (= e!734364 (not true))))

(declare-fun lt!577255 () ListLongMap!19495)

(assert (=> b!1285449 (contains!7894 lt!577255 k0!1205)))

(declare-datatypes ((Unit!42462 0))(
  ( (Unit!42463) )
))
(declare-fun lt!577256 () Unit!42462)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!21 ((_ BitVec 64) (_ BitVec 64) V!50305 ListLongMap!19495) Unit!42462)

(assert (=> b!1285449 (= lt!577256 (lemmaInListMapAfterAddingDiffThenInBefore!21 k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 lt!577255))))

(declare-fun +!4346 (ListLongMap!19495 tuple2!21830) ListLongMap!19495)

(declare-fun getCurrentListMapNoExtraKeys!5978 (array!84891 array!84893 (_ BitVec 32) (_ BitVec 32) V!50305 V!50305 (_ BitVec 32) Int) ListLongMap!19495)

(assert (=> b!1285449 (= lt!577255 (+!4346 (getCurrentListMapNoExtraKeys!5978 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) (tuple2!21831 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(declare-fun b!1285450 () Bool)

(declare-fun res!853590 () Bool)

(assert (=> b!1285450 (=> (not res!853590) (not e!734364))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1285450 (= res!853590 (validKeyInArray!0 (select (arr!40943 _keys!1741) from!2144)))))

(declare-fun b!1285451 () Bool)

(declare-fun res!853594 () Bool)

(assert (=> b!1285451 (=> (not res!853594) (not e!734364))))

(assert (=> b!1285451 (= res!853594 (and (= (size!41495 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41494 _keys!1741) (size!41495 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!52409 () Bool)

(assert (=> mapIsEmpty!52409 mapRes!52409))

(declare-fun b!1285452 () Bool)

(declare-fun res!853595 () Bool)

(assert (=> b!1285452 (=> (not res!853595) (not e!734364))))

(assert (=> b!1285452 (= res!853595 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and start!108972 res!853591) b!1285451))

(assert (= (and b!1285451 res!853594) b!1285447))

(assert (= (and b!1285447 res!853589) b!1285443))

(assert (= (and b!1285443 res!853593) b!1285444))

(assert (= (and b!1285444 res!853592) b!1285445))

(assert (= (and b!1285445 res!853596) b!1285446))

(assert (= (and b!1285446 res!853597) b!1285450))

(assert (= (and b!1285450 res!853590) b!1285452))

(assert (= (and b!1285452 res!853595) b!1285449))

(assert (= (and b!1285448 condMapEmpty!52409) mapIsEmpty!52409))

(assert (= (and b!1285448 (not condMapEmpty!52409)) mapNonEmpty!52409))

(get-info :version)

(assert (= (and mapNonEmpty!52409 ((_ is ValueCellFull!16052) mapValue!52409)) b!1285441))

(assert (= (and b!1285448 ((_ is ValueCellFull!16052) mapDefault!52409)) b!1285442))

(assert (= start!108972 b!1285448))

(declare-fun m!1179517 () Bool)

(assert (=> b!1285443 m!1179517))

(declare-fun m!1179519 () Bool)

(assert (=> b!1285445 m!1179519))

(assert (=> b!1285445 m!1179519))

(declare-fun m!1179521 () Bool)

(assert (=> b!1285445 m!1179521))

(declare-fun m!1179523 () Bool)

(assert (=> b!1285447 m!1179523))

(declare-fun m!1179525 () Bool)

(assert (=> b!1285450 m!1179525))

(assert (=> b!1285450 m!1179525))

(declare-fun m!1179527 () Bool)

(assert (=> b!1285450 m!1179527))

(declare-fun m!1179529 () Bool)

(assert (=> start!108972 m!1179529))

(declare-fun m!1179531 () Bool)

(assert (=> start!108972 m!1179531))

(declare-fun m!1179533 () Bool)

(assert (=> start!108972 m!1179533))

(declare-fun m!1179535 () Bool)

(assert (=> b!1285449 m!1179535))

(declare-fun m!1179537 () Bool)

(assert (=> b!1285449 m!1179537))

(declare-fun m!1179539 () Bool)

(assert (=> b!1285449 m!1179539))

(assert (=> b!1285449 m!1179539))

(declare-fun m!1179541 () Bool)

(assert (=> b!1285449 m!1179541))

(declare-fun m!1179543 () Bool)

(assert (=> mapNonEmpty!52409 m!1179543))

(check-sat (not b!1285447) (not b!1285450) (not b!1285449) b_and!46329 (not start!108972) (not b_next!28261) (not b!1285445) (not b!1285443) tp_is_empty!33901 (not mapNonEmpty!52409))
(check-sat b_and!46329 (not b_next!28261))
