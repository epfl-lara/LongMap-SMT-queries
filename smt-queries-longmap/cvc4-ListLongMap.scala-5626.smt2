; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73544 () Bool)

(assert start!73544)

(declare-fun b_free!14459 () Bool)

(declare-fun b_next!14459 () Bool)

(assert (=> start!73544 (= b_free!14459 (not b_next!14459))))

(declare-fun tp!50880 () Bool)

(declare-fun b_and!23897 () Bool)

(assert (=> start!73544 (= tp!50880 b_and!23897)))

(declare-fun b!859760 () Bool)

(declare-fun res!584210 () Bool)

(declare-fun e!479114 () Bool)

(assert (=> b!859760 (=> (not res!584210) (not e!479114))))

(declare-datatypes ((array!49366 0))(
  ( (array!49367 (arr!23714 (Array (_ BitVec 32) (_ BitVec 64))) (size!24154 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49366)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49366 (_ BitVec 32)) Bool)

(assert (=> b!859760 (= res!584210 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!859761 () Bool)

(declare-fun e!479112 () Bool)

(declare-fun tp_is_empty!16595 () Bool)

(assert (=> b!859761 (= e!479112 tp_is_empty!16595)))

(declare-fun b!859762 () Bool)

(declare-fun res!584197 () Bool)

(assert (=> b!859762 (=> (not res!584197) (not e!479114))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!859762 (= res!584197 (validMask!0 mask!1196))))

(declare-fun b!859763 () Bool)

(declare-fun e!479115 () Bool)

(declare-fun e!479113 () Bool)

(assert (=> b!859763 (= e!479115 (not e!479113))))

(declare-fun res!584204 () Bool)

(assert (=> b!859763 (=> res!584204 e!479113)))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!859763 (= res!584204 (not (validKeyInArray!0 (select (arr!23714 _keys!868) from!1053))))))

(declare-datatypes ((V!27173 0))(
  ( (V!27174 (val!8345 Int)) )
))
(declare-datatypes ((tuple2!11022 0))(
  ( (tuple2!11023 (_1!5522 (_ BitVec 64)) (_2!5522 V!27173)) )
))
(declare-datatypes ((List!16831 0))(
  ( (Nil!16828) (Cons!16827 (h!17958 tuple2!11022) (t!23556 List!16831)) )
))
(declare-datatypes ((ListLongMap!9791 0))(
  ( (ListLongMap!9792 (toList!4911 List!16831)) )
))
(declare-fun lt!387446 () ListLongMap!9791)

(declare-fun lt!387449 () ListLongMap!9791)

(assert (=> b!859763 (= lt!387446 lt!387449)))

(declare-fun v!557 () V!27173)

(declare-fun k!854 () (_ BitVec 64))

(declare-fun lt!387453 () ListLongMap!9791)

(declare-fun +!2264 (ListLongMap!9791 tuple2!11022) ListLongMap!9791)

(assert (=> b!859763 (= lt!387449 (+!2264 lt!387453 (tuple2!11023 k!854 v!557)))))

(declare-datatypes ((ValueCell!7858 0))(
  ( (ValueCellFull!7858 (v!10770 V!27173)) (EmptyCell!7858) )
))
(declare-datatypes ((array!49368 0))(
  ( (array!49369 (arr!23715 (Array (_ BitVec 32) ValueCell!7858)) (size!24155 (_ BitVec 32))) )
))
(declare-fun lt!387451 () array!49368)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun minValue!654 () V!27173)

(declare-fun zeroValue!654 () V!27173)

(declare-fun defaultEntry!696 () Int)

(declare-fun getCurrentListMapNoExtraKeys!2889 (array!49366 array!49368 (_ BitVec 32) (_ BitVec 32) V!27173 V!27173 (_ BitVec 32) Int) ListLongMap!9791)

(assert (=> b!859763 (= lt!387446 (getCurrentListMapNoExtraKeys!2889 _keys!868 lt!387451 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun _values!688 () array!49368)

(assert (=> b!859763 (= lt!387453 (getCurrentListMapNoExtraKeys!2889 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-datatypes ((Unit!29311 0))(
  ( (Unit!29312) )
))
(declare-fun lt!387445 () Unit!29311)

(declare-fun i!612 () (_ BitVec 32))

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!479 (array!49366 array!49368 (_ BitVec 32) (_ BitVec 32) V!27173 V!27173 (_ BitVec 32) (_ BitVec 64) V!27173 (_ BitVec 32) Int) Unit!29311)

(assert (=> b!859763 (= lt!387445 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!479 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!859764 () Bool)

(declare-fun res!584199 () Bool)

(assert (=> b!859764 (=> (not res!584199) (not e!479114))))

(assert (=> b!859764 (= res!584199 (and (= (select (arr!23714 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!859765 () Bool)

(declare-fun e!479118 () Bool)

(assert (=> b!859765 (= e!479118 true)))

(declare-fun lt!387447 () Bool)

(declare-datatypes ((List!16832 0))(
  ( (Nil!16829) (Cons!16828 (h!17959 (_ BitVec 64)) (t!23557 List!16832)) )
))
(declare-fun contains!4224 (List!16832 (_ BitVec 64)) Bool)

(assert (=> b!859765 (= lt!387447 (contains!4224 Nil!16829 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!859766 () Bool)

(declare-fun res!584198 () Bool)

(assert (=> b!859766 (=> (not res!584198) (not e!479114))))

(assert (=> b!859766 (= res!584198 (validKeyInArray!0 k!854))))

(declare-fun mapNonEmpty!26492 () Bool)

(declare-fun mapRes!26492 () Bool)

(declare-fun tp!50881 () Bool)

(declare-fun e!479119 () Bool)

(assert (=> mapNonEmpty!26492 (= mapRes!26492 (and tp!50881 e!479119))))

(declare-fun mapRest!26492 () (Array (_ BitVec 32) ValueCell!7858))

(declare-fun mapValue!26492 () ValueCell!7858)

(declare-fun mapKey!26492 () (_ BitVec 32))

(assert (=> mapNonEmpty!26492 (= (arr!23715 _values!688) (store mapRest!26492 mapKey!26492 mapValue!26492))))

(declare-fun b!859768 () Bool)

(declare-fun res!584205 () Bool)

(assert (=> b!859768 (=> (not res!584205) (not e!479114))))

(declare-fun arrayNoDuplicates!0 (array!49366 (_ BitVec 32) List!16832) Bool)

(assert (=> b!859768 (= res!584205 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16829))))

(declare-fun b!859769 () Bool)

(declare-fun e!479116 () Bool)

(assert (=> b!859769 (= e!479113 e!479116)))

(declare-fun res!584203 () Bool)

(assert (=> b!859769 (=> res!584203 e!479116)))

(assert (=> b!859769 (= res!584203 (not (= (select (arr!23714 _keys!868) from!1053) k!854)))))

(declare-fun lt!387450 () ListLongMap!9791)

(declare-fun get!12498 (ValueCell!7858 V!27173) V!27173)

(declare-fun dynLambda!1102 (Int (_ BitVec 64)) V!27173)

(assert (=> b!859769 (= lt!387450 (+!2264 lt!387449 (tuple2!11023 (select (arr!23714 _keys!868) from!1053) (get!12498 (select (arr!23715 _values!688) from!1053) (dynLambda!1102 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!859770 () Bool)

(assert (=> b!859770 (= e!479116 e!479118)))

(declare-fun res!584200 () Bool)

(assert (=> b!859770 (=> res!584200 e!479118)))

(assert (=> b!859770 (= res!584200 (or (bvsge (size!24154 _keys!868) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) (size!24154 _keys!868)) (bvsge from!1053 (size!24154 _keys!868))))))

(declare-fun arrayContainsKey!0 (array!49366 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!859770 (arrayContainsKey!0 _keys!868 k!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!387448 () Unit!29311)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49366 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29311)

(assert (=> b!859770 (= lt!387448 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(assert (=> b!859770 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!16829)))

(declare-fun lt!387452 () Unit!29311)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49366 (_ BitVec 32) (_ BitVec 32)) Unit!29311)

(assert (=> b!859770 (= lt!387452 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-fun mapIsEmpty!26492 () Bool)

(assert (=> mapIsEmpty!26492 mapRes!26492))

(declare-fun b!859771 () Bool)

(declare-fun res!584208 () Bool)

(assert (=> b!859771 (=> (not res!584208) (not e!479114))))

(assert (=> b!859771 (= res!584208 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24154 _keys!868))))))

(declare-fun b!859772 () Bool)

(assert (=> b!859772 (= e!479114 e!479115)))

(declare-fun res!584201 () Bool)

(assert (=> b!859772 (=> (not res!584201) (not e!479115))))

(assert (=> b!859772 (= res!584201 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(assert (=> b!859772 (= lt!387450 (getCurrentListMapNoExtraKeys!2889 _keys!868 lt!387451 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!859772 (= lt!387451 (array!49369 (store (arr!23715 _values!688) i!612 (ValueCellFull!7858 v!557)) (size!24155 _values!688)))))

(declare-fun lt!387454 () ListLongMap!9791)

(assert (=> b!859772 (= lt!387454 (getCurrentListMapNoExtraKeys!2889 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!859773 () Bool)

(declare-fun res!584209 () Bool)

(assert (=> b!859773 (=> res!584209 e!479118)))

(declare-fun noDuplicate!1306 (List!16832) Bool)

(assert (=> b!859773 (= res!584209 (not (noDuplicate!1306 Nil!16829)))))

(declare-fun b!859774 () Bool)

(declare-fun res!584202 () Bool)

(assert (=> b!859774 (=> (not res!584202) (not e!479114))))

(assert (=> b!859774 (= res!584202 (and (= (size!24155 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24154 _keys!868) (size!24155 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!859775 () Bool)

(declare-fun e!479111 () Bool)

(assert (=> b!859775 (= e!479111 (and e!479112 mapRes!26492))))

(declare-fun condMapEmpty!26492 () Bool)

(declare-fun mapDefault!26492 () ValueCell!7858)

