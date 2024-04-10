; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113446 () Bool)

(assert start!113446)

(declare-fun b_free!31497 () Bool)

(declare-fun b_next!31497 () Bool)

(assert (=> start!113446 (= b_free!31497 (not b_next!31497))))

(declare-fun tp!110295 () Bool)

(declare-fun b_and!50785 () Bool)

(assert (=> start!113446 (= tp!110295 b_and!50785)))

(declare-fun res!893620 () Bool)

(declare-fun e!766285 () Bool)

(assert (=> start!113446 (=> (not res!893620) (not e!766285))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113446 (= res!893620 (validMask!0 mask!1977))))

(assert (=> start!113446 e!766285))

(declare-fun tp_is_empty!37497 () Bool)

(assert (=> start!113446 tp_is_empty!37497))

(assert (=> start!113446 true))

(declare-datatypes ((array!91826 0))(
  ( (array!91827 (arr!44369 (Array (_ BitVec 32) (_ BitVec 64))) (size!44919 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91826)

(declare-fun array_inv!33425 (array!91826) Bool)

(assert (=> start!113446 (array_inv!33425 _keys!1571)))

(declare-datatypes ((V!55099 0))(
  ( (V!55100 (val!18823 Int)) )
))
(declare-datatypes ((ValueCell!17850 0))(
  ( (ValueCellFull!17850 (v!21471 V!55099)) (EmptyCell!17850) )
))
(declare-datatypes ((array!91828 0))(
  ( (array!91829 (arr!44370 (Array (_ BitVec 32) ValueCell!17850)) (size!44920 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91828)

(declare-fun e!766288 () Bool)

(declare-fun array_inv!33426 (array!91828) Bool)

(assert (=> start!113446 (and (array_inv!33426 _values!1303) e!766288)))

(assert (=> start!113446 tp!110295))

(declare-fun b!1346733 () Bool)

(declare-fun res!893622 () Bool)

(assert (=> b!1346733 (=> (not res!893622) (not e!766285))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91826 (_ BitVec 32)) Bool)

(assert (=> b!1346733 (= res!893622 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1346734 () Bool)

(declare-fun res!893619 () Bool)

(assert (=> b!1346734 (=> (not res!893619) (not e!766285))))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun from!1960 () (_ BitVec 32))

(declare-fun k0!1142 () (_ BitVec 64))

(assert (=> b!1346734 (= res!893619 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44919 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1346735 () Bool)

(declare-fun e!766286 () Bool)

(assert (=> b!1346735 (= e!766286 tp_is_empty!37497)))

(declare-fun b!1346736 () Bool)

(assert (=> b!1346736 (= e!766285 false)))

(declare-fun minValue!1245 () V!55099)

(declare-fun zeroValue!1245 () V!55099)

(declare-fun defaultEntry!1306 () Int)

(declare-fun lt!595539 () Bool)

(declare-datatypes ((tuple2!24260 0))(
  ( (tuple2!24261 (_1!12141 (_ BitVec 64)) (_2!12141 V!55099)) )
))
(declare-datatypes ((List!31417 0))(
  ( (Nil!31414) (Cons!31413 (h!32622 tuple2!24260) (t!46007 List!31417)) )
))
(declare-datatypes ((ListLongMap!21917 0))(
  ( (ListLongMap!21918 (toList!10974 List!31417)) )
))
(declare-fun contains!9150 (ListLongMap!21917 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5926 (array!91826 array!91828 (_ BitVec 32) (_ BitVec 32) V!55099 V!55099 (_ BitVec 32) Int) ListLongMap!21917)

(assert (=> b!1346736 (= lt!595539 (contains!9150 (getCurrentListMap!5926 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun b!1346737 () Bool)

(declare-fun res!893618 () Bool)

(assert (=> b!1346737 (=> (not res!893618) (not e!766285))))

(declare-datatypes ((List!31418 0))(
  ( (Nil!31415) (Cons!31414 (h!32623 (_ BitVec 64)) (t!46008 List!31418)) )
))
(declare-fun arrayNoDuplicates!0 (array!91826 (_ BitVec 32) List!31418) Bool)

(assert (=> b!1346737 (= res!893618 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31415))))

(declare-fun b!1346738 () Bool)

(declare-fun res!893621 () Bool)

(assert (=> b!1346738 (=> (not res!893621) (not e!766285))))

(assert (=> b!1346738 (= res!893621 (and (= (size!44920 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44919 _keys!1571) (size!44920 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1346739 () Bool)

(declare-fun e!766289 () Bool)

(assert (=> b!1346739 (= e!766289 tp_is_empty!37497)))

(declare-fun mapIsEmpty!57952 () Bool)

(declare-fun mapRes!57952 () Bool)

(assert (=> mapIsEmpty!57952 mapRes!57952))

(declare-fun mapNonEmpty!57952 () Bool)

(declare-fun tp!110296 () Bool)

(assert (=> mapNonEmpty!57952 (= mapRes!57952 (and tp!110296 e!766286))))

(declare-fun mapKey!57952 () (_ BitVec 32))

(declare-fun mapValue!57952 () ValueCell!17850)

(declare-fun mapRest!57952 () (Array (_ BitVec 32) ValueCell!17850))

(assert (=> mapNonEmpty!57952 (= (arr!44370 _values!1303) (store mapRest!57952 mapKey!57952 mapValue!57952))))

(declare-fun b!1346740 () Bool)

(assert (=> b!1346740 (= e!766288 (and e!766289 mapRes!57952))))

(declare-fun condMapEmpty!57952 () Bool)

(declare-fun mapDefault!57952 () ValueCell!17850)

(assert (=> b!1346740 (= condMapEmpty!57952 (= (arr!44370 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17850)) mapDefault!57952)))))

(assert (= (and start!113446 res!893620) b!1346738))

(assert (= (and b!1346738 res!893621) b!1346733))

(assert (= (and b!1346733 res!893622) b!1346737))

(assert (= (and b!1346737 res!893618) b!1346734))

(assert (= (and b!1346734 res!893619) b!1346736))

(assert (= (and b!1346740 condMapEmpty!57952) mapIsEmpty!57952))

(assert (= (and b!1346740 (not condMapEmpty!57952)) mapNonEmpty!57952))

(get-info :version)

(assert (= (and mapNonEmpty!57952 ((_ is ValueCellFull!17850) mapValue!57952)) b!1346735))

(assert (= (and b!1346740 ((_ is ValueCellFull!17850) mapDefault!57952)) b!1346739))

(assert (= start!113446 b!1346740))

(declare-fun m!1233779 () Bool)

(assert (=> mapNonEmpty!57952 m!1233779))

(declare-fun m!1233781 () Bool)

(assert (=> start!113446 m!1233781))

(declare-fun m!1233783 () Bool)

(assert (=> start!113446 m!1233783))

(declare-fun m!1233785 () Bool)

(assert (=> start!113446 m!1233785))

(declare-fun m!1233787 () Bool)

(assert (=> b!1346737 m!1233787))

(declare-fun m!1233789 () Bool)

(assert (=> b!1346733 m!1233789))

(declare-fun m!1233791 () Bool)

(assert (=> b!1346736 m!1233791))

(assert (=> b!1346736 m!1233791))

(declare-fun m!1233793 () Bool)

(assert (=> b!1346736 m!1233793))

(check-sat b_and!50785 tp_is_empty!37497 (not b!1346737) (not start!113446) (not mapNonEmpty!57952) (not b!1346736) (not b!1346733) (not b_next!31497))
(check-sat b_and!50785 (not b_next!31497))
