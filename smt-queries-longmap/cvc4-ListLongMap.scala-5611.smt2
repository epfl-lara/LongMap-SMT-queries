; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73454 () Bool)

(assert start!73454)

(declare-fun b_free!14369 () Bool)

(declare-fun b_next!14369 () Bool)

(assert (=> start!73454 (= b_free!14369 (not b_next!14369))))

(declare-fun tp!50610 () Bool)

(declare-fun b_and!23725 () Bool)

(assert (=> start!73454 (= tp!50610 b_and!23725)))

(declare-fun mapIsEmpty!26357 () Bool)

(declare-fun mapRes!26357 () Bool)

(assert (=> mapIsEmpty!26357 mapRes!26357))

(declare-fun b!857766 () Bool)

(declare-fun res!582691 () Bool)

(declare-fun e!478064 () Bool)

(assert (=> b!857766 (=> (not res!582691) (not e!478064))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k!854 () (_ BitVec 64))

(declare-datatypes ((array!49200 0))(
  ( (array!49201 (arr!23631 (Array (_ BitVec 32) (_ BitVec 64))) (size!24071 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49200)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!857766 (= res!582691 (and (= (select (arr!23631 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!857767 () Bool)

(declare-fun e!478066 () Bool)

(declare-fun tp_is_empty!16505 () Bool)

(assert (=> b!857767 (= e!478066 tp_is_empty!16505)))

(declare-fun b!857768 () Bool)

(declare-fun e!478063 () Bool)

(assert (=> b!857768 (= e!478064 e!478063)))

(declare-fun res!582694 () Bool)

(assert (=> b!857768 (=> (not res!582694) (not e!478063))))

(assert (=> b!857768 (= res!582694 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((V!27053 0))(
  ( (V!27054 (val!8300 Int)) )
))
(declare-datatypes ((ValueCell!7813 0))(
  ( (ValueCellFull!7813 (v!10725 V!27053)) (EmptyCell!7813) )
))
(declare-datatypes ((array!49202 0))(
  ( (array!49203 (arr!23632 (Array (_ BitVec 32) ValueCell!7813)) (size!24072 (_ BitVec 32))) )
))
(declare-fun lt!386398 () array!49202)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((tuple2!10952 0))(
  ( (tuple2!10953 (_1!5487 (_ BitVec 64)) (_2!5487 V!27053)) )
))
(declare-datatypes ((List!16760 0))(
  ( (Nil!16757) (Cons!16756 (h!17887 tuple2!10952) (t!23401 List!16760)) )
))
(declare-datatypes ((ListLongMap!9721 0))(
  ( (ListLongMap!9722 (toList!4876 List!16760)) )
))
(declare-fun lt!386401 () ListLongMap!9721)

(declare-fun minValue!654 () V!27053)

(declare-fun zeroValue!654 () V!27053)

(declare-fun getCurrentListMapNoExtraKeys!2857 (array!49200 array!49202 (_ BitVec 32) (_ BitVec 32) V!27053 V!27053 (_ BitVec 32) Int) ListLongMap!9721)

(assert (=> b!857768 (= lt!386401 (getCurrentListMapNoExtraKeys!2857 _keys!868 lt!386398 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27053)

(declare-fun _values!688 () array!49202)

(assert (=> b!857768 (= lt!386398 (array!49203 (store (arr!23632 _values!688) i!612 (ValueCellFull!7813 v!557)) (size!24072 _values!688)))))

(declare-fun lt!386399 () ListLongMap!9721)

(assert (=> b!857768 (= lt!386399 (getCurrentListMapNoExtraKeys!2857 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!857769 () Bool)

(declare-fun e!478062 () Bool)

(assert (=> b!857769 (= e!478062 tp_is_empty!16505)))

(declare-fun b!857770 () Bool)

(declare-fun res!582696 () Bool)

(assert (=> b!857770 (=> (not res!582696) (not e!478064))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!857770 (= res!582696 (validKeyInArray!0 k!854))))

(declare-fun res!582692 () Bool)

(assert (=> start!73454 (=> (not res!582692) (not e!478064))))

(assert (=> start!73454 (= res!582692 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24071 _keys!868))))))

(assert (=> start!73454 e!478064))

(assert (=> start!73454 tp_is_empty!16505))

(assert (=> start!73454 true))

(assert (=> start!73454 tp!50610))

(declare-fun array_inv!18716 (array!49200) Bool)

(assert (=> start!73454 (array_inv!18716 _keys!868)))

(declare-fun e!478061 () Bool)

(declare-fun array_inv!18717 (array!49202) Bool)

(assert (=> start!73454 (and (array_inv!18717 _values!688) e!478061)))

(declare-fun b!857771 () Bool)

(declare-fun res!582693 () Bool)

(assert (=> b!857771 (=> (not res!582693) (not e!478064))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49200 (_ BitVec 32)) Bool)

(assert (=> b!857771 (= res!582693 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!857772 () Bool)

(declare-fun res!582697 () Bool)

(assert (=> b!857772 (=> (not res!582697) (not e!478064))))

(declare-datatypes ((List!16761 0))(
  ( (Nil!16758) (Cons!16757 (h!17888 (_ BitVec 64)) (t!23402 List!16761)) )
))
(declare-fun arrayNoDuplicates!0 (array!49200 (_ BitVec 32) List!16761) Bool)

(assert (=> b!857772 (= res!582697 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16758))))

(declare-fun b!857773 () Bool)

(assert (=> b!857773 (= e!478063 (not true))))

(declare-fun +!2230 (ListLongMap!9721 tuple2!10952) ListLongMap!9721)

(assert (=> b!857773 (= (getCurrentListMapNoExtraKeys!2857 _keys!868 lt!386398 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2230 (getCurrentListMapNoExtraKeys!2857 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!10953 k!854 v!557)))))

(declare-datatypes ((Unit!29247 0))(
  ( (Unit!29248) )
))
(declare-fun lt!386400 () Unit!29247)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!451 (array!49200 array!49202 (_ BitVec 32) (_ BitVec 32) V!27053 V!27053 (_ BitVec 32) (_ BitVec 64) V!27053 (_ BitVec 32) Int) Unit!29247)

(assert (=> b!857773 (= lt!386400 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!451 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!857774 () Bool)

(assert (=> b!857774 (= e!478061 (and e!478066 mapRes!26357))))

(declare-fun condMapEmpty!26357 () Bool)

(declare-fun mapDefault!26357 () ValueCell!7813)

