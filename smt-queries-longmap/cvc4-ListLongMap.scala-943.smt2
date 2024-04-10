; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20758 () Bool)

(assert start!20758)

(declare-fun b_free!5417 () Bool)

(declare-fun b_next!5417 () Bool)

(assert (=> start!20758 (= b_free!5417 (not b_next!5417))))

(declare-fun tp!19283 () Bool)

(declare-fun b_and!12163 () Bool)

(assert (=> start!20758 (= tp!19283 b_and!12163)))

(declare-fun res!101005 () Bool)

(declare-fun e!135641 () Bool)

(assert (=> start!20758 (=> (not res!101005) (not e!135641))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20758 (= res!101005 (validMask!0 mask!1149))))

(assert (=> start!20758 e!135641))

(declare-datatypes ((V!6677 0))(
  ( (V!6678 (val!2681 Int)) )
))
(declare-datatypes ((ValueCell!2293 0))(
  ( (ValueCellFull!2293 (v!4651 V!6677)) (EmptyCell!2293) )
))
(declare-datatypes ((array!9751 0))(
  ( (array!9752 (arr!4626 (Array (_ BitVec 32) ValueCell!2293)) (size!4951 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9751)

(declare-fun e!135644 () Bool)

(declare-fun array_inv!3065 (array!9751) Bool)

(assert (=> start!20758 (and (array_inv!3065 _values!649) e!135644)))

(assert (=> start!20758 true))

(declare-fun tp_is_empty!5273 () Bool)

(assert (=> start!20758 tp_is_empty!5273))

(declare-datatypes ((array!9753 0))(
  ( (array!9754 (arr!4627 (Array (_ BitVec 32) (_ BitVec 64))) (size!4952 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9753)

(declare-fun array_inv!3066 (array!9753) Bool)

(assert (=> start!20758 (array_inv!3066 _keys!825)))

(assert (=> start!20758 tp!19283))

(declare-fun b!207866 () Bool)

(declare-fun res!101010 () Bool)

(assert (=> b!207866 (=> (not res!101010) (not e!135641))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9753 (_ BitVec 32)) Bool)

(assert (=> b!207866 (= res!101010 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!207867 () Bool)

(declare-fun res!101007 () Bool)

(assert (=> b!207867 (=> (not res!101007) (not e!135641))))

(declare-fun k!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!207867 (= res!101007 (validKeyInArray!0 k!843))))

(declare-fun mapNonEmpty!8978 () Bool)

(declare-fun mapRes!8978 () Bool)

(declare-fun tp!19282 () Bool)

(declare-fun e!135643 () Bool)

(assert (=> mapNonEmpty!8978 (= mapRes!8978 (and tp!19282 e!135643))))

(declare-fun mapRest!8978 () (Array (_ BitVec 32) ValueCell!2293))

(declare-fun mapKey!8978 () (_ BitVec 32))

(declare-fun mapValue!8978 () ValueCell!2293)

(assert (=> mapNonEmpty!8978 (= (arr!4626 _values!649) (store mapRest!8978 mapKey!8978 mapValue!8978))))

(declare-fun b!207868 () Bool)

(declare-fun res!101006 () Bool)

(assert (=> b!207868 (=> (not res!101006) (not e!135641))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!207868 (= res!101006 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4952 _keys!825))))))

(declare-fun b!207869 () Bool)

(declare-fun res!101011 () Bool)

(assert (=> b!207869 (=> (not res!101011) (not e!135641))))

(declare-datatypes ((List!2960 0))(
  ( (Nil!2957) (Cons!2956 (h!3598 (_ BitVec 64)) (t!7891 List!2960)) )
))
(declare-fun arrayNoDuplicates!0 (array!9753 (_ BitVec 32) List!2960) Bool)

(assert (=> b!207869 (= res!101011 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2957))))

(declare-fun b!207870 () Bool)

(declare-fun e!135640 () Bool)

(assert (=> b!207870 (= e!135640 tp_is_empty!5273)))

(declare-fun b!207871 () Bool)

(declare-fun res!101009 () Bool)

(assert (=> b!207871 (=> (not res!101009) (not e!135641))))

(assert (=> b!207871 (= res!101009 (= (select (arr!4627 _keys!825) i!601) k!843))))

(declare-fun b!207872 () Bool)

(assert (=> b!207872 (= e!135641 (not true))))

(declare-datatypes ((tuple2!4068 0))(
  ( (tuple2!4069 (_1!2045 (_ BitVec 64)) (_2!2045 V!6677)) )
))
(declare-datatypes ((List!2961 0))(
  ( (Nil!2958) (Cons!2957 (h!3599 tuple2!4068) (t!7892 List!2961)) )
))
(declare-datatypes ((ListLongMap!2981 0))(
  ( (ListLongMap!2982 (toList!1506 List!2961)) )
))
(declare-fun lt!106582 () ListLongMap!2981)

(declare-fun zeroValue!615 () V!6677)

(declare-fun defaultEntry!657 () Int)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun minValue!615 () V!6677)

(declare-fun getCurrentListMap!1073 (array!9753 array!9751 (_ BitVec 32) (_ BitVec 32) V!6677 V!6677 (_ BitVec 32) Int) ListLongMap!2981)

(assert (=> b!207872 (= lt!106582 (getCurrentListMap!1073 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!106580 () array!9751)

(declare-fun lt!106583 () ListLongMap!2981)

(assert (=> b!207872 (= lt!106583 (getCurrentListMap!1073 _keys!825 lt!106580 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!106581 () ListLongMap!2981)

(declare-fun lt!106579 () ListLongMap!2981)

(assert (=> b!207872 (and (= lt!106581 lt!106579) (= lt!106579 lt!106581))))

(declare-fun lt!106578 () ListLongMap!2981)

(declare-fun v!520 () V!6677)

(declare-fun +!533 (ListLongMap!2981 tuple2!4068) ListLongMap!2981)

(assert (=> b!207872 (= lt!106579 (+!533 lt!106578 (tuple2!4069 k!843 v!520)))))

(declare-datatypes ((Unit!6354 0))(
  ( (Unit!6355) )
))
(declare-fun lt!106584 () Unit!6354)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!186 (array!9753 array!9751 (_ BitVec 32) (_ BitVec 32) V!6677 V!6677 (_ BitVec 32) (_ BitVec 64) V!6677 (_ BitVec 32) Int) Unit!6354)

(assert (=> b!207872 (= lt!106584 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!186 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!447 (array!9753 array!9751 (_ BitVec 32) (_ BitVec 32) V!6677 V!6677 (_ BitVec 32) Int) ListLongMap!2981)

(assert (=> b!207872 (= lt!106581 (getCurrentListMapNoExtraKeys!447 _keys!825 lt!106580 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!207872 (= lt!106580 (array!9752 (store (arr!4626 _values!649) i!601 (ValueCellFull!2293 v!520)) (size!4951 _values!649)))))

(assert (=> b!207872 (= lt!106578 (getCurrentListMapNoExtraKeys!447 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!207873 () Bool)

(assert (=> b!207873 (= e!135644 (and e!135640 mapRes!8978))))

(declare-fun condMapEmpty!8978 () Bool)

(declare-fun mapDefault!8978 () ValueCell!2293)

