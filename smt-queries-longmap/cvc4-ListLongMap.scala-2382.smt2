; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37758 () Bool)

(assert start!37758)

(declare-fun b_free!8861 () Bool)

(declare-fun b_next!8861 () Bool)

(assert (=> start!37758 (= b_free!8861 (not b_next!8861))))

(declare-fun tp!31334 () Bool)

(declare-fun b_and!16103 () Bool)

(assert (=> start!37758 (= tp!31334 b_and!16103)))

(declare-fun res!221424 () Bool)

(declare-fun e!234917 () Bool)

(assert (=> start!37758 (=> (not res!221424) (not e!234917))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37758 (= res!221424 (validMask!0 mask!970))))

(assert (=> start!37758 e!234917))

(declare-datatypes ((V!13815 0))(
  ( (V!13816 (val!4811 Int)) )
))
(declare-datatypes ((ValueCell!4423 0))(
  ( (ValueCellFull!4423 (v!7008 V!13815)) (EmptyCell!4423) )
))
(declare-datatypes ((array!22957 0))(
  ( (array!22958 (arr!10947 (Array (_ BitVec 32) ValueCell!4423)) (size!11299 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22957)

(declare-fun e!234919 () Bool)

(declare-fun array_inv!8054 (array!22957) Bool)

(assert (=> start!37758 (and (array_inv!8054 _values!506) e!234919)))

(assert (=> start!37758 tp!31334))

(assert (=> start!37758 true))

(declare-fun tp_is_empty!9533 () Bool)

(assert (=> start!37758 tp_is_empty!9533))

(declare-datatypes ((array!22959 0))(
  ( (array!22960 (arr!10948 (Array (_ BitVec 32) (_ BitVec 64))) (size!11300 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22959)

(declare-fun array_inv!8055 (array!22959) Bool)

(assert (=> start!37758 (array_inv!8055 _keys!658)))

(declare-fun b!387494 () Bool)

(declare-fun e!234920 () Bool)

(assert (=> b!387494 (= e!234917 e!234920)))

(declare-fun res!221425 () Bool)

(assert (=> b!387494 (=> (not res!221425) (not e!234920))))

(declare-fun lt!182051 () array!22959)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22959 (_ BitVec 32)) Bool)

(assert (=> b!387494 (= res!221425 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!182051 mask!970))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!387494 (= lt!182051 (array!22960 (store (arr!10948 _keys!658) i!548 k!778) (size!11300 _keys!658)))))

(declare-fun b!387495 () Bool)

(declare-fun res!221421 () Bool)

(assert (=> b!387495 (=> (not res!221421) (not e!234917))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!387495 (= res!221421 (validKeyInArray!0 k!778))))

(declare-fun b!387496 () Bool)

(declare-fun res!221423 () Bool)

(assert (=> b!387496 (=> (not res!221423) (not e!234920))))

(declare-datatypes ((List!6317 0))(
  ( (Nil!6314) (Cons!6313 (h!7169 (_ BitVec 64)) (t!11467 List!6317)) )
))
(declare-fun arrayNoDuplicates!0 (array!22959 (_ BitVec 32) List!6317) Bool)

(assert (=> b!387496 (= res!221423 (arrayNoDuplicates!0 lt!182051 #b00000000000000000000000000000000 Nil!6314))))

(declare-fun b!387497 () Bool)

(assert (=> b!387497 (= e!234920 false)))

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((tuple2!6466 0))(
  ( (tuple2!6467 (_1!3244 (_ BitVec 64)) (_2!3244 V!13815)) )
))
(declare-datatypes ((List!6318 0))(
  ( (Nil!6315) (Cons!6314 (h!7170 tuple2!6466) (t!11468 List!6318)) )
))
(declare-datatypes ((ListLongMap!5379 0))(
  ( (ListLongMap!5380 (toList!2705 List!6318)) )
))
(declare-fun lt!182052 () ListLongMap!5379)

(declare-fun zeroValue!472 () V!13815)

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-fun v!373 () V!13815)

(declare-fun minValue!472 () V!13815)

(declare-fun getCurrentListMapNoExtraKeys!934 (array!22959 array!22957 (_ BitVec 32) (_ BitVec 32) V!13815 V!13815 (_ BitVec 32) Int) ListLongMap!5379)

(assert (=> b!387497 (= lt!182052 (getCurrentListMapNoExtraKeys!934 lt!182051 (array!22958 (store (arr!10947 _values!506) i!548 (ValueCellFull!4423 v!373)) (size!11299 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!182050 () ListLongMap!5379)

(assert (=> b!387497 (= lt!182050 (getCurrentListMapNoExtraKeys!934 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun mapNonEmpty!15864 () Bool)

(declare-fun mapRes!15864 () Bool)

(declare-fun tp!31335 () Bool)

(declare-fun e!234916 () Bool)

(assert (=> mapNonEmpty!15864 (= mapRes!15864 (and tp!31335 e!234916))))

(declare-fun mapRest!15864 () (Array (_ BitVec 32) ValueCell!4423))

(declare-fun mapKey!15864 () (_ BitVec 32))

(declare-fun mapValue!15864 () ValueCell!4423)

(assert (=> mapNonEmpty!15864 (= (arr!10947 _values!506) (store mapRest!15864 mapKey!15864 mapValue!15864))))

(declare-fun b!387498 () Bool)

(declare-fun res!221422 () Bool)

(assert (=> b!387498 (=> (not res!221422) (not e!234917))))

(assert (=> b!387498 (= res!221422 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11300 _keys!658))))))

(declare-fun b!387499 () Bool)

(declare-fun res!221419 () Bool)

(assert (=> b!387499 (=> (not res!221419) (not e!234917))))

(assert (=> b!387499 (= res!221419 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!387500 () Bool)

(declare-fun e!234918 () Bool)

(assert (=> b!387500 (= e!234919 (and e!234918 mapRes!15864))))

(declare-fun condMapEmpty!15864 () Bool)

(declare-fun mapDefault!15864 () ValueCell!4423)

