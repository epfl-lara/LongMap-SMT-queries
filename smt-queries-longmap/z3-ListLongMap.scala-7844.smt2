; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98044 () Bool)

(assert start!98044)

(declare-fun b_free!23509 () Bool)

(declare-fun b_next!23509 () Bool)

(assert (=> start!98044 (= b_free!23509 (not b_next!23509))))

(declare-fun tp!83230 () Bool)

(declare-fun b_and!37811 () Bool)

(assert (=> start!98044 (= tp!83230 b_and!37811)))

(declare-fun b!1120449 () Bool)

(declare-fun res!748043 () Bool)

(declare-fun e!638236 () Bool)

(assert (=> b!1120449 (=> (not res!748043) (not e!638236))))

(declare-datatypes ((array!73013 0))(
  ( (array!73014 (arr!35153 (Array (_ BitVec 32) (_ BitVec 64))) (size!35690 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73013)

(declare-datatypes ((List!24465 0))(
  ( (Nil!24462) (Cons!24461 (h!25679 (_ BitVec 64)) (t!34958 List!24465)) )
))
(declare-fun arrayNoDuplicates!0 (array!73013 (_ BitVec 32) List!24465) Bool)

(assert (=> b!1120449 (= res!748043 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24462))))

(declare-fun b!1120450 () Bool)

(declare-fun res!748037 () Bool)

(declare-fun e!638235 () Bool)

(assert (=> b!1120450 (=> (not res!748037) (not e!638235))))

(declare-fun lt!498181 () array!73013)

(assert (=> b!1120450 (= res!748037 (arrayNoDuplicates!0 lt!498181 #b00000000000000000000000000000000 Nil!24462))))

(declare-fun mapIsEmpty!43876 () Bool)

(declare-fun mapRes!43876 () Bool)

(assert (=> mapIsEmpty!43876 mapRes!43876))

(declare-fun res!748035 () Bool)

(assert (=> start!98044 (=> (not res!748035) (not e!638236))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!98044 (= res!748035 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35690 _keys!1208))))))

(assert (=> start!98044 e!638236))

(declare-fun tp_is_empty!28039 () Bool)

(assert (=> start!98044 tp_is_empty!28039))

(declare-fun array_inv!27066 (array!73013) Bool)

(assert (=> start!98044 (array_inv!27066 _keys!1208)))

(assert (=> start!98044 true))

(assert (=> start!98044 tp!83230))

(declare-datatypes ((V!42513 0))(
  ( (V!42514 (val!14076 Int)) )
))
(declare-datatypes ((ValueCell!13310 0))(
  ( (ValueCellFull!13310 (v!16705 V!42513)) (EmptyCell!13310) )
))
(declare-datatypes ((array!73015 0))(
  ( (array!73016 (arr!35154 (Array (_ BitVec 32) ValueCell!13310)) (size!35691 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73015)

(declare-fun e!638239 () Bool)

(declare-fun array_inv!27067 (array!73015) Bool)

(assert (=> start!98044 (and (array_inv!27067 _values!996) e!638239)))

(declare-fun b!1120451 () Bool)

(declare-fun e!638238 () Bool)

(assert (=> b!1120451 (= e!638238 tp_is_empty!28039)))

(declare-fun b!1120452 () Bool)

(declare-fun res!748040 () Bool)

(assert (=> b!1120452 (=> (not res!748040) (not e!638236))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1120452 (= res!748040 (validKeyInArray!0 k0!934))))

(declare-fun b!1120453 () Bool)

(declare-fun e!638237 () Bool)

(assert (=> b!1120453 (= e!638235 (not e!638237))))

(declare-fun res!748044 () Bool)

(assert (=> b!1120453 (=> res!748044 e!638237)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1120453 (= res!748044 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73013 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1120453 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36709 0))(
  ( (Unit!36710) )
))
(declare-fun lt!498184 () Unit!36709)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73013 (_ BitVec 64) (_ BitVec 32)) Unit!36709)

(assert (=> b!1120453 (= lt!498184 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1120454 () Bool)

(declare-fun res!748041 () Bool)

(assert (=> b!1120454 (=> (not res!748041) (not e!638236))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(assert (=> b!1120454 (= res!748041 (and (= (size!35691 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35690 _keys!1208) (size!35691 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!43876 () Bool)

(declare-fun tp!83231 () Bool)

(declare-fun e!638240 () Bool)

(assert (=> mapNonEmpty!43876 (= mapRes!43876 (and tp!83231 e!638240))))

(declare-fun mapKey!43876 () (_ BitVec 32))

(declare-fun mapValue!43876 () ValueCell!13310)

(declare-fun mapRest!43876 () (Array (_ BitVec 32) ValueCell!13310))

(assert (=> mapNonEmpty!43876 (= (arr!35154 _values!996) (store mapRest!43876 mapKey!43876 mapValue!43876))))

(declare-fun b!1120455 () Bool)

(declare-fun res!748039 () Bool)

(assert (=> b!1120455 (=> (not res!748039) (not e!638236))))

(assert (=> b!1120455 (= res!748039 (= (select (arr!35153 _keys!1208) i!673) k0!934))))

(declare-fun b!1120456 () Bool)

(assert (=> b!1120456 (= e!638239 (and e!638238 mapRes!43876))))

(declare-fun condMapEmpty!43876 () Bool)

(declare-fun mapDefault!43876 () ValueCell!13310)

(assert (=> b!1120456 (= condMapEmpty!43876 (= (arr!35154 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13310)) mapDefault!43876)))))

(declare-fun b!1120457 () Bool)

(assert (=> b!1120457 (= e!638237 true)))

(declare-datatypes ((tuple2!17674 0))(
  ( (tuple2!17675 (_1!8848 (_ BitVec 64)) (_2!8848 V!42513)) )
))
(declare-datatypes ((List!24466 0))(
  ( (Nil!24463) (Cons!24462 (h!25680 tuple2!17674) (t!34959 List!24466)) )
))
(declare-datatypes ((ListLongMap!15651 0))(
  ( (ListLongMap!15652 (toList!7841 List!24466)) )
))
(declare-fun lt!498182 () ListLongMap!15651)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!42513)

(declare-fun zeroValue!944 () V!42513)

(declare-fun getCurrentListMapNoExtraKeys!4371 (array!73013 array!73015 (_ BitVec 32) (_ BitVec 32) V!42513 V!42513 (_ BitVec 32) Int) ListLongMap!15651)

(declare-fun dynLambda!2460 (Int (_ BitVec 64)) V!42513)

(assert (=> b!1120457 (= lt!498182 (getCurrentListMapNoExtraKeys!4371 lt!498181 (array!73016 (store (arr!35154 _values!996) i!673 (ValueCellFull!13310 (dynLambda!2460 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35691 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!498183 () ListLongMap!15651)

(assert (=> b!1120457 (= lt!498183 (getCurrentListMapNoExtraKeys!4371 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1120458 () Bool)

(declare-fun res!748045 () Bool)

(assert (=> b!1120458 (=> (not res!748045) (not e!638236))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73013 (_ BitVec 32)) Bool)

(assert (=> b!1120458 (= res!748045 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1120459 () Bool)

(declare-fun res!748042 () Bool)

(assert (=> b!1120459 (=> (not res!748042) (not e!638236))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1120459 (= res!748042 (validMask!0 mask!1564))))

(declare-fun b!1120460 () Bool)

(assert (=> b!1120460 (= e!638236 e!638235)))

(declare-fun res!748038 () Bool)

(assert (=> b!1120460 (=> (not res!748038) (not e!638235))))

(assert (=> b!1120460 (= res!748038 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!498181 mask!1564))))

(assert (=> b!1120460 (= lt!498181 (array!73014 (store (arr!35153 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35690 _keys!1208)))))

(declare-fun b!1120461 () Bool)

(assert (=> b!1120461 (= e!638240 tp_is_empty!28039)))

(declare-fun b!1120462 () Bool)

(declare-fun res!748036 () Bool)

(assert (=> b!1120462 (=> (not res!748036) (not e!638236))))

(assert (=> b!1120462 (= res!748036 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35690 _keys!1208))))))

(assert (= (and start!98044 res!748035) b!1120459))

(assert (= (and b!1120459 res!748042) b!1120454))

(assert (= (and b!1120454 res!748041) b!1120458))

(assert (= (and b!1120458 res!748045) b!1120449))

(assert (= (and b!1120449 res!748043) b!1120462))

(assert (= (and b!1120462 res!748036) b!1120452))

(assert (= (and b!1120452 res!748040) b!1120455))

(assert (= (and b!1120455 res!748039) b!1120460))

(assert (= (and b!1120460 res!748038) b!1120450))

(assert (= (and b!1120450 res!748037) b!1120453))

(assert (= (and b!1120453 (not res!748044)) b!1120457))

(assert (= (and b!1120456 condMapEmpty!43876) mapIsEmpty!43876))

(assert (= (and b!1120456 (not condMapEmpty!43876)) mapNonEmpty!43876))

(get-info :version)

(assert (= (and mapNonEmpty!43876 ((_ is ValueCellFull!13310) mapValue!43876)) b!1120461))

(assert (= (and b!1120456 ((_ is ValueCellFull!13310) mapDefault!43876)) b!1120451))

(assert (= start!98044 b!1120456))

(declare-fun b_lambda!18489 () Bool)

(assert (=> (not b_lambda!18489) (not b!1120457)))

(declare-fun t!34957 () Bool)

(declare-fun tb!8313 () Bool)

(assert (=> (and start!98044 (= defaultEntry!1004 defaultEntry!1004) t!34957) tb!8313))

(declare-fun result!17195 () Bool)

(assert (=> tb!8313 (= result!17195 tp_is_empty!28039)))

(assert (=> b!1120457 t!34957))

(declare-fun b_and!37813 () Bool)

(assert (= b_and!37811 (and (=> t!34957 result!17195) b_and!37813)))

(declare-fun m!1036149 () Bool)

(assert (=> b!1120460 m!1036149))

(declare-fun m!1036151 () Bool)

(assert (=> b!1120460 m!1036151))

(declare-fun m!1036153 () Bool)

(assert (=> b!1120453 m!1036153))

(declare-fun m!1036155 () Bool)

(assert (=> b!1120453 m!1036155))

(declare-fun m!1036157 () Bool)

(assert (=> b!1120459 m!1036157))

(declare-fun m!1036159 () Bool)

(assert (=> mapNonEmpty!43876 m!1036159))

(declare-fun m!1036161 () Bool)

(assert (=> b!1120450 m!1036161))

(declare-fun m!1036163 () Bool)

(assert (=> b!1120457 m!1036163))

(declare-fun m!1036165 () Bool)

(assert (=> b!1120457 m!1036165))

(declare-fun m!1036167 () Bool)

(assert (=> b!1120457 m!1036167))

(declare-fun m!1036169 () Bool)

(assert (=> b!1120457 m!1036169))

(declare-fun m!1036171 () Bool)

(assert (=> b!1120449 m!1036171))

(declare-fun m!1036173 () Bool)

(assert (=> b!1120458 m!1036173))

(declare-fun m!1036175 () Bool)

(assert (=> b!1120452 m!1036175))

(declare-fun m!1036177 () Bool)

(assert (=> b!1120455 m!1036177))

(declare-fun m!1036179 () Bool)

(assert (=> start!98044 m!1036179))

(declare-fun m!1036181 () Bool)

(assert (=> start!98044 m!1036181))

(check-sat (not b_lambda!18489) (not mapNonEmpty!43876) (not b!1120450) (not b_next!23509) b_and!37813 (not b!1120453) (not b!1120452) (not b!1120459) (not start!98044) tp_is_empty!28039 (not b!1120457) (not b!1120458) (not b!1120460) (not b!1120449))
(check-sat b_and!37813 (not b_next!23509))
