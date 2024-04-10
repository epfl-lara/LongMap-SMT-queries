; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74402 () Bool)

(assert start!74402)

(declare-fun b_free!15145 () Bool)

(declare-fun b_next!15145 () Bool)

(assert (=> start!74402 (= b_free!15145 (not b_next!15145))))

(declare-fun tp!53113 () Bool)

(declare-fun b_and!24943 () Bool)

(assert (=> start!74402 (= tp!53113 b_and!24943)))

(declare-datatypes ((V!28233 0))(
  ( (V!28234 (val!8742 Int)) )
))
(declare-datatypes ((tuple2!11552 0))(
  ( (tuple2!11553 (_1!5787 (_ BitVec 64)) (_2!5787 V!28233)) )
))
(declare-datatypes ((List!17372 0))(
  ( (Nil!17369) (Cons!17368 (h!18499 tuple2!11552) (t!24421 List!17372)) )
))
(declare-datatypes ((ListLongMap!10321 0))(
  ( (ListLongMap!10322 (toList!5176 List!17372)) )
))
(declare-fun call!38678 () ListLongMap!10321)

(declare-fun defaultEntry!696 () Int)

(declare-fun bm!38675 () Bool)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!50904 0))(
  ( (array!50905 (arr!24479 (Array (_ BitVec 32) (_ BitVec 64))) (size!24919 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50904)

(declare-datatypes ((ValueCell!8255 0))(
  ( (ValueCellFull!8255 (v!11175 V!28233)) (EmptyCell!8255) )
))
(declare-datatypes ((array!50906 0))(
  ( (array!50907 (arr!24480 (Array (_ BitVec 32) ValueCell!8255)) (size!24920 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50906)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!28233)

(declare-fun zeroValue!654 () V!28233)

(declare-fun getCurrentListMapNoExtraKeys!3143 (array!50904 array!50906 (_ BitVec 32) (_ BitVec 32) V!28233 V!28233 (_ BitVec 32) Int) ListLongMap!10321)

(assert (=> bm!38675 (= call!38678 (getCurrentListMapNoExtraKeys!3143 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!875918 () Bool)

(declare-fun e!487624 () Bool)

(declare-fun tp_is_empty!17389 () Bool)

(assert (=> b!875918 (= e!487624 tp_is_empty!17389)))

(declare-fun b!875920 () Bool)

(declare-fun res!595222 () Bool)

(declare-fun e!487622 () Bool)

(assert (=> b!875920 (=> (not res!595222) (not e!487622))))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!875920 (= res!595222 (and (= (select (arr!24479 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun v!557 () V!28233)

(declare-fun b!875921 () Bool)

(declare-fun call!38679 () ListLongMap!10321)

(declare-fun e!487623 () Bool)

(declare-fun +!2478 (ListLongMap!10321 tuple2!11552) ListLongMap!10321)

(assert (=> b!875921 (= e!487623 (= call!38679 (+!2478 call!38678 (tuple2!11553 k!854 v!557))))))

(declare-fun b!875922 () Bool)

(declare-fun res!595225 () Bool)

(assert (=> b!875922 (=> (not res!595225) (not e!487622))))

(assert (=> b!875922 (= res!595225 (and (= (size!24920 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24919 _keys!868) (size!24920 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun bm!38676 () Bool)

(declare-fun lt!396350 () array!50906)

(assert (=> bm!38676 (= call!38679 (getCurrentListMapNoExtraKeys!3143 _keys!868 lt!396350 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapNonEmpty!27695 () Bool)

(declare-fun mapRes!27695 () Bool)

(declare-fun tp!53112 () Bool)

(assert (=> mapNonEmpty!27695 (= mapRes!27695 (and tp!53112 e!487624))))

(declare-fun mapRest!27695 () (Array (_ BitVec 32) ValueCell!8255))

(declare-fun mapKey!27695 () (_ BitVec 32))

(declare-fun mapValue!27695 () ValueCell!8255)

(assert (=> mapNonEmpty!27695 (= (arr!24480 _values!688) (store mapRest!27695 mapKey!27695 mapValue!27695))))

(declare-fun b!875923 () Bool)

(declare-fun res!595224 () Bool)

(assert (=> b!875923 (=> (not res!595224) (not e!487622))))

(declare-datatypes ((List!17373 0))(
  ( (Nil!17370) (Cons!17369 (h!18500 (_ BitVec 64)) (t!24422 List!17373)) )
))
(declare-fun arrayNoDuplicates!0 (array!50904 (_ BitVec 32) List!17373) Bool)

(assert (=> b!875923 (= res!595224 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17370))))

(declare-fun mapIsEmpty!27695 () Bool)

(assert (=> mapIsEmpty!27695 mapRes!27695))

(declare-fun b!875924 () Bool)

(declare-fun res!595220 () Bool)

(assert (=> b!875924 (=> (not res!595220) (not e!487622))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!875924 (= res!595220 (validMask!0 mask!1196))))

(declare-fun b!875925 () Bool)

(declare-fun e!487626 () Bool)

(assert (=> b!875925 (= e!487626 (bvslt i!612 (size!24920 _values!688)))))

(declare-fun lt!396348 () ListLongMap!10321)

(declare-fun get!12870 (ValueCell!8255 V!28233) V!28233)

(declare-fun dynLambda!1206 (Int (_ BitVec 64)) V!28233)

(assert (=> b!875925 (= lt!396348 (+!2478 (getCurrentListMapNoExtraKeys!3143 _keys!868 lt!396350 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!11553 (select (arr!24479 _keys!868) from!1053) (get!12870 (select (arr!24480 lt!396350) from!1053) (dynLambda!1206 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!875926 () Bool)

(declare-fun res!595221 () Bool)

(assert (=> b!875926 (=> (not res!595221) (not e!487622))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!875926 (= res!595221 (validKeyInArray!0 k!854))))

(declare-fun b!875927 () Bool)

(declare-fun e!487629 () Bool)

(assert (=> b!875927 (= e!487629 (not e!487626))))

(declare-fun res!595226 () Bool)

(assert (=> b!875927 (=> res!595226 e!487626)))

(assert (=> b!875927 (= res!595226 (not (validKeyInArray!0 (select (arr!24479 _keys!868) from!1053))))))

(assert (=> b!875927 e!487623))

(declare-fun c!92567 () Bool)

(assert (=> b!875927 (= c!92567 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!29954 0))(
  ( (Unit!29955) )
))
(declare-fun lt!396351 () Unit!29954)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!670 (array!50904 array!50906 (_ BitVec 32) (_ BitVec 32) V!28233 V!28233 (_ BitVec 32) (_ BitVec 64) V!28233 (_ BitVec 32) Int) Unit!29954)

(assert (=> b!875927 (= lt!396351 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!670 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!875928 () Bool)

(declare-fun e!487625 () Bool)

(assert (=> b!875928 (= e!487625 tp_is_empty!17389)))

(declare-fun res!595227 () Bool)

(assert (=> start!74402 (=> (not res!595227) (not e!487622))))

(assert (=> start!74402 (= res!595227 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24919 _keys!868))))))

(assert (=> start!74402 e!487622))

(assert (=> start!74402 tp_is_empty!17389))

(assert (=> start!74402 true))

(assert (=> start!74402 tp!53113))

(declare-fun array_inv!19300 (array!50904) Bool)

(assert (=> start!74402 (array_inv!19300 _keys!868)))

(declare-fun e!487627 () Bool)

(declare-fun array_inv!19301 (array!50906) Bool)

(assert (=> start!74402 (and (array_inv!19301 _values!688) e!487627)))

(declare-fun b!875919 () Bool)

(declare-fun res!595223 () Bool)

(assert (=> b!875919 (=> (not res!595223) (not e!487622))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50904 (_ BitVec 32)) Bool)

(assert (=> b!875919 (= res!595223 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!875929 () Bool)

(assert (=> b!875929 (= e!487627 (and e!487625 mapRes!27695))))

(declare-fun condMapEmpty!27695 () Bool)

(declare-fun mapDefault!27695 () ValueCell!8255)

