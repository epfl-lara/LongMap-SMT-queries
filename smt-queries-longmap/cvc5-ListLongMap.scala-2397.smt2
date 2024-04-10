; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37934 () Bool)

(assert start!37934)

(declare-fun b_free!8947 () Bool)

(declare-fun b_next!8947 () Bool)

(assert (=> start!37934 (= b_free!8947 (not b_next!8947))))

(declare-fun tp!31604 () Bool)

(declare-fun b_and!16237 () Bool)

(assert (=> start!37934 (= tp!31604 b_and!16237)))

(declare-fun b!390117 () Bool)

(declare-fun e!236334 () Bool)

(declare-fun e!236329 () Bool)

(assert (=> b!390117 (= e!236334 (not e!236329))))

(declare-fun res!223212 () Bool)

(assert (=> b!390117 (=> res!223212 e!236329)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!390117 (= res!223212 (or (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!13931 0))(
  ( (V!13932 (val!4854 Int)) )
))
(declare-datatypes ((ValueCell!4466 0))(
  ( (ValueCellFull!4466 (v!7067 V!13931)) (EmptyCell!4466) )
))
(declare-datatypes ((array!23135 0))(
  ( (array!23136 (arr!11032 (Array (_ BitVec 32) ValueCell!4466)) (size!11384 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!23135)

(declare-datatypes ((tuple2!6530 0))(
  ( (tuple2!6531 (_1!3276 (_ BitVec 64)) (_2!3276 V!13931)) )
))
(declare-datatypes ((List!6384 0))(
  ( (Nil!6381) (Cons!6380 (h!7236 tuple2!6530) (t!11542 List!6384)) )
))
(declare-datatypes ((ListLongMap!5443 0))(
  ( (ListLongMap!5444 (toList!2737 List!6384)) )
))
(declare-fun lt!183764 () ListLongMap!5443)

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13931)

(declare-datatypes ((array!23137 0))(
  ( (array!23138 (arr!11033 (Array (_ BitVec 32) (_ BitVec 64))) (size!11385 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!23137)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun minValue!472 () V!13931)

(declare-fun getCurrentListMap!2085 (array!23137 array!23135 (_ BitVec 32) (_ BitVec 32) V!13931 V!13931 (_ BitVec 32) Int) ListLongMap!5443)

(assert (=> b!390117 (= lt!183764 (getCurrentListMap!2085 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!183756 () ListLongMap!5443)

(declare-fun lt!183767 () array!23137)

(declare-fun lt!183770 () array!23135)

(assert (=> b!390117 (= lt!183756 (getCurrentListMap!2085 lt!183767 lt!183770 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!183755 () ListLongMap!5443)

(declare-fun lt!183759 () ListLongMap!5443)

(assert (=> b!390117 (and (= lt!183755 lt!183759) (= lt!183759 lt!183755))))

(declare-fun lt!183757 () ListLongMap!5443)

(declare-fun lt!183763 () tuple2!6530)

(declare-fun +!1032 (ListLongMap!5443 tuple2!6530) ListLongMap!5443)

(assert (=> b!390117 (= lt!183759 (+!1032 lt!183757 lt!183763))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun v!373 () V!13931)

(assert (=> b!390117 (= lt!183763 (tuple2!6531 k!778 v!373))))

(declare-datatypes ((Unit!11946 0))(
  ( (Unit!11947) )
))
(declare-fun lt!183760 () Unit!11946)

(declare-fun i!548 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!249 (array!23137 array!23135 (_ BitVec 32) (_ BitVec 32) V!13931 V!13931 (_ BitVec 32) (_ BitVec 64) V!13931 (_ BitVec 32) Int) Unit!11946)

(assert (=> b!390117 (= lt!183760 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!249 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!965 (array!23137 array!23135 (_ BitVec 32) (_ BitVec 32) V!13931 V!13931 (_ BitVec 32) Int) ListLongMap!5443)

(assert (=> b!390117 (= lt!183755 (getCurrentListMapNoExtraKeys!965 lt!183767 lt!183770 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!390117 (= lt!183770 (array!23136 (store (arr!11032 _values!506) i!548 (ValueCellFull!4466 v!373)) (size!11384 _values!506)))))

(assert (=> b!390117 (= lt!183757 (getCurrentListMapNoExtraKeys!965 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!390118 () Bool)

(declare-fun res!223208 () Bool)

(declare-fun e!236330 () Bool)

(assert (=> b!390118 (=> (not res!223208) (not e!236330))))

(assert (=> b!390118 (= res!223208 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11385 _keys!658))))))

(declare-fun b!390120 () Bool)

(declare-fun res!223216 () Bool)

(assert (=> b!390120 (=> (not res!223216) (not e!236330))))

(assert (=> b!390120 (= res!223216 (or (= (select (arr!11033 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11033 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!390121 () Bool)

(declare-fun e!236331 () Bool)

(declare-fun tp_is_empty!9619 () Bool)

(assert (=> b!390121 (= e!236331 tp_is_empty!9619)))

(declare-fun b!390122 () Bool)

(declare-fun res!223215 () Bool)

(assert (=> b!390122 (=> (not res!223215) (not e!236330))))

(declare-datatypes ((List!6385 0))(
  ( (Nil!6382) (Cons!6381 (h!7237 (_ BitVec 64)) (t!11543 List!6385)) )
))
(declare-fun arrayNoDuplicates!0 (array!23137 (_ BitVec 32) List!6385) Bool)

(assert (=> b!390122 (= res!223215 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6382))))

(declare-fun mapNonEmpty!16005 () Bool)

(declare-fun mapRes!16005 () Bool)

(declare-fun tp!31605 () Bool)

(assert (=> mapNonEmpty!16005 (= mapRes!16005 (and tp!31605 e!236331))))

(declare-fun mapValue!16005 () ValueCell!4466)

(declare-fun mapKey!16005 () (_ BitVec 32))

(declare-fun mapRest!16005 () (Array (_ BitVec 32) ValueCell!4466))

(assert (=> mapNonEmpty!16005 (= (arr!11032 _values!506) (store mapRest!16005 mapKey!16005 mapValue!16005))))

(declare-fun b!390123 () Bool)

(declare-fun e!236332 () Bool)

(assert (=> b!390123 (= e!236329 e!236332)))

(declare-fun res!223207 () Bool)

(assert (=> b!390123 (=> res!223207 e!236332)))

(assert (=> b!390123 (= res!223207 (= k!778 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!183758 () ListLongMap!5443)

(declare-fun lt!183766 () ListLongMap!5443)

(assert (=> b!390123 (= lt!183758 lt!183766)))

(declare-fun lt!183765 () ListLongMap!5443)

(assert (=> b!390123 (= lt!183766 (+!1032 lt!183765 lt!183763))))

(declare-fun lt!183762 () Unit!11946)

(declare-fun addCommutativeForDiffKeys!335 (ListLongMap!5443 (_ BitVec 64) V!13931 (_ BitVec 64) V!13931) Unit!11946)

(assert (=> b!390123 (= lt!183762 (addCommutativeForDiffKeys!335 lt!183757 k!778 v!373 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun lt!183769 () tuple2!6530)

(assert (=> b!390123 (= lt!183756 (+!1032 lt!183758 lt!183769))))

(declare-fun lt!183761 () tuple2!6530)

(assert (=> b!390123 (= lt!183758 (+!1032 lt!183759 lt!183761))))

(declare-fun lt!183771 () ListLongMap!5443)

(assert (=> b!390123 (= lt!183764 lt!183771)))

(assert (=> b!390123 (= lt!183771 (+!1032 lt!183765 lt!183769))))

(assert (=> b!390123 (= lt!183765 (+!1032 lt!183757 lt!183761))))

(assert (=> b!390123 (= lt!183756 (+!1032 (+!1032 lt!183755 lt!183761) lt!183769))))

(assert (=> b!390123 (= lt!183769 (tuple2!6531 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(assert (=> b!390123 (= lt!183761 (tuple2!6531 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!390124 () Bool)

(declare-fun res!223213 () Bool)

(assert (=> b!390124 (=> (not res!223213) (not e!236330))))

(declare-fun arrayContainsKey!0 (array!23137 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!390124 (= res!223213 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!390125 () Bool)

(declare-fun res!223206 () Bool)

(assert (=> b!390125 (=> (not res!223206) (not e!236330))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23137 (_ BitVec 32)) Bool)

(assert (=> b!390125 (= res!223206 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!390126 () Bool)

(assert (=> b!390126 (= e!236332 (= (+!1032 lt!183764 lt!183763) lt!183756))))

(assert (=> b!390126 (= (+!1032 lt!183766 lt!183769) (+!1032 lt!183771 lt!183763))))

(declare-fun lt!183768 () Unit!11946)

(assert (=> b!390126 (= lt!183768 (addCommutativeForDiffKeys!335 lt!183765 k!778 v!373 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun mapIsEmpty!16005 () Bool)

(assert (=> mapIsEmpty!16005 mapRes!16005))

(declare-fun b!390127 () Bool)

(declare-fun res!223210 () Bool)

(assert (=> b!390127 (=> (not res!223210) (not e!236334))))

(assert (=> b!390127 (= res!223210 (arrayNoDuplicates!0 lt!183767 #b00000000000000000000000000000000 Nil!6382))))

(declare-fun res!223209 () Bool)

(assert (=> start!37934 (=> (not res!223209) (not e!236330))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37934 (= res!223209 (validMask!0 mask!970))))

(assert (=> start!37934 e!236330))

(declare-fun e!236328 () Bool)

(declare-fun array_inv!8106 (array!23135) Bool)

(assert (=> start!37934 (and (array_inv!8106 _values!506) e!236328)))

(assert (=> start!37934 tp!31604))

(assert (=> start!37934 true))

(assert (=> start!37934 tp_is_empty!9619))

(declare-fun array_inv!8107 (array!23137) Bool)

(assert (=> start!37934 (array_inv!8107 _keys!658)))

(declare-fun b!390119 () Bool)

(declare-fun e!236333 () Bool)

(assert (=> b!390119 (= e!236333 tp_is_empty!9619)))

(declare-fun b!390128 () Bool)

(assert (=> b!390128 (= e!236328 (and e!236333 mapRes!16005))))

(declare-fun condMapEmpty!16005 () Bool)

(declare-fun mapDefault!16005 () ValueCell!4466)

