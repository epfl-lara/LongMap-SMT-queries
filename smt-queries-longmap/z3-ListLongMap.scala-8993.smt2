; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108718 () Bool)

(assert start!108718)

(declare-fun b_free!28231 () Bool)

(declare-fun b_next!28231 () Bool)

(assert (=> start!108718 (= b_free!28231 (not b_next!28231))))

(declare-fun tp!99810 () Bool)

(declare-fun b_and!46279 () Bool)

(assert (=> start!108718 (= tp!99810 b_and!46279)))

(declare-fun b!1283532 () Bool)

(declare-fun res!852644 () Bool)

(declare-fun e!733264 () Bool)

(assert (=> b!1283532 (=> (not res!852644) (not e!733264))))

(declare-datatypes ((V!50265 0))(
  ( (V!50266 (val!17010 Int)) )
))
(declare-fun minValue!1387 () V!50265)

(declare-fun zeroValue!1387 () V!50265)

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((ValueCell!16037 0))(
  ( (ValueCellFull!16037 (v!19611 V!50265)) (EmptyCell!16037) )
))
(declare-datatypes ((array!84703 0))(
  ( (array!84704 (arr!40854 (Array (_ BitVec 32) ValueCell!16037)) (size!41406 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84703)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((array!84705 0))(
  ( (array!84706 (arr!40855 (Array (_ BitVec 32) (_ BitVec 64))) (size!41407 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84705)

(declare-datatypes ((tuple2!21856 0))(
  ( (tuple2!21857 (_1!10939 (_ BitVec 64)) (_2!10939 V!50265)) )
))
(declare-datatypes ((List!29042 0))(
  ( (Nil!29039) (Cons!29038 (h!30247 tuple2!21856) (t!42578 List!29042)) )
))
(declare-datatypes ((ListLongMap!19513 0))(
  ( (ListLongMap!19514 (toList!9772 List!29042)) )
))
(declare-fun contains!7819 (ListLongMap!19513 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4744 (array!84705 array!84703 (_ BitVec 32) (_ BitVec 32) V!50265 V!50265 (_ BitVec 32) Int) ListLongMap!19513)

(assert (=> b!1283532 (= res!852644 (contains!7819 (getCurrentListMap!4744 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1283533 () Bool)

(declare-fun res!852639 () Bool)

(assert (=> b!1283533 (=> (not res!852639) (not e!733264))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1283533 (= res!852639 (validKeyInArray!0 (select (arr!40855 _keys!1741) from!2144)))))

(declare-fun b!1283534 () Bool)

(declare-fun res!852643 () Bool)

(assert (=> b!1283534 (=> (not res!852643) (not e!733264))))

(assert (=> b!1283534 (= res!852643 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41407 _keys!1741))))))

(declare-fun mapNonEmpty!52364 () Bool)

(declare-fun mapRes!52364 () Bool)

(declare-fun tp!99809 () Bool)

(declare-fun e!733262 () Bool)

(assert (=> mapNonEmpty!52364 (= mapRes!52364 (and tp!99809 e!733262))))

(declare-fun mapValue!52364 () ValueCell!16037)

(declare-fun mapRest!52364 () (Array (_ BitVec 32) ValueCell!16037))

(declare-fun mapKey!52364 () (_ BitVec 32))

(assert (=> mapNonEmpty!52364 (= (arr!40854 _values!1445) (store mapRest!52364 mapKey!52364 mapValue!52364))))

(declare-fun b!1283535 () Bool)

(declare-fun res!852642 () Bool)

(assert (=> b!1283535 (=> (not res!852642) (not e!733264))))

(assert (=> b!1283535 (= res!852642 (and (= (size!41406 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41407 _keys!1741) (size!41406 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1283536 () Bool)

(declare-fun res!852645 () Bool)

(assert (=> b!1283536 (=> (not res!852645) (not e!733264))))

(declare-datatypes ((List!29043 0))(
  ( (Nil!29040) (Cons!29039 (h!30248 (_ BitVec 64)) (t!42579 List!29043)) )
))
(declare-fun arrayNoDuplicates!0 (array!84705 (_ BitVec 32) List!29043) Bool)

(assert (=> b!1283536 (= res!852645 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29040))))

(declare-fun b!1283537 () Bool)

(declare-fun res!852641 () Bool)

(assert (=> b!1283537 (=> (not res!852641) (not e!733264))))

(assert (=> b!1283537 (= res!852641 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41407 _keys!1741))))))

(declare-fun b!1283538 () Bool)

(declare-fun e!733263 () Bool)

(declare-fun e!733266 () Bool)

(assert (=> b!1283538 (= e!733263 (and e!733266 mapRes!52364))))

(declare-fun condMapEmpty!52364 () Bool)

(declare-fun mapDefault!52364 () ValueCell!16037)

(assert (=> b!1283538 (= condMapEmpty!52364 (= (arr!40854 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16037)) mapDefault!52364)))))

(declare-fun b!1283539 () Bool)

(declare-fun tp_is_empty!33871 () Bool)

(assert (=> b!1283539 (= e!733266 tp_is_empty!33871)))

(declare-fun res!852637 () Bool)

(assert (=> start!108718 (=> (not res!852637) (not e!733264))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108718 (= res!852637 (validMask!0 mask!2175))))

(assert (=> start!108718 e!733264))

(assert (=> start!108718 tp_is_empty!33871))

(assert (=> start!108718 true))

(declare-fun array_inv!31149 (array!84703) Bool)

(assert (=> start!108718 (and (array_inv!31149 _values!1445) e!733263)))

(declare-fun array_inv!31150 (array!84705) Bool)

(assert (=> start!108718 (array_inv!31150 _keys!1741)))

(assert (=> start!108718 tp!99810))

(declare-fun b!1283540 () Bool)

(declare-fun res!852638 () Bool)

(assert (=> b!1283540 (=> (not res!852638) (not e!733264))))

(assert (=> b!1283540 (= res!852638 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!52364 () Bool)

(assert (=> mapIsEmpty!52364 mapRes!52364))

(declare-fun b!1283541 () Bool)

(assert (=> b!1283541 (= e!733264 (not true))))

(declare-fun lt!576503 () ListLongMap!19513)

(assert (=> b!1283541 (contains!7819 lt!576503 k0!1205)))

(declare-datatypes ((Unit!42329 0))(
  ( (Unit!42330) )
))
(declare-fun lt!576504 () Unit!42329)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!15 ((_ BitVec 64) (_ BitVec 64) V!50265 ListLongMap!19513) Unit!42329)

(assert (=> b!1283541 (= lt!576504 (lemmaInListMapAfterAddingDiffThenInBefore!15 k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 lt!576503))))

(declare-fun +!4330 (ListLongMap!19513 tuple2!21856) ListLongMap!19513)

(declare-fun getCurrentListMapNoExtraKeys!5961 (array!84705 array!84703 (_ BitVec 32) (_ BitVec 32) V!50265 V!50265 (_ BitVec 32) Int) ListLongMap!19513)

(assert (=> b!1283541 (= lt!576503 (+!4330 (getCurrentListMapNoExtraKeys!5961 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) (tuple2!21857 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(declare-fun b!1283542 () Bool)

(assert (=> b!1283542 (= e!733262 tp_is_empty!33871)))

(declare-fun b!1283543 () Bool)

(declare-fun res!852640 () Bool)

(assert (=> b!1283543 (=> (not res!852640) (not e!733264))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84705 (_ BitVec 32)) Bool)

(assert (=> b!1283543 (= res!852640 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(assert (= (and start!108718 res!852637) b!1283535))

(assert (= (and b!1283535 res!852642) b!1283543))

(assert (= (and b!1283543 res!852640) b!1283536))

(assert (= (and b!1283536 res!852645) b!1283537))

(assert (= (and b!1283537 res!852641) b!1283532))

(assert (= (and b!1283532 res!852644) b!1283534))

(assert (= (and b!1283534 res!852643) b!1283533))

(assert (= (and b!1283533 res!852639) b!1283540))

(assert (= (and b!1283540 res!852638) b!1283541))

(assert (= (and b!1283538 condMapEmpty!52364) mapIsEmpty!52364))

(assert (= (and b!1283538 (not condMapEmpty!52364)) mapNonEmpty!52364))

(get-info :version)

(assert (= (and mapNonEmpty!52364 ((_ is ValueCellFull!16037) mapValue!52364)) b!1283542))

(assert (= (and b!1283538 ((_ is ValueCellFull!16037) mapDefault!52364)) b!1283539))

(assert (= start!108718 b!1283538))

(declare-fun m!1176985 () Bool)

(assert (=> b!1283536 m!1176985))

(declare-fun m!1176987 () Bool)

(assert (=> b!1283543 m!1176987))

(declare-fun m!1176989 () Bool)

(assert (=> mapNonEmpty!52364 m!1176989))

(declare-fun m!1176991 () Bool)

(assert (=> b!1283541 m!1176991))

(declare-fun m!1176993 () Bool)

(assert (=> b!1283541 m!1176993))

(declare-fun m!1176995 () Bool)

(assert (=> b!1283541 m!1176995))

(assert (=> b!1283541 m!1176995))

(declare-fun m!1176997 () Bool)

(assert (=> b!1283541 m!1176997))

(declare-fun m!1176999 () Bool)

(assert (=> b!1283533 m!1176999))

(assert (=> b!1283533 m!1176999))

(declare-fun m!1177001 () Bool)

(assert (=> b!1283533 m!1177001))

(declare-fun m!1177003 () Bool)

(assert (=> start!108718 m!1177003))

(declare-fun m!1177005 () Bool)

(assert (=> start!108718 m!1177005))

(declare-fun m!1177007 () Bool)

(assert (=> start!108718 m!1177007))

(declare-fun m!1177009 () Bool)

(assert (=> b!1283532 m!1177009))

(assert (=> b!1283532 m!1177009))

(declare-fun m!1177011 () Bool)

(assert (=> b!1283532 m!1177011))

(check-sat tp_is_empty!33871 (not b!1283533) (not start!108718) (not mapNonEmpty!52364) (not b!1283543) (not b!1283536) (not b!1283541) (not b_next!28231) (not b!1283532) b_and!46279)
(check-sat b_and!46279 (not b_next!28231))
