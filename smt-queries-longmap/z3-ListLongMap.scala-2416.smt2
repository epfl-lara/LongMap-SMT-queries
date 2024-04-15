; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38210 () Bool)

(assert start!38210)

(declare-fun b_free!9061 () Bool)

(declare-fun b_next!9061 () Bool)

(assert (=> start!38210 (= b_free!9061 (not b_next!9061))))

(declare-fun tp!31971 () Bool)

(declare-fun b_and!16421 () Bool)

(assert (=> start!38210 (= tp!31971 b_and!16421)))

(declare-fun b!393966 () Bool)

(declare-fun e!238486 () Bool)

(declare-fun tp_is_empty!9733 () Bool)

(assert (=> b!393966 (= e!238486 tp_is_empty!9733)))

(declare-fun b!393967 () Bool)

(declare-fun e!238490 () Bool)

(assert (=> b!393967 (= e!238490 true)))

(declare-datatypes ((V!14083 0))(
  ( (V!14084 (val!4911 Int)) )
))
(declare-datatypes ((tuple2!6598 0))(
  ( (tuple2!6599 (_1!3310 (_ BitVec 64)) (_2!3310 V!14083)) )
))
(declare-datatypes ((List!6440 0))(
  ( (Nil!6437) (Cons!6436 (h!7292 tuple2!6598) (t!11605 List!6440)) )
))
(declare-datatypes ((ListLongMap!5501 0))(
  ( (ListLongMap!5502 (toList!2766 List!6440)) )
))
(declare-fun lt!186531 () ListLongMap!5501)

(declare-fun lt!186528 () ListLongMap!5501)

(declare-fun lt!186535 () tuple2!6598)

(declare-fun +!1086 (ListLongMap!5501 tuple2!6598) ListLongMap!5501)

(assert (=> b!393967 (= lt!186531 (+!1086 lt!186528 lt!186535))))

(declare-fun lt!186533 () ListLongMap!5501)

(declare-fun lt!186529 () ListLongMap!5501)

(assert (=> b!393967 (= lt!186533 lt!186529)))

(declare-fun b!393968 () Bool)

(declare-fun res!225794 () Bool)

(declare-fun e!238484 () Bool)

(assert (=> b!393968 (=> (not res!225794) (not e!238484))))

