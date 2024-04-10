; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73556 () Bool)

(assert start!73556)

(declare-fun b_free!14471 () Bool)

(declare-fun b_next!14471 () Bool)

(assert (=> start!73556 (= b_free!14471 (not b_next!14471))))

(declare-fun tp!50916 () Bool)

(declare-fun b_and!23921 () Bool)

(assert (=> start!73556 (= tp!50916 b_and!23921)))

(declare-fun mapIsEmpty!26510 () Bool)

(declare-fun mapRes!26510 () Bool)

(assert (=> mapIsEmpty!26510 mapRes!26510))

(declare-fun b!860078 () Bool)

(declare-fun e!479281 () Bool)

(assert (=> b!860078 (= e!479281 true)))

(declare-fun lt!387628 () Bool)

(declare-datatypes ((List!16842 0))(
  ( (Nil!16839) (Cons!16838 (h!17969 (_ BitVec 64)) (t!23579 List!16842)) )
))
(declare-fun contains!4229 (List!16842 (_ BitVec 64)) Bool)

(assert (=> b!860078 (= lt!387628 (contains!4229 Nil!16839 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapNonEmpty!26510 () Bool)

(declare-fun tp!50917 () Bool)

(declare-fun e!479273 () Bool)

(assert (=> mapNonEmpty!26510 (= mapRes!26510 (and tp!50917 e!479273))))

(declare-datatypes ((V!27189 0))(
  ( (V!27190 (val!8351 Int)) )
))
(declare-datatypes ((ValueCell!7864 0))(
  ( (ValueCellFull!7864 (v!10776 V!27189)) (EmptyCell!7864) )
))
(declare-fun mapRest!26510 () (Array (_ BitVec 32) ValueCell!7864))

(declare-fun mapValue!26510 () ValueCell!7864)

(declare-fun mapKey!26510 () (_ BitVec 32))

(declare-datatypes ((array!49390 0))(
  ( (array!49391 (arr!23726 (Array (_ BitVec 32) ValueCell!7864)) (size!24166 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49390)

(assert (=> mapNonEmpty!26510 (= (arr!23726 _values!688) (store mapRest!26510 mapKey!26510 mapValue!26510))))

(declare-fun b!860079 () Bool)

(declare-fun e!479279 () Bool)

(declare-fun tp_is_empty!16607 () Bool)

(assert (=> b!860079 (= e!479279 tp_is_empty!16607)))

(declare-fun res!584458 () Bool)

(declare-fun e!479278 () Bool)

(assert (=> start!73556 (=> (not res!584458) (not e!479278))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!49392 0))(
  ( (array!49393 (arr!23727 (Array (_ BitVec 32) (_ BitVec 64))) (size!24167 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49392)

(assert (=> start!73556 (= res!584458 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24167 _keys!868))))))

(assert (=> start!73556 e!479278))

(assert (=> start!73556 tp_is_empty!16607))

(assert (=> start!73556 true))

(assert (=> start!73556 tp!50916))

(declare-fun array_inv!18782 (array!49392) Bool)

(assert (=> start!73556 (array_inv!18782 _keys!868)))

(declare-fun e!479277 () Bool)

(declare-fun array_inv!18783 (array!49390) Bool)

(assert (=> start!73556 (and (array_inv!18783 _values!688) e!479277)))

(declare-fun b!860080 () Bool)

(declare-fun res!584459 () Bool)

(assert (=> b!860080 (=> (not res!584459) (not e!479278))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(assert (=> b!860080 (= res!584459 (and (= (size!24166 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24167 _keys!868) (size!24166 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!860081 () Bool)

(declare-fun res!584462 () Bool)

(assert (=> b!860081 (=> res!584462 e!479281)))

(declare-fun noDuplicate!1311 (List!16842) Bool)

(assert (=> b!860081 (= res!584462 (not (noDuplicate!1311 Nil!16839)))))

(declare-fun b!860082 () Bool)

(declare-fun e!479280 () Bool)

(declare-fun e!479274 () Bool)

(assert (=> b!860082 (= e!479280 e!479274)))

(declare-fun res!584453 () Bool)

(assert (=> b!860082 (=> res!584453 e!479274)))

(declare-fun k!854 () (_ BitVec 64))

(assert (=> b!860082 (= res!584453 (not (= (select (arr!23727 _keys!868) from!1053) k!854)))))

(declare-datatypes ((tuple2!11034 0))(
  ( (tuple2!11035 (_1!5528 (_ BitVec 64)) (_2!5528 V!27189)) )
))
(declare-datatypes ((List!16843 0))(
  ( (Nil!16840) (Cons!16839 (h!17970 tuple2!11034) (t!23580 List!16843)) )
))
(declare-datatypes ((ListLongMap!9803 0))(
  ( (ListLongMap!9804 (toList!4917 List!16843)) )
))
(declare-fun lt!387630 () ListLongMap!9803)

(declare-fun defaultEntry!696 () Int)

(declare-fun lt!387627 () ListLongMap!9803)

(declare-fun +!2269 (ListLongMap!9803 tuple2!11034) ListLongMap!9803)

(declare-fun get!12506 (ValueCell!7864 V!27189) V!27189)

(declare-fun dynLambda!1106 (Int (_ BitVec 64)) V!27189)

(assert (=> b!860082 (= lt!387627 (+!2269 lt!387630 (tuple2!11035 (select (arr!23727 _keys!868) from!1053) (get!12506 (select (arr!23726 _values!688) from!1053) (dynLambda!1106 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!860083 () Bool)

(declare-fun res!584454 () Bool)

(assert (=> b!860083 (=> (not res!584454) (not e!479278))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49392 (_ BitVec 32)) Bool)

(assert (=> b!860083 (= res!584454 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!860084 () Bool)

(declare-fun e!479276 () Bool)

(assert (=> b!860084 (= e!479278 e!479276)))

(declare-fun res!584460 () Bool)

(assert (=> b!860084 (=> (not res!584460) (not e!479276))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!860084 (= res!584460 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!387634 () array!49390)

(declare-fun minValue!654 () V!27189)

(declare-fun zeroValue!654 () V!27189)

(declare-fun getCurrentListMapNoExtraKeys!2895 (array!49392 array!49390 (_ BitVec 32) (_ BitVec 32) V!27189 V!27189 (_ BitVec 32) Int) ListLongMap!9803)

(assert (=> b!860084 (= lt!387627 (getCurrentListMapNoExtraKeys!2895 _keys!868 lt!387634 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27189)

(assert (=> b!860084 (= lt!387634 (array!49391 (store (arr!23726 _values!688) i!612 (ValueCellFull!7864 v!557)) (size!24166 _values!688)))))

(declare-fun lt!387633 () ListLongMap!9803)

(assert (=> b!860084 (= lt!387633 (getCurrentListMapNoExtraKeys!2895 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!860085 () Bool)

(declare-fun res!584449 () Bool)

(assert (=> b!860085 (=> res!584449 e!479281)))

(assert (=> b!860085 (= res!584449 (contains!4229 Nil!16839 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!860086 () Bool)

(declare-fun res!584456 () Bool)

(assert (=> b!860086 (=> (not res!584456) (not e!479278))))

(assert (=> b!860086 (= res!584456 (and (= (select (arr!23727 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!860087 () Bool)

(assert (=> b!860087 (= e!479274 e!479281)))

(declare-fun res!584452 () Bool)

(assert (=> b!860087 (=> res!584452 e!479281)))

(assert (=> b!860087 (= res!584452 (or (bvsge (size!24167 _keys!868) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) (size!24167 _keys!868)) (bvsge from!1053 (size!24167 _keys!868))))))

(declare-fun arrayContainsKey!0 (array!49392 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!860087 (arrayContainsKey!0 _keys!868 k!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-datatypes ((Unit!29321 0))(
  ( (Unit!29322) )
))
(declare-fun lt!387625 () Unit!29321)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49392 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29321)

(assert (=> b!860087 (= lt!387625 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayNoDuplicates!0 (array!49392 (_ BitVec 32) List!16842) Bool)

(assert (=> b!860087 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!16839)))

(declare-fun lt!387629 () Unit!29321)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49392 (_ BitVec 32) (_ BitVec 32)) Unit!29321)

(assert (=> b!860087 (= lt!387629 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-fun b!860088 () Bool)

(assert (=> b!860088 (= e!479273 tp_is_empty!16607)))

(declare-fun b!860089 () Bool)

(declare-fun res!584455 () Bool)

(assert (=> b!860089 (=> (not res!584455) (not e!479278))))

(assert (=> b!860089 (= res!584455 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24167 _keys!868))))))

(declare-fun b!860090 () Bool)

(declare-fun res!584461 () Bool)

(assert (=> b!860090 (=> (not res!584461) (not e!479278))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!860090 (= res!584461 (validMask!0 mask!1196))))

(declare-fun b!860091 () Bool)

(assert (=> b!860091 (= e!479277 (and e!479279 mapRes!26510))))

(declare-fun condMapEmpty!26510 () Bool)

(declare-fun mapDefault!26510 () ValueCell!7864)

