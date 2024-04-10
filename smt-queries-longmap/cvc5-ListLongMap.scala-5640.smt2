; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73624 () Bool)

(assert start!73624)

(declare-fun b_free!14539 () Bool)

(declare-fun b_next!14539 () Bool)

(assert (=> start!73624 (= b_free!14539 (not b_next!14539))))

(declare-fun tp!51121 () Bool)

(declare-fun b_and!24057 () Bool)

(assert (=> start!73624 (= tp!51121 b_and!24057)))

(declare-fun b!861750 () Bool)

(declare-fun e!480131 () Bool)

(declare-fun tp_is_empty!16675 () Bool)

(assert (=> b!861750 (= e!480131 tp_is_empty!16675)))

(declare-fun b!861751 () Bool)

(declare-fun res!585617 () Bool)

(declare-fun e!480126 () Bool)

(assert (=> b!861751 (=> (not res!585617) (not e!480126))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!49514 0))(
  ( (array!49515 (arr!23788 (Array (_ BitVec 32) (_ BitVec 64))) (size!24228 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49514)

(declare-datatypes ((V!27281 0))(
  ( (V!27282 (val!8385 Int)) )
))
(declare-datatypes ((ValueCell!7898 0))(
  ( (ValueCellFull!7898 (v!10810 V!27281)) (EmptyCell!7898) )
))
(declare-datatypes ((array!49516 0))(
  ( (array!49517 (arr!23789 (Array (_ BitVec 32) ValueCell!7898)) (size!24229 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49516)

(assert (=> b!861751 (= res!585617 (and (= (size!24229 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24228 _keys!868) (size!24229 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!861752 () Bool)

(declare-fun res!585619 () Bool)

(assert (=> b!861752 (=> (not res!585619) (not e!480126))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49514 (_ BitVec 32)) Bool)

(assert (=> b!861752 (= res!585619 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!861753 () Bool)

(declare-fun res!585623 () Bool)

(assert (=> b!861753 (=> (not res!585623) (not e!480126))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!861753 (= res!585623 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24228 _keys!868))))))

(declare-fun b!861754 () Bool)

(declare-fun e!480133 () Bool)

(assert (=> b!861754 (= e!480126 e!480133)))

(declare-fun res!585625 () Bool)

(assert (=> b!861754 (=> (not res!585625) (not e!480133))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!861754 (= res!585625 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun defaultEntry!696 () Int)

(declare-fun lt!388712 () array!49516)

(declare-fun minValue!654 () V!27281)

(declare-datatypes ((tuple2!11084 0))(
  ( (tuple2!11085 (_1!5553 (_ BitVec 64)) (_2!5553 V!27281)) )
))
(declare-datatypes ((List!16893 0))(
  ( (Nil!16890) (Cons!16889 (h!18020 tuple2!11084) (t!23698 List!16893)) )
))
(declare-datatypes ((ListLongMap!9853 0))(
  ( (ListLongMap!9854 (toList!4942 List!16893)) )
))
(declare-fun lt!388711 () ListLongMap!9853)

(declare-fun zeroValue!654 () V!27281)

(declare-fun getCurrentListMapNoExtraKeys!2918 (array!49514 array!49516 (_ BitVec 32) (_ BitVec 32) V!27281 V!27281 (_ BitVec 32) Int) ListLongMap!9853)

(assert (=> b!861754 (= lt!388711 (getCurrentListMapNoExtraKeys!2918 _keys!868 lt!388712 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27281)

(assert (=> b!861754 (= lt!388712 (array!49517 (store (arr!23789 _values!688) i!612 (ValueCellFull!7898 v!557)) (size!24229 _values!688)))))

(declare-fun lt!388716 () ListLongMap!9853)

(assert (=> b!861754 (= lt!388716 (getCurrentListMapNoExtraKeys!2918 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!861755 () Bool)

(declare-fun res!585618 () Bool)

(assert (=> b!861755 (=> (not res!585618) (not e!480126))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!861755 (= res!585618 (validMask!0 mask!1196))))

(declare-fun mapNonEmpty!26612 () Bool)

(declare-fun mapRes!26612 () Bool)

(declare-fun tp!51120 () Bool)

(assert (=> mapNonEmpty!26612 (= mapRes!26612 (and tp!51120 e!480131))))

(declare-fun mapValue!26612 () ValueCell!7898)

(declare-fun mapKey!26612 () (_ BitVec 32))

(declare-fun mapRest!26612 () (Array (_ BitVec 32) ValueCell!7898))

(assert (=> mapNonEmpty!26612 (= (arr!23789 _values!688) (store mapRest!26612 mapKey!26612 mapValue!26612))))

(declare-fun b!861756 () Bool)

(declare-fun res!585621 () Bool)

(assert (=> b!861756 (=> (not res!585621) (not e!480126))))

(declare-fun k!854 () (_ BitVec 64))

(assert (=> b!861756 (= res!585621 (and (= (select (arr!23788 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!861757 () Bool)

(declare-fun e!480127 () Bool)

(assert (=> b!861757 (= e!480133 (not e!480127))))

(declare-fun res!585622 () Bool)

(assert (=> b!861757 (=> res!585622 e!480127)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!861757 (= res!585622 (not (validKeyInArray!0 (select (arr!23788 _keys!868) from!1053))))))

(declare-fun lt!388715 () ListLongMap!9853)

(declare-fun lt!388720 () ListLongMap!9853)

(assert (=> b!861757 (= lt!388715 lt!388720)))

(declare-fun lt!388719 () ListLongMap!9853)

(declare-fun +!2292 (ListLongMap!9853 tuple2!11084) ListLongMap!9853)

(assert (=> b!861757 (= lt!388720 (+!2292 lt!388719 (tuple2!11085 k!854 v!557)))))

(assert (=> b!861757 (= lt!388715 (getCurrentListMapNoExtraKeys!2918 _keys!868 lt!388712 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!861757 (= lt!388719 (getCurrentListMapNoExtraKeys!2918 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-datatypes ((Unit!29401 0))(
  ( (Unit!29402) )
))
(declare-fun lt!388718 () Unit!29401)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!502 (array!49514 array!49516 (_ BitVec 32) (_ BitVec 32) V!27281 V!27281 (_ BitVec 32) (_ BitVec 64) V!27281 (_ BitVec 32) Int) Unit!29401)

(assert (=> b!861757 (= lt!388718 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!502 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!861758 () Bool)

(declare-fun e!480132 () Unit!29401)

(declare-fun Unit!29403 () Unit!29401)

(assert (=> b!861758 (= e!480132 Unit!29403)))

(declare-fun b!861759 () Bool)

(assert (=> b!861759 (= e!480127 true)))

(assert (=> b!861759 (not (= (select (arr!23788 _keys!868) from!1053) k!854))))

(declare-fun lt!388717 () Unit!29401)

(assert (=> b!861759 (= lt!388717 e!480132)))

(declare-fun c!92029 () Bool)

(assert (=> b!861759 (= c!92029 (= (select (arr!23788 _keys!868) from!1053) k!854))))

(declare-fun get!12552 (ValueCell!7898 V!27281) V!27281)

(declare-fun dynLambda!1128 (Int (_ BitVec 64)) V!27281)

(assert (=> b!861759 (= lt!388711 (+!2292 lt!388720 (tuple2!11085 (select (arr!23788 _keys!868) from!1053) (get!12552 (select (arr!23789 _values!688) from!1053) (dynLambda!1128 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!861760 () Bool)

(declare-fun Unit!29404 () Unit!29401)

(assert (=> b!861760 (= e!480132 Unit!29404)))

(declare-fun lt!388710 () Unit!29401)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49514 (_ BitVec 32) (_ BitVec 32)) Unit!29401)

(assert (=> b!861760 (= lt!388710 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-datatypes ((List!16894 0))(
  ( (Nil!16891) (Cons!16890 (h!18021 (_ BitVec 64)) (t!23699 List!16894)) )
))
(declare-fun arrayNoDuplicates!0 (array!49514 (_ BitVec 32) List!16894) Bool)

(assert (=> b!861760 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!16891)))

(declare-fun lt!388714 () Unit!29401)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49514 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29401)

(assert (=> b!861760 (= lt!388714 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!49514 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!861760 (arrayContainsKey!0 _keys!868 k!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!388713 () Unit!29401)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!49514 (_ BitVec 64) (_ BitVec 32) List!16894) Unit!29401)

(assert (=> b!861760 (= lt!388713 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k!854 from!1053 Nil!16891))))

(assert (=> b!861760 false))

(declare-fun b!861761 () Bool)

(declare-fun e!480130 () Bool)

(assert (=> b!861761 (= e!480130 tp_is_empty!16675)))

(declare-fun b!861762 () Bool)

(declare-fun res!585620 () Bool)

(assert (=> b!861762 (=> (not res!585620) (not e!480126))))

(assert (=> b!861762 (= res!585620 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16891))))

(declare-fun b!861763 () Bool)

(declare-fun res!585624 () Bool)

(assert (=> b!861763 (=> (not res!585624) (not e!480126))))

(assert (=> b!861763 (= res!585624 (validKeyInArray!0 k!854))))

(declare-fun b!861764 () Bool)

(declare-fun e!480129 () Bool)

(assert (=> b!861764 (= e!480129 (and e!480130 mapRes!26612))))

(declare-fun condMapEmpty!26612 () Bool)

(declare-fun mapDefault!26612 () ValueCell!7898)

