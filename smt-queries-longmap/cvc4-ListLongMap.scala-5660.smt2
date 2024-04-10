; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73748 () Bool)

(assert start!73748)

(declare-fun b_free!14663 () Bool)

(declare-fun b_next!14663 () Bool)

(assert (=> start!73748 (= b_free!14663 (not b_next!14663))))

(declare-fun tp!51492 () Bool)

(declare-fun b_and!24305 () Bool)

(assert (=> start!73748 (= tp!51492 b_and!24305)))

(declare-fun b!864825 () Bool)

(declare-fun res!587648 () Bool)

(declare-fun e!481782 () Bool)

(assert (=> b!864825 (=> (not res!587648) (not e!481782))))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!864825 (= res!587648 (validKeyInArray!0 k!854))))

(declare-fun res!587647 () Bool)

(assert (=> start!73748 (=> (not res!587647) (not e!481782))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!49758 0))(
  ( (array!49759 (arr!23910 (Array (_ BitVec 32) (_ BitVec 64))) (size!24350 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49758)

(assert (=> start!73748 (= res!587647 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24350 _keys!868))))))

(assert (=> start!73748 e!481782))

(declare-fun tp_is_empty!16799 () Bool)

(assert (=> start!73748 tp_is_empty!16799))

(assert (=> start!73748 true))

(assert (=> start!73748 tp!51492))

(declare-fun array_inv!18904 (array!49758) Bool)

(assert (=> start!73748 (array_inv!18904 _keys!868)))

