; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37638 () Bool)

(assert start!37638)

(declare-fun b_free!8765 () Bool)

(declare-fun b_next!8765 () Bool)

(assert (=> start!37638 (= b_free!8765 (not b_next!8765))))

(declare-fun tp!31011 () Bool)

(declare-fun b_and!16007 () Bool)

(assert (=> start!37638 (= tp!31011 b_and!16007)))

(declare-fun b!385359 () Bool)

(declare-fun e!233869 () Bool)

(declare-fun e!233871 () Bool)

(assert (=> b!385359 (= e!233869 e!233871)))

(declare-fun res!219829 () Bool)

(assert (=> b!385359 (=> res!219829 e!233871)))

(declare-datatypes ((V!13655 0))(
  ( (V!13656 (val!4751 Int)) )
))
(declare-datatypes ((tuple2!6402 0))(
  ( (tuple2!6403 (_1!3212 (_ BitVec 64)) (_2!3212 V!13655)) )
))
(declare-datatypes ((List!6237 0))(
  ( (Nil!6234) (Cons!6233 (h!7089 tuple2!6402) (t!11387 List!6237)) )
))
(declare-datatypes ((ListLongMap!5315 0))(
  ( (ListLongMap!5316 (toList!2673 List!6237)) )
))
(declare-fun lt!181594 () ListLongMap!5315)

(declare-fun lt!181597 () tuple2!6402)

(declare-fun lt!181600 () ListLongMap!5315)

(declare-fun +!1008 (ListLongMap!5315 tuple2!6402) ListLongMap!5315)

(assert (=> b!385359 (= res!219829 (not (= (+!1008 lt!181594 lt!181597) lt!181600)))))

(declare-fun lt!181602 () ListLongMap!5315)

(assert (=> b!385359 (= lt!181600 lt!181602)))

(declare-fun mapIsEmpty!15684 () Bool)

(declare-fun mapRes!15684 () Bool)

(assert (=> mapIsEmpty!15684 mapRes!15684))

(declare-fun b!385360 () Bool)

(declare-fun res!219825 () Bool)

(declare-fun e!233872 () Bool)

(assert (=> b!385360 (=> (not res!219825) (not e!233872))))

