; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108720 () Bool)

(assert start!108720)

(declare-fun b_free!28233 () Bool)

(declare-fun b_next!28233 () Bool)

(assert (=> start!108720 (= b_free!28233 (not b_next!28233))))

(declare-fun tp!99815 () Bool)

(declare-fun b_and!46299 () Bool)

(assert (=> start!108720 (= tp!99815 b_and!46299)))

(declare-fun b!1283632 () Bool)

(declare-fun res!852694 () Bool)

(declare-fun e!733310 () Bool)

(assert (=> b!1283632 (=> (not res!852694) (not e!733310))))

(declare-datatypes ((array!84808 0))(
  ( (array!84809 (arr!40906 (Array (_ BitVec 32) (_ BitVec 64))) (size!41456 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84808)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1283632 (= res!852694 (validKeyInArray!0 (select (arr!40906 _keys!1741) from!2144)))))

(declare-fun b!1283633 () Bool)

(declare-fun res!852696 () Bool)

(assert (=> b!1283633 (=> (not res!852696) (not e!733310))))

(declare-fun k0!1205 () (_ BitVec 64))

(assert (=> b!1283633 (= res!852696 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41456 _keys!1741))))))

(declare-fun b!1283634 () Bool)

(declare-fun e!733307 () Bool)

(declare-fun tp_is_empty!33873 () Bool)

(assert (=> b!1283634 (= e!733307 tp_is_empty!33873)))

(declare-fun b!1283635 () Bool)

(declare-fun res!852691 () Bool)

(assert (=> b!1283635 (=> (not res!852691) (not e!733310))))

(declare-datatypes ((List!28982 0))(
  ( (Nil!28979) (Cons!28978 (h!30187 (_ BitVec 64)) (t!42526 List!28982)) )
))
(declare-fun arrayNoDuplicates!0 (array!84808 (_ BitVec 32) List!28982) Bool)

(assert (=> b!1283635 (= res!852691 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28979))))

(declare-fun b!1283636 () Bool)

(declare-fun res!852693 () Bool)

(assert (=> b!1283636 (=> (not res!852693) (not e!733310))))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1283636 (= res!852693 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1283637 () Bool)

(assert (=> b!1283637 (= e!733310 (not true))))

(declare-datatypes ((V!50267 0))(
  ( (V!50268 (val!17011 Int)) )
))
(declare-datatypes ((tuple2!21786 0))(
  ( (tuple2!21787 (_1!10904 (_ BitVec 64)) (_2!10904 V!50267)) )
))
(declare-datatypes ((List!28983 0))(
  ( (Nil!28980) (Cons!28979 (h!30188 tuple2!21786) (t!42527 List!28983)) )
))
(declare-datatypes ((ListLongMap!19443 0))(
  ( (ListLongMap!19444 (toList!9737 List!28983)) )
))
(declare-fun lt!576688 () ListLongMap!19443)

(declare-fun contains!7854 (ListLongMap!19443 (_ BitVec 64)) Bool)

(assert (=> b!1283637 (contains!7854 lt!576688 k0!1205)))

(declare-fun minValue!1387 () V!50267)

(declare-datatypes ((Unit!42483 0))(
  ( (Unit!42484) )
))
(declare-fun lt!576687 () Unit!42483)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!12 ((_ BitVec 64) (_ BitVec 64) V!50267 ListLongMap!19443) Unit!42483)

(assert (=> b!1283637 (= lt!576687 (lemmaInListMapAfterAddingDiffThenInBefore!12 k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 lt!576688))))

(declare-fun zeroValue!1387 () V!50267)

