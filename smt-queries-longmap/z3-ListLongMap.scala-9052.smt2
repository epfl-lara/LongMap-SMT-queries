; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109098 () Bool)

(assert start!109098)

(declare-fun b_free!28587 () Bool)

(declare-fun b_next!28587 () Bool)

(assert (=> start!109098 (= b_free!28587 (not b_next!28587))))

(declare-fun tp!100880 () Bool)

(declare-fun b_and!46677 () Bool)

(assert (=> start!109098 (= tp!100880 b_and!46677)))

(declare-fun b!1289849 () Bool)

(declare-fun e!736420 () Bool)

(assert (=> b!1289849 (= e!736420 true)))

(declare-datatypes ((V!50739 0))(
  ( (V!50740 (val!17188 Int)) )
))
(declare-datatypes ((tuple2!22080 0))(
  ( (tuple2!22081 (_1!11051 (_ BitVec 64)) (_2!11051 V!50739)) )
))
(declare-datatypes ((List!29248 0))(
  ( (Nil!29245) (Cons!29244 (h!30453 tuple2!22080) (t!42812 List!29248)) )
))
(declare-datatypes ((ListLongMap!19737 0))(
  ( (ListLongMap!19738 (toList!9884 List!29248)) )
))
(declare-fun lt!578393 () ListLongMap!19737)

(declare-fun minValue!1387 () V!50739)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun contains!8002 (ListLongMap!19737 (_ BitVec 64)) Bool)

(declare-fun +!4354 (ListLongMap!19737 tuple2!22080) ListLongMap!19737)

