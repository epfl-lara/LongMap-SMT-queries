; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110016 () Bool)

(assert start!110016)

(declare-fun b_free!29185 () Bool)

(declare-fun b_next!29185 () Bool)

(assert (=> start!110016 (= b_free!29185 (not b_next!29185))))

(declare-fun tp!102688 () Bool)

(declare-fun b_and!47301 () Bool)

(assert (=> start!110016 (= tp!102688 b_and!47301)))

(declare-fun b!1301789 () Bool)

(declare-fun res!864716 () Bool)

(declare-fun e!742688 () Bool)

(assert (=> b!1301789 (=> (not res!864716) (not e!742688))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((V!51537 0))(
  ( (V!51538 (val!17487 Int)) )
))
(declare-datatypes ((ValueCell!16514 0))(
  ( (ValueCellFull!16514 (v!20090 V!51537)) (EmptyCell!16514) )
))
(declare-datatypes ((array!86701 0))(
  ( (array!86702 (arr!41842 (Array (_ BitVec 32) ValueCell!16514)) (size!42393 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86701)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!86703 0))(
  ( (array!86704 (arr!41843 (Array (_ BitVec 32) (_ BitVec 64))) (size!42394 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86703)

(assert (=> b!1301789 (= res!864716 (and (= (size!42393 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42394 _keys!1741) (size!42393 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1301790 () Bool)

(declare-fun res!864712 () Bool)

(assert (=> b!1301790 (=> (not res!864712) (not e!742688))))

(assert (=> b!1301790 (= res!864712 (and (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1301791 () Bool)

(assert (=> b!1301791 (= e!742688 false)))

(declare-fun minValue!1387 () V!51537)

(declare-fun zeroValue!1387 () V!51537)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun lt!581880 () Bool)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!22568 0))(
  ( (tuple2!22569 (_1!11295 (_ BitVec 64)) (_2!11295 V!51537)) )
))
(declare-datatypes ((List!29727 0))(
  ( (Nil!29724) (Cons!29723 (h!30941 tuple2!22568) (t!43293 List!29727)) )
))
(declare-datatypes ((ListLongMap!20233 0))(
  ( (ListLongMap!20234 (toList!10132 List!29727)) )
))
(declare-fun contains!8270 (ListLongMap!20233 (_ BitVec 64)) Bool)

(declare-fun +!4503 (ListLongMap!20233 tuple2!22568) ListLongMap!20233)

(declare-fun getCurrentListMapNoExtraKeys!6143 (array!86703 array!86701 (_ BitVec 32) (_ BitVec 32) V!51537 V!51537 (_ BitVec 32) Int) ListLongMap!20233)

(assert (=> b!1301791 (= lt!581880 (contains!8270 (+!4503 (getCurrentListMapNoExtraKeys!6143 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) (tuple2!22569 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k0!1205))))

(declare-fun b!1301792 () Bool)

(declare-fun res!864709 () Bool)

(assert (=> b!1301792 (=> (not res!864709) (not e!742688))))

(declare-datatypes ((List!29728 0))(
  ( (Nil!29725) (Cons!29724 (h!30942 (_ BitVec 64)) (t!43294 List!29728)) )
))
(declare-fun arrayNoDuplicates!0 (array!86703 (_ BitVec 32) List!29728) Bool)

(assert (=> b!1301792 (= res!864709 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29725))))

(declare-fun b!1301793 () Bool)

(declare-fun e!742685 () Bool)

(declare-fun tp_is_empty!34825 () Bool)

(assert (=> b!1301793 (= e!742685 tp_is_empty!34825)))

(declare-fun b!1301794 () Bool)

(declare-fun res!864711 () Bool)

(assert (=> b!1301794 (=> (not res!864711) (not e!742688))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86703 (_ BitVec 32)) Bool)

(assert (=> b!1301794 (= res!864711 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun mapIsEmpty!53813 () Bool)

(declare-fun mapRes!53813 () Bool)

(assert (=> mapIsEmpty!53813 mapRes!53813))

(declare-fun b!1301795 () Bool)

(declare-fun e!742686 () Bool)

(declare-fun e!742689 () Bool)

(assert (=> b!1301795 (= e!742686 (and e!742689 mapRes!53813))))

(declare-fun condMapEmpty!53813 () Bool)

(declare-fun mapDefault!53813 () ValueCell!16514)

(assert (=> b!1301795 (= condMapEmpty!53813 (= (arr!41842 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16514)) mapDefault!53813)))))

(declare-fun mapNonEmpty!53813 () Bool)

(declare-fun tp!102689 () Bool)

(assert (=> mapNonEmpty!53813 (= mapRes!53813 (and tp!102689 e!742685))))

(declare-fun mapKey!53813 () (_ BitVec 32))

(declare-fun mapRest!53813 () (Array (_ BitVec 32) ValueCell!16514))

(declare-fun mapValue!53813 () ValueCell!16514)

(assert (=> mapNonEmpty!53813 (= (arr!41842 _values!1445) (store mapRest!53813 mapKey!53813 mapValue!53813))))

(declare-fun b!1301796 () Bool)

(assert (=> b!1301796 (= e!742689 tp_is_empty!34825)))

(declare-fun b!1301798 () Bool)

(declare-fun res!864713 () Bool)

(assert (=> b!1301798 (=> (not res!864713) (not e!742688))))

(assert (=> b!1301798 (= res!864713 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42394 _keys!1741))))))

(declare-fun b!1301799 () Bool)

(declare-fun res!864717 () Bool)

(assert (=> b!1301799 (=> (not res!864717) (not e!742688))))

(declare-fun getCurrentListMap!5148 (array!86703 array!86701 (_ BitVec 32) (_ BitVec 32) V!51537 V!51537 (_ BitVec 32) Int) ListLongMap!20233)

(assert (=> b!1301799 (= res!864717 (contains!8270 (getCurrentListMap!5148 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1301800 () Bool)

(declare-fun res!864710 () Bool)

(assert (=> b!1301800 (=> (not res!864710) (not e!742688))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1301800 (= res!864710 (validKeyInArray!0 (select (arr!41843 _keys!1741) from!2144)))))

(declare-fun b!1301797 () Bool)

(declare-fun res!864715 () Bool)

(assert (=> b!1301797 (=> (not res!864715) (not e!742688))))

(assert (=> b!1301797 (= res!864715 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42394 _keys!1741))))))

(declare-fun res!864714 () Bool)

(assert (=> start!110016 (=> (not res!864714) (not e!742688))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110016 (= res!864714 (validMask!0 mask!2175))))

(assert (=> start!110016 e!742688))

(assert (=> start!110016 tp_is_empty!34825))

(assert (=> start!110016 true))

(declare-fun array_inv!31899 (array!86701) Bool)

(assert (=> start!110016 (and (array_inv!31899 _values!1445) e!742686)))

(declare-fun array_inv!31900 (array!86703) Bool)

(assert (=> start!110016 (array_inv!31900 _keys!1741)))

(assert (=> start!110016 tp!102688))

(assert (= (and start!110016 res!864714) b!1301789))

(assert (= (and b!1301789 res!864716) b!1301794))

(assert (= (and b!1301794 res!864711) b!1301792))

(assert (= (and b!1301792 res!864709) b!1301798))

(assert (= (and b!1301798 res!864713) b!1301799))

(assert (= (and b!1301799 res!864717) b!1301797))

(assert (= (and b!1301797 res!864715) b!1301800))

(assert (= (and b!1301800 res!864710) b!1301790))

(assert (= (and b!1301790 res!864712) b!1301791))

(assert (= (and b!1301795 condMapEmpty!53813) mapIsEmpty!53813))

(assert (= (and b!1301795 (not condMapEmpty!53813)) mapNonEmpty!53813))

(get-info :version)

(assert (= (and mapNonEmpty!53813 ((_ is ValueCellFull!16514) mapValue!53813)) b!1301793))

(assert (= (and b!1301795 ((_ is ValueCellFull!16514) mapDefault!53813)) b!1301796))

(assert (= start!110016 b!1301795))

(declare-fun m!1193021 () Bool)

(assert (=> mapNonEmpty!53813 m!1193021))

(declare-fun m!1193023 () Bool)

(assert (=> b!1301800 m!1193023))

(assert (=> b!1301800 m!1193023))

(declare-fun m!1193025 () Bool)

(assert (=> b!1301800 m!1193025))

(declare-fun m!1193027 () Bool)

(assert (=> b!1301792 m!1193027))

(declare-fun m!1193029 () Bool)

(assert (=> start!110016 m!1193029))

(declare-fun m!1193031 () Bool)

(assert (=> start!110016 m!1193031))

(declare-fun m!1193033 () Bool)

(assert (=> start!110016 m!1193033))

(declare-fun m!1193035 () Bool)

(assert (=> b!1301791 m!1193035))

(assert (=> b!1301791 m!1193035))

(declare-fun m!1193037 () Bool)

(assert (=> b!1301791 m!1193037))

(assert (=> b!1301791 m!1193037))

(declare-fun m!1193039 () Bool)

(assert (=> b!1301791 m!1193039))

(declare-fun m!1193041 () Bool)

(assert (=> b!1301794 m!1193041))

(declare-fun m!1193043 () Bool)

(assert (=> b!1301799 m!1193043))

(assert (=> b!1301799 m!1193043))

(declare-fun m!1193045 () Bool)

(assert (=> b!1301799 m!1193045))

(check-sat tp_is_empty!34825 (not b!1301792) (not b!1301791) (not b!1301794) (not b!1301799) (not mapNonEmpty!53813) (not b!1301800) (not start!110016) b_and!47301 (not b_next!29185))
(check-sat b_and!47301 (not b_next!29185))
