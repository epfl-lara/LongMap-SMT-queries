; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73418 () Bool)

(assert start!73418)

(declare-fun b_free!14333 () Bool)

(declare-fun b_next!14333 () Bool)

(assert (=> start!73418 (= b_free!14333 (not b_next!14333))))

(declare-fun tp!50503 () Bool)

(declare-fun b_and!23689 () Bool)

(assert (=> start!73418 (= tp!50503 b_and!23689)))

(declare-fun b!857118 () Bool)

(declare-fun res!582209 () Bool)

(declare-fun e!477738 () Bool)

(assert (=> b!857118 (=> (not res!582209) (not e!477738))))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!857118 (= res!582209 (validKeyInArray!0 k!854))))

(declare-fun b!857119 () Bool)

(declare-fun e!477741 () Bool)

(assert (=> b!857119 (= e!477741 (not true))))

(declare-datatypes ((V!27005 0))(
  ( (V!27006 (val!8282 Int)) )
))
(declare-datatypes ((ValueCell!7795 0))(
  ( (ValueCellFull!7795 (v!10707 V!27005)) (EmptyCell!7795) )
))
(declare-datatypes ((array!49130 0))(
  ( (array!49131 (arr!23596 (Array (_ BitVec 32) ValueCell!7795)) (size!24036 (_ BitVec 32))) )
))
(declare-fun lt!386185 () array!49130)

(declare-fun v!557 () V!27005)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!49132 0))(
  ( (array!49133 (arr!23597 (Array (_ BitVec 32) (_ BitVec 64))) (size!24037 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49132)

(declare-fun _values!688 () array!49130)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!27005)

(declare-fun zeroValue!654 () V!27005)

(declare-datatypes ((tuple2!10926 0))(
  ( (tuple2!10927 (_1!5474 (_ BitVec 64)) (_2!5474 V!27005)) )
))
(declare-datatypes ((List!16734 0))(
  ( (Nil!16731) (Cons!16730 (h!17861 tuple2!10926) (t!23375 List!16734)) )
))
(declare-datatypes ((ListLongMap!9695 0))(
  ( (ListLongMap!9696 (toList!4863 List!16734)) )
))
(declare-fun getCurrentListMapNoExtraKeys!2844 (array!49132 array!49130 (_ BitVec 32) (_ BitVec 32) V!27005 V!27005 (_ BitVec 32) Int) ListLongMap!9695)

(declare-fun +!2217 (ListLongMap!9695 tuple2!10926) ListLongMap!9695)

(assert (=> b!857119 (= (getCurrentListMapNoExtraKeys!2844 _keys!868 lt!386185 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2217 (getCurrentListMapNoExtraKeys!2844 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!10927 k!854 v!557)))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((Unit!29221 0))(
  ( (Unit!29222) )
))
(declare-fun lt!386183 () Unit!29221)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!438 (array!49132 array!49130 (_ BitVec 32) (_ BitVec 32) V!27005 V!27005 (_ BitVec 32) (_ BitVec 64) V!27005 (_ BitVec 32) Int) Unit!29221)

(assert (=> b!857119 (= lt!386183 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!438 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!857120 () Bool)

(declare-fun res!582211 () Bool)

(assert (=> b!857120 (=> (not res!582211) (not e!477738))))

(assert (=> b!857120 (= res!582211 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24037 _keys!868))))))

(declare-fun mapNonEmpty!26303 () Bool)

(declare-fun mapRes!26303 () Bool)

(declare-fun tp!50502 () Bool)

(declare-fun e!477740 () Bool)

(assert (=> mapNonEmpty!26303 (= mapRes!26303 (and tp!50502 e!477740))))

(declare-fun mapRest!26303 () (Array (_ BitVec 32) ValueCell!7795))

(declare-fun mapKey!26303 () (_ BitVec 32))

(declare-fun mapValue!26303 () ValueCell!7795)

(assert (=> mapNonEmpty!26303 (= (arr!23596 _values!688) (store mapRest!26303 mapKey!26303 mapValue!26303))))

(declare-fun b!857121 () Bool)

(declare-fun res!582205 () Bool)

(assert (=> b!857121 (=> (not res!582205) (not e!477738))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49132 (_ BitVec 32)) Bool)

(assert (=> b!857121 (= res!582205 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!857122 () Bool)

(declare-fun res!582204 () Bool)

(assert (=> b!857122 (=> (not res!582204) (not e!477738))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!857122 (= res!582204 (validMask!0 mask!1196))))

(declare-fun mapIsEmpty!26303 () Bool)

(assert (=> mapIsEmpty!26303 mapRes!26303))

(declare-fun b!857123 () Bool)

(declare-fun e!477742 () Bool)

(declare-fun e!477739 () Bool)

(assert (=> b!857123 (= e!477742 (and e!477739 mapRes!26303))))

(declare-fun condMapEmpty!26303 () Bool)

(declare-fun mapDefault!26303 () ValueCell!7795)