(declare-datatypes ((V!27445 0))(
  ( (V!27446 (val!8447 Int)) )
))
(declare-datatypes ((ValueCell!7960 0))(
  ( (ValueCellFull!7960 (v!10872 V!27445)) (EmptyCell!7960) )
))
(declare-datatypes ((array!49760 0))(
  ( (array!49761 (arr!23911 (Array (_ BitVec 32) ValueCell!7960)) (size!24351 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49760)

(declare-fun e!481780 () Bool)

(declare-fun array_inv!18905 (array!49760) Bool)

(assert (=> start!73748 (and (array_inv!18905 _values!688) e!481780)))

(declare-fun b!864826 () Bool)

(declare-fun e!481778 () Bool)

(assert (=> b!864826 (= e!481778 tp_is_empty!16799)))

(declare-fun mapNonEmpty!26798 () Bool)

(declare-fun mapRes!26798 () Bool)

(declare-fun tp!51493 () Bool)

(declare-fun e!481783 () Bool)

(assert (=> mapNonEmpty!26798 (= mapRes!26798 (and tp!51493 e!481783))))

(declare-fun mapKey!26798 () (_ BitVec 32))

(declare-fun mapValue!26798 () ValueCell!7960)

(declare-fun mapRest!26798 () (Array (_ BitVec 32) ValueCell!7960))

(assert (=> mapNonEmpty!26798 (= (arr!23911 _values!688) (store mapRest!26798 mapKey!26798 mapValue!26798))))

(declare-fun b!864827 () Bool)

(declare-datatypes ((Unit!29599 0))(
  ( (Unit!29600) )
))
(declare-fun e!481781 () Unit!29599)

(declare-fun Unit!29601 () Unit!29599)

(assert (=> b!864827 (= e!481781 Unit!29601)))

(declare-fun lt!391574 () Unit!29599)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49758 (_ BitVec 32) (_ BitVec 32)) Unit!29599)

(assert (=> b!864827 (= lt!391574 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-datatypes ((List!16993 0))(
  ( (Nil!16990) (Cons!16989 (h!18120 (_ BitVec 64)) (t!23922 List!16993)) )
))
(declare-fun arrayNoDuplicates!0 (array!49758 (_ BitVec 32) List!16993) Bool)

(assert (=> b!864827 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!16990)))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun lt!391566 () Unit!29599)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49758 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29599)

(assert (=> b!864827 (= lt!391566 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!49758 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!864827 (arrayContainsKey!0 _keys!868 k!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!391568 () Unit!29599)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!49758 (_ BitVec 64) (_ BitVec 32) List!16993) Unit!29599)

(assert (=> b!864827 (= lt!391568 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k!854 from!1053 Nil!16990))))

(assert (=> b!864827 false))

(declare-fun mapIsEmpty!26798 () Bool)

(assert (=> mapIsEmpty!26798 mapRes!26798))

(declare-fun b!864828 () Bool)

(declare-fun res!587646 () Bool)

(assert (=> b!864828 (=> (not res!587646) (not e!481782))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(assert (=> b!864828 (= res!587646 (and (= (size!24351 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24350 _keys!868) (size!24351 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!864829 () Bool)

(declare-fun res!587643 () Bool)

(assert (=> b!864829 (=> (not res!587643) (not e!481782))))

(assert (=> b!864829 (= res!587643 (and (= (select (arr!23910 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!864830 () Bool)

(declare-fun e!481776 () Bool)

(assert (=> b!864830 (= e!481776 true)))

(declare-datatypes ((tuple2!11190 0))(
  ( (tuple2!11191 (_1!5606 (_ BitVec 64)) (_2!5606 V!27445)) )
))
(declare-datatypes ((List!16994 0))(
  ( (Nil!16991) (Cons!16990 (h!18121 tuple2!11190) (t!23923 List!16994)) )
))
(declare-datatypes ((ListLongMap!9959 0))(
  ( (ListLongMap!9960 (toList!4995 List!16994)) )
))
(declare-fun lt!391570 () ListLongMap!9959)

(declare-fun lt!391564 () ListLongMap!9959)

(declare-fun lt!391562 () tuple2!11190)

(declare-fun lt!391575 () tuple2!11190)

(declare-fun +!2344 (ListLongMap!9959 tuple2!11190) ListLongMap!9959)

(assert (=> b!864830 (= lt!391564 (+!2344 (+!2344 lt!391570 lt!391575) lt!391562))))

(declare-fun lt!391576 () Unit!29599)

(declare-fun v!557 () V!27445)

(declare-fun lt!391561 () V!27445)

(declare-fun addCommutativeForDiffKeys!514 (ListLongMap!9959 (_ BitVec 64) V!27445 (_ BitVec 64) V!27445) Unit!29599)

(assert (=> b!864830 (= lt!391576 (addCommutativeForDiffKeys!514 lt!391570 k!854 v!557 (select (arr!23910 _keys!868) from!1053) lt!391561))))

(declare-fun b!864831 () Bool)

(declare-fun e!481779 () Bool)

(declare-fun e!481777 () Bool)

(assert (=> b!864831 (= e!481779 (not e!481777))))

(declare-fun res!587640 () Bool)

(assert (=> b!864831 (=> res!587640 e!481777)))

(assert (=> b!864831 (= res!587640 (not (validKeyInArray!0 (select (arr!23910 _keys!868) from!1053))))))

(declare-fun lt!391569 () ListLongMap!9959)

(declare-fun lt!391567 () ListLongMap!9959)

(assert (=> b!864831 (= lt!391569 lt!391567)))

(assert (=> b!864831 (= lt!391567 (+!2344 lt!391570 lt!391562))))

(declare-fun defaultEntry!696 () Int)

(declare-fun lt!391565 () array!49760)

(declare-fun minValue!654 () V!27445)

(declare-fun zeroValue!654 () V!27445)

(declare-fun getCurrentListMapNoExtraKeys!2966 (array!49758 array!49760 (_ BitVec 32) (_ BitVec 32) V!27445 V!27445 (_ BitVec 32) Int) ListLongMap!9959)

(assert (=> b!864831 (= lt!391569 (getCurrentListMapNoExtraKeys!2966 _keys!868 lt!391565 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!864831 (= lt!391562 (tuple2!11191 k!854 v!557))))

(assert (=> b!864831 (= lt!391570 (getCurrentListMapNoExtraKeys!2966 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!391573 () Unit!29599)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!546 (array!49758 array!49760 (_ BitVec 32) (_ BitVec 32) V!27445 V!27445 (_ BitVec 32) (_ BitVec 64) V!27445 (_ BitVec 32) Int) Unit!29599)

(assert (=> b!864831 (= lt!391573 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!546 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!864832 () Bool)

(assert (=> b!864832 (= e!481780 (and e!481778 mapRes!26798))))

(declare-fun condMapEmpty!26798 () Bool)

(declare-fun mapDefault!26798 () ValueCell!7960)