(assert (=> b!1289849 (not (contains!8002 (+!4354 lt!578393 (tuple2!22081 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k0!1205))))

(declare-datatypes ((Unit!42684 0))(
  ( (Unit!42685) )
))
(declare-fun lt!578395 () Unit!42684)

(declare-fun addStillNotContains!372 (ListLongMap!19737 (_ BitVec 64) V!50739 (_ BitVec 64)) Unit!42684)

(assert (=> b!1289849 (= lt!578395 (addStillNotContains!372 lt!578393 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 k0!1205))))

(declare-fun zeroValue!1387 () V!50739)

(assert (=> b!1289849 (not (contains!8002 (+!4354 lt!578393 (tuple2!22081 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) k0!1205))))

(declare-fun lt!578396 () Unit!42684)

(assert (=> b!1289849 (= lt!578396 (addStillNotContains!372 lt!578393 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k0!1205))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((ValueCell!16215 0))(
  ( (ValueCellFull!16215 (v!19791 V!50739)) (EmptyCell!16215) )
))
(declare-datatypes ((array!85496 0))(
  ( (array!85497 (arr!41249 (Array (_ BitVec 32) ValueCell!16215)) (size!41799 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85496)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!85498 0))(
  ( (array!85499 (arr!41250 (Array (_ BitVec 32) (_ BitVec 64))) (size!41800 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85498)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!5985 (array!85498 array!85496 (_ BitVec 32) (_ BitVec 32) V!50739 V!50739 (_ BitVec 32) Int) ListLongMap!19737)

(assert (=> b!1289849 (= lt!578393 (getCurrentListMapNoExtraKeys!5985 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun mapIsEmpty!52901 () Bool)

(declare-fun mapRes!52901 () Bool)

(assert (=> mapIsEmpty!52901 mapRes!52901))

(declare-fun b!1289850 () Bool)

(declare-fun res!856829 () Bool)

(declare-fun e!736421 () Bool)

(assert (=> b!1289850 (=> (not res!856829) (not e!736421))))

(assert (=> b!1289850 (= res!856829 (and (= (size!41799 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41800 _keys!1741) (size!41799 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1289851 () Bool)

(declare-fun res!856832 () Bool)

(assert (=> b!1289851 (=> (not res!856832) (not e!736421))))

(declare-datatypes ((List!29249 0))(
  ( (Nil!29246) (Cons!29245 (h!30454 (_ BitVec 64)) (t!42813 List!29249)) )
))
(declare-fun arrayNoDuplicates!0 (array!85498 (_ BitVec 32) List!29249) Bool)

(assert (=> b!1289851 (= res!856832 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29246))))

(declare-fun b!1289852 () Bool)

(declare-fun res!856833 () Bool)

(assert (=> b!1289852 (=> (not res!856833) (not e!736421))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1289852 (= res!856833 (not (validKeyInArray!0 (select (arr!41250 _keys!1741) from!2144))))))

(declare-fun mapNonEmpty!52901 () Bool)

(declare-fun tp!100879 () Bool)

(declare-fun e!736419 () Bool)

(assert (=> mapNonEmpty!52901 (= mapRes!52901 (and tp!100879 e!736419))))

(declare-fun mapValue!52901 () ValueCell!16215)

(declare-fun mapRest!52901 () (Array (_ BitVec 32) ValueCell!16215))

(declare-fun mapKey!52901 () (_ BitVec 32))

(assert (=> mapNonEmpty!52901 (= (arr!41249 _values!1445) (store mapRest!52901 mapKey!52901 mapValue!52901))))

(declare-fun b!1289853 () Bool)

(declare-fun res!856830 () Bool)

(assert (=> b!1289853 (=> (not res!856830) (not e!736421))))

(assert (=> b!1289853 (= res!856830 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41800 _keys!1741))))))

(declare-fun res!856826 () Bool)

(assert (=> start!109098 (=> (not res!856826) (not e!736421))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109098 (= res!856826 (validMask!0 mask!2175))))

(assert (=> start!109098 e!736421))

(declare-fun tp_is_empty!34227 () Bool)

(assert (=> start!109098 tp_is_empty!34227))

(assert (=> start!109098 true))

(declare-fun e!736423 () Bool)

(declare-fun array_inv!31265 (array!85496) Bool)

(assert (=> start!109098 (and (array_inv!31265 _values!1445) e!736423)))

(declare-fun array_inv!31266 (array!85498) Bool)

(assert (=> start!109098 (array_inv!31266 _keys!1741)))

(assert (=> start!109098 tp!100880))

(declare-fun b!1289854 () Bool)

(declare-fun e!736422 () Bool)

(assert (=> b!1289854 (= e!736423 (and e!736422 mapRes!52901))))

(declare-fun condMapEmpty!52901 () Bool)

(declare-fun mapDefault!52901 () ValueCell!16215)

(assert (=> b!1289854 (= condMapEmpty!52901 (= (arr!41249 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16215)) mapDefault!52901)))))

(declare-fun b!1289855 () Bool)

(declare-fun res!856831 () Bool)

(assert (=> b!1289855 (=> (not res!856831) (not e!736421))))

(assert (=> b!1289855 (= res!856831 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41800 _keys!1741))))))

(declare-fun b!1289856 () Bool)

(assert (=> b!1289856 (= e!736419 tp_is_empty!34227)))

(declare-fun b!1289857 () Bool)

(assert (=> b!1289857 (= e!736422 tp_is_empty!34227)))

(declare-fun b!1289858 () Bool)

(assert (=> b!1289858 (= e!736421 (not e!736420))))

(declare-fun res!856828 () Bool)

(assert (=> b!1289858 (=> res!856828 e!736420)))

(assert (=> b!1289858 (= res!856828 (or (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1289858 (not (contains!8002 (ListLongMap!19738 Nil!29245) k0!1205))))

(declare-fun lt!578394 () Unit!42684)

(declare-fun emptyContainsNothing!70 ((_ BitVec 64)) Unit!42684)

(assert (=> b!1289858 (= lt!578394 (emptyContainsNothing!70 k0!1205))))

(declare-fun b!1289859 () Bool)

(declare-fun res!856827 () Bool)

(assert (=> b!1289859 (=> (not res!856827) (not e!736421))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85498 (_ BitVec 32)) Bool)

(assert (=> b!1289859 (= res!856827 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1289860 () Bool)

(declare-fun res!856825 () Bool)

(assert (=> b!1289860 (=> (not res!856825) (not e!736421))))

(declare-fun getCurrentListMap!4944 (array!85498 array!85496 (_ BitVec 32) (_ BitVec 32) V!50739 V!50739 (_ BitVec 32) Int) ListLongMap!19737)

(assert (=> b!1289860 (= res!856825 (contains!8002 (getCurrentListMap!4944 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(assert (= (and start!109098 res!856826) b!1289850))

(assert (= (and b!1289850 res!856829) b!1289859))

(assert (= (and b!1289859 res!856827) b!1289851))

(assert (= (and b!1289851 res!856832) b!1289853))

(assert (= (and b!1289853 res!856830) b!1289860))

(assert (= (and b!1289860 res!856825) b!1289855))

(assert (= (and b!1289855 res!856831) b!1289852))

(assert (= (and b!1289852 res!856833) b!1289858))

(assert (= (and b!1289858 (not res!856828)) b!1289849))

(assert (= (and b!1289854 condMapEmpty!52901) mapIsEmpty!52901))

(assert (= (and b!1289854 (not condMapEmpty!52901)) mapNonEmpty!52901))

(get-info :version)

(assert (= (and mapNonEmpty!52901 ((_ is ValueCellFull!16215) mapValue!52901)) b!1289856))

(assert (= (and b!1289854 ((_ is ValueCellFull!16215) mapDefault!52901)) b!1289857))

(assert (= start!109098 b!1289854))

(declare-fun m!1182391 () Bool)

(assert (=> b!1289849 m!1182391))

(declare-fun m!1182393 () Bool)

(assert (=> b!1289849 m!1182393))

(assert (=> b!1289849 m!1182391))

(declare-fun m!1182395 () Bool)

(assert (=> b!1289849 m!1182395))

(declare-fun m!1182397 () Bool)

(assert (=> b!1289849 m!1182397))

(declare-fun m!1182399 () Bool)

(assert (=> b!1289849 m!1182399))

(declare-fun m!1182401 () Bool)

(assert (=> b!1289849 m!1182401))

(declare-fun m!1182403 () Bool)

(assert (=> b!1289849 m!1182403))

(assert (=> b!1289849 m!1182397))

(declare-fun m!1182405 () Bool)

(assert (=> mapNonEmpty!52901 m!1182405))

(declare-fun m!1182407 () Bool)

(assert (=> b!1289860 m!1182407))

(assert (=> b!1289860 m!1182407))

(declare-fun m!1182409 () Bool)

(assert (=> b!1289860 m!1182409))

(declare-fun m!1182411 () Bool)

(assert (=> b!1289852 m!1182411))

(assert (=> b!1289852 m!1182411))

(declare-fun m!1182413 () Bool)

(assert (=> b!1289852 m!1182413))

(declare-fun m!1182415 () Bool)

(assert (=> b!1289851 m!1182415))

(declare-fun m!1182417 () Bool)

(assert (=> start!109098 m!1182417))

(declare-fun m!1182419 () Bool)

(assert (=> start!109098 m!1182419))

(declare-fun m!1182421 () Bool)

(assert (=> start!109098 m!1182421))

(declare-fun m!1182423 () Bool)

(assert (=> b!1289859 m!1182423))

(declare-fun m!1182425 () Bool)

(assert (=> b!1289858 m!1182425))

(declare-fun m!1182427 () Bool)

(assert (=> b!1289858 m!1182427))

(check-sat (not start!109098) (not b!1289851) (not b!1289858) (not b!1289852) b_and!46677 (not b!1289849) tp_is_empty!34227 (not b!1289860) (not b!1289859) (not b_next!28587) (not mapNonEmpty!52901))
(check-sat b_and!46677 (not b_next!28587))
