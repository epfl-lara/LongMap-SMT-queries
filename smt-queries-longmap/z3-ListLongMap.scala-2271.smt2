; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37074 () Bool)

(assert start!37074)

(declare-fun b_free!8215 () Bool)

(declare-fun b_next!8215 () Bool)

(assert (=> start!37074 (= b_free!8215 (not b_next!8215))))

(declare-fun tp!29361 () Bool)

(declare-fun b_and!15431 () Bool)

(assert (=> start!37074 (= tp!29361 b_and!15431)))

(declare-fun b!373001 () Bool)

(declare-fun res!210086 () Bool)

(declare-fun e!227402 () Bool)

(assert (=> b!373001 (=> (not res!210086) (not e!227402))))

(declare-datatypes ((array!21647 0))(
  ( (array!21648 (arr!10292 (Array (_ BitVec 32) (_ BitVec 64))) (size!10645 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21647)

(declare-datatypes ((List!5750 0))(
  ( (Nil!5747) (Cons!5746 (h!6602 (_ BitVec 64)) (t!10891 List!5750)) )
))
(declare-fun arrayNoDuplicates!0 (array!21647 (_ BitVec 32) List!5750) Bool)

(assert (=> b!373001 (= res!210086 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5747))))

(declare-fun b!373002 () Bool)

(declare-fun res!210081 () Bool)

(assert (=> b!373002 (=> (not res!210081) (not e!227402))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((V!12923 0))(
  ( (V!12924 (val!4476 Int)) )
))
(declare-datatypes ((ValueCell!4088 0))(
  ( (ValueCellFull!4088 (v!6667 V!12923)) (EmptyCell!4088) )
))
(declare-datatypes ((array!21649 0))(
  ( (array!21650 (arr!10293 (Array (_ BitVec 32) ValueCell!4088)) (size!10646 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21649)

(declare-fun mask!970 () (_ BitVec 32))

(assert (=> b!373002 (= res!210081 (and (= (size!10646 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10645 _keys!658) (size!10646 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!373004 () Bool)

(declare-fun e!227401 () Bool)

(declare-fun e!227405 () Bool)

(declare-fun mapRes!14859 () Bool)

(assert (=> b!373004 (= e!227401 (and e!227405 mapRes!14859))))

(declare-fun condMapEmpty!14859 () Bool)

(declare-fun mapDefault!14859 () ValueCell!4088)

(assert (=> b!373004 (= condMapEmpty!14859 (= (arr!10293 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4088)) mapDefault!14859)))))

(declare-fun b!373005 () Bool)

(declare-fun res!210085 () Bool)

(assert (=> b!373005 (=> (not res!210085) (not e!227402))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!373005 (= res!210085 (or (= (select (arr!10292 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10292 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!14859 () Bool)

(assert (=> mapIsEmpty!14859 mapRes!14859))

(declare-fun b!373006 () Bool)

(declare-fun e!227406 () Bool)

(declare-fun tp_is_empty!8863 () Bool)

(assert (=> b!373006 (= e!227406 tp_is_empty!8863)))

(declare-fun b!373007 () Bool)

(declare-fun e!227403 () Bool)

(assert (=> b!373007 (= e!227402 e!227403)))

(declare-fun res!210091 () Bool)

(assert (=> b!373007 (=> (not res!210091) (not e!227403))))

(declare-fun lt!171060 () array!21647)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21647 (_ BitVec 32)) Bool)

(assert (=> b!373007 (= res!210091 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!171060 mask!970))))

(declare-fun k0!778 () (_ BitVec 64))

(assert (=> b!373007 (= lt!171060 (array!21648 (store (arr!10292 _keys!658) i!548 k0!778) (size!10645 _keys!658)))))

(declare-fun b!373008 () Bool)

(declare-fun res!210088 () Bool)

(assert (=> b!373008 (=> (not res!210088) (not e!227403))))

(assert (=> b!373008 (= res!210088 (arrayNoDuplicates!0 lt!171060 #b00000000000000000000000000000000 Nil!5747))))

(declare-fun mapNonEmpty!14859 () Bool)

(declare-fun tp!29360 () Bool)

(assert (=> mapNonEmpty!14859 (= mapRes!14859 (and tp!29360 e!227406))))

(declare-fun mapKey!14859 () (_ BitVec 32))

(declare-fun mapRest!14859 () (Array (_ BitVec 32) ValueCell!4088))

(declare-fun mapValue!14859 () ValueCell!4088)

(assert (=> mapNonEmpty!14859 (= (arr!10293 _values!506) (store mapRest!14859 mapKey!14859 mapValue!14859))))

(declare-fun b!373009 () Bool)

(declare-fun res!210083 () Bool)

(assert (=> b!373009 (=> (not res!210083) (not e!227402))))

(declare-fun arrayContainsKey!0 (array!21647 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!373009 (= res!210083 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun res!210084 () Bool)

(assert (=> start!37074 (=> (not res!210084) (not e!227402))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37074 (= res!210084 (validMask!0 mask!970))))

(assert (=> start!37074 e!227402))

(declare-fun array_inv!7594 (array!21649) Bool)

(assert (=> start!37074 (and (array_inv!7594 _values!506) e!227401)))

(assert (=> start!37074 tp!29361))

(assert (=> start!37074 true))

(assert (=> start!37074 tp_is_empty!8863))

(declare-fun array_inv!7595 (array!21647) Bool)

(assert (=> start!37074 (array_inv!7595 _keys!658)))

(declare-fun b!373003 () Bool)

(declare-fun e!227407 () Bool)

(assert (=> b!373003 (= e!227403 (not e!227407))))

(declare-fun res!210090 () Bool)

(assert (=> b!373003 (=> res!210090 e!227407)))

(assert (=> b!373003 (= res!210090 (or (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!5912 0))(
  ( (tuple2!5913 (_1!2967 (_ BitVec 64)) (_2!2967 V!12923)) )
))
(declare-datatypes ((List!5751 0))(
  ( (Nil!5748) (Cons!5747 (h!6603 tuple2!5912) (t!10892 List!5751)) )
))
(declare-datatypes ((ListLongMap!4815 0))(
  ( (ListLongMap!4816 (toList!2423 List!5751)) )
))
(declare-fun lt!171063 () ListLongMap!4815)

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!12923)

(declare-fun minValue!472 () V!12923)

(declare-fun getCurrentListMap!1846 (array!21647 array!21649 (_ BitVec 32) (_ BitVec 32) V!12923 V!12923 (_ BitVec 32) Int) ListLongMap!4815)

(assert (=> b!373003 (= lt!171063 (getCurrentListMap!1846 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!171067 () ListLongMap!4815)

(declare-fun lt!171059 () array!21649)

(assert (=> b!373003 (= lt!171067 (getCurrentListMap!1846 lt!171060 lt!171059 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!171064 () ListLongMap!4815)

(declare-fun lt!171065 () ListLongMap!4815)

(assert (=> b!373003 (and (= lt!171064 lt!171065) (= lt!171065 lt!171064))))

(declare-fun lt!171061 () ListLongMap!4815)

(declare-fun lt!171058 () tuple2!5912)

(declare-fun +!791 (ListLongMap!4815 tuple2!5912) ListLongMap!4815)

(assert (=> b!373003 (= lt!171065 (+!791 lt!171061 lt!171058))))

(declare-fun v!373 () V!12923)

(assert (=> b!373003 (= lt!171058 (tuple2!5913 k0!778 v!373))))

(declare-datatypes ((Unit!11454 0))(
  ( (Unit!11455) )
))
(declare-fun lt!171054 () Unit!11454)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!39 (array!21647 array!21649 (_ BitVec 32) (_ BitVec 32) V!12923 V!12923 (_ BitVec 32) (_ BitVec 64) V!12923 (_ BitVec 32) Int) Unit!11454)

(assert (=> b!373003 (= lt!171054 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!39 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!711 (array!21647 array!21649 (_ BitVec 32) (_ BitVec 32) V!12923 V!12923 (_ BitVec 32) Int) ListLongMap!4815)

(assert (=> b!373003 (= lt!171064 (getCurrentListMapNoExtraKeys!711 lt!171060 lt!171059 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!373003 (= lt!171059 (array!21650 (store (arr!10293 _values!506) i!548 (ValueCellFull!4088 v!373)) (size!10646 _values!506)))))

(assert (=> b!373003 (= lt!171061 (getCurrentListMapNoExtraKeys!711 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!373010 () Bool)

(declare-fun res!210092 () Bool)

(assert (=> b!373010 (=> (not res!210092) (not e!227402))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!373010 (= res!210092 (validKeyInArray!0 k0!778))))

(declare-fun b!373011 () Bool)

(declare-fun res!210089 () Bool)

(assert (=> b!373011 (=> (not res!210089) (not e!227402))))

(assert (=> b!373011 (= res!210089 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10645 _keys!658))))))

(declare-fun b!373012 () Bool)

(declare-fun e!227408 () Bool)

(assert (=> b!373012 (= e!227407 e!227408)))

(declare-fun res!210087 () Bool)

(assert (=> b!373012 (=> res!210087 e!227408)))

(assert (=> b!373012 (= res!210087 (= k0!778 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!171066 () ListLongMap!4815)

(declare-fun lt!171055 () ListLongMap!4815)

(assert (=> b!373012 (= lt!171066 lt!171055)))

(declare-fun lt!171053 () ListLongMap!4815)

(assert (=> b!373012 (= lt!171055 (+!791 lt!171053 lt!171058))))

(declare-fun lt!171062 () Unit!11454)

(declare-fun addCommutativeForDiffKeys!211 (ListLongMap!4815 (_ BitVec 64) V!12923 (_ BitVec 64) V!12923) Unit!11454)

(assert (=> b!373012 (= lt!171062 (addCommutativeForDiffKeys!211 lt!171061 k0!778 v!373 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun lt!171069 () tuple2!5912)

(assert (=> b!373012 (= lt!171067 (+!791 lt!171066 lt!171069))))

(declare-fun lt!171068 () tuple2!5912)

(assert (=> b!373012 (= lt!171066 (+!791 lt!171065 lt!171068))))

(declare-fun lt!171057 () ListLongMap!4815)

(assert (=> b!373012 (= lt!171063 lt!171057)))

(assert (=> b!373012 (= lt!171057 (+!791 lt!171053 lt!171069))))

(assert (=> b!373012 (= lt!171053 (+!791 lt!171061 lt!171068))))

(assert (=> b!373012 (= lt!171067 (+!791 (+!791 lt!171064 lt!171068) lt!171069))))

(assert (=> b!373012 (= lt!171069 (tuple2!5913 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(assert (=> b!373012 (= lt!171068 (tuple2!5913 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!373013 () Bool)

(declare-fun res!210082 () Bool)

(assert (=> b!373013 (=> (not res!210082) (not e!227402))))

(assert (=> b!373013 (= res!210082 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!373014 () Bool)

(assert (=> b!373014 (= e!227408 true)))

(assert (=> b!373014 (= (+!791 lt!171055 lt!171069) (+!791 lt!171057 lt!171058))))

(declare-fun lt!171056 () Unit!11454)

(assert (=> b!373014 (= lt!171056 (addCommutativeForDiffKeys!211 lt!171053 k0!778 v!373 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!373015 () Bool)

(assert (=> b!373015 (= e!227405 tp_is_empty!8863)))

(assert (= (and start!37074 res!210084) b!373002))

(assert (= (and b!373002 res!210081) b!373013))

(assert (= (and b!373013 res!210082) b!373001))

(assert (= (and b!373001 res!210086) b!373011))

(assert (= (and b!373011 res!210089) b!373010))

(assert (= (and b!373010 res!210092) b!373005))

(assert (= (and b!373005 res!210085) b!373009))

(assert (= (and b!373009 res!210083) b!373007))

(assert (= (and b!373007 res!210091) b!373008))

(assert (= (and b!373008 res!210088) b!373003))

(assert (= (and b!373003 (not res!210090)) b!373012))

(assert (= (and b!373012 (not res!210087)) b!373014))

(assert (= (and b!373004 condMapEmpty!14859) mapIsEmpty!14859))

(assert (= (and b!373004 (not condMapEmpty!14859)) mapNonEmpty!14859))

(get-info :version)

(assert (= (and mapNonEmpty!14859 ((_ is ValueCellFull!4088) mapValue!14859)) b!373006))

(assert (= (and b!373004 ((_ is ValueCellFull!4088) mapDefault!14859)) b!373015))

(assert (= start!37074 b!373004))

(declare-fun m!368411 () Bool)

(assert (=> b!373003 m!368411))

(declare-fun m!368413 () Bool)

(assert (=> b!373003 m!368413))

(declare-fun m!368415 () Bool)

(assert (=> b!373003 m!368415))

(declare-fun m!368417 () Bool)

(assert (=> b!373003 m!368417))

(declare-fun m!368419 () Bool)

(assert (=> b!373003 m!368419))

(declare-fun m!368421 () Bool)

(assert (=> b!373003 m!368421))

(declare-fun m!368423 () Bool)

(assert (=> b!373003 m!368423))

(declare-fun m!368425 () Bool)

(assert (=> b!373012 m!368425))

(declare-fun m!368427 () Bool)

(assert (=> b!373012 m!368427))

(declare-fun m!368429 () Bool)

(assert (=> b!373012 m!368429))

(declare-fun m!368431 () Bool)

(assert (=> b!373012 m!368431))

(declare-fun m!368433 () Bool)

(assert (=> b!373012 m!368433))

(assert (=> b!373012 m!368429))

(declare-fun m!368435 () Bool)

(assert (=> b!373012 m!368435))

(declare-fun m!368437 () Bool)

(assert (=> b!373012 m!368437))

(declare-fun m!368439 () Bool)

(assert (=> b!373012 m!368439))

(declare-fun m!368441 () Bool)

(assert (=> b!373001 m!368441))

(declare-fun m!368443 () Bool)

(assert (=> mapNonEmpty!14859 m!368443))

(declare-fun m!368445 () Bool)

(assert (=> start!37074 m!368445))

(declare-fun m!368447 () Bool)

(assert (=> start!37074 m!368447))

(declare-fun m!368449 () Bool)

(assert (=> start!37074 m!368449))

(declare-fun m!368451 () Bool)

(assert (=> b!373005 m!368451))

(declare-fun m!368453 () Bool)

(assert (=> b!373010 m!368453))

(declare-fun m!368455 () Bool)

(assert (=> b!373014 m!368455))

(declare-fun m!368457 () Bool)

(assert (=> b!373014 m!368457))

(declare-fun m!368459 () Bool)

(assert (=> b!373014 m!368459))

(declare-fun m!368461 () Bool)

(assert (=> b!373009 m!368461))

(declare-fun m!368463 () Bool)

(assert (=> b!373007 m!368463))

(declare-fun m!368465 () Bool)

(assert (=> b!373007 m!368465))

(declare-fun m!368467 () Bool)

(assert (=> b!373008 m!368467))

(declare-fun m!368469 () Bool)

(assert (=> b!373013 m!368469))

(check-sat (not b!373001) (not b!373014) (not b!373008) (not mapNonEmpty!14859) (not b!373009) (not b!373007) (not b!373013) (not b!373012) (not b_next!8215) tp_is_empty!8863 b_and!15431 (not start!37074) (not b!373010) (not b!373003))
(check-sat b_and!15431 (not b_next!8215))
