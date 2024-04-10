; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37770 () Bool)

(assert start!37770)

(declare-fun b_free!8873 () Bool)

(declare-fun b_next!8873 () Bool)

(assert (=> start!37770 (= b_free!8873 (not b_next!8873))))

(declare-fun tp!31371 () Bool)

(declare-fun b_and!16115 () Bool)

(assert (=> start!37770 (= tp!31371 b_and!16115)))

(declare-fun b!387728 () Bool)

(declare-fun res!221606 () Bool)

(declare-fun e!235027 () Bool)

(assert (=> b!387728 (=> (not res!221606) (not e!235027))))

(declare-datatypes ((array!22981 0))(
  ( (array!22982 (arr!10959 (Array (_ BitVec 32) (_ BitVec 64))) (size!11311 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22981)

(declare-datatypes ((List!6325 0))(
  ( (Nil!6322) (Cons!6321 (h!7177 (_ BitVec 64)) (t!11475 List!6325)) )
))
(declare-fun arrayNoDuplicates!0 (array!22981 (_ BitVec 32) List!6325) Bool)

(assert (=> b!387728 (= res!221606 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6322))))

(declare-fun b!387729 () Bool)

(declare-fun res!221601 () Bool)

(assert (=> b!387729 (=> (not res!221601) (not e!235027))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!387729 (= res!221601 (or (= (select (arr!10959 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10959 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!387730 () Bool)

(declare-fun e!235025 () Bool)

(assert (=> b!387730 (= e!235025 false)))

(declare-datatypes ((V!13831 0))(
  ( (V!13832 (val!4817 Int)) )
))
(declare-datatypes ((ValueCell!4429 0))(
  ( (ValueCellFull!4429 (v!7014 V!13831)) (EmptyCell!4429) )
))
(declare-datatypes ((array!22983 0))(
  ( (array!22984 (arr!10960 (Array (_ BitVec 32) ValueCell!4429)) (size!11312 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22983)

(declare-fun lt!182105 () array!22981)

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((tuple2!6474 0))(
  ( (tuple2!6475 (_1!3248 (_ BitVec 64)) (_2!3248 V!13831)) )
))
(declare-datatypes ((List!6326 0))(
  ( (Nil!6323) (Cons!6322 (h!7178 tuple2!6474) (t!11476 List!6326)) )
))
(declare-datatypes ((ListLongMap!5387 0))(
  ( (ListLongMap!5388 (toList!2709 List!6326)) )
))
(declare-fun lt!182104 () ListLongMap!5387)

(declare-fun zeroValue!472 () V!13831)

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-fun v!373 () V!13831)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun minValue!472 () V!13831)

(declare-fun getCurrentListMapNoExtraKeys!938 (array!22981 array!22983 (_ BitVec 32) (_ BitVec 32) V!13831 V!13831 (_ BitVec 32) Int) ListLongMap!5387)

(assert (=> b!387730 (= lt!182104 (getCurrentListMapNoExtraKeys!938 lt!182105 (array!22984 (store (arr!10960 _values!506) i!548 (ValueCellFull!4429 v!373)) (size!11312 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!182106 () ListLongMap!5387)

(assert (=> b!387730 (= lt!182106 (getCurrentListMapNoExtraKeys!938 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!387731 () Bool)

(declare-fun res!221603 () Bool)

(assert (=> b!387731 (=> (not res!221603) (not e!235027))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22981 (_ BitVec 32)) Bool)

(assert (=> b!387731 (= res!221603 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!387732 () Bool)

(declare-fun res!221599 () Bool)

(assert (=> b!387732 (=> (not res!221599) (not e!235025))))

(assert (=> b!387732 (= res!221599 (arrayNoDuplicates!0 lt!182105 #b00000000000000000000000000000000 Nil!6322))))

(declare-fun b!387733 () Bool)

(declare-fun e!235023 () Bool)

(declare-fun tp_is_empty!9545 () Bool)

(assert (=> b!387733 (= e!235023 tp_is_empty!9545)))

(declare-fun mapNonEmpty!15882 () Bool)

(declare-fun mapRes!15882 () Bool)

(declare-fun tp!31370 () Bool)

(declare-fun e!235024 () Bool)

(assert (=> mapNonEmpty!15882 (= mapRes!15882 (and tp!31370 e!235024))))

(declare-fun mapKey!15882 () (_ BitVec 32))

(declare-fun mapValue!15882 () ValueCell!4429)

(declare-fun mapRest!15882 () (Array (_ BitVec 32) ValueCell!4429))

(assert (=> mapNonEmpty!15882 (= (arr!10960 _values!506) (store mapRest!15882 mapKey!15882 mapValue!15882))))

(declare-fun b!387734 () Bool)

(declare-fun res!221604 () Bool)

(assert (=> b!387734 (=> (not res!221604) (not e!235027))))

(assert (=> b!387734 (= res!221604 (and (= (size!11312 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11311 _keys!658) (size!11312 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!387735 () Bool)

(declare-fun e!235028 () Bool)

(assert (=> b!387735 (= e!235028 (and e!235023 mapRes!15882))))

(declare-fun condMapEmpty!15882 () Bool)

(declare-fun mapDefault!15882 () ValueCell!4429)

