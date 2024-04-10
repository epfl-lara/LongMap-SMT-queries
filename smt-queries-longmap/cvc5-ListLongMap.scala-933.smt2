; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20694 () Bool)

(assert start!20694)

(declare-fun b_free!5353 () Bool)

(declare-fun b_next!5353 () Bool)

(assert (=> start!20694 (= b_free!5353 (not b_next!5353))))

(declare-fun tp!19090 () Bool)

(declare-fun b_and!12099 () Bool)

(assert (=> start!20694 (= tp!19090 b_and!12099)))

(declare-fun b!206906 () Bool)

(declare-fun res!100333 () Bool)

(declare-fun e!135162 () Bool)

(assert (=> b!206906 (=> (not res!100333) (not e!135162))))

(declare-datatypes ((array!9627 0))(
  ( (array!9628 (arr!4564 (Array (_ BitVec 32) (_ BitVec 64))) (size!4889 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9627)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-datatypes ((V!6593 0))(
  ( (V!6594 (val!2649 Int)) )
))
(declare-datatypes ((ValueCell!2261 0))(
  ( (ValueCellFull!2261 (v!4619 V!6593)) (EmptyCell!2261) )
))
(declare-datatypes ((array!9629 0))(
  ( (array!9630 (arr!4565 (Array (_ BitVec 32) ValueCell!2261)) (size!4890 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9629)

(declare-fun mask!1149 () (_ BitVec 32))

(assert (=> b!206906 (= res!100333 (and (= (size!4890 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4889 _keys!825) (size!4890 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!206907 () Bool)

(declare-fun res!100334 () Bool)

(assert (=> b!206907 (=> (not res!100334) (not e!135162))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9627 (_ BitVec 32)) Bool)

(assert (=> b!206907 (= res!100334 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!206908 () Bool)

(assert (=> b!206908 (= e!135162 (not true))))

(declare-datatypes ((tuple2!4022 0))(
  ( (tuple2!4023 (_1!2022 (_ BitVec 64)) (_2!2022 V!6593)) )
))
(declare-datatypes ((List!2913 0))(
  ( (Nil!2910) (Cons!2909 (h!3551 tuple2!4022) (t!7844 List!2913)) )
))
(declare-datatypes ((ListLongMap!2935 0))(
  ( (ListLongMap!2936 (toList!1483 List!2913)) )
))
(declare-fun lt!105899 () ListLongMap!2935)

(declare-fun zeroValue!615 () V!6593)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6593)

(declare-fun getCurrentListMap!1050 (array!9627 array!9629 (_ BitVec 32) (_ BitVec 32) V!6593 V!6593 (_ BitVec 32) Int) ListLongMap!2935)

(assert (=> b!206908 (= lt!105899 (getCurrentListMap!1050 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!105903 () array!9629)

(declare-fun lt!105900 () ListLongMap!2935)

(assert (=> b!206908 (= lt!105900 (getCurrentListMap!1050 _keys!825 lt!105903 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!105901 () ListLongMap!2935)

(declare-fun lt!105898 () ListLongMap!2935)

(assert (=> b!206908 (and (= lt!105901 lt!105898) (= lt!105898 lt!105901))))

(declare-fun lt!105897 () ListLongMap!2935)

(declare-fun v!520 () V!6593)

(declare-fun k!843 () (_ BitVec 64))

(declare-fun +!510 (ListLongMap!2935 tuple2!4022) ListLongMap!2935)

(assert (=> b!206908 (= lt!105898 (+!510 lt!105897 (tuple2!4023 k!843 v!520)))))

(declare-fun i!601 () (_ BitVec 32))

(declare-datatypes ((Unit!6308 0))(
  ( (Unit!6309) )
))
(declare-fun lt!105902 () Unit!6308)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!163 (array!9627 array!9629 (_ BitVec 32) (_ BitVec 32) V!6593 V!6593 (_ BitVec 32) (_ BitVec 64) V!6593 (_ BitVec 32) Int) Unit!6308)

(assert (=> b!206908 (= lt!105902 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!163 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!424 (array!9627 array!9629 (_ BitVec 32) (_ BitVec 32) V!6593 V!6593 (_ BitVec 32) Int) ListLongMap!2935)

(assert (=> b!206908 (= lt!105901 (getCurrentListMapNoExtraKeys!424 _keys!825 lt!105903 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!206908 (= lt!105903 (array!9630 (store (arr!4565 _values!649) i!601 (ValueCellFull!2261 v!520)) (size!4890 _values!649)))))

(assert (=> b!206908 (= lt!105897 (getCurrentListMapNoExtraKeys!424 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun mapNonEmpty!8882 () Bool)

(declare-fun mapRes!8882 () Bool)

(declare-fun tp!19091 () Bool)

(declare-fun e!135163 () Bool)

(assert (=> mapNonEmpty!8882 (= mapRes!8882 (and tp!19091 e!135163))))

(declare-fun mapRest!8882 () (Array (_ BitVec 32) ValueCell!2261))

(declare-fun mapValue!8882 () ValueCell!2261)

(declare-fun mapKey!8882 () (_ BitVec 32))

(assert (=> mapNonEmpty!8882 (= (arr!4565 _values!649) (store mapRest!8882 mapKey!8882 mapValue!8882))))

(declare-fun b!206909 () Bool)

(declare-fun e!135160 () Bool)

(declare-fun e!135164 () Bool)

(assert (=> b!206909 (= e!135160 (and e!135164 mapRes!8882))))

(declare-fun condMapEmpty!8882 () Bool)

(declare-fun mapDefault!8882 () ValueCell!2261)

