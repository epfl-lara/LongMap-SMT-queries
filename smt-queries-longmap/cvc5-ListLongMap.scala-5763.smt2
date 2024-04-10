; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74426 () Bool)

(assert start!74426)

(declare-fun b_free!15169 () Bool)

(declare-fun b_next!15169 () Bool)

(assert (=> start!74426 (= b_free!15169 (not b_next!15169))))

(declare-fun tp!53185 () Bool)

(declare-fun b_and!24991 () Bool)

(assert (=> start!74426 (= tp!53185 b_and!24991)))

(declare-fun b!876482 () Bool)

(declare-fun e!487916 () Bool)

(declare-fun e!487910 () Bool)

(assert (=> b!876482 (= e!487916 (not e!487910))))

(declare-fun res!595580 () Bool)

(assert (=> b!876482 (=> res!595580 e!487910)))

(declare-datatypes ((array!50952 0))(
  ( (array!50953 (arr!24503 (Array (_ BitVec 32) (_ BitVec 64))) (size!24943 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50952)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!876482 (= res!595580 (not (validKeyInArray!0 (select (arr!24503 _keys!868) from!1053))))))

(declare-fun e!487913 () Bool)

(assert (=> b!876482 e!487913))

(declare-fun c!92603 () Bool)

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!876482 (= c!92603 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((V!28265 0))(
  ( (V!28266 (val!8754 Int)) )
))
(declare-fun v!557 () V!28265)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun k!854 () (_ BitVec 64))

(declare-datatypes ((ValueCell!8267 0))(
  ( (ValueCellFull!8267 (v!11187 V!28265)) (EmptyCell!8267) )
))
(declare-datatypes ((array!50954 0))(
  ( (array!50955 (arr!24504 (Array (_ BitVec 32) ValueCell!8267)) (size!24944 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50954)

(declare-fun minValue!654 () V!28265)

(declare-fun zeroValue!654 () V!28265)

(declare-datatypes ((Unit!29972 0))(
  ( (Unit!29973) )
))
(declare-fun lt!396506 () Unit!29972)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!679 (array!50952 array!50954 (_ BitVec 32) (_ BitVec 32) V!28265 V!28265 (_ BitVec 32) (_ BitVec 64) V!28265 (_ BitVec 32) Int) Unit!29972)

(assert (=> b!876482 (= lt!396506 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!679 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapIsEmpty!27731 () Bool)

(declare-fun mapRes!27731 () Bool)

(assert (=> mapIsEmpty!27731 mapRes!27731))

(declare-fun b!876483 () Bool)

(declare-fun e!487911 () Bool)

(declare-fun tp_is_empty!17413 () Bool)

(assert (=> b!876483 (= e!487911 tp_is_empty!17413)))

(declare-datatypes ((tuple2!11574 0))(
  ( (tuple2!11575 (_1!5798 (_ BitVec 64)) (_2!5798 V!28265)) )
))
(declare-datatypes ((List!17391 0))(
  ( (Nil!17388) (Cons!17387 (h!18518 tuple2!11574) (t!24464 List!17391)) )
))
(declare-datatypes ((ListLongMap!10343 0))(
  ( (ListLongMap!10344 (toList!5187 List!17391)) )
))
(declare-fun call!38751 () ListLongMap!10343)

(declare-fun bm!38747 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!3154 (array!50952 array!50954 (_ BitVec 32) (_ BitVec 32) V!28265 V!28265 (_ BitVec 32) Int) ListLongMap!10343)

(assert (=> bm!38747 (= call!38751 (getCurrentListMapNoExtraKeys!3154 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!876485 () Bool)

(declare-fun res!595588 () Bool)

(declare-fun e!487914 () Bool)

(assert (=> b!876485 (=> (not res!595588) (not e!487914))))

(assert (=> b!876485 (= res!595588 (and (= (size!24944 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24943 _keys!868) (size!24944 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!27731 () Bool)

(declare-fun tp!53184 () Bool)

(declare-fun e!487915 () Bool)

(assert (=> mapNonEmpty!27731 (= mapRes!27731 (and tp!53184 e!487915))))

(declare-fun mapValue!27731 () ValueCell!8267)

(declare-fun mapRest!27731 () (Array (_ BitVec 32) ValueCell!8267))

(declare-fun mapKey!27731 () (_ BitVec 32))

(assert (=> mapNonEmpty!27731 (= (arr!24504 _values!688) (store mapRest!27731 mapKey!27731 mapValue!27731))))

(declare-fun b!876486 () Bool)

(assert (=> b!876486 (= e!487910 (bvslt i!612 (size!24944 _values!688)))))

(declare-fun lt!396505 () ListLongMap!10343)

(declare-fun lt!396504 () tuple2!11574)

(declare-fun lt!396512 () V!28265)

(declare-fun +!2487 (ListLongMap!10343 tuple2!11574) ListLongMap!10343)

(assert (=> b!876486 (= (+!2487 lt!396505 lt!396504) (+!2487 (+!2487 lt!396505 (tuple2!11575 k!854 lt!396512)) lt!396504))))

(declare-fun lt!396508 () V!28265)

(assert (=> b!876486 (= lt!396504 (tuple2!11575 k!854 lt!396508))))

(declare-fun lt!396507 () Unit!29972)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!320 (ListLongMap!10343 (_ BitVec 64) V!28265 V!28265) Unit!29972)

(assert (=> b!876486 (= lt!396507 (addSameAsAddTwiceSameKeyDiffValues!320 lt!396505 k!854 lt!396512 lt!396508))))

(declare-fun lt!396510 () V!28265)

(declare-fun get!12886 (ValueCell!8267 V!28265) V!28265)

(assert (=> b!876486 (= lt!396512 (get!12886 (select (arr!24504 _values!688) from!1053) lt!396510))))

(declare-fun lt!396509 () ListLongMap!10343)

(assert (=> b!876486 (= lt!396509 (+!2487 lt!396505 (tuple2!11575 (select (arr!24503 _keys!868) from!1053) lt!396508)))))

(assert (=> b!876486 (= lt!396508 (get!12886 (select (store (arr!24504 _values!688) i!612 (ValueCellFull!8267 v!557)) from!1053) lt!396510))))

(declare-fun dynLambda!1214 (Int (_ BitVec 64)) V!28265)

(assert (=> b!876486 (= lt!396510 (dynLambda!1214 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!396511 () array!50954)

(assert (=> b!876486 (= lt!396505 (getCurrentListMapNoExtraKeys!3154 _keys!868 lt!396511 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!876487 () Bool)

(assert (=> b!876487 (= e!487914 e!487916)))

(declare-fun res!595586 () Bool)

(assert (=> b!876487 (=> (not res!595586) (not e!487916))))

(assert (=> b!876487 (= res!595586 (= from!1053 i!612))))

(assert (=> b!876487 (= lt!396509 (getCurrentListMapNoExtraKeys!3154 _keys!868 lt!396511 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!876487 (= lt!396511 (array!50955 (store (arr!24504 _values!688) i!612 (ValueCellFull!8267 v!557)) (size!24944 _values!688)))))

(declare-fun lt!396513 () ListLongMap!10343)

(assert (=> b!876487 (= lt!396513 (getCurrentListMapNoExtraKeys!3154 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun bm!38748 () Bool)

(declare-fun call!38750 () ListLongMap!10343)

(assert (=> bm!38748 (= call!38750 (getCurrentListMapNoExtraKeys!3154 _keys!868 lt!396511 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!876488 () Bool)

(assert (=> b!876488 (= e!487915 tp_is_empty!17413)))

(declare-fun b!876489 () Bool)

(declare-fun res!595589 () Bool)

(assert (=> b!876489 (=> (not res!595589) (not e!487914))))

(assert (=> b!876489 (= res!595589 (validKeyInArray!0 k!854))))

(declare-fun b!876490 () Bool)

(declare-fun res!595587 () Bool)

(assert (=> b!876490 (=> (not res!595587) (not e!487914))))

(assert (=> b!876490 (= res!595587 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24943 _keys!868))))))

(declare-fun b!876491 () Bool)

(declare-fun res!595584 () Bool)

(assert (=> b!876491 (=> (not res!595584) (not e!487914))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50952 (_ BitVec 32)) Bool)

(assert (=> b!876491 (= res!595584 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!876492 () Bool)

(assert (=> b!876492 (= e!487913 (= call!38750 call!38751))))

(declare-fun b!876493 () Bool)

(declare-fun res!595583 () Bool)

(assert (=> b!876493 (=> (not res!595583) (not e!487914))))

(declare-datatypes ((List!17392 0))(
  ( (Nil!17389) (Cons!17388 (h!18519 (_ BitVec 64)) (t!24465 List!17392)) )
))
(declare-fun arrayNoDuplicates!0 (array!50952 (_ BitVec 32) List!17392) Bool)

(assert (=> b!876493 (= res!595583 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17389))))

(declare-fun b!876494 () Bool)

(declare-fun e!487917 () Bool)

(assert (=> b!876494 (= e!487917 (and e!487911 mapRes!27731))))

(declare-fun condMapEmpty!27731 () Bool)

(declare-fun mapDefault!27731 () ValueCell!8267)

