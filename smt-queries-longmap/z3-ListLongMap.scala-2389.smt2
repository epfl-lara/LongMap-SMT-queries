; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37798 () Bool)

(assert start!37798)

(declare-fun b_free!8901 () Bool)

(declare-fun b_next!8901 () Bool)

(assert (=> start!37798 (= b_free!8901 (not b_next!8901))))

(declare-fun tp!31454 () Bool)

(declare-fun b_and!16143 () Bool)

(assert (=> start!37798 (= tp!31454 b_and!16143)))

(declare-fun b!388274 () Bool)

(declare-fun res!222017 () Bool)

(declare-fun e!235279 () Bool)

(assert (=> b!388274 (=> (not res!222017) (not e!235279))))

(declare-datatypes ((array!23037 0))(
  ( (array!23038 (arr!10987 (Array (_ BitVec 32) (_ BitVec 64))) (size!11339 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!23037)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!388274 (= res!222017 (or (= (select (arr!10987 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10987 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!388276 () Bool)

(declare-fun res!222020 () Bool)

(assert (=> b!388276 (=> (not res!222020) (not e!235279))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23037 (_ BitVec 32)) Bool)

(assert (=> b!388276 (= res!222020 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun mapNonEmpty!15924 () Bool)

(declare-fun mapRes!15924 () Bool)

(declare-fun tp!31455 () Bool)

(declare-fun e!235277 () Bool)

(assert (=> mapNonEmpty!15924 (= mapRes!15924 (and tp!31455 e!235277))))

(declare-datatypes ((V!13869 0))(
  ( (V!13870 (val!4831 Int)) )
))
(declare-datatypes ((ValueCell!4443 0))(
  ( (ValueCellFull!4443 (v!7028 V!13869)) (EmptyCell!4443) )
))
(declare-datatypes ((array!23039 0))(
  ( (array!23040 (arr!10988 (Array (_ BitVec 32) ValueCell!4443)) (size!11340 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!23039)

(declare-fun mapKey!15924 () (_ BitVec 32))

(declare-fun mapValue!15924 () ValueCell!4443)

(declare-fun mapRest!15924 () (Array (_ BitVec 32) ValueCell!4443))

(assert (=> mapNonEmpty!15924 (= (arr!10988 _values!506) (store mapRest!15924 mapKey!15924 mapValue!15924))))

(declare-fun b!388277 () Bool)

(declare-fun res!222026 () Bool)

(assert (=> b!388277 (=> (not res!222026) (not e!235279))))

(assert (=> b!388277 (= res!222026 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11339 _keys!658))))))

(declare-fun b!388278 () Bool)

(declare-fun e!235280 () Bool)

(assert (=> b!388278 (= e!235279 e!235280)))

(declare-fun res!222018 () Bool)

(assert (=> b!388278 (=> (not res!222018) (not e!235280))))

(declare-fun lt!182279 () array!23037)

(assert (=> b!388278 (= res!222018 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!182279 mask!970))))

(declare-fun k0!778 () (_ BitVec 64))

(assert (=> b!388278 (= lt!182279 (array!23038 (store (arr!10987 _keys!658) i!548 k0!778) (size!11339 _keys!658)))))

(declare-fun b!388279 () Bool)

(declare-fun res!222021 () Bool)

(assert (=> b!388279 (=> (not res!222021) (not e!235279))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!388279 (= res!222021 (and (= (size!11340 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11339 _keys!658) (size!11340 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!388280 () Bool)

(declare-fun res!222024 () Bool)

(assert (=> b!388280 (=> (not res!222024) (not e!235280))))

(declare-datatypes ((List!6347 0))(
  ( (Nil!6344) (Cons!6343 (h!7199 (_ BitVec 64)) (t!11497 List!6347)) )
))
(declare-fun arrayNoDuplicates!0 (array!23037 (_ BitVec 32) List!6347) Bool)

(assert (=> b!388280 (= res!222024 (arrayNoDuplicates!0 lt!182279 #b00000000000000000000000000000000 Nil!6344))))

(declare-fun b!388281 () Bool)

(declare-fun res!222022 () Bool)

(assert (=> b!388281 (=> (not res!222022) (not e!235279))))

(assert (=> b!388281 (= res!222022 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6344))))

(declare-fun b!388282 () Bool)

(declare-fun e!235276 () Bool)

(declare-fun tp_is_empty!9573 () Bool)

(assert (=> b!388282 (= e!235276 tp_is_empty!9573)))

(declare-fun b!388283 () Bool)

(assert (=> b!388283 (= e!235277 tp_is_empty!9573)))

(declare-fun mapIsEmpty!15924 () Bool)

(assert (=> mapIsEmpty!15924 mapRes!15924))

(declare-fun b!388284 () Bool)

(assert (=> b!388284 (= e!235280 (not (bvslt i!548 (size!11340 _values!506))))))

(declare-datatypes ((tuple2!6494 0))(
  ( (tuple2!6495 (_1!3258 (_ BitVec 64)) (_2!3258 V!13869)) )
))
(declare-datatypes ((List!6348 0))(
  ( (Nil!6345) (Cons!6344 (h!7200 tuple2!6494) (t!11498 List!6348)) )
))
(declare-datatypes ((ListLongMap!5407 0))(
  ( (ListLongMap!5408 (toList!2719 List!6348)) )
))
(declare-fun lt!182280 () ListLongMap!5407)

(declare-fun lt!182278 () ListLongMap!5407)

(assert (=> b!388284 (and (= lt!182280 lt!182278) (= lt!182278 lt!182280))))

(declare-fun v!373 () V!13869)

(declare-fun lt!182277 () ListLongMap!5407)

(declare-fun +!1014 (ListLongMap!5407 tuple2!6494) ListLongMap!5407)

(assert (=> b!388284 (= lt!182278 (+!1014 lt!182277 (tuple2!6495 k0!778 v!373)))))

(declare-datatypes ((Unit!11902 0))(
  ( (Unit!11903) )
))
(declare-fun lt!182276 () Unit!11902)

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13869)

(declare-fun minValue!472 () V!13869)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!232 (array!23037 array!23039 (_ BitVec 32) (_ BitVec 32) V!13869 V!13869 (_ BitVec 32) (_ BitVec 64) V!13869 (_ BitVec 32) Int) Unit!11902)

(assert (=> b!388284 (= lt!182276 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!232 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!948 (array!23037 array!23039 (_ BitVec 32) (_ BitVec 32) V!13869 V!13869 (_ BitVec 32) Int) ListLongMap!5407)

(assert (=> b!388284 (= lt!182280 (getCurrentListMapNoExtraKeys!948 lt!182279 (array!23040 (store (arr!10988 _values!506) i!548 (ValueCellFull!4443 v!373)) (size!11340 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!388284 (= lt!182277 (getCurrentListMapNoExtraKeys!948 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!388275 () Bool)

(declare-fun res!222025 () Bool)

(assert (=> b!388275 (=> (not res!222025) (not e!235279))))

(declare-fun arrayContainsKey!0 (array!23037 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!388275 (= res!222025 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun res!222019 () Bool)

(assert (=> start!37798 (=> (not res!222019) (not e!235279))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37798 (= res!222019 (validMask!0 mask!970))))

(assert (=> start!37798 e!235279))

(declare-fun e!235275 () Bool)

(declare-fun array_inv!8076 (array!23039) Bool)

(assert (=> start!37798 (and (array_inv!8076 _values!506) e!235275)))

(assert (=> start!37798 tp!31454))

(assert (=> start!37798 true))

(assert (=> start!37798 tp_is_empty!9573))

(declare-fun array_inv!8077 (array!23037) Bool)

(assert (=> start!37798 (array_inv!8077 _keys!658)))

(declare-fun b!388285 () Bool)

(assert (=> b!388285 (= e!235275 (and e!235276 mapRes!15924))))

(declare-fun condMapEmpty!15924 () Bool)

(declare-fun mapDefault!15924 () ValueCell!4443)

(assert (=> b!388285 (= condMapEmpty!15924 (= (arr!10988 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4443)) mapDefault!15924)))))

(declare-fun b!388286 () Bool)

(declare-fun res!222023 () Bool)

(assert (=> b!388286 (=> (not res!222023) (not e!235279))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!388286 (= res!222023 (validKeyInArray!0 k0!778))))

(assert (= (and start!37798 res!222019) b!388279))

(assert (= (and b!388279 res!222021) b!388276))

(assert (= (and b!388276 res!222020) b!388281))

(assert (= (and b!388281 res!222022) b!388277))

(assert (= (and b!388277 res!222026) b!388286))

(assert (= (and b!388286 res!222023) b!388274))

(assert (= (and b!388274 res!222017) b!388275))

(assert (= (and b!388275 res!222025) b!388278))

(assert (= (and b!388278 res!222018) b!388280))

(assert (= (and b!388280 res!222024) b!388284))

(assert (= (and b!388285 condMapEmpty!15924) mapIsEmpty!15924))

(assert (= (and b!388285 (not condMapEmpty!15924)) mapNonEmpty!15924))

(get-info :version)

(assert (= (and mapNonEmpty!15924 ((_ is ValueCellFull!4443) mapValue!15924)) b!388283))

(assert (= (and b!388285 ((_ is ValueCellFull!4443) mapDefault!15924)) b!388282))

(assert (= start!37798 b!388285))

(declare-fun m!384223 () Bool)

(assert (=> b!388278 m!384223))

(declare-fun m!384225 () Bool)

(assert (=> b!388278 m!384225))

(declare-fun m!384227 () Bool)

(assert (=> b!388275 m!384227))

(declare-fun m!384229 () Bool)

(assert (=> b!388276 m!384229))

(declare-fun m!384231 () Bool)

(assert (=> b!388286 m!384231))

(declare-fun m!384233 () Bool)

(assert (=> b!388274 m!384233))

(declare-fun m!384235 () Bool)

(assert (=> b!388284 m!384235))

(declare-fun m!384237 () Bool)

(assert (=> b!388284 m!384237))

(declare-fun m!384239 () Bool)

(assert (=> b!388284 m!384239))

(declare-fun m!384241 () Bool)

(assert (=> b!388284 m!384241))

(declare-fun m!384243 () Bool)

(assert (=> b!388284 m!384243))

(declare-fun m!384245 () Bool)

(assert (=> mapNonEmpty!15924 m!384245))

(declare-fun m!384247 () Bool)

(assert (=> b!388281 m!384247))

(declare-fun m!384249 () Bool)

(assert (=> start!37798 m!384249))

(declare-fun m!384251 () Bool)

(assert (=> start!37798 m!384251))

(declare-fun m!384253 () Bool)

(assert (=> start!37798 m!384253))

(declare-fun m!384255 () Bool)

(assert (=> b!388280 m!384255))

(check-sat (not mapNonEmpty!15924) (not b!388280) (not b!388276) (not start!37798) tp_is_empty!9573 (not b!388284) (not b_next!8901) (not b!388278) (not b!388275) b_and!16143 (not b!388281) (not b!388286))
(check-sat b_and!16143 (not b_next!8901))
