; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37448 () Bool)

(assert start!37448)

(declare-fun b_free!8575 () Bool)

(declare-fun b_next!8575 () Bool)

(assert (=> start!37448 (= b_free!8575 (not b_next!8575))))

(declare-fun tp!30440 () Bool)

(declare-fun b_and!15817 () Bool)

(assert (=> start!37448 (= tp!30440 b_and!15817)))

(declare-fun b!381352 () Bool)

(declare-fun res!216677 () Bool)

(declare-fun e!231861 () Bool)

(assert (=> b!381352 (=> (not res!216677) (not e!231861))))

(declare-datatypes ((array!22361 0))(
  ( (array!22362 (arr!10649 (Array (_ BitVec 32) (_ BitVec 64))) (size!11001 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22361)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!381352 (= res!216677 (or (= (select (arr!10649 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10649 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!381353 () Bool)

(declare-fun res!216676 () Bool)

(assert (=> b!381353 (=> (not res!216676) (not e!231861))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!22361 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!381353 (= res!216676 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!381354 () Bool)

(declare-fun e!231862 () Bool)

(declare-fun e!231857 () Bool)

(assert (=> b!381354 (= e!231862 (not e!231857))))

(declare-fun res!216680 () Bool)

(assert (=> b!381354 (=> res!216680 e!231857)))

(declare-fun lt!178723 () Bool)

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!381354 (= res!216680 (or (and (not lt!178723) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!178723) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!178723)))))

(assert (=> b!381354 (= lt!178723 (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-datatypes ((V!13403 0))(
  ( (V!13404 (val!4656 Int)) )
))
(declare-datatypes ((ValueCell!4268 0))(
  ( (ValueCellFull!4268 (v!6853 V!13403)) (EmptyCell!4268) )
))
(declare-datatypes ((array!22363 0))(
  ( (array!22364 (arr!10650 (Array (_ BitVec 32) ValueCell!4268)) (size!11002 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22363)

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((tuple2!6252 0))(
  ( (tuple2!6253 (_1!3137 (_ BitVec 64)) (_2!3137 V!13403)) )
))
(declare-datatypes ((List!6084 0))(
  ( (Nil!6081) (Cons!6080 (h!6936 tuple2!6252) (t!11234 List!6084)) )
))
(declare-datatypes ((ListLongMap!5165 0))(
  ( (ListLongMap!5166 (toList!2598 List!6084)) )
))
(declare-fun lt!178730 () ListLongMap!5165)

(declare-fun zeroValue!472 () V!13403)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun minValue!472 () V!13403)

(declare-fun getCurrentListMap!2011 (array!22361 array!22363 (_ BitVec 32) (_ BitVec 32) V!13403 V!13403 (_ BitVec 32) Int) ListLongMap!5165)

(assert (=> b!381354 (= lt!178730 (getCurrentListMap!2011 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!178727 () array!22363)

(declare-fun lt!178728 () array!22361)

(declare-fun lt!178729 () ListLongMap!5165)

(assert (=> b!381354 (= lt!178729 (getCurrentListMap!2011 lt!178728 lt!178727 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!178725 () ListLongMap!5165)

(declare-fun lt!178726 () ListLongMap!5165)

(assert (=> b!381354 (and (= lt!178725 lt!178726) (= lt!178726 lt!178725))))

(declare-fun v!373 () V!13403)

(declare-fun lt!178724 () ListLongMap!5165)

(declare-fun +!941 (ListLongMap!5165 tuple2!6252) ListLongMap!5165)

(assert (=> b!381354 (= lt!178726 (+!941 lt!178724 (tuple2!6253 k!778 v!373)))))

(declare-datatypes ((Unit!11776 0))(
  ( (Unit!11777) )
))
(declare-fun lt!178731 () Unit!11776)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!169 (array!22361 array!22363 (_ BitVec 32) (_ BitVec 32) V!13403 V!13403 (_ BitVec 32) (_ BitVec 64) V!13403 (_ BitVec 32) Int) Unit!11776)

(assert (=> b!381354 (= lt!178731 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!169 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!845 (array!22361 array!22363 (_ BitVec 32) (_ BitVec 32) V!13403 V!13403 (_ BitVec 32) Int) ListLongMap!5165)

(assert (=> b!381354 (= lt!178725 (getCurrentListMapNoExtraKeys!845 lt!178728 lt!178727 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!381354 (= lt!178727 (array!22364 (store (arr!10650 _values!506) i!548 (ValueCellFull!4268 v!373)) (size!11002 _values!506)))))

(assert (=> b!381354 (= lt!178724 (getCurrentListMapNoExtraKeys!845 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!381355 () Bool)

(declare-fun res!216673 () Bool)

(assert (=> b!381355 (=> (not res!216673) (not e!231861))))

(assert (=> b!381355 (= res!216673 (and (= (size!11002 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11001 _keys!658) (size!11002 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!381356 () Bool)

(declare-fun e!231863 () Bool)

(declare-fun tp_is_empty!9223 () Bool)

(assert (=> b!381356 (= e!231863 tp_is_empty!9223)))

(declare-fun b!381357 () Bool)

(declare-fun res!216670 () Bool)

(assert (=> b!381357 (=> (not res!216670) (not e!231861))))

(assert (=> b!381357 (= res!216670 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11001 _keys!658))))))

(declare-fun b!381358 () Bool)

(assert (=> b!381358 (= e!231857 true)))

(assert (=> b!381358 (= lt!178729 lt!178725)))

(declare-fun mapIsEmpty!15399 () Bool)

(declare-fun mapRes!15399 () Bool)

(assert (=> mapIsEmpty!15399 mapRes!15399))

(declare-fun b!381359 () Bool)

(assert (=> b!381359 (= e!231861 e!231862)))

(declare-fun res!216671 () Bool)

(assert (=> b!381359 (=> (not res!216671) (not e!231862))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22361 (_ BitVec 32)) Bool)

(assert (=> b!381359 (= res!216671 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!178728 mask!970))))

(assert (=> b!381359 (= lt!178728 (array!22362 (store (arr!10649 _keys!658) i!548 k!778) (size!11001 _keys!658)))))

(declare-fun b!381360 () Bool)

(declare-fun e!231859 () Bool)

(assert (=> b!381360 (= e!231859 tp_is_empty!9223)))

(declare-fun mapNonEmpty!15399 () Bool)

(declare-fun tp!30441 () Bool)

(assert (=> mapNonEmpty!15399 (= mapRes!15399 (and tp!30441 e!231863))))

(declare-fun mapRest!15399 () (Array (_ BitVec 32) ValueCell!4268))

(declare-fun mapValue!15399 () ValueCell!4268)

(declare-fun mapKey!15399 () (_ BitVec 32))

(assert (=> mapNonEmpty!15399 (= (arr!10650 _values!506) (store mapRest!15399 mapKey!15399 mapValue!15399))))

(declare-fun b!381361 () Bool)

(declare-fun e!231860 () Bool)

(assert (=> b!381361 (= e!231860 (and e!231859 mapRes!15399))))

(declare-fun condMapEmpty!15399 () Bool)

(declare-fun mapDefault!15399 () ValueCell!4268)

