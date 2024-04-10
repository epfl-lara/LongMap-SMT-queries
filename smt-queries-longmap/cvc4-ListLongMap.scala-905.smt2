; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20530 () Bool)

(assert start!20530)

(declare-fun b_free!5189 () Bool)

(declare-fun b_next!5189 () Bool)

(assert (=> start!20530 (= b_free!5189 (not b_next!5189))))

(declare-fun tp!18599 () Bool)

(declare-fun b_and!11935 () Bool)

(assert (=> start!20530 (= tp!18599 b_and!11935)))

(declare-fun mapNonEmpty!8636 () Bool)

(declare-fun mapRes!8636 () Bool)

(declare-fun tp!18598 () Bool)

(declare-fun e!133536 () Bool)

(assert (=> mapNonEmpty!8636 (= mapRes!8636 (and tp!18598 e!133536))))

(declare-datatypes ((V!6373 0))(
  ( (V!6374 (val!2567 Int)) )
))
(declare-datatypes ((ValueCell!2179 0))(
  ( (ValueCellFull!2179 (v!4537 V!6373)) (EmptyCell!2179) )
))
(declare-fun mapRest!8636 () (Array (_ BitVec 32) ValueCell!2179))

(declare-fun mapValue!8636 () ValueCell!2179)

(declare-datatypes ((array!9309 0))(
  ( (array!9310 (arr!4405 (Array (_ BitVec 32) ValueCell!2179)) (size!4730 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9309)

(declare-fun mapKey!8636 () (_ BitVec 32))

(assert (=> mapNonEmpty!8636 (= (arr!4405 _values!649) (store mapRest!8636 mapKey!8636 mapValue!8636))))

(declare-fun b!204039 () Bool)

(declare-fun res!98204 () Bool)

(declare-fun e!133533 () Bool)

(assert (=> b!204039 (=> (not res!98204) (not e!133533))))

(declare-datatypes ((array!9311 0))(
  ( (array!9312 (arr!4406 (Array (_ BitVec 32) (_ BitVec 64))) (size!4731 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9311)

(declare-datatypes ((List!2794 0))(
  ( (Nil!2791) (Cons!2790 (h!3432 (_ BitVec 64)) (t!7725 List!2794)) )
))
(declare-fun arrayNoDuplicates!0 (array!9311 (_ BitVec 32) List!2794) Bool)

(assert (=> b!204039 (= res!98204 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2791))))

(declare-fun b!204040 () Bool)

(declare-fun e!133537 () Bool)

(assert (=> b!204040 (= e!133537 true)))

(declare-datatypes ((tuple2!3894 0))(
  ( (tuple2!3895 (_1!1958 (_ BitVec 64)) (_2!1958 V!6373)) )
))
(declare-datatypes ((List!2795 0))(
  ( (Nil!2792) (Cons!2791 (h!3433 tuple2!3894) (t!7726 List!2795)) )
))
(declare-datatypes ((ListLongMap!2807 0))(
  ( (ListLongMap!2808 (toList!1419 List!2795)) )
))
(declare-fun lt!103217 () ListLongMap!2807)

(declare-fun lt!103227 () ListLongMap!2807)

(declare-fun lt!103226 () tuple2!3894)

(declare-fun +!446 (ListLongMap!2807 tuple2!3894) ListLongMap!2807)

(assert (=> b!204040 (= lt!103217 (+!446 lt!103227 lt!103226))))

(declare-fun lt!103216 () ListLongMap!2807)

(declare-fun v!520 () V!6373)

(declare-datatypes ((Unit!6186 0))(
  ( (Unit!6187) )
))
(declare-fun lt!103220 () Unit!6186)

(declare-fun k!843 () (_ BitVec 64))

(declare-fun zeroValue!615 () V!6373)

(declare-fun addCommutativeForDiffKeys!156 (ListLongMap!2807 (_ BitVec 64) V!6373 (_ BitVec 64) V!6373) Unit!6186)

(assert (=> b!204040 (= lt!103220 (addCommutativeForDiffKeys!156 lt!103216 k!843 v!520 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun b!204041 () Bool)

(declare-fun res!98212 () Bool)

(assert (=> b!204041 (=> (not res!98212) (not e!133533))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!204041 (= res!98212 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4731 _keys!825))))))

(declare-fun mapIsEmpty!8636 () Bool)

(assert (=> mapIsEmpty!8636 mapRes!8636))

(declare-fun b!204042 () Bool)

(declare-fun res!98206 () Bool)

(assert (=> b!204042 (=> (not res!98206) (not e!133533))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!204042 (= res!98206 (validKeyInArray!0 k!843))))

(declare-fun b!204043 () Bool)

(declare-fun res!98205 () Bool)

(assert (=> b!204043 (=> (not res!98205) (not e!133533))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun mask!1149 () (_ BitVec 32))

(assert (=> b!204043 (= res!98205 (and (= (size!4730 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4731 _keys!825) (size!4730 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!204044 () Bool)

(declare-fun e!133535 () Bool)

(assert (=> b!204044 (= e!133535 e!133537)))

(declare-fun res!98210 () Bool)

(assert (=> b!204044 (=> res!98210 e!133537)))

(assert (=> b!204044 (= res!98210 (= k!843 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!103225 () ListLongMap!2807)

(assert (=> b!204044 (= lt!103225 lt!103217)))

(declare-fun lt!103219 () ListLongMap!2807)

(declare-fun lt!103224 () tuple2!3894)

(assert (=> b!204044 (= lt!103217 (+!446 lt!103219 lt!103224))))

(declare-fun lt!103223 () ListLongMap!2807)

(assert (=> b!204044 (= lt!103223 lt!103227)))

(assert (=> b!204044 (= lt!103227 (+!446 lt!103216 lt!103224))))

(declare-fun lt!103221 () ListLongMap!2807)

(assert (=> b!204044 (= lt!103225 (+!446 lt!103221 lt!103224))))

(assert (=> b!204044 (= lt!103224 (tuple2!3895 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun b!204045 () Bool)

(assert (=> b!204045 (= e!133533 (not e!133535))))

(declare-fun res!98209 () Bool)

(assert (=> b!204045 (=> res!98209 e!133535)))

(assert (=> b!204045 (= res!98209 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6373)

(declare-fun getCurrentListMap!993 (array!9311 array!9309 (_ BitVec 32) (_ BitVec 32) V!6373 V!6373 (_ BitVec 32) Int) ListLongMap!2807)

(assert (=> b!204045 (= lt!103223 (getCurrentListMap!993 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!103218 () array!9309)

(assert (=> b!204045 (= lt!103225 (getCurrentListMap!993 _keys!825 lt!103218 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!204045 (and (= lt!103221 lt!103219) (= lt!103219 lt!103221))))

(assert (=> b!204045 (= lt!103219 (+!446 lt!103216 lt!103226))))

(assert (=> b!204045 (= lt!103226 (tuple2!3895 k!843 v!520))))

(declare-fun lt!103222 () Unit!6186)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!106 (array!9311 array!9309 (_ BitVec 32) (_ BitVec 32) V!6373 V!6373 (_ BitVec 32) (_ BitVec 64) V!6373 (_ BitVec 32) Int) Unit!6186)

(assert (=> b!204045 (= lt!103222 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!106 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!367 (array!9311 array!9309 (_ BitVec 32) (_ BitVec 32) V!6373 V!6373 (_ BitVec 32) Int) ListLongMap!2807)

(assert (=> b!204045 (= lt!103221 (getCurrentListMapNoExtraKeys!367 _keys!825 lt!103218 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!204045 (= lt!103218 (array!9310 (store (arr!4405 _values!649) i!601 (ValueCellFull!2179 v!520)) (size!4730 _values!649)))))

(assert (=> b!204045 (= lt!103216 (getCurrentListMapNoExtraKeys!367 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!204046 () Bool)

(declare-fun e!133532 () Bool)

(declare-fun e!133534 () Bool)

(assert (=> b!204046 (= e!133532 (and e!133534 mapRes!8636))))

(declare-fun condMapEmpty!8636 () Bool)

(declare-fun mapDefault!8636 () ValueCell!2179)

