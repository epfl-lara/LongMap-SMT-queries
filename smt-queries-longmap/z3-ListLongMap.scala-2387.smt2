; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37770 () Bool)

(assert start!37770)

(declare-fun b_free!8887 () Bool)

(declare-fun b_next!8887 () Bool)

(assert (=> start!37770 (= b_free!8887 (not b_next!8887))))

(declare-fun tp!31412 () Bool)

(declare-fun b_and!16143 () Bool)

(assert (=> start!37770 (= tp!31412 b_and!16143)))

(declare-fun b!387952 () Bool)

(declare-fun res!221807 () Bool)

(declare-fun e!235120 () Bool)

(assert (=> b!387952 (=> (not res!221807) (not e!235120))))

(declare-fun i!548 () (_ BitVec 32))

(declare-datatypes ((array!22998 0))(
  ( (array!22999 (arr!10967 (Array (_ BitVec 32) (_ BitVec 64))) (size!11319 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22998)

(assert (=> b!387952 (= res!221807 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11319 _keys!658))))))

(declare-fun b!387953 () Bool)

(declare-fun res!221812 () Bool)

(assert (=> b!387953 (=> (not res!221812) (not e!235120))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((V!13851 0))(
  ( (V!13852 (val!4824 Int)) )
))
(declare-datatypes ((ValueCell!4436 0))(
  ( (ValueCellFull!4436 (v!7022 V!13851)) (EmptyCell!4436) )
))
(declare-datatypes ((array!23000 0))(
  ( (array!23001 (arr!10968 (Array (_ BitVec 32) ValueCell!4436)) (size!11320 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!23000)

(declare-fun mask!970 () (_ BitVec 32))

(assert (=> b!387953 (= res!221812 (and (= (size!11320 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11319 _keys!658) (size!11320 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!387954 () Bool)

(declare-fun res!221808 () Bool)

(assert (=> b!387954 (=> (not res!221808) (not e!235120))))

(declare-datatypes ((List!6200 0))(
  ( (Nil!6197) (Cons!6196 (h!7052 (_ BitVec 64)) (t!11342 List!6200)) )
))
(declare-fun arrayNoDuplicates!0 (array!22998 (_ BitVec 32) List!6200) Bool)

(assert (=> b!387954 (= res!221808 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6197))))

(declare-fun mapIsEmpty!15903 () Bool)

(declare-fun mapRes!15903 () Bool)

(assert (=> mapIsEmpty!15903 mapRes!15903))

(declare-fun mapNonEmpty!15903 () Bool)

(declare-fun tp!31413 () Bool)

(declare-fun e!235121 () Bool)

(assert (=> mapNonEmpty!15903 (= mapRes!15903 (and tp!31413 e!235121))))

(declare-fun mapValue!15903 () ValueCell!4436)

(declare-fun mapRest!15903 () (Array (_ BitVec 32) ValueCell!4436))

(declare-fun mapKey!15903 () (_ BitVec 32))

(assert (=> mapNonEmpty!15903 (= (arr!10968 _values!506) (store mapRest!15903 mapKey!15903 mapValue!15903))))

(declare-fun b!387955 () Bool)

(declare-fun e!235117 () Bool)

(assert (=> b!387955 (= e!235120 e!235117)))

(declare-fun res!221809 () Bool)

(assert (=> b!387955 (=> (not res!221809) (not e!235117))))

(declare-fun lt!182191 () array!22998)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22998 (_ BitVec 32)) Bool)

(assert (=> b!387955 (= res!221809 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!182191 mask!970))))

(declare-fun k0!778 () (_ BitVec 64))

(assert (=> b!387955 (= lt!182191 (array!22999 (store (arr!10967 _keys!658) i!548 k0!778) (size!11319 _keys!658)))))

(declare-fun b!387956 () Bool)

(declare-fun e!235122 () Bool)

(declare-fun e!235119 () Bool)

(assert (=> b!387956 (= e!235122 (and e!235119 mapRes!15903))))

(declare-fun condMapEmpty!15903 () Bool)

(declare-fun mapDefault!15903 () ValueCell!4436)

(assert (=> b!387956 (= condMapEmpty!15903 (= (arr!10968 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4436)) mapDefault!15903)))))

(declare-fun b!387957 () Bool)

(declare-fun res!221806 () Bool)

(assert (=> b!387957 (=> (not res!221806) (not e!235120))))

(declare-fun arrayContainsKey!0 (array!22998 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!387957 (= res!221806 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun res!221804 () Bool)

(assert (=> start!37770 (=> (not res!221804) (not e!235120))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37770 (= res!221804 (validMask!0 mask!970))))

(assert (=> start!37770 e!235120))

(declare-fun array_inv!8106 (array!23000) Bool)

(assert (=> start!37770 (and (array_inv!8106 _values!506) e!235122)))

(assert (=> start!37770 tp!31412))

(assert (=> start!37770 true))

(declare-fun tp_is_empty!9559 () Bool)

(assert (=> start!37770 tp_is_empty!9559))

(declare-fun array_inv!8107 (array!22998) Bool)

(assert (=> start!37770 (array_inv!8107 _keys!658)))

(declare-fun b!387958 () Bool)

(declare-fun res!221813 () Bool)

(assert (=> b!387958 (=> (not res!221813) (not e!235120))))

(assert (=> b!387958 (= res!221813 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!387959 () Bool)

(declare-fun res!221805 () Bool)

(assert (=> b!387959 (=> (not res!221805) (not e!235117))))

(assert (=> b!387959 (= res!221805 (arrayNoDuplicates!0 lt!182191 #b00000000000000000000000000000000 Nil!6197))))

(declare-fun b!387960 () Bool)

(declare-datatypes ((tuple2!6350 0))(
  ( (tuple2!6351 (_1!3186 (_ BitVec 64)) (_2!3186 V!13851)) )
))
(declare-datatypes ((List!6201 0))(
  ( (Nil!6198) (Cons!6197 (h!7053 tuple2!6350) (t!11343 List!6201)) )
))
(declare-datatypes ((ListLongMap!5265 0))(
  ( (ListLongMap!5266 (toList!2648 List!6201)) )
))
(declare-fun lt!182193 () ListLongMap!5265)

(declare-fun lt!182192 () ListLongMap!5265)

(assert (=> b!387960 (= e!235117 (not (= lt!182193 lt!182192)))))

(assert (=> b!387960 (= lt!182192 lt!182193)))

(declare-fun v!373 () V!13851)

(declare-fun lt!182194 () ListLongMap!5265)

(declare-fun +!1002 (ListLongMap!5265 tuple2!6350) ListLongMap!5265)

(assert (=> b!387960 (= lt!182193 (+!1002 lt!182194 (tuple2!6351 k0!778 v!373)))))

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((Unit!11871 0))(
  ( (Unit!11872) )
))
(declare-fun lt!182190 () Unit!11871)

(declare-fun zeroValue!472 () V!13851)

(declare-fun minValue!472 () V!13851)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!225 (array!22998 array!23000 (_ BitVec 32) (_ BitVec 32) V!13851 V!13851 (_ BitVec 32) (_ BitVec 64) V!13851 (_ BitVec 32) Int) Unit!11871)

(assert (=> b!387960 (= lt!182190 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!225 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!923 (array!22998 array!23000 (_ BitVec 32) (_ BitVec 32) V!13851 V!13851 (_ BitVec 32) Int) ListLongMap!5265)

(assert (=> b!387960 (= lt!182192 (getCurrentListMapNoExtraKeys!923 lt!182191 (array!23001 (store (arr!10968 _values!506) i!548 (ValueCellFull!4436 v!373)) (size!11320 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!387960 (= lt!182194 (getCurrentListMapNoExtraKeys!923 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!387961 () Bool)

(assert (=> b!387961 (= e!235119 tp_is_empty!9559)))

(declare-fun b!387962 () Bool)

(declare-fun res!221810 () Bool)

(assert (=> b!387962 (=> (not res!221810) (not e!235120))))

(assert (=> b!387962 (= res!221810 (or (= (select (arr!10967 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10967 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!387963 () Bool)

(declare-fun res!221811 () Bool)

(assert (=> b!387963 (=> (not res!221811) (not e!235120))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!387963 (= res!221811 (validKeyInArray!0 k0!778))))

(declare-fun b!387964 () Bool)

(assert (=> b!387964 (= e!235121 tp_is_empty!9559)))

(assert (= (and start!37770 res!221804) b!387953))

(assert (= (and b!387953 res!221812) b!387958))

(assert (= (and b!387958 res!221813) b!387954))

(assert (= (and b!387954 res!221808) b!387952))

(assert (= (and b!387952 res!221807) b!387963))

(assert (= (and b!387963 res!221811) b!387962))

(assert (= (and b!387962 res!221810) b!387957))

(assert (= (and b!387957 res!221806) b!387955))

(assert (= (and b!387955 res!221809) b!387959))

(assert (= (and b!387959 res!221805) b!387960))

(assert (= (and b!387956 condMapEmpty!15903) mapIsEmpty!15903))

(assert (= (and b!387956 (not condMapEmpty!15903)) mapNonEmpty!15903))

(get-info :version)

(assert (= (and mapNonEmpty!15903 ((_ is ValueCellFull!4436) mapValue!15903)) b!387964))

(assert (= (and b!387956 ((_ is ValueCellFull!4436) mapDefault!15903)) b!387961))

(assert (= start!37770 b!387956))

(declare-fun m!384215 () Bool)

(assert (=> b!387957 m!384215))

(declare-fun m!384217 () Bool)

(assert (=> b!387958 m!384217))

(declare-fun m!384219 () Bool)

(assert (=> b!387955 m!384219))

(declare-fun m!384221 () Bool)

(assert (=> b!387955 m!384221))

(declare-fun m!384223 () Bool)

(assert (=> b!387960 m!384223))

(declare-fun m!384225 () Bool)

(assert (=> b!387960 m!384225))

(declare-fun m!384227 () Bool)

(assert (=> b!387960 m!384227))

(declare-fun m!384229 () Bool)

(assert (=> b!387960 m!384229))

(declare-fun m!384231 () Bool)

(assert (=> b!387960 m!384231))

(declare-fun m!384233 () Bool)

(assert (=> mapNonEmpty!15903 m!384233))

(declare-fun m!384235 () Bool)

(assert (=> b!387954 m!384235))

(declare-fun m!384237 () Bool)

(assert (=> b!387962 m!384237))

(declare-fun m!384239 () Bool)

(assert (=> b!387959 m!384239))

(declare-fun m!384241 () Bool)

(assert (=> b!387963 m!384241))

(declare-fun m!384243 () Bool)

(assert (=> start!37770 m!384243))

(declare-fun m!384245 () Bool)

(assert (=> start!37770 m!384245))

(declare-fun m!384247 () Bool)

(assert (=> start!37770 m!384247))

(check-sat b_and!16143 (not b!387955) (not b!387959) (not b!387958) (not b_next!8887) (not mapNonEmpty!15903) tp_is_empty!9559 (not b!387960) (not b!387954) (not start!37770) (not b!387963) (not b!387957))
(check-sat b_and!16143 (not b_next!8887))
