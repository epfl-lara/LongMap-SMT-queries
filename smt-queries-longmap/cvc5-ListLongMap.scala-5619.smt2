; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73498 () Bool)

(assert start!73498)

(declare-fun b_free!14413 () Bool)

(declare-fun b_next!14413 () Bool)

(assert (=> start!73498 (= b_free!14413 (not b_next!14413))))

(declare-fun tp!50743 () Bool)

(declare-fun b_and!23805 () Bool)

(assert (=> start!73498 (= tp!50743 b_and!23805)))

(declare-fun b!858670 () Bool)

(declare-fun e!478534 () Bool)

(assert (=> b!858670 (= e!478534 true)))

(declare-datatypes ((array!49282 0))(
  ( (array!49283 (arr!23672 (Array (_ BitVec 32) (_ BitVec 64))) (size!24112 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49282)

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((List!16794 0))(
  ( (Nil!16791) (Cons!16790 (h!17921 (_ BitVec 64)) (t!23473 List!16794)) )
))
(declare-fun arrayNoDuplicates!0 (array!49282 (_ BitVec 32) List!16794) Bool)

(assert (=> b!858670 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!16791)))

(declare-datatypes ((Unit!29275 0))(
  ( (Unit!29276) )
))
(declare-fun lt!386842 () Unit!29275)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49282 (_ BitVec 32) (_ BitVec 32)) Unit!29275)

(assert (=> b!858670 (= lt!386842 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-fun b!858671 () Bool)

(declare-fun res!583367 () Bool)

(declare-fun e!478538 () Bool)

(assert (=> b!858671 (=> (not res!583367) (not e!478538))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((V!27113 0))(
  ( (V!27114 (val!8322 Int)) )
))
(declare-datatypes ((ValueCell!7835 0))(
  ( (ValueCellFull!7835 (v!10747 V!27113)) (EmptyCell!7835) )
))
(declare-datatypes ((array!49284 0))(
  ( (array!49285 (arr!23673 (Array (_ BitVec 32) ValueCell!7835)) (size!24113 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49284)

(assert (=> b!858671 (= res!583367 (and (= (size!24113 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24112 _keys!868) (size!24113 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!858672 () Bool)

(declare-fun e!478540 () Bool)

(declare-fun tp_is_empty!16549 () Bool)

(assert (=> b!858672 (= e!478540 tp_is_empty!16549)))

(declare-fun b!858673 () Bool)

(declare-fun res!583360 () Bool)

(assert (=> b!858673 (=> (not res!583360) (not e!478538))))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!858673 (= res!583360 (validKeyInArray!0 k!854))))

(declare-fun b!858674 () Bool)

(declare-fun res!583362 () Bool)

(assert (=> b!858674 (=> (not res!583362) (not e!478538))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!858674 (= res!583362 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24112 _keys!868))))))

(declare-fun b!858675 () Bool)

(declare-fun e!478537 () Bool)

(assert (=> b!858675 (= e!478537 tp_is_empty!16549)))

(declare-fun b!858676 () Bool)

(declare-fun res!583368 () Bool)

(assert (=> b!858676 (=> (not res!583368) (not e!478538))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!858676 (= res!583368 (validMask!0 mask!1196))))

(declare-fun b!858677 () Bool)

(declare-fun e!478535 () Bool)

(assert (=> b!858677 (= e!478538 e!478535)))

(declare-fun res!583365 () Bool)

(assert (=> b!858677 (=> (not res!583365) (not e!478535))))

(assert (=> b!858677 (= res!583365 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!386845 () array!49284)

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((tuple2!10986 0))(
  ( (tuple2!10987 (_1!5504 (_ BitVec 64)) (_2!5504 V!27113)) )
))
(declare-datatypes ((List!16795 0))(
  ( (Nil!16792) (Cons!16791 (h!17922 tuple2!10986) (t!23474 List!16795)) )
))
(declare-datatypes ((ListLongMap!9755 0))(
  ( (ListLongMap!9756 (toList!4893 List!16795)) )
))
(declare-fun lt!386841 () ListLongMap!9755)

(declare-fun minValue!654 () V!27113)

(declare-fun zeroValue!654 () V!27113)

(declare-fun getCurrentListMapNoExtraKeys!2873 (array!49282 array!49284 (_ BitVec 32) (_ BitVec 32) V!27113 V!27113 (_ BitVec 32) Int) ListLongMap!9755)

(assert (=> b!858677 (= lt!386841 (getCurrentListMapNoExtraKeys!2873 _keys!868 lt!386845 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27113)

(assert (=> b!858677 (= lt!386845 (array!49285 (store (arr!23673 _values!688) i!612 (ValueCellFull!7835 v!557)) (size!24113 _values!688)))))

(declare-fun lt!386843 () ListLongMap!9755)

(assert (=> b!858677 (= lt!386843 (getCurrentListMapNoExtraKeys!2873 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun res!583363 () Bool)

(assert (=> start!73498 (=> (not res!583363) (not e!478538))))

(assert (=> start!73498 (= res!583363 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24112 _keys!868))))))

(assert (=> start!73498 e!478538))

(assert (=> start!73498 tp_is_empty!16549))

(assert (=> start!73498 true))

(assert (=> start!73498 tp!50743))

(declare-fun array_inv!18748 (array!49282) Bool)

(assert (=> start!73498 (array_inv!18748 _keys!868)))

(declare-fun e!478539 () Bool)

(declare-fun array_inv!18749 (array!49284) Bool)

(assert (=> start!73498 (and (array_inv!18749 _values!688) e!478539)))

(declare-fun mapIsEmpty!26423 () Bool)

(declare-fun mapRes!26423 () Bool)

(assert (=> mapIsEmpty!26423 mapRes!26423))

(declare-fun b!858678 () Bool)

(declare-fun res!583370 () Bool)

(assert (=> b!858678 (=> (not res!583370) (not e!478538))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49282 (_ BitVec 32)) Bool)

(assert (=> b!858678 (= res!583370 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!858679 () Bool)

(declare-fun res!583364 () Bool)

(assert (=> b!858679 (=> (not res!583364) (not e!478538))))

(assert (=> b!858679 (= res!583364 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16791))))

(declare-fun b!858680 () Bool)

(declare-fun e!478533 () Bool)

(assert (=> b!858680 (= e!478533 e!478534)))

(declare-fun res!583361 () Bool)

(assert (=> b!858680 (=> res!583361 e!478534)))

(assert (=> b!858680 (= res!583361 (not (= (select (arr!23672 _keys!868) from!1053) k!854)))))

(declare-fun lt!386846 () ListLongMap!9755)

(declare-fun +!2246 (ListLongMap!9755 tuple2!10986) ListLongMap!9755)

(declare-fun get!12468 (ValueCell!7835 V!27113) V!27113)

(declare-fun dynLambda!1086 (Int (_ BitVec 64)) V!27113)

(assert (=> b!858680 (= lt!386841 (+!2246 lt!386846 (tuple2!10987 (select (arr!23672 _keys!868) from!1053) (get!12468 (select (arr!23673 _values!688) from!1053) (dynLambda!1086 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!858681 () Bool)

(declare-fun res!583366 () Bool)

(assert (=> b!858681 (=> (not res!583366) (not e!478538))))

(assert (=> b!858681 (= res!583366 (and (= (select (arr!23672 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!858682 () Bool)

(assert (=> b!858682 (= e!478539 (and e!478540 mapRes!26423))))

(declare-fun condMapEmpty!26423 () Bool)

(declare-fun mapDefault!26423 () ValueCell!7835)

