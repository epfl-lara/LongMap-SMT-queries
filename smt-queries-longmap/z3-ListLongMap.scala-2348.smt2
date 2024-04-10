; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37552 () Bool)

(assert start!37552)

(declare-fun b_free!8679 () Bool)

(declare-fun b_next!8679 () Bool)

(assert (=> start!37552 (= b_free!8679 (not b_next!8679))))

(declare-fun tp!30753 () Bool)

(declare-fun b_and!15921 () Bool)

(assert (=> start!37552 (= tp!30753 b_and!15921)))

(declare-fun b!383536 () Bool)

(declare-fun e!232955 () Bool)

(declare-fun tp_is_empty!9327 () Bool)

(assert (=> b!383536 (= e!232955 tp_is_empty!9327)))

(declare-fun b!383537 () Bool)

(declare-fun res!218388 () Bool)

(declare-fun e!232954 () Bool)

(assert (=> b!383537 (=> (not res!218388) (not e!232954))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((V!13541 0))(
  ( (V!13542 (val!4708 Int)) )
))
(declare-datatypes ((ValueCell!4320 0))(
  ( (ValueCellFull!4320 (v!6905 V!13541)) (EmptyCell!4320) )
))
(declare-datatypes ((array!22561 0))(
  ( (array!22562 (arr!10749 (Array (_ BitVec 32) ValueCell!4320)) (size!11101 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22561)

(declare-datatypes ((array!22563 0))(
  ( (array!22564 (arr!10750 (Array (_ BitVec 32) (_ BitVec 64))) (size!11102 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22563)

(declare-fun mask!970 () (_ BitVec 32))

(assert (=> b!383537 (= res!218388 (and (= (size!11101 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11102 _keys!658) (size!11101 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!383538 () Bool)

(declare-fun res!218393 () Bool)

(assert (=> b!383538 (=> (not res!218393) (not e!232954))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!383538 (= res!218393 (validKeyInArray!0 k0!778))))

(declare-fun b!383539 () Bool)

(declare-fun res!218386 () Bool)

(assert (=> b!383539 (=> (not res!218386) (not e!232954))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22563 (_ BitVec 32)) Bool)

(assert (=> b!383539 (= res!218386 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!383540 () Bool)

(declare-fun res!218396 () Bool)

(assert (=> b!383540 (=> (not res!218396) (not e!232954))))

(declare-datatypes ((List!6168 0))(
  ( (Nil!6165) (Cons!6164 (h!7020 (_ BitVec 64)) (t!11318 List!6168)) )
))
(declare-fun arrayNoDuplicates!0 (array!22563 (_ BitVec 32) List!6168) Bool)

(assert (=> b!383540 (= res!218396 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6165))))

(declare-fun res!218387 () Bool)

(assert (=> start!37552 (=> (not res!218387) (not e!232954))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37552 (= res!218387 (validMask!0 mask!970))))

(assert (=> start!37552 e!232954))

(declare-fun e!232950 () Bool)

(declare-fun array_inv!7910 (array!22561) Bool)

(assert (=> start!37552 (and (array_inv!7910 _values!506) e!232950)))

(assert (=> start!37552 tp!30753))

(assert (=> start!37552 true))

(assert (=> start!37552 tp_is_empty!9327))

(declare-fun array_inv!7911 (array!22563) Bool)

(assert (=> start!37552 (array_inv!7911 _keys!658)))

(declare-fun mapNonEmpty!15555 () Bool)

(declare-fun mapRes!15555 () Bool)

(declare-fun tp!30752 () Bool)

(assert (=> mapNonEmpty!15555 (= mapRes!15555 (and tp!30752 e!232955))))

(declare-fun mapKey!15555 () (_ BitVec 32))

(declare-fun mapRest!15555 () (Array (_ BitVec 32) ValueCell!4320))

(declare-fun mapValue!15555 () ValueCell!4320)

(assert (=> mapNonEmpty!15555 (= (arr!10749 _values!506) (store mapRest!15555 mapKey!15555 mapValue!15555))))

(declare-fun b!383541 () Bool)

(declare-fun e!232953 () Bool)

(assert (=> b!383541 (= e!232954 e!232953)))

(declare-fun res!218392 () Bool)

(assert (=> b!383541 (=> (not res!218392) (not e!232953))))

(declare-fun lt!180197 () array!22563)

(assert (=> b!383541 (= res!218392 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!180197 mask!970))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!383541 (= lt!180197 (array!22564 (store (arr!10750 _keys!658) i!548 k0!778) (size!11102 _keys!658)))))

(declare-fun mapIsEmpty!15555 () Bool)

(assert (=> mapIsEmpty!15555 mapRes!15555))

(declare-fun b!383542 () Bool)

(declare-fun e!232952 () Bool)

(assert (=> b!383542 (= e!232952 tp_is_empty!9327)))

(declare-fun b!383543 () Bool)

(declare-fun res!218390 () Bool)

(assert (=> b!383543 (=> (not res!218390) (not e!232953))))

(assert (=> b!383543 (= res!218390 (arrayNoDuplicates!0 lt!180197 #b00000000000000000000000000000000 Nil!6165))))

(declare-fun b!383544 () Bool)

(declare-fun e!232949 () Bool)

(assert (=> b!383544 (= e!232953 (not e!232949))))

(declare-fun res!218389 () Bool)

(assert (=> b!383544 (=> res!218389 e!232949)))

(declare-fun lt!180200 () Bool)

(assert (=> b!383544 (= res!218389 (or (and (not lt!180200) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!180200) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!180200)))))

(assert (=> b!383544 (= lt!180200 (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((tuple2!6334 0))(
  ( (tuple2!6335 (_1!3178 (_ BitVec 64)) (_2!3178 V!13541)) )
))
(declare-datatypes ((List!6169 0))(
  ( (Nil!6166) (Cons!6165 (h!7021 tuple2!6334) (t!11319 List!6169)) )
))
(declare-datatypes ((ListLongMap!5247 0))(
  ( (ListLongMap!5248 (toList!2639 List!6169)) )
))
(declare-fun lt!180192 () ListLongMap!5247)

(declare-fun zeroValue!472 () V!13541)

(declare-fun minValue!472 () V!13541)

(declare-fun getCurrentListMap!2044 (array!22563 array!22561 (_ BitVec 32) (_ BitVec 32) V!13541 V!13541 (_ BitVec 32) Int) ListLongMap!5247)

(assert (=> b!383544 (= lt!180192 (getCurrentListMap!2044 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!180201 () ListLongMap!5247)

(declare-fun lt!180194 () array!22561)

(assert (=> b!383544 (= lt!180201 (getCurrentListMap!2044 lt!180197 lt!180194 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!180193 () ListLongMap!5247)

(declare-fun lt!180195 () ListLongMap!5247)

(assert (=> b!383544 (and (= lt!180193 lt!180195) (= lt!180195 lt!180193))))

(declare-fun lt!180196 () ListLongMap!5247)

(declare-fun lt!180199 () tuple2!6334)

(declare-fun +!974 (ListLongMap!5247 tuple2!6334) ListLongMap!5247)

(assert (=> b!383544 (= lt!180195 (+!974 lt!180196 lt!180199))))

(declare-fun v!373 () V!13541)

(assert (=> b!383544 (= lt!180199 (tuple2!6335 k0!778 v!373))))

(declare-datatypes ((Unit!11842 0))(
  ( (Unit!11843) )
))
(declare-fun lt!180191 () Unit!11842)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!202 (array!22563 array!22561 (_ BitVec 32) (_ BitVec 32) V!13541 V!13541 (_ BitVec 32) (_ BitVec 64) V!13541 (_ BitVec 32) Int) Unit!11842)

(assert (=> b!383544 (= lt!180191 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!202 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!878 (array!22563 array!22561 (_ BitVec 32) (_ BitVec 32) V!13541 V!13541 (_ BitVec 32) Int) ListLongMap!5247)

(assert (=> b!383544 (= lt!180193 (getCurrentListMapNoExtraKeys!878 lt!180197 lt!180194 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!383544 (= lt!180194 (array!22562 (store (arr!10749 _values!506) i!548 (ValueCellFull!4320 v!373)) (size!11101 _values!506)))))

(assert (=> b!383544 (= lt!180196 (getCurrentListMapNoExtraKeys!878 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!383545 () Bool)

(declare-fun res!218391 () Bool)

(assert (=> b!383545 (=> (not res!218391) (not e!232954))))

(assert (=> b!383545 (= res!218391 (or (= (select (arr!10750 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10750 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!383546 () Bool)

(declare-fun res!218394 () Bool)

(assert (=> b!383546 (=> (not res!218394) (not e!232954))))

(declare-fun arrayContainsKey!0 (array!22563 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!383546 (= res!218394 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!383547 () Bool)

(declare-fun res!218395 () Bool)

(assert (=> b!383547 (=> (not res!218395) (not e!232954))))

(assert (=> b!383547 (= res!218395 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11102 _keys!658))))))

(declare-fun b!383548 () Bool)

(assert (=> b!383548 (= e!232949 true)))

(declare-fun lt!180198 () ListLongMap!5247)

(assert (=> b!383548 (= lt!180198 (+!974 lt!180192 lt!180199))))

(assert (=> b!383548 (= lt!180201 lt!180193)))

(declare-fun b!383549 () Bool)

(assert (=> b!383549 (= e!232950 (and e!232952 mapRes!15555))))

(declare-fun condMapEmpty!15555 () Bool)

(declare-fun mapDefault!15555 () ValueCell!4320)

(assert (=> b!383549 (= condMapEmpty!15555 (= (arr!10749 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4320)) mapDefault!15555)))))

(assert (= (and start!37552 res!218387) b!383537))

(assert (= (and b!383537 res!218388) b!383539))

(assert (= (and b!383539 res!218386) b!383540))

(assert (= (and b!383540 res!218396) b!383547))

(assert (= (and b!383547 res!218395) b!383538))

(assert (= (and b!383538 res!218393) b!383545))

(assert (= (and b!383545 res!218391) b!383546))

(assert (= (and b!383546 res!218394) b!383541))

(assert (= (and b!383541 res!218392) b!383543))

(assert (= (and b!383543 res!218390) b!383544))

(assert (= (and b!383544 (not res!218389)) b!383548))

(assert (= (and b!383549 condMapEmpty!15555) mapIsEmpty!15555))

(assert (= (and b!383549 (not condMapEmpty!15555)) mapNonEmpty!15555))

(get-info :version)

(assert (= (and mapNonEmpty!15555 ((_ is ValueCellFull!4320) mapValue!15555)) b!383536))

(assert (= (and b!383549 ((_ is ValueCellFull!4320) mapDefault!15555)) b!383542))

(assert (= start!37552 b!383549))

(declare-fun m!380275 () Bool)

(assert (=> b!383540 m!380275))

(declare-fun m!380277 () Bool)

(assert (=> b!383538 m!380277))

(declare-fun m!380279 () Bool)

(assert (=> b!383546 m!380279))

(declare-fun m!380281 () Bool)

(assert (=> b!383545 m!380281))

(declare-fun m!380283 () Bool)

(assert (=> mapNonEmpty!15555 m!380283))

(declare-fun m!380285 () Bool)

(assert (=> b!383541 m!380285))

(declare-fun m!380287 () Bool)

(assert (=> b!383541 m!380287))

(declare-fun m!380289 () Bool)

(assert (=> b!383544 m!380289))

(declare-fun m!380291 () Bool)

(assert (=> b!383544 m!380291))

(declare-fun m!380293 () Bool)

(assert (=> b!383544 m!380293))

(declare-fun m!380295 () Bool)

(assert (=> b!383544 m!380295))

(declare-fun m!380297 () Bool)

(assert (=> b!383544 m!380297))

(declare-fun m!380299 () Bool)

(assert (=> b!383544 m!380299))

(declare-fun m!380301 () Bool)

(assert (=> b!383544 m!380301))

(declare-fun m!380303 () Bool)

(assert (=> b!383543 m!380303))

(declare-fun m!380305 () Bool)

(assert (=> b!383548 m!380305))

(declare-fun m!380307 () Bool)

(assert (=> start!37552 m!380307))

(declare-fun m!380309 () Bool)

(assert (=> start!37552 m!380309))

(declare-fun m!380311 () Bool)

(assert (=> start!37552 m!380311))

(declare-fun m!380313 () Bool)

(assert (=> b!383539 m!380313))

(check-sat (not b!383540) (not start!37552) (not b!383548) tp_is_empty!9327 (not mapNonEmpty!15555) (not b!383543) (not b!383541) (not b!383546) (not b!383544) (not b!383539) (not b!383538) b_and!15921 (not b_next!8679))
(check-sat b_and!15921 (not b_next!8679))
