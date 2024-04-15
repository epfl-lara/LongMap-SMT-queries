; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108880 () Bool)

(assert start!108880)

(declare-fun b_free!28393 () Bool)

(declare-fun b_next!28393 () Bool)

(assert (=> start!108880 (= b_free!28393 (not b_next!28393))))

(declare-fun tp!100296 () Bool)

(declare-fun b_and!46441 () Bool)

(assert (=> start!108880 (= tp!100296 b_and!46441)))

(declare-fun b!1285854 () Bool)

(declare-fun res!854231 () Bool)

(declare-fun e!734477 () Bool)

(assert (=> b!1285854 (=> (not res!854231) (not e!734477))))

(declare-datatypes ((array!85009 0))(
  ( (array!85010 (arr!41007 (Array (_ BitVec 32) (_ BitVec 64))) (size!41559 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85009)

(declare-datatypes ((List!29153 0))(
  ( (Nil!29150) (Cons!29149 (h!30358 (_ BitVec 64)) (t!42689 List!29153)) )
))
(declare-fun arrayNoDuplicates!0 (array!85009 (_ BitVec 32) List!29153) Bool)

(assert (=> b!1285854 (= res!854231 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29150))))

(declare-fun res!854235 () Bool)

(assert (=> start!108880 (=> (not res!854235) (not e!734477))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108880 (= res!854235 (validMask!0 mask!2175))))

(assert (=> start!108880 e!734477))

(declare-fun tp_is_empty!34033 () Bool)

(assert (=> start!108880 tp_is_empty!34033))

(assert (=> start!108880 true))

(declare-datatypes ((V!50481 0))(
  ( (V!50482 (val!17091 Int)) )
))
(declare-datatypes ((ValueCell!16118 0))(
  ( (ValueCellFull!16118 (v!19692 V!50481)) (EmptyCell!16118) )
))
(declare-datatypes ((array!85011 0))(
  ( (array!85012 (arr!41008 (Array (_ BitVec 32) ValueCell!16118)) (size!41560 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85011)

(declare-fun e!734480 () Bool)

(declare-fun array_inv!31259 (array!85011) Bool)

(assert (=> start!108880 (and (array_inv!31259 _values!1445) e!734480)))

(declare-fun array_inv!31260 (array!85009) Bool)

(assert (=> start!108880 (array_inv!31260 _keys!1741)))

(assert (=> start!108880 tp!100296))

(declare-fun b!1285855 () Bool)

(declare-fun res!854237 () Bool)

(assert (=> b!1285855 (=> (not res!854237) (not e!734477))))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1285855 (= res!854237 (and (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1285856 () Bool)

(declare-fun res!854236 () Bool)

(assert (=> b!1285856 (=> (not res!854236) (not e!734477))))

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1285856 (= res!854236 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41559 _keys!1741))))))

(declare-fun b!1285857 () Bool)

(declare-fun res!854234 () Bool)

(assert (=> b!1285857 (=> (not res!854234) (not e!734477))))

(declare-fun k0!1205 () (_ BitVec 64))

(assert (=> b!1285857 (= res!854234 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41559 _keys!1741))))))

(declare-fun mapNonEmpty!52607 () Bool)

(declare-fun mapRes!52607 () Bool)

(declare-fun tp!100295 () Bool)

(declare-fun e!734479 () Bool)

(assert (=> mapNonEmpty!52607 (= mapRes!52607 (and tp!100295 e!734479))))

(declare-fun mapValue!52607 () ValueCell!16118)

(declare-fun mapRest!52607 () (Array (_ BitVec 32) ValueCell!16118))

(declare-fun mapKey!52607 () (_ BitVec 32))

(assert (=> mapNonEmpty!52607 (= (arr!41008 _values!1445) (store mapRest!52607 mapKey!52607 mapValue!52607))))

(declare-fun b!1285858 () Bool)

(declare-fun res!854230 () Bool)

(assert (=> b!1285858 (=> (not res!854230) (not e!734477))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1285858 (= res!854230 (validKeyInArray!0 (select (arr!41007 _keys!1741) from!2144)))))

(declare-fun b!1285859 () Bool)

(assert (=> b!1285859 (= e!734479 tp_is_empty!34033)))

(declare-fun b!1285860 () Bool)

(declare-fun res!854232 () Bool)

(assert (=> b!1285860 (=> (not res!854232) (not e!734477))))

(assert (=> b!1285860 (= res!854232 (and (= (size!41560 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41559 _keys!1741) (size!41560 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1285861 () Bool)

(declare-fun e!734478 () Bool)

(assert (=> b!1285861 (= e!734478 tp_is_empty!34033)))

(declare-fun mapIsEmpty!52607 () Bool)

(assert (=> mapIsEmpty!52607 mapRes!52607))

(declare-fun b!1285862 () Bool)

(assert (=> b!1285862 (= e!734480 (and e!734478 mapRes!52607))))

(declare-fun condMapEmpty!52607 () Bool)

(declare-fun mapDefault!52607 () ValueCell!16118)

(assert (=> b!1285862 (= condMapEmpty!52607 (= (arr!41008 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16118)) mapDefault!52607)))))

(declare-fun b!1285863 () Bool)

(declare-fun res!854233 () Bool)

(assert (=> b!1285863 (=> (not res!854233) (not e!734477))))

(declare-fun zeroValue!1387 () V!50481)

(declare-fun minValue!1387 () V!50481)

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!21976 0))(
  ( (tuple2!21977 (_1!10999 (_ BitVec 64)) (_2!10999 V!50481)) )
))
(declare-datatypes ((List!29154 0))(
  ( (Nil!29151) (Cons!29150 (h!30359 tuple2!21976) (t!42690 List!29154)) )
))
(declare-datatypes ((ListLongMap!19633 0))(
  ( (ListLongMap!19634 (toList!9832 List!29154)) )
))
(declare-fun contains!7879 (ListLongMap!19633 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4802 (array!85009 array!85011 (_ BitVec 32) (_ BitVec 32) V!50481 V!50481 (_ BitVec 32) Int) ListLongMap!19633)

(assert (=> b!1285863 (= res!854233 (contains!7879 (getCurrentListMap!4802 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1285864 () Bool)

(declare-fun res!854238 () Bool)

(assert (=> b!1285864 (=> (not res!854238) (not e!734477))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85009 (_ BitVec 32)) Bool)

(assert (=> b!1285864 (= res!854238 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1285865 () Bool)

(assert (=> b!1285865 (= e!734477 false)))

(declare-fun lt!576780 () Bool)

(declare-fun +!4347 (ListLongMap!19633 tuple2!21976) ListLongMap!19633)

(declare-fun getCurrentListMapNoExtraKeys!5978 (array!85009 array!85011 (_ BitVec 32) (_ BitVec 32) V!50481 V!50481 (_ BitVec 32) Int) ListLongMap!19633)

(assert (=> b!1285865 (= lt!576780 (contains!7879 (+!4347 (getCurrentListMapNoExtraKeys!5978 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) (tuple2!21977 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k0!1205))))

(assert (= (and start!108880 res!854235) b!1285860))

(assert (= (and b!1285860 res!854232) b!1285864))

(assert (= (and b!1285864 res!854238) b!1285854))

(assert (= (and b!1285854 res!854231) b!1285856))

(assert (= (and b!1285856 res!854236) b!1285863))

(assert (= (and b!1285863 res!854233) b!1285857))

(assert (= (and b!1285857 res!854234) b!1285858))

(assert (= (and b!1285858 res!854230) b!1285855))

(assert (= (and b!1285855 res!854237) b!1285865))

(assert (= (and b!1285862 condMapEmpty!52607) mapIsEmpty!52607))

(assert (= (and b!1285862 (not condMapEmpty!52607)) mapNonEmpty!52607))

(get-info :version)

(assert (= (and mapNonEmpty!52607 ((_ is ValueCellFull!16118) mapValue!52607)) b!1285859))

(assert (= (and b!1285862 ((_ is ValueCellFull!16118) mapDefault!52607)) b!1285861))

(assert (= start!108880 b!1285862))

(declare-fun m!1178611 () Bool)

(assert (=> b!1285864 m!1178611))

(declare-fun m!1178613 () Bool)

(assert (=> b!1285854 m!1178613))

(declare-fun m!1178615 () Bool)

(assert (=> b!1285865 m!1178615))

(assert (=> b!1285865 m!1178615))

(declare-fun m!1178617 () Bool)

(assert (=> b!1285865 m!1178617))

(assert (=> b!1285865 m!1178617))

(declare-fun m!1178619 () Bool)

(assert (=> b!1285865 m!1178619))

(declare-fun m!1178621 () Bool)

(assert (=> b!1285863 m!1178621))

(assert (=> b!1285863 m!1178621))

(declare-fun m!1178623 () Bool)

(assert (=> b!1285863 m!1178623))

(declare-fun m!1178625 () Bool)

(assert (=> start!108880 m!1178625))

(declare-fun m!1178627 () Bool)

(assert (=> start!108880 m!1178627))

(declare-fun m!1178629 () Bool)

(assert (=> start!108880 m!1178629))

(declare-fun m!1178631 () Bool)

(assert (=> b!1285858 m!1178631))

(assert (=> b!1285858 m!1178631))

(declare-fun m!1178633 () Bool)

(assert (=> b!1285858 m!1178633))

(declare-fun m!1178635 () Bool)

(assert (=> mapNonEmpty!52607 m!1178635))

(check-sat (not b!1285858) (not b!1285863) b_and!46441 (not start!108880) (not b_next!28393) (not b!1285854) (not b!1285864) (not mapNonEmpty!52607) (not b!1285865) tp_is_empty!34033)
(check-sat b_and!46441 (not b_next!28393))
