; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20566 () Bool)

(assert start!20566)

(declare-fun b_free!5225 () Bool)

(declare-fun b_next!5225 () Bool)

(assert (=> start!20566 (= b_free!5225 (not b_next!5225))))

(declare-fun tp!18707 () Bool)

(declare-fun b_and!11971 () Bool)

(assert (=> start!20566 (= tp!18707 b_and!11971)))

(declare-fun b!204696 () Bool)

(declare-fun e!133912 () Bool)

(declare-fun e!133913 () Bool)

(assert (=> b!204696 (= e!133912 (not e!133913))))

(declare-fun res!98707 () Bool)

(assert (=> b!204696 (=> res!98707 e!133913)))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!204696 (= res!98707 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!6421 0))(
  ( (V!6422 (val!2585 Int)) )
))
(declare-datatypes ((ValueCell!2197 0))(
  ( (ValueCellFull!2197 (v!4555 V!6421)) (EmptyCell!2197) )
))
(declare-datatypes ((array!9379 0))(
  ( (array!9380 (arr!4440 (Array (_ BitVec 32) ValueCell!2197)) (size!4765 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9379)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-datatypes ((array!9381 0))(
  ( (array!9382 (arr!4441 (Array (_ BitVec 32) (_ BitVec 64))) (size!4766 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9381)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6421)

(declare-datatypes ((tuple2!3920 0))(
  ( (tuple2!3921 (_1!1971 (_ BitVec 64)) (_2!1971 V!6421)) )
))
(declare-datatypes ((List!2818 0))(
  ( (Nil!2815) (Cons!2814 (h!3456 tuple2!3920) (t!7749 List!2818)) )
))
(declare-datatypes ((ListLongMap!2833 0))(
  ( (ListLongMap!2834 (toList!1432 List!2818)) )
))
(declare-fun lt!103838 () ListLongMap!2833)

(declare-fun zeroValue!615 () V!6421)

(declare-fun getCurrentListMap!1005 (array!9381 array!9379 (_ BitVec 32) (_ BitVec 32) V!6421 V!6421 (_ BitVec 32) Int) ListLongMap!2833)

(assert (=> b!204696 (= lt!103838 (getCurrentListMap!1005 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!103836 () array!9379)

(declare-fun lt!103832 () ListLongMap!2833)

(assert (=> b!204696 (= lt!103832 (getCurrentListMap!1005 _keys!825 lt!103836 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!103837 () ListLongMap!2833)

(declare-fun lt!103834 () ListLongMap!2833)

(assert (=> b!204696 (and (= lt!103837 lt!103834) (= lt!103834 lt!103837))))

(declare-fun lt!103835 () ListLongMap!2833)

(declare-fun lt!103829 () tuple2!3920)

(declare-fun +!459 (ListLongMap!2833 tuple2!3920) ListLongMap!2833)

(assert (=> b!204696 (= lt!103834 (+!459 lt!103835 lt!103829))))

(declare-fun k!843 () (_ BitVec 64))

(declare-fun v!520 () V!6421)

(assert (=> b!204696 (= lt!103829 (tuple2!3921 k!843 v!520))))

(declare-datatypes ((Unit!6210 0))(
  ( (Unit!6211) )
))
(declare-fun lt!103828 () Unit!6210)

(declare-fun i!601 () (_ BitVec 32))

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!118 (array!9381 array!9379 (_ BitVec 32) (_ BitVec 32) V!6421 V!6421 (_ BitVec 32) (_ BitVec 64) V!6421 (_ BitVec 32) Int) Unit!6210)

(assert (=> b!204696 (= lt!103828 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!118 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!379 (array!9381 array!9379 (_ BitVec 32) (_ BitVec 32) V!6421 V!6421 (_ BitVec 32) Int) ListLongMap!2833)

(assert (=> b!204696 (= lt!103837 (getCurrentListMapNoExtraKeys!379 _keys!825 lt!103836 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!204696 (= lt!103836 (array!9380 (store (arr!4440 _values!649) i!601 (ValueCellFull!2197 v!520)) (size!4765 _values!649)))))

(assert (=> b!204696 (= lt!103835 (getCurrentListMapNoExtraKeys!379 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!204697 () Bool)

(declare-fun res!98704 () Bool)

(assert (=> b!204697 (=> (not res!98704) (not e!133912))))

(assert (=> b!204697 (= res!98704 (and (= (size!4765 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4766 _keys!825) (size!4765 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!204698 () Bool)

(declare-fun e!133910 () Bool)

(assert (=> b!204698 (= e!133913 e!133910)))

(declare-fun res!98702 () Bool)

(assert (=> b!204698 (=> res!98702 e!133910)))

(assert (=> b!204698 (= res!98702 (= k!843 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!103831 () ListLongMap!2833)

(assert (=> b!204698 (= lt!103838 lt!103831)))

(declare-fun lt!103839 () tuple2!3920)

(assert (=> b!204698 (= lt!103831 (+!459 lt!103835 lt!103839))))

(declare-fun lt!103833 () ListLongMap!2833)

(assert (=> b!204698 (= lt!103832 lt!103833)))

(assert (=> b!204698 (= lt!103833 (+!459 lt!103834 lt!103839))))

(assert (=> b!204698 (= lt!103832 (+!459 lt!103837 lt!103839))))

(assert (=> b!204698 (= lt!103839 (tuple2!3921 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun res!98703 () Bool)

(assert (=> start!20566 (=> (not res!98703) (not e!133912))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20566 (= res!98703 (validMask!0 mask!1149))))

(assert (=> start!20566 e!133912))

(declare-fun e!133911 () Bool)

(declare-fun array_inv!2931 (array!9379) Bool)

(assert (=> start!20566 (and (array_inv!2931 _values!649) e!133911)))

(assert (=> start!20566 true))

(declare-fun tp_is_empty!5081 () Bool)

(assert (=> start!20566 tp_is_empty!5081))

(declare-fun array_inv!2932 (array!9381) Bool)

(assert (=> start!20566 (array_inv!2932 _keys!825)))

(assert (=> start!20566 tp!18707))

(declare-fun b!204699 () Bool)

(assert (=> b!204699 (= e!133910 true)))

(assert (=> b!204699 (= lt!103833 (+!459 lt!103831 lt!103829))))

(declare-fun lt!103830 () Unit!6210)

(declare-fun addCommutativeForDiffKeys!165 (ListLongMap!2833 (_ BitVec 64) V!6421 (_ BitVec 64) V!6421) Unit!6210)

(assert (=> b!204699 (= lt!103830 (addCommutativeForDiffKeys!165 lt!103835 k!843 v!520 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun mapNonEmpty!8690 () Bool)

(declare-fun mapRes!8690 () Bool)

(declare-fun tp!18706 () Bool)

(declare-fun e!133916 () Bool)

(assert (=> mapNonEmpty!8690 (= mapRes!8690 (and tp!18706 e!133916))))

(declare-fun mapKey!8690 () (_ BitVec 32))

(declare-fun mapValue!8690 () ValueCell!2197)

(declare-fun mapRest!8690 () (Array (_ BitVec 32) ValueCell!2197))

(assert (=> mapNonEmpty!8690 (= (arr!4440 _values!649) (store mapRest!8690 mapKey!8690 mapValue!8690))))

(declare-fun mapIsEmpty!8690 () Bool)

(assert (=> mapIsEmpty!8690 mapRes!8690))

(declare-fun b!204700 () Bool)

(declare-fun res!98701 () Bool)

(assert (=> b!204700 (=> (not res!98701) (not e!133912))))

(assert (=> b!204700 (= res!98701 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4766 _keys!825))))))

(declare-fun b!204701 () Bool)

(declare-fun res!98706 () Bool)

(assert (=> b!204701 (=> (not res!98706) (not e!133912))))

(declare-datatypes ((List!2819 0))(
  ( (Nil!2816) (Cons!2815 (h!3457 (_ BitVec 64)) (t!7750 List!2819)) )
))
(declare-fun arrayNoDuplicates!0 (array!9381 (_ BitVec 32) List!2819) Bool)

(assert (=> b!204701 (= res!98706 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2816))))

(declare-fun b!204702 () Bool)

(declare-fun e!133915 () Bool)

(assert (=> b!204702 (= e!133915 tp_is_empty!5081)))

(declare-fun b!204703 () Bool)

(assert (=> b!204703 (= e!133911 (and e!133915 mapRes!8690))))

(declare-fun condMapEmpty!8690 () Bool)

(declare-fun mapDefault!8690 () ValueCell!2197)

