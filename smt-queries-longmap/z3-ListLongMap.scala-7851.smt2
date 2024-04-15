; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97844 () Bool)

(assert start!97844)

(declare-fun b_free!23551 () Bool)

(declare-fun b_next!23551 () Bool)

(assert (=> start!97844 (= b_free!23551 (not b_next!23551))))

(declare-fun tp!83356 () Bool)

(declare-fun b_and!37863 () Bool)

(assert (=> start!97844 (= tp!83356 b_and!37863)))

(declare-fun b!1119917 () Bool)

(declare-fun res!748142 () Bool)

(declare-fun e!637741 () Bool)

(assert (=> b!1119917 (=> (not res!748142) (not e!637741))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1119917 (= res!748142 (validMask!0 mask!1564))))

(declare-fun b!1119918 () Bool)

(declare-fun res!748146 () Bool)

(assert (=> b!1119918 (=> (not res!748146) (not e!637741))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1119918 (= res!748146 (validKeyInArray!0 k0!934))))

(declare-fun mapNonEmpty!43939 () Bool)

(declare-fun mapRes!43939 () Bool)

(declare-fun tp!83357 () Bool)

(declare-fun e!637743 () Bool)

(assert (=> mapNonEmpty!43939 (= mapRes!43939 (and tp!83357 e!637743))))

(declare-datatypes ((V!42569 0))(
  ( (V!42570 (val!14097 Int)) )
))
(declare-datatypes ((ValueCell!13331 0))(
  ( (ValueCellFull!13331 (v!16729 V!42569)) (EmptyCell!13331) )
))
(declare-fun mapRest!43939 () (Array (_ BitVec 32) ValueCell!13331))

(declare-fun mapKey!43939 () (_ BitVec 32))

(declare-fun mapValue!43939 () ValueCell!13331)

