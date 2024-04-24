; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38016 () Bool)

(assert start!38016)

(declare-fun b_free!8977 () Bool)

(declare-fun b_next!8977 () Bool)

(assert (=> start!38016 (= b_free!8977 (not b_next!8977))))

(declare-fun tp!31703 () Bool)

(declare-fun b_and!16317 () Bool)

(assert (=> start!38016 (= tp!31703 b_and!16317)))

(declare-fun mapIsEmpty!16059 () Bool)

(declare-fun mapRes!16059 () Bool)

(assert (=> mapIsEmpty!16059 mapRes!16059))

(declare-fun b!391343 () Bool)

(declare-fun e!237032 () Bool)

(declare-fun e!237036 () Bool)

(assert (=> b!391343 (= e!237032 e!237036)))

(declare-fun res!224009 () Bool)

(assert (=> b!391343 (=> (not res!224009) (not e!237036))))

(declare-datatypes ((array!23186 0))(
  ( (array!23187 (arr!11054 (Array (_ BitVec 32) (_ BitVec 64))) (size!11406 (_ BitVec 32))) )
))
(declare-fun lt!184693 () array!23186)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23186 (_ BitVec 32)) Bool)

(assert (=> b!391343 (= res!224009 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!184693 mask!970))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun _keys!658 () array!23186)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!391343 (= lt!184693 (array!23187 (store (arr!11054 _keys!658) i!548 k0!778) (size!11406 _keys!658)))))

(declare-fun b!391344 () Bool)

(declare-fun res!224014 () Bool)

(assert (=> b!391344 (=> (not res!224014) (not e!237036))))

(declare-datatypes ((List!6273 0))(
  ( (Nil!6270) (Cons!6269 (h!7125 (_ BitVec 64)) (t!11429 List!6273)) )
))
(declare-fun arrayNoDuplicates!0 (array!23186 (_ BitVec 32) List!6273) Bool)

