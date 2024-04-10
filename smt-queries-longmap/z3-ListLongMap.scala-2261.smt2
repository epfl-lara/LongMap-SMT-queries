; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37030 () Bool)

(assert start!37030)

(declare-fun b_free!8157 () Bool)

(declare-fun b_next!8157 () Bool)

(assert (=> start!37030 (= b_free!8157 (not b_next!8157))))

(declare-fun tp!29187 () Bool)

(declare-fun b_and!15399 () Bool)

(assert (=> start!37030 (= tp!29187 b_and!15399)))

(declare-fun b!372101 () Bool)

(declare-fun res!209306 () Bool)

(declare-fun e!227025 () Bool)

(assert (=> b!372101 (=> (not res!209306) (not e!227025))))

(declare-datatypes ((V!12845 0))(
  ( (V!12846 (val!4447 Int)) )
))
(declare-datatypes ((ValueCell!4059 0))(
  ( (ValueCellFull!4059 (v!6644 V!12845)) (EmptyCell!4059) )
))
(declare-datatypes ((array!21551 0))(
  ( (array!21552 (arr!10244 (Array (_ BitVec 32) ValueCell!4059)) (size!10596 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21551)

(declare-datatypes ((array!21553 0))(
  ( (array!21554 (arr!10245 (Array (_ BitVec 32) (_ BitVec 64))) (size!10597 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21553)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!372101 (= res!209306 (and (= (size!10596 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10597 _keys!658) (size!10596 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!372102 () Bool)

(declare-fun res!209305 () Bool)

(assert (=> b!372102 (=> (not res!209305) (not e!227025))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21553 (_ BitVec 32)) Bool)

(assert (=> b!372102 (= res!209305 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!372103 () Bool)

(declare-fun res!209302 () Bool)

(assert (=> b!372103 (=> (not res!209302) (not e!227025))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!21553 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!372103 (= res!209302 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!372104 () Bool)

(declare-fun e!227022 () Bool)

(declare-fun tp_is_empty!8805 () Bool)

(assert (=> b!372104 (= e!227022 tp_is_empty!8805)))

(declare-fun b!372105 () Bool)

(declare-fun res!209304 () Bool)

(assert (=> b!372105 (=> (not res!209304) (not e!227025))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!372105 (= res!209304 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10597 _keys!658))))))

(declare-fun b!372106 () Bool)

(declare-fun e!227024 () Bool)

(assert (=> b!372106 (= e!227024 (not true))))

(declare-datatypes ((tuple2!5900 0))(
  ( (tuple2!5901 (_1!2961 (_ BitVec 64)) (_2!2961 V!12845)) )
))
(declare-datatypes ((List!5743 0))(
  ( (Nil!5740) (Cons!5739 (h!6595 tuple2!5900) (t!10893 List!5743)) )
))
(declare-datatypes ((ListLongMap!4813 0))(
  ( (ListLongMap!4814 (toList!2422 List!5743)) )
))
(declare-fun lt!170574 () ListLongMap!4813)

(declare-fun defaultEntry!514 () Int)

(declare-fun lt!170573 () array!21553)

(declare-fun zeroValue!472 () V!12845)

(declare-fun lt!170570 () array!21551)

(declare-fun minValue!472 () V!12845)

(declare-fun getCurrentListMap!1865 (array!21553 array!21551 (_ BitVec 32) (_ BitVec 32) V!12845 V!12845 (_ BitVec 32) Int) ListLongMap!4813)

(assert (=> b!372106 (= lt!170574 (getCurrentListMap!1865 lt!170573 lt!170570 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!170572 () ListLongMap!4813)

(declare-fun lt!170571 () ListLongMap!4813)

(assert (=> b!372106 (and (= lt!170572 lt!170571) (= lt!170571 lt!170572))))

(declare-fun v!373 () V!12845)

(declare-fun lt!170568 () ListLongMap!4813)

(declare-fun +!768 (ListLongMap!4813 tuple2!5900) ListLongMap!4813)

(assert (=> b!372106 (= lt!170571 (+!768 lt!170568 (tuple2!5901 k0!778 v!373)))))

(declare-datatypes ((Unit!11442 0))(
  ( (Unit!11443) )
))
(declare-fun lt!170569 () Unit!11442)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!23 (array!21553 array!21551 (_ BitVec 32) (_ BitVec 32) V!12845 V!12845 (_ BitVec 32) (_ BitVec 64) V!12845 (_ BitVec 32) Int) Unit!11442)

(assert (=> b!372106 (= lt!170569 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!23 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!699 (array!21553 array!21551 (_ BitVec 32) (_ BitVec 32) V!12845 V!12845 (_ BitVec 32) Int) ListLongMap!4813)

(assert (=> b!372106 (= lt!170572 (getCurrentListMapNoExtraKeys!699 lt!170573 lt!170570 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!372106 (= lt!170570 (array!21552 (store (arr!10244 _values!506) i!548 (ValueCellFull!4059 v!373)) (size!10596 _values!506)))))

(assert (=> b!372106 (= lt!170568 (getCurrentListMapNoExtraKeys!699 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!372108 () Bool)

(declare-fun res!209300 () Bool)

(assert (=> b!372108 (=> (not res!209300) (not e!227025))))

(assert (=> b!372108 (= res!209300 (or (= (select (arr!10245 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10245 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!372109 () Bool)

(declare-fun e!227026 () Bool)

(assert (=> b!372109 (= e!227026 tp_is_empty!8805)))

(declare-fun b!372110 () Bool)

(declare-fun res!209308 () Bool)

(assert (=> b!372110 (=> (not res!209308) (not e!227024))))

(declare-datatypes ((List!5744 0))(
  ( (Nil!5741) (Cons!5740 (h!6596 (_ BitVec 64)) (t!10894 List!5744)) )
))
(declare-fun arrayNoDuplicates!0 (array!21553 (_ BitVec 32) List!5744) Bool)

(assert (=> b!372110 (= res!209308 (arrayNoDuplicates!0 lt!170573 #b00000000000000000000000000000000 Nil!5741))))

(declare-fun mapIsEmpty!14772 () Bool)

(declare-fun mapRes!14772 () Bool)

(assert (=> mapIsEmpty!14772 mapRes!14772))

(declare-fun b!372111 () Bool)

(assert (=> b!372111 (= e!227025 e!227024)))

(declare-fun res!209303 () Bool)

(assert (=> b!372111 (=> (not res!209303) (not e!227024))))

(assert (=> b!372111 (= res!209303 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!170573 mask!970))))

(assert (=> b!372111 (= lt!170573 (array!21554 (store (arr!10245 _keys!658) i!548 k0!778) (size!10597 _keys!658)))))

(declare-fun b!372112 () Bool)

(declare-fun res!209309 () Bool)

(assert (=> b!372112 (=> (not res!209309) (not e!227025))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!372112 (= res!209309 (validKeyInArray!0 k0!778))))

(declare-fun b!372113 () Bool)

(declare-fun e!227023 () Bool)

(assert (=> b!372113 (= e!227023 (and e!227022 mapRes!14772))))

(declare-fun condMapEmpty!14772 () Bool)

(declare-fun mapDefault!14772 () ValueCell!4059)

(assert (=> b!372113 (= condMapEmpty!14772 (= (arr!10244 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4059)) mapDefault!14772)))))

(declare-fun mapNonEmpty!14772 () Bool)

(declare-fun tp!29186 () Bool)

(assert (=> mapNonEmpty!14772 (= mapRes!14772 (and tp!29186 e!227026))))

(declare-fun mapValue!14772 () ValueCell!4059)

(declare-fun mapKey!14772 () (_ BitVec 32))

(declare-fun mapRest!14772 () (Array (_ BitVec 32) ValueCell!4059))

(assert (=> mapNonEmpty!14772 (= (arr!10244 _values!506) (store mapRest!14772 mapKey!14772 mapValue!14772))))

(declare-fun b!372107 () Bool)

(declare-fun res!209301 () Bool)

(assert (=> b!372107 (=> (not res!209301) (not e!227025))))

(assert (=> b!372107 (= res!209301 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5741))))

(declare-fun res!209307 () Bool)

(assert (=> start!37030 (=> (not res!209307) (not e!227025))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37030 (= res!209307 (validMask!0 mask!970))))

(assert (=> start!37030 e!227025))

(declare-fun array_inv!7558 (array!21551) Bool)

(assert (=> start!37030 (and (array_inv!7558 _values!506) e!227023)))

(assert (=> start!37030 tp!29187))

(assert (=> start!37030 true))

(assert (=> start!37030 tp_is_empty!8805))

(declare-fun array_inv!7559 (array!21553) Bool)

(assert (=> start!37030 (array_inv!7559 _keys!658)))

(assert (= (and start!37030 res!209307) b!372101))

(assert (= (and b!372101 res!209306) b!372102))

(assert (= (and b!372102 res!209305) b!372107))

(assert (= (and b!372107 res!209301) b!372105))

(assert (= (and b!372105 res!209304) b!372112))

(assert (= (and b!372112 res!209309) b!372108))

(assert (= (and b!372108 res!209300) b!372103))

(assert (= (and b!372103 res!209302) b!372111))

(assert (= (and b!372111 res!209303) b!372110))

(assert (= (and b!372110 res!209308) b!372106))

(assert (= (and b!372113 condMapEmpty!14772) mapIsEmpty!14772))

(assert (= (and b!372113 (not condMapEmpty!14772)) mapNonEmpty!14772))

(get-info :version)

(assert (= (and mapNonEmpty!14772 ((_ is ValueCellFull!4059) mapValue!14772)) b!372109))

(assert (= (and b!372113 ((_ is ValueCellFull!4059) mapDefault!14772)) b!372104))

(assert (= start!37030 b!372113))

(declare-fun m!367995 () Bool)

(assert (=> b!372103 m!367995))

(declare-fun m!367997 () Bool)

(assert (=> b!372107 m!367997))

(declare-fun m!367999 () Bool)

(assert (=> b!372111 m!367999))

(declare-fun m!368001 () Bool)

(assert (=> b!372111 m!368001))

(declare-fun m!368003 () Bool)

(assert (=> b!372108 m!368003))

(declare-fun m!368005 () Bool)

(assert (=> b!372106 m!368005))

(declare-fun m!368007 () Bool)

(assert (=> b!372106 m!368007))

(declare-fun m!368009 () Bool)

(assert (=> b!372106 m!368009))

(declare-fun m!368011 () Bool)

(assert (=> b!372106 m!368011))

(declare-fun m!368013 () Bool)

(assert (=> b!372106 m!368013))

(declare-fun m!368015 () Bool)

(assert (=> b!372106 m!368015))

(declare-fun m!368017 () Bool)

(assert (=> b!372112 m!368017))

(declare-fun m!368019 () Bool)

(assert (=> b!372110 m!368019))

(declare-fun m!368021 () Bool)

(assert (=> b!372102 m!368021))

(declare-fun m!368023 () Bool)

(assert (=> start!37030 m!368023))

(declare-fun m!368025 () Bool)

(assert (=> start!37030 m!368025))

(declare-fun m!368027 () Bool)

(assert (=> start!37030 m!368027))

(declare-fun m!368029 () Bool)

(assert (=> mapNonEmpty!14772 m!368029))

(check-sat (not b!372111) (not b!372103) b_and!15399 (not b!372106) tp_is_empty!8805 (not b!372107) (not b!372110) (not b!372112) (not b_next!8157) (not b!372102) (not mapNonEmpty!14772) (not start!37030))
(check-sat b_and!15399 (not b_next!8157))
