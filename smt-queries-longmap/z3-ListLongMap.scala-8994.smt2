; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108724 () Bool)

(assert start!108724)

(declare-fun b_free!28237 () Bool)

(declare-fun b_next!28237 () Bool)

(assert (=> start!108724 (= b_free!28237 (not b_next!28237))))

(declare-fun tp!99827 () Bool)

(declare-fun b_and!46285 () Bool)

(assert (=> start!108724 (= tp!99827 b_and!46285)))

(declare-fun b!1283640 () Bool)

(declare-fun e!733309 () Bool)

(declare-fun tp_is_empty!33877 () Bool)

(assert (=> b!1283640 (= e!733309 tp_is_empty!33877)))

(declare-fun b!1283641 () Bool)

(declare-fun res!852721 () Bool)

(declare-fun e!733307 () Bool)

(assert (=> b!1283641 (=> (not res!852721) (not e!733307))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-datatypes ((array!84715 0))(
  ( (array!84716 (arr!40860 (Array (_ BitVec 32) (_ BitVec 64))) (size!41412 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84715)

(assert (=> b!1283641 (= res!852721 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41412 _keys!1741))))))

(declare-fun b!1283642 () Bool)

(declare-fun e!733310 () Bool)

(declare-fun e!733308 () Bool)

(declare-fun mapRes!52373 () Bool)

(assert (=> b!1283642 (= e!733310 (and e!733308 mapRes!52373))))

(declare-fun condMapEmpty!52373 () Bool)

(declare-datatypes ((V!50273 0))(
  ( (V!50274 (val!17013 Int)) )
))
(declare-datatypes ((ValueCell!16040 0))(
  ( (ValueCellFull!16040 (v!19614 V!50273)) (EmptyCell!16040) )
))
(declare-datatypes ((array!84717 0))(
  ( (array!84718 (arr!40861 (Array (_ BitVec 32) ValueCell!16040)) (size!41413 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84717)

(declare-fun mapDefault!52373 () ValueCell!16040)

(assert (=> b!1283642 (= condMapEmpty!52373 (= (arr!40861 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16040)) mapDefault!52373)))))

(declare-fun mapIsEmpty!52373 () Bool)

(assert (=> mapIsEmpty!52373 mapRes!52373))

(declare-fun b!1283643 () Bool)

(declare-fun res!852726 () Bool)

(assert (=> b!1283643 (=> (not res!852726) (not e!733307))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84715 (_ BitVec 32)) Bool)

(assert (=> b!1283643 (= res!852726 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1283644 () Bool)

(declare-fun res!852718 () Bool)

(assert (=> b!1283644 (=> (not res!852718) (not e!733307))))

(declare-datatypes ((List!29048 0))(
  ( (Nil!29045) (Cons!29044 (h!30253 (_ BitVec 64)) (t!42584 List!29048)) )
))
(declare-fun arrayNoDuplicates!0 (array!84715 (_ BitVec 32) List!29048) Bool)

(assert (=> b!1283644 (= res!852718 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29045))))

(declare-fun b!1283645 () Bool)

(declare-fun res!852719 () Bool)

(assert (=> b!1283645 (=> (not res!852719) (not e!733307))))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1283645 (= res!852719 (and (= (size!41413 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41412 _keys!1741) (size!41413 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1283646 () Bool)

(assert (=> b!1283646 (= e!733308 tp_is_empty!33877)))

(declare-fun res!852723 () Bool)

(assert (=> start!108724 (=> (not res!852723) (not e!733307))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108724 (= res!852723 (validMask!0 mask!2175))))

(assert (=> start!108724 e!733307))

(assert (=> start!108724 tp_is_empty!33877))

(assert (=> start!108724 true))

(declare-fun array_inv!31155 (array!84717) Bool)

(assert (=> start!108724 (and (array_inv!31155 _values!1445) e!733310)))

(declare-fun array_inv!31156 (array!84715) Bool)

(assert (=> start!108724 (array_inv!31156 _keys!1741)))

(assert (=> start!108724 tp!99827))

(declare-fun b!1283647 () Bool)

(declare-fun res!852722 () Bool)

(assert (=> b!1283647 (=> (not res!852722) (not e!733307))))

(assert (=> b!1283647 (= res!852722 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41412 _keys!1741))))))

(declare-fun b!1283648 () Bool)

(declare-fun res!852720 () Bool)

(assert (=> b!1283648 (=> (not res!852720) (not e!733307))))

(assert (=> b!1283648 (= res!852720 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1283649 () Bool)

(declare-fun res!852724 () Bool)

(assert (=> b!1283649 (=> (not res!852724) (not e!733307))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1283649 (= res!852724 (validKeyInArray!0 (select (arr!40860 _keys!1741) from!2144)))))

(declare-fun mapNonEmpty!52373 () Bool)

(declare-fun tp!99828 () Bool)

(assert (=> mapNonEmpty!52373 (= mapRes!52373 (and tp!99828 e!733309))))

(declare-fun mapRest!52373 () (Array (_ BitVec 32) ValueCell!16040))

(declare-fun mapValue!52373 () ValueCell!16040)

(declare-fun mapKey!52373 () (_ BitVec 32))

(assert (=> mapNonEmpty!52373 (= (arr!40861 _values!1445) (store mapRest!52373 mapKey!52373 mapValue!52373))))

(declare-fun b!1283650 () Bool)

(assert (=> b!1283650 (= e!733307 (not true))))

(declare-datatypes ((tuple2!21862 0))(
  ( (tuple2!21863 (_1!10942 (_ BitVec 64)) (_2!10942 V!50273)) )
))
(declare-datatypes ((List!29049 0))(
  ( (Nil!29046) (Cons!29045 (h!30254 tuple2!21862) (t!42585 List!29049)) )
))
(declare-datatypes ((ListLongMap!19519 0))(
  ( (ListLongMap!19520 (toList!9775 List!29049)) )
))
(declare-fun lt!576521 () ListLongMap!19519)

(declare-fun contains!7822 (ListLongMap!19519 (_ BitVec 64)) Bool)

(assert (=> b!1283650 (contains!7822 lt!576521 k0!1205)))

(declare-fun minValue!1387 () V!50273)

(declare-datatypes ((Unit!42335 0))(
  ( (Unit!42336) )
))
(declare-fun lt!576522 () Unit!42335)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!18 ((_ BitVec 64) (_ BitVec 64) V!50273 ListLongMap!19519) Unit!42335)

(assert (=> b!1283650 (= lt!576522 (lemmaInListMapAfterAddingDiffThenInBefore!18 k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 lt!576521))))

(declare-fun zeroValue!1387 () V!50273)

(declare-fun defaultEntry!1448 () Int)

(declare-fun +!4333 (ListLongMap!19519 tuple2!21862) ListLongMap!19519)

(declare-fun getCurrentListMapNoExtraKeys!5964 (array!84715 array!84717 (_ BitVec 32) (_ BitVec 32) V!50273 V!50273 (_ BitVec 32) Int) ListLongMap!19519)

(assert (=> b!1283650 (= lt!576521 (+!4333 (getCurrentListMapNoExtraKeys!5964 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) (tuple2!21863 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(declare-fun b!1283651 () Bool)

(declare-fun res!852725 () Bool)

(assert (=> b!1283651 (=> (not res!852725) (not e!733307))))

(declare-fun getCurrentListMap!4747 (array!84715 array!84717 (_ BitVec 32) (_ BitVec 32) V!50273 V!50273 (_ BitVec 32) Int) ListLongMap!19519)

(assert (=> b!1283651 (= res!852725 (contains!7822 (getCurrentListMap!4747 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(assert (= (and start!108724 res!852723) b!1283645))

(assert (= (and b!1283645 res!852719) b!1283643))

(assert (= (and b!1283643 res!852726) b!1283644))

(assert (= (and b!1283644 res!852718) b!1283647))

(assert (= (and b!1283647 res!852722) b!1283651))

(assert (= (and b!1283651 res!852725) b!1283641))

(assert (= (and b!1283641 res!852721) b!1283649))

(assert (= (and b!1283649 res!852724) b!1283648))

(assert (= (and b!1283648 res!852720) b!1283650))

(assert (= (and b!1283642 condMapEmpty!52373) mapIsEmpty!52373))

(assert (= (and b!1283642 (not condMapEmpty!52373)) mapNonEmpty!52373))

(get-info :version)

(assert (= (and mapNonEmpty!52373 ((_ is ValueCellFull!16040) mapValue!52373)) b!1283640))

(assert (= (and b!1283642 ((_ is ValueCellFull!16040) mapDefault!52373)) b!1283646))

(assert (= start!108724 b!1283642))

(declare-fun m!1177069 () Bool)

(assert (=> b!1283649 m!1177069))

(assert (=> b!1283649 m!1177069))

(declare-fun m!1177071 () Bool)

(assert (=> b!1283649 m!1177071))

(declare-fun m!1177073 () Bool)

(assert (=> b!1283644 m!1177073))

(declare-fun m!1177075 () Bool)

(assert (=> b!1283651 m!1177075))

(assert (=> b!1283651 m!1177075))

(declare-fun m!1177077 () Bool)

(assert (=> b!1283651 m!1177077))

(declare-fun m!1177079 () Bool)

(assert (=> start!108724 m!1177079))

(declare-fun m!1177081 () Bool)

(assert (=> start!108724 m!1177081))

(declare-fun m!1177083 () Bool)

(assert (=> start!108724 m!1177083))

(declare-fun m!1177085 () Bool)

(assert (=> b!1283643 m!1177085))

(declare-fun m!1177087 () Bool)

(assert (=> b!1283650 m!1177087))

(declare-fun m!1177089 () Bool)

(assert (=> b!1283650 m!1177089))

(declare-fun m!1177091 () Bool)

(assert (=> b!1283650 m!1177091))

(assert (=> b!1283650 m!1177091))

(declare-fun m!1177093 () Bool)

(assert (=> b!1283650 m!1177093))

(declare-fun m!1177095 () Bool)

(assert (=> mapNonEmpty!52373 m!1177095))

(check-sat (not b!1283643) (not start!108724) (not b!1283651) b_and!46285 (not mapNonEmpty!52373) tp_is_empty!33877 (not b_next!28237) (not b!1283644) (not b!1283650) (not b!1283649))
(check-sat b_and!46285 (not b_next!28237))
