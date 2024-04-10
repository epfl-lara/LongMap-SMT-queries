; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20644 () Bool)

(assert start!20644)

(declare-fun b_free!5303 () Bool)

(declare-fun b_next!5303 () Bool)

(assert (=> start!20644 (= b_free!5303 (not b_next!5303))))

(declare-fun tp!18940 () Bool)

(declare-fun b_and!12049 () Bool)

(assert (=> start!20644 (= tp!18940 b_and!12049)))

(declare-fun res!99753 () Bool)

(declare-fun e!134732 () Bool)

(assert (=> start!20644 (=> (not res!99753) (not e!134732))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20644 (= res!99753 (validMask!0 mask!1149))))

(assert (=> start!20644 e!134732))

(declare-datatypes ((V!6525 0))(
  ( (V!6526 (val!2624 Int)) )
))
(declare-datatypes ((ValueCell!2236 0))(
  ( (ValueCellFull!2236 (v!4594 V!6525)) (EmptyCell!2236) )
))
(declare-datatypes ((array!9529 0))(
  ( (array!9530 (arr!4515 (Array (_ BitVec 32) ValueCell!2236)) (size!4840 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9529)

(declare-fun e!134735 () Bool)

(declare-fun array_inv!2983 (array!9529) Bool)

(assert (=> start!20644 (and (array_inv!2983 _values!649) e!134735)))

(assert (=> start!20644 true))

(declare-fun tp_is_empty!5159 () Bool)

(assert (=> start!20644 tp_is_empty!5159))

(declare-datatypes ((array!9531 0))(
  ( (array!9532 (arr!4516 (Array (_ BitVec 32) (_ BitVec 64))) (size!4841 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9531)

(declare-fun array_inv!2984 (array!9531) Bool)

(assert (=> start!20644 (array_inv!2984 _keys!825)))

(assert (=> start!20644 tp!18940))

(declare-fun b!206100 () Bool)

(declare-fun res!99759 () Bool)

(assert (=> b!206100 (=> (not res!99759) (not e!134732))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!206100 (= res!99759 (and (= (size!4840 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4841 _keys!825) (size!4840 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!206101 () Bool)

(declare-fun e!134734 () Bool)

(assert (=> b!206101 (= e!134732 (not e!134734))))

(declare-fun res!99752 () Bool)

(assert (=> b!206101 (=> res!99752 e!134734)))

(assert (=> b!206101 (= res!99752 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!3984 0))(
  ( (tuple2!3985 (_1!2003 (_ BitVec 64)) (_2!2003 V!6525)) )
))
(declare-datatypes ((List!2876 0))(
  ( (Nil!2873) (Cons!2872 (h!3514 tuple2!3984) (t!7807 List!2876)) )
))
(declare-datatypes ((ListLongMap!2897 0))(
  ( (ListLongMap!2898 (toList!1464 List!2876)) )
))
(declare-fun lt!105239 () ListLongMap!2897)

(declare-fun zeroValue!615 () V!6525)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6525)

(declare-fun getCurrentListMap!1033 (array!9531 array!9529 (_ BitVec 32) (_ BitVec 32) V!6525 V!6525 (_ BitVec 32) Int) ListLongMap!2897)

(assert (=> b!206101 (= lt!105239 (getCurrentListMap!1033 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!105241 () ListLongMap!2897)

(declare-fun lt!105237 () array!9529)

(assert (=> b!206101 (= lt!105241 (getCurrentListMap!1033 _keys!825 lt!105237 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!105235 () ListLongMap!2897)

(declare-fun lt!105238 () ListLongMap!2897)

(assert (=> b!206101 (and (= lt!105235 lt!105238) (= lt!105238 lt!105235))))

(declare-fun lt!105234 () ListLongMap!2897)

(declare-fun lt!105243 () tuple2!3984)

(declare-fun +!491 (ListLongMap!2897 tuple2!3984) ListLongMap!2897)

(assert (=> b!206101 (= lt!105238 (+!491 lt!105234 lt!105243))))

(declare-fun k!843 () (_ BitVec 64))

(declare-fun v!520 () V!6525)

(assert (=> b!206101 (= lt!105243 (tuple2!3985 k!843 v!520))))

(declare-datatypes ((Unit!6270 0))(
  ( (Unit!6271) )
))
(declare-fun lt!105242 () Unit!6270)

(declare-fun i!601 () (_ BitVec 32))

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!146 (array!9531 array!9529 (_ BitVec 32) (_ BitVec 32) V!6525 V!6525 (_ BitVec 32) (_ BitVec 64) V!6525 (_ BitVec 32) Int) Unit!6270)

(assert (=> b!206101 (= lt!105242 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!146 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!407 (array!9531 array!9529 (_ BitVec 32) (_ BitVec 32) V!6525 V!6525 (_ BitVec 32) Int) ListLongMap!2897)

(assert (=> b!206101 (= lt!105235 (getCurrentListMapNoExtraKeys!407 _keys!825 lt!105237 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!206101 (= lt!105237 (array!9530 (store (arr!4515 _values!649) i!601 (ValueCellFull!2236 v!520)) (size!4840 _values!649)))))

(assert (=> b!206101 (= lt!105234 (getCurrentListMapNoExtraKeys!407 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!206102 () Bool)

(declare-fun e!134733 () Bool)

(assert (=> b!206102 (= e!134733 tp_is_empty!5159)))

(declare-fun b!206103 () Bool)

(declare-fun res!99757 () Bool)

(assert (=> b!206103 (=> (not res!99757) (not e!134732))))

(assert (=> b!206103 (= res!99757 (= (select (arr!4516 _keys!825) i!601) k!843))))

(declare-fun b!206104 () Bool)

(declare-fun e!134729 () Bool)

(assert (=> b!206104 (= e!134734 e!134729)))

(declare-fun res!99755 () Bool)

(assert (=> b!206104 (=> res!99755 e!134729)))

(assert (=> b!206104 (= res!99755 (= k!843 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!105232 () ListLongMap!2897)

(assert (=> b!206104 (= lt!105239 lt!105232)))

(declare-fun lt!105240 () tuple2!3984)

(assert (=> b!206104 (= lt!105232 (+!491 lt!105234 lt!105240))))

(declare-fun lt!105236 () ListLongMap!2897)

(assert (=> b!206104 (= lt!105241 lt!105236)))

(assert (=> b!206104 (= lt!105236 (+!491 lt!105238 lt!105240))))

(assert (=> b!206104 (= lt!105241 (+!491 lt!105235 lt!105240))))

(assert (=> b!206104 (= lt!105240 (tuple2!3985 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!206105 () Bool)

(declare-fun res!99758 () Bool)

(assert (=> b!206105 (=> (not res!99758) (not e!134732))))

(declare-datatypes ((List!2877 0))(
  ( (Nil!2874) (Cons!2873 (h!3515 (_ BitVec 64)) (t!7808 List!2877)) )
))
(declare-fun arrayNoDuplicates!0 (array!9531 (_ BitVec 32) List!2877) Bool)

(assert (=> b!206105 (= res!99758 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2874))))

(declare-fun mapNonEmpty!8807 () Bool)

(declare-fun mapRes!8807 () Bool)

(declare-fun tp!18941 () Bool)

(assert (=> mapNonEmpty!8807 (= mapRes!8807 (and tp!18941 e!134733))))

(declare-fun mapKey!8807 () (_ BitVec 32))

(declare-fun mapValue!8807 () ValueCell!2236)

(declare-fun mapRest!8807 () (Array (_ BitVec 32) ValueCell!2236))

(assert (=> mapNonEmpty!8807 (= (arr!4515 _values!649) (store mapRest!8807 mapKey!8807 mapValue!8807))))

(declare-fun b!206106 () Bool)

(assert (=> b!206106 (= e!134729 true)))

(assert (=> b!206106 (= lt!105236 (+!491 lt!105232 lt!105243))))

(declare-fun lt!105233 () Unit!6270)

(declare-fun addCommutativeForDiffKeys!189 (ListLongMap!2897 (_ BitVec 64) V!6525 (_ BitVec 64) V!6525) Unit!6270)

(assert (=> b!206106 (= lt!105233 (addCommutativeForDiffKeys!189 lt!105234 k!843 v!520 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!206107 () Bool)

(declare-fun e!134730 () Bool)

(assert (=> b!206107 (= e!134735 (and e!134730 mapRes!8807))))

(declare-fun condMapEmpty!8807 () Bool)

(declare-fun mapDefault!8807 () ValueCell!2236)

