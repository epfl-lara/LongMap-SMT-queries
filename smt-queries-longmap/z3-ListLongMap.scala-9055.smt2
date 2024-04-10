; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109116 () Bool)

(assert start!109116)

(declare-fun b_free!28605 () Bool)

(declare-fun b_next!28605 () Bool)

(assert (=> start!109116 (= b_free!28605 (not b_next!28605))))

(declare-fun tp!100934 () Bool)

(declare-fun b_and!46695 () Bool)

(assert (=> start!109116 (= tp!100934 b_and!46695)))

(declare-fun b!1290173 () Bool)

(declare-fun e!736585 () Bool)

(declare-fun e!736586 () Bool)

(declare-fun mapRes!52928 () Bool)

(assert (=> b!1290173 (= e!736585 (and e!736586 mapRes!52928))))

(declare-fun condMapEmpty!52928 () Bool)

(declare-datatypes ((V!50763 0))(
  ( (V!50764 (val!17197 Int)) )
))
(declare-datatypes ((ValueCell!16224 0))(
  ( (ValueCellFull!16224 (v!19800 V!50763)) (EmptyCell!16224) )
))
(declare-datatypes ((array!85532 0))(
  ( (array!85533 (arr!41267 (Array (_ BitVec 32) ValueCell!16224)) (size!41817 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85532)

(declare-fun mapDefault!52928 () ValueCell!16224)

(assert (=> b!1290173 (= condMapEmpty!52928 (= (arr!41267 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16224)) mapDefault!52928)))))

(declare-fun b!1290174 () Bool)

(declare-fun e!736584 () Bool)

(assert (=> b!1290174 (= e!736584 true)))

(declare-datatypes ((tuple2!22094 0))(
  ( (tuple2!22095 (_1!11058 (_ BitVec 64)) (_2!11058 V!50763)) )
))
(declare-datatypes ((List!29261 0))(
  ( (Nil!29258) (Cons!29257 (h!30466 tuple2!22094) (t!42825 List!29261)) )
))
(declare-datatypes ((ListLongMap!19751 0))(
  ( (ListLongMap!19752 (toList!9891 List!29261)) )
))
(declare-fun lt!578504 () ListLongMap!19751)

(declare-fun minValue!1387 () V!50763)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun contains!8009 (ListLongMap!19751 (_ BitVec 64)) Bool)

(declare-fun +!4360 (ListLongMap!19751 tuple2!22094) ListLongMap!19751)

(assert (=> b!1290174 (not (contains!8009 (+!4360 lt!578504 (tuple2!22095 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k0!1205))))

(declare-datatypes ((Unit!42696 0))(
  ( (Unit!42697) )
))
(declare-fun lt!578503 () Unit!42696)

(declare-fun addStillNotContains!378 (ListLongMap!19751 (_ BitVec 64) V!50763 (_ BitVec 64)) Unit!42696)

(assert (=> b!1290174 (= lt!578503 (addStillNotContains!378 lt!578504 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 k0!1205))))

(declare-fun zeroValue!1387 () V!50763)

(assert (=> b!1290174 (not (contains!8009 (+!4360 lt!578504 (tuple2!22095 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) k0!1205))))

(declare-fun lt!578501 () Unit!42696)

(assert (=> b!1290174 (= lt!578501 (addStillNotContains!378 lt!578504 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k0!1205))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!85534 0))(
  ( (array!85535 (arr!41268 (Array (_ BitVec 32) (_ BitVec 64))) (size!41818 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85534)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!5991 (array!85534 array!85532 (_ BitVec 32) (_ BitVec 32) V!50763 V!50763 (_ BitVec 32) Int) ListLongMap!19751)

(assert (=> b!1290174 (= lt!578504 (getCurrentListMapNoExtraKeys!5991 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun mapIsEmpty!52928 () Bool)

(assert (=> mapIsEmpty!52928 mapRes!52928))

(declare-fun b!1290175 () Bool)

(declare-fun e!736582 () Bool)

(declare-fun tp_is_empty!34245 () Bool)

(assert (=> b!1290175 (= e!736582 tp_is_empty!34245)))

(declare-fun b!1290176 () Bool)

(declare-fun res!857071 () Bool)

(declare-fun e!736581 () Bool)

(assert (=> b!1290176 (=> (not res!857071) (not e!736581))))

(declare-fun getCurrentListMap!4949 (array!85534 array!85532 (_ BitVec 32) (_ BitVec 32) V!50763 V!50763 (_ BitVec 32) Int) ListLongMap!19751)

(assert (=> b!1290176 (= res!857071 (contains!8009 (getCurrentListMap!4949 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1290177 () Bool)

(declare-fun res!857070 () Bool)

(assert (=> b!1290177 (=> (not res!857070) (not e!736581))))

(declare-datatypes ((List!29262 0))(
  ( (Nil!29259) (Cons!29258 (h!30467 (_ BitVec 64)) (t!42826 List!29262)) )
))
(declare-fun arrayNoDuplicates!0 (array!85534 (_ BitVec 32) List!29262) Bool)

(assert (=> b!1290177 (= res!857070 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29259))))

(declare-fun b!1290178 () Bool)

(declare-fun res!857075 () Bool)

(assert (=> b!1290178 (=> (not res!857075) (not e!736581))))

(assert (=> b!1290178 (= res!857075 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41818 _keys!1741))))))

(declare-fun b!1290179 () Bool)

(assert (=> b!1290179 (= e!736581 (not e!736584))))

(declare-fun res!857076 () Bool)

(assert (=> b!1290179 (=> res!857076 e!736584)))

(assert (=> b!1290179 (= res!857076 (or (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1290179 (not (contains!8009 (ListLongMap!19752 Nil!29258) k0!1205))))

(declare-fun lt!578502 () Unit!42696)

(declare-fun emptyContainsNothing!74 ((_ BitVec 64)) Unit!42696)

(assert (=> b!1290179 (= lt!578502 (emptyContainsNothing!74 k0!1205))))

(declare-fun b!1290180 () Bool)

(assert (=> b!1290180 (= e!736586 tp_is_empty!34245)))

(declare-fun b!1290181 () Bool)

(declare-fun res!857074 () Bool)

(assert (=> b!1290181 (=> (not res!857074) (not e!736581))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85534 (_ BitVec 32)) Bool)

(assert (=> b!1290181 (= res!857074 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun res!857069 () Bool)

(assert (=> start!109116 (=> (not res!857069) (not e!736581))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109116 (= res!857069 (validMask!0 mask!2175))))

(assert (=> start!109116 e!736581))

(assert (=> start!109116 tp_is_empty!34245))

(assert (=> start!109116 true))

(declare-fun array_inv!31277 (array!85532) Bool)

(assert (=> start!109116 (and (array_inv!31277 _values!1445) e!736585)))

(declare-fun array_inv!31278 (array!85534) Bool)

(assert (=> start!109116 (array_inv!31278 _keys!1741)))

(assert (=> start!109116 tp!100934))

(declare-fun b!1290182 () Bool)

(declare-fun res!857068 () Bool)

(assert (=> b!1290182 (=> (not res!857068) (not e!736581))))

(assert (=> b!1290182 (= res!857068 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41818 _keys!1741))))))

(declare-fun mapNonEmpty!52928 () Bool)

(declare-fun tp!100933 () Bool)

(assert (=> mapNonEmpty!52928 (= mapRes!52928 (and tp!100933 e!736582))))

(declare-fun mapValue!52928 () ValueCell!16224)

(declare-fun mapKey!52928 () (_ BitVec 32))

(declare-fun mapRest!52928 () (Array (_ BitVec 32) ValueCell!16224))

(assert (=> mapNonEmpty!52928 (= (arr!41267 _values!1445) (store mapRest!52928 mapKey!52928 mapValue!52928))))

(declare-fun b!1290183 () Bool)

(declare-fun res!857073 () Bool)

(assert (=> b!1290183 (=> (not res!857073) (not e!736581))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1290183 (= res!857073 (not (validKeyInArray!0 (select (arr!41268 _keys!1741) from!2144))))))

(declare-fun b!1290184 () Bool)

(declare-fun res!857072 () Bool)

(assert (=> b!1290184 (=> (not res!857072) (not e!736581))))

(assert (=> b!1290184 (= res!857072 (and (= (size!41817 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41818 _keys!1741) (size!41817 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(assert (= (and start!109116 res!857069) b!1290184))

(assert (= (and b!1290184 res!857072) b!1290181))

(assert (= (and b!1290181 res!857074) b!1290177))

(assert (= (and b!1290177 res!857070) b!1290182))

(assert (= (and b!1290182 res!857068) b!1290176))

(assert (= (and b!1290176 res!857071) b!1290178))

(assert (= (and b!1290178 res!857075) b!1290183))

(assert (= (and b!1290183 res!857073) b!1290179))

(assert (= (and b!1290179 (not res!857076)) b!1290174))

(assert (= (and b!1290173 condMapEmpty!52928) mapIsEmpty!52928))

(assert (= (and b!1290173 (not condMapEmpty!52928)) mapNonEmpty!52928))

(get-info :version)

(assert (= (and mapNonEmpty!52928 ((_ is ValueCellFull!16224) mapValue!52928)) b!1290175))

(assert (= (and b!1290173 ((_ is ValueCellFull!16224) mapDefault!52928)) b!1290180))

(assert (= start!109116 b!1290173))

(declare-fun m!1182733 () Bool)

(assert (=> b!1290179 m!1182733))

(declare-fun m!1182735 () Bool)

(assert (=> b!1290179 m!1182735))

(declare-fun m!1182737 () Bool)

(assert (=> b!1290174 m!1182737))

(assert (=> b!1290174 m!1182737))

(declare-fun m!1182739 () Bool)

(assert (=> b!1290174 m!1182739))

(declare-fun m!1182741 () Bool)

(assert (=> b!1290174 m!1182741))

(declare-fun m!1182743 () Bool)

(assert (=> b!1290174 m!1182743))

(declare-fun m!1182745 () Bool)

(assert (=> b!1290174 m!1182745))

(assert (=> b!1290174 m!1182741))

(declare-fun m!1182747 () Bool)

(assert (=> b!1290174 m!1182747))

(declare-fun m!1182749 () Bool)

(assert (=> b!1290174 m!1182749))

(declare-fun m!1182751 () Bool)

(assert (=> b!1290183 m!1182751))

(assert (=> b!1290183 m!1182751))

(declare-fun m!1182753 () Bool)

(assert (=> b!1290183 m!1182753))

(declare-fun m!1182755 () Bool)

(assert (=> b!1290177 m!1182755))

(declare-fun m!1182757 () Bool)

(assert (=> start!109116 m!1182757))

(declare-fun m!1182759 () Bool)

(assert (=> start!109116 m!1182759))

(declare-fun m!1182761 () Bool)

(assert (=> start!109116 m!1182761))

(declare-fun m!1182763 () Bool)

(assert (=> b!1290181 m!1182763))

(declare-fun m!1182765 () Bool)

(assert (=> b!1290176 m!1182765))

(assert (=> b!1290176 m!1182765))

(declare-fun m!1182767 () Bool)

(assert (=> b!1290176 m!1182767))

(declare-fun m!1182769 () Bool)

(assert (=> mapNonEmpty!52928 m!1182769))

(check-sat (not mapNonEmpty!52928) tp_is_empty!34245 (not b!1290177) (not b!1290179) (not b!1290176) (not b!1290181) (not b_next!28605) (not b!1290174) (not start!109116) (not b!1290183) b_and!46695)
(check-sat b_and!46695 (not b_next!28605))
