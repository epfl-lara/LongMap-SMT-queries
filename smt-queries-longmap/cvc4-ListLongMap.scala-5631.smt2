; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73574 () Bool)

(assert start!73574)

(declare-fun b_free!14489 () Bool)

(declare-fun b_next!14489 () Bool)

(assert (=> start!73574 (= b_free!14489 (not b_next!14489))))

(declare-fun tp!50971 () Bool)

(declare-fun b_and!23957 () Bool)

(assert (=> start!73574 (= tp!50971 b_and!23957)))

(declare-fun b!860555 () Bool)

(declare-fun res!584828 () Bool)

(declare-fun e!479517 () Bool)

(assert (=> b!860555 (=> (not res!584828) (not e!479517))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k!854 () (_ BitVec 64))

(declare-datatypes ((array!49426 0))(
  ( (array!49427 (arr!23744 (Array (_ BitVec 32) (_ BitVec 64))) (size!24184 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49426)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!860555 (= res!584828 (and (= (select (arr!23744 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!860556 () Bool)

(declare-fun e!479518 () Bool)

(declare-fun e!479524 () Bool)

(assert (=> b!860556 (= e!479518 e!479524)))

(declare-fun res!584838 () Bool)

(assert (=> b!860556 (=> res!584838 e!479524)))

(assert (=> b!860556 (= res!584838 (not (= (select (arr!23744 _keys!868) from!1053) k!854)))))

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((V!27213 0))(
  ( (V!27214 (val!8360 Int)) )
))
(declare-datatypes ((tuple2!11050 0))(
  ( (tuple2!11051 (_1!5536 (_ BitVec 64)) (_2!5536 V!27213)) )
))
(declare-datatypes ((List!16858 0))(
  ( (Nil!16855) (Cons!16854 (h!17985 tuple2!11050) (t!23613 List!16858)) )
))
(declare-datatypes ((ListLongMap!9819 0))(
  ( (ListLongMap!9820 (toList!4925 List!16858)) )
))
(declare-fun lt!387895 () ListLongMap!9819)

(declare-datatypes ((ValueCell!7873 0))(
  ( (ValueCellFull!7873 (v!10785 V!27213)) (EmptyCell!7873) )
))
(declare-datatypes ((array!49428 0))(
  ( (array!49429 (arr!23745 (Array (_ BitVec 32) ValueCell!7873)) (size!24185 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49428)

(declare-fun lt!387896 () ListLongMap!9819)

(declare-fun +!2277 (ListLongMap!9819 tuple2!11050) ListLongMap!9819)

(declare-fun get!12519 (ValueCell!7873 V!27213) V!27213)

(declare-fun dynLambda!1113 (Int (_ BitVec 64)) V!27213)

(assert (=> b!860556 (= lt!387895 (+!2277 lt!387896 (tuple2!11051 (select (arr!23744 _keys!868) from!1053) (get!12519 (select (arr!23745 _values!688) from!1053) (dynLambda!1113 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!860557 () Bool)

(declare-fun res!584827 () Bool)

(assert (=> b!860557 (=> (not res!584827) (not e!479517))))

(assert (=> b!860557 (= res!584827 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24184 _keys!868))))))

(declare-fun b!860558 () Bool)

(declare-fun e!479523 () Bool)

(declare-fun tp_is_empty!16625 () Bool)

(assert (=> b!860558 (= e!479523 tp_is_empty!16625)))

(declare-fun b!860559 () Bool)

(declare-fun e!479521 () Bool)

(assert (=> b!860559 (= e!479521 tp_is_empty!16625)))

(declare-fun mapIsEmpty!26537 () Bool)

(declare-fun mapRes!26537 () Bool)

(assert (=> mapIsEmpty!26537 mapRes!26537))

(declare-fun b!860560 () Bool)

(declare-fun res!584831 () Bool)

(assert (=> b!860560 (=> (not res!584831) (not e!479517))))

(declare-datatypes ((List!16859 0))(
  ( (Nil!16856) (Cons!16855 (h!17986 (_ BitVec 64)) (t!23614 List!16859)) )
))
(declare-fun arrayNoDuplicates!0 (array!49426 (_ BitVec 32) List!16859) Bool)

(assert (=> b!860560 (= res!584831 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16856))))

(declare-fun b!860561 () Bool)

(declare-fun res!584829 () Bool)

(assert (=> b!860561 (=> (not res!584829) (not e!479517))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!860561 (= res!584829 (validKeyInArray!0 k!854))))

(declare-fun b!860562 () Bool)

(declare-fun e!479522 () Bool)

(assert (=> b!860562 (= e!479522 (not e!479518))))

(declare-fun res!584835 () Bool)

(assert (=> b!860562 (=> res!584835 e!479518)))

(assert (=> b!860562 (= res!584835 (not (validKeyInArray!0 (select (arr!23744 _keys!868) from!1053))))))

(declare-fun lt!387901 () ListLongMap!9819)

(assert (=> b!860562 (= lt!387901 lt!387896)))

(declare-fun v!557 () V!27213)

(declare-fun lt!387898 () ListLongMap!9819)

(assert (=> b!860562 (= lt!387896 (+!2277 lt!387898 (tuple2!11051 k!854 v!557)))))

(declare-fun lt!387897 () array!49428)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun minValue!654 () V!27213)

(declare-fun zeroValue!654 () V!27213)

(declare-fun getCurrentListMapNoExtraKeys!2902 (array!49426 array!49428 (_ BitVec 32) (_ BitVec 32) V!27213 V!27213 (_ BitVec 32) Int) ListLongMap!9819)

(assert (=> b!860562 (= lt!387901 (getCurrentListMapNoExtraKeys!2902 _keys!868 lt!387897 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!860562 (= lt!387898 (getCurrentListMapNoExtraKeys!2902 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-datatypes ((Unit!29337 0))(
  ( (Unit!29338) )
))
(declare-fun lt!387902 () Unit!29337)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!489 (array!49426 array!49428 (_ BitVec 32) (_ BitVec 32) V!27213 V!27213 (_ BitVec 32) (_ BitVec 64) V!27213 (_ BitVec 32) Int) Unit!29337)

(assert (=> b!860562 (= lt!387902 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!489 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun res!584840 () Bool)

(assert (=> start!73574 (=> (not res!584840) (not e!479517))))

(assert (=> start!73574 (= res!584840 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24184 _keys!868))))))

(assert (=> start!73574 e!479517))

(assert (=> start!73574 tp_is_empty!16625))

(assert (=> start!73574 true))

(assert (=> start!73574 tp!50971))

(declare-fun array_inv!18798 (array!49426) Bool)

(assert (=> start!73574 (array_inv!18798 _keys!868)))

(declare-fun e!479516 () Bool)

(declare-fun array_inv!18799 (array!49428) Bool)

(assert (=> start!73574 (and (array_inv!18799 _values!688) e!479516)))

(declare-fun mapNonEmpty!26537 () Bool)

(declare-fun tp!50970 () Bool)

(assert (=> mapNonEmpty!26537 (= mapRes!26537 (and tp!50970 e!479521))))

(declare-fun mapRest!26537 () (Array (_ BitVec 32) ValueCell!7873))

(declare-fun mapValue!26537 () ValueCell!7873)

(declare-fun mapKey!26537 () (_ BitVec 32))

(assert (=> mapNonEmpty!26537 (= (arr!23745 _values!688) (store mapRest!26537 mapKey!26537 mapValue!26537))))

(declare-fun b!860563 () Bool)

(declare-fun res!584833 () Bool)

(assert (=> b!860563 (=> (not res!584833) (not e!479517))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49426 (_ BitVec 32)) Bool)

(assert (=> b!860563 (= res!584833 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!860564 () Bool)

(declare-fun res!584837 () Bool)

(declare-fun e!479520 () Bool)

(assert (=> b!860564 (=> res!584837 e!479520)))

(declare-fun noDuplicate!1317 (List!16859) Bool)

(assert (=> b!860564 (= res!584837 (not (noDuplicate!1317 Nil!16856)))))

(declare-fun b!860565 () Bool)

(declare-fun res!584830 () Bool)

(assert (=> b!860565 (=> res!584830 e!479520)))

(declare-fun contains!4237 (List!16859 (_ BitVec 64)) Bool)

(assert (=> b!860565 (= res!584830 (contains!4237 Nil!16856 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!860566 () Bool)

(assert (=> b!860566 (= e!479520 true)))

(declare-fun lt!387899 () Bool)

(assert (=> b!860566 (= lt!387899 (contains!4237 Nil!16856 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!860567 () Bool)

(assert (=> b!860567 (= e!479516 (and e!479523 mapRes!26537))))

(declare-fun condMapEmpty!26537 () Bool)

(declare-fun mapDefault!26537 () ValueCell!7873)

