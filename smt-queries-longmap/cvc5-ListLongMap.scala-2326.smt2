; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37418 () Bool)

(assert start!37418)

(declare-fun b_free!8545 () Bool)

(declare-fun b_next!8545 () Bool)

(assert (=> start!37418 (= b_free!8545 (not b_next!8545))))

(declare-fun tp!30351 () Bool)

(declare-fun b_and!15787 () Bool)

(assert (=> start!37418 (= tp!30351 b_and!15787)))

(declare-fun b!380715 () Bool)

(declare-fun e!231535 () Bool)

(declare-fun e!231538 () Bool)

(assert (=> b!380715 (= e!231535 e!231538)))

(declare-fun res!216169 () Bool)

(assert (=> b!380715 (=> (not res!216169) (not e!231538))))

(declare-datatypes ((array!22305 0))(
  ( (array!22306 (arr!10621 (Array (_ BitVec 32) (_ BitVec 64))) (size!10973 (_ BitVec 32))) )
))
(declare-fun lt!178299 () array!22305)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22305 (_ BitVec 32)) Bool)

(assert (=> b!380715 (= res!216169 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!178299 mask!970))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun _keys!658 () array!22305)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!380715 (= lt!178299 (array!22306 (store (arr!10621 _keys!658) i!548 k!778) (size!10973 _keys!658)))))

(declare-fun mapNonEmpty!15354 () Bool)

(declare-fun mapRes!15354 () Bool)

(declare-fun tp!30350 () Bool)

(declare-fun e!231539 () Bool)

(assert (=> mapNonEmpty!15354 (= mapRes!15354 (and tp!30350 e!231539))))

(declare-fun mapKey!15354 () (_ BitVec 32))

