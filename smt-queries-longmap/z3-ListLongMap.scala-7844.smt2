; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97810 () Bool)

(assert start!97810)

(declare-fun b_free!23511 () Bool)

(declare-fun b_next!23511 () Bool)

(assert (=> start!97810 (= b_free!23511 (not b_next!23511))))

(declare-fun tp!83236 () Bool)

(declare-fun b_and!37805 () Bool)

(assert (=> start!97810 (= tp!83236 b_and!37805)))

(declare-fun b!1119166 () Bool)

(declare-fun e!637402 () Bool)

(declare-fun e!637407 () Bool)

(assert (=> b!1119166 (= e!637402 (not e!637407))))

(declare-fun res!747555 () Bool)

(assert (=> b!1119166 (=> res!747555 e!637407)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1119166 (= res!747555 (bvsgt from!1455 i!673))))

(declare-datatypes ((array!72969 0))(
  ( (array!72970 (arr!35137 (Array (_ BitVec 32) (_ BitVec 64))) (size!35673 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72969)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!72969 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1119166 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36728 0))(
  ( (Unit!36729) )
))
(declare-fun lt!497681 () Unit!36728)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72969 (_ BitVec 64) (_ BitVec 32)) Unit!36728)

(assert (=> b!1119166 (= lt!497681 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1119167 () Bool)

(assert (=> b!1119167 (= e!637407 true)))

(declare-datatypes ((V!42515 0))(
  ( (V!42516 (val!14077 Int)) )
))
(declare-fun zeroValue!944 () V!42515)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!13311 0))(
  ( (ValueCellFull!13311 (v!16710 V!42515)) (EmptyCell!13311) )
))
(declare-datatypes ((array!72971 0))(
  ( (array!72972 (arr!35138 (Array (_ BitVec 32) ValueCell!13311)) (size!35674 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72971)

(declare-fun minValue!944 () V!42515)

(declare-fun lt!497680 () array!72969)

(declare-datatypes ((tuple2!17662 0))(
  ( (tuple2!17663 (_1!8842 (_ BitVec 64)) (_2!8842 V!42515)) )
))
(declare-datatypes ((List!24446 0))(
  ( (Nil!24443) (Cons!24442 (h!25651 tuple2!17662) (t!34949 List!24446)) )
))
(declare-datatypes ((ListLongMap!15631 0))(
  ( (ListLongMap!15632 (toList!7831 List!24446)) )
))
(declare-fun lt!497679 () ListLongMap!15631)

(declare-fun getCurrentListMapNoExtraKeys!4321 (array!72969 array!72971 (_ BitVec 32) (_ BitVec 32) V!42515 V!42515 (_ BitVec 32) Int) ListLongMap!15631)

(declare-fun dynLambda!2425 (Int (_ BitVec 64)) V!42515)

(assert (=> b!1119167 (= lt!497679 (getCurrentListMapNoExtraKeys!4321 lt!497680 (array!72972 (store (arr!35138 _values!996) i!673 (ValueCellFull!13311 (dynLambda!2425 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35674 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!497678 () ListLongMap!15631)

(assert (=> b!1119167 (= lt!497678 (getCurrentListMapNoExtraKeys!4321 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun res!747553 () Bool)

(declare-fun e!637406 () Bool)

(assert (=> start!97810 (=> (not res!747553) (not e!637406))))

(assert (=> start!97810 (= res!747553 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35673 _keys!1208))))))

(assert (=> start!97810 e!637406))

(declare-fun tp_is_empty!28041 () Bool)

(assert (=> start!97810 tp_is_empty!28041))

(declare-fun array_inv!26996 (array!72969) Bool)

(assert (=> start!97810 (array_inv!26996 _keys!1208)))

(assert (=> start!97810 true))

(assert (=> start!97810 tp!83236))

(declare-fun e!637404 () Bool)

(declare-fun array_inv!26997 (array!72971) Bool)

(assert (=> start!97810 (and (array_inv!26997 _values!996) e!637404)))

(declare-fun b!1119168 () Bool)

(declare-fun res!747550 () Bool)

(assert (=> b!1119168 (=> (not res!747550) (not e!637406))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1119168 (= res!747550 (validKeyInArray!0 k0!934))))

(declare-fun b!1119169 () Bool)

(declare-fun res!747546 () Bool)

(assert (=> b!1119169 (=> (not res!747546) (not e!637406))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1119169 (= res!747546 (validMask!0 mask!1564))))

(declare-fun b!1119170 () Bool)

(declare-fun res!747549 () Bool)

(assert (=> b!1119170 (=> (not res!747549) (not e!637406))))

(assert (=> b!1119170 (= res!747549 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35673 _keys!1208))))))

(declare-fun b!1119171 () Bool)

(declare-fun res!747556 () Bool)

(assert (=> b!1119171 (=> (not res!747556) (not e!637406))))

(declare-datatypes ((List!24447 0))(
  ( (Nil!24444) (Cons!24443 (h!25652 (_ BitVec 64)) (t!34950 List!24447)) )
))
(declare-fun arrayNoDuplicates!0 (array!72969 (_ BitVec 32) List!24447) Bool)

(assert (=> b!1119171 (= res!747556 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24444))))

(declare-fun b!1119172 () Bool)

(declare-fun res!747548 () Bool)

(assert (=> b!1119172 (=> (not res!747548) (not e!637406))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72969 (_ BitVec 32)) Bool)

(assert (=> b!1119172 (= res!747548 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1119173 () Bool)

(assert (=> b!1119173 (= e!637406 e!637402)))

(declare-fun res!747552 () Bool)

(assert (=> b!1119173 (=> (not res!747552) (not e!637402))))

(assert (=> b!1119173 (= res!747552 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!497680 mask!1564))))

(assert (=> b!1119173 (= lt!497680 (array!72970 (store (arr!35137 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35673 _keys!1208)))))

(declare-fun b!1119174 () Bool)

(declare-fun res!747554 () Bool)

(assert (=> b!1119174 (=> (not res!747554) (not e!637402))))

(assert (=> b!1119174 (= res!747554 (arrayNoDuplicates!0 lt!497680 #b00000000000000000000000000000000 Nil!24444))))

(declare-fun b!1119175 () Bool)

(declare-fun res!747551 () Bool)

(assert (=> b!1119175 (=> (not res!747551) (not e!637406))))

(assert (=> b!1119175 (= res!747551 (and (= (size!35674 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35673 _keys!1208) (size!35674 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!43879 () Bool)

(declare-fun mapRes!43879 () Bool)

(declare-fun tp!83237 () Bool)

(declare-fun e!637405 () Bool)

(assert (=> mapNonEmpty!43879 (= mapRes!43879 (and tp!83237 e!637405))))

(declare-fun mapValue!43879 () ValueCell!13311)

(declare-fun mapKey!43879 () (_ BitVec 32))

(declare-fun mapRest!43879 () (Array (_ BitVec 32) ValueCell!13311))

(assert (=> mapNonEmpty!43879 (= (arr!35138 _values!996) (store mapRest!43879 mapKey!43879 mapValue!43879))))

(declare-fun b!1119176 () Bool)

(declare-fun res!747547 () Bool)

(assert (=> b!1119176 (=> (not res!747547) (not e!637406))))

(assert (=> b!1119176 (= res!747547 (= (select (arr!35137 _keys!1208) i!673) k0!934))))

(declare-fun b!1119177 () Bool)

(declare-fun e!637401 () Bool)

(assert (=> b!1119177 (= e!637404 (and e!637401 mapRes!43879))))

(declare-fun condMapEmpty!43879 () Bool)

(declare-fun mapDefault!43879 () ValueCell!13311)

(assert (=> b!1119177 (= condMapEmpty!43879 (= (arr!35138 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13311)) mapDefault!43879)))))

(declare-fun b!1119178 () Bool)

(assert (=> b!1119178 (= e!637405 tp_is_empty!28041)))

(declare-fun mapIsEmpty!43879 () Bool)

(assert (=> mapIsEmpty!43879 mapRes!43879))

(declare-fun b!1119179 () Bool)

(assert (=> b!1119179 (= e!637401 tp_is_empty!28041)))

(assert (= (and start!97810 res!747553) b!1119169))

(assert (= (and b!1119169 res!747546) b!1119175))

(assert (= (and b!1119175 res!747551) b!1119172))

(assert (= (and b!1119172 res!747548) b!1119171))

(assert (= (and b!1119171 res!747556) b!1119170))

(assert (= (and b!1119170 res!747549) b!1119168))

(assert (= (and b!1119168 res!747550) b!1119176))

(assert (= (and b!1119176 res!747547) b!1119173))

(assert (= (and b!1119173 res!747552) b!1119174))

(assert (= (and b!1119174 res!747554) b!1119166))

(assert (= (and b!1119166 (not res!747555)) b!1119167))

(assert (= (and b!1119177 condMapEmpty!43879) mapIsEmpty!43879))

(assert (= (and b!1119177 (not condMapEmpty!43879)) mapNonEmpty!43879))

(get-info :version)

(assert (= (and mapNonEmpty!43879 ((_ is ValueCellFull!13311) mapValue!43879)) b!1119178))

(assert (= (and b!1119177 ((_ is ValueCellFull!13311) mapDefault!43879)) b!1119179))

(assert (= start!97810 b!1119177))

(declare-fun b_lambda!18481 () Bool)

(assert (=> (not b_lambda!18481) (not b!1119167)))

(declare-fun t!34948 () Bool)

(declare-fun tb!8323 () Bool)

(assert (=> (and start!97810 (= defaultEntry!1004 defaultEntry!1004) t!34948) tb!8323))

(declare-fun result!17207 () Bool)

(assert (=> tb!8323 (= result!17207 tp_is_empty!28041)))

(assert (=> b!1119167 t!34948))

(declare-fun b_and!37807 () Bool)

(assert (= b_and!37805 (and (=> t!34948 result!17207) b_and!37807)))

(declare-fun m!1034511 () Bool)

(assert (=> b!1119168 m!1034511))

(declare-fun m!1034513 () Bool)

(assert (=> b!1119176 m!1034513))

(declare-fun m!1034515 () Bool)

(assert (=> start!97810 m!1034515))

(declare-fun m!1034517 () Bool)

(assert (=> start!97810 m!1034517))

(declare-fun m!1034519 () Bool)

(assert (=> b!1119172 m!1034519))

(declare-fun m!1034521 () Bool)

(assert (=> b!1119173 m!1034521))

(declare-fun m!1034523 () Bool)

(assert (=> b!1119173 m!1034523))

(declare-fun m!1034525 () Bool)

(assert (=> b!1119171 m!1034525))

(declare-fun m!1034527 () Bool)

(assert (=> b!1119174 m!1034527))

(declare-fun m!1034529 () Bool)

(assert (=> b!1119167 m!1034529))

(declare-fun m!1034531 () Bool)

(assert (=> b!1119167 m!1034531))

(declare-fun m!1034533 () Bool)

(assert (=> b!1119167 m!1034533))

(declare-fun m!1034535 () Bool)

(assert (=> b!1119167 m!1034535))

(declare-fun m!1034537 () Bool)

(assert (=> mapNonEmpty!43879 m!1034537))

(declare-fun m!1034539 () Bool)

(assert (=> b!1119166 m!1034539))

(declare-fun m!1034541 () Bool)

(assert (=> b!1119166 m!1034541))

(declare-fun m!1034543 () Bool)

(assert (=> b!1119169 m!1034543))

(check-sat (not b!1119171) tp_is_empty!28041 (not b!1119169) (not b!1119172) (not b!1119166) (not b!1119167) (not b_lambda!18481) (not start!97810) (not b_next!23511) (not b!1119174) (not mapNonEmpty!43879) (not b!1119173) (not b!1119168) b_and!37807)
(check-sat b_and!37807 (not b_next!23511))
