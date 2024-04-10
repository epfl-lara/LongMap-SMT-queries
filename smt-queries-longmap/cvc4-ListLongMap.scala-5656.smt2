; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73724 () Bool)

(assert start!73724)

(declare-fun b_free!14639 () Bool)

(declare-fun b_next!14639 () Bool)

(assert (=> start!73724 (= b_free!14639 (not b_next!14639))))

(declare-fun tp!51420 () Bool)

(declare-fun b_and!24257 () Bool)

(assert (=> start!73724 (= tp!51420 b_and!24257)))

(declare-fun b!864225 () Bool)

(declare-fun e!481456 () Bool)

(declare-fun e!481457 () Bool)

(assert (=> b!864225 (= e!481456 (not e!481457))))

(declare-fun res!587252 () Bool)

(assert (=> b!864225 (=> res!587252 e!481457)))

(declare-datatypes ((array!49712 0))(
  ( (array!49713 (arr!23887 (Array (_ BitVec 32) (_ BitVec 64))) (size!24327 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49712)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!864225 (= res!587252 (not (validKeyInArray!0 (select (arr!23887 _keys!868) from!1053))))))

(declare-datatypes ((V!27413 0))(
  ( (V!27414 (val!8435 Int)) )
))
(declare-datatypes ((tuple2!11170 0))(
  ( (tuple2!11171 (_1!5596 (_ BitVec 64)) (_2!5596 V!27413)) )
))
(declare-datatypes ((List!16975 0))(
  ( (Nil!16972) (Cons!16971 (h!18102 tuple2!11170) (t!23880 List!16975)) )
))
(declare-datatypes ((ListLongMap!9939 0))(
  ( (ListLongMap!9940 (toList!4985 List!16975)) )
))
(declare-fun lt!390989 () ListLongMap!9939)

(declare-fun lt!390992 () ListLongMap!9939)

(assert (=> b!864225 (= lt!390989 lt!390992)))

(declare-fun lt!390987 () ListLongMap!9939)

(declare-fun lt!390993 () tuple2!11170)

(declare-fun +!2334 (ListLongMap!9939 tuple2!11170) ListLongMap!9939)

(assert (=> b!864225 (= lt!390992 (+!2334 lt!390987 lt!390993))))

(declare-fun defaultEntry!696 () Int)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((ValueCell!7948 0))(
  ( (ValueCellFull!7948 (v!10860 V!27413)) (EmptyCell!7948) )
))
(declare-datatypes ((array!49714 0))(
  ( (array!49715 (arr!23888 (Array (_ BitVec 32) ValueCell!7948)) (size!24328 (_ BitVec 32))) )
))
(declare-fun lt!390988 () array!49714)

(declare-fun minValue!654 () V!27413)

(declare-fun zeroValue!654 () V!27413)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!2958 (array!49712 array!49714 (_ BitVec 32) (_ BitVec 32) V!27413 V!27413 (_ BitVec 32) Int) ListLongMap!9939)

