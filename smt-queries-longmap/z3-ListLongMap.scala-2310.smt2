; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37308 () Bool)

(assert start!37308)

(declare-fun b_free!8449 () Bool)

(declare-fun b_next!8449 () Bool)

(assert (=> start!37308 (= b_free!8449 (not b_next!8449))))

(declare-fun tp!30063 () Bool)

(declare-fun b_and!15665 () Bool)

(assert (=> start!37308 (= tp!30063 b_and!15665)))

(declare-fun b!378284 () Bool)

(declare-fun res!214322 () Bool)

(declare-fun e!230212 () Bool)

(assert (=> b!378284 (=> (not res!214322) (not e!230212))))

(declare-fun i!548 () (_ BitVec 32))

(declare-datatypes ((array!22101 0))(
  ( (array!22102 (arr!10519 (Array (_ BitVec 32) (_ BitVec 64))) (size!10872 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22101)

(assert (=> b!378284 (= res!214322 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10872 _keys!658))))))

(declare-fun b!378285 () Bool)

(declare-fun res!214312 () Bool)

(assert (=> b!378285 (=> (not res!214312) (not e!230212))))

(declare-datatypes ((List!5941 0))(
  ( (Nil!5938) (Cons!5937 (h!6793 (_ BitVec 64)) (t!11082 List!5941)) )
))
(declare-fun arrayNoDuplicates!0 (array!22101 (_ BitVec 32) List!5941) Bool)

(assert (=> b!378285 (= res!214312 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5938))))

(declare-fun res!214313 () Bool)

(assert (=> start!37308 (=> (not res!214313) (not e!230212))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37308 (= res!214313 (validMask!0 mask!970))))

(assert (=> start!37308 e!230212))

