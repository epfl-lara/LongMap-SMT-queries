; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109444 () Bool)

(assert start!109444)

(declare-fun b_free!28933 () Bool)

(declare-fun b_next!28933 () Bool)

(assert (=> start!109444 (= b_free!28933 (not b_next!28933))))

(declare-fun tp!101918 () Bool)

(declare-fun b_and!47005 () Bool)

(assert (=> start!109444 (= tp!101918 b_and!47005)))

(declare-fun b!1295851 () Bool)

(declare-fun e!739344 () Bool)

(declare-fun e!739347 () Bool)

(assert (=> b!1295851 (= e!739344 (not e!739347))))

(declare-fun res!861309 () Bool)

(assert (=> b!1295851 (=> res!861309 e!739347)))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1295851 (= res!861309 (or (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-datatypes ((V!51201 0))(
  ( (V!51202 (val!17361 Int)) )
))
(declare-datatypes ((tuple2!22412 0))(
  ( (tuple2!22413 (_1!11217 (_ BitVec 64)) (_2!11217 V!51201)) )
))
(declare-datatypes ((List!29542 0))(
  ( (Nil!29539) (Cons!29538 (h!30747 tuple2!22412) (t!43098 List!29542)) )
))
(declare-datatypes ((ListLongMap!20069 0))(
  ( (ListLongMap!20070 (toList!10050 List!29542)) )
))
(declare-fun contains!8098 (ListLongMap!20069 (_ BitVec 64)) Bool)

(assert (=> b!1295851 (not (contains!8098 (ListLongMap!20070 Nil!29539) k0!1205))))

(declare-datatypes ((Unit!42768 0))(
  ( (Unit!42769) )
))
(declare-fun lt!579840 () Unit!42768)

(declare-fun emptyContainsNothing!176 ((_ BitVec 64)) Unit!42768)

(assert (=> b!1295851 (= lt!579840 (emptyContainsNothing!176 k0!1205))))

(declare-fun b!1295852 () Bool)

(declare-fun res!861314 () Bool)

(assert (=> b!1295852 (=> (not res!861314) (not e!739344))))

(declare-datatypes ((array!86057 0))(
  ( (array!86058 (arr!41530 (Array (_ BitVec 32) (_ BitVec 64))) (size!42082 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86057)

(declare-datatypes ((List!29543 0))(
  ( (Nil!29540) (Cons!29539 (h!30748 (_ BitVec 64)) (t!43099 List!29543)) )
))
(declare-fun arrayNoDuplicates!0 (array!86057 (_ BitVec 32) List!29543) Bool)

(assert (=> b!1295852 (= res!861314 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29540))))

(declare-fun b!1295853 () Bool)

(declare-fun e!739343 () Bool)

(declare-fun tp_is_empty!34573 () Bool)

(assert (=> b!1295853 (= e!739343 tp_is_empty!34573)))

(declare-fun b!1295854 () Bool)

(declare-fun res!861311 () Bool)

(assert (=> b!1295854 (=> (not res!861311) (not e!739344))))

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1295854 (= res!861311 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42082 _keys!1741))))))

(declare-fun mapIsEmpty!53420 () Bool)

(declare-fun mapRes!53420 () Bool)

(assert (=> mapIsEmpty!53420 mapRes!53420))

(declare-fun b!1295855 () Bool)

(declare-fun e!739342 () Bool)

(assert (=> b!1295855 (= e!739342 (and e!739343 mapRes!53420))))

(declare-fun condMapEmpty!53420 () Bool)

