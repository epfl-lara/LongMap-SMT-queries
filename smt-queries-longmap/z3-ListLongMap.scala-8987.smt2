; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108684 () Bool)

(assert start!108684)

(declare-fun b_free!28197 () Bool)

(declare-fun b_next!28197 () Bool)

(assert (=> start!108684 (= b_free!28197 (not b_next!28197))))

(declare-fun tp!99707 () Bool)

(declare-fun b_and!46263 () Bool)

(assert (=> start!108684 (= tp!99707 b_and!46263)))

(declare-fun mapIsEmpty!52313 () Bool)

(declare-fun mapRes!52313 () Bool)

(assert (=> mapIsEmpty!52313 mapRes!52313))

(declare-fun b!1282984 () Bool)

(declare-fun res!852213 () Bool)

(declare-fun e!733039 () Bool)

(assert (=> b!1282984 (=> (not res!852213) (not e!733039))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((array!84738 0))(
  ( (array!84739 (arr!40871 (Array (_ BitVec 32) (_ BitVec 64))) (size!41421 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84738)

(assert (=> b!1282984 (= res!852213 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41421 _keys!1741))))))

(declare-fun b!1282985 () Bool)

(declare-fun res!852209 () Bool)

(assert (=> b!1282985 (=> (not res!852209) (not e!733039))))

(declare-datatypes ((List!28957 0))(
  ( (Nil!28954) (Cons!28953 (h!30162 (_ BitVec 64)) (t!42501 List!28957)) )
))
(declare-fun arrayNoDuplicates!0 (array!84738 (_ BitVec 32) List!28957) Bool)

(assert (=> b!1282985 (= res!852209 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28954))))

(declare-fun b!1282986 () Bool)

(assert (=> b!1282986 (= e!733039 false)))

(declare-datatypes ((V!50219 0))(
  ( (V!50220 (val!16993 Int)) )
))
(declare-fun minValue!1387 () V!50219)

(declare-fun zeroValue!1387 () V!50219)

(declare-datatypes ((ValueCell!16020 0))(
  ( (ValueCellFull!16020 (v!19595 V!50219)) (EmptyCell!16020) )
))
(declare-datatypes ((array!84740 0))(
  ( (array!84741 (arr!40872 (Array (_ BitVec 32) ValueCell!16020)) (size!41422 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84740)

(declare-fun lt!576583 () Bool)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-datatypes ((tuple2!21760 0))(
  ( (tuple2!21761 (_1!10891 (_ BitVec 64)) (_2!10891 V!50219)) )
))
(declare-datatypes ((List!28958 0))(
  ( (Nil!28955) (Cons!28954 (h!30163 tuple2!21760) (t!42502 List!28958)) )
))
(declare-datatypes ((ListLongMap!19417 0))(
  ( (ListLongMap!19418 (toList!9724 List!28958)) )
))
(declare-fun contains!7841 (ListLongMap!19417 (_ BitVec 64)) Bool)

(declare-fun +!4276 (ListLongMap!19417 tuple2!21760) ListLongMap!19417)

(declare-fun getCurrentListMapNoExtraKeys!5906 (array!84738 array!84740 (_ BitVec 32) (_ BitVec 32) V!50219 V!50219 (_ BitVec 32) Int) ListLongMap!19417)

(assert (=> b!1282986 (= lt!576583 (contains!7841 (+!4276 (+!4276 (getCurrentListMapNoExtraKeys!5906 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) (tuple2!21761 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) (tuple2!21761 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k0!1205))))

(declare-fun res!852205 () Bool)

(assert (=> start!108684 (=> (not res!852205) (not e!733039))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108684 (= res!852205 (validMask!0 mask!2175))))

(assert (=> start!108684 e!733039))

(declare-fun tp_is_empty!33837 () Bool)

(assert (=> start!108684 tp_is_empty!33837))

(assert (=> start!108684 true))

(declare-fun e!733037 () Bool)

(declare-fun array_inv!31005 (array!84740) Bool)

(assert (=> start!108684 (and (array_inv!31005 _values!1445) e!733037)))

(declare-fun array_inv!31006 (array!84738) Bool)

(assert (=> start!108684 (array_inv!31006 _keys!1741)))

(assert (=> start!108684 tp!99707))

(declare-fun b!1282987 () Bool)

(declare-fun res!852212 () Bool)

(assert (=> b!1282987 (=> (not res!852212) (not e!733039))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1282987 (= res!852212 (validKeyInArray!0 (select (arr!40871 _keys!1741) from!2144)))))

(declare-fun b!1282988 () Bool)

(declare-fun res!852211 () Bool)

(assert (=> b!1282988 (=> (not res!852211) (not e!733039))))

(assert (=> b!1282988 (= res!852211 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1282989 () Bool)

(declare-fun res!852207 () Bool)

(assert (=> b!1282989 (=> (not res!852207) (not e!733039))))

(assert (=> b!1282989 (= res!852207 (and (= (size!41422 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41421 _keys!1741) (size!41422 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1282990 () Bool)

(declare-fun res!852206 () Bool)

(assert (=> b!1282990 (=> (not res!852206) (not e!733039))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84738 (_ BitVec 32)) Bool)

(assert (=> b!1282990 (= res!852206 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun mapNonEmpty!52313 () Bool)

(declare-fun tp!99706 () Bool)

(declare-fun e!733038 () Bool)

(assert (=> mapNonEmpty!52313 (= mapRes!52313 (and tp!99706 e!733038))))

(declare-fun mapValue!52313 () ValueCell!16020)

(declare-fun mapKey!52313 () (_ BitVec 32))

(declare-fun mapRest!52313 () (Array (_ BitVec 32) ValueCell!16020))

(assert (=> mapNonEmpty!52313 (= (arr!40872 _values!1445) (store mapRest!52313 mapKey!52313 mapValue!52313))))

(declare-fun b!1282991 () Bool)

(declare-fun e!733040 () Bool)

(assert (=> b!1282991 (= e!733037 (and e!733040 mapRes!52313))))

(declare-fun condMapEmpty!52313 () Bool)

(declare-fun mapDefault!52313 () ValueCell!16020)

(assert (=> b!1282991 (= condMapEmpty!52313 (= (arr!40872 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16020)) mapDefault!52313)))))

(declare-fun b!1282992 () Bool)

(assert (=> b!1282992 (= e!733038 tp_is_empty!33837)))

(declare-fun b!1282993 () Bool)

(declare-fun res!852210 () Bool)

(assert (=> b!1282993 (=> (not res!852210) (not e!733039))))

(assert (=> b!1282993 (= res!852210 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41421 _keys!1741))))))

(declare-fun b!1282994 () Bool)

(declare-fun res!852208 () Bool)

(assert (=> b!1282994 (=> (not res!852208) (not e!733039))))

(declare-fun getCurrentListMap!4808 (array!84738 array!84740 (_ BitVec 32) (_ BitVec 32) V!50219 V!50219 (_ BitVec 32) Int) ListLongMap!19417)

(assert (=> b!1282994 (= res!852208 (contains!7841 (getCurrentListMap!4808 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1282995 () Bool)

(assert (=> b!1282995 (= e!733040 tp_is_empty!33837)))

(assert (= (and start!108684 res!852205) b!1282989))

(assert (= (and b!1282989 res!852207) b!1282990))

(assert (= (and b!1282990 res!852206) b!1282985))

(assert (= (and b!1282985 res!852209) b!1282984))

(assert (= (and b!1282984 res!852213) b!1282994))

(assert (= (and b!1282994 res!852208) b!1282993))

(assert (= (and b!1282993 res!852210) b!1282987))

(assert (= (and b!1282987 res!852212) b!1282988))

(assert (= (and b!1282988 res!852211) b!1282986))

(assert (= (and b!1282991 condMapEmpty!52313) mapIsEmpty!52313))

(assert (= (and b!1282991 (not condMapEmpty!52313)) mapNonEmpty!52313))

(get-info :version)

(assert (= (and mapNonEmpty!52313 ((_ is ValueCellFull!16020) mapValue!52313)) b!1282992))

(assert (= (and b!1282991 ((_ is ValueCellFull!16020) mapDefault!52313)) b!1282995))

(assert (= start!108684 b!1282991))

(declare-fun m!1177009 () Bool)

(assert (=> b!1282985 m!1177009))

(declare-fun m!1177011 () Bool)

(assert (=> b!1282987 m!1177011))

(assert (=> b!1282987 m!1177011))

(declare-fun m!1177013 () Bool)

(assert (=> b!1282987 m!1177013))

(declare-fun m!1177015 () Bool)

(assert (=> mapNonEmpty!52313 m!1177015))

(declare-fun m!1177017 () Bool)

(assert (=> b!1282994 m!1177017))

(assert (=> b!1282994 m!1177017))

(declare-fun m!1177019 () Bool)

(assert (=> b!1282994 m!1177019))

(declare-fun m!1177021 () Bool)

(assert (=> b!1282986 m!1177021))

(assert (=> b!1282986 m!1177021))

(declare-fun m!1177023 () Bool)

(assert (=> b!1282986 m!1177023))

(assert (=> b!1282986 m!1177023))

(declare-fun m!1177025 () Bool)

(assert (=> b!1282986 m!1177025))

(assert (=> b!1282986 m!1177025))

(declare-fun m!1177027 () Bool)

(assert (=> b!1282986 m!1177027))

(declare-fun m!1177029 () Bool)

(assert (=> start!108684 m!1177029))

(declare-fun m!1177031 () Bool)

(assert (=> start!108684 m!1177031))

(declare-fun m!1177033 () Bool)

(assert (=> start!108684 m!1177033))

(declare-fun m!1177035 () Bool)

(assert (=> b!1282990 m!1177035))

(check-sat tp_is_empty!33837 (not b_next!28197) (not b!1282985) (not b!1282994) (not mapNonEmpty!52313) b_and!46263 (not b!1282990) (not b!1282986) (not b!1282987) (not start!108684))
(check-sat b_and!46263 (not b_next!28197))
