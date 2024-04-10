; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20500 () Bool)

(assert start!20500)

(declare-fun b_free!5159 () Bool)

(declare-fun b_next!5159 () Bool)

(assert (=> start!20500 (= b_free!5159 (not b_next!5159))))

(declare-fun tp!18509 () Bool)

(declare-fun b_and!11905 () Bool)

(assert (=> start!20500 (= tp!18509 b_and!11905)))

(declare-fun b!203499 () Bool)

(declare-fun res!97799 () Bool)

(declare-fun e!133221 () Bool)

(assert (=> b!203499 (=> (not res!97799) (not e!133221))))

(declare-fun k!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!203499 (= res!97799 (validKeyInArray!0 k!843))))

(declare-fun res!97805 () Bool)

(assert (=> start!20500 (=> (not res!97805) (not e!133221))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20500 (= res!97805 (validMask!0 mask!1149))))

(assert (=> start!20500 e!133221))

(declare-datatypes ((V!6333 0))(
  ( (V!6334 (val!2552 Int)) )
))
(declare-datatypes ((ValueCell!2164 0))(
  ( (ValueCellFull!2164 (v!4522 V!6333)) (EmptyCell!2164) )
))
(declare-datatypes ((array!9253 0))(
  ( (array!9254 (arr!4377 (Array (_ BitVec 32) ValueCell!2164)) (size!4702 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9253)

(declare-fun e!133219 () Bool)

(declare-fun array_inv!2893 (array!9253) Bool)

(assert (=> start!20500 (and (array_inv!2893 _values!649) e!133219)))

(assert (=> start!20500 true))

(declare-fun tp_is_empty!5015 () Bool)

(assert (=> start!20500 tp_is_empty!5015))

(declare-datatypes ((array!9255 0))(
  ( (array!9256 (arr!4378 (Array (_ BitVec 32) (_ BitVec 64))) (size!4703 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9255)

(declare-fun array_inv!2894 (array!9255) Bool)

(assert (=> start!20500 (array_inv!2894 _keys!825)))

(assert (=> start!20500 tp!18509))

(declare-fun b!203500 () Bool)

(declare-fun res!97801 () Bool)

(assert (=> b!203500 (=> (not res!97801) (not e!133221))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!203500 (= res!97801 (= (select (arr!4378 _keys!825) i!601) k!843))))

(declare-fun b!203501 () Bool)

(declare-fun e!133222 () Bool)

(assert (=> b!203501 (= e!133221 (not e!133222))))

(declare-fun res!97807 () Bool)

(assert (=> b!203501 (=> res!97807 e!133222)))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!203501 (= res!97807 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!3874 0))(
  ( (tuple2!3875 (_1!1948 (_ BitVec 64)) (_2!1948 V!6333)) )
))
(declare-datatypes ((List!2775 0))(
  ( (Nil!2772) (Cons!2771 (h!3413 tuple2!3874) (t!7706 List!2775)) )
))
(declare-datatypes ((ListLongMap!2787 0))(
  ( (ListLongMap!2788 (toList!1409 List!2775)) )
))
(declare-fun lt!102680 () ListLongMap!2787)

(declare-fun zeroValue!615 () V!6333)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6333)

(declare-fun getCurrentListMap!984 (array!9255 array!9253 (_ BitVec 32) (_ BitVec 32) V!6333 V!6333 (_ BitVec 32) Int) ListLongMap!2787)

(assert (=> b!203501 (= lt!102680 (getCurrentListMap!984 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!102682 () ListLongMap!2787)

(declare-fun lt!102686 () array!9253)

(assert (=> b!203501 (= lt!102682 (getCurrentListMap!984 _keys!825 lt!102686 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!102684 () ListLongMap!2787)

(declare-fun lt!102678 () ListLongMap!2787)

(assert (=> b!203501 (and (= lt!102684 lt!102678) (= lt!102678 lt!102684))))

(declare-fun lt!102685 () ListLongMap!2787)

(declare-fun lt!102676 () tuple2!3874)

(declare-fun +!436 (ListLongMap!2787 tuple2!3874) ListLongMap!2787)

(assert (=> b!203501 (= lt!102678 (+!436 lt!102685 lt!102676))))

(declare-fun v!520 () V!6333)

(assert (=> b!203501 (= lt!102676 (tuple2!3875 k!843 v!520))))

(declare-datatypes ((Unit!6166 0))(
  ( (Unit!6167) )
))
(declare-fun lt!102687 () Unit!6166)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!97 (array!9255 array!9253 (_ BitVec 32) (_ BitVec 32) V!6333 V!6333 (_ BitVec 32) (_ BitVec 64) V!6333 (_ BitVec 32) Int) Unit!6166)

(assert (=> b!203501 (= lt!102687 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!97 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!358 (array!9255 array!9253 (_ BitVec 32) (_ BitVec 32) V!6333 V!6333 (_ BitVec 32) Int) ListLongMap!2787)

(assert (=> b!203501 (= lt!102684 (getCurrentListMapNoExtraKeys!358 _keys!825 lt!102686 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!203501 (= lt!102686 (array!9254 (store (arr!4377 _values!649) i!601 (ValueCellFull!2164 v!520)) (size!4702 _values!649)))))

(assert (=> b!203501 (= lt!102685 (getCurrentListMapNoExtraKeys!358 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun mapIsEmpty!8591 () Bool)

(declare-fun mapRes!8591 () Bool)

(assert (=> mapIsEmpty!8591 mapRes!8591))

(declare-fun b!203502 () Bool)

(declare-fun res!97804 () Bool)

(assert (=> b!203502 (=> (not res!97804) (not e!133221))))

(assert (=> b!203502 (= res!97804 (and (= (size!4702 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4703 _keys!825) (size!4702 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!203503 () Bool)

(declare-fun e!133220 () Bool)

(assert (=> b!203503 (= e!133220 true)))

(declare-fun lt!102683 () ListLongMap!2787)

(declare-fun lt!102679 () ListLongMap!2787)

(assert (=> b!203503 (= lt!102683 (+!436 lt!102679 lt!102676))))

(declare-fun lt!102677 () Unit!6166)

(declare-fun addCommutativeForDiffKeys!148 (ListLongMap!2787 (_ BitVec 64) V!6333 (_ BitVec 64) V!6333) Unit!6166)

(assert (=> b!203503 (= lt!102677 (addCommutativeForDiffKeys!148 lt!102685 k!843 v!520 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun b!203504 () Bool)

(declare-fun e!133217 () Bool)

(assert (=> b!203504 (= e!133217 tp_is_empty!5015)))

(declare-fun b!203505 () Bool)

(declare-fun res!97802 () Bool)

(assert (=> b!203505 (=> (not res!97802) (not e!133221))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9255 (_ BitVec 32)) Bool)

(assert (=> b!203505 (= res!97802 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!203506 () Bool)

(declare-fun res!97806 () Bool)

(assert (=> b!203506 (=> (not res!97806) (not e!133221))))

(assert (=> b!203506 (= res!97806 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4703 _keys!825))))))

(declare-fun b!203507 () Bool)

(declare-fun e!133223 () Bool)

(assert (=> b!203507 (= e!133223 tp_is_empty!5015)))

(declare-fun b!203508 () Bool)

(assert (=> b!203508 (= e!133222 e!133220)))

(declare-fun res!97803 () Bool)

(assert (=> b!203508 (=> res!97803 e!133220)))

(assert (=> b!203508 (= res!97803 (= k!843 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!203508 (= lt!102682 lt!102683)))

(declare-fun lt!102681 () tuple2!3874)

(assert (=> b!203508 (= lt!102683 (+!436 lt!102678 lt!102681))))

(assert (=> b!203508 (= lt!102680 lt!102679)))

(assert (=> b!203508 (= lt!102679 (+!436 lt!102685 lt!102681))))

(assert (=> b!203508 (= lt!102682 (+!436 lt!102684 lt!102681))))

(assert (=> b!203508 (= lt!102681 (tuple2!3875 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun mapNonEmpty!8591 () Bool)

(declare-fun tp!18508 () Bool)

(assert (=> mapNonEmpty!8591 (= mapRes!8591 (and tp!18508 e!133217))))

(declare-fun mapKey!8591 () (_ BitVec 32))

(declare-fun mapValue!8591 () ValueCell!2164)

(declare-fun mapRest!8591 () (Array (_ BitVec 32) ValueCell!2164))

(assert (=> mapNonEmpty!8591 (= (arr!4377 _values!649) (store mapRest!8591 mapKey!8591 mapValue!8591))))

(declare-fun b!203509 () Bool)

(declare-fun res!97800 () Bool)

(assert (=> b!203509 (=> (not res!97800) (not e!133221))))

(declare-datatypes ((List!2776 0))(
  ( (Nil!2773) (Cons!2772 (h!3414 (_ BitVec 64)) (t!7707 List!2776)) )
))
(declare-fun arrayNoDuplicates!0 (array!9255 (_ BitVec 32) List!2776) Bool)

(assert (=> b!203509 (= res!97800 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2773))))

(declare-fun b!203510 () Bool)

(assert (=> b!203510 (= e!133219 (and e!133223 mapRes!8591))))

(declare-fun condMapEmpty!8591 () Bool)

(declare-fun mapDefault!8591 () ValueCell!2164)

