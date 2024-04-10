; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37414 () Bool)

(assert start!37414)

(declare-fun b_free!8541 () Bool)

(declare-fun b_next!8541 () Bool)

(assert (=> start!37414 (= b_free!8541 (not b_next!8541))))

(declare-fun tp!30339 () Bool)

(declare-fun b_and!15783 () Bool)

(assert (=> start!37414 (= tp!30339 b_and!15783)))

(declare-fun b!380625 () Bool)

(declare-fun res!216103 () Bool)

(declare-fun e!231490 () Bool)

(assert (=> b!380625 (=> (not res!216103) (not e!231490))))

(declare-datatypes ((array!22297 0))(
  ( (array!22298 (arr!10617 (Array (_ BitVec 32) (_ BitVec 64))) (size!10969 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22297)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!380625 (= res!216103 (or (= (select (arr!10617 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10617 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!380626 () Bool)

(declare-fun e!231492 () Bool)

(assert (=> b!380626 (= e!231492 true)))

(declare-datatypes ((V!13357 0))(
  ( (V!13358 (val!4639 Int)) )
))
(declare-datatypes ((tuple2!6220 0))(
  ( (tuple2!6221 (_1!3121 (_ BitVec 64)) (_2!3121 V!13357)) )
))
(declare-datatypes ((List!6055 0))(
  ( (Nil!6052) (Cons!6051 (h!6907 tuple2!6220) (t!11205 List!6055)) )
))
(declare-datatypes ((ListLongMap!5133 0))(
  ( (ListLongMap!5134 (toList!2582 List!6055)) )
))
(declare-fun lt!178222 () ListLongMap!5133)

(declare-fun lt!178214 () ListLongMap!5133)

(declare-fun lt!178220 () tuple2!6220)

(declare-fun +!928 (ListLongMap!5133 tuple2!6220) ListLongMap!5133)

(assert (=> b!380626 (= lt!178222 (+!928 lt!178214 lt!178220))))

(declare-fun v!373 () V!13357)

(declare-datatypes ((Unit!11750 0))(
  ( (Unit!11751) )
))
(declare-fun lt!178224 () Unit!11750)

(declare-fun minValue!472 () V!13357)

(declare-fun lt!178215 () ListLongMap!5133)

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun addCommutativeForDiffKeys!325 (ListLongMap!5133 (_ BitVec 64) V!13357 (_ BitVec 64) V!13357) Unit!11750)

(assert (=> b!380626 (= lt!178224 (addCommutativeForDiffKeys!325 lt!178215 k0!778 v!373 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun mapIsEmpty!15348 () Bool)

(declare-fun mapRes!15348 () Bool)

(assert (=> mapIsEmpty!15348 mapRes!15348))

(declare-fun b!380627 () Bool)

(declare-fun res!216100 () Bool)

(assert (=> b!380627 (=> (not res!216100) (not e!231490))))

(declare-fun arrayContainsKey!0 (array!22297 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!380627 (= res!216100 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun res!216105 () Bool)

(assert (=> start!37414 (=> (not res!216105) (not e!231490))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37414 (= res!216105 (validMask!0 mask!970))))

(assert (=> start!37414 e!231490))

(declare-datatypes ((ValueCell!4251 0))(
  ( (ValueCellFull!4251 (v!6836 V!13357)) (EmptyCell!4251) )
))
(declare-datatypes ((array!22299 0))(
  ( (array!22300 (arr!10618 (Array (_ BitVec 32) ValueCell!4251)) (size!10970 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22299)

(declare-fun e!231488 () Bool)

(declare-fun array_inv!7816 (array!22299) Bool)

(assert (=> start!37414 (and (array_inv!7816 _values!506) e!231488)))

(assert (=> start!37414 tp!30339))

(assert (=> start!37414 true))

(declare-fun tp_is_empty!9189 () Bool)

(assert (=> start!37414 tp_is_empty!9189))

(declare-fun array_inv!7817 (array!22297) Bool)

(assert (=> start!37414 (array_inv!7817 _keys!658)))

(declare-fun b!380628 () Bool)

(declare-fun res!216101 () Bool)

(assert (=> b!380628 (=> (not res!216101) (not e!231490))))

(assert (=> b!380628 (= res!216101 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10969 _keys!658))))))

(declare-fun b!380629 () Bool)

(declare-fun res!216098 () Bool)

(declare-fun e!231489 () Bool)

(assert (=> b!380629 (=> (not res!216098) (not e!231489))))

(declare-fun lt!178212 () array!22297)

(declare-datatypes ((List!6056 0))(
  ( (Nil!6053) (Cons!6052 (h!6908 (_ BitVec 64)) (t!11206 List!6056)) )
))
(declare-fun arrayNoDuplicates!0 (array!22297 (_ BitVec 32) List!6056) Bool)

(assert (=> b!380629 (= res!216098 (arrayNoDuplicates!0 lt!178212 #b00000000000000000000000000000000 Nil!6053))))

(declare-fun b!380630 () Bool)

(declare-fun e!231493 () Bool)

(assert (=> b!380630 (= e!231493 e!231492)))

(declare-fun res!216106 () Bool)

(assert (=> b!380630 (=> res!216106 e!231492)))

(assert (=> b!380630 (= res!216106 (= k0!778 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!178223 () ListLongMap!5133)

(assert (=> b!380630 (= lt!178223 lt!178214)))

(declare-fun lt!178213 () tuple2!6220)

(assert (=> b!380630 (= lt!178214 (+!928 lt!178215 lt!178213))))

(declare-fun lt!178216 () ListLongMap!5133)

(assert (=> b!380630 (= lt!178216 lt!178222)))

(declare-fun lt!178217 () ListLongMap!5133)

(assert (=> b!380630 (= lt!178222 (+!928 lt!178217 lt!178213))))

(declare-fun lt!178221 () ListLongMap!5133)

(assert (=> b!380630 (= lt!178216 (+!928 lt!178221 lt!178213))))

(assert (=> b!380630 (= lt!178213 (tuple2!6221 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!380631 () Bool)

(assert (=> b!380631 (= e!231490 e!231489)))

(declare-fun res!216099 () Bool)

(assert (=> b!380631 (=> (not res!216099) (not e!231489))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22297 (_ BitVec 32)) Bool)

(assert (=> b!380631 (= res!216099 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!178212 mask!970))))

(assert (=> b!380631 (= lt!178212 (array!22298 (store (arr!10617 _keys!658) i!548 k0!778) (size!10969 _keys!658)))))

(declare-fun b!380632 () Bool)

(declare-fun res!216097 () Bool)

(assert (=> b!380632 (=> (not res!216097) (not e!231490))))

(assert (=> b!380632 (= res!216097 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!380633 () Bool)

(declare-fun res!216096 () Bool)

(assert (=> b!380633 (=> (not res!216096) (not e!231490))))

(assert (=> b!380633 (= res!216096 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6053))))

(declare-fun b!380634 () Bool)

(declare-fun res!216104 () Bool)

(assert (=> b!380634 (=> (not res!216104) (not e!231490))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!380634 (= res!216104 (and (= (size!10970 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10969 _keys!658) (size!10970 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!380635 () Bool)

(declare-fun e!231487 () Bool)

(assert (=> b!380635 (= e!231488 (and e!231487 mapRes!15348))))

(declare-fun condMapEmpty!15348 () Bool)

(declare-fun mapDefault!15348 () ValueCell!4251)

(assert (=> b!380635 (= condMapEmpty!15348 (= (arr!10618 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4251)) mapDefault!15348)))))

(declare-fun b!380636 () Bool)

(declare-fun res!216107 () Bool)

(assert (=> b!380636 (=> (not res!216107) (not e!231490))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!380636 (= res!216107 (validKeyInArray!0 k0!778))))

(declare-fun b!380637 () Bool)

(declare-fun e!231491 () Bool)

(assert (=> b!380637 (= e!231491 tp_is_empty!9189)))

(declare-fun mapNonEmpty!15348 () Bool)

(declare-fun tp!30338 () Bool)

(assert (=> mapNonEmpty!15348 (= mapRes!15348 (and tp!30338 e!231491))))

(declare-fun mapRest!15348 () (Array (_ BitVec 32) ValueCell!4251))

(declare-fun mapValue!15348 () ValueCell!4251)

(declare-fun mapKey!15348 () (_ BitVec 32))

(assert (=> mapNonEmpty!15348 (= (arr!10618 _values!506) (store mapRest!15348 mapKey!15348 mapValue!15348))))

(declare-fun b!380638 () Bool)

(assert (=> b!380638 (= e!231487 tp_is_empty!9189)))

(declare-fun b!380639 () Bool)

(assert (=> b!380639 (= e!231489 (not e!231493))))

(declare-fun res!216102 () Bool)

(assert (=> b!380639 (=> res!216102 e!231493)))

(assert (=> b!380639 (= res!216102 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13357)

(declare-fun getCurrentListMap!1998 (array!22297 array!22299 (_ BitVec 32) (_ BitVec 32) V!13357 V!13357 (_ BitVec 32) Int) ListLongMap!5133)

(assert (=> b!380639 (= lt!178223 (getCurrentListMap!1998 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!178218 () array!22299)

(assert (=> b!380639 (= lt!178216 (getCurrentListMap!1998 lt!178212 lt!178218 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!380639 (and (= lt!178221 lt!178217) (= lt!178217 lt!178221))))

(assert (=> b!380639 (= lt!178217 (+!928 lt!178215 lt!178220))))

(assert (=> b!380639 (= lt!178220 (tuple2!6221 k0!778 v!373))))

(declare-fun lt!178219 () Unit!11750)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!156 (array!22297 array!22299 (_ BitVec 32) (_ BitVec 32) V!13357 V!13357 (_ BitVec 32) (_ BitVec 64) V!13357 (_ BitVec 32) Int) Unit!11750)

(assert (=> b!380639 (= lt!178219 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!156 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!832 (array!22297 array!22299 (_ BitVec 32) (_ BitVec 32) V!13357 V!13357 (_ BitVec 32) Int) ListLongMap!5133)

(assert (=> b!380639 (= lt!178221 (getCurrentListMapNoExtraKeys!832 lt!178212 lt!178218 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!380639 (= lt!178218 (array!22300 (store (arr!10618 _values!506) i!548 (ValueCellFull!4251 v!373)) (size!10970 _values!506)))))

(assert (=> b!380639 (= lt!178215 (getCurrentListMapNoExtraKeys!832 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (= (and start!37414 res!216105) b!380634))

(assert (= (and b!380634 res!216104) b!380632))

(assert (= (and b!380632 res!216097) b!380633))

(assert (= (and b!380633 res!216096) b!380628))

(assert (= (and b!380628 res!216101) b!380636))

(assert (= (and b!380636 res!216107) b!380625))

(assert (= (and b!380625 res!216103) b!380627))

(assert (= (and b!380627 res!216100) b!380631))

(assert (= (and b!380631 res!216099) b!380629))

(assert (= (and b!380629 res!216098) b!380639))

(assert (= (and b!380639 (not res!216102)) b!380630))

(assert (= (and b!380630 (not res!216106)) b!380626))

(assert (= (and b!380635 condMapEmpty!15348) mapIsEmpty!15348))

(assert (= (and b!380635 (not condMapEmpty!15348)) mapNonEmpty!15348))

(get-info :version)

(assert (= (and mapNonEmpty!15348 ((_ is ValueCellFull!4251) mapValue!15348)) b!380637))

(assert (= (and b!380635 ((_ is ValueCellFull!4251) mapDefault!15348)) b!380638))

(assert (= start!37414 b!380635))

(declare-fun m!377583 () Bool)

(assert (=> b!380627 m!377583))

(declare-fun m!377585 () Bool)

(assert (=> b!380636 m!377585))

(declare-fun m!377587 () Bool)

(assert (=> b!380639 m!377587))

(declare-fun m!377589 () Bool)

(assert (=> b!380639 m!377589))

(declare-fun m!377591 () Bool)

(assert (=> b!380639 m!377591))

(declare-fun m!377593 () Bool)

(assert (=> b!380639 m!377593))

(declare-fun m!377595 () Bool)

(assert (=> b!380639 m!377595))

(declare-fun m!377597 () Bool)

(assert (=> b!380639 m!377597))

(declare-fun m!377599 () Bool)

(assert (=> b!380639 m!377599))

(declare-fun m!377601 () Bool)

(assert (=> b!380631 m!377601))

(declare-fun m!377603 () Bool)

(assert (=> b!380631 m!377603))

(declare-fun m!377605 () Bool)

(assert (=> b!380629 m!377605))

(declare-fun m!377607 () Bool)

(assert (=> b!380626 m!377607))

(declare-fun m!377609 () Bool)

(assert (=> b!380626 m!377609))

(declare-fun m!377611 () Bool)

(assert (=> b!380630 m!377611))

(declare-fun m!377613 () Bool)

(assert (=> b!380630 m!377613))

(declare-fun m!377615 () Bool)

(assert (=> b!380630 m!377615))

(declare-fun m!377617 () Bool)

(assert (=> b!380632 m!377617))

(declare-fun m!377619 () Bool)

(assert (=> mapNonEmpty!15348 m!377619))

(declare-fun m!377621 () Bool)

(assert (=> start!37414 m!377621))

(declare-fun m!377623 () Bool)

(assert (=> start!37414 m!377623))

(declare-fun m!377625 () Bool)

(assert (=> start!37414 m!377625))

(declare-fun m!377627 () Bool)

(assert (=> b!380633 m!377627))

(declare-fun m!377629 () Bool)

(assert (=> b!380625 m!377629))

(check-sat tp_is_empty!9189 (not b!380631) (not b!380632) (not mapNonEmpty!15348) (not b!380627) (not b!380629) (not b!380639) (not b!380636) (not b!380626) (not b_next!8541) (not b!380633) (not b!380630) b_and!15783 (not start!37414))
(check-sat b_and!15783 (not b_next!8541))
