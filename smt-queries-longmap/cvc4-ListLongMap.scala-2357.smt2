; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37608 () Bool)

(assert start!37608)

(declare-fun b_free!8735 () Bool)

(declare-fun b_next!8735 () Bool)

(assert (=> start!37608 (= b_free!8735 (not b_next!8735))))

(declare-fun tp!30921 () Bool)

(declare-fun b_and!15977 () Bool)

(assert (=> start!37608 (= tp!30921 b_and!15977)))

(declare-fun b!384721 () Bool)

(declare-fun res!219329 () Bool)

(declare-fun e!233552 () Bool)

(assert (=> b!384721 (=> (not res!219329) (not e!233552))))

(declare-datatypes ((array!22667 0))(
  ( (array!22668 (arr!10802 (Array (_ BitVec 32) (_ BitVec 64))) (size!11154 (_ BitVec 32))) )
))
(declare-fun lt!181115 () array!22667)

(declare-datatypes ((List!6211 0))(
  ( (Nil!6208) (Cons!6207 (h!7063 (_ BitVec 64)) (t!11361 List!6211)) )
))
(declare-fun arrayNoDuplicates!0 (array!22667 (_ BitVec 32) List!6211) Bool)

(assert (=> b!384721 (= res!219329 (arrayNoDuplicates!0 lt!181115 #b00000000000000000000000000000000 Nil!6208))))

(declare-fun b!384722 () Bool)

(declare-fun e!233550 () Bool)

(assert (=> b!384722 (= e!233552 (not e!233550))))

(declare-fun res!219319 () Bool)

(assert (=> b!384722 (=> res!219319 e!233550)))

(declare-fun lt!181114 () Bool)

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!384722 (= res!219319 (or (and (not lt!181114) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!181114) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!181114)))))

(assert (=> b!384722 (= lt!181114 (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-datatypes ((V!13615 0))(
  ( (V!13616 (val!4736 Int)) )
))
(declare-datatypes ((ValueCell!4348 0))(
  ( (ValueCellFull!4348 (v!6933 V!13615)) (EmptyCell!4348) )
))
(declare-datatypes ((array!22669 0))(
  ( (array!22670 (arr!10803 (Array (_ BitVec 32) ValueCell!4348)) (size!11155 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22669)

(declare-datatypes ((tuple2!6376 0))(
  ( (tuple2!6377 (_1!3199 (_ BitVec 64)) (_2!3199 V!13615)) )
))
(declare-datatypes ((List!6212 0))(
  ( (Nil!6209) (Cons!6208 (h!7064 tuple2!6376) (t!11362 List!6212)) )
))
(declare-datatypes ((ListLongMap!5289 0))(
  ( (ListLongMap!5290 (toList!2660 List!6212)) )
))
(declare-fun lt!181110 () ListLongMap!5289)

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13615)

(declare-fun _keys!658 () array!22667)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun minValue!472 () V!13615)

(declare-fun getCurrentListMap!2059 (array!22667 array!22669 (_ BitVec 32) (_ BitVec 32) V!13615 V!13615 (_ BitVec 32) Int) ListLongMap!5289)

(assert (=> b!384722 (= lt!181110 (getCurrentListMap!2059 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!181111 () array!22669)

(declare-fun lt!181113 () ListLongMap!5289)

(assert (=> b!384722 (= lt!181113 (getCurrentListMap!2059 lt!181115 lt!181111 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!181112 () ListLongMap!5289)

(declare-fun lt!181109 () ListLongMap!5289)

(assert (=> b!384722 (and (= lt!181112 lt!181109) (= lt!181109 lt!181112))))

(declare-fun lt!181116 () ListLongMap!5289)

(declare-fun lt!181108 () tuple2!6376)

(declare-fun +!995 (ListLongMap!5289 tuple2!6376) ListLongMap!5289)

(assert (=> b!384722 (= lt!181109 (+!995 lt!181116 lt!181108))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun v!373 () V!13615)

(assert (=> b!384722 (= lt!181108 (tuple2!6377 k!778 v!373))))

(declare-datatypes ((Unit!11872 0))(
  ( (Unit!11873) )
))
(declare-fun lt!181106 () Unit!11872)

(declare-fun i!548 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!217 (array!22667 array!22669 (_ BitVec 32) (_ BitVec 32) V!13615 V!13615 (_ BitVec 32) (_ BitVec 64) V!13615 (_ BitVec 32) Int) Unit!11872)

(assert (=> b!384722 (= lt!181106 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!217 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!893 (array!22667 array!22669 (_ BitVec 32) (_ BitVec 32) V!13615 V!13615 (_ BitVec 32) Int) ListLongMap!5289)

(assert (=> b!384722 (= lt!181112 (getCurrentListMapNoExtraKeys!893 lt!181115 lt!181111 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!384722 (= lt!181111 (array!22670 (store (arr!10803 _values!506) i!548 (ValueCellFull!4348 v!373)) (size!11155 _values!506)))))

(assert (=> b!384722 (= lt!181116 (getCurrentListMapNoExtraKeys!893 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun res!219324 () Bool)

(declare-fun e!233547 () Bool)

(assert (=> start!37608 (=> (not res!219324) (not e!233547))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37608 (= res!219324 (validMask!0 mask!970))))

(assert (=> start!37608 e!233547))

(declare-fun e!233548 () Bool)

(declare-fun array_inv!7952 (array!22669) Bool)

(assert (=> start!37608 (and (array_inv!7952 _values!506) e!233548)))

(assert (=> start!37608 tp!30921))

(assert (=> start!37608 true))

(declare-fun tp_is_empty!9383 () Bool)

(assert (=> start!37608 tp_is_empty!9383))

(declare-fun array_inv!7953 (array!22667) Bool)

(assert (=> start!37608 (array_inv!7953 _keys!658)))

(declare-fun mapIsEmpty!15639 () Bool)

(declare-fun mapRes!15639 () Bool)

(assert (=> mapIsEmpty!15639 mapRes!15639))

(declare-fun b!384723 () Bool)

(declare-fun e!233546 () Bool)

(assert (=> b!384723 (= e!233546 tp_is_empty!9383)))

(declare-fun b!384724 () Bool)

(assert (=> b!384724 (= e!233547 e!233552)))

(declare-fun res!219322 () Bool)

(assert (=> b!384724 (=> (not res!219322) (not e!233552))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22667 (_ BitVec 32)) Bool)

(assert (=> b!384724 (= res!219322 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!181115 mask!970))))

(assert (=> b!384724 (= lt!181115 (array!22668 (store (arr!10802 _keys!658) i!548 k!778) (size!11154 _keys!658)))))

(declare-fun b!384725 () Bool)

(declare-fun e!233549 () Bool)

(assert (=> b!384725 (= e!233549 tp_is_empty!9383)))

(declare-fun b!384726 () Bool)

(assert (=> b!384726 (= e!233548 (and e!233549 mapRes!15639))))

(declare-fun condMapEmpty!15639 () Bool)

(declare-fun mapDefault!15639 () ValueCell!4348)