(declare-datatypes ((array!23359 0))(
  ( (array!23360 (arr!11136 (Array (_ BitVec 32) (_ BitVec 64))) (size!11489 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!23359)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23359 (_ BitVec 32)) Bool)

(assert (=> b!393968 (= res!225794 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun res!225793 () Bool)

(assert (=> start!38210 (=> (not res!225793) (not e!238484))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!38210 (= res!225793 (validMask!0 mask!970))))

(assert (=> start!38210 e!238484))

(declare-datatypes ((ValueCell!4523 0))(
  ( (ValueCellFull!4523 (v!7150 V!14083)) (EmptyCell!4523) )
))
(declare-datatypes ((array!23361 0))(
  ( (array!23362 (arr!11137 (Array (_ BitVec 32) ValueCell!4523)) (size!11490 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!23361)

(declare-fun e!238487 () Bool)

(declare-fun array_inv!8174 (array!23361) Bool)

(assert (=> start!38210 (and (array_inv!8174 _values!506) e!238487)))

(assert (=> start!38210 tp!31971))

(assert (=> start!38210 true))

(assert (=> start!38210 tp_is_empty!9733))

(declare-fun array_inv!8175 (array!23359) Bool)

(assert (=> start!38210 (array_inv!8175 _keys!658)))

(declare-fun b!393969 () Bool)

(declare-fun e!238489 () Bool)

(assert (=> b!393969 (= e!238489 tp_is_empty!9733)))

(declare-fun b!393970 () Bool)

(declare-fun e!238488 () Bool)

(assert (=> b!393970 (= e!238484 e!238488)))

(declare-fun res!225789 () Bool)

(assert (=> b!393970 (=> (not res!225789) (not e!238488))))

(declare-fun lt!186530 () array!23359)

(assert (=> b!393970 (= res!225789 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!186530 mask!970))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!393970 (= lt!186530 (array!23360 (store (arr!11136 _keys!658) i!548 k0!778) (size!11489 _keys!658)))))

(declare-fun b!393971 () Bool)

(declare-fun res!225788 () Bool)

(assert (=> b!393971 (=> (not res!225788) (not e!238484))))

(declare-fun arrayContainsKey!0 (array!23359 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!393971 (= res!225788 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!393972 () Bool)

(declare-fun res!225797 () Bool)

(assert (=> b!393972 (=> (not res!225797) (not e!238484))))

(assert (=> b!393972 (= res!225797 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11489 _keys!658))))))

(declare-fun b!393973 () Bool)

(declare-fun res!225795 () Bool)

(assert (=> b!393973 (=> (not res!225795) (not e!238484))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!393973 (= res!225795 (validKeyInArray!0 k0!778))))

(declare-fun b!393974 () Bool)

(declare-fun res!225792 () Bool)

(assert (=> b!393974 (=> (not res!225792) (not e!238484))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!393974 (= res!225792 (and (= (size!11490 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11489 _keys!658) (size!11490 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!393975 () Bool)

(declare-fun res!225791 () Bool)

(assert (=> b!393975 (=> (not res!225791) (not e!238484))))

(assert (=> b!393975 (= res!225791 (or (= (select (arr!11136 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11136 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!393976 () Bool)

(declare-fun res!225787 () Bool)

(assert (=> b!393976 (=> (not res!225787) (not e!238488))))

(declare-datatypes ((List!6441 0))(
  ( (Nil!6438) (Cons!6437 (h!7293 (_ BitVec 64)) (t!11606 List!6441)) )
))
(declare-fun arrayNoDuplicates!0 (array!23359 (_ BitVec 32) List!6441) Bool)

(assert (=> b!393976 (= res!225787 (arrayNoDuplicates!0 lt!186530 #b00000000000000000000000000000000 Nil!6438))))

(declare-fun b!393977 () Bool)

(declare-fun mapRes!16200 () Bool)

(assert (=> b!393977 (= e!238487 (and e!238486 mapRes!16200))))

(declare-fun condMapEmpty!16200 () Bool)

(declare-fun mapDefault!16200 () ValueCell!4523)

(assert (=> b!393977 (= condMapEmpty!16200 (= (arr!11137 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4523)) mapDefault!16200)))))

(declare-fun mapNonEmpty!16200 () Bool)

(declare-fun tp!31970 () Bool)

(assert (=> mapNonEmpty!16200 (= mapRes!16200 (and tp!31970 e!238489))))

(declare-fun mapValue!16200 () ValueCell!4523)

(declare-fun mapKey!16200 () (_ BitVec 32))

(declare-fun mapRest!16200 () (Array (_ BitVec 32) ValueCell!4523))

(assert (=> mapNonEmpty!16200 (= (arr!11137 _values!506) (store mapRest!16200 mapKey!16200 mapValue!16200))))

(declare-fun mapIsEmpty!16200 () Bool)

(assert (=> mapIsEmpty!16200 mapRes!16200))

(declare-fun b!393978 () Bool)

(assert (=> b!393978 (= e!238488 (not e!238490))))

(declare-fun res!225796 () Bool)

(assert (=> b!393978 (=> res!225796 e!238490)))

(declare-fun lt!186536 () Bool)

(assert (=> b!393978 (= res!225796 (or (and (not lt!186536) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!186536) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!186536)))))

(assert (=> b!393978 (= lt!186536 (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!14083)

(declare-fun minValue!472 () V!14083)

(declare-fun getCurrentListMap!2081 (array!23359 array!23361 (_ BitVec 32) (_ BitVec 32) V!14083 V!14083 (_ BitVec 32) Int) ListLongMap!5501)

(assert (=> b!393978 (= lt!186528 (getCurrentListMap!2081 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!186527 () array!23361)

(assert (=> b!393978 (= lt!186533 (getCurrentListMap!2081 lt!186530 lt!186527 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!186537 () ListLongMap!5501)

(assert (=> b!393978 (and (= lt!186529 lt!186537) (= lt!186537 lt!186529))))

(declare-fun lt!186532 () ListLongMap!5501)

(assert (=> b!393978 (= lt!186537 (+!1086 lt!186532 lt!186535))))

(declare-fun v!373 () V!14083)

(assert (=> b!393978 (= lt!186535 (tuple2!6599 k0!778 v!373))))

(declare-datatypes ((Unit!12024 0))(
  ( (Unit!12025) )
))
(declare-fun lt!186534 () Unit!12024)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!282 (array!23359 array!23361 (_ BitVec 32) (_ BitVec 32) V!14083 V!14083 (_ BitVec 32) (_ BitVec 64) V!14083 (_ BitVec 32) Int) Unit!12024)

(assert (=> b!393978 (= lt!186534 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!282 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!991 (array!23359 array!23361 (_ BitVec 32) (_ BitVec 32) V!14083 V!14083 (_ BitVec 32) Int) ListLongMap!5501)

(assert (=> b!393978 (= lt!186529 (getCurrentListMapNoExtraKeys!991 lt!186530 lt!186527 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!393978 (= lt!186527 (array!23362 (store (arr!11137 _values!506) i!548 (ValueCellFull!4523 v!373)) (size!11490 _values!506)))))

(assert (=> b!393978 (= lt!186532 (getCurrentListMapNoExtraKeys!991 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!393979 () Bool)

(declare-fun res!225790 () Bool)

(assert (=> b!393979 (=> (not res!225790) (not e!238484))))

(assert (=> b!393979 (= res!225790 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6438))))

(assert (= (and start!38210 res!225793) b!393974))

(assert (= (and b!393974 res!225792) b!393968))

(assert (= (and b!393968 res!225794) b!393979))

(assert (= (and b!393979 res!225790) b!393972))

(assert (= (and b!393972 res!225797) b!393973))

(assert (= (and b!393973 res!225795) b!393975))

(assert (= (and b!393975 res!225791) b!393971))

(assert (= (and b!393971 res!225788) b!393970))

(assert (= (and b!393970 res!225789) b!393976))

(assert (= (and b!393976 res!225787) b!393978))

(assert (= (and b!393978 (not res!225796)) b!393967))

(assert (= (and b!393977 condMapEmpty!16200) mapIsEmpty!16200))

(assert (= (and b!393977 (not condMapEmpty!16200)) mapNonEmpty!16200))

(get-info :version)

(assert (= (and mapNonEmpty!16200 ((_ is ValueCellFull!4523) mapValue!16200)) b!393969))

(assert (= (and b!393977 ((_ is ValueCellFull!4523) mapDefault!16200)) b!393966))

(assert (= start!38210 b!393977))

(declare-fun m!389955 () Bool)

(assert (=> b!393967 m!389955))

(declare-fun m!389957 () Bool)

(assert (=> b!393970 m!389957))

(declare-fun m!389959 () Bool)

(assert (=> b!393970 m!389959))

(declare-fun m!389961 () Bool)

(assert (=> b!393971 m!389961))

(declare-fun m!389963 () Bool)

(assert (=> start!38210 m!389963))

(declare-fun m!389965 () Bool)

(assert (=> start!38210 m!389965))

(declare-fun m!389967 () Bool)

(assert (=> start!38210 m!389967))

(declare-fun m!389969 () Bool)

(assert (=> b!393975 m!389969))

(declare-fun m!389971 () Bool)

(assert (=> b!393973 m!389971))

(declare-fun m!389973 () Bool)

(assert (=> b!393978 m!389973))

(declare-fun m!389975 () Bool)

(assert (=> b!393978 m!389975))

(declare-fun m!389977 () Bool)

(assert (=> b!393978 m!389977))

(declare-fun m!389979 () Bool)

(assert (=> b!393978 m!389979))

(declare-fun m!389981 () Bool)

(assert (=> b!393978 m!389981))

(declare-fun m!389983 () Bool)

(assert (=> b!393978 m!389983))

(declare-fun m!389985 () Bool)

(assert (=> b!393978 m!389985))

(declare-fun m!389987 () Bool)

(assert (=> mapNonEmpty!16200 m!389987))

(declare-fun m!389989 () Bool)

(assert (=> b!393976 m!389989))

(declare-fun m!389991 () Bool)

(assert (=> b!393968 m!389991))

(declare-fun m!389993 () Bool)

(assert (=> b!393979 m!389993))

(check-sat (not b_next!9061) tp_is_empty!9733 (not b!393967) (not b!393978) (not b!393979) b_and!16421 (not b!393971) (not b!393970) (not mapNonEmpty!16200) (not start!38210) (not b!393968) (not b!393976) (not b!393973))
(check-sat b_and!16421 (not b_next!9061))