(assert (=> b!864225 (= lt!390989 (getCurrentListMapNoExtraKeys!2958 _keys!868 lt!390988 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun v!557 () V!27413)

(assert (=> b!864225 (= lt!390993 (tuple2!11171 k!854 v!557))))

(declare-fun _values!688 () array!49714)

(assert (=> b!864225 (= lt!390987 (getCurrentListMapNoExtraKeys!2958 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-datatypes ((Unit!29561 0))(
  ( (Unit!29562) )
))
(declare-fun lt!390998 () Unit!29561)

(declare-fun i!612 () (_ BitVec 32))

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!538 (array!49712 array!49714 (_ BitVec 32) (_ BitVec 32) V!27413 V!27413 (_ BitVec 32) (_ BitVec 64) V!27413 (_ BitVec 32) Int) Unit!29561)

(assert (=> b!864225 (= lt!390998 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!538 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapNonEmpty!26762 () Bool)

(declare-fun mapRes!26762 () Bool)

(declare-fun tp!51421 () Bool)

(declare-fun e!481459 () Bool)

(assert (=> mapNonEmpty!26762 (= mapRes!26762 (and tp!51421 e!481459))))

(declare-fun mapRest!26762 () (Array (_ BitVec 32) ValueCell!7948))

(declare-fun mapKey!26762 () (_ BitVec 32))

(declare-fun mapValue!26762 () ValueCell!7948)

(assert (=> mapNonEmpty!26762 (= (arr!23888 _values!688) (store mapRest!26762 mapKey!26762 mapValue!26762))))

(declare-fun b!864226 () Bool)

(declare-fun res!587243 () Bool)

(declare-fun e!481455 () Bool)

(assert (=> b!864226 (=> (not res!587243) (not e!481455))))

(assert (=> b!864226 (= res!587243 (validKeyInArray!0 k!854))))

(declare-fun b!864227 () Bool)

(declare-fun res!587251 () Bool)

(assert (=> b!864227 (=> (not res!587251) (not e!481455))))

(assert (=> b!864227 (= res!587251 (and (= (select (arr!23887 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!864228 () Bool)

(declare-fun e!481451 () Unit!29561)

(declare-fun Unit!29563 () Unit!29561)

(assert (=> b!864228 (= e!481451 Unit!29563)))

(declare-fun lt!390995 () Unit!29561)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49712 (_ BitVec 32) (_ BitVec 32)) Unit!29561)

(assert (=> b!864228 (= lt!390995 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-datatypes ((List!16976 0))(
  ( (Nil!16973) (Cons!16972 (h!18103 (_ BitVec 64)) (t!23881 List!16976)) )
))
(declare-fun arrayNoDuplicates!0 (array!49712 (_ BitVec 32) List!16976) Bool)

(assert (=> b!864228 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!16973)))

(declare-fun lt!390999 () Unit!29561)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49712 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29561)

(assert (=> b!864228 (= lt!390999 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!49712 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!864228 (arrayContainsKey!0 _keys!868 k!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!390997 () Unit!29561)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!49712 (_ BitVec 64) (_ BitVec 32) List!16976) Unit!29561)

(assert (=> b!864228 (= lt!390997 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k!854 from!1053 Nil!16973))))

(assert (=> b!864228 false))

(declare-fun mapIsEmpty!26762 () Bool)

(assert (=> mapIsEmpty!26762 mapRes!26762))

(declare-fun b!864229 () Bool)

(declare-fun res!587242 () Bool)

(assert (=> b!864229 (=> (not res!587242) (not e!481455))))

(assert (=> b!864229 (= res!587242 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24327 _keys!868))))))

(declare-fun b!864230 () Bool)

(declare-fun e!481452 () Bool)

(assert (=> b!864230 (= e!481457 e!481452)))

(declare-fun res!587245 () Bool)

(assert (=> b!864230 (=> res!587245 e!481452)))

(assert (=> b!864230 (= res!587245 (= k!854 (select (arr!23887 _keys!868) from!1053)))))

(assert (=> b!864230 (not (= (select (arr!23887 _keys!868) from!1053) k!854))))

(declare-fun lt!390994 () Unit!29561)

(assert (=> b!864230 (= lt!390994 e!481451)))

(declare-fun c!92179 () Bool)

(assert (=> b!864230 (= c!92179 (= (select (arr!23887 _keys!868) from!1053) k!854))))

(declare-fun lt!390985 () ListLongMap!9939)

(declare-fun lt!391000 () ListLongMap!9939)

(assert (=> b!864230 (= lt!390985 lt!391000)))

(declare-fun lt!390986 () tuple2!11170)

(assert (=> b!864230 (= lt!391000 (+!2334 lt!390992 lt!390986))))

(declare-fun lt!390991 () V!27413)

(assert (=> b!864230 (= lt!390986 (tuple2!11171 (select (arr!23887 _keys!868) from!1053) lt!390991))))

(declare-fun get!12616 (ValueCell!7948 V!27413) V!27413)

(declare-fun dynLambda!1160 (Int (_ BitVec 64)) V!27413)

(assert (=> b!864230 (= lt!390991 (get!12616 (select (arr!23888 _values!688) from!1053) (dynLambda!1160 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!864231 () Bool)

(declare-fun tp_is_empty!16775 () Bool)

(assert (=> b!864231 (= e!481459 tp_is_empty!16775)))

(declare-fun b!864232 () Bool)

(declare-fun Unit!29564 () Unit!29561)

(assert (=> b!864232 (= e!481451 Unit!29564)))

(declare-fun b!864233 () Bool)

(declare-fun e!481454 () Bool)

(declare-fun e!481453 () Bool)

(assert (=> b!864233 (= e!481454 (and e!481453 mapRes!26762))))

(declare-fun condMapEmpty!26762 () Bool)

(declare-fun mapDefault!26762 () ValueCell!7948)

