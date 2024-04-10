; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133542 () Bool)

(assert start!133542)

(declare-fun b_free!31959 () Bool)

(declare-fun b_next!31959 () Bool)

(assert (=> start!133542 (= b_free!31959 (not b_next!31959))))

(declare-fun tp!113000 () Bool)

(declare-fun b_and!51429 () Bool)

(assert (=> start!133542 (= tp!113000 b_and!51429)))

(declare-fun b!1561181 () Bool)

(declare-fun res!1067469 () Bool)

(declare-fun e!870016 () Bool)

(assert (=> b!1561181 (=> (not res!1067469) (not e!870016))))

(declare-datatypes ((array!103968 0))(
  ( (array!103969 (arr!50176 (Array (_ BitVec 32) (_ BitVec 64))) (size!50726 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!103968)

(declare-datatypes ((List!36426 0))(
  ( (Nil!36423) (Cons!36422 (h!37868 (_ BitVec 64)) (t!51175 List!36426)) )
))
(declare-fun arrayNoDuplicates!0 (array!103968 (_ BitVec 32) List!36426) Bool)

(assert (=> b!1561181 (= res!1067469 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36423))))

(declare-fun b!1561182 () Bool)

(declare-fun e!870019 () Bool)

(declare-fun e!870018 () Bool)

(declare-fun mapRes!59313 () Bool)

(assert (=> b!1561182 (= e!870019 (and e!870018 mapRes!59313))))

(declare-fun condMapEmpty!59313 () Bool)

(declare-datatypes ((V!59707 0))(
  ( (V!59708 (val!19396 Int)) )
))
(declare-datatypes ((ValueCell!18282 0))(
  ( (ValueCellFull!18282 (v!22148 V!59707)) (EmptyCell!18282) )
))
(declare-datatypes ((array!103970 0))(
  ( (array!103971 (arr!50177 (Array (_ BitVec 32) ValueCell!18282)) (size!50727 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!103970)

(declare-fun mapDefault!59313 () ValueCell!18282)

(assert (=> b!1561182 (= condMapEmpty!59313 (= (arr!50177 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18282)) mapDefault!59313)))))

(declare-fun b!1561183 () Bool)

(declare-fun tp_is_empty!38625 () Bool)

(assert (=> b!1561183 (= e!870018 tp_is_empty!38625)))

(declare-fun b!1561184 () Bool)

(declare-fun e!870015 () Bool)

(assert (=> b!1561184 (= e!870015 tp_is_empty!38625)))

(declare-fun b!1561185 () Bool)

(declare-fun res!1067466 () Bool)

(assert (=> b!1561185 (=> (not res!1067466) (not e!870016))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun extraKeys!434 () (_ BitVec 32))

(assert (=> b!1561185 (= res!1067466 (and (= (size!50727 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50726 _keys!637) (size!50727 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1561186 () Bool)

(assert (=> b!1561186 (= e!870016 (not true))))

(declare-datatypes ((tuple2!25054 0))(
  ( (tuple2!25055 (_1!12538 (_ BitVec 64)) (_2!12538 V!59707)) )
))
(declare-datatypes ((List!36427 0))(
  ( (Nil!36424) (Cons!36423 (h!37869 tuple2!25054) (t!51176 List!36427)) )
))
(declare-datatypes ((ListLongMap!22489 0))(
  ( (ListLongMap!22490 (toList!11260 List!36427)) )
))
(declare-fun lt!671131 () ListLongMap!22489)

(declare-fun from!782 () (_ BitVec 32))

(declare-fun lt!671133 () V!59707)

(declare-fun contains!10250 (ListLongMap!22489 (_ BitVec 64)) Bool)

(declare-fun +!5030 (ListLongMap!22489 tuple2!25054) ListLongMap!22489)

(assert (=> b!1561186 (not (contains!10250 (+!5030 lt!671131 (tuple2!25055 (select (arr!50176 _keys!637) from!782) lt!671133)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!51914 0))(
  ( (Unit!51915) )
))
(declare-fun lt!671132 () Unit!51914)

(declare-fun addStillNotContains!520 (ListLongMap!22489 (_ BitVec 64) V!59707 (_ BitVec 64)) Unit!51914)

(assert (=> b!1561186 (= lt!671132 (addStillNotContains!520 lt!671131 (select (arr!50176 _keys!637) from!782) lt!671133 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun defaultEntry!495 () Int)

(declare-fun get!26193 (ValueCell!18282 V!59707) V!59707)

(declare-fun dynLambda!3814 (Int (_ BitVec 64)) V!59707)

(assert (=> b!1561186 (= lt!671133 (get!26193 (select (arr!50177 _values!487) from!782) (dynLambda!3814 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!453 () V!59707)

(declare-fun minValue!453 () V!59707)

(declare-fun getCurrentListMapNoExtraKeys!6644 (array!103968 array!103970 (_ BitVec 32) (_ BitVec 32) V!59707 V!59707 (_ BitVec 32) Int) ListLongMap!22489)

(assert (=> b!1561186 (= lt!671131 (getCurrentListMapNoExtraKeys!6644 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495))))

(declare-fun b!1561188 () Bool)

(declare-fun res!1067468 () Bool)

(assert (=> b!1561188 (=> (not res!1067468) (not e!870016))))

(assert (=> b!1561188 (= res!1067468 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50726 _keys!637)) (bvslt from!782 (size!50726 _keys!637))))))

(declare-fun mapIsEmpty!59313 () Bool)

(assert (=> mapIsEmpty!59313 mapRes!59313))

(declare-fun mapNonEmpty!59313 () Bool)

(declare-fun tp!113001 () Bool)

(assert (=> mapNonEmpty!59313 (= mapRes!59313 (and tp!113001 e!870015))))

(declare-fun mapRest!59313 () (Array (_ BitVec 32) ValueCell!18282))

(declare-fun mapValue!59313 () ValueCell!18282)

(declare-fun mapKey!59313 () (_ BitVec 32))

(assert (=> mapNonEmpty!59313 (= (arr!50177 _values!487) (store mapRest!59313 mapKey!59313 mapValue!59313))))

(declare-fun b!1561189 () Bool)

(declare-fun res!1067467 () Bool)

(assert (=> b!1561189 (=> (not res!1067467) (not e!870016))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1561189 (= res!1067467 (validKeyInArray!0 (select (arr!50176 _keys!637) from!782)))))

(declare-fun b!1561187 () Bool)

(declare-fun res!1067465 () Bool)

(assert (=> b!1561187 (=> (not res!1067465) (not e!870016))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103968 (_ BitVec 32)) Bool)

(assert (=> b!1561187 (= res!1067465 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun res!1067464 () Bool)

(assert (=> start!133542 (=> (not res!1067464) (not e!870016))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133542 (= res!1067464 (validMask!0 mask!947))))

(assert (=> start!133542 e!870016))

(assert (=> start!133542 tp!113000))

(assert (=> start!133542 tp_is_empty!38625))

(assert (=> start!133542 true))

(declare-fun array_inv!39003 (array!103968) Bool)

(assert (=> start!133542 (array_inv!39003 _keys!637)))

(declare-fun array_inv!39004 (array!103970) Bool)

(assert (=> start!133542 (and (array_inv!39004 _values!487) e!870019)))

(assert (= (and start!133542 res!1067464) b!1561185))

(assert (= (and b!1561185 res!1067466) b!1561187))

(assert (= (and b!1561187 res!1067465) b!1561181))

(assert (= (and b!1561181 res!1067469) b!1561188))

(assert (= (and b!1561188 res!1067468) b!1561189))

(assert (= (and b!1561189 res!1067467) b!1561186))

(assert (= (and b!1561182 condMapEmpty!59313) mapIsEmpty!59313))

(assert (= (and b!1561182 (not condMapEmpty!59313)) mapNonEmpty!59313))

(get-info :version)

(assert (= (and mapNonEmpty!59313 ((_ is ValueCellFull!18282) mapValue!59313)) b!1561184))

(assert (= (and b!1561182 ((_ is ValueCellFull!18282) mapDefault!59313)) b!1561183))

(assert (= start!133542 b!1561182))

(declare-fun b_lambda!24833 () Bool)

(assert (=> (not b_lambda!24833) (not b!1561186)))

(declare-fun t!51174 () Bool)

(declare-fun tb!12503 () Bool)

(assert (=> (and start!133542 (= defaultEntry!495 defaultEntry!495) t!51174) tb!12503))

(declare-fun result!26287 () Bool)

(assert (=> tb!12503 (= result!26287 tp_is_empty!38625)))

(assert (=> b!1561186 t!51174))

(declare-fun b_and!51431 () Bool)

(assert (= b_and!51429 (and (=> t!51174 result!26287) b_and!51431)))

(declare-fun m!1436851 () Bool)

(assert (=> b!1561187 m!1436851))

(declare-fun m!1436853 () Bool)

(assert (=> b!1561189 m!1436853))

(assert (=> b!1561189 m!1436853))

(declare-fun m!1436855 () Bool)

(assert (=> b!1561189 m!1436855))

(declare-fun m!1436857 () Bool)

(assert (=> b!1561186 m!1436857))

(declare-fun m!1436859 () Bool)

(assert (=> b!1561186 m!1436859))

(declare-fun m!1436861 () Bool)

(assert (=> b!1561186 m!1436861))

(declare-fun m!1436863 () Bool)

(assert (=> b!1561186 m!1436863))

(assert (=> b!1561186 m!1436857))

(assert (=> b!1561186 m!1436853))

(assert (=> b!1561186 m!1436853))

(declare-fun m!1436865 () Bool)

(assert (=> b!1561186 m!1436865))

(assert (=> b!1561186 m!1436859))

(declare-fun m!1436867 () Bool)

(assert (=> b!1561186 m!1436867))

(assert (=> b!1561186 m!1436863))

(declare-fun m!1436869 () Bool)

(assert (=> b!1561186 m!1436869))

(declare-fun m!1436871 () Bool)

(assert (=> start!133542 m!1436871))

(declare-fun m!1436873 () Bool)

(assert (=> start!133542 m!1436873))

(declare-fun m!1436875 () Bool)

(assert (=> start!133542 m!1436875))

(declare-fun m!1436877 () Bool)

(assert (=> b!1561181 m!1436877))

(declare-fun m!1436879 () Bool)

(assert (=> mapNonEmpty!59313 m!1436879))

(check-sat tp_is_empty!38625 (not b_next!31959) (not b!1561189) (not b!1561181) (not b!1561187) b_and!51431 (not b!1561186) (not mapNonEmpty!59313) (not b_lambda!24833) (not start!133542))
(check-sat b_and!51431 (not b_next!31959))