(assert (=> b!391344 (= res!224014 (arrayNoDuplicates!0 lt!184693 #b00000000000000000000000000000000 Nil!6270))))

(declare-fun b!391345 () Bool)

(declare-fun e!237033 () Bool)

(declare-fun tp_is_empty!9649 () Bool)

(assert (=> b!391345 (= e!237033 tp_is_empty!9649)))

(declare-fun b!391346 () Bool)

(declare-fun res!224017 () Bool)

(assert (=> b!391346 (=> (not res!224017) (not e!237032))))

(declare-fun arrayContainsKey!0 (array!23186 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!391346 (= res!224017 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!391347 () Bool)

(declare-fun e!237035 () Bool)

(declare-fun e!237030 () Bool)

(assert (=> b!391347 (= e!237035 e!237030)))

(declare-fun res!224015 () Bool)

(assert (=> b!391347 (=> res!224015 e!237030)))

(assert (=> b!391347 (= res!224015 (= k0!778 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((V!13971 0))(
  ( (V!13972 (val!4869 Int)) )
))
(declare-datatypes ((tuple2!6424 0))(
  ( (tuple2!6425 (_1!3223 (_ BitVec 64)) (_2!3223 V!13971)) )
))
(declare-datatypes ((List!6274 0))(
  ( (Nil!6271) (Cons!6270 (h!7126 tuple2!6424) (t!11430 List!6274)) )
))
(declare-datatypes ((ListLongMap!5339 0))(
  ( (ListLongMap!5340 (toList!2685 List!6274)) )
))
(declare-fun lt!184691 () ListLongMap!5339)

(declare-fun lt!184690 () ListLongMap!5339)

(assert (=> b!391347 (= lt!184691 lt!184690)))

(declare-fun lt!184697 () ListLongMap!5339)

(declare-fun lt!184692 () tuple2!6424)

(declare-fun +!1039 (ListLongMap!5339 tuple2!6424) ListLongMap!5339)

(assert (=> b!391347 (= lt!184690 (+!1039 lt!184697 lt!184692))))

(declare-fun lt!184698 () ListLongMap!5339)

(declare-fun lt!184687 () ListLongMap!5339)

(assert (=> b!391347 (= lt!184698 lt!184687)))

(declare-fun lt!184688 () ListLongMap!5339)

(assert (=> b!391347 (= lt!184687 (+!1039 lt!184688 lt!184692))))

(declare-fun lt!184695 () ListLongMap!5339)

(assert (=> b!391347 (= lt!184691 (+!1039 lt!184695 lt!184692))))

(declare-fun zeroValue!472 () V!13971)

(assert (=> b!391347 (= lt!184692 (tuple2!6425 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!391348 () Bool)

(declare-fun res!224007 () Bool)

(assert (=> b!391348 (=> (not res!224007) (not e!237032))))

(assert (=> b!391348 (= res!224007 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6270))))

(declare-fun res!224011 () Bool)

(assert (=> start!38016 (=> (not res!224011) (not e!237032))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!38016 (= res!224011 (validMask!0 mask!970))))

(assert (=> start!38016 e!237032))

(declare-datatypes ((ValueCell!4481 0))(
  ( (ValueCellFull!4481 (v!7095 V!13971)) (EmptyCell!4481) )
))
(declare-datatypes ((array!23188 0))(
  ( (array!23189 (arr!11055 (Array (_ BitVec 32) ValueCell!4481)) (size!11407 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!23188)

(declare-fun e!237034 () Bool)

(declare-fun array_inv!8174 (array!23188) Bool)

(assert (=> start!38016 (and (array_inv!8174 _values!506) e!237034)))

(assert (=> start!38016 tp!31703))

(assert (=> start!38016 true))

(assert (=> start!38016 tp_is_empty!9649))

(declare-fun array_inv!8175 (array!23186) Bool)

(assert (=> start!38016 (array_inv!8175 _keys!658)))

(declare-fun b!391349 () Bool)

(declare-fun res!224013 () Bool)

(assert (=> b!391349 (=> (not res!224013) (not e!237032))))

(assert (=> b!391349 (= res!224013 (or (= (select (arr!11054 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11054 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!391350 () Bool)

(declare-fun e!237031 () Bool)

(assert (=> b!391350 (= e!237031 tp_is_empty!9649)))

(declare-fun b!391351 () Bool)

(declare-fun res!224010 () Bool)

(assert (=> b!391351 (=> (not res!224010) (not e!237032))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!391351 (= res!224010 (and (= (size!11407 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11406 _keys!658) (size!11407 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!391352 () Bool)

(assert (=> b!391352 (= e!237034 (and e!237033 mapRes!16059))))

(declare-fun condMapEmpty!16059 () Bool)

(declare-fun mapDefault!16059 () ValueCell!4481)

(assert (=> b!391352 (= condMapEmpty!16059 (= (arr!11055 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4481)) mapDefault!16059)))))

(declare-fun b!391353 () Bool)

(assert (=> b!391353 (= e!237030 true)))

(declare-fun lt!184689 () tuple2!6424)

(assert (=> b!391353 (= lt!184690 (+!1039 lt!184687 lt!184689))))

(declare-datatypes ((Unit!11953 0))(
  ( (Unit!11954) )
))
(declare-fun lt!184694 () Unit!11953)

(declare-fun v!373 () V!13971)

(declare-fun addCommutativeForDiffKeys!339 (ListLongMap!5339 (_ BitVec 64) V!13971 (_ BitVec 64) V!13971) Unit!11953)

(assert (=> b!391353 (= lt!184694 (addCommutativeForDiffKeys!339 lt!184688 k0!778 v!373 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!391354 () Bool)

(declare-fun res!224006 () Bool)

(assert (=> b!391354 (=> (not res!224006) (not e!237032))))

(assert (=> b!391354 (= res!224006 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11406 _keys!658))))))

(declare-fun b!391355 () Bool)

(declare-fun res!224008 () Bool)

(assert (=> b!391355 (=> (not res!224008) (not e!237032))))

(assert (=> b!391355 (= res!224008 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!391356 () Bool)

(declare-fun res!224012 () Bool)

(assert (=> b!391356 (=> (not res!224012) (not e!237032))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!391356 (= res!224012 (validKeyInArray!0 k0!778))))

(declare-fun b!391357 () Bool)

(assert (=> b!391357 (= e!237036 (not e!237035))))

(declare-fun res!224016 () Bool)

(assert (=> b!391357 (=> res!224016 e!237035)))

(assert (=> b!391357 (= res!224016 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-fun minValue!472 () V!13971)

(declare-fun getCurrentListMap!2066 (array!23186 array!23188 (_ BitVec 32) (_ BitVec 32) V!13971 V!13971 (_ BitVec 32) Int) ListLongMap!5339)

(assert (=> b!391357 (= lt!184698 (getCurrentListMap!2066 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!184699 () array!23188)

(assert (=> b!391357 (= lt!184691 (getCurrentListMap!2066 lt!184693 lt!184699 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!391357 (and (= lt!184695 lt!184697) (= lt!184697 lt!184695))))

(assert (=> b!391357 (= lt!184697 (+!1039 lt!184688 lt!184689))))

(assert (=> b!391357 (= lt!184689 (tuple2!6425 k0!778 v!373))))

(declare-fun lt!184696 () Unit!11953)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!257 (array!23186 array!23188 (_ BitVec 32) (_ BitVec 32) V!13971 V!13971 (_ BitVec 32) (_ BitVec 64) V!13971 (_ BitVec 32) Int) Unit!11953)

(assert (=> b!391357 (= lt!184696 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!257 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!955 (array!23186 array!23188 (_ BitVec 32) (_ BitVec 32) V!13971 V!13971 (_ BitVec 32) Int) ListLongMap!5339)

(assert (=> b!391357 (= lt!184695 (getCurrentListMapNoExtraKeys!955 lt!184693 lt!184699 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!391357 (= lt!184699 (array!23189 (store (arr!11055 _values!506) i!548 (ValueCellFull!4481 v!373)) (size!11407 _values!506)))))

(assert (=> b!391357 (= lt!184688 (getCurrentListMapNoExtraKeys!955 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun mapNonEmpty!16059 () Bool)

(declare-fun tp!31704 () Bool)

(assert (=> mapNonEmpty!16059 (= mapRes!16059 (and tp!31704 e!237031))))

(declare-fun mapValue!16059 () ValueCell!4481)

(declare-fun mapRest!16059 () (Array (_ BitVec 32) ValueCell!4481))

(declare-fun mapKey!16059 () (_ BitVec 32))

(assert (=> mapNonEmpty!16059 (= (arr!11055 _values!506) (store mapRest!16059 mapKey!16059 mapValue!16059))))

(assert (= (and start!38016 res!224011) b!391351))

(assert (= (and b!391351 res!224010) b!391355))

(assert (= (and b!391355 res!224008) b!391348))

(assert (= (and b!391348 res!224007) b!391354))

(assert (= (and b!391354 res!224006) b!391356))

(assert (= (and b!391356 res!224012) b!391349))

(assert (= (and b!391349 res!224013) b!391346))

(assert (= (and b!391346 res!224017) b!391343))

(assert (= (and b!391343 res!224009) b!391344))

(assert (= (and b!391344 res!224014) b!391357))

(assert (= (and b!391357 (not res!224016)) b!391347))

(assert (= (and b!391347 (not res!224015)) b!391353))

(assert (= (and b!391352 condMapEmpty!16059) mapIsEmpty!16059))

(assert (= (and b!391352 (not condMapEmpty!16059)) mapNonEmpty!16059))

(get-info :version)

(assert (= (and mapNonEmpty!16059 ((_ is ValueCellFull!4481) mapValue!16059)) b!391350))

(assert (= (and b!391352 ((_ is ValueCellFull!4481) mapDefault!16059)) b!391345))

(assert (= start!38016 b!391352))

(declare-fun m!387985 () Bool)

(assert (=> b!391348 m!387985))

(declare-fun m!387987 () Bool)

(assert (=> b!391355 m!387987))

(declare-fun m!387989 () Bool)

(assert (=> start!38016 m!387989))

(declare-fun m!387991 () Bool)

(assert (=> start!38016 m!387991))

(declare-fun m!387993 () Bool)

(assert (=> start!38016 m!387993))

(declare-fun m!387995 () Bool)

(assert (=> b!391346 m!387995))

(declare-fun m!387997 () Bool)

(assert (=> b!391349 m!387997))

(declare-fun m!387999 () Bool)

(assert (=> b!391347 m!387999))

(declare-fun m!388001 () Bool)

(assert (=> b!391347 m!388001))

(declare-fun m!388003 () Bool)

(assert (=> b!391347 m!388003))

(declare-fun m!388005 () Bool)

(assert (=> b!391343 m!388005))

(declare-fun m!388007 () Bool)

(assert (=> b!391343 m!388007))

(declare-fun m!388009 () Bool)

(assert (=> b!391356 m!388009))

(declare-fun m!388011 () Bool)

(assert (=> mapNonEmpty!16059 m!388011))

(declare-fun m!388013 () Bool)

(assert (=> b!391353 m!388013))

(declare-fun m!388015 () Bool)

(assert (=> b!391353 m!388015))

(declare-fun m!388017 () Bool)

(assert (=> b!391357 m!388017))

(declare-fun m!388019 () Bool)

(assert (=> b!391357 m!388019))

(declare-fun m!388021 () Bool)

(assert (=> b!391357 m!388021))

(declare-fun m!388023 () Bool)

(assert (=> b!391357 m!388023))

(declare-fun m!388025 () Bool)

(assert (=> b!391357 m!388025))

(declare-fun m!388027 () Bool)

(assert (=> b!391357 m!388027))

(declare-fun m!388029 () Bool)

(assert (=> b!391357 m!388029))

(declare-fun m!388031 () Bool)

(assert (=> b!391344 m!388031))

(check-sat (not b!391355) tp_is_empty!9649 (not b!391343) (not b!391353) (not b!391348) (not b!391356) (not start!38016) (not mapNonEmpty!16059) (not b!391357) (not b_next!8977) (not b!391346) (not b!391347) (not b!391344) b_and!16317)
(check-sat b_and!16317 (not b_next!8977))
