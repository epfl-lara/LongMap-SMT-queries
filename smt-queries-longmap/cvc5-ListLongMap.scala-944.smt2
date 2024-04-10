; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20760 () Bool)

(assert start!20760)

(declare-fun b_free!5419 () Bool)

(declare-fun b_next!5419 () Bool)

(assert (=> start!20760 (= b_free!5419 (not b_next!5419))))

(declare-fun tp!19288 () Bool)

(declare-fun b_and!12165 () Bool)

(assert (=> start!20760 (= tp!19288 b_and!12165)))

(declare-fun b!207896 () Bool)

(declare-fun res!101026 () Bool)

(declare-fun e!135656 () Bool)

(assert (=> b!207896 (=> (not res!101026) (not e!135656))))

(declare-fun i!601 () (_ BitVec 32))

(declare-datatypes ((array!9755 0))(
  ( (array!9756 (arr!4628 (Array (_ BitVec 32) (_ BitVec 64))) (size!4953 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9755)

(assert (=> b!207896 (= res!101026 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4953 _keys!825))))))

(declare-fun b!207897 () Bool)

(declare-fun res!101029 () Bool)

(assert (=> b!207897 (=> (not res!101029) (not e!135656))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-datatypes ((V!6681 0))(
  ( (V!6682 (val!2682 Int)) )
))
(declare-datatypes ((ValueCell!2294 0))(
  ( (ValueCellFull!2294 (v!4652 V!6681)) (EmptyCell!2294) )
))
(declare-datatypes ((array!9757 0))(
  ( (array!9758 (arr!4629 (Array (_ BitVec 32) ValueCell!2294)) (size!4954 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9757)

(declare-fun mask!1149 () (_ BitVec 32))

(assert (=> b!207897 (= res!101029 (and (= (size!4954 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4953 _keys!825) (size!4954 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!207898 () Bool)

(assert (=> b!207898 (= e!135656 (not true))))

(declare-datatypes ((tuple2!4070 0))(
  ( (tuple2!4071 (_1!2046 (_ BitVec 64)) (_2!2046 V!6681)) )
))
(declare-datatypes ((List!2962 0))(
  ( (Nil!2959) (Cons!2958 (h!3600 tuple2!4070) (t!7893 List!2962)) )
))
(declare-datatypes ((ListLongMap!2983 0))(
  ( (ListLongMap!2984 (toList!1507 List!2962)) )
))
(declare-fun lt!106603 () ListLongMap!2983)

(declare-fun zeroValue!615 () V!6681)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6681)

(declare-fun getCurrentListMap!1074 (array!9755 array!9757 (_ BitVec 32) (_ BitVec 32) V!6681 V!6681 (_ BitVec 32) Int) ListLongMap!2983)

(assert (=> b!207898 (= lt!106603 (getCurrentListMap!1074 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!106601 () array!9757)

(declare-fun lt!106602 () ListLongMap!2983)

(assert (=> b!207898 (= lt!106602 (getCurrentListMap!1074 _keys!825 lt!106601 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!106605 () ListLongMap!2983)

(declare-fun lt!106600 () ListLongMap!2983)

(assert (=> b!207898 (and (= lt!106605 lt!106600) (= lt!106600 lt!106605))))

(declare-fun lt!106599 () ListLongMap!2983)

(declare-fun v!520 () V!6681)

(declare-fun k!843 () (_ BitVec 64))

(declare-fun +!534 (ListLongMap!2983 tuple2!4070) ListLongMap!2983)

(assert (=> b!207898 (= lt!106600 (+!534 lt!106599 (tuple2!4071 k!843 v!520)))))

(declare-datatypes ((Unit!6356 0))(
  ( (Unit!6357) )
))
(declare-fun lt!106604 () Unit!6356)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!187 (array!9755 array!9757 (_ BitVec 32) (_ BitVec 32) V!6681 V!6681 (_ BitVec 32) (_ BitVec 64) V!6681 (_ BitVec 32) Int) Unit!6356)

(assert (=> b!207898 (= lt!106604 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!187 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!448 (array!9755 array!9757 (_ BitVec 32) (_ BitVec 32) V!6681 V!6681 (_ BitVec 32) Int) ListLongMap!2983)

(assert (=> b!207898 (= lt!106605 (getCurrentListMapNoExtraKeys!448 _keys!825 lt!106601 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!207898 (= lt!106601 (array!9758 (store (arr!4629 _values!649) i!601 (ValueCellFull!2294 v!520)) (size!4954 _values!649)))))

(assert (=> b!207898 (= lt!106599 (getCurrentListMapNoExtraKeys!448 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!207899 () Bool)

(declare-fun res!101028 () Bool)

(assert (=> b!207899 (=> (not res!101028) (not e!135656))))

(declare-datatypes ((List!2963 0))(
  ( (Nil!2960) (Cons!2959 (h!3601 (_ BitVec 64)) (t!7894 List!2963)) )
))
(declare-fun arrayNoDuplicates!0 (array!9755 (_ BitVec 32) List!2963) Bool)

(assert (=> b!207899 (= res!101028 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2960))))

(declare-fun mapIsEmpty!8981 () Bool)

(declare-fun mapRes!8981 () Bool)

(assert (=> mapIsEmpty!8981 mapRes!8981))

(declare-fun mapNonEmpty!8981 () Bool)

(declare-fun tp!19289 () Bool)

(declare-fun e!135657 () Bool)

(assert (=> mapNonEmpty!8981 (= mapRes!8981 (and tp!19289 e!135657))))

(declare-fun mapRest!8981 () (Array (_ BitVec 32) ValueCell!2294))

(declare-fun mapValue!8981 () ValueCell!2294)

(declare-fun mapKey!8981 () (_ BitVec 32))

(assert (=> mapNonEmpty!8981 (= (arr!4629 _values!649) (store mapRest!8981 mapKey!8981 mapValue!8981))))

(declare-fun b!207901 () Bool)

(declare-fun e!135658 () Bool)

(declare-fun e!135655 () Bool)

(assert (=> b!207901 (= e!135658 (and e!135655 mapRes!8981))))

(declare-fun condMapEmpty!8981 () Bool)

(declare-fun mapDefault!8981 () ValueCell!2294)