(declare-datatypes ((array!72956 0))(
  ( (array!72957 (arr!35131 (Array (_ BitVec 32) ValueCell!13331)) (size!35669 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72956)

(assert (=> mapNonEmpty!43939 (= (arr!35131 _values!996) (store mapRest!43939 mapKey!43939 mapValue!43939))))

(declare-fun b!1119920 () Bool)

(declare-fun res!748143 () Bool)

(assert (=> b!1119920 (=> (not res!748143) (not e!637741))))

(declare-datatypes ((array!72958 0))(
  ( (array!72959 (arr!35132 (Array (_ BitVec 32) (_ BitVec 64))) (size!35670 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72958)

(declare-datatypes ((List!24522 0))(
  ( (Nil!24519) (Cons!24518 (h!25727 (_ BitVec 64)) (t!35056 List!24522)) )
))
(declare-fun arrayNoDuplicates!0 (array!72958 (_ BitVec 32) List!24522) Bool)

(assert (=> b!1119920 (= res!748143 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24519))))

(declare-fun b!1119921 () Bool)

(declare-fun tp_is_empty!28081 () Bool)

(assert (=> b!1119921 (= e!637743 tp_is_empty!28081)))

(declare-fun b!1119922 () Bool)

(declare-fun res!748139 () Bool)

(assert (=> b!1119922 (=> (not res!748139) (not e!637741))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1119922 (= res!748139 (= (select (arr!35132 _keys!1208) i!673) k0!934))))

(declare-fun b!1119923 () Bool)

(declare-fun res!748138 () Bool)

(assert (=> b!1119923 (=> (not res!748138) (not e!637741))))

(assert (=> b!1119923 (= res!748138 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35670 _keys!1208))))))

(declare-fun b!1119924 () Bool)

(declare-fun e!637746 () Bool)

(declare-fun e!637740 () Bool)

(assert (=> b!1119924 (= e!637746 (and e!637740 mapRes!43939))))

(declare-fun condMapEmpty!43939 () Bool)

(declare-fun mapDefault!43939 () ValueCell!13331)

(assert (=> b!1119924 (= condMapEmpty!43939 (= (arr!35131 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13331)) mapDefault!43939)))))

(declare-fun b!1119925 () Bool)

(declare-fun res!748145 () Bool)

(assert (=> b!1119925 (=> (not res!748145) (not e!637741))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72958 (_ BitVec 32)) Bool)

(assert (=> b!1119925 (= res!748145 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1119926 () Bool)

(declare-fun e!637742 () Bool)

(declare-fun e!637744 () Bool)

(assert (=> b!1119926 (= e!637742 (not e!637744))))

(declare-fun res!748144 () Bool)

(assert (=> b!1119926 (=> res!748144 e!637744)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1119926 (= res!748144 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!72958 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1119926 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36575 0))(
  ( (Unit!36576) )
))
(declare-fun lt!497719 () Unit!36575)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72958 (_ BitVec 64) (_ BitVec 32)) Unit!36575)

(assert (=> b!1119926 (= lt!497719 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1119927 () Bool)

(declare-fun res!748141 () Bool)

(assert (=> b!1119927 (=> (not res!748141) (not e!637742))))

(declare-fun lt!497721 () array!72958)

(assert (=> b!1119927 (= res!748141 (arrayNoDuplicates!0 lt!497721 #b00000000000000000000000000000000 Nil!24519))))

(declare-fun b!1119919 () Bool)

(declare-fun res!748140 () Bool)

(assert (=> b!1119919 (=> (not res!748140) (not e!637741))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1119919 (= res!748140 (and (= (size!35669 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35670 _keys!1208) (size!35669 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun res!748137 () Bool)

(assert (=> start!97844 (=> (not res!748137) (not e!637741))))

(assert (=> start!97844 (= res!748137 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35670 _keys!1208))))))

(assert (=> start!97844 e!637741))

(assert (=> start!97844 tp_is_empty!28081))

(declare-fun array_inv!27054 (array!72958) Bool)

(assert (=> start!97844 (array_inv!27054 _keys!1208)))

(assert (=> start!97844 true))

(assert (=> start!97844 tp!83356))

(declare-fun array_inv!27055 (array!72956) Bool)

(assert (=> start!97844 (and (array_inv!27055 _values!996) e!637746)))

(declare-fun mapIsEmpty!43939 () Bool)

(assert (=> mapIsEmpty!43939 mapRes!43939))

(declare-fun b!1119928 () Bool)

(assert (=> b!1119928 (= e!637740 tp_is_empty!28081)))

(declare-fun b!1119929 () Bool)

(assert (=> b!1119929 (= e!637741 e!637742)))

(declare-fun res!748147 () Bool)

(assert (=> b!1119929 (=> (not res!748147) (not e!637742))))

(assert (=> b!1119929 (= res!748147 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!497721 mask!1564))))

(assert (=> b!1119929 (= lt!497721 (array!72959 (store (arr!35132 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35670 _keys!1208)))))

(declare-fun b!1119930 () Bool)

(assert (=> b!1119930 (= e!637744 true)))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!17750 0))(
  ( (tuple2!17751 (_1!8886 (_ BitVec 64)) (_2!8886 V!42569)) )
))
(declare-datatypes ((List!24523 0))(
  ( (Nil!24520) (Cons!24519 (h!25728 tuple2!17750) (t!35057 List!24523)) )
))
(declare-datatypes ((ListLongMap!15719 0))(
  ( (ListLongMap!15720 (toList!7875 List!24523)) )
))
(declare-fun lt!497718 () ListLongMap!15719)

(declare-fun zeroValue!944 () V!42569)

(declare-fun minValue!944 () V!42569)

(declare-fun getCurrentListMapNoExtraKeys!4384 (array!72958 array!72956 (_ BitVec 32) (_ BitVec 32) V!42569 V!42569 (_ BitVec 32) Int) ListLongMap!15719)

(declare-fun dynLambda!2427 (Int (_ BitVec 64)) V!42569)

(assert (=> b!1119930 (= lt!497718 (getCurrentListMapNoExtraKeys!4384 lt!497721 (array!72957 (store (arr!35131 _values!996) i!673 (ValueCellFull!13331 (dynLambda!2427 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35669 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!497720 () ListLongMap!15719)

(assert (=> b!1119930 (= lt!497720 (getCurrentListMapNoExtraKeys!4384 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (= (and start!97844 res!748137) b!1119917))

(assert (= (and b!1119917 res!748142) b!1119919))

(assert (= (and b!1119919 res!748140) b!1119925))

(assert (= (and b!1119925 res!748145) b!1119920))

(assert (= (and b!1119920 res!748143) b!1119923))

(assert (= (and b!1119923 res!748138) b!1119918))

(assert (= (and b!1119918 res!748146) b!1119922))

(assert (= (and b!1119922 res!748139) b!1119929))

(assert (= (and b!1119929 res!748147) b!1119927))

(assert (= (and b!1119927 res!748141) b!1119926))

(assert (= (and b!1119926 (not res!748144)) b!1119930))

(assert (= (and b!1119924 condMapEmpty!43939) mapIsEmpty!43939))

(assert (= (and b!1119924 (not condMapEmpty!43939)) mapNonEmpty!43939))

(get-info :version)

(assert (= (and mapNonEmpty!43939 ((_ is ValueCellFull!13331) mapValue!43939)) b!1119921))

(assert (= (and b!1119924 ((_ is ValueCellFull!13331) mapDefault!43939)) b!1119928))

(assert (= start!97844 b!1119924))

(declare-fun b_lambda!18503 () Bool)

(assert (=> (not b_lambda!18503) (not b!1119930)))

(declare-fun t!35055 () Bool)

(declare-fun tb!8355 () Bool)

(assert (=> (and start!97844 (= defaultEntry!1004 defaultEntry!1004) t!35055) tb!8355))

(declare-fun result!17279 () Bool)

(assert (=> tb!8355 (= result!17279 tp_is_empty!28081)))

(assert (=> b!1119930 t!35055))

(declare-fun b_and!37865 () Bool)

(assert (= b_and!37863 (and (=> t!35055 result!17279) b_and!37865)))

(declare-fun m!1034565 () Bool)

(assert (=> b!1119927 m!1034565))

(declare-fun m!1034567 () Bool)

(assert (=> mapNonEmpty!43939 m!1034567))

(declare-fun m!1034569 () Bool)

(assert (=> b!1119920 m!1034569))

(declare-fun m!1034571 () Bool)

(assert (=> b!1119918 m!1034571))

(declare-fun m!1034573 () Bool)

(assert (=> b!1119926 m!1034573))

(declare-fun m!1034575 () Bool)

(assert (=> b!1119926 m!1034575))

(declare-fun m!1034577 () Bool)

(assert (=> b!1119917 m!1034577))

(declare-fun m!1034579 () Bool)

(assert (=> b!1119929 m!1034579))

(declare-fun m!1034581 () Bool)

(assert (=> b!1119929 m!1034581))

(declare-fun m!1034583 () Bool)

(assert (=> b!1119925 m!1034583))

(declare-fun m!1034585 () Bool)

(assert (=> b!1119930 m!1034585))

(declare-fun m!1034587 () Bool)

(assert (=> b!1119930 m!1034587))

(declare-fun m!1034589 () Bool)

(assert (=> b!1119930 m!1034589))

(declare-fun m!1034591 () Bool)

(assert (=> b!1119930 m!1034591))

(declare-fun m!1034593 () Bool)

(assert (=> b!1119922 m!1034593))

(declare-fun m!1034595 () Bool)

(assert (=> start!97844 m!1034595))

(declare-fun m!1034597 () Bool)

(assert (=> start!97844 m!1034597))

(check-sat (not b!1119925) (not b!1119918) (not start!97844) (not b!1119926) (not b_lambda!18503) (not b!1119927) b_and!37865 (not b!1119920) (not mapNonEmpty!43939) (not b!1119930) (not b_next!23551) (not b!1119917) (not b!1119929) tp_is_empty!28081)
(check-sat b_and!37865 (not b_next!23551))
