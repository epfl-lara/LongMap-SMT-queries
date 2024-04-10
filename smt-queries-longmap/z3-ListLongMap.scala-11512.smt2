; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133958 () Bool)

(assert start!133958)

(declare-fun b_free!32181 () Bool)

(declare-fun b_next!32181 () Bool)

(assert (=> start!133958 (= b_free!32181 (not b_next!32181))))

(declare-fun tp!113844 () Bool)

(declare-fun b_and!51803 () Bool)

(assert (=> start!133958 (= tp!113844 b_and!51803)))

(declare-fun b!1566012 () Bool)

(declare-fun res!1070467 () Bool)

(declare-fun e!872868 () Bool)

(assert (=> b!1566012 (=> (not res!1070467) (not e!872868))))

(declare-fun from!782 () (_ BitVec 32))

(declare-datatypes ((array!104596 0))(
  ( (array!104597 (arr!50485 (Array (_ BitVec 32) (_ BitVec 64))) (size!51035 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104596)

(assert (=> b!1566012 (= res!1070467 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!51035 _keys!637)) (bvslt from!782 (size!51035 _keys!637))))))

(declare-fun b!1566013 () Bool)

(declare-fun e!872869 () Bool)

(declare-fun tp_is_empty!38955 () Bool)

(assert (=> b!1566013 (= e!872869 tp_is_empty!38955)))

(declare-fun b!1566014 () Bool)

(declare-fun res!1070465 () Bool)

(assert (=> b!1566014 (=> (not res!1070465) (not e!872868))))

(declare-datatypes ((List!36624 0))(
  ( (Nil!36621) (Cons!36620 (h!38066 (_ BitVec 64)) (t!51519 List!36624)) )
))
(declare-fun arrayNoDuplicates!0 (array!104596 (_ BitVec 32) List!36624) Bool)

(assert (=> b!1566014 (= res!1070465 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36621))))

(declare-fun mapIsEmpty!59824 () Bool)

(declare-fun mapRes!59824 () Bool)

(assert (=> mapIsEmpty!59824 mapRes!59824))

(declare-fun res!1070468 () Bool)

(assert (=> start!133958 (=> (not res!1070468) (not e!872868))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133958 (= res!1070468 (validMask!0 mask!947))))

(assert (=> start!133958 e!872868))

(assert (=> start!133958 tp!113844))

(assert (=> start!133958 tp_is_empty!38955))

(assert (=> start!133958 true))

(declare-fun array_inv!39227 (array!104596) Bool)

(assert (=> start!133958 (array_inv!39227 _keys!637)))

