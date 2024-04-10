; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108726 () Bool)

(assert start!108726)

(declare-fun b_free!28239 () Bool)

(declare-fun b_next!28239 () Bool)

(assert (=> start!108726 (= b_free!28239 (not b_next!28239))))

(declare-fun tp!99832 () Bool)

(declare-fun b_and!46305 () Bool)

(assert (=> start!108726 (= tp!99832 b_and!46305)))

(declare-fun b!1283740 () Bool)

(declare-fun res!852773 () Bool)

(declare-fun e!733355 () Bool)

(assert (=> b!1283740 (=> (not res!852773) (not e!733355))))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1283740 (= res!852773 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1283741 () Bool)

(declare-fun res!852776 () Bool)

(assert (=> b!1283741 (=> (not res!852776) (not e!733355))))

(declare-datatypes ((array!84820 0))(
  ( (array!84821 (arr!40912 (Array (_ BitVec 32) (_ BitVec 64))) (size!41462 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84820)

(declare-datatypes ((List!28986 0))(
  ( (Nil!28983) (Cons!28982 (h!30191 (_ BitVec 64)) (t!42530 List!28986)) )
))
(declare-fun arrayNoDuplicates!0 (array!84820 (_ BitVec 32) List!28986) Bool)

(assert (=> b!1283741 (= res!852776 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28983))))

(declare-fun res!852778 () Bool)

(assert (=> start!108726 (=> (not res!852778) (not e!733355))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108726 (= res!852778 (validMask!0 mask!2175))))

(assert (=> start!108726 e!733355))

(declare-fun tp_is_empty!33879 () Bool)

(assert (=> start!108726 tp_is_empty!33879))

(assert (=> start!108726 true))

(declare-datatypes ((V!50275 0))(
  ( (V!50276 (val!17014 Int)) )
))
(declare-datatypes ((ValueCell!16041 0))(
  ( (ValueCellFull!16041 (v!19616 V!50275)) (EmptyCell!16041) )
))
(declare-datatypes ((array!84822 0))(
  ( (array!84823 (arr!40913 (Array (_ BitVec 32) ValueCell!16041)) (size!41463 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84822)

(declare-fun e!733351 () Bool)

(declare-fun array_inv!31031 (array!84822) Bool)

(assert (=> start!108726 (and (array_inv!31031 _values!1445) e!733351)))

(declare-fun array_inv!31032 (array!84820) Bool)

(assert (=> start!108726 (array_inv!31032 _keys!1741)))

(assert (=> start!108726 tp!99832))

(declare-fun b!1283742 () Bool)

(declare-fun res!852777 () Bool)

(assert (=> b!1283742 (=> (not res!852777) (not e!733355))))

(assert (=> b!1283742 (= res!852777 (and (= (size!41463 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41462 _keys!1741) (size!41463 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1283743 () Bool)

(declare-fun res!852779 () Bool)

(assert (=> b!1283743 (=> (not res!852779) (not e!733355))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1283743 (= res!852779 (validKeyInArray!0 (select (arr!40912 _keys!1741) from!2144)))))

(declare-fun b!1283744 () Bool)

(declare-fun e!733354 () Bool)

(declare-fun mapRes!52376 () Bool)

(assert (=> b!1283744 (= e!733351 (and e!733354 mapRes!52376))))

(declare-fun condMapEmpty!52376 () Bool)

(declare-fun mapDefault!52376 () ValueCell!16041)

(assert (=> b!1283744 (= condMapEmpty!52376 (= (arr!40913 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16041)) mapDefault!52376)))))

(declare-fun b!1283745 () Bool)

(declare-fun res!852775 () Bool)

(assert (=> b!1283745 (=> (not res!852775) (not e!733355))))

(assert (=> b!1283745 (= res!852775 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41462 _keys!1741))))))

(declare-fun b!1283746 () Bool)

(declare-fun res!852774 () Bool)

(assert (=> b!1283746 (=> (not res!852774) (not e!733355))))

(declare-fun k0!1205 () (_ BitVec 64))

(assert (=> b!1283746 (= res!852774 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41462 _keys!1741))))))

(declare-fun b!1283747 () Bool)

(declare-fun res!852780 () Bool)

(assert (=> b!1283747 (=> (not res!852780) (not e!733355))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84820 (_ BitVec 32)) Bool)

(assert (=> b!1283747 (= res!852780 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun mapIsEmpty!52376 () Bool)

(assert (=> mapIsEmpty!52376 mapRes!52376))

(declare-fun b!1283748 () Bool)

(declare-fun e!733352 () Bool)

(assert (=> b!1283748 (= e!733352 tp_is_empty!33879)))

(declare-fun b!1283749 () Bool)

(declare-fun res!852772 () Bool)

(assert (=> b!1283749 (=> (not res!852772) (not e!733355))))

(declare-fun minValue!1387 () V!50275)

(declare-fun zeroValue!1387 () V!50275)

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!21790 0))(
  ( (tuple2!21791 (_1!10906 (_ BitVec 64)) (_2!10906 V!50275)) )
))
(declare-datatypes ((List!28987 0))(
  ( (Nil!28984) (Cons!28983 (h!30192 tuple2!21790) (t!42531 List!28987)) )
))
(declare-datatypes ((ListLongMap!19447 0))(
  ( (ListLongMap!19448 (toList!9739 List!28987)) )
))
(declare-fun contains!7856 (ListLongMap!19447 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4820 (array!84820 array!84822 (_ BitVec 32) (_ BitVec 32) V!50275 V!50275 (_ BitVec 32) Int) ListLongMap!19447)

(assert (=> b!1283749 (= res!852772 (contains!7856 (getCurrentListMap!4820 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1283750 () Bool)

(assert (=> b!1283750 (= e!733354 tp_is_empty!33879)))

(declare-fun b!1283751 () Bool)

(assert (=> b!1283751 (= e!733355 (not true))))

(declare-fun lt!576705 () ListLongMap!19447)

(assert (=> b!1283751 (contains!7856 lt!576705 k0!1205)))

(declare-datatypes ((Unit!42485 0))(
  ( (Unit!42486) )
))
(declare-fun lt!576706 () Unit!42485)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!13 ((_ BitVec 64) (_ BitVec 64) V!50275 ListLongMap!19447) Unit!42485)

(assert (=> b!1283751 (= lt!576706 (lemmaInListMapAfterAddingDiffThenInBefore!13 k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 lt!576705))))

(declare-fun +!4289 (ListLongMap!19447 tuple2!21790) ListLongMap!19447)

(declare-fun getCurrentListMapNoExtraKeys!5919 (array!84820 array!84822 (_ BitVec 32) (_ BitVec 32) V!50275 V!50275 (_ BitVec 32) Int) ListLongMap!19447)

(assert (=> b!1283751 (= lt!576705 (+!4289 (getCurrentListMapNoExtraKeys!5919 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) (tuple2!21791 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(declare-fun mapNonEmpty!52376 () Bool)

(declare-fun tp!99833 () Bool)

(assert (=> mapNonEmpty!52376 (= mapRes!52376 (and tp!99833 e!733352))))

(declare-fun mapKey!52376 () (_ BitVec 32))

(declare-fun mapValue!52376 () ValueCell!16041)

(declare-fun mapRest!52376 () (Array (_ BitVec 32) ValueCell!16041))

(assert (=> mapNonEmpty!52376 (= (arr!40913 _values!1445) (store mapRest!52376 mapKey!52376 mapValue!52376))))

(assert (= (and start!108726 res!852778) b!1283742))

(assert (= (and b!1283742 res!852777) b!1283747))

(assert (= (and b!1283747 res!852780) b!1283741))

(assert (= (and b!1283741 res!852776) b!1283745))

(assert (= (and b!1283745 res!852775) b!1283749))

(assert (= (and b!1283749 res!852772) b!1283746))

(assert (= (and b!1283746 res!852774) b!1283743))

(assert (= (and b!1283743 res!852779) b!1283740))

(assert (= (and b!1283740 res!852773) b!1283751))

(assert (= (and b!1283744 condMapEmpty!52376) mapIsEmpty!52376))

(assert (= (and b!1283744 (not condMapEmpty!52376)) mapNonEmpty!52376))

(get-info :version)

(assert (= (and mapNonEmpty!52376 ((_ is ValueCellFull!16041) mapValue!52376)) b!1283748))

(assert (= (and b!1283744 ((_ is ValueCellFull!16041) mapDefault!52376)) b!1283750))

(assert (= start!108726 b!1283744))

(declare-fun m!1177597 () Bool)

(assert (=> b!1283751 m!1177597))

(declare-fun m!1177599 () Bool)

(assert (=> b!1283751 m!1177599))

(declare-fun m!1177601 () Bool)

(assert (=> b!1283751 m!1177601))

(assert (=> b!1283751 m!1177601))

(declare-fun m!1177603 () Bool)

(assert (=> b!1283751 m!1177603))

(declare-fun m!1177605 () Bool)

(assert (=> b!1283749 m!1177605))

(assert (=> b!1283749 m!1177605))

(declare-fun m!1177607 () Bool)

(assert (=> b!1283749 m!1177607))

(declare-fun m!1177609 () Bool)

(assert (=> b!1283741 m!1177609))

(declare-fun m!1177611 () Bool)

(assert (=> b!1283747 m!1177611))

(declare-fun m!1177613 () Bool)

(assert (=> start!108726 m!1177613))

(declare-fun m!1177615 () Bool)

(assert (=> start!108726 m!1177615))

(declare-fun m!1177617 () Bool)

(assert (=> start!108726 m!1177617))

(declare-fun m!1177619 () Bool)

(assert (=> b!1283743 m!1177619))

(assert (=> b!1283743 m!1177619))

(declare-fun m!1177621 () Bool)

(assert (=> b!1283743 m!1177621))

(declare-fun m!1177623 () Bool)

(assert (=> mapNonEmpty!52376 m!1177623))

(check-sat (not b!1283749) (not b!1283747) (not b!1283741) (not start!108726) (not b!1283751) b_and!46305 (not mapNonEmpty!52376) (not b!1283743) tp_is_empty!33879 (not b_next!28239))
(check-sat b_and!46305 (not b_next!28239))
