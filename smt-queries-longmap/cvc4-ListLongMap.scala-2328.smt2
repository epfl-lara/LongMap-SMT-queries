; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37434 () Bool)

(assert start!37434)

(declare-fun b_free!8561 () Bool)

(declare-fun b_next!8561 () Bool)

(assert (=> start!37434 (= b_free!8561 (not b_next!8561))))

(declare-fun tp!30399 () Bool)

(declare-fun b_and!15803 () Bool)

(assert (=> start!37434 (= tp!30399 b_and!15803)))

(declare-fun b!381058 () Bool)

(declare-fun e!231710 () Bool)

(declare-fun e!231713 () Bool)

(assert (=> b!381058 (= e!231710 (not e!231713))))

(declare-fun res!216449 () Bool)

(assert (=> b!381058 (=> res!216449 e!231713)))

(declare-fun lt!178539 () Bool)

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!381058 (= res!216449 (or (and (not lt!178539) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!178539) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!178539)))))

(assert (=> b!381058 (= lt!178539 (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-datatypes ((V!13383 0))(
  ( (V!13384 (val!4649 Int)) )
))
(declare-datatypes ((ValueCell!4261 0))(
  ( (ValueCellFull!4261 (v!6846 V!13383)) (EmptyCell!4261) )
))
(declare-datatypes ((array!22335 0))(
  ( (array!22336 (arr!10636 (Array (_ BitVec 32) ValueCell!4261)) (size!10988 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22335)

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((array!22337 0))(
  ( (array!22338 (arr!10637 (Array (_ BitVec 32) (_ BitVec 64))) (size!10989 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22337)

(declare-datatypes ((tuple2!6240 0))(
  ( (tuple2!6241 (_1!3131 (_ BitVec 64)) (_2!3131 V!13383)) )
))
(declare-datatypes ((List!6073 0))(
  ( (Nil!6070) (Cons!6069 (h!6925 tuple2!6240) (t!11223 List!6073)) )
))
(declare-datatypes ((ListLongMap!5153 0))(
  ( (ListLongMap!5154 (toList!2592 List!6073)) )
))
(declare-fun lt!178534 () ListLongMap!5153)

(declare-fun zeroValue!472 () V!13383)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun minValue!472 () V!13383)

(declare-fun getCurrentListMap!2007 (array!22337 array!22335 (_ BitVec 32) (_ BitVec 32) V!13383 V!13383 (_ BitVec 32) Int) ListLongMap!5153)

(assert (=> b!381058 (= lt!178534 (getCurrentListMap!2007 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!178540 () array!22335)

(declare-fun lt!178536 () array!22337)

(declare-fun lt!178542 () ListLongMap!5153)

(assert (=> b!381058 (= lt!178542 (getCurrentListMap!2007 lt!178536 lt!178540 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!178535 () ListLongMap!5153)

(declare-fun lt!178541 () ListLongMap!5153)

(assert (=> b!381058 (and (= lt!178535 lt!178541) (= lt!178541 lt!178535))))

(declare-fun lt!178538 () ListLongMap!5153)

(declare-fun v!373 () V!13383)

(declare-fun k!778 () (_ BitVec 64))

(declare-fun +!937 (ListLongMap!5153 tuple2!6240) ListLongMap!5153)

(assert (=> b!381058 (= lt!178541 (+!937 lt!178538 (tuple2!6241 k!778 v!373)))))

(declare-datatypes ((Unit!11768 0))(
  ( (Unit!11769) )
))
(declare-fun lt!178537 () Unit!11768)

(declare-fun i!548 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!165 (array!22337 array!22335 (_ BitVec 32) (_ BitVec 32) V!13383 V!13383 (_ BitVec 32) (_ BitVec 64) V!13383 (_ BitVec 32) Int) Unit!11768)

(assert (=> b!381058 (= lt!178537 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!165 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!841 (array!22337 array!22335 (_ BitVec 32) (_ BitVec 32) V!13383 V!13383 (_ BitVec 32) Int) ListLongMap!5153)

(assert (=> b!381058 (= lt!178535 (getCurrentListMapNoExtraKeys!841 lt!178536 lt!178540 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!381058 (= lt!178540 (array!22336 (store (arr!10636 _values!506) i!548 (ValueCellFull!4261 v!373)) (size!10988 _values!506)))))

(assert (=> b!381058 (= lt!178538 (getCurrentListMapNoExtraKeys!841 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!381059 () Bool)

(declare-fun res!216441 () Bool)

(declare-fun e!231711 () Bool)

(assert (=> b!381059 (=> (not res!216441) (not e!231711))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22337 (_ BitVec 32)) Bool)

(assert (=> b!381059 (= res!216441 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!381060 () Bool)

(assert (=> b!381060 (= e!231713 true)))

(assert (=> b!381060 (= lt!178542 lt!178535)))

(declare-fun b!381061 () Bool)

(declare-fun e!231716 () Bool)

(declare-fun tp_is_empty!9209 () Bool)

(assert (=> b!381061 (= e!231716 tp_is_empty!9209)))

(declare-fun b!381062 () Bool)

(declare-fun res!216442 () Bool)

(assert (=> b!381062 (=> (not res!216442) (not e!231710))))

(declare-datatypes ((List!6074 0))(
  ( (Nil!6071) (Cons!6070 (h!6926 (_ BitVec 64)) (t!11224 List!6074)) )
))
(declare-fun arrayNoDuplicates!0 (array!22337 (_ BitVec 32) List!6074) Bool)

(assert (=> b!381062 (= res!216442 (arrayNoDuplicates!0 lt!178536 #b00000000000000000000000000000000 Nil!6071))))

(declare-fun res!216439 () Bool)

(assert (=> start!37434 (=> (not res!216439) (not e!231711))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37434 (= res!216439 (validMask!0 mask!970))))

(assert (=> start!37434 e!231711))

(declare-fun e!231714 () Bool)

(declare-fun array_inv!7832 (array!22335) Bool)

(assert (=> start!37434 (and (array_inv!7832 _values!506) e!231714)))

(assert (=> start!37434 tp!30399))

(assert (=> start!37434 true))

(assert (=> start!37434 tp_is_empty!9209))

(declare-fun array_inv!7833 (array!22337) Bool)

(assert (=> start!37434 (array_inv!7833 _keys!658)))

(declare-fun b!381063 () Bool)

(declare-fun mapRes!15378 () Bool)

(assert (=> b!381063 (= e!231714 (and e!231716 mapRes!15378))))

(declare-fun condMapEmpty!15378 () Bool)

(declare-fun mapDefault!15378 () ValueCell!4261)

