; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20254 () Bool)

(assert start!20254)

(declare-fun b_free!4913 () Bool)

(declare-fun b_next!4913 () Bool)

(assert (=> start!20254 (= b_free!4913 (not b_next!4913))))

(declare-fun tp!17770 () Bool)

(declare-fun b_and!11659 () Bool)

(assert (=> start!20254 (= tp!17770 b_and!11659)))

(declare-fun b!199244 () Bool)

(declare-fun res!94657 () Bool)

(declare-fun e!130826 () Bool)

(assert (=> b!199244 (=> (not res!94657) (not e!130826))))

(declare-fun i!601 () (_ BitVec 32))

(declare-datatypes ((array!8779 0))(
  ( (array!8780 (arr!4140 (Array (_ BitVec 32) (_ BitVec 64))) (size!4465 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8779)

(assert (=> b!199244 (= res!94657 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4465 _keys!825))))))

(declare-fun b!199245 () Bool)

(assert (=> b!199245 (= e!130826 (not true))))

(declare-datatypes ((V!6005 0))(
  ( (V!6006 (val!2429 Int)) )
))
(declare-datatypes ((tuple2!3678 0))(
  ( (tuple2!3679 (_1!1850 (_ BitVec 64)) (_2!1850 V!6005)) )
))
(declare-datatypes ((List!2594 0))(
  ( (Nil!2591) (Cons!2590 (h!3232 tuple2!3678) (t!7525 List!2594)) )
))
(declare-datatypes ((ListLongMap!2591 0))(
  ( (ListLongMap!2592 (toList!1311 List!2594)) )
))
(declare-fun lt!98223 () ListLongMap!2591)

(declare-fun lt!98220 () ListLongMap!2591)

(assert (=> b!199245 (and (= lt!98223 lt!98220) (= lt!98220 lt!98223))))

(declare-fun v!520 () V!6005)

(declare-fun k!843 () (_ BitVec 64))

(declare-fun lt!98221 () ListLongMap!2591)

(declare-fun +!338 (ListLongMap!2591 tuple2!3678) ListLongMap!2591)

(assert (=> b!199245 (= lt!98220 (+!338 lt!98221 (tuple2!3679 k!843 v!520)))))

(declare-datatypes ((Unit!5978 0))(
  ( (Unit!5979) )
))
(declare-fun lt!98222 () Unit!5978)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun zeroValue!615 () V!6005)

(declare-fun defaultEntry!657 () Int)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun minValue!615 () V!6005)

(declare-datatypes ((ValueCell!2041 0))(
  ( (ValueCellFull!2041 (v!4399 V!6005)) (EmptyCell!2041) )
))
(declare-datatypes ((array!8781 0))(
  ( (array!8782 (arr!4141 (Array (_ BitVec 32) ValueCell!2041)) (size!4466 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8781)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!15 (array!8779 array!8781 (_ BitVec 32) (_ BitVec 32) V!6005 V!6005 (_ BitVec 32) (_ BitVec 64) V!6005 (_ BitVec 32) Int) Unit!5978)

(assert (=> b!199245 (= lt!98222 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!15 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!276 (array!8779 array!8781 (_ BitVec 32) (_ BitVec 32) V!6005 V!6005 (_ BitVec 32) Int) ListLongMap!2591)

(assert (=> b!199245 (= lt!98223 (getCurrentListMapNoExtraKeys!276 _keys!825 (array!8782 (store (arr!4141 _values!649) i!601 (ValueCellFull!2041 v!520)) (size!4466 _values!649)) mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!199245 (= lt!98221 (getCurrentListMapNoExtraKeys!276 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!199246 () Bool)

(declare-fun res!94656 () Bool)

(assert (=> b!199246 (=> (not res!94656) (not e!130826))))

(assert (=> b!199246 (= res!94656 (and (= (size!4466 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4465 _keys!825) (size!4466 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun res!94655 () Bool)

(assert (=> start!20254 (=> (not res!94655) (not e!130826))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20254 (= res!94655 (validMask!0 mask!1149))))

(assert (=> start!20254 e!130826))

(declare-fun e!130825 () Bool)

(declare-fun array_inv!2715 (array!8781) Bool)

(assert (=> start!20254 (and (array_inv!2715 _values!649) e!130825)))

(assert (=> start!20254 true))

(declare-fun tp_is_empty!4769 () Bool)

(assert (=> start!20254 tp_is_empty!4769))

(declare-fun array_inv!2716 (array!8779) Bool)

(assert (=> start!20254 (array_inv!2716 _keys!825)))

(assert (=> start!20254 tp!17770))

(declare-fun mapNonEmpty!8222 () Bool)

(declare-fun mapRes!8222 () Bool)

(declare-fun tp!17771 () Bool)

(declare-fun e!130829 () Bool)

(assert (=> mapNonEmpty!8222 (= mapRes!8222 (and tp!17771 e!130829))))

(declare-fun mapValue!8222 () ValueCell!2041)

(declare-fun mapKey!8222 () (_ BitVec 32))

(declare-fun mapRest!8222 () (Array (_ BitVec 32) ValueCell!2041))

(assert (=> mapNonEmpty!8222 (= (arr!4141 _values!649) (store mapRest!8222 mapKey!8222 mapValue!8222))))

(declare-fun b!199247 () Bool)

(declare-fun res!94654 () Bool)

(assert (=> b!199247 (=> (not res!94654) (not e!130826))))

(assert (=> b!199247 (= res!94654 (= (select (arr!4140 _keys!825) i!601) k!843))))

(declare-fun b!199248 () Bool)

(assert (=> b!199248 (= e!130829 tp_is_empty!4769)))

(declare-fun b!199249 () Bool)

(declare-fun e!130827 () Bool)

(assert (=> b!199249 (= e!130827 tp_is_empty!4769)))

(declare-fun b!199250 () Bool)

(declare-fun res!94651 () Bool)

(assert (=> b!199250 (=> (not res!94651) (not e!130826))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8779 (_ BitVec 32)) Bool)

(assert (=> b!199250 (= res!94651 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!199251 () Bool)

(declare-fun res!94653 () Bool)

(assert (=> b!199251 (=> (not res!94653) (not e!130826))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!199251 (= res!94653 (validKeyInArray!0 k!843))))

(declare-fun b!199252 () Bool)

(declare-fun res!94652 () Bool)

(assert (=> b!199252 (=> (not res!94652) (not e!130826))))

(declare-datatypes ((List!2595 0))(
  ( (Nil!2592) (Cons!2591 (h!3233 (_ BitVec 64)) (t!7526 List!2595)) )
))
(declare-fun arrayNoDuplicates!0 (array!8779 (_ BitVec 32) List!2595) Bool)

(assert (=> b!199252 (= res!94652 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2592))))

(declare-fun mapIsEmpty!8222 () Bool)

(assert (=> mapIsEmpty!8222 mapRes!8222))

(declare-fun b!199253 () Bool)

(assert (=> b!199253 (= e!130825 (and e!130827 mapRes!8222))))

(declare-fun condMapEmpty!8222 () Bool)

(declare-fun mapDefault!8222 () ValueCell!2041)

