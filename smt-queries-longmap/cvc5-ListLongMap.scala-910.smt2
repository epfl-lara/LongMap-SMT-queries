; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20556 () Bool)

(assert start!20556)

(declare-fun b_free!5215 () Bool)

(declare-fun b_next!5215 () Bool)

(assert (=> start!20556 (= b_free!5215 (not b_next!5215))))

(declare-fun tp!18677 () Bool)

(declare-fun b_and!11961 () Bool)

(assert (=> start!20556 (= tp!18677 b_and!11961)))

(declare-fun b!204516 () Bool)

(declare-fun e!133808 () Bool)

(declare-fun e!133806 () Bool)

(assert (=> b!204516 (= e!133808 (not e!133806))))

(declare-fun res!98567 () Bool)

(assert (=> b!204516 (=> res!98567 e!133806)))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!204516 (= res!98567 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!6409 0))(
  ( (V!6410 (val!2580 Int)) )
))
(declare-datatypes ((tuple2!3912 0))(
  ( (tuple2!3913 (_1!1967 (_ BitVec 64)) (_2!1967 V!6409)) )
))
(declare-datatypes ((List!2811 0))(
  ( (Nil!2808) (Cons!2807 (h!3449 tuple2!3912) (t!7742 List!2811)) )
))
(declare-datatypes ((ListLongMap!2825 0))(
  ( (ListLongMap!2826 (toList!1428 List!2811)) )
))
(declare-fun lt!103656 () ListLongMap!2825)

(declare-datatypes ((ValueCell!2192 0))(
  ( (ValueCellFull!2192 (v!4550 V!6409)) (EmptyCell!2192) )
))
(declare-datatypes ((array!9359 0))(
  ( (array!9360 (arr!4430 (Array (_ BitVec 32) ValueCell!2192)) (size!4755 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9359)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun zeroValue!615 () V!6409)

(declare-datatypes ((array!9361 0))(
  ( (array!9362 (arr!4431 (Array (_ BitVec 32) (_ BitVec 64))) (size!4756 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9361)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6409)

(declare-fun getCurrentListMap!1001 (array!9361 array!9359 (_ BitVec 32) (_ BitVec 32) V!6409 V!6409 (_ BitVec 32) Int) ListLongMap!2825)

(assert (=> b!204516 (= lt!103656 (getCurrentListMap!1001 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!103651 () ListLongMap!2825)

(declare-fun lt!103648 () array!9359)

(assert (=> b!204516 (= lt!103651 (getCurrentListMap!1001 _keys!825 lt!103648 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!103650 () ListLongMap!2825)

(declare-fun lt!103655 () ListLongMap!2825)

(assert (=> b!204516 (and (= lt!103650 lt!103655) (= lt!103655 lt!103650))))

(declare-fun lt!103658 () ListLongMap!2825)

(declare-fun lt!103652 () tuple2!3912)

(declare-fun +!455 (ListLongMap!2825 tuple2!3912) ListLongMap!2825)

(assert (=> b!204516 (= lt!103655 (+!455 lt!103658 lt!103652))))

(declare-fun k!843 () (_ BitVec 64))

(declare-fun v!520 () V!6409)

(assert (=> b!204516 (= lt!103652 (tuple2!3913 k!843 v!520))))

(declare-fun i!601 () (_ BitVec 32))

(declare-datatypes ((Unit!6202 0))(
  ( (Unit!6203) )
))
(declare-fun lt!103653 () Unit!6202)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!114 (array!9361 array!9359 (_ BitVec 32) (_ BitVec 32) V!6409 V!6409 (_ BitVec 32) (_ BitVec 64) V!6409 (_ BitVec 32) Int) Unit!6202)

(assert (=> b!204516 (= lt!103653 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!114 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!375 (array!9361 array!9359 (_ BitVec 32) (_ BitVec 32) V!6409 V!6409 (_ BitVec 32) Int) ListLongMap!2825)

(assert (=> b!204516 (= lt!103650 (getCurrentListMapNoExtraKeys!375 _keys!825 lt!103648 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!204516 (= lt!103648 (array!9360 (store (arr!4430 _values!649) i!601 (ValueCellFull!2192 v!520)) (size!4755 _values!649)))))

(assert (=> b!204516 (= lt!103658 (getCurrentListMapNoExtraKeys!375 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun mapIsEmpty!8675 () Bool)

(declare-fun mapRes!8675 () Bool)

(assert (=> mapIsEmpty!8675 mapRes!8675))

(declare-fun b!204517 () Bool)

(declare-fun res!98571 () Bool)

(assert (=> b!204517 (=> (not res!98571) (not e!133808))))

(assert (=> b!204517 (= res!98571 (= (select (arr!4431 _keys!825) i!601) k!843))))

(declare-fun b!204518 () Bool)

(declare-fun e!133805 () Bool)

(assert (=> b!204518 (= e!133805 true)))

(declare-fun lt!103657 () ListLongMap!2825)

(declare-fun lt!103649 () ListLongMap!2825)

(assert (=> b!204518 (= lt!103657 (+!455 lt!103649 lt!103652))))

(declare-fun lt!103654 () Unit!6202)

(declare-fun addCommutativeForDiffKeys!161 (ListLongMap!2825 (_ BitVec 64) V!6409 (_ BitVec 64) V!6409) Unit!6202)

(assert (=> b!204518 (= lt!103654 (addCommutativeForDiffKeys!161 lt!103658 k!843 v!520 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!204519 () Bool)

(declare-fun res!98564 () Bool)

(assert (=> b!204519 (=> (not res!98564) (not e!133808))))

(assert (=> b!204519 (= res!98564 (and (= (size!4755 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4756 _keys!825) (size!4755 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!204520 () Bool)

(declare-fun e!133807 () Bool)

(declare-fun tp_is_empty!5071 () Bool)

(assert (=> b!204520 (= e!133807 tp_is_empty!5071)))

(declare-fun b!204521 () Bool)

(assert (=> b!204521 (= e!133806 e!133805)))

(declare-fun res!98569 () Bool)

(assert (=> b!204521 (=> res!98569 e!133805)))

(assert (=> b!204521 (= res!98569 (= k!843 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!204521 (= lt!103656 lt!103649)))

(declare-fun lt!103659 () tuple2!3912)

(assert (=> b!204521 (= lt!103649 (+!455 lt!103658 lt!103659))))

(assert (=> b!204521 (= lt!103651 lt!103657)))

(assert (=> b!204521 (= lt!103657 (+!455 lt!103655 lt!103659))))

(assert (=> b!204521 (= lt!103651 (+!455 lt!103650 lt!103659))))

(assert (=> b!204521 (= lt!103659 (tuple2!3913 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!204522 () Bool)

(declare-fun res!98566 () Bool)

(assert (=> b!204522 (=> (not res!98566) (not e!133808))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9361 (_ BitVec 32)) Bool)

(assert (=> b!204522 (= res!98566 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!204523 () Bool)

(declare-fun res!98572 () Bool)

(assert (=> b!204523 (=> (not res!98572) (not e!133808))))

(assert (=> b!204523 (= res!98572 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4756 _keys!825))))))

(declare-fun b!204524 () Bool)

(declare-fun e!133809 () Bool)

(assert (=> b!204524 (= e!133809 (and e!133807 mapRes!8675))))

(declare-fun condMapEmpty!8675 () Bool)

(declare-fun mapDefault!8675 () ValueCell!2192)

