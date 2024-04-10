; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20470 () Bool)

(assert start!20470)

(declare-fun b_free!5129 () Bool)

(declare-fun b_next!5129 () Bool)

(assert (=> start!20470 (= b_free!5129 (not b_next!5129))))

(declare-fun tp!18419 () Bool)

(declare-fun b_and!11875 () Bool)

(assert (=> start!20470 (= tp!18419 b_and!11875)))

(declare-fun b!202959 () Bool)

(declare-fun e!132902 () Bool)

(assert (=> b!202959 (= e!132902 true)))

(declare-datatypes ((V!6293 0))(
  ( (V!6294 (val!2537 Int)) )
))
(declare-datatypes ((tuple2!3846 0))(
  ( (tuple2!3847 (_1!1934 (_ BitVec 64)) (_2!1934 V!6293)) )
))
(declare-datatypes ((List!2752 0))(
  ( (Nil!2749) (Cons!2748 (h!3390 tuple2!3846) (t!7683 List!2752)) )
))
(declare-datatypes ((ListLongMap!2759 0))(
  ( (ListLongMap!2760 (toList!1395 List!2752)) )
))
(declare-fun lt!102147 () ListLongMap!2759)

(declare-fun lt!102144 () ListLongMap!2759)

(declare-fun lt!102140 () tuple2!3846)

(declare-fun +!422 (ListLongMap!2759 tuple2!3846) ListLongMap!2759)

(assert (=> b!202959 (= lt!102147 (+!422 lt!102144 lt!102140))))

(declare-fun lt!102146 () ListLongMap!2759)

(declare-datatypes ((Unit!6138 0))(
  ( (Unit!6139) )
))
(declare-fun lt!102139 () Unit!6138)

(declare-fun v!520 () V!6293)

(declare-fun k!843 () (_ BitVec 64))

(declare-fun zeroValue!615 () V!6293)

(declare-fun addCommutativeForDiffKeys!138 (ListLongMap!2759 (_ BitVec 64) V!6293 (_ BitVec 64) V!6293) Unit!6138)

(assert (=> b!202959 (= lt!102139 (addCommutativeForDiffKeys!138 lt!102146 k!843 v!520 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun res!97400 () Bool)

(declare-fun e!132903 () Bool)

(assert (=> start!20470 (=> (not res!97400) (not e!132903))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20470 (= res!97400 (validMask!0 mask!1149))))

(assert (=> start!20470 e!132903))

(declare-datatypes ((ValueCell!2149 0))(
  ( (ValueCellFull!2149 (v!4507 V!6293)) (EmptyCell!2149) )
))
(declare-datatypes ((array!9195 0))(
  ( (array!9196 (arr!4348 (Array (_ BitVec 32) ValueCell!2149)) (size!4673 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9195)

(declare-fun e!132908 () Bool)

(declare-fun array_inv!2871 (array!9195) Bool)

(assert (=> start!20470 (and (array_inv!2871 _values!649) e!132908)))

(assert (=> start!20470 true))

(declare-fun tp_is_empty!4985 () Bool)

(assert (=> start!20470 tp_is_empty!4985))

(declare-datatypes ((array!9197 0))(
  ( (array!9198 (arr!4349 (Array (_ BitVec 32) (_ BitVec 64))) (size!4674 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9197)

(declare-fun array_inv!2872 (array!9197) Bool)

(assert (=> start!20470 (array_inv!2872 _keys!825)))

(assert (=> start!20470 tp!18419))

(declare-fun b!202960 () Bool)

(declare-fun e!132906 () Bool)

(assert (=> b!202960 (= e!132903 (not e!132906))))

(declare-fun res!97396 () Bool)

(assert (=> b!202960 (=> res!97396 e!132906)))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!202960 (= res!97396 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun lt!102138 () ListLongMap!2759)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6293)

(declare-fun getCurrentListMap!974 (array!9197 array!9195 (_ BitVec 32) (_ BitVec 32) V!6293 V!6293 (_ BitVec 32) Int) ListLongMap!2759)

(assert (=> b!202960 (= lt!102138 (getCurrentListMap!974 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!102136 () array!9195)

(declare-fun lt!102145 () ListLongMap!2759)

(assert (=> b!202960 (= lt!102145 (getCurrentListMap!974 _keys!825 lt!102136 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!102137 () ListLongMap!2759)

(declare-fun lt!102143 () ListLongMap!2759)

(assert (=> b!202960 (and (= lt!102137 lt!102143) (= lt!102143 lt!102137))))

(assert (=> b!202960 (= lt!102143 (+!422 lt!102146 lt!102140))))

(assert (=> b!202960 (= lt!102140 (tuple2!3847 k!843 v!520))))

(declare-fun lt!102142 () Unit!6138)

(declare-fun i!601 () (_ BitVec 32))

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!87 (array!9197 array!9195 (_ BitVec 32) (_ BitVec 32) V!6293 V!6293 (_ BitVec 32) (_ BitVec 64) V!6293 (_ BitVec 32) Int) Unit!6138)

(assert (=> b!202960 (= lt!102142 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!87 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!348 (array!9197 array!9195 (_ BitVec 32) (_ BitVec 32) V!6293 V!6293 (_ BitVec 32) Int) ListLongMap!2759)

(assert (=> b!202960 (= lt!102137 (getCurrentListMapNoExtraKeys!348 _keys!825 lt!102136 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!202960 (= lt!102136 (array!9196 (store (arr!4348 _values!649) i!601 (ValueCellFull!2149 v!520)) (size!4673 _values!649)))))

(assert (=> b!202960 (= lt!102146 (getCurrentListMapNoExtraKeys!348 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun mapIsEmpty!8546 () Bool)

(declare-fun mapRes!8546 () Bool)

(assert (=> mapIsEmpty!8546 mapRes!8546))

(declare-fun b!202961 () Bool)

(declare-fun res!97401 () Bool)

(assert (=> b!202961 (=> (not res!97401) (not e!132903))))

(assert (=> b!202961 (= res!97401 (and (= (size!4673 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4674 _keys!825) (size!4673 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!202962 () Bool)

(declare-fun res!97394 () Bool)

(assert (=> b!202962 (=> (not res!97394) (not e!132903))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9197 (_ BitVec 32)) Bool)

(assert (=> b!202962 (= res!97394 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!202963 () Bool)

(declare-fun res!97397 () Bool)

(assert (=> b!202963 (=> (not res!97397) (not e!132903))))

(assert (=> b!202963 (= res!97397 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4674 _keys!825))))))

(declare-fun b!202964 () Bool)

(declare-fun e!132904 () Bool)

(assert (=> b!202964 (= e!132908 (and e!132904 mapRes!8546))))

(declare-fun condMapEmpty!8546 () Bool)

(declare-fun mapDefault!8546 () ValueCell!2149)