(declare-datatypes ((V!60147 0))(
  ( (V!60148 (val!19561 Int)) )
))
(declare-datatypes ((ValueCell!18447 0))(
  ( (ValueCellFull!18447 (v!22317 V!60147)) (EmptyCell!18447) )
))
(declare-datatypes ((array!104598 0))(
  ( (array!104599 (arr!50486 (Array (_ BitVec 32) ValueCell!18447)) (size!51036 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104598)

(declare-fun e!872865 () Bool)

(declare-fun array_inv!39228 (array!104598) Bool)

(assert (=> start!133958 (and (array_inv!39228 _values!487) e!872865)))

(declare-fun b!1566015 () Bool)

(assert (=> b!1566015 (= e!872868 (not true))))

(declare-fun lt!672511 () Bool)

(declare-datatypes ((tuple2!25236 0))(
  ( (tuple2!25237 (_1!12629 (_ BitVec 64)) (_2!12629 V!60147)) )
))
(declare-datatypes ((List!36625 0))(
  ( (Nil!36622) (Cons!36621 (h!38067 tuple2!25236) (t!51520 List!36625)) )
))
(declare-datatypes ((ListLongMap!22671 0))(
  ( (ListLongMap!22672 (toList!11351 List!36625)) )
))
(declare-fun lt!672513 () ListLongMap!22671)

(declare-fun contains!10342 (ListLongMap!22671 (_ BitVec 64)) Bool)

(assert (=> b!1566015 (= lt!672511 (contains!10342 lt!672513 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1566015 (not (contains!10342 lt!672513 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!672512 () ListLongMap!22671)

(declare-fun lt!672514 () V!60147)

(declare-fun +!5081 (ListLongMap!22671 tuple2!25236) ListLongMap!22671)

(assert (=> b!1566015 (= lt!672513 (+!5081 lt!672512 (tuple2!25237 (select (arr!50485 _keys!637) from!782) lt!672514)))))

(declare-datatypes ((Unit!52026 0))(
  ( (Unit!52027) )
))
(declare-fun lt!672515 () Unit!52026)

(declare-fun addStillNotContains!571 (ListLongMap!22671 (_ BitVec 64) V!60147 (_ BitVec 64)) Unit!52026)

(assert (=> b!1566015 (= lt!672515 (addStillNotContains!571 lt!672512 (select (arr!50485 _keys!637) from!782) lt!672514 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun defaultEntry!495 () Int)

(declare-fun get!26356 (ValueCell!18447 V!60147) V!60147)

(declare-fun dynLambda!3865 (Int (_ BitVec 64)) V!60147)

(assert (=> b!1566015 (= lt!672514 (get!26356 (select (arr!50486 _values!487) from!782) (dynLambda!3865 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!453 () V!60147)

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-fun minValue!453 () V!60147)

(declare-fun getCurrentListMapNoExtraKeys!6716 (array!104596 array!104598 (_ BitVec 32) (_ BitVec 32) V!60147 V!60147 (_ BitVec 32) Int) ListLongMap!22671)

(assert (=> b!1566015 (= lt!672512 (getCurrentListMapNoExtraKeys!6716 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495))))

(declare-fun b!1566016 () Bool)

(declare-fun res!1070469 () Bool)

(assert (=> b!1566016 (=> (not res!1070469) (not e!872868))))

(assert (=> b!1566016 (= res!1070469 (and (= (size!51036 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!51035 _keys!637) (size!51036 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1566017 () Bool)

(declare-fun res!1070466 () Bool)

(assert (=> b!1566017 (=> (not res!1070466) (not e!872868))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104596 (_ BitVec 32)) Bool)

(assert (=> b!1566017 (= res!1070466 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1566018 () Bool)

(declare-fun e!872867 () Bool)

(assert (=> b!1566018 (= e!872867 tp_is_empty!38955)))

(declare-fun b!1566019 () Bool)

(declare-fun res!1070470 () Bool)

(assert (=> b!1566019 (=> (not res!1070470) (not e!872868))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1566019 (= res!1070470 (validKeyInArray!0 (select (arr!50485 _keys!637) from!782)))))

(declare-fun b!1566020 () Bool)

(assert (=> b!1566020 (= e!872865 (and e!872869 mapRes!59824))))

(declare-fun condMapEmpty!59824 () Bool)

(declare-fun mapDefault!59824 () ValueCell!18447)

(assert (=> b!1566020 (= condMapEmpty!59824 (= (arr!50486 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18447)) mapDefault!59824)))))

(declare-fun mapNonEmpty!59824 () Bool)

(declare-fun tp!113845 () Bool)

(assert (=> mapNonEmpty!59824 (= mapRes!59824 (and tp!113845 e!872867))))

(declare-fun mapKey!59824 () (_ BitVec 32))

(declare-fun mapRest!59824 () (Array (_ BitVec 32) ValueCell!18447))

(declare-fun mapValue!59824 () ValueCell!18447)

(assert (=> mapNonEmpty!59824 (= (arr!50486 _values!487) (store mapRest!59824 mapKey!59824 mapValue!59824))))

(assert (= (and start!133958 res!1070468) b!1566016))

(assert (= (and b!1566016 res!1070469) b!1566017))

(assert (= (and b!1566017 res!1070466) b!1566014))

(assert (= (and b!1566014 res!1070465) b!1566012))

(assert (= (and b!1566012 res!1070467) b!1566019))

(assert (= (and b!1566019 res!1070470) b!1566015))

(assert (= (and b!1566020 condMapEmpty!59824) mapIsEmpty!59824))

(assert (= (and b!1566020 (not condMapEmpty!59824)) mapNonEmpty!59824))

(get-info :version)

(assert (= (and mapNonEmpty!59824 ((_ is ValueCellFull!18447) mapValue!59824)) b!1566018))

(assert (= (and b!1566020 ((_ is ValueCellFull!18447) mapDefault!59824)) b!1566013))

(assert (= start!133958 b!1566020))

(declare-fun b_lambda!24995 () Bool)

(assert (=> (not b_lambda!24995) (not b!1566015)))

(declare-fun t!51518 () Bool)

(declare-fun tb!12649 () Bool)

(assert (=> (and start!133958 (= defaultEntry!495 defaultEntry!495) t!51518) tb!12649))

(declare-fun result!26589 () Bool)

(assert (=> tb!12649 (= result!26589 tp_is_empty!38955)))

(assert (=> b!1566015 t!51518))

(declare-fun b_and!51805 () Bool)

(assert (= b_and!51803 (and (=> t!51518 result!26589) b_and!51805)))

(declare-fun m!1440943 () Bool)

(assert (=> b!1566014 m!1440943))

(declare-fun m!1440945 () Bool)

(assert (=> mapNonEmpty!59824 m!1440945))

(declare-fun m!1440947 () Bool)

(assert (=> start!133958 m!1440947))

(declare-fun m!1440949 () Bool)

(assert (=> start!133958 m!1440949))

(declare-fun m!1440951 () Bool)

(assert (=> start!133958 m!1440951))

(declare-fun m!1440953 () Bool)

(assert (=> b!1566015 m!1440953))

(declare-fun m!1440955 () Bool)

(assert (=> b!1566015 m!1440955))

(declare-fun m!1440957 () Bool)

(assert (=> b!1566015 m!1440957))

(declare-fun m!1440959 () Bool)

(assert (=> b!1566015 m!1440959))

(assert (=> b!1566015 m!1440953))

(declare-fun m!1440961 () Bool)

(assert (=> b!1566015 m!1440961))

(declare-fun m!1440963 () Bool)

(assert (=> b!1566015 m!1440963))

(assert (=> b!1566015 m!1440963))

(declare-fun m!1440965 () Bool)

(assert (=> b!1566015 m!1440965))

(declare-fun m!1440967 () Bool)

(assert (=> b!1566015 m!1440967))

(assert (=> b!1566015 m!1440955))

(declare-fun m!1440969 () Bool)

(assert (=> b!1566015 m!1440969))

(assert (=> b!1566019 m!1440963))

(assert (=> b!1566019 m!1440963))

(declare-fun m!1440971 () Bool)

(assert (=> b!1566019 m!1440971))

(declare-fun m!1440973 () Bool)

(assert (=> b!1566017 m!1440973))

(check-sat b_and!51805 tp_is_empty!38955 (not b!1566015) (not b_next!32181) (not b!1566019) (not b!1566017) (not mapNonEmpty!59824) (not b!1566014) (not start!133958) (not b_lambda!24995))
(check-sat b_and!51805 (not b_next!32181))
