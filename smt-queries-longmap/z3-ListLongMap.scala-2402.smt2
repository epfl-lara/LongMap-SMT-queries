; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38016 () Bool)

(assert start!38016)

(declare-fun b_free!8977 () Bool)

(declare-fun b_next!8977 () Bool)

(assert (=> start!38016 (= b_free!8977 (not b_next!8977))))

(declare-fun tp!31703 () Bool)

(declare-fun b_and!16277 () Bool)

(assert (=> start!38016 (= tp!31703 b_and!16277)))

(declare-fun b!391121 () Bool)

(declare-fun res!223888 () Bool)

(declare-fun e!236891 () Bool)

(assert (=> b!391121 (=> (not res!223888) (not e!236891))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((V!13971 0))(
  ( (V!13972 (val!4869 Int)) )
))
(declare-datatypes ((ValueCell!4481 0))(
  ( (ValueCellFull!4481 (v!7088 V!13971)) (EmptyCell!4481) )
))
(declare-datatypes ((array!23185 0))(
  ( (array!23186 (arr!11054 (Array (_ BitVec 32) ValueCell!4481)) (size!11407 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!23185)

(declare-datatypes ((array!23187 0))(
  ( (array!23188 (arr!11055 (Array (_ BitVec 32) (_ BitVec 64))) (size!11408 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!23187)

(declare-fun mask!970 () (_ BitVec 32))

(assert (=> b!391121 (= res!223888 (and (= (size!11407 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11408 _keys!658) (size!11407 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!391122 () Bool)

(declare-fun e!236888 () Bool)

(declare-fun e!236890 () Bool)

(assert (=> b!391122 (= e!236888 e!236890)))

(declare-fun res!223883 () Bool)

(assert (=> b!391122 (=> res!223883 e!236890)))

(declare-fun k0!778 () (_ BitVec 64))

(assert (=> b!391122 (= res!223883 (= k0!778 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((tuple2!6528 0))(
  ( (tuple2!6529 (_1!3275 (_ BitVec 64)) (_2!3275 V!13971)) )
))
(declare-datatypes ((List!6372 0))(
  ( (Nil!6369) (Cons!6368 (h!7224 tuple2!6528) (t!11527 List!6372)) )
))
(declare-datatypes ((ListLongMap!5431 0))(
  ( (ListLongMap!5432 (toList!2731 List!6372)) )
))
(declare-fun lt!184442 () ListLongMap!5431)

(declare-fun lt!184440 () ListLongMap!5431)

(assert (=> b!391122 (= lt!184442 lt!184440)))

(declare-fun lt!184445 () ListLongMap!5431)

(declare-fun lt!184438 () tuple2!6528)

(declare-fun +!1051 (ListLongMap!5431 tuple2!6528) ListLongMap!5431)

(assert (=> b!391122 (= lt!184440 (+!1051 lt!184445 lt!184438))))

(declare-fun lt!184434 () ListLongMap!5431)

(declare-fun lt!184436 () ListLongMap!5431)

(assert (=> b!391122 (= lt!184434 lt!184436)))

(declare-fun lt!184439 () ListLongMap!5431)

(assert (=> b!391122 (= lt!184436 (+!1051 lt!184439 lt!184438))))

(declare-fun lt!184435 () ListLongMap!5431)

(assert (=> b!391122 (= lt!184442 (+!1051 lt!184435 lt!184438))))

(declare-fun zeroValue!472 () V!13971)

(assert (=> b!391122 (= lt!184438 (tuple2!6529 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!391123 () Bool)

(declare-fun res!223889 () Bool)

(assert (=> b!391123 (=> (not res!223889) (not e!236891))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!391123 (= res!223889 (or (= (select (arr!11055 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11055 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!391124 () Bool)

(declare-fun res!223885 () Bool)

(assert (=> b!391124 (=> (not res!223885) (not e!236891))))

(declare-datatypes ((List!6373 0))(
  ( (Nil!6370) (Cons!6369 (h!7225 (_ BitVec 64)) (t!11528 List!6373)) )
))
(declare-fun arrayNoDuplicates!0 (array!23187 (_ BitVec 32) List!6373) Bool)

(assert (=> b!391124 (= res!223885 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6370))))

(declare-fun mapNonEmpty!16059 () Bool)

(declare-fun mapRes!16059 () Bool)

(declare-fun tp!31704 () Bool)

(declare-fun e!236894 () Bool)

(assert (=> mapNonEmpty!16059 (= mapRes!16059 (and tp!31704 e!236894))))

(declare-fun mapKey!16059 () (_ BitVec 32))

(declare-fun mapRest!16059 () (Array (_ BitVec 32) ValueCell!4481))

(declare-fun mapValue!16059 () ValueCell!4481)

(assert (=> mapNonEmpty!16059 (= (arr!11054 _values!506) (store mapRest!16059 mapKey!16059 mapValue!16059))))

(declare-fun res!223882 () Bool)

(assert (=> start!38016 (=> (not res!223882) (not e!236891))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!38016 (= res!223882 (validMask!0 mask!970))))

(assert (=> start!38016 e!236891))

(declare-fun e!236892 () Bool)

(declare-fun array_inv!8118 (array!23185) Bool)

(assert (=> start!38016 (and (array_inv!8118 _values!506) e!236892)))

(assert (=> start!38016 tp!31703))

(assert (=> start!38016 true))

(declare-fun tp_is_empty!9649 () Bool)

(assert (=> start!38016 tp_is_empty!9649))

(declare-fun array_inv!8119 (array!23187) Bool)

(assert (=> start!38016 (array_inv!8119 _keys!658)))

(declare-fun b!391125 () Bool)

(declare-fun e!236889 () Bool)

(assert (=> b!391125 (= e!236892 (and e!236889 mapRes!16059))))

(declare-fun condMapEmpty!16059 () Bool)

(declare-fun mapDefault!16059 () ValueCell!4481)

(assert (=> b!391125 (= condMapEmpty!16059 (= (arr!11054 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4481)) mapDefault!16059)))))

(declare-fun b!391126 () Bool)

(declare-fun res!223884 () Bool)

(assert (=> b!391126 (=> (not res!223884) (not e!236891))))

(declare-fun arrayContainsKey!0 (array!23187 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!391126 (= res!223884 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!391127 () Bool)

(declare-fun res!223891 () Bool)

(assert (=> b!391127 (=> (not res!223891) (not e!236891))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!391127 (= res!223891 (validKeyInArray!0 k0!778))))

(declare-fun b!391128 () Bool)

(declare-fun res!223880 () Bool)

(assert (=> b!391128 (=> (not res!223880) (not e!236891))))

(assert (=> b!391128 (= res!223880 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11408 _keys!658))))))

(declare-fun b!391129 () Bool)

(assert (=> b!391129 (= e!236890 true)))

(declare-fun lt!184444 () tuple2!6528)

(assert (=> b!391129 (= lt!184440 (+!1051 lt!184436 lt!184444))))

(declare-fun v!373 () V!13971)

(declare-datatypes ((Unit!11950 0))(
  ( (Unit!11951) )
))
(declare-fun lt!184446 () Unit!11950)

(declare-fun addCommutativeForDiffKeys!331 (ListLongMap!5431 (_ BitVec 64) V!13971 (_ BitVec 64) V!13971) Unit!11950)

(assert (=> b!391129 (= lt!184446 (addCommutativeForDiffKeys!331 lt!184439 k0!778 v!373 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!391130 () Bool)

(declare-fun res!223887 () Bool)

(declare-fun e!236893 () Bool)

(assert (=> b!391130 (=> (not res!223887) (not e!236893))))

(declare-fun lt!184437 () array!23187)

(assert (=> b!391130 (= res!223887 (arrayNoDuplicates!0 lt!184437 #b00000000000000000000000000000000 Nil!6370))))

(declare-fun b!391131 () Bool)

(assert (=> b!391131 (= e!236893 (not e!236888))))

(declare-fun res!223890 () Bool)

(assert (=> b!391131 (=> res!223890 e!236888)))

(assert (=> b!391131 (= res!223890 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-fun minValue!472 () V!13971)

(declare-fun getCurrentListMap!2056 (array!23187 array!23185 (_ BitVec 32) (_ BitVec 32) V!13971 V!13971 (_ BitVec 32) Int) ListLongMap!5431)

(assert (=> b!391131 (= lt!184434 (getCurrentListMap!2056 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!184443 () array!23185)

(assert (=> b!391131 (= lt!184442 (getCurrentListMap!2056 lt!184437 lt!184443 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!391131 (and (= lt!184435 lt!184445) (= lt!184445 lt!184435))))

(assert (=> b!391131 (= lt!184445 (+!1051 lt!184439 lt!184444))))

(assert (=> b!391131 (= lt!184444 (tuple2!6529 k0!778 v!373))))

(declare-fun lt!184441 () Unit!11950)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!257 (array!23187 array!23185 (_ BitVec 32) (_ BitVec 32) V!13971 V!13971 (_ BitVec 32) (_ BitVec 64) V!13971 (_ BitVec 32) Int) Unit!11950)

(assert (=> b!391131 (= lt!184441 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!257 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!966 (array!23187 array!23185 (_ BitVec 32) (_ BitVec 32) V!13971 V!13971 (_ BitVec 32) Int) ListLongMap!5431)

(assert (=> b!391131 (= lt!184435 (getCurrentListMapNoExtraKeys!966 lt!184437 lt!184443 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!391131 (= lt!184443 (array!23186 (store (arr!11054 _values!506) i!548 (ValueCellFull!4481 v!373)) (size!11407 _values!506)))))

(assert (=> b!391131 (= lt!184439 (getCurrentListMapNoExtraKeys!966 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!391132 () Bool)

(assert (=> b!391132 (= e!236891 e!236893)))

(declare-fun res!223881 () Bool)

(assert (=> b!391132 (=> (not res!223881) (not e!236893))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23187 (_ BitVec 32)) Bool)

(assert (=> b!391132 (= res!223881 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!184437 mask!970))))

(assert (=> b!391132 (= lt!184437 (array!23188 (store (arr!11055 _keys!658) i!548 k0!778) (size!11408 _keys!658)))))

(declare-fun b!391133 () Bool)

(declare-fun res!223886 () Bool)

(assert (=> b!391133 (=> (not res!223886) (not e!236891))))

(assert (=> b!391133 (= res!223886 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!391134 () Bool)

(assert (=> b!391134 (= e!236889 tp_is_empty!9649)))

(declare-fun mapIsEmpty!16059 () Bool)

(assert (=> mapIsEmpty!16059 mapRes!16059))

(declare-fun b!391135 () Bool)

(assert (=> b!391135 (= e!236894 tp_is_empty!9649)))

(assert (= (and start!38016 res!223882) b!391121))

(assert (= (and b!391121 res!223888) b!391133))

(assert (= (and b!391133 res!223886) b!391124))

(assert (= (and b!391124 res!223885) b!391128))

(assert (= (and b!391128 res!223880) b!391127))

(assert (= (and b!391127 res!223891) b!391123))

(assert (= (and b!391123 res!223889) b!391126))

(assert (= (and b!391126 res!223884) b!391132))

(assert (= (and b!391132 res!223881) b!391130))

(assert (= (and b!391130 res!223887) b!391131))

(assert (= (and b!391131 (not res!223890)) b!391122))

(assert (= (and b!391122 (not res!223883)) b!391129))

(assert (= (and b!391125 condMapEmpty!16059) mapIsEmpty!16059))

(assert (= (and b!391125 (not condMapEmpty!16059)) mapNonEmpty!16059))

(get-info :version)

(assert (= (and mapNonEmpty!16059 ((_ is ValueCellFull!4481) mapValue!16059)) b!391135))

(assert (= (and b!391125 ((_ is ValueCellFull!4481) mapDefault!16059)) b!391134))

(assert (= start!38016 b!391125))

(declare-fun m!387031 () Bool)

(assert (=> b!391129 m!387031))

(declare-fun m!387033 () Bool)

(assert (=> b!391129 m!387033))

(declare-fun m!387035 () Bool)

(assert (=> b!391133 m!387035))

(declare-fun m!387037 () Bool)

(assert (=> mapNonEmpty!16059 m!387037))

(declare-fun m!387039 () Bool)

(assert (=> b!391130 m!387039))

(declare-fun m!387041 () Bool)

(assert (=> b!391131 m!387041))

(declare-fun m!387043 () Bool)

(assert (=> b!391131 m!387043))

(declare-fun m!387045 () Bool)

(assert (=> b!391131 m!387045))

(declare-fun m!387047 () Bool)

(assert (=> b!391131 m!387047))

(declare-fun m!387049 () Bool)

(assert (=> b!391131 m!387049))

(declare-fun m!387051 () Bool)

(assert (=> b!391131 m!387051))

(declare-fun m!387053 () Bool)

(assert (=> b!391131 m!387053))

(declare-fun m!387055 () Bool)

(assert (=> b!391122 m!387055))

(declare-fun m!387057 () Bool)

(assert (=> b!391122 m!387057))

(declare-fun m!387059 () Bool)

(assert (=> b!391122 m!387059))

(declare-fun m!387061 () Bool)

(assert (=> b!391132 m!387061))

(declare-fun m!387063 () Bool)

(assert (=> b!391132 m!387063))

(declare-fun m!387065 () Bool)

(assert (=> b!391127 m!387065))

(declare-fun m!387067 () Bool)

(assert (=> start!38016 m!387067))

(declare-fun m!387069 () Bool)

(assert (=> start!38016 m!387069))

(declare-fun m!387071 () Bool)

(assert (=> start!38016 m!387071))

(declare-fun m!387073 () Bool)

(assert (=> b!391123 m!387073))

(declare-fun m!387075 () Bool)

(assert (=> b!391124 m!387075))

(declare-fun m!387077 () Bool)

(assert (=> b!391126 m!387077))

(check-sat (not b!391131) (not b!391126) (not b!391124) (not b!391127) (not b!391122) (not mapNonEmpty!16059) (not start!38016) tp_is_empty!9649 (not b!391132) (not b!391133) b_and!16277 (not b_next!8977) (not b!391130) (not b!391129))
(check-sat b_and!16277 (not b_next!8977))
