; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73742 () Bool)

(assert start!73742)

(declare-fun b_free!14657 () Bool)

(declare-fun b_next!14657 () Bool)

(assert (=> start!73742 (= b_free!14657 (not b_next!14657))))

(declare-fun tp!51475 () Bool)

(declare-fun b_and!24293 () Bool)

(assert (=> start!73742 (= tp!51475 b_and!24293)))

(declare-fun b!864675 () Bool)

(declare-fun e!481702 () Bool)

(declare-fun e!481700 () Bool)

(assert (=> b!864675 (= e!481702 (not e!481700))))

(declare-fun res!587544 () Bool)

(assert (=> b!864675 (=> res!587544 e!481700)))

(declare-datatypes ((array!49746 0))(
  ( (array!49747 (arr!23904 (Array (_ BitVec 32) (_ BitVec 64))) (size!24344 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49746)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!864675 (= res!587544 (not (validKeyInArray!0 (select (arr!23904 _keys!868) from!1053))))))

(declare-datatypes ((V!27437 0))(
  ( (V!27438 (val!8444 Int)) )
))
(declare-datatypes ((tuple2!11184 0))(
  ( (tuple2!11185 (_1!5603 (_ BitVec 64)) (_2!5603 V!27437)) )
))
(declare-datatypes ((List!16988 0))(
  ( (Nil!16985) (Cons!16984 (h!18115 tuple2!11184) (t!23911 List!16988)) )
))
(declare-datatypes ((ListLongMap!9953 0))(
  ( (ListLongMap!9954 (toList!4992 List!16988)) )
))
(declare-fun lt!391431 () ListLongMap!9953)

(declare-fun lt!391423 () ListLongMap!9953)

(assert (=> b!864675 (= lt!391431 lt!391423)))

(declare-fun lt!391419 () ListLongMap!9953)

(declare-fun lt!391420 () tuple2!11184)

(declare-fun +!2341 (ListLongMap!9953 tuple2!11184) ListLongMap!9953)

(assert (=> b!864675 (= lt!391423 (+!2341 lt!391419 lt!391420))))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun minValue!654 () V!27437)

(declare-fun zeroValue!654 () V!27437)

(declare-datatypes ((ValueCell!7957 0))(
  ( (ValueCellFull!7957 (v!10869 V!27437)) (EmptyCell!7957) )
))
(declare-datatypes ((array!49748 0))(
  ( (array!49749 (arr!23905 (Array (_ BitVec 32) ValueCell!7957)) (size!24345 (_ BitVec 32))) )
))
(declare-fun lt!391428 () array!49748)

(declare-fun getCurrentListMapNoExtraKeys!2964 (array!49746 array!49748 (_ BitVec 32) (_ BitVec 32) V!27437 V!27437 (_ BitVec 32) Int) ListLongMap!9953)

(assert (=> b!864675 (= lt!391431 (getCurrentListMapNoExtraKeys!2964 _keys!868 lt!391428 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun v!557 () V!27437)

(assert (=> b!864675 (= lt!391420 (tuple2!11185 k!854 v!557))))

(declare-fun _values!688 () array!49748)

(assert (=> b!864675 (= lt!391419 (getCurrentListMapNoExtraKeys!2964 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((Unit!29590 0))(
  ( (Unit!29591) )
))
(declare-fun lt!391427 () Unit!29590)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!544 (array!49746 array!49748 (_ BitVec 32) (_ BitVec 32) V!27437 V!27437 (_ BitVec 32) (_ BitVec 64) V!27437 (_ BitVec 32) Int) Unit!29590)

(assert (=> b!864675 (= lt!391427 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!544 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!864676 () Bool)

(declare-fun e!481699 () Bool)

(assert (=> b!864676 (= e!481699 e!481702)))

(declare-fun res!587540 () Bool)

(assert (=> b!864676 (=> (not res!587540) (not e!481702))))

(assert (=> b!864676 (= res!587540 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!391429 () ListLongMap!9953)

(assert (=> b!864676 (= lt!391429 (getCurrentListMapNoExtraKeys!2964 _keys!868 lt!391428 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!864676 (= lt!391428 (array!49749 (store (arr!23905 _values!688) i!612 (ValueCellFull!7957 v!557)) (size!24345 _values!688)))))

(declare-fun lt!391418 () ListLongMap!9953)

(assert (=> b!864676 (= lt!391418 (getCurrentListMapNoExtraKeys!2964 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun mapNonEmpty!26789 () Bool)

(declare-fun mapRes!26789 () Bool)

(declare-fun tp!51474 () Bool)

(declare-fun e!481694 () Bool)

(assert (=> mapNonEmpty!26789 (= mapRes!26789 (and tp!51474 e!481694))))

(declare-fun mapKey!26789 () (_ BitVec 32))

(declare-fun mapValue!26789 () ValueCell!7957)

(declare-fun mapRest!26789 () (Array (_ BitVec 32) ValueCell!7957))

(assert (=> mapNonEmpty!26789 (= (arr!23905 _values!688) (store mapRest!26789 mapKey!26789 mapValue!26789))))

(declare-fun b!864678 () Bool)

(declare-fun e!481698 () Bool)

(assert (=> b!864678 (= e!481700 e!481698)))

(declare-fun res!587547 () Bool)

(assert (=> b!864678 (=> res!587547 e!481698)))

(assert (=> b!864678 (= res!587547 (= k!854 (select (arr!23904 _keys!868) from!1053)))))

(assert (=> b!864678 (not (= (select (arr!23904 _keys!868) from!1053) k!854))))

(declare-fun lt!391425 () Unit!29590)

(declare-fun e!481697 () Unit!29590)

(assert (=> b!864678 (= lt!391425 e!481697)))

(declare-fun c!92206 () Bool)

(assert (=> b!864678 (= c!92206 (= (select (arr!23904 _keys!868) from!1053) k!854))))

(declare-fun lt!391424 () ListLongMap!9953)

(assert (=> b!864678 (= lt!391429 lt!391424)))

(declare-fun lt!391417 () tuple2!11184)

(assert (=> b!864678 (= lt!391424 (+!2341 lt!391423 lt!391417))))

(declare-fun lt!391430 () V!27437)

(assert (=> b!864678 (= lt!391417 (tuple2!11185 (select (arr!23904 _keys!868) from!1053) lt!391430))))

(declare-fun get!12628 (ValueCell!7957 V!27437) V!27437)

(declare-fun dynLambda!1166 (Int (_ BitVec 64)) V!27437)

(assert (=> b!864678 (= lt!391430 (get!12628 (select (arr!23905 _values!688) from!1053) (dynLambda!1166 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!864679 () Bool)

(declare-fun res!587543 () Bool)

(assert (=> b!864679 (=> (not res!587543) (not e!481699))))

(assert (=> b!864679 (= res!587543 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24344 _keys!868))))))

(declare-fun b!864680 () Bool)

(assert (=> b!864680 (= e!481698 true)))

(assert (=> b!864680 (= lt!391424 (+!2341 (+!2341 lt!391419 lt!391417) lt!391420))))

(declare-fun lt!391421 () Unit!29590)

(declare-fun addCommutativeForDiffKeys!512 (ListLongMap!9953 (_ BitVec 64) V!27437 (_ BitVec 64) V!27437) Unit!29590)

(assert (=> b!864680 (= lt!391421 (addCommutativeForDiffKeys!512 lt!391419 k!854 v!557 (select (arr!23904 _keys!868) from!1053) lt!391430))))

(declare-fun b!864681 () Bool)

(declare-fun Unit!29592 () Unit!29590)

(assert (=> b!864681 (= e!481697 Unit!29592)))

(declare-fun lt!391422 () Unit!29590)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49746 (_ BitVec 32) (_ BitVec 32)) Unit!29590)

(assert (=> b!864681 (= lt!391422 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-datatypes ((List!16989 0))(
  ( (Nil!16986) (Cons!16985 (h!18116 (_ BitVec 64)) (t!23912 List!16989)) )
))
(declare-fun arrayNoDuplicates!0 (array!49746 (_ BitVec 32) List!16989) Bool)

(assert (=> b!864681 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!16986)))

(declare-fun lt!391432 () Unit!29590)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49746 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29590)

(assert (=> b!864681 (= lt!391432 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!49746 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!864681 (arrayContainsKey!0 _keys!868 k!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!391426 () Unit!29590)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!49746 (_ BitVec 64) (_ BitVec 32) List!16989) Unit!29590)

(assert (=> b!864681 (= lt!391426 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k!854 from!1053 Nil!16986))))

(assert (=> b!864681 false))

(declare-fun b!864682 () Bool)

(declare-fun e!481696 () Bool)

(declare-fun e!481701 () Bool)

(assert (=> b!864682 (= e!481696 (and e!481701 mapRes!26789))))

(declare-fun condMapEmpty!26789 () Bool)

(declare-fun mapDefault!26789 () ValueCell!7957)