(declare-datatypes ((array!22727 0))(
  ( (array!22728 (arr!10832 (Array (_ BitVec 32) (_ BitVec 64))) (size!11184 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22727)

(declare-datatypes ((List!6238 0))(
  ( (Nil!6235) (Cons!6234 (h!7090 (_ BitVec 64)) (t!11388 List!6238)) )
))
(declare-fun arrayNoDuplicates!0 (array!22727 (_ BitVec 32) List!6238) Bool)

(assert (=> b!385360 (= res!219825 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6235))))

(declare-fun b!385361 () Bool)

(declare-fun e!233870 () Bool)

(declare-fun tp_is_empty!9413 () Bool)

(assert (=> b!385361 (= e!233870 tp_is_empty!9413)))

(declare-fun b!385362 () Bool)

(declare-fun res!219822 () Bool)

(assert (=> b!385362 (=> (not res!219822) (not e!233872))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!22727 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!385362 (= res!219822 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!15684 () Bool)

(declare-fun tp!31010 () Bool)

(declare-fun e!233873 () Bool)

(assert (=> mapNonEmpty!15684 (= mapRes!15684 (and tp!31010 e!233873))))

(declare-datatypes ((ValueCell!4363 0))(
  ( (ValueCellFull!4363 (v!6948 V!13655)) (EmptyCell!4363) )
))
(declare-datatypes ((array!22729 0))(
  ( (array!22730 (arr!10833 (Array (_ BitVec 32) ValueCell!4363)) (size!11185 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22729)

(declare-fun mapValue!15684 () ValueCell!4363)

(declare-fun mapKey!15684 () (_ BitVec 32))

(declare-fun mapRest!15684 () (Array (_ BitVec 32) ValueCell!4363))

(assert (=> mapNonEmpty!15684 (= (arr!10833 _values!506) (store mapRest!15684 mapKey!15684 mapValue!15684))))

(declare-fun b!385363 () Bool)

(assert (=> b!385363 (= e!233871 (bvsle #b00000000000000000000000000000000 (size!11184 _keys!658)))))

(declare-fun b!385364 () Bool)

(declare-fun e!233874 () Bool)

(assert (=> b!385364 (= e!233872 e!233874)))

(declare-fun res!219833 () Bool)

(assert (=> b!385364 (=> (not res!219833) (not e!233874))))

(declare-fun lt!181601 () array!22727)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22727 (_ BitVec 32)) Bool)

(assert (=> b!385364 (= res!219833 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!181601 mask!970))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!385364 (= lt!181601 (array!22728 (store (arr!10832 _keys!658) i!548 k!778) (size!11184 _keys!658)))))

(declare-fun b!385365 () Bool)

(declare-fun res!219824 () Bool)

(assert (=> b!385365 (=> (not res!219824) (not e!233872))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!385365 (= res!219824 (validKeyInArray!0 k!778))))

(declare-fun b!385367 () Bool)

(declare-fun res!219826 () Bool)

(assert (=> b!385367 (=> (not res!219826) (not e!233874))))

(assert (=> b!385367 (= res!219826 (arrayNoDuplicates!0 lt!181601 #b00000000000000000000000000000000 Nil!6235))))

(declare-fun b!385368 () Bool)

(declare-fun res!219823 () Bool)

(assert (=> b!385368 (=> (not res!219823) (not e!233872))))

(assert (=> b!385368 (= res!219823 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!385369 () Bool)

(assert (=> b!385369 (= e!233874 (not e!233869))))

(declare-fun res!219830 () Bool)

(assert (=> b!385369 (=> res!219830 e!233869)))

(declare-fun lt!181595 () Bool)

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!385369 (= res!219830 (or (and (not lt!181595) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!181595) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!181595)))))

(assert (=> b!385369 (= lt!181595 (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13655)

(declare-fun minValue!472 () V!13655)

(declare-fun getCurrentListMap!2068 (array!22727 array!22729 (_ BitVec 32) (_ BitVec 32) V!13655 V!13655 (_ BitVec 32) Int) ListLongMap!5315)

(assert (=> b!385369 (= lt!181594 (getCurrentListMap!2068 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!181596 () array!22729)

(assert (=> b!385369 (= lt!181600 (getCurrentListMap!2068 lt!181601 lt!181596 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!181593 () ListLongMap!5315)

(assert (=> b!385369 (and (= lt!181602 lt!181593) (= lt!181593 lt!181602))))

(declare-fun lt!181598 () ListLongMap!5315)

(assert (=> b!385369 (= lt!181593 (+!1008 lt!181598 lt!181597))))

(declare-fun v!373 () V!13655)

(assert (=> b!385369 (= lt!181597 (tuple2!6403 k!778 v!373))))

(declare-datatypes ((Unit!11890 0))(
  ( (Unit!11891) )
))
(declare-fun lt!181599 () Unit!11890)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!226 (array!22727 array!22729 (_ BitVec 32) (_ BitVec 32) V!13655 V!13655 (_ BitVec 32) (_ BitVec 64) V!13655 (_ BitVec 32) Int) Unit!11890)

(assert (=> b!385369 (= lt!181599 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!226 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!902 (array!22727 array!22729 (_ BitVec 32) (_ BitVec 32) V!13655 V!13655 (_ BitVec 32) Int) ListLongMap!5315)

(assert (=> b!385369 (= lt!181602 (getCurrentListMapNoExtraKeys!902 lt!181601 lt!181596 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!385369 (= lt!181596 (array!22730 (store (arr!10833 _values!506) i!548 (ValueCellFull!4363 v!373)) (size!11185 _values!506)))))

(assert (=> b!385369 (= lt!181598 (getCurrentListMapNoExtraKeys!902 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!385370 () Bool)

(declare-fun e!233876 () Bool)

(assert (=> b!385370 (= e!233876 (and e!233870 mapRes!15684))))

(declare-fun condMapEmpty!15684 () Bool)

(declare-fun mapDefault!15684 () ValueCell!4363)

