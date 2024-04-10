; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74442 () Bool)

(assert start!74442)

(declare-fun b_free!15185 () Bool)

(declare-fun b_next!15185 () Bool)

(assert (=> start!74442 (= b_free!15185 (not b_next!15185))))

(declare-fun tp!53232 () Bool)

(declare-fun b_and!25023 () Bool)

(assert (=> start!74442 (= tp!53232 b_and!25023)))

(declare-fun mapIsEmpty!27755 () Bool)

(declare-fun mapRes!27755 () Bool)

(assert (=> mapIsEmpty!27755 mapRes!27755))

(declare-fun b!876858 () Bool)

(declare-fun res!595828 () Bool)

(declare-fun e!488108 () Bool)

(assert (=> b!876858 (=> (not res!595828) (not e!488108))))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!876858 (= res!595828 (validKeyInArray!0 k!854))))

(declare-fun b!876859 () Bool)

(declare-fun res!595829 () Bool)

(assert (=> b!876859 (=> (not res!595829) (not e!488108))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!50984 0))(
  ( (array!50985 (arr!24519 (Array (_ BitVec 32) (_ BitVec 64))) (size!24959 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50984)

(assert (=> b!876859 (= res!595829 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24959 _keys!868))))))

(declare-fun b!876860 () Bool)

(declare-fun e!488107 () Bool)

(declare-fun e!488109 () Bool)

(assert (=> b!876860 (= e!488107 (not e!488109))))

(declare-fun res!595827 () Bool)

(assert (=> b!876860 (=> res!595827 e!488109)))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!876860 (= res!595827 (not (validKeyInArray!0 (select (arr!24519 _keys!868) from!1053))))))

(declare-fun e!488103 () Bool)

(assert (=> b!876860 e!488103))

(declare-fun c!92627 () Bool)

(assert (=> b!876860 (= c!92627 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((V!28285 0))(
  ( (V!28286 (val!8762 Int)) )
))
(declare-fun v!557 () V!28285)

(declare-datatypes ((Unit!29988 0))(
  ( (Unit!29989) )
))
(declare-fun lt!396746 () Unit!29988)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((ValueCell!8275 0))(
  ( (ValueCellFull!8275 (v!11195 V!28285)) (EmptyCell!8275) )
))
(declare-datatypes ((array!50986 0))(
  ( (array!50987 (arr!24520 (Array (_ BitVec 32) ValueCell!8275)) (size!24960 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50986)

(declare-fun minValue!654 () V!28285)

(declare-fun zeroValue!654 () V!28285)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!687 (array!50984 array!50986 (_ BitVec 32) (_ BitVec 32) V!28285 V!28285 (_ BitVec 32) (_ BitVec 64) V!28285 (_ BitVec 32) Int) Unit!29988)

(assert (=> b!876860 (= lt!396746 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!687 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun res!595820 () Bool)

(assert (=> start!74442 (=> (not res!595820) (not e!488108))))

(assert (=> start!74442 (= res!595820 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24959 _keys!868))))))

(assert (=> start!74442 e!488108))

(declare-fun tp_is_empty!17429 () Bool)

(assert (=> start!74442 tp_is_empty!17429))

(assert (=> start!74442 true))

(assert (=> start!74442 tp!53232))

(declare-fun array_inv!19326 (array!50984) Bool)

(assert (=> start!74442 (array_inv!19326 _keys!868)))

(declare-fun e!488102 () Bool)

(declare-fun array_inv!19327 (array!50986) Bool)

(assert (=> start!74442 (and (array_inv!19327 _values!688) e!488102)))

(declare-datatypes ((tuple2!11584 0))(
  ( (tuple2!11585 (_1!5803 (_ BitVec 64)) (_2!5803 V!28285)) )
))
(declare-datatypes ((List!17401 0))(
  ( (Nil!17398) (Cons!17397 (h!18528 tuple2!11584) (t!24490 List!17401)) )
))
(declare-datatypes ((ListLongMap!10353 0))(
  ( (ListLongMap!10354 (toList!5192 List!17401)) )
))
(declare-fun lt!396748 () ListLongMap!10353)

(declare-fun b!876861 () Bool)

(declare-fun lt!396753 () ListLongMap!10353)

(declare-fun +!2492 (ListLongMap!10353 tuple2!11584) ListLongMap!10353)

(assert (=> b!876861 (= e!488109 (= lt!396748 (+!2492 lt!396753 (tuple2!11585 k!854 v!557))))))

(declare-fun lt!396749 () tuple2!11584)

(declare-fun lt!396744 () ListLongMap!10353)

(declare-fun lt!396747 () V!28285)

(assert (=> b!876861 (= (+!2492 lt!396744 lt!396749) (+!2492 (+!2492 lt!396744 (tuple2!11585 k!854 lt!396747)) lt!396749))))

(declare-fun lt!396745 () V!28285)

(assert (=> b!876861 (= lt!396749 (tuple2!11585 k!854 lt!396745))))

(declare-fun lt!396750 () Unit!29988)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!325 (ListLongMap!10353 (_ BitVec 64) V!28285 V!28285) Unit!29988)

(assert (=> b!876861 (= lt!396750 (addSameAsAddTwiceSameKeyDiffValues!325 lt!396744 k!854 lt!396747 lt!396745))))

(declare-fun lt!396752 () V!28285)

(declare-fun get!12895 (ValueCell!8275 V!28285) V!28285)

(assert (=> b!876861 (= lt!396747 (get!12895 (select (arr!24520 _values!688) from!1053) lt!396752))))

(assert (=> b!876861 (= lt!396748 (+!2492 lt!396744 (tuple2!11585 (select (arr!24519 _keys!868) from!1053) lt!396745)))))

(assert (=> b!876861 (= lt!396745 (get!12895 (select (store (arr!24520 _values!688) i!612 (ValueCellFull!8275 v!557)) from!1053) lt!396752))))

(declare-fun dynLambda!1219 (Int (_ BitVec 64)) V!28285)

(assert (=> b!876861 (= lt!396752 (dynLambda!1219 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!396751 () array!50986)

(declare-fun getCurrentListMapNoExtraKeys!3159 (array!50984 array!50986 (_ BitVec 32) (_ BitVec 32) V!28285 V!28285 (_ BitVec 32) Int) ListLongMap!10353)

(assert (=> b!876861 (= lt!396744 (getCurrentListMapNoExtraKeys!3159 _keys!868 lt!396751 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!876862 () Bool)

(declare-fun e!488106 () Bool)

(assert (=> b!876862 (= e!488102 (and e!488106 mapRes!27755))))

(declare-fun condMapEmpty!27755 () Bool)

(declare-fun mapDefault!27755 () ValueCell!8275)

