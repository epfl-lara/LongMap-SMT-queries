; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37404 () Bool)

(assert start!37404)

(declare-fun b_free!8545 () Bool)

(declare-fun b_next!8545 () Bool)

(assert (=> start!37404 (= b_free!8545 (not b_next!8545))))

(declare-fun tp!30351 () Bool)

(declare-fun b_and!15761 () Bool)

(assert (=> start!37404 (= tp!30351 b_and!15761)))

(declare-fun b!380444 () Bool)

(declare-fun res!216048 () Bool)

(declare-fun e!231364 () Bool)

(assert (=> b!380444 (=> (not res!216048) (not e!231364))))

(declare-datatypes ((array!22285 0))(
  ( (array!22286 (arr!10611 (Array (_ BitVec 32) (_ BitVec 64))) (size!10964 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22285)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!380444 (= res!216048 (or (= (select (arr!10611 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10611 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!380445 () Bool)

(declare-fun e!231366 () Bool)

(assert (=> b!380445 (= e!231364 e!231366)))

(declare-fun res!216044 () Bool)

(assert (=> b!380445 (=> (not res!216044) (not e!231366))))

(declare-fun lt!178058 () array!22285)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22285 (_ BitVec 32)) Bool)

(assert (=> b!380445 (= res!216044 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!178058 mask!970))))

(declare-fun k0!778 () (_ BitVec 64))

(assert (=> b!380445 (= lt!178058 (array!22286 (store (arr!10611 _keys!658) i!548 k0!778) (size!10964 _keys!658)))))

(declare-fun b!380446 () Bool)

(declare-fun res!216041 () Bool)

(assert (=> b!380446 (=> (not res!216041) (not e!231364))))

(declare-datatypes ((List!6025 0))(
  ( (Nil!6022) (Cons!6021 (h!6877 (_ BitVec 64)) (t!11166 List!6025)) )
))
(declare-fun arrayNoDuplicates!0 (array!22285 (_ BitVec 32) List!6025) Bool)

(assert (=> b!380446 (= res!216041 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6022))))

(declare-fun b!380447 () Bool)

(declare-fun e!231365 () Bool)

(assert (=> b!380447 (= e!231366 (not e!231365))))

(declare-fun res!216039 () Bool)

(assert (=> b!380447 (=> res!216039 e!231365)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!380447 (= res!216039 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!13363 0))(
  ( (V!13364 (val!4641 Int)) )
))
(declare-datatypes ((tuple2!6196 0))(
  ( (tuple2!6197 (_1!3109 (_ BitVec 64)) (_2!3109 V!13363)) )
))
(declare-datatypes ((List!6026 0))(
  ( (Nil!6023) (Cons!6022 (h!6878 tuple2!6196) (t!11167 List!6026)) )
))
(declare-datatypes ((ListLongMap!5099 0))(
  ( (ListLongMap!5100 (toList!2565 List!6026)) )
))
(declare-fun lt!178057 () ListLongMap!5099)

(declare-datatypes ((ValueCell!4253 0))(
  ( (ValueCellFull!4253 (v!6832 V!13363)) (EmptyCell!4253) )
))
(declare-datatypes ((array!22287 0))(
  ( (array!22288 (arr!10612 (Array (_ BitVec 32) ValueCell!4253)) (size!10965 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22287)

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13363)

(declare-fun minValue!472 () V!13363)

(declare-fun getCurrentListMap!1959 (array!22285 array!22287 (_ BitVec 32) (_ BitVec 32) V!13363 V!13363 (_ BitVec 32) Int) ListLongMap!5099)

(assert (=> b!380447 (= lt!178057 (getCurrentListMap!1959 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!178067 () array!22287)

(declare-fun lt!178064 () ListLongMap!5099)

(assert (=> b!380447 (= lt!178064 (getCurrentListMap!1959 lt!178058 lt!178067 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!178065 () ListLongMap!5099)

(declare-fun lt!178061 () ListLongMap!5099)

(assert (=> b!380447 (and (= lt!178065 lt!178061) (= lt!178061 lt!178065))))

(declare-fun lt!178066 () ListLongMap!5099)

(declare-fun lt!178056 () tuple2!6196)

(declare-fun +!933 (ListLongMap!5099 tuple2!6196) ListLongMap!5099)

(assert (=> b!380447 (= lt!178061 (+!933 lt!178066 lt!178056))))

(declare-fun v!373 () V!13363)

(assert (=> b!380447 (= lt!178056 (tuple2!6197 k0!778 v!373))))

(declare-datatypes ((Unit!11724 0))(
  ( (Unit!11725) )
))
(declare-fun lt!178060 () Unit!11724)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!152 (array!22285 array!22287 (_ BitVec 32) (_ BitVec 32) V!13363 V!13363 (_ BitVec 32) (_ BitVec 64) V!13363 (_ BitVec 32) Int) Unit!11724)

(assert (=> b!380447 (= lt!178060 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!152 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!824 (array!22285 array!22287 (_ BitVec 32) (_ BitVec 32) V!13363 V!13363 (_ BitVec 32) Int) ListLongMap!5099)

(assert (=> b!380447 (= lt!178065 (getCurrentListMapNoExtraKeys!824 lt!178058 lt!178067 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!380447 (= lt!178067 (array!22288 (store (arr!10612 _values!506) i!548 (ValueCellFull!4253 v!373)) (size!10965 _values!506)))))

(assert (=> b!380447 (= lt!178066 (getCurrentListMapNoExtraKeys!824 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!380448 () Bool)

(declare-fun e!231363 () Bool)

(declare-fun tp_is_empty!9193 () Bool)

(assert (=> b!380448 (= e!231363 tp_is_empty!9193)))

(declare-fun b!380449 () Bool)

(declare-fun e!231362 () Bool)

(assert (=> b!380449 (= e!231362 (bvsle #b00000000000000000000000000000000 (size!10964 _keys!658)))))

(declare-fun lt!178063 () ListLongMap!5099)

(declare-fun lt!178062 () ListLongMap!5099)

(assert (=> b!380449 (= lt!178063 (+!933 lt!178062 lt!178056))))

(declare-fun lt!178068 () Unit!11724)

(declare-fun addCommutativeForDiffKeys!323 (ListLongMap!5099 (_ BitVec 64) V!13363 (_ BitVec 64) V!13363) Unit!11724)

(assert (=> b!380449 (= lt!178068 (addCommutativeForDiffKeys!323 lt!178066 k0!778 v!373 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!380450 () Bool)

(assert (=> b!380450 (= e!231365 e!231362)))

(declare-fun res!216040 () Bool)

(assert (=> b!380450 (=> res!216040 e!231362)))

(assert (=> b!380450 (= res!216040 (= k0!778 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!380450 (= lt!178057 lt!178062)))

(declare-fun lt!178059 () tuple2!6196)

(assert (=> b!380450 (= lt!178062 (+!933 lt!178066 lt!178059))))

(assert (=> b!380450 (= lt!178064 lt!178063)))

(assert (=> b!380450 (= lt!178063 (+!933 lt!178061 lt!178059))))

(assert (=> b!380450 (= lt!178064 (+!933 lt!178065 lt!178059))))

(assert (=> b!380450 (= lt!178059 (tuple2!6197 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun res!216043 () Bool)

(assert (=> start!37404 (=> (not res!216043) (not e!231364))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37404 (= res!216043 (validMask!0 mask!970))))

(assert (=> start!37404 e!231364))

(declare-fun e!231368 () Bool)

(declare-fun array_inv!7814 (array!22287) Bool)

(assert (=> start!37404 (and (array_inv!7814 _values!506) e!231368)))

(assert (=> start!37404 tp!30351))

(assert (=> start!37404 true))

(assert (=> start!37404 tp_is_empty!9193))

(declare-fun array_inv!7815 (array!22285) Bool)

(assert (=> start!37404 (array_inv!7815 _keys!658)))

(declare-fun b!380451 () Bool)

(declare-fun res!216049 () Bool)

(assert (=> b!380451 (=> (not res!216049) (not e!231364))))

(assert (=> b!380451 (= res!216049 (and (= (size!10965 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10964 _keys!658) (size!10965 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!380452 () Bool)

(declare-fun res!216050 () Bool)

(assert (=> b!380452 (=> (not res!216050) (not e!231364))))

(assert (=> b!380452 (= res!216050 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!380453 () Bool)

(declare-fun res!216045 () Bool)

(assert (=> b!380453 (=> (not res!216045) (not e!231366))))

(assert (=> b!380453 (= res!216045 (arrayNoDuplicates!0 lt!178058 #b00000000000000000000000000000000 Nil!6022))))

(declare-fun b!380454 () Bool)

(declare-fun res!216047 () Bool)

(assert (=> b!380454 (=> (not res!216047) (not e!231364))))

(declare-fun arrayContainsKey!0 (array!22285 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!380454 (= res!216047 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!380455 () Bool)

(declare-fun res!216042 () Bool)

(assert (=> b!380455 (=> (not res!216042) (not e!231364))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!380455 (= res!216042 (validKeyInArray!0 k0!778))))

(declare-fun b!380456 () Bool)

(declare-fun e!231361 () Bool)

(assert (=> b!380456 (= e!231361 tp_is_empty!9193)))

(declare-fun mapIsEmpty!15354 () Bool)

(declare-fun mapRes!15354 () Bool)

(assert (=> mapIsEmpty!15354 mapRes!15354))

(declare-fun b!380457 () Bool)

(assert (=> b!380457 (= e!231368 (and e!231361 mapRes!15354))))

(declare-fun condMapEmpty!15354 () Bool)

(declare-fun mapDefault!15354 () ValueCell!4253)

(assert (=> b!380457 (= condMapEmpty!15354 (= (arr!10612 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4253)) mapDefault!15354)))))

(declare-fun mapNonEmpty!15354 () Bool)

(declare-fun tp!30350 () Bool)

(assert (=> mapNonEmpty!15354 (= mapRes!15354 (and tp!30350 e!231363))))

(declare-fun mapValue!15354 () ValueCell!4253)

(declare-fun mapRest!15354 () (Array (_ BitVec 32) ValueCell!4253))

(declare-fun mapKey!15354 () (_ BitVec 32))

(assert (=> mapNonEmpty!15354 (= (arr!10612 _values!506) (store mapRest!15354 mapKey!15354 mapValue!15354))))

(declare-fun b!380458 () Bool)

(declare-fun res!216046 () Bool)

(assert (=> b!380458 (=> (not res!216046) (not e!231364))))

(assert (=> b!380458 (= res!216046 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10964 _keys!658))))))

(assert (= (and start!37404 res!216043) b!380451))

(assert (= (and b!380451 res!216049) b!380452))

(assert (= (and b!380452 res!216050) b!380446))

(assert (= (and b!380446 res!216041) b!380458))

(assert (= (and b!380458 res!216046) b!380455))

(assert (= (and b!380455 res!216042) b!380444))

(assert (= (and b!380444 res!216048) b!380454))

(assert (= (and b!380454 res!216047) b!380445))

(assert (= (and b!380445 res!216044) b!380453))

(assert (= (and b!380453 res!216045) b!380447))

(assert (= (and b!380447 (not res!216039)) b!380450))

(assert (= (and b!380450 (not res!216040)) b!380449))

(assert (= (and b!380457 condMapEmpty!15354) mapIsEmpty!15354))

(assert (= (and b!380457 (not condMapEmpty!15354)) mapNonEmpty!15354))

(get-info :version)

(assert (= (and mapNonEmpty!15354 ((_ is ValueCellFull!4253) mapValue!15354)) b!380448))

(assert (= (and b!380457 ((_ is ValueCellFull!4253) mapDefault!15354)) b!380456))

(assert (= start!37404 b!380457))

(declare-fun m!376955 () Bool)

(assert (=> start!37404 m!376955))

(declare-fun m!376957 () Bool)

(assert (=> start!37404 m!376957))

(declare-fun m!376959 () Bool)

(assert (=> start!37404 m!376959))

(declare-fun m!376961 () Bool)

(assert (=> b!380447 m!376961))

(declare-fun m!376963 () Bool)

(assert (=> b!380447 m!376963))

(declare-fun m!376965 () Bool)

(assert (=> b!380447 m!376965))

(declare-fun m!376967 () Bool)

(assert (=> b!380447 m!376967))

(declare-fun m!376969 () Bool)

(assert (=> b!380447 m!376969))

(declare-fun m!376971 () Bool)

(assert (=> b!380447 m!376971))

(declare-fun m!376973 () Bool)

(assert (=> b!380447 m!376973))

(declare-fun m!376975 () Bool)

(assert (=> b!380450 m!376975))

(declare-fun m!376977 () Bool)

(assert (=> b!380450 m!376977))

(declare-fun m!376979 () Bool)

(assert (=> b!380450 m!376979))

(declare-fun m!376981 () Bool)

(assert (=> b!380453 m!376981))

(declare-fun m!376983 () Bool)

(assert (=> b!380444 m!376983))

(declare-fun m!376985 () Bool)

(assert (=> b!380454 m!376985))

(declare-fun m!376987 () Bool)

(assert (=> b!380446 m!376987))

(declare-fun m!376989 () Bool)

(assert (=> mapNonEmpty!15354 m!376989))

(declare-fun m!376991 () Bool)

(assert (=> b!380449 m!376991))

(declare-fun m!376993 () Bool)

(assert (=> b!380449 m!376993))

(declare-fun m!376995 () Bool)

(assert (=> b!380445 m!376995))

(declare-fun m!376997 () Bool)

(assert (=> b!380445 m!376997))

(declare-fun m!376999 () Bool)

(assert (=> b!380455 m!376999))

(declare-fun m!377001 () Bool)

(assert (=> b!380452 m!377001))

(check-sat (not b_next!8545) (not b!380453) (not mapNonEmpty!15354) b_and!15761 (not b!380455) (not start!37404) (not b!380447) tp_is_empty!9193 (not b!380449) (not b!380450) (not b!380446) (not b!380454) (not b!380445) (not b!380452))
(check-sat b_and!15761 (not b_next!8545))