(declare-datatypes ((V!13235 0))(
  ( (V!13236 (val!4593 Int)) )
))
(declare-datatypes ((ValueCell!4205 0))(
  ( (ValueCellFull!4205 (v!6784 V!13235)) (EmptyCell!4205) )
))
(declare-datatypes ((array!22103 0))(
  ( (array!22104 (arr!10520 (Array (_ BitVec 32) ValueCell!4205)) (size!10873 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22103)

(declare-fun e!230215 () Bool)

(declare-fun array_inv!7752 (array!22103) Bool)

(assert (=> start!37308 (and (array_inv!7752 _values!506) e!230215)))

(assert (=> start!37308 tp!30063))

(assert (=> start!37308 true))

(declare-fun tp_is_empty!9097 () Bool)

(assert (=> start!37308 tp_is_empty!9097))

(declare-fun array_inv!7753 (array!22101) Bool)

(assert (=> start!37308 (array_inv!7753 _keys!658)))

(declare-fun b!378286 () Bool)

(declare-fun res!214317 () Bool)

(assert (=> b!378286 (=> (not res!214317) (not e!230212))))

(assert (=> b!378286 (= res!214317 (or (= (select (arr!10519 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10519 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!378287 () Bool)

(declare-fun e!230209 () Bool)

(assert (=> b!378287 (= e!230209 tp_is_empty!9097)))

(declare-fun b!378288 () Bool)

(declare-fun e!230213 () Bool)

(declare-fun e!230216 () Bool)

(assert (=> b!378288 (= e!230213 (not e!230216))))

(declare-fun res!214311 () Bool)

(assert (=> b!378288 (=> res!214311 e!230216)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!378288 (= res!214311 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!6112 0))(
  ( (tuple2!6113 (_1!3067 (_ BitVec 64)) (_2!3067 V!13235)) )
))
(declare-datatypes ((List!5942 0))(
  ( (Nil!5939) (Cons!5938 (h!6794 tuple2!6112) (t!11083 List!5942)) )
))
(declare-datatypes ((ListLongMap!5015 0))(
  ( (ListLongMap!5016 (toList!2523 List!5942)) )
))
(declare-fun lt!176188 () ListLongMap!5015)

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13235)

(declare-fun minValue!472 () V!13235)

(declare-fun getCurrentListMap!1927 (array!22101 array!22103 (_ BitVec 32) (_ BitVec 32) V!13235 V!13235 (_ BitVec 32) Int) ListLongMap!5015)

(assert (=> b!378288 (= lt!176188 (getCurrentListMap!1927 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!176193 () array!22103)

(declare-fun lt!176187 () array!22101)

(declare-fun lt!176190 () ListLongMap!5015)

(assert (=> b!378288 (= lt!176190 (getCurrentListMap!1927 lt!176187 lt!176193 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!176189 () ListLongMap!5015)

(declare-fun lt!176192 () ListLongMap!5015)

(assert (=> b!378288 (and (= lt!176189 lt!176192) (= lt!176192 lt!176189))))

(declare-fun lt!176194 () ListLongMap!5015)

(declare-fun lt!176196 () tuple2!6112)

(declare-fun +!891 (ListLongMap!5015 tuple2!6112) ListLongMap!5015)

(assert (=> b!378288 (= lt!176192 (+!891 lt!176194 lt!176196))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun v!373 () V!13235)

(assert (=> b!378288 (= lt!176196 (tuple2!6113 k0!778 v!373))))

(declare-datatypes ((Unit!11648 0))(
  ( (Unit!11649) )
))
(declare-fun lt!176185 () Unit!11648)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!120 (array!22101 array!22103 (_ BitVec 32) (_ BitVec 32) V!13235 V!13235 (_ BitVec 32) (_ BitVec 64) V!13235 (_ BitVec 32) Int) Unit!11648)

(assert (=> b!378288 (= lt!176185 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!120 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!792 (array!22101 array!22103 (_ BitVec 32) (_ BitVec 32) V!13235 V!13235 (_ BitVec 32) Int) ListLongMap!5015)

(assert (=> b!378288 (= lt!176189 (getCurrentListMapNoExtraKeys!792 lt!176187 lt!176193 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!378288 (= lt!176193 (array!22104 (store (arr!10520 _values!506) i!548 (ValueCellFull!4205 v!373)) (size!10873 _values!506)))))

(assert (=> b!378288 (= lt!176194 (getCurrentListMapNoExtraKeys!792 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!378289 () Bool)

(declare-fun res!214320 () Bool)

(assert (=> b!378289 (=> (not res!214320) (not e!230212))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22101 (_ BitVec 32)) Bool)

(assert (=> b!378289 (= res!214320 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!378290 () Bool)

(declare-fun mapRes!15210 () Bool)

(assert (=> b!378290 (= e!230215 (and e!230209 mapRes!15210))))

(declare-fun condMapEmpty!15210 () Bool)

(declare-fun mapDefault!15210 () ValueCell!4205)

(assert (=> b!378290 (= condMapEmpty!15210 (= (arr!10520 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4205)) mapDefault!15210)))))

(declare-fun b!378291 () Bool)

(declare-fun e!230210 () Bool)

(assert (=> b!378291 (= e!230216 e!230210)))

(declare-fun res!214315 () Bool)

(assert (=> b!378291 (=> res!214315 e!230210)))

(assert (=> b!378291 (= res!214315 (= k0!778 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!176195 () ListLongMap!5015)

(assert (=> b!378291 (= lt!176188 lt!176195)))

(declare-fun lt!176184 () tuple2!6112)

(assert (=> b!378291 (= lt!176195 (+!891 lt!176194 lt!176184))))

(declare-fun lt!176191 () ListLongMap!5015)

(assert (=> b!378291 (= lt!176190 lt!176191)))

(assert (=> b!378291 (= lt!176191 (+!891 lt!176192 lt!176184))))

(assert (=> b!378291 (= lt!176190 (+!891 lt!176189 lt!176184))))

(assert (=> b!378291 (= lt!176184 (tuple2!6113 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!378292 () Bool)

(declare-fun res!214318 () Bool)

(assert (=> b!378292 (=> (not res!214318) (not e!230212))))

(assert (=> b!378292 (= res!214318 (and (= (size!10873 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10872 _keys!658) (size!10873 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!15210 () Bool)

(assert (=> mapIsEmpty!15210 mapRes!15210))

(declare-fun b!378293 () Bool)

(declare-fun res!214319 () Bool)

(assert (=> b!378293 (=> (not res!214319) (not e!230212))))

(declare-fun arrayContainsKey!0 (array!22101 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!378293 (= res!214319 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!378294 () Bool)

(declare-fun res!214321 () Bool)

(assert (=> b!378294 (=> (not res!214321) (not e!230213))))

(assert (=> b!378294 (= res!214321 (arrayNoDuplicates!0 lt!176187 #b00000000000000000000000000000000 Nil!5938))))

(declare-fun b!378295 () Bool)

(assert (=> b!378295 (= e!230212 e!230213)))

(declare-fun res!214314 () Bool)

(assert (=> b!378295 (=> (not res!214314) (not e!230213))))

(assert (=> b!378295 (= res!214314 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!176187 mask!970))))

(assert (=> b!378295 (= lt!176187 (array!22102 (store (arr!10519 _keys!658) i!548 k0!778) (size!10872 _keys!658)))))

(declare-fun mapNonEmpty!15210 () Bool)

(declare-fun tp!30062 () Bool)

(declare-fun e!230211 () Bool)

(assert (=> mapNonEmpty!15210 (= mapRes!15210 (and tp!30062 e!230211))))

(declare-fun mapValue!15210 () ValueCell!4205)

(declare-fun mapRest!15210 () (Array (_ BitVec 32) ValueCell!4205))

(declare-fun mapKey!15210 () (_ BitVec 32))

(assert (=> mapNonEmpty!15210 (= (arr!10520 _values!506) (store mapRest!15210 mapKey!15210 mapValue!15210))))

(declare-fun b!378296 () Bool)

(assert (=> b!378296 (= e!230211 tp_is_empty!9097)))

(declare-fun b!378297 () Bool)

(assert (=> b!378297 (= e!230210 true)))

(assert (=> b!378297 (= lt!176191 (+!891 lt!176195 lt!176196))))

(declare-fun lt!176186 () Unit!11648)

(declare-fun addCommutativeForDiffKeys!293 (ListLongMap!5015 (_ BitVec 64) V!13235 (_ BitVec 64) V!13235) Unit!11648)

(assert (=> b!378297 (= lt!176186 (addCommutativeForDiffKeys!293 lt!176194 k0!778 v!373 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!378298 () Bool)

(declare-fun res!214316 () Bool)

(assert (=> b!378298 (=> (not res!214316) (not e!230212))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!378298 (= res!214316 (validKeyInArray!0 k0!778))))

(assert (= (and start!37308 res!214313) b!378292))

(assert (= (and b!378292 res!214318) b!378289))

(assert (= (and b!378289 res!214320) b!378285))

(assert (= (and b!378285 res!214312) b!378284))

(assert (= (and b!378284 res!214322) b!378298))

(assert (= (and b!378298 res!214316) b!378286))

(assert (= (and b!378286 res!214317) b!378293))

(assert (= (and b!378293 res!214319) b!378295))

(assert (= (and b!378295 res!214314) b!378294))

(assert (= (and b!378294 res!214321) b!378288))

(assert (= (and b!378288 (not res!214311)) b!378291))

(assert (= (and b!378291 (not res!214315)) b!378297))

(assert (= (and b!378290 condMapEmpty!15210) mapIsEmpty!15210))

(assert (= (and b!378290 (not condMapEmpty!15210)) mapNonEmpty!15210))

(get-info :version)

(assert (= (and mapNonEmpty!15210 ((_ is ValueCellFull!4205) mapValue!15210)) b!378296))

(assert (= (and b!378290 ((_ is ValueCellFull!4205) mapDefault!15210)) b!378287))

(assert (= start!37308 b!378290))

(declare-fun m!374651 () Bool)

(assert (=> b!378288 m!374651))

(declare-fun m!374653 () Bool)

(assert (=> b!378288 m!374653))

(declare-fun m!374655 () Bool)

(assert (=> b!378288 m!374655))

(declare-fun m!374657 () Bool)

(assert (=> b!378288 m!374657))

(declare-fun m!374659 () Bool)

(assert (=> b!378288 m!374659))

(declare-fun m!374661 () Bool)

(assert (=> b!378288 m!374661))

(declare-fun m!374663 () Bool)

(assert (=> b!378288 m!374663))

(declare-fun m!374665 () Bool)

(assert (=> b!378295 m!374665))

(declare-fun m!374667 () Bool)

(assert (=> b!378295 m!374667))

(declare-fun m!374669 () Bool)

(assert (=> b!378294 m!374669))

(declare-fun m!374671 () Bool)

(assert (=> b!378286 m!374671))

(declare-fun m!374673 () Bool)

(assert (=> b!378285 m!374673))

(declare-fun m!374675 () Bool)

(assert (=> b!378289 m!374675))

(declare-fun m!374677 () Bool)

(assert (=> start!37308 m!374677))

(declare-fun m!374679 () Bool)

(assert (=> start!37308 m!374679))

(declare-fun m!374681 () Bool)

(assert (=> start!37308 m!374681))

(declare-fun m!374683 () Bool)

(assert (=> b!378297 m!374683))

(declare-fun m!374685 () Bool)

(assert (=> b!378297 m!374685))

(declare-fun m!374687 () Bool)

(assert (=> b!378293 m!374687))

(declare-fun m!374689 () Bool)

(assert (=> b!378291 m!374689))

(declare-fun m!374691 () Bool)

(assert (=> b!378291 m!374691))

(declare-fun m!374693 () Bool)

(assert (=> b!378291 m!374693))

(declare-fun m!374695 () Bool)

(assert (=> b!378298 m!374695))

(declare-fun m!374697 () Bool)

(assert (=> mapNonEmpty!15210 m!374697))

(check-sat (not b!378298) (not b!378289) (not b!378291) (not b!378295) (not b!378288) (not b_next!8449) (not b!378285) (not mapNonEmpty!15210) (not start!37308) (not b!378293) (not b!378294) tp_is_empty!9097 (not b!378297) b_and!15665)
(check-sat b_and!15665 (not b_next!8449))
