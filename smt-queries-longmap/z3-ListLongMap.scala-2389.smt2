; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37782 () Bool)

(assert start!37782)

(declare-fun b_free!8899 () Bool)

(declare-fun b_next!8899 () Bool)

(assert (=> start!37782 (= b_free!8899 (not b_next!8899))))

(declare-fun tp!31448 () Bool)

(declare-fun b_and!16115 () Bool)

(assert (=> start!37782 (= tp!31448 b_and!16115)))

(declare-fun b!387964 () Bool)

(declare-fun e!235085 () Bool)

(declare-fun e!235086 () Bool)

(declare-fun mapRes!15921 () Bool)

(assert (=> b!387964 (= e!235085 (and e!235086 mapRes!15921))))

(declare-fun condMapEmpty!15921 () Bool)

(declare-datatypes ((V!13867 0))(
  ( (V!13868 (val!4830 Int)) )
))
(declare-datatypes ((ValueCell!4442 0))(
  ( (ValueCellFull!4442 (v!7021 V!13867)) (EmptyCell!4442) )
))
(declare-datatypes ((array!23021 0))(
  ( (array!23022 (arr!10979 (Array (_ BitVec 32) ValueCell!4442)) (size!11332 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!23021)

(declare-fun mapDefault!15921 () ValueCell!4442)

(assert (=> b!387964 (= condMapEmpty!15921 (= (arr!10979 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4442)) mapDefault!15921)))))

(declare-fun b!387965 () Bool)

(declare-fun res!221858 () Bool)

(declare-fun e!235084 () Bool)

(assert (=> b!387965 (=> (not res!221858) (not e!235084))))

(declare-datatypes ((array!23023 0))(
  ( (array!23024 (arr!10980 (Array (_ BitVec 32) (_ BitVec 64))) (size!11333 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!23023)

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!23023 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!387965 (= res!221858 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!387966 () Bool)

(declare-fun e!235087 () Bool)

(assert (=> b!387966 (= e!235084 e!235087)))

(declare-fun res!221862 () Bool)

(assert (=> b!387966 (=> (not res!221862) (not e!235087))))

(declare-fun lt!182028 () array!23023)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23023 (_ BitVec 32)) Bool)

(assert (=> b!387966 (= res!221862 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!182028 mask!970))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!387966 (= lt!182028 (array!23024 (store (arr!10980 _keys!658) i!548 k0!778) (size!11333 _keys!658)))))

(declare-fun res!221866 () Bool)

(assert (=> start!37782 (=> (not res!221866) (not e!235084))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37782 (= res!221866 (validMask!0 mask!970))))

(assert (=> start!37782 e!235084))

(declare-fun array_inv!8074 (array!23021) Bool)

(assert (=> start!37782 (and (array_inv!8074 _values!506) e!235085)))

(assert (=> start!37782 tp!31448))

(assert (=> start!37782 true))

(declare-fun tp_is_empty!9571 () Bool)

(assert (=> start!37782 tp_is_empty!9571))

(declare-fun array_inv!8075 (array!23023) Bool)

(assert (=> start!37782 (array_inv!8075 _keys!658)))

(declare-fun b!387967 () Bool)

(declare-fun res!221865 () Bool)

(assert (=> b!387967 (=> (not res!221865) (not e!235084))))

(assert (=> b!387967 (= res!221865 (or (= (select (arr!10980 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10980 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!387968 () Bool)

(declare-fun res!221867 () Bool)

(assert (=> b!387968 (=> (not res!221867) (not e!235084))))

(assert (=> b!387968 (= res!221867 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11333 _keys!658))))))

(declare-fun b!387969 () Bool)

(declare-fun res!221861 () Bool)

(assert (=> b!387969 (=> (not res!221861) (not e!235084))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!387969 (= res!221861 (validKeyInArray!0 k0!778))))

(declare-fun b!387970 () Bool)

(assert (=> b!387970 (= e!235086 tp_is_empty!9571)))

(declare-fun b!387971 () Bool)

(declare-fun res!221863 () Bool)

(assert (=> b!387971 (=> (not res!221863) (not e!235084))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!387971 (= res!221863 (and (= (size!11332 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11333 _keys!658) (size!11332 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!387972 () Bool)

(declare-fun res!221860 () Bool)

(assert (=> b!387972 (=> (not res!221860) (not e!235084))))

(declare-datatypes ((List!6315 0))(
  ( (Nil!6312) (Cons!6311 (h!7167 (_ BitVec 64)) (t!11456 List!6315)) )
))
(declare-fun arrayNoDuplicates!0 (array!23023 (_ BitVec 32) List!6315) Bool)

(assert (=> b!387972 (= res!221860 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6312))))

(declare-fun b!387973 () Bool)

(declare-fun e!235083 () Bool)

(assert (=> b!387973 (= e!235083 tp_is_empty!9571)))

(declare-fun b!387974 () Bool)

(assert (=> b!387974 (= e!235087 (not (bvslt i!548 (size!11332 _values!506))))))

(declare-datatypes ((tuple2!6472 0))(
  ( (tuple2!6473 (_1!3247 (_ BitVec 64)) (_2!3247 V!13867)) )
))
(declare-datatypes ((List!6316 0))(
  ( (Nil!6313) (Cons!6312 (h!7168 tuple2!6472) (t!11457 List!6316)) )
))
(declare-datatypes ((ListLongMap!5375 0))(
  ( (ListLongMap!5376 (toList!2703 List!6316)) )
))
(declare-fun lt!182031 () ListLongMap!5375)

(declare-fun lt!182030 () ListLongMap!5375)

(assert (=> b!387974 (and (= lt!182031 lt!182030) (= lt!182030 lt!182031))))

(declare-fun v!373 () V!13867)

(declare-fun lt!182027 () ListLongMap!5375)

(declare-fun +!1023 (ListLongMap!5375 tuple2!6472) ListLongMap!5375)

(assert (=> b!387974 (= lt!182030 (+!1023 lt!182027 (tuple2!6473 k0!778 v!373)))))

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13867)

(declare-datatypes ((Unit!11888 0))(
  ( (Unit!11889) )
))
(declare-fun lt!182029 () Unit!11888)

(declare-fun minValue!472 () V!13867)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!234 (array!23023 array!23021 (_ BitVec 32) (_ BitVec 32) V!13867 V!13867 (_ BitVec 32) (_ BitVec 64) V!13867 (_ BitVec 32) Int) Unit!11888)

(assert (=> b!387974 (= lt!182029 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!234 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!943 (array!23023 array!23021 (_ BitVec 32) (_ BitVec 32) V!13867 V!13867 (_ BitVec 32) Int) ListLongMap!5375)

(assert (=> b!387974 (= lt!182031 (getCurrentListMapNoExtraKeys!943 lt!182028 (array!23022 (store (arr!10979 _values!506) i!548 (ValueCellFull!4442 v!373)) (size!11332 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!387974 (= lt!182027 (getCurrentListMapNoExtraKeys!943 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun mapIsEmpty!15921 () Bool)

(assert (=> mapIsEmpty!15921 mapRes!15921))

(declare-fun b!387975 () Bool)

(declare-fun res!221864 () Bool)

(assert (=> b!387975 (=> (not res!221864) (not e!235084))))

(assert (=> b!387975 (= res!221864 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!387976 () Bool)

(declare-fun res!221859 () Bool)

(assert (=> b!387976 (=> (not res!221859) (not e!235087))))

(assert (=> b!387976 (= res!221859 (arrayNoDuplicates!0 lt!182028 #b00000000000000000000000000000000 Nil!6312))))

(declare-fun mapNonEmpty!15921 () Bool)

(declare-fun tp!31449 () Bool)

(assert (=> mapNonEmpty!15921 (= mapRes!15921 (and tp!31449 e!235083))))

(declare-fun mapKey!15921 () (_ BitVec 32))

(declare-fun mapRest!15921 () (Array (_ BitVec 32) ValueCell!4442))

(declare-fun mapValue!15921 () ValueCell!4442)

(assert (=> mapNonEmpty!15921 (= (arr!10979 _values!506) (store mapRest!15921 mapKey!15921 mapValue!15921))))

(assert (= (and start!37782 res!221866) b!387971))

(assert (= (and b!387971 res!221863) b!387975))

(assert (= (and b!387975 res!221864) b!387972))

(assert (= (and b!387972 res!221860) b!387968))

(assert (= (and b!387968 res!221867) b!387969))

(assert (= (and b!387969 res!221861) b!387967))

(assert (= (and b!387967 res!221865) b!387965))

(assert (= (and b!387965 res!221858) b!387966))

(assert (= (and b!387966 res!221862) b!387976))

(assert (= (and b!387976 res!221859) b!387974))

(assert (= (and b!387964 condMapEmpty!15921) mapIsEmpty!15921))

(assert (= (and b!387964 (not condMapEmpty!15921)) mapNonEmpty!15921))

(get-info :version)

(assert (= (and mapNonEmpty!15921 ((_ is ValueCellFull!4442) mapValue!15921)) b!387973))

(assert (= (and b!387964 ((_ is ValueCellFull!4442) mapDefault!15921)) b!387970))

(assert (= start!37782 b!387964))

(declare-fun m!383465 () Bool)

(assert (=> b!387967 m!383465))

(declare-fun m!383467 () Bool)

(assert (=> b!387974 m!383467))

(declare-fun m!383469 () Bool)

(assert (=> b!387974 m!383469))

(declare-fun m!383471 () Bool)

(assert (=> b!387974 m!383471))

(declare-fun m!383473 () Bool)

(assert (=> b!387974 m!383473))

(declare-fun m!383475 () Bool)

(assert (=> b!387974 m!383475))

(declare-fun m!383477 () Bool)

(assert (=> start!37782 m!383477))

(declare-fun m!383479 () Bool)

(assert (=> start!37782 m!383479))

(declare-fun m!383481 () Bool)

(assert (=> start!37782 m!383481))

(declare-fun m!383483 () Bool)

(assert (=> b!387965 m!383483))

(declare-fun m!383485 () Bool)

(assert (=> b!387966 m!383485))

(declare-fun m!383487 () Bool)

(assert (=> b!387966 m!383487))

(declare-fun m!383489 () Bool)

(assert (=> mapNonEmpty!15921 m!383489))

(declare-fun m!383491 () Bool)

(assert (=> b!387969 m!383491))

(declare-fun m!383493 () Bool)

(assert (=> b!387975 m!383493))

(declare-fun m!383495 () Bool)

(assert (=> b!387976 m!383495))

(declare-fun m!383497 () Bool)

(assert (=> b!387972 m!383497))

(check-sat (not b!387969) (not b!387965) (not b!387972) (not start!37782) (not b!387975) (not b!387966) b_and!16115 (not b!387976) (not b!387974) (not mapNonEmpty!15921) tp_is_empty!9571 (not b_next!8899))
(check-sat b_and!16115 (not b_next!8899))
