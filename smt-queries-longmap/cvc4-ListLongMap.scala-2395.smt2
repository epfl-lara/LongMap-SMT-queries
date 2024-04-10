; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37926 () Bool)

(assert start!37926)

(declare-fun b_free!8939 () Bool)

(declare-fun b_next!8939 () Bool)

(assert (=> start!37926 (= b_free!8939 (not b_next!8939))))

(declare-fun tp!31581 () Bool)

(declare-fun b_and!16229 () Bool)

(assert (=> start!37926 (= tp!31581 b_and!16229)))

(declare-fun b!389937 () Bool)

(declare-fun e!236236 () Bool)

(declare-fun tp_is_empty!9611 () Bool)

(assert (=> b!389937 (= e!236236 tp_is_empty!9611)))

(declare-fun b!389938 () Bool)

(declare-fun res!223067 () Bool)

(declare-fun e!236238 () Bool)

(assert (=> b!389938 (=> (not res!223067) (not e!236238))))

(declare-datatypes ((array!23119 0))(
  ( (array!23120 (arr!11024 (Array (_ BitVec 32) (_ BitVec 64))) (size!11376 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!23119)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23119 (_ BitVec 32)) Bool)

(assert (=> b!389938 (= res!223067 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun mapNonEmpty!15993 () Bool)

(declare-fun mapRes!15993 () Bool)

(declare-fun tp!31580 () Bool)

(declare-fun e!236233 () Bool)

(assert (=> mapNonEmpty!15993 (= mapRes!15993 (and tp!31580 e!236233))))

(declare-datatypes ((V!13919 0))(
  ( (V!13920 (val!4850 Int)) )
))
(declare-datatypes ((ValueCell!4462 0))(
  ( (ValueCellFull!4462 (v!7063 V!13919)) (EmptyCell!4462) )
))
(declare-fun mapValue!15993 () ValueCell!4462)

(declare-fun mapKey!15993 () (_ BitVec 32))

(declare-datatypes ((array!23121 0))(
  ( (array!23122 (arr!11025 (Array (_ BitVec 32) ValueCell!4462)) (size!11377 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!23121)

(declare-fun mapRest!15993 () (Array (_ BitVec 32) ValueCell!4462))

(assert (=> mapNonEmpty!15993 (= (arr!11025 _values!506) (store mapRest!15993 mapKey!15993 mapValue!15993))))

(declare-fun b!389939 () Bool)

(declare-fun e!236235 () Bool)

(assert (=> b!389939 (= e!236235 true)))

(declare-datatypes ((tuple2!6524 0))(
  ( (tuple2!6525 (_1!3273 (_ BitVec 64)) (_2!3273 V!13919)) )
))
(declare-datatypes ((List!6378 0))(
  ( (Nil!6375) (Cons!6374 (h!7230 tuple2!6524) (t!11536 List!6378)) )
))
(declare-datatypes ((ListLongMap!5437 0))(
  ( (ListLongMap!5438 (toList!2734 List!6378)) )
))
(declare-fun lt!183566 () ListLongMap!5437)

(declare-fun lt!183553 () tuple2!6524)

(declare-fun lt!183563 () tuple2!6524)

(declare-fun lt!183556 () ListLongMap!5437)

(declare-fun +!1029 (ListLongMap!5437 tuple2!6524) ListLongMap!5437)

(assert (=> b!389939 (= (+!1029 lt!183566 lt!183553) (+!1029 lt!183556 lt!183563))))

(declare-datatypes ((Unit!11940 0))(
  ( (Unit!11941) )
))
(declare-fun lt!183555 () Unit!11940)

(declare-fun v!373 () V!13919)

(declare-fun lt!183551 () ListLongMap!5437)

(declare-fun k!778 () (_ BitVec 64))

(declare-fun minValue!472 () V!13919)

(declare-fun addCommutativeForDiffKeys!332 (ListLongMap!5437 (_ BitVec 64) V!13919 (_ BitVec 64) V!13919) Unit!11940)

(assert (=> b!389939 (= lt!183555 (addCommutativeForDiffKeys!332 lt!183551 k!778 v!373 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun res!223061 () Bool)

(assert (=> start!37926 (=> (not res!223061) (not e!236238))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37926 (= res!223061 (validMask!0 mask!970))))

(assert (=> start!37926 e!236238))

(declare-fun e!236232 () Bool)

(declare-fun array_inv!8102 (array!23121) Bool)

(assert (=> start!37926 (and (array_inv!8102 _values!506) e!236232)))

(assert (=> start!37926 tp!31581))

(assert (=> start!37926 true))

(assert (=> start!37926 tp_is_empty!9611))

(declare-fun array_inv!8103 (array!23119) Bool)

(assert (=> start!37926 (array_inv!8103 _keys!658)))

(declare-fun b!389940 () Bool)

(declare-fun e!236234 () Bool)

(declare-fun e!236237 () Bool)

(assert (=> b!389940 (= e!236234 (not e!236237))))

(declare-fun res!223066 () Bool)

(assert (=> b!389940 (=> res!223066 e!236237)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!389940 (= res!223066 (or (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!183557 () ListLongMap!5437)

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13919)

(declare-fun getCurrentListMap!2083 (array!23119 array!23121 (_ BitVec 32) (_ BitVec 32) V!13919 V!13919 (_ BitVec 32) Int) ListLongMap!5437)

(assert (=> b!389940 (= lt!183557 (getCurrentListMap!2083 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!183567 () array!23119)

(declare-fun lt!183561 () array!23121)

(declare-fun lt!183559 () ListLongMap!5437)

(assert (=> b!389940 (= lt!183559 (getCurrentListMap!2083 lt!183567 lt!183561 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!183564 () ListLongMap!5437)

(declare-fun lt!183562 () ListLongMap!5437)

(assert (=> b!389940 (and (= lt!183564 lt!183562) (= lt!183562 lt!183564))))

(declare-fun lt!183565 () ListLongMap!5437)

(assert (=> b!389940 (= lt!183562 (+!1029 lt!183565 lt!183563))))

(assert (=> b!389940 (= lt!183563 (tuple2!6525 k!778 v!373))))

(declare-fun lt!183558 () Unit!11940)

(declare-fun i!548 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!247 (array!23119 array!23121 (_ BitVec 32) (_ BitVec 32) V!13919 V!13919 (_ BitVec 32) (_ BitVec 64) V!13919 (_ BitVec 32) Int) Unit!11940)

(assert (=> b!389940 (= lt!183558 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!247 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!963 (array!23119 array!23121 (_ BitVec 32) (_ BitVec 32) V!13919 V!13919 (_ BitVec 32) Int) ListLongMap!5437)

(assert (=> b!389940 (= lt!183564 (getCurrentListMapNoExtraKeys!963 lt!183567 lt!183561 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!389940 (= lt!183561 (array!23122 (store (arr!11025 _values!506) i!548 (ValueCellFull!4462 v!373)) (size!11377 _values!506)))))

(assert (=> b!389940 (= lt!183565 (getCurrentListMapNoExtraKeys!963 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!389941 () Bool)

(assert (=> b!389941 (= e!236233 tp_is_empty!9611)))

(declare-fun b!389942 () Bool)

(declare-fun res!223065 () Bool)

(assert (=> b!389942 (=> (not res!223065) (not e!236238))))

(assert (=> b!389942 (= res!223065 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11376 _keys!658))))))

(declare-fun b!389943 () Bool)

(assert (=> b!389943 (= e!236232 (and e!236236 mapRes!15993))))

(declare-fun condMapEmpty!15993 () Bool)

(declare-fun mapDefault!15993 () ValueCell!4462)

