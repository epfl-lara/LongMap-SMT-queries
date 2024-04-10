; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38046 () Bool)

(assert start!38046)

(declare-fun b_free!8993 () Bool)

(declare-fun b_next!8993 () Bool)

(assert (=> start!38046 (= b_free!8993 (not b_next!8993))))

(declare-fun tp!31751 () Bool)

(declare-fun b_and!16319 () Bool)

(assert (=> start!38046 (= tp!31751 b_and!16319)))

(declare-fun b!391752 () Bool)

(declare-fun res!224302 () Bool)

(declare-fun e!237255 () Bool)

(assert (=> b!391752 (=> (not res!224302) (not e!237255))))

(declare-datatypes ((array!23233 0))(
  ( (array!23234 (arr!11078 (Array (_ BitVec 32) (_ BitVec 64))) (size!11430 (_ BitVec 32))) )
))
(declare-fun lt!184980 () array!23233)

(declare-datatypes ((List!6426 0))(
  ( (Nil!6423) (Cons!6422 (h!7278 (_ BitVec 64)) (t!11590 List!6426)) )
))
(declare-fun arrayNoDuplicates!0 (array!23233 (_ BitVec 32) List!6426) Bool)

(assert (=> b!391752 (= res!224302 (arrayNoDuplicates!0 lt!184980 #b00000000000000000000000000000000 Nil!6423))))

(declare-fun b!391753 () Bool)

(declare-fun res!224308 () Bool)

(declare-fun e!237259 () Bool)

(assert (=> b!391753 (=> (not res!224308) (not e!237259))))

(declare-fun _keys!658 () array!23233)

(declare-fun k!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!23233 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!391753 (= res!224308 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun res!224297 () Bool)

(assert (=> start!38046 (=> (not res!224297) (not e!237259))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!38046 (= res!224297 (validMask!0 mask!970))))

(assert (=> start!38046 e!237259))

(declare-datatypes ((V!13991 0))(
  ( (V!13992 (val!4877 Int)) )
))
(declare-datatypes ((ValueCell!4489 0))(
  ( (ValueCellFull!4489 (v!7102 V!13991)) (EmptyCell!4489) )
))
(declare-datatypes ((array!23235 0))(
  ( (array!23236 (arr!11079 (Array (_ BitVec 32) ValueCell!4489)) (size!11431 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!23235)

(declare-fun e!237254 () Bool)

(declare-fun array_inv!8138 (array!23235) Bool)

(assert (=> start!38046 (and (array_inv!8138 _values!506) e!237254)))

(assert (=> start!38046 tp!31751))

(assert (=> start!38046 true))

(declare-fun tp_is_empty!9665 () Bool)

(assert (=> start!38046 tp_is_empty!9665))

(declare-fun array_inv!8139 (array!23233) Bool)

(assert (=> start!38046 (array_inv!8139 _keys!658)))

(declare-fun b!391754 () Bool)

(declare-fun res!224303 () Bool)

(assert (=> b!391754 (=> (not res!224303) (not e!237259))))

(assert (=> b!391754 (= res!224303 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6423))))

(declare-fun b!391755 () Bool)

(declare-fun res!224307 () Bool)

(assert (=> b!391755 (=> (not res!224307) (not e!237259))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!391755 (= res!224307 (and (= (size!11431 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11430 _keys!658) (size!11431 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!391756 () Bool)

(declare-fun e!237260 () Bool)

(assert (=> b!391756 (= e!237255 (not e!237260))))

(declare-fun res!224304 () Bool)

(assert (=> b!391756 (=> res!224304 e!237260)))

(assert (=> b!391756 (= res!224304 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun zeroValue!472 () V!13991)

(declare-datatypes ((tuple2!6572 0))(
  ( (tuple2!6573 (_1!3297 (_ BitVec 64)) (_2!3297 V!13991)) )
))
(declare-datatypes ((List!6427 0))(
  ( (Nil!6424) (Cons!6423 (h!7279 tuple2!6572) (t!11591 List!6427)) )
))
(declare-datatypes ((ListLongMap!5485 0))(
  ( (ListLongMap!5486 (toList!2758 List!6427)) )
))
(declare-fun lt!184988 () ListLongMap!5485)

(declare-fun defaultEntry!514 () Int)

(declare-fun minValue!472 () V!13991)

(declare-fun getCurrentListMap!2100 (array!23233 array!23235 (_ BitVec 32) (_ BitVec 32) V!13991 V!13991 (_ BitVec 32) Int) ListLongMap!5485)

(assert (=> b!391756 (= lt!184988 (getCurrentListMap!2100 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!184986 () ListLongMap!5485)

(declare-fun lt!184987 () array!23235)

(assert (=> b!391756 (= lt!184986 (getCurrentListMap!2100 lt!184980 lt!184987 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!184985 () ListLongMap!5485)

(declare-fun lt!184981 () ListLongMap!5485)

(assert (=> b!391756 (and (= lt!184985 lt!184981) (= lt!184981 lt!184985))))

(declare-fun lt!184992 () ListLongMap!5485)

(declare-fun lt!184989 () tuple2!6572)

(declare-fun +!1053 (ListLongMap!5485 tuple2!6572) ListLongMap!5485)

(assert (=> b!391756 (= lt!184981 (+!1053 lt!184992 lt!184989))))

(declare-fun v!373 () V!13991)

(assert (=> b!391756 (= lt!184989 (tuple2!6573 k!778 v!373))))

(declare-datatypes ((Unit!11988 0))(
  ( (Unit!11989) )
))
(declare-fun lt!184983 () Unit!11988)

(declare-fun i!548 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!264 (array!23233 array!23235 (_ BitVec 32) (_ BitVec 32) V!13991 V!13991 (_ BitVec 32) (_ BitVec 64) V!13991 (_ BitVec 32) Int) Unit!11988)

(assert (=> b!391756 (= lt!184983 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!264 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!980 (array!23233 array!23235 (_ BitVec 32) (_ BitVec 32) V!13991 V!13991 (_ BitVec 32) Int) ListLongMap!5485)

(assert (=> b!391756 (= lt!184985 (getCurrentListMapNoExtraKeys!980 lt!184980 lt!184987 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!391756 (= lt!184987 (array!23236 (store (arr!11079 _values!506) i!548 (ValueCellFull!4489 v!373)) (size!11431 _values!506)))))

(assert (=> b!391756 (= lt!184992 (getCurrentListMapNoExtraKeys!980 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!391757 () Bool)

(declare-fun res!224306 () Bool)

(assert (=> b!391757 (=> (not res!224306) (not e!237259))))

(assert (=> b!391757 (= res!224306 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11430 _keys!658))))))

(declare-fun b!391758 () Bool)

(declare-fun e!237261 () Bool)

(assert (=> b!391758 (= e!237260 e!237261)))

(declare-fun res!224299 () Bool)

(assert (=> b!391758 (=> res!224299 e!237261)))

(assert (=> b!391758 (= res!224299 (= k!778 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!184984 () ListLongMap!5485)

(assert (=> b!391758 (= lt!184986 lt!184984)))

(declare-fun lt!184991 () tuple2!6572)

(assert (=> b!391758 (= lt!184984 (+!1053 lt!184981 lt!184991))))

(declare-fun lt!184990 () ListLongMap!5485)

(assert (=> b!391758 (= lt!184988 lt!184990)))

(assert (=> b!391758 (= lt!184990 (+!1053 lt!184992 lt!184991))))

(assert (=> b!391758 (= lt!184986 (+!1053 lt!184985 lt!184991))))

(assert (=> b!391758 (= lt!184991 (tuple2!6573 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!391759 () Bool)

(declare-fun e!237256 () Bool)

(assert (=> b!391759 (= e!237256 tp_is_empty!9665)))

(declare-fun b!391760 () Bool)

(declare-fun res!224305 () Bool)

(assert (=> b!391760 (=> (not res!224305) (not e!237259))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23233 (_ BitVec 32)) Bool)

(assert (=> b!391760 (= res!224305 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun mapIsEmpty!16083 () Bool)

(declare-fun mapRes!16083 () Bool)

(assert (=> mapIsEmpty!16083 mapRes!16083))

(declare-fun b!391761 () Bool)

(declare-fun e!237257 () Bool)

(assert (=> b!391761 (= e!237257 tp_is_empty!9665)))

(declare-fun b!391762 () Bool)

(declare-fun res!224298 () Bool)

(assert (=> b!391762 (=> (not res!224298) (not e!237259))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!391762 (= res!224298 (validKeyInArray!0 k!778))))

(declare-fun b!391763 () Bool)

(assert (=> b!391763 (= e!237254 (and e!237256 mapRes!16083))))

(declare-fun condMapEmpty!16083 () Bool)

(declare-fun mapDefault!16083 () ValueCell!4489)

