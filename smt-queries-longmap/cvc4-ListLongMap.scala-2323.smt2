; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37404 () Bool)

(assert start!37404)

(declare-fun b_free!8531 () Bool)

(declare-fun b_next!8531 () Bool)

(assert (=> start!37404 (= b_free!8531 (not b_next!8531))))

(declare-fun tp!30308 () Bool)

(declare-fun b_and!15773 () Bool)

(assert (=> start!37404 (= tp!30308 b_and!15773)))

(declare-fun b!380400 () Bool)

(declare-fun res!215918 () Bool)

(declare-fun e!231372 () Bool)

(assert (=> b!380400 (=> (not res!215918) (not e!231372))))

(declare-datatypes ((V!13343 0))(
  ( (V!13344 (val!4634 Int)) )
))
(declare-datatypes ((ValueCell!4246 0))(
  ( (ValueCellFull!4246 (v!6831 V!13343)) (EmptyCell!4246) )
))
(declare-datatypes ((array!22277 0))(
  ( (array!22278 (arr!10607 (Array (_ BitVec 32) ValueCell!4246)) (size!10959 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22277)

(declare-datatypes ((array!22279 0))(
  ( (array!22280 (arr!10608 (Array (_ BitVec 32) (_ BitVec 64))) (size!10960 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22279)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!380400 (= res!215918 (and (= (size!10959 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10960 _keys!658) (size!10959 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!380401 () Bool)

(declare-fun e!231369 () Bool)

(declare-fun e!231370 () Bool)

(assert (=> b!380401 (= e!231369 (not e!231370))))

(declare-fun res!215919 () Bool)

(assert (=> b!380401 (=> res!215919 e!231370)))

(assert (=> b!380401 (= res!215919 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((tuple2!6212 0))(
  ( (tuple2!6213 (_1!3117 (_ BitVec 64)) (_2!3117 V!13343)) )
))
(declare-datatypes ((List!6047 0))(
  ( (Nil!6044) (Cons!6043 (h!6899 tuple2!6212) (t!11197 List!6047)) )
))
(declare-datatypes ((ListLongMap!5125 0))(
  ( (ListLongMap!5126 (toList!2578 List!6047)) )
))
(declare-fun lt!178028 () ListLongMap!5125)

(declare-fun zeroValue!472 () V!13343)

(declare-fun minValue!472 () V!13343)

(declare-fun getCurrentListMap!1994 (array!22279 array!22277 (_ BitVec 32) (_ BitVec 32) V!13343 V!13343 (_ BitVec 32) Int) ListLongMap!5125)

(assert (=> b!380401 (= lt!178028 (getCurrentListMap!1994 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!178027 () ListLongMap!5125)

(declare-fun lt!178017 () array!22277)

(declare-fun lt!178024 () array!22279)

(assert (=> b!380401 (= lt!178027 (getCurrentListMap!1994 lt!178024 lt!178017 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!178023 () ListLongMap!5125)

(declare-fun lt!178022 () ListLongMap!5125)

(assert (=> b!380401 (and (= lt!178023 lt!178022) (= lt!178022 lt!178023))))

(declare-fun lt!178020 () ListLongMap!5125)

(declare-fun lt!178026 () tuple2!6212)

(declare-fun +!924 (ListLongMap!5125 tuple2!6212) ListLongMap!5125)

(assert (=> b!380401 (= lt!178022 (+!924 lt!178020 lt!178026))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun v!373 () V!13343)

(assert (=> b!380401 (= lt!178026 (tuple2!6213 k!778 v!373))))

(declare-datatypes ((Unit!11742 0))(
  ( (Unit!11743) )
))
(declare-fun lt!178021 () Unit!11742)

(declare-fun i!548 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!152 (array!22279 array!22277 (_ BitVec 32) (_ BitVec 32) V!13343 V!13343 (_ BitVec 32) (_ BitVec 64) V!13343 (_ BitVec 32) Int) Unit!11742)

(assert (=> b!380401 (= lt!178021 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!152 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!828 (array!22279 array!22277 (_ BitVec 32) (_ BitVec 32) V!13343 V!13343 (_ BitVec 32) Int) ListLongMap!5125)

(assert (=> b!380401 (= lt!178023 (getCurrentListMapNoExtraKeys!828 lt!178024 lt!178017 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!380401 (= lt!178017 (array!22278 (store (arr!10607 _values!506) i!548 (ValueCellFull!4246 v!373)) (size!10959 _values!506)))))

(assert (=> b!380401 (= lt!178020 (getCurrentListMapNoExtraKeys!828 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!380402 () Bool)

(declare-fun res!215925 () Bool)

(assert (=> b!380402 (=> (not res!215925) (not e!231372))))

(declare-datatypes ((List!6048 0))(
  ( (Nil!6045) (Cons!6044 (h!6900 (_ BitVec 64)) (t!11198 List!6048)) )
))
(declare-fun arrayNoDuplicates!0 (array!22279 (_ BitVec 32) List!6048) Bool)

(assert (=> b!380402 (= res!215925 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6045))))

(declare-fun b!380403 () Bool)

(declare-fun e!231373 () Bool)

(assert (=> b!380403 (= e!231370 e!231373)))

(declare-fun res!215916 () Bool)

(assert (=> b!380403 (=> res!215916 e!231373)))

(assert (=> b!380403 (= res!215916 (= k!778 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!178029 () ListLongMap!5125)

(assert (=> b!380403 (= lt!178028 lt!178029)))

(declare-fun lt!178025 () tuple2!6212)

(assert (=> b!380403 (= lt!178029 (+!924 lt!178020 lt!178025))))

(declare-fun lt!178018 () ListLongMap!5125)

(assert (=> b!380403 (= lt!178027 lt!178018)))

(assert (=> b!380403 (= lt!178018 (+!924 lt!178022 lt!178025))))

(assert (=> b!380403 (= lt!178027 (+!924 lt!178023 lt!178025))))

(assert (=> b!380403 (= lt!178025 (tuple2!6213 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!380404 () Bool)

(declare-fun res!215921 () Bool)

(assert (=> b!380404 (=> (not res!215921) (not e!231372))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!380404 (= res!215921 (validKeyInArray!0 k!778))))

(declare-fun b!380405 () Bool)

(declare-fun res!215917 () Bool)

(assert (=> b!380405 (=> (not res!215917) (not e!231369))))

(assert (=> b!380405 (= res!215917 (arrayNoDuplicates!0 lt!178024 #b00000000000000000000000000000000 Nil!6045))))

(declare-fun mapIsEmpty!15333 () Bool)

(declare-fun mapRes!15333 () Bool)

(assert (=> mapIsEmpty!15333 mapRes!15333))

(declare-fun res!215920 () Bool)

(assert (=> start!37404 (=> (not res!215920) (not e!231372))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37404 (= res!215920 (validMask!0 mask!970))))

(assert (=> start!37404 e!231372))

(declare-fun e!231371 () Bool)

(declare-fun array_inv!7810 (array!22277) Bool)

(assert (=> start!37404 (and (array_inv!7810 _values!506) e!231371)))

(assert (=> start!37404 tp!30308))

(assert (=> start!37404 true))

(declare-fun tp_is_empty!9179 () Bool)

(assert (=> start!37404 tp_is_empty!9179))

(declare-fun array_inv!7811 (array!22279) Bool)

(assert (=> start!37404 (array_inv!7811 _keys!658)))

(declare-fun b!380406 () Bool)

(declare-fun res!215924 () Bool)

(assert (=> b!380406 (=> (not res!215924) (not e!231372))))

(assert (=> b!380406 (= res!215924 (or (= (select (arr!10608 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10608 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!380407 () Bool)

(declare-fun res!215923 () Bool)

(assert (=> b!380407 (=> (not res!215923) (not e!231372))))

(assert (=> b!380407 (= res!215923 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10960 _keys!658))))))

(declare-fun b!380408 () Bool)

(declare-fun e!231367 () Bool)

(assert (=> b!380408 (= e!231367 tp_is_empty!9179)))

(declare-fun b!380409 () Bool)

(assert (=> b!380409 (= e!231372 e!231369)))

(declare-fun res!215926 () Bool)

(assert (=> b!380409 (=> (not res!215926) (not e!231369))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22279 (_ BitVec 32)) Bool)

(assert (=> b!380409 (= res!215926 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!178024 mask!970))))

(assert (=> b!380409 (= lt!178024 (array!22280 (store (arr!10608 _keys!658) i!548 k!778) (size!10960 _keys!658)))))

(declare-fun b!380410 () Bool)

(declare-fun res!215922 () Bool)

(assert (=> b!380410 (=> (not res!215922) (not e!231372))))

(assert (=> b!380410 (= res!215922 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!380411 () Bool)

(declare-fun res!215927 () Bool)

(assert (=> b!380411 (=> (not res!215927) (not e!231372))))

(declare-fun arrayContainsKey!0 (array!22279 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!380411 (= res!215927 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!15333 () Bool)

(declare-fun tp!30309 () Bool)

(assert (=> mapNonEmpty!15333 (= mapRes!15333 (and tp!30309 e!231367))))

(declare-fun mapKey!15333 () (_ BitVec 32))

(declare-fun mapRest!15333 () (Array (_ BitVec 32) ValueCell!4246))

(declare-fun mapValue!15333 () ValueCell!4246)

(assert (=> mapNonEmpty!15333 (= (arr!10607 _values!506) (store mapRest!15333 mapKey!15333 mapValue!15333))))

(declare-fun b!380412 () Bool)

(assert (=> b!380412 (= e!231373 true)))

(assert (=> b!380412 (= lt!178018 (+!924 lt!178029 lt!178026))))

(declare-fun lt!178019 () Unit!11742)

(declare-fun addCommutativeForDiffKeys!321 (ListLongMap!5125 (_ BitVec 64) V!13343 (_ BitVec 64) V!13343) Unit!11742)

(assert (=> b!380412 (= lt!178019 (addCommutativeForDiffKeys!321 lt!178020 k!778 v!373 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!380413 () Bool)

(declare-fun e!231374 () Bool)

(assert (=> b!380413 (= e!231374 tp_is_empty!9179)))

(declare-fun b!380414 () Bool)

(assert (=> b!380414 (= e!231371 (and e!231374 mapRes!15333))))

(declare-fun condMapEmpty!15333 () Bool)

(declare-fun mapDefault!15333 () ValueCell!4246)

