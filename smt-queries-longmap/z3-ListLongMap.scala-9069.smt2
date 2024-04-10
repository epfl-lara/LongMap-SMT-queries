; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109200 () Bool)

(assert start!109200)

(declare-fun b_free!28689 () Bool)

(declare-fun b_next!28689 () Bool)

(assert (=> start!109200 (= b_free!28689 (not b_next!28689))))

(declare-fun tp!101186 () Bool)

(declare-fun b_and!46779 () Bool)

(assert (=> start!109200 (= tp!101186 b_and!46779)))

(declare-fun b!1291685 () Bool)

(declare-fun res!858202 () Bool)

(declare-fun e!737341 () Bool)

(assert (=> b!1291685 (=> (not res!858202) (not e!737341))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((V!50875 0))(
  ( (V!50876 (val!17239 Int)) )
))
(declare-datatypes ((ValueCell!16266 0))(
  ( (ValueCellFull!16266 (v!19842 V!50875)) (EmptyCell!16266) )
))
(declare-datatypes ((array!85694 0))(
  ( (array!85695 (arr!41348 (Array (_ BitVec 32) ValueCell!16266)) (size!41898 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85694)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!85696 0))(
  ( (array!85697 (arr!41349 (Array (_ BitVec 32) (_ BitVec 64))) (size!41899 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85696)

(assert (=> b!1291685 (= res!858202 (and (= (size!41898 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41899 _keys!1741) (size!41898 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!53054 () Bool)

(declare-fun mapRes!53054 () Bool)

(declare-fun tp!101185 () Bool)

(declare-fun e!737337 () Bool)

(assert (=> mapNonEmpty!53054 (= mapRes!53054 (and tp!101185 e!737337))))

(declare-fun mapValue!53054 () ValueCell!16266)

(declare-fun mapRest!53054 () (Array (_ BitVec 32) ValueCell!16266))

(declare-fun mapKey!53054 () (_ BitVec 32))

(assert (=> mapNonEmpty!53054 (= (arr!41348 _values!1445) (store mapRest!53054 mapKey!53054 mapValue!53054))))

(declare-fun b!1291686 () Bool)

(declare-fun tp_is_empty!34329 () Bool)

(assert (=> b!1291686 (= e!737337 tp_is_empty!34329)))

(declare-fun res!858206 () Bool)

(assert (=> start!109200 (=> (not res!858206) (not e!737341))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109200 (= res!858206 (validMask!0 mask!2175))))

(assert (=> start!109200 e!737341))

(assert (=> start!109200 tp_is_empty!34329))

(assert (=> start!109200 true))

(declare-fun e!737339 () Bool)

(declare-fun array_inv!31329 (array!85694) Bool)

(assert (=> start!109200 (and (array_inv!31329 _values!1445) e!737339)))

(declare-fun array_inv!31330 (array!85696) Bool)

(assert (=> start!109200 (array_inv!31330 _keys!1741)))

(assert (=> start!109200 tp!101186))

(declare-fun b!1291687 () Bool)

(declare-fun res!858205 () Bool)

(assert (=> b!1291687 (=> (not res!858205) (not e!737341))))

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1291687 (= res!858205 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41899 _keys!1741))))))

(declare-fun b!1291688 () Bool)

(declare-fun res!858210 () Bool)

(assert (=> b!1291688 (=> (not res!858210) (not e!737341))))

(declare-fun k0!1205 () (_ BitVec 64))

(assert (=> b!1291688 (= res!858210 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41899 _keys!1741))))))

(declare-fun b!1291689 () Bool)

(declare-fun e!737338 () Bool)

(assert (=> b!1291689 (= e!737338 true)))

(assert (=> b!1291689 false))

(declare-fun minValue!1387 () V!50875)

(declare-datatypes ((Unit!42768 0))(
  ( (Unit!42769) )
))
(declare-fun lt!579251 () Unit!42768)

(declare-datatypes ((tuple2!22170 0))(
  ( (tuple2!22171 (_1!11096 (_ BitVec 64)) (_2!11096 V!50875)) )
))
(declare-datatypes ((List!29325 0))(
  ( (Nil!29322) (Cons!29321 (h!30530 tuple2!22170) (t!42889 List!29325)) )
))
(declare-datatypes ((ListLongMap!19827 0))(
  ( (ListLongMap!19828 (toList!9929 List!29325)) )
))
(declare-fun lt!579254 () ListLongMap!19827)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!65 ((_ BitVec 64) (_ BitVec 64) V!50875 ListLongMap!19827) Unit!42768)

(assert (=> b!1291689 (= lt!579251 (lemmaInListMapAfterAddingDiffThenInBefore!65 k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 lt!579254))))

(declare-fun lt!579252 () ListLongMap!19827)

(declare-fun contains!8047 (ListLongMap!19827 (_ BitVec 64)) Bool)

(declare-fun +!4391 (ListLongMap!19827 tuple2!22170) ListLongMap!19827)

(assert (=> b!1291689 (not (contains!8047 (+!4391 lt!579252 (tuple2!22171 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k0!1205))))

(declare-fun lt!579253 () Unit!42768)

(declare-fun addStillNotContains!409 (ListLongMap!19827 (_ BitVec 64) V!50875 (_ BitVec 64)) Unit!42768)

(assert (=> b!1291689 (= lt!579253 (addStillNotContains!409 lt!579252 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 k0!1205))))

(assert (=> b!1291689 (not (contains!8047 lt!579254 k0!1205))))

(declare-fun zeroValue!1387 () V!50875)

(assert (=> b!1291689 (= lt!579254 (+!4391 lt!579252 (tuple2!22171 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(declare-fun lt!579249 () Unit!42768)

(assert (=> b!1291689 (= lt!579249 (addStillNotContains!409 lt!579252 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k0!1205))))

(declare-fun defaultEntry!1448 () Int)

(declare-fun getCurrentListMapNoExtraKeys!6022 (array!85696 array!85694 (_ BitVec 32) (_ BitVec 32) V!50875 V!50875 (_ BitVec 32) Int) ListLongMap!19827)

(assert (=> b!1291689 (= lt!579252 (getCurrentListMapNoExtraKeys!6022 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1291690 () Bool)

(declare-fun res!858204 () Bool)

(assert (=> b!1291690 (=> (not res!858204) (not e!737341))))

(declare-fun getCurrentListMap!4977 (array!85696 array!85694 (_ BitVec 32) (_ BitVec 32) V!50875 V!50875 (_ BitVec 32) Int) ListLongMap!19827)

(assert (=> b!1291690 (= res!858204 (contains!8047 (getCurrentListMap!4977 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun mapIsEmpty!53054 () Bool)

(assert (=> mapIsEmpty!53054 mapRes!53054))

(declare-fun b!1291691 () Bool)

(declare-fun res!858203 () Bool)

(assert (=> b!1291691 (=> (not res!858203) (not e!737341))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85696 (_ BitVec 32)) Bool)

(assert (=> b!1291691 (= res!858203 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1291692 () Bool)

(declare-fun e!737340 () Bool)

(assert (=> b!1291692 (= e!737339 (and e!737340 mapRes!53054))))

(declare-fun condMapEmpty!53054 () Bool)

(declare-fun mapDefault!53054 () ValueCell!16266)

(assert (=> b!1291692 (= condMapEmpty!53054 (= (arr!41348 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16266)) mapDefault!53054)))))

(declare-fun b!1291693 () Bool)

(declare-fun res!858207 () Bool)

(assert (=> b!1291693 (=> (not res!858207) (not e!737341))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1291693 (= res!858207 (not (validKeyInArray!0 (select (arr!41349 _keys!1741) from!2144))))))

(declare-fun b!1291694 () Bool)

(assert (=> b!1291694 (= e!737341 (not e!737338))))

(declare-fun res!858209 () Bool)

(assert (=> b!1291694 (=> res!858209 e!737338)))

(assert (=> b!1291694 (= res!858209 (or (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1291694 (not (contains!8047 (ListLongMap!19828 Nil!29322) k0!1205))))

(declare-fun lt!579250 () Unit!42768)

(declare-fun emptyContainsNothing!106 ((_ BitVec 64)) Unit!42768)

(assert (=> b!1291694 (= lt!579250 (emptyContainsNothing!106 k0!1205))))

(declare-fun b!1291695 () Bool)

(assert (=> b!1291695 (= e!737340 tp_is_empty!34329)))

(declare-fun b!1291696 () Bool)

(declare-fun res!858208 () Bool)

(assert (=> b!1291696 (=> (not res!858208) (not e!737341))))

(declare-datatypes ((List!29326 0))(
  ( (Nil!29323) (Cons!29322 (h!30531 (_ BitVec 64)) (t!42890 List!29326)) )
))
(declare-fun arrayNoDuplicates!0 (array!85696 (_ BitVec 32) List!29326) Bool)

(assert (=> b!1291696 (= res!858208 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29323))))

(assert (= (and start!109200 res!858206) b!1291685))

(assert (= (and b!1291685 res!858202) b!1291691))

(assert (= (and b!1291691 res!858203) b!1291696))

(assert (= (and b!1291696 res!858208) b!1291687))

(assert (= (and b!1291687 res!858205) b!1291690))

(assert (= (and b!1291690 res!858204) b!1291688))

(assert (= (and b!1291688 res!858210) b!1291693))

(assert (= (and b!1291693 res!858207) b!1291694))

(assert (= (and b!1291694 (not res!858209)) b!1291689))

(assert (= (and b!1291692 condMapEmpty!53054) mapIsEmpty!53054))

(assert (= (and b!1291692 (not condMapEmpty!53054)) mapNonEmpty!53054))

(get-info :version)

(assert (= (and mapNonEmpty!53054 ((_ is ValueCellFull!16266) mapValue!53054)) b!1291686))

(assert (= (and b!1291692 ((_ is ValueCellFull!16266) mapDefault!53054)) b!1291695))

(assert (= start!109200 b!1291692))

(declare-fun m!1184415 () Bool)

(assert (=> start!109200 m!1184415))

(declare-fun m!1184417 () Bool)

(assert (=> start!109200 m!1184417))

(declare-fun m!1184419 () Bool)

(assert (=> start!109200 m!1184419))

(declare-fun m!1184421 () Bool)

(assert (=> mapNonEmpty!53054 m!1184421))

(declare-fun m!1184423 () Bool)

(assert (=> b!1291696 m!1184423))

(declare-fun m!1184425 () Bool)

(assert (=> b!1291694 m!1184425))

(declare-fun m!1184427 () Bool)

(assert (=> b!1291694 m!1184427))

(declare-fun m!1184429 () Bool)

(assert (=> b!1291693 m!1184429))

(assert (=> b!1291693 m!1184429))

(declare-fun m!1184431 () Bool)

(assert (=> b!1291693 m!1184431))

(declare-fun m!1184433 () Bool)

(assert (=> b!1291691 m!1184433))

(declare-fun m!1184435 () Bool)

(assert (=> b!1291689 m!1184435))

(declare-fun m!1184437 () Bool)

(assert (=> b!1291689 m!1184437))

(declare-fun m!1184439 () Bool)

(assert (=> b!1291689 m!1184439))

(declare-fun m!1184441 () Bool)

(assert (=> b!1291689 m!1184441))

(declare-fun m!1184443 () Bool)

(assert (=> b!1291689 m!1184443))

(assert (=> b!1291689 m!1184435))

(declare-fun m!1184445 () Bool)

(assert (=> b!1291689 m!1184445))

(declare-fun m!1184447 () Bool)

(assert (=> b!1291689 m!1184447))

(declare-fun m!1184449 () Bool)

(assert (=> b!1291689 m!1184449))

(declare-fun m!1184451 () Bool)

(assert (=> b!1291690 m!1184451))

(assert (=> b!1291690 m!1184451))

(declare-fun m!1184453 () Bool)

(assert (=> b!1291690 m!1184453))

(check-sat (not b!1291693) (not b!1291689) (not b!1291694) tp_is_empty!34329 (not b!1291690) (not mapNonEmpty!53054) b_and!46779 (not b!1291696) (not b!1291691) (not start!109200) (not b_next!28689))
(check-sat b_and!46779 (not b_next!28689))
