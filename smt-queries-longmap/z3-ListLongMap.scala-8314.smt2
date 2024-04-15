; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101226 () Bool)

(assert start!101226)

(declare-fun b_free!26155 () Bool)

(declare-fun b_next!26155 () Bool)

(assert (=> start!101226 (= b_free!26155 (not b_next!26155))))

(declare-fun tp!91487 () Bool)

(declare-fun b_and!43409 () Bool)

(assert (=> start!101226 (= tp!91487 b_and!43409)))

(declare-fun mapNonEmpty!48163 () Bool)

(declare-fun mapRes!48163 () Bool)

(declare-fun tp!91486 () Bool)

(declare-fun e!690192 () Bool)

(assert (=> mapNonEmpty!48163 (= mapRes!48163 (and tp!91486 e!690192))))

(declare-fun mapKey!48163 () (_ BitVec 32))

(declare-datatypes ((V!46273 0))(
  ( (V!46274 (val!15486 Int)) )
))
(declare-datatypes ((ValueCell!14720 0))(
  ( (ValueCellFull!14720 (v!18138 V!46273)) (EmptyCell!14720) )
))
(declare-fun mapRest!48163 () (Array (_ BitVec 32) ValueCell!14720))

(declare-fun mapValue!48163 () ValueCell!14720)

