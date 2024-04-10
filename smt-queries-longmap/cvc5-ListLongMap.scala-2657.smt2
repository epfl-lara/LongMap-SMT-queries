; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39760 () Bool)

(assert start!39760)

(declare-fun b_free!10027 () Bool)

(declare-fun b_next!10027 () Bool)

(assert (=> start!39760 (= b_free!10027 (not b_next!10027))))

(declare-fun tp!35610 () Bool)

(declare-fun b_and!17713 () Bool)

(assert (=> start!39760 (= tp!35610 b_and!17713)))

(declare-fun b!428150 () Bool)

(declare-fun res!251276 () Bool)

(declare-fun e!253767 () Bool)

(assert (=> b!428150 (=> (not res!251276) (not e!253767))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!26195 0))(
  ( (array!26196 (arr!12547 (Array (_ BitVec 32) (_ BitVec 64))) (size!12899 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26195)

(assert (=> b!428150 (= res!251276 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12899 _keys!709))))))

(declare-fun b!428151 () Bool)

(declare-fun res!251279 () Bool)

(assert (=> b!428151 (=> (not res!251279) (not e!253767))))

(declare-datatypes ((List!7425 0))(
  ( (Nil!7422) (Cons!7421 (h!8277 (_ BitVec 64)) (t!12901 List!7425)) )
))
(declare-fun arrayNoDuplicates!0 (array!26195 (_ BitVec 32) List!7425) Bool)

(assert (=> b!428151 (= res!251279 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7422))))

(declare-fun b!428152 () Bool)

(declare-fun res!251286 () Bool)

(assert (=> b!428152 (=> (not res!251286) (not e!253767))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!26195 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!428152 (= res!251286 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!428153 () Bool)

(declare-fun e!253772 () Bool)

(declare-fun e!253769 () Bool)

(assert (=> b!428153 (= e!253772 e!253769)))

(declare-fun res!251284 () Bool)

(assert (=> b!428153 (=> (not res!251284) (not e!253769))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!428153 (= res!251284 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-datatypes ((V!16011 0))(
  ( (V!16012 (val!5634 Int)) )
))
(declare-datatypes ((tuple2!7412 0))(
  ( (tuple2!7413 (_1!3717 (_ BitVec 64)) (_2!3717 V!16011)) )
))
(declare-datatypes ((List!7426 0))(
  ( (Nil!7423) (Cons!7422 (h!8278 tuple2!7412) (t!12902 List!7426)) )
))
(declare-datatypes ((ListLongMap!6325 0))(
  ( (ListLongMap!6326 (toList!3178 List!7426)) )
))
(declare-fun lt!195611 () ListLongMap!6325)

(declare-fun minValue!515 () V!16011)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!16011)

(declare-fun lt!195610 () array!26195)

(declare-datatypes ((ValueCell!5246 0))(
  ( (ValueCellFull!5246 (v!7881 V!16011)) (EmptyCell!5246) )
))
(declare-datatypes ((array!26197 0))(
  ( (array!26198 (arr!12548 (Array (_ BitVec 32) ValueCell!5246)) (size!12900 (_ BitVec 32))) )
))
(declare-fun lt!195615 () array!26197)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1380 (array!26195 array!26197 (_ BitVec 32) (_ BitVec 32) V!16011 V!16011 (_ BitVec 32) Int) ListLongMap!6325)

(assert (=> b!428153 (= lt!195611 (getCurrentListMapNoExtraKeys!1380 lt!195610 lt!195615 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun _values!549 () array!26197)

(declare-fun v!412 () V!16011)

(assert (=> b!428153 (= lt!195615 (array!26198 (store (arr!12548 _values!549) i!563 (ValueCellFull!5246 v!412)) (size!12900 _values!549)))))

(declare-fun lt!195616 () ListLongMap!6325)

(assert (=> b!428153 (= lt!195616 (getCurrentListMapNoExtraKeys!1380 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun mapNonEmpty!18390 () Bool)

(declare-fun mapRes!18390 () Bool)

(declare-fun tp!35609 () Bool)

(declare-fun e!253768 () Bool)

(assert (=> mapNonEmpty!18390 (= mapRes!18390 (and tp!35609 e!253768))))

(declare-fun mapKey!18390 () (_ BitVec 32))

(declare-fun mapValue!18390 () ValueCell!5246)

(declare-fun mapRest!18390 () (Array (_ BitVec 32) ValueCell!5246))

(assert (=> mapNonEmpty!18390 (= (arr!12548 _values!549) (store mapRest!18390 mapKey!18390 mapValue!18390))))

(declare-fun b!428154 () Bool)

(declare-fun e!253766 () Bool)

(assert (=> b!428154 (= e!253769 (not e!253766))))

(declare-fun res!251280 () Bool)

(assert (=> b!428154 (=> res!251280 e!253766)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!428154 (= res!251280 (not (validKeyInArray!0 (select (arr!12547 _keys!709) from!863))))))

(declare-fun lt!195614 () ListLongMap!6325)

(declare-fun lt!195617 () ListLongMap!6325)

(assert (=> b!428154 (= lt!195614 lt!195617)))

(declare-fun lt!195612 () ListLongMap!6325)

(declare-fun +!1332 (ListLongMap!6325 tuple2!7412) ListLongMap!6325)

(assert (=> b!428154 (= lt!195617 (+!1332 lt!195612 (tuple2!7413 k!794 v!412)))))

(assert (=> b!428154 (= lt!195614 (getCurrentListMapNoExtraKeys!1380 lt!195610 lt!195615 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> b!428154 (= lt!195612 (getCurrentListMapNoExtraKeys!1380 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-datatypes ((Unit!12560 0))(
  ( (Unit!12561) )
))
(declare-fun lt!195613 () Unit!12560)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!524 (array!26195 array!26197 (_ BitVec 32) (_ BitVec 32) V!16011 V!16011 (_ BitVec 32) (_ BitVec 64) V!16011 (_ BitVec 32) Int) Unit!12560)

(assert (=> b!428154 (= lt!195613 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!524 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!428155 () Bool)

(declare-fun res!251282 () Bool)

(assert (=> b!428155 (=> (not res!251282) (not e!253767))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!428155 (= res!251282 (validMask!0 mask!1025))))

(declare-fun b!428156 () Bool)

(declare-fun e!253771 () Bool)

(declare-fun e!253773 () Bool)

(assert (=> b!428156 (= e!253771 (and e!253773 mapRes!18390))))

(declare-fun condMapEmpty!18390 () Bool)

(declare-fun mapDefault!18390 () ValueCell!5246)

