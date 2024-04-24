; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37392 () Bool)

(assert start!37392)

(declare-fun b_free!8533 () Bool)

(declare-fun b_next!8533 () Bool)

(assert (=> start!37392 (= b_free!8533 (not b_next!8533))))

(declare-fun tp!30315 () Bool)

(declare-fun b_and!15789 () Bool)

(assert (=> start!37392 (= tp!30315 b_and!15789)))

(declare-fun b!380396 () Bool)

(declare-fun res!215959 () Bool)

(declare-fun e!231366 () Bool)

(assert (=> b!380396 (=> (not res!215959) (not e!231366))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!380396 (= res!215959 (validKeyInArray!0 k0!778))))

(declare-fun b!380397 () Bool)

(declare-fun res!215953 () Bool)

(assert (=> b!380397 (=> (not res!215953) (not e!231366))))

(declare-datatypes ((array!22266 0))(
  ( (array!22267 (arr!10601 (Array (_ BitVec 32) (_ BitVec 64))) (size!10953 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22266)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22266 (_ BitVec 32)) Bool)

(assert (=> b!380397 (= res!215953 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!380398 () Bool)

(declare-fun res!215957 () Bool)

(declare-fun e!231361 () Bool)

(assert (=> b!380398 (=> (not res!215957) (not e!231361))))

(declare-fun lt!178087 () array!22266)

(declare-datatypes ((List!5932 0))(
  ( (Nil!5929) (Cons!5928 (h!6784 (_ BitVec 64)) (t!11074 List!5932)) )
))
(declare-fun arrayNoDuplicates!0 (array!22266 (_ BitVec 32) List!5932) Bool)

(assert (=> b!380398 (= res!215957 (arrayNoDuplicates!0 lt!178087 #b00000000000000000000000000000000 Nil!5929))))

(declare-fun b!380399 () Bool)

(declare-fun e!231359 () Bool)

(declare-fun e!231365 () Bool)

(declare-fun mapRes!15336 () Bool)

(assert (=> b!380399 (= e!231359 (and e!231365 mapRes!15336))))

(declare-fun condMapEmpty!15336 () Bool)

(declare-datatypes ((V!13347 0))(
  ( (V!13348 (val!4635 Int)) )
))
(declare-datatypes ((ValueCell!4247 0))(
  ( (ValueCellFull!4247 (v!6833 V!13347)) (EmptyCell!4247) )
))
(declare-datatypes ((array!22268 0))(
  ( (array!22269 (arr!10602 (Array (_ BitVec 32) ValueCell!4247)) (size!10954 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22268)

(declare-fun mapDefault!15336 () ValueCell!4247)

(assert (=> b!380399 (= condMapEmpty!15336 (= (arr!10602 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4247)) mapDefault!15336)))))

(declare-fun mapIsEmpty!15336 () Bool)

(assert (=> mapIsEmpty!15336 mapRes!15336))

(declare-fun b!380400 () Bool)

(declare-fun res!215956 () Bool)

(assert (=> b!380400 (=> (not res!215956) (not e!231366))))

(assert (=> b!380400 (= res!215956 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5929))))

(declare-fun b!380401 () Bool)

(assert (=> b!380401 (= e!231366 e!231361)))

(declare-fun res!215949 () Bool)

(assert (=> b!380401 (=> (not res!215949) (not e!231361))))

(assert (=> b!380401 (= res!215949 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!178087 mask!970))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!380401 (= lt!178087 (array!22267 (store (arr!10601 _keys!658) i!548 k0!778) (size!10953 _keys!658)))))

(declare-fun b!380402 () Bool)

(declare-fun e!231363 () Bool)

(assert (=> b!380402 (= e!231361 (not e!231363))))

(declare-fun res!215958 () Bool)

(assert (=> b!380402 (=> res!215958 e!231363)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!380402 (= res!215958 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!6094 0))(
  ( (tuple2!6095 (_1!3058 (_ BitVec 64)) (_2!3058 V!13347)) )
))
(declare-datatypes ((List!5933 0))(
  ( (Nil!5930) (Cons!5929 (h!6785 tuple2!6094) (t!11075 List!5933)) )
))
(declare-datatypes ((ListLongMap!5009 0))(
  ( (ListLongMap!5010 (toList!2520 List!5933)) )
))
(declare-fun lt!178077 () ListLongMap!5009)

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13347)

(declare-fun minValue!472 () V!13347)

(declare-fun getCurrentListMap!1959 (array!22266 array!22268 (_ BitVec 32) (_ BitVec 32) V!13347 V!13347 (_ BitVec 32) Int) ListLongMap!5009)

(assert (=> b!380402 (= lt!178077 (getCurrentListMap!1959 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!178078 () array!22268)

(declare-fun lt!178081 () ListLongMap!5009)

(assert (=> b!380402 (= lt!178081 (getCurrentListMap!1959 lt!178087 lt!178078 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!178076 () ListLongMap!5009)

(declare-fun lt!178084 () ListLongMap!5009)

(assert (=> b!380402 (and (= lt!178076 lt!178084) (= lt!178084 lt!178076))))

(declare-fun lt!178079 () ListLongMap!5009)

(declare-fun lt!178083 () tuple2!6094)

(declare-fun +!916 (ListLongMap!5009 tuple2!6094) ListLongMap!5009)

(assert (=> b!380402 (= lt!178084 (+!916 lt!178079 lt!178083))))

(declare-fun v!373 () V!13347)

(assert (=> b!380402 (= lt!178083 (tuple2!6095 k0!778 v!373))))

(declare-datatypes ((Unit!11713 0))(
  ( (Unit!11714) )
))
(declare-fun lt!178080 () Unit!11713)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!146 (array!22266 array!22268 (_ BitVec 32) (_ BitVec 32) V!13347 V!13347 (_ BitVec 32) (_ BitVec 64) V!13347 (_ BitVec 32) Int) Unit!11713)

(assert (=> b!380402 (= lt!178080 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!146 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!806 (array!22266 array!22268 (_ BitVec 32) (_ BitVec 32) V!13347 V!13347 (_ BitVec 32) Int) ListLongMap!5009)

(assert (=> b!380402 (= lt!178076 (getCurrentListMapNoExtraKeys!806 lt!178087 lt!178078 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!380402 (= lt!178078 (array!22269 (store (arr!10602 _values!506) i!548 (ValueCellFull!4247 v!373)) (size!10954 _values!506)))))

(assert (=> b!380402 (= lt!178079 (getCurrentListMapNoExtraKeys!806 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun res!215952 () Bool)

(assert (=> start!37392 (=> (not res!215952) (not e!231366))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37392 (= res!215952 (validMask!0 mask!970))))

(assert (=> start!37392 e!231366))

(declare-fun array_inv!7848 (array!22268) Bool)

(assert (=> start!37392 (and (array_inv!7848 _values!506) e!231359)))

(assert (=> start!37392 tp!30315))

(assert (=> start!37392 true))

(declare-fun tp_is_empty!9181 () Bool)

(assert (=> start!37392 tp_is_empty!9181))

(declare-fun array_inv!7849 (array!22266) Bool)

(assert (=> start!37392 (array_inv!7849 _keys!658)))

(declare-fun b!380403 () Bool)

(assert (=> b!380403 (= e!231365 tp_is_empty!9181)))

(declare-fun b!380404 () Bool)

(declare-fun e!231364 () Bool)

(assert (=> b!380404 (= e!231363 e!231364)))

(declare-fun res!215951 () Bool)

(assert (=> b!380404 (=> res!215951 e!231364)))

(assert (=> b!380404 (= res!215951 (= k0!778 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!178082 () ListLongMap!5009)

(assert (=> b!380404 (= lt!178077 lt!178082)))

(declare-fun lt!178086 () tuple2!6094)

(assert (=> b!380404 (= lt!178082 (+!916 lt!178079 lt!178086))))

(declare-fun lt!178085 () ListLongMap!5009)

(assert (=> b!380404 (= lt!178081 lt!178085)))

(assert (=> b!380404 (= lt!178085 (+!916 lt!178084 lt!178086))))

(assert (=> b!380404 (= lt!178081 (+!916 lt!178076 lt!178086))))

(assert (=> b!380404 (= lt!178086 (tuple2!6095 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!380405 () Bool)

(declare-fun e!231360 () Bool)

(assert (=> b!380405 (= e!231360 tp_is_empty!9181)))

(declare-fun b!380406 () Bool)

(declare-fun res!215950 () Bool)

(assert (=> b!380406 (=> (not res!215950) (not e!231366))))

(assert (=> b!380406 (= res!215950 (or (= (select (arr!10601 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10601 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!380407 () Bool)

(declare-fun res!215960 () Bool)

(assert (=> b!380407 (=> (not res!215960) (not e!231366))))

(assert (=> b!380407 (= res!215960 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10953 _keys!658))))))

(declare-fun b!380408 () Bool)

(declare-fun res!215955 () Bool)

(assert (=> b!380408 (=> (not res!215955) (not e!231366))))

(assert (=> b!380408 (= res!215955 (and (= (size!10954 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10953 _keys!658) (size!10954 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!380409 () Bool)

(assert (=> b!380409 (= e!231364 true)))

(assert (=> b!380409 (= lt!178085 (+!916 lt!178082 lt!178083))))

(declare-fun lt!178075 () Unit!11713)

(declare-fun addCommutativeForDiffKeys!326 (ListLongMap!5009 (_ BitVec 64) V!13347 (_ BitVec 64) V!13347) Unit!11713)

(assert (=> b!380409 (= lt!178075 (addCommutativeForDiffKeys!326 lt!178079 k0!778 v!373 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun mapNonEmpty!15336 () Bool)

(declare-fun tp!30314 () Bool)

(assert (=> mapNonEmpty!15336 (= mapRes!15336 (and tp!30314 e!231360))))

(declare-fun mapRest!15336 () (Array (_ BitVec 32) ValueCell!4247))

(declare-fun mapValue!15336 () ValueCell!4247)

(declare-fun mapKey!15336 () (_ BitVec 32))

(assert (=> mapNonEmpty!15336 (= (arr!10602 _values!506) (store mapRest!15336 mapKey!15336 mapValue!15336))))

(declare-fun b!380410 () Bool)

(declare-fun res!215954 () Bool)

(assert (=> b!380410 (=> (not res!215954) (not e!231366))))

(declare-fun arrayContainsKey!0 (array!22266 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!380410 (= res!215954 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(assert (= (and start!37392 res!215952) b!380408))

(assert (= (and b!380408 res!215955) b!380397))

(assert (= (and b!380397 res!215953) b!380400))

(assert (= (and b!380400 res!215956) b!380407))

(assert (= (and b!380407 res!215960) b!380396))

(assert (= (and b!380396 res!215959) b!380406))

(assert (= (and b!380406 res!215950) b!380410))

(assert (= (and b!380410 res!215954) b!380401))

(assert (= (and b!380401 res!215949) b!380398))

(assert (= (and b!380398 res!215957) b!380402))

(assert (= (and b!380402 (not res!215958)) b!380404))

(assert (= (and b!380404 (not res!215951)) b!380409))

(assert (= (and b!380399 condMapEmpty!15336) mapIsEmpty!15336))

(assert (= (and b!380399 (not condMapEmpty!15336)) mapNonEmpty!15336))

(get-info :version)

(assert (= (and mapNonEmpty!15336 ((_ is ValueCellFull!4247) mapValue!15336)) b!380405))

(assert (= (and b!380399 ((_ is ValueCellFull!4247) mapDefault!15336)) b!380403))

(assert (= start!37392 b!380399))

(declare-fun m!377621 () Bool)

(assert (=> b!380406 m!377621))

(declare-fun m!377623 () Bool)

(assert (=> mapNonEmpty!15336 m!377623))

(declare-fun m!377625 () Bool)

(assert (=> b!380409 m!377625))

(declare-fun m!377627 () Bool)

(assert (=> b!380409 m!377627))

(declare-fun m!377629 () Bool)

(assert (=> b!380396 m!377629))

(declare-fun m!377631 () Bool)

(assert (=> start!37392 m!377631))

(declare-fun m!377633 () Bool)

(assert (=> start!37392 m!377633))

(declare-fun m!377635 () Bool)

(assert (=> start!37392 m!377635))

(declare-fun m!377637 () Bool)

(assert (=> b!380398 m!377637))

(declare-fun m!377639 () Bool)

(assert (=> b!380397 m!377639))

(declare-fun m!377641 () Bool)

(assert (=> b!380404 m!377641))

(declare-fun m!377643 () Bool)

(assert (=> b!380404 m!377643))

(declare-fun m!377645 () Bool)

(assert (=> b!380404 m!377645))

(declare-fun m!377647 () Bool)

(assert (=> b!380402 m!377647))

(declare-fun m!377649 () Bool)

(assert (=> b!380402 m!377649))

(declare-fun m!377651 () Bool)

(assert (=> b!380402 m!377651))

(declare-fun m!377653 () Bool)

(assert (=> b!380402 m!377653))

(declare-fun m!377655 () Bool)

(assert (=> b!380402 m!377655))

(declare-fun m!377657 () Bool)

(assert (=> b!380402 m!377657))

(declare-fun m!377659 () Bool)

(assert (=> b!380402 m!377659))

(declare-fun m!377661 () Bool)

(assert (=> b!380410 m!377661))

(declare-fun m!377663 () Bool)

(assert (=> b!380400 m!377663))

(declare-fun m!377665 () Bool)

(assert (=> b!380401 m!377665))

(declare-fun m!377667 () Bool)

(assert (=> b!380401 m!377667))

(check-sat (not b!380397) b_and!15789 (not b!380396) (not b!380404) (not b!380410) (not b!380402) (not b!380409) (not b_next!8533) (not b!380401) (not b!380398) (not mapNonEmpty!15336) (not start!37392) tp_is_empty!9181 (not b!380400))
(check-sat b_and!15789 (not b_next!8533))