(declare-datatypes ((array!78414 0))(
  ( (array!78415 (arr!37842 (Array (_ BitVec 32) ValueCell!14720)) (size!38380 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78414)

(assert (=> mapNonEmpty!48163 (= (arr!37842 _values!996) (store mapRest!48163 mapKey!48163 mapValue!48163))))

(declare-fun res!807126 () Bool)

(declare-fun e!690190 () Bool)

(assert (=> start!101226 (=> (not res!807126) (not e!690190))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!78416 0))(
  ( (array!78417 (arr!37843 (Array (_ BitVec 32) (_ BitVec 64))) (size!38381 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78416)

(assert (=> start!101226 (= res!807126 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38381 _keys!1208))))))

(assert (=> start!101226 e!690190))

(declare-fun tp_is_empty!30859 () Bool)

(assert (=> start!101226 tp_is_empty!30859))

(declare-fun array_inv!28926 (array!78416) Bool)

(assert (=> start!101226 (array_inv!28926 _keys!1208)))

(assert (=> start!101226 true))

(assert (=> start!101226 tp!91487))

(declare-fun e!690196 () Bool)

(declare-fun array_inv!28927 (array!78414) Bool)

(assert (=> start!101226 (and (array_inv!28927 _values!996) e!690196)))

(declare-fun b!1215575 () Bool)

(declare-fun res!807128 () Bool)

(assert (=> b!1215575 (=> (not res!807128) (not e!690190))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1215575 (= res!807128 (= (select (arr!37843 _keys!1208) i!673) k0!934))))

(declare-fun b!1215576 () Bool)

(declare-fun res!807134 () Bool)

(assert (=> b!1215576 (=> (not res!807134) (not e!690190))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1215576 (= res!807134 (validKeyInArray!0 k0!934))))

(declare-fun b!1215577 () Bool)

(declare-fun res!807129 () Bool)

(assert (=> b!1215577 (=> (not res!807129) (not e!690190))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78416 (_ BitVec 32)) Bool)

(assert (=> b!1215577 (= res!807129 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1215578 () Bool)

(declare-fun e!690194 () Bool)

(declare-fun e!690195 () Bool)

(assert (=> b!1215578 (= e!690194 (not e!690195))))

(declare-fun res!807127 () Bool)

(assert (=> b!1215578 (=> res!807127 e!690195)))

(assert (=> b!1215578 (= res!807127 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!78416 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1215578 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!40167 0))(
  ( (Unit!40168) )
))
(declare-fun lt!552500 () Unit!40167)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78416 (_ BitVec 64) (_ BitVec 32)) Unit!40167)

(assert (=> b!1215578 (= lt!552500 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1215579 () Bool)

(assert (=> b!1215579 (= e!690192 tp_is_empty!30859)))

(declare-fun b!1215580 () Bool)

(declare-fun e!690193 () Bool)

(assert (=> b!1215580 (= e!690193 tp_is_empty!30859)))

(declare-fun b!1215581 () Bool)

(declare-fun res!807136 () Bool)

(assert (=> b!1215581 (=> (not res!807136) (not e!690190))))

(declare-datatypes ((List!26772 0))(
  ( (Nil!26769) (Cons!26768 (h!27977 (_ BitVec 64)) (t!39898 List!26772)) )
))
(declare-fun arrayNoDuplicates!0 (array!78416 (_ BitVec 32) List!26772) Bool)

(assert (=> b!1215581 (= res!807136 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26769))))

(declare-fun b!1215582 () Bool)

(assert (=> b!1215582 (= e!690195 true)))

(declare-fun zeroValue!944 () V!46273)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!552503 () array!78416)

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!19992 0))(
  ( (tuple2!19993 (_1!10007 (_ BitVec 64)) (_2!10007 V!46273)) )
))
(declare-datatypes ((List!26773 0))(
  ( (Nil!26770) (Cons!26769 (h!27978 tuple2!19992) (t!39899 List!26773)) )
))
(declare-datatypes ((ListLongMap!17961 0))(
  ( (ListLongMap!17962 (toList!8996 List!26773)) )
))
(declare-fun lt!552501 () ListLongMap!17961)

(declare-fun minValue!944 () V!46273)

(declare-fun getCurrentListMapNoExtraKeys!5435 (array!78416 array!78414 (_ BitVec 32) (_ BitVec 32) V!46273 V!46273 (_ BitVec 32) Int) ListLongMap!17961)

(declare-fun dynLambda!3287 (Int (_ BitVec 64)) V!46273)

(assert (=> b!1215582 (= lt!552501 (getCurrentListMapNoExtraKeys!5435 lt!552503 (array!78415 (store (arr!37842 _values!996) i!673 (ValueCellFull!14720 (dynLambda!3287 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38380 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!552502 () ListLongMap!17961)

(assert (=> b!1215582 (= lt!552502 (getCurrentListMapNoExtraKeys!5435 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun mapIsEmpty!48163 () Bool)

(assert (=> mapIsEmpty!48163 mapRes!48163))

(declare-fun b!1215583 () Bool)

(declare-fun res!807135 () Bool)

(assert (=> b!1215583 (=> (not res!807135) (not e!690190))))

(assert (=> b!1215583 (= res!807135 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38381 _keys!1208))))))

(declare-fun b!1215584 () Bool)

(assert (=> b!1215584 (= e!690190 e!690194)))

(declare-fun res!807133 () Bool)

(assert (=> b!1215584 (=> (not res!807133) (not e!690194))))

(assert (=> b!1215584 (= res!807133 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!552503 mask!1564))))

(assert (=> b!1215584 (= lt!552503 (array!78417 (store (arr!37843 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38381 _keys!1208)))))

(declare-fun b!1215585 () Bool)

(declare-fun res!807132 () Bool)

(assert (=> b!1215585 (=> (not res!807132) (not e!690190))))

(assert (=> b!1215585 (= res!807132 (and (= (size!38380 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38381 _keys!1208) (size!38380 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1215586 () Bool)

(declare-fun res!807131 () Bool)

(assert (=> b!1215586 (=> (not res!807131) (not e!690194))))

(assert (=> b!1215586 (= res!807131 (arrayNoDuplicates!0 lt!552503 #b00000000000000000000000000000000 Nil!26769))))

(declare-fun b!1215587 () Bool)

(declare-fun res!807130 () Bool)

(assert (=> b!1215587 (=> (not res!807130) (not e!690190))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1215587 (= res!807130 (validMask!0 mask!1564))))

(declare-fun b!1215588 () Bool)

(assert (=> b!1215588 (= e!690196 (and e!690193 mapRes!48163))))

(declare-fun condMapEmpty!48163 () Bool)

(declare-fun mapDefault!48163 () ValueCell!14720)

(assert (=> b!1215588 (= condMapEmpty!48163 (= (arr!37842 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14720)) mapDefault!48163)))))

(assert (= (and start!101226 res!807126) b!1215587))

(assert (= (and b!1215587 res!807130) b!1215585))

(assert (= (and b!1215585 res!807132) b!1215577))

(assert (= (and b!1215577 res!807129) b!1215581))

(assert (= (and b!1215581 res!807136) b!1215583))

(assert (= (and b!1215583 res!807135) b!1215576))

(assert (= (and b!1215576 res!807134) b!1215575))

(assert (= (and b!1215575 res!807128) b!1215584))

(assert (= (and b!1215584 res!807133) b!1215586))

(assert (= (and b!1215586 res!807131) b!1215578))

(assert (= (and b!1215578 (not res!807127)) b!1215582))

(assert (= (and b!1215588 condMapEmpty!48163) mapIsEmpty!48163))

(assert (= (and b!1215588 (not condMapEmpty!48163)) mapNonEmpty!48163))

(get-info :version)

(assert (= (and mapNonEmpty!48163 ((_ is ValueCellFull!14720) mapValue!48163)) b!1215579))

(assert (= (and b!1215588 ((_ is ValueCellFull!14720) mapDefault!48163)) b!1215580))

(assert (= start!101226 b!1215588))

(declare-fun b_lambda!21821 () Bool)

(assert (=> (not b_lambda!21821) (not b!1215582)))

(declare-fun t!39897 () Bool)

(declare-fun tb!10947 () Bool)

(assert (=> (and start!101226 (= defaultEntry!1004 defaultEntry!1004) t!39897) tb!10947))

(declare-fun result!22499 () Bool)

(assert (=> tb!10947 (= result!22499 tp_is_empty!30859)))

(assert (=> b!1215582 t!39897))

(declare-fun b_and!43411 () Bool)

(assert (= b_and!43409 (and (=> t!39897 result!22499) b_and!43411)))

(declare-fun m!1120035 () Bool)

(assert (=> b!1215587 m!1120035))

(declare-fun m!1120037 () Bool)

(assert (=> b!1215577 m!1120037))

(declare-fun m!1120039 () Bool)

(assert (=> b!1215581 m!1120039))

(declare-fun m!1120041 () Bool)

(assert (=> mapNonEmpty!48163 m!1120041))

(declare-fun m!1120043 () Bool)

(assert (=> b!1215584 m!1120043))

(declare-fun m!1120045 () Bool)

(assert (=> b!1215584 m!1120045))

(declare-fun m!1120047 () Bool)

(assert (=> b!1215586 m!1120047))

(declare-fun m!1120049 () Bool)

(assert (=> b!1215582 m!1120049))

(declare-fun m!1120051 () Bool)

(assert (=> b!1215582 m!1120051))

(declare-fun m!1120053 () Bool)

(assert (=> b!1215582 m!1120053))

(declare-fun m!1120055 () Bool)

(assert (=> b!1215582 m!1120055))

(declare-fun m!1120057 () Bool)

(assert (=> b!1215575 m!1120057))

(declare-fun m!1120059 () Bool)

(assert (=> b!1215576 m!1120059))

(declare-fun m!1120061 () Bool)

(assert (=> b!1215578 m!1120061))

(declare-fun m!1120063 () Bool)

(assert (=> b!1215578 m!1120063))

(declare-fun m!1120065 () Bool)

(assert (=> start!101226 m!1120065))

(declare-fun m!1120067 () Bool)

(assert (=> start!101226 m!1120067))

(check-sat (not b!1215584) (not b!1215581) (not b_lambda!21821) (not b!1215582) (not b_next!26155) (not b!1215587) (not b!1215576) b_and!43411 (not start!101226) (not b!1215578) (not b!1215577) (not b!1215586) tp_is_empty!30859 (not mapNonEmpty!48163))
(check-sat b_and!43411 (not b_next!26155))