(declare-datatypes ((V!13363 0))(
  ( (V!13364 (val!4641 Int)) )
))
(declare-datatypes ((ValueCell!4253 0))(
  ( (ValueCellFull!4253 (v!6838 V!13363)) (EmptyCell!4253) )
))
(declare-datatypes ((array!22307 0))(
  ( (array!22308 (arr!10622 (Array (_ BitVec 32) ValueCell!4253)) (size!10974 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22307)

(declare-fun mapRest!15354 () (Array (_ BitVec 32) ValueCell!4253))

(declare-fun mapValue!15354 () ValueCell!4253)

(assert (=> mapNonEmpty!15354 (= (arr!10622 _values!506) (store mapRest!15354 mapKey!15354 mapValue!15354))))

(declare-fun b!380716 () Bool)

(declare-fun res!216173 () Bool)

(assert (=> b!380716 (=> (not res!216173) (not e!231535))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!380716 (= res!216173 (and (= (size!10974 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10973 _keys!658) (size!10974 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!380717 () Bool)

(declare-fun res!216178 () Bool)

(assert (=> b!380717 (=> (not res!216178) (not e!231535))))

(declare-datatypes ((List!6058 0))(
  ( (Nil!6055) (Cons!6054 (h!6910 (_ BitVec 64)) (t!11208 List!6058)) )
))
(declare-fun arrayNoDuplicates!0 (array!22305 (_ BitVec 32) List!6058) Bool)

(assert (=> b!380717 (= res!216178 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6055))))

(declare-fun b!380718 () Bool)

(declare-fun res!216175 () Bool)

(assert (=> b!380718 (=> (not res!216175) (not e!231535))))

(declare-fun arrayContainsKey!0 (array!22305 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!380718 (= res!216175 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!380719 () Bool)

(declare-fun e!231537 () Bool)

(declare-fun e!231540 () Bool)

(assert (=> b!380719 (= e!231537 e!231540)))

(declare-fun res!216172 () Bool)

(assert (=> b!380719 (=> res!216172 e!231540)))

(assert (=> b!380719 (= res!216172 (= k!778 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((tuple2!6224 0))(
  ( (tuple2!6225 (_1!3123 (_ BitVec 64)) (_2!3123 V!13363)) )
))
(declare-datatypes ((List!6059 0))(
  ( (Nil!6056) (Cons!6055 (h!6911 tuple2!6224) (t!11209 List!6059)) )
))
(declare-datatypes ((ListLongMap!5137 0))(
  ( (ListLongMap!5138 (toList!2584 List!6059)) )
))
(declare-fun lt!178291 () ListLongMap!5137)

(declare-fun lt!178302 () ListLongMap!5137)

(assert (=> b!380719 (= lt!178291 lt!178302)))

(declare-fun lt!178298 () ListLongMap!5137)

(declare-fun lt!178301 () tuple2!6224)

(declare-fun +!930 (ListLongMap!5137 tuple2!6224) ListLongMap!5137)

(assert (=> b!380719 (= lt!178302 (+!930 lt!178298 lt!178301))))

(declare-fun lt!178300 () ListLongMap!5137)

(declare-fun lt!178297 () ListLongMap!5137)

(assert (=> b!380719 (= lt!178300 lt!178297)))

(declare-fun lt!178290 () ListLongMap!5137)

(assert (=> b!380719 (= lt!178297 (+!930 lt!178290 lt!178301))))

(declare-fun lt!178295 () ListLongMap!5137)

(assert (=> b!380719 (= lt!178300 (+!930 lt!178295 lt!178301))))

(declare-fun minValue!472 () V!13363)

(assert (=> b!380719 (= lt!178301 (tuple2!6225 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!380720 () Bool)

(declare-fun tp_is_empty!9193 () Bool)

(assert (=> b!380720 (= e!231539 tp_is_empty!9193)))

(declare-fun b!380721 () Bool)

(declare-fun res!216174 () Bool)

(assert (=> b!380721 (=> (not res!216174) (not e!231535))))

(assert (=> b!380721 (= res!216174 (or (= (select (arr!10621 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10621 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!15354 () Bool)

(assert (=> mapIsEmpty!15354 mapRes!15354))

(declare-fun b!380722 () Bool)

(declare-fun res!216176 () Bool)

(assert (=> b!380722 (=> (not res!216176) (not e!231538))))

(assert (=> b!380722 (= res!216176 (arrayNoDuplicates!0 lt!178299 #b00000000000000000000000000000000 Nil!6055))))

(declare-fun b!380723 () Bool)

(declare-fun res!216177 () Bool)

(assert (=> b!380723 (=> (not res!216177) (not e!231535))))

(assert (=> b!380723 (= res!216177 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!380724 () Bool)

(assert (=> b!380724 (= e!231538 (not e!231537))))

(declare-fun res!216168 () Bool)

(assert (=> b!380724 (=> res!216168 e!231537)))

(assert (=> b!380724 (= res!216168 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13363)

(declare-fun getCurrentListMap!2000 (array!22305 array!22307 (_ BitVec 32) (_ BitVec 32) V!13363 V!13363 (_ BitVec 32) Int) ListLongMap!5137)

(assert (=> b!380724 (= lt!178291 (getCurrentListMap!2000 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!178294 () array!22307)

(assert (=> b!380724 (= lt!178300 (getCurrentListMap!2000 lt!178299 lt!178294 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!380724 (and (= lt!178295 lt!178290) (= lt!178290 lt!178295))))

(declare-fun lt!178296 () tuple2!6224)

(assert (=> b!380724 (= lt!178290 (+!930 lt!178298 lt!178296))))

(declare-fun v!373 () V!13363)

(assert (=> b!380724 (= lt!178296 (tuple2!6225 k!778 v!373))))

(declare-datatypes ((Unit!11754 0))(
  ( (Unit!11755) )
))
(declare-fun lt!178292 () Unit!11754)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!158 (array!22305 array!22307 (_ BitVec 32) (_ BitVec 32) V!13363 V!13363 (_ BitVec 32) (_ BitVec 64) V!13363 (_ BitVec 32) Int) Unit!11754)

(assert (=> b!380724 (= lt!178292 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!158 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!834 (array!22305 array!22307 (_ BitVec 32) (_ BitVec 32) V!13363 V!13363 (_ BitVec 32) Int) ListLongMap!5137)

(assert (=> b!380724 (= lt!178295 (getCurrentListMapNoExtraKeys!834 lt!178299 lt!178294 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!380724 (= lt!178294 (array!22308 (store (arr!10622 _values!506) i!548 (ValueCellFull!4253 v!373)) (size!10974 _values!506)))))

(assert (=> b!380724 (= lt!178298 (getCurrentListMapNoExtraKeys!834 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun res!216170 () Bool)

(assert (=> start!37418 (=> (not res!216170) (not e!231535))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37418 (= res!216170 (validMask!0 mask!970))))

(assert (=> start!37418 e!231535))

(declare-fun e!231541 () Bool)

(declare-fun array_inv!7818 (array!22307) Bool)

(assert (=> start!37418 (and (array_inv!7818 _values!506) e!231541)))

(assert (=> start!37418 tp!30351))

(assert (=> start!37418 true))

(assert (=> start!37418 tp_is_empty!9193))

(declare-fun array_inv!7819 (array!22305) Bool)

(assert (=> start!37418 (array_inv!7819 _keys!658)))

(declare-fun b!380725 () Bool)

(declare-fun e!231542 () Bool)

(assert (=> b!380725 (= e!231541 (and e!231542 mapRes!15354))))

(declare-fun condMapEmpty!15354 () Bool)

(declare-fun mapDefault!15354 () ValueCell!4253)