(declare-datatypes ((ValueCell!16038 0))(
  ( (ValueCellFull!16038 (v!19613 V!50267)) (EmptyCell!16038) )
))
(declare-datatypes ((array!84810 0))(
  ( (array!84811 (arr!40907 (Array (_ BitVec 32) ValueCell!16038)) (size!41457 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84810)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun +!4288 (ListLongMap!19443 tuple2!21786) ListLongMap!19443)

(declare-fun getCurrentListMapNoExtraKeys!5918 (array!84808 array!84810 (_ BitVec 32) (_ BitVec 32) V!50267 V!50267 (_ BitVec 32) Int) ListLongMap!19443)

(assert (=> b!1283637 (= lt!576688 (+!4288 (getCurrentListMapNoExtraKeys!5918 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) (tuple2!21787 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(declare-fun b!1283638 () Bool)

(declare-fun res!852695 () Bool)

(assert (=> b!1283638 (=> (not res!852695) (not e!733310))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84808 (_ BitVec 32)) Bool)

(assert (=> b!1283638 (= res!852695 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1283639 () Bool)

(declare-fun res!852699 () Bool)

(assert (=> b!1283639 (=> (not res!852699) (not e!733310))))

(declare-fun getCurrentListMap!4818 (array!84808 array!84810 (_ BitVec 32) (_ BitVec 32) V!50267 V!50267 (_ BitVec 32) Int) ListLongMap!19443)

(assert (=> b!1283639 (= res!852699 (contains!7854 (getCurrentListMap!4818 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1283640 () Bool)

(declare-fun res!852697 () Bool)

(assert (=> b!1283640 (=> (not res!852697) (not e!733310))))

(assert (=> b!1283640 (= res!852697 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41456 _keys!1741))))))

(declare-fun b!1283641 () Bool)

(declare-fun e!733309 () Bool)

(assert (=> b!1283641 (= e!733309 tp_is_empty!33873)))

(declare-fun mapNonEmpty!52367 () Bool)

(declare-fun mapRes!52367 () Bool)

(declare-fun tp!99814 () Bool)

(assert (=> mapNonEmpty!52367 (= mapRes!52367 (and tp!99814 e!733309))))

(declare-fun mapValue!52367 () ValueCell!16038)

(declare-fun mapRest!52367 () (Array (_ BitVec 32) ValueCell!16038))

(declare-fun mapKey!52367 () (_ BitVec 32))

(assert (=> mapNonEmpty!52367 (= (arr!40907 _values!1445) (store mapRest!52367 mapKey!52367 mapValue!52367))))

(declare-fun res!852692 () Bool)

(assert (=> start!108720 (=> (not res!852692) (not e!733310))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108720 (= res!852692 (validMask!0 mask!2175))))

(assert (=> start!108720 e!733310))

(assert (=> start!108720 tp_is_empty!33873))

(assert (=> start!108720 true))

(declare-fun e!733306 () Bool)

(declare-fun array_inv!31027 (array!84810) Bool)

(assert (=> start!108720 (and (array_inv!31027 _values!1445) e!733306)))

(declare-fun array_inv!31028 (array!84808) Bool)

(assert (=> start!108720 (array_inv!31028 _keys!1741)))

(assert (=> start!108720 tp!99815))

(declare-fun b!1283642 () Bool)

(declare-fun res!852698 () Bool)

(assert (=> b!1283642 (=> (not res!852698) (not e!733310))))

(assert (=> b!1283642 (= res!852698 (and (= (size!41457 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41456 _keys!1741) (size!41457 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1283643 () Bool)

(assert (=> b!1283643 (= e!733306 (and e!733307 mapRes!52367))))

(declare-fun condMapEmpty!52367 () Bool)

(declare-fun mapDefault!52367 () ValueCell!16038)

(assert (=> b!1283643 (= condMapEmpty!52367 (= (arr!40907 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16038)) mapDefault!52367)))))

(declare-fun mapIsEmpty!52367 () Bool)

(assert (=> mapIsEmpty!52367 mapRes!52367))

(assert (= (and start!108720 res!852692) b!1283642))

(assert (= (and b!1283642 res!852698) b!1283638))

(assert (= (and b!1283638 res!852695) b!1283635))

(assert (= (and b!1283635 res!852691) b!1283640))

(assert (= (and b!1283640 res!852697) b!1283639))

(assert (= (and b!1283639 res!852699) b!1283633))

(assert (= (and b!1283633 res!852696) b!1283632))

(assert (= (and b!1283632 res!852694) b!1283636))

(assert (= (and b!1283636 res!852693) b!1283637))

(assert (= (and b!1283643 condMapEmpty!52367) mapIsEmpty!52367))

(assert (= (and b!1283643 (not condMapEmpty!52367)) mapNonEmpty!52367))

(get-info :version)

(assert (= (and mapNonEmpty!52367 ((_ is ValueCellFull!16038) mapValue!52367)) b!1283641))

(assert (= (and b!1283643 ((_ is ValueCellFull!16038) mapDefault!52367)) b!1283634))

(assert (= start!108720 b!1283643))

(declare-fun m!1177513 () Bool)

(assert (=> b!1283638 m!1177513))

(declare-fun m!1177515 () Bool)

(assert (=> b!1283639 m!1177515))

(assert (=> b!1283639 m!1177515))

(declare-fun m!1177517 () Bool)

(assert (=> b!1283639 m!1177517))

(declare-fun m!1177519 () Bool)

(assert (=> b!1283632 m!1177519))

(assert (=> b!1283632 m!1177519))

(declare-fun m!1177521 () Bool)

(assert (=> b!1283632 m!1177521))

(declare-fun m!1177523 () Bool)

(assert (=> mapNonEmpty!52367 m!1177523))

(declare-fun m!1177525 () Bool)

(assert (=> b!1283637 m!1177525))

(declare-fun m!1177527 () Bool)

(assert (=> b!1283637 m!1177527))

(declare-fun m!1177529 () Bool)

(assert (=> b!1283637 m!1177529))

(assert (=> b!1283637 m!1177529))

(declare-fun m!1177531 () Bool)

(assert (=> b!1283637 m!1177531))

(declare-fun m!1177533 () Bool)

(assert (=> b!1283635 m!1177533))

(declare-fun m!1177535 () Bool)

(assert (=> start!108720 m!1177535))

(declare-fun m!1177537 () Bool)

(assert (=> start!108720 m!1177537))

(declare-fun m!1177539 () Bool)

(assert (=> start!108720 m!1177539))

(check-sat (not b!1283637) b_and!46299 (not b!1283639) (not start!108720) (not b!1283635) (not mapNonEmpty!52367) (not b!1283638) (not b!1283632) tp_is_empty!33873 (not b_next!28233))
(check-sat b_and!46299 (not b_next!28233))