(declare-datatypes ((ValueCell!16388 0))(
  ( (ValueCellFull!16388 (v!19963 V!51201)) (EmptyCell!16388) )
))
(declare-datatypes ((array!86059 0))(
  ( (array!86060 (arr!41531 (Array (_ BitVec 32) ValueCell!16388)) (size!42083 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86059)

(declare-fun mapDefault!53420 () ValueCell!16388)

(assert (=> b!1295855 (= condMapEmpty!53420 (= (arr!41531 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16388)) mapDefault!53420)))))

(declare-fun b!1295856 () Bool)

(declare-fun res!861313 () Bool)

(assert (=> b!1295856 (=> (not res!861313) (not e!739344))))

(declare-fun mask!2175 () (_ BitVec 32))

(assert (=> b!1295856 (= res!861313 (and (= (size!42083 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42082 _keys!1741) (size!42083 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1295858 () Bool)

(assert (=> b!1295858 (= e!739347 true)))

(declare-fun lt!579839 () ListLongMap!20069)

(declare-fun minValue!1387 () V!51201)

(declare-fun +!4462 (ListLongMap!20069 tuple2!22412) ListLongMap!20069)

(assert (=> b!1295858 (not (contains!8098 (+!4462 lt!579839 (tuple2!22413 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k0!1205))))

(declare-fun lt!579841 () Unit!42768)

(declare-fun addStillNotContains!439 (ListLongMap!20069 (_ BitVec 64) V!51201 (_ BitVec 64)) Unit!42768)

(assert (=> b!1295858 (= lt!579841 (addStillNotContains!439 lt!579839 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 k0!1205))))

(declare-fun zeroValue!1387 () V!51201)

(declare-fun defaultEntry!1448 () Int)

(declare-fun getCurrentListMapNoExtraKeys!6096 (array!86057 array!86059 (_ BitVec 32) (_ BitVec 32) V!51201 V!51201 (_ BitVec 32) Int) ListLongMap!20069)

(assert (=> b!1295858 (= lt!579839 (getCurrentListMapNoExtraKeys!6096 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1295859 () Bool)

(declare-fun res!861310 () Bool)

(assert (=> b!1295859 (=> (not res!861310) (not e!739344))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86057 (_ BitVec 32)) Bool)

(assert (=> b!1295859 (= res!861310 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1295857 () Bool)

(declare-fun e!739346 () Bool)

(assert (=> b!1295857 (= e!739346 tp_is_empty!34573)))

(declare-fun res!861308 () Bool)

(assert (=> start!109444 (=> (not res!861308) (not e!739344))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109444 (= res!861308 (validMask!0 mask!2175))))

(assert (=> start!109444 e!739344))

(assert (=> start!109444 tp_is_empty!34573))

(assert (=> start!109444 true))

(declare-fun array_inv!31601 (array!86059) Bool)

(assert (=> start!109444 (and (array_inv!31601 _values!1445) e!739342)))

(declare-fun array_inv!31602 (array!86057) Bool)

(assert (=> start!109444 (array_inv!31602 _keys!1741)))

(assert (=> start!109444 tp!101918))

(declare-fun mapNonEmpty!53420 () Bool)

(declare-fun tp!101919 () Bool)

(assert (=> mapNonEmpty!53420 (= mapRes!53420 (and tp!101919 e!739346))))

(declare-fun mapValue!53420 () ValueCell!16388)

(declare-fun mapKey!53420 () (_ BitVec 32))

(declare-fun mapRest!53420 () (Array (_ BitVec 32) ValueCell!16388))

(assert (=> mapNonEmpty!53420 (= (arr!41531 _values!1445) (store mapRest!53420 mapKey!53420 mapValue!53420))))

(declare-fun b!1295860 () Bool)

(declare-fun res!861307 () Bool)

(assert (=> b!1295860 (=> (not res!861307) (not e!739344))))

(assert (=> b!1295860 (= res!861307 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42082 _keys!1741))))))

(declare-fun b!1295861 () Bool)

(declare-fun res!861315 () Bool)

(assert (=> b!1295861 (=> (not res!861315) (not e!739344))))

(declare-fun getCurrentListMap!4972 (array!86057 array!86059 (_ BitVec 32) (_ BitVec 32) V!51201 V!51201 (_ BitVec 32) Int) ListLongMap!20069)

(assert (=> b!1295861 (= res!861315 (contains!8098 (getCurrentListMap!4972 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1295862 () Bool)

(declare-fun res!861312 () Bool)

(assert (=> b!1295862 (=> (not res!861312) (not e!739344))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1295862 (= res!861312 (not (validKeyInArray!0 (select (arr!41530 _keys!1741) from!2144))))))

(assert (= (and start!109444 res!861308) b!1295856))

(assert (= (and b!1295856 res!861313) b!1295859))

(assert (= (and b!1295859 res!861310) b!1295852))

(assert (= (and b!1295852 res!861314) b!1295854))

(assert (= (and b!1295854 res!861311) b!1295861))

(assert (= (and b!1295861 res!861315) b!1295860))

(assert (= (and b!1295860 res!861307) b!1295862))

(assert (= (and b!1295862 res!861312) b!1295851))

(assert (= (and b!1295851 (not res!861309)) b!1295858))

(assert (= (and b!1295855 condMapEmpty!53420) mapIsEmpty!53420))

(assert (= (and b!1295855 (not condMapEmpty!53420)) mapNonEmpty!53420))

(get-info :version)

(assert (= (and mapNonEmpty!53420 ((_ is ValueCellFull!16388) mapValue!53420)) b!1295857))

(assert (= (and b!1295855 ((_ is ValueCellFull!16388) mapDefault!53420)) b!1295853))

(assert (= start!109444 b!1295855))

(declare-fun m!1187379 () Bool)

(assert (=> start!109444 m!1187379))

(declare-fun m!1187381 () Bool)

(assert (=> start!109444 m!1187381))

(declare-fun m!1187383 () Bool)

(assert (=> start!109444 m!1187383))

(declare-fun m!1187385 () Bool)

(assert (=> mapNonEmpty!53420 m!1187385))

(declare-fun m!1187387 () Bool)

(assert (=> b!1295851 m!1187387))

(declare-fun m!1187389 () Bool)

(assert (=> b!1295851 m!1187389))

(declare-fun m!1187391 () Bool)

(assert (=> b!1295862 m!1187391))

(assert (=> b!1295862 m!1187391))

(declare-fun m!1187393 () Bool)

(assert (=> b!1295862 m!1187393))

(declare-fun m!1187395 () Bool)

(assert (=> b!1295861 m!1187395))

(assert (=> b!1295861 m!1187395))

(declare-fun m!1187397 () Bool)

(assert (=> b!1295861 m!1187397))

(declare-fun m!1187399 () Bool)

(assert (=> b!1295852 m!1187399))

(declare-fun m!1187401 () Bool)

(assert (=> b!1295858 m!1187401))

(assert (=> b!1295858 m!1187401))

(declare-fun m!1187403 () Bool)

(assert (=> b!1295858 m!1187403))

(declare-fun m!1187405 () Bool)

(assert (=> b!1295858 m!1187405))

(declare-fun m!1187407 () Bool)

(assert (=> b!1295858 m!1187407))

(declare-fun m!1187409 () Bool)

(assert (=> b!1295859 m!1187409))

(check-sat (not b!1295859) b_and!47005 (not b!1295852) tp_is_empty!34573 (not b!1295851) (not start!109444) (not mapNonEmpty!53420) (not b_next!28933) (not b!1295858) (not b!1295861) (not b!1295862))
(check-sat b_and!47005 (not b_next!28933))
