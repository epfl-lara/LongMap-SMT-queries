; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99730 () Bool)

(assert start!99730)

(declare-fun b_free!25309 () Bool)

(declare-fun b_next!25309 () Bool)

(assert (=> start!99730 (= b_free!25309 (not b_next!25309))))

(declare-fun tp!88641 () Bool)

(declare-fun b_and!41485 () Bool)

(assert (=> start!99730 (= tp!88641 b_and!41485)))

(declare-fun b!1183865 () Bool)

(declare-fun res!786860 () Bool)

(declare-fun e!673096 () Bool)

(assert (=> b!1183865 (=> (not res!786860) (not e!673096))))

(declare-datatypes ((array!76479 0))(
  ( (array!76480 (arr!36889 (Array (_ BitVec 32) (_ BitVec 64))) (size!37425 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76479)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1183865 (= res!786860 (= (select (arr!36889 _keys!1208) i!673) k!934))))

(declare-fun b!1183866 () Bool)

(declare-fun res!786864 () Bool)

(assert (=> b!1183866 (=> (not res!786864) (not e!673096))))

(assert (=> b!1183866 (= res!786864 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37425 _keys!1208))))))

(declare-fun b!1183867 () Bool)

(declare-fun res!786862 () Bool)

(declare-fun e!673092 () Bool)

(assert (=> b!1183867 (=> (not res!786862) (not e!673092))))

(declare-fun lt!536573 () array!76479)

(declare-datatypes ((List!25941 0))(
  ( (Nil!25938) (Cons!25937 (h!27146 (_ BitVec 64)) (t!38242 List!25941)) )
))
(declare-fun arrayNoDuplicates!0 (array!76479 (_ BitVec 32) List!25941) Bool)

(assert (=> b!1183867 (= res!786862 (arrayNoDuplicates!0 lt!536573 #b00000000000000000000000000000000 Nil!25938))))

(declare-fun b!1183868 () Bool)

(assert (=> b!1183868 (= e!673096 e!673092)))

(declare-fun res!786856 () Bool)

(assert (=> b!1183868 (=> (not res!786856) (not e!673092))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76479 (_ BitVec 32)) Bool)

(assert (=> b!1183868 (= res!786856 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!536573 mask!1564))))

(assert (=> b!1183868 (= lt!536573 (array!76480 (store (arr!36889 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37425 _keys!1208)))))

(declare-fun b!1183869 () Bool)

(declare-fun res!786857 () Bool)

(assert (=> b!1183869 (=> (not res!786857) (not e!673096))))

(assert (=> b!1183869 (= res!786857 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapNonEmpty!46586 () Bool)

(declare-fun mapRes!46586 () Bool)

(declare-fun tp!88640 () Bool)

(declare-fun e!673100 () Bool)

(assert (=> mapNonEmpty!46586 (= mapRes!46586 (and tp!88640 e!673100))))

(declare-datatypes ((V!44913 0))(
  ( (V!44914 (val!14976 Int)) )
))
(declare-datatypes ((ValueCell!14210 0))(
  ( (ValueCellFull!14210 (v!17614 V!44913)) (EmptyCell!14210) )
))
(declare-fun mapValue!46586 () ValueCell!14210)

(declare-fun mapRest!46586 () (Array (_ BitVec 32) ValueCell!14210))

(declare-fun mapKey!46586 () (_ BitVec 32))

(declare-datatypes ((array!76481 0))(
  ( (array!76482 (arr!36890 (Array (_ BitVec 32) ValueCell!14210)) (size!37426 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76481)

(assert (=> mapNonEmpty!46586 (= (arr!36890 _values!996) (store mapRest!46586 mapKey!46586 mapValue!46586))))

(declare-fun b!1183870 () Bool)

(declare-fun e!673093 () Bool)

(declare-fun e!673097 () Bool)

(assert (=> b!1183870 (= e!673093 e!673097)))

(declare-fun res!786865 () Bool)

(assert (=> b!1183870 (=> res!786865 e!673097)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1183870 (= res!786865 (not (= (select (arr!36889 _keys!1208) from!1455) k!934)))))

(declare-fun b!1183871 () Bool)

(declare-fun res!786859 () Bool)

(assert (=> b!1183871 (=> (not res!786859) (not e!673096))))

(assert (=> b!1183871 (= res!786859 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25938))))

(declare-fun b!1183872 () Bool)

(declare-fun e!673098 () Bool)

(assert (=> b!1183872 (= e!673092 (not e!673098))))

(declare-fun res!786855 () Bool)

(assert (=> b!1183872 (=> res!786855 e!673098)))

(assert (=> b!1183872 (= res!786855 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!76479 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1183872 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39189 0))(
  ( (Unit!39190) )
))
(declare-fun lt!536560 () Unit!39189)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76479 (_ BitVec 64) (_ BitVec 32)) Unit!39189)

(assert (=> b!1183872 (= lt!536560 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1183873 () Bool)

(declare-fun e!673102 () Bool)

(declare-fun tp_is_empty!29839 () Bool)

(assert (=> b!1183873 (= e!673102 tp_is_empty!29839)))

(declare-fun b!1183874 () Bool)

(declare-fun e!673101 () Bool)

(assert (=> b!1183874 (= e!673098 e!673101)))

(declare-fun res!786867 () Bool)

(assert (=> b!1183874 (=> res!786867 e!673101)))

(assert (=> b!1183874 (= res!786867 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!44913)

(declare-fun lt!536577 () array!76481)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!44913)

(declare-datatypes ((tuple2!19202 0))(
  ( (tuple2!19203 (_1!9612 (_ BitVec 64)) (_2!9612 V!44913)) )
))
(declare-datatypes ((List!25942 0))(
  ( (Nil!25939) (Cons!25938 (h!27147 tuple2!19202) (t!38243 List!25942)) )
))
(declare-datatypes ((ListLongMap!17171 0))(
  ( (ListLongMap!17172 (toList!8601 List!25942)) )
))
(declare-fun lt!536568 () ListLongMap!17171)

(declare-fun getCurrentListMapNoExtraKeys!5051 (array!76479 array!76481 (_ BitVec 32) (_ BitVec 32) V!44913 V!44913 (_ BitVec 32) Int) ListLongMap!17171)

(assert (=> b!1183874 (= lt!536568 (getCurrentListMapNoExtraKeys!5051 lt!536573 lt!536577 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!536563 () V!44913)

(assert (=> b!1183874 (= lt!536577 (array!76482 (store (arr!36890 _values!996) i!673 (ValueCellFull!14210 lt!536563)) (size!37426 _values!996)))))

(declare-fun dynLambda!3002 (Int (_ BitVec 64)) V!44913)

(assert (=> b!1183874 (= lt!536563 (dynLambda!3002 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!536559 () ListLongMap!17171)

(assert (=> b!1183874 (= lt!536559 (getCurrentListMapNoExtraKeys!5051 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1183875 () Bool)

(declare-fun e!673094 () Unit!39189)

(declare-fun Unit!39191 () Unit!39189)

(assert (=> b!1183875 (= e!673094 Unit!39191)))

(declare-fun b!1183876 () Bool)

(declare-fun res!786863 () Bool)

(assert (=> b!1183876 (=> (not res!786863) (not e!673096))))

(assert (=> b!1183876 (= res!786863 (and (= (size!37426 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37425 _keys!1208) (size!37426 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1183877 () Bool)

(declare-fun res!786866 () Bool)

(assert (=> b!1183877 (=> (not res!786866) (not e!673096))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1183877 (= res!786866 (validKeyInArray!0 k!934))))

(declare-fun res!786858 () Bool)

(assert (=> start!99730 (=> (not res!786858) (not e!673096))))

(assert (=> start!99730 (= res!786858 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37425 _keys!1208))))))

(assert (=> start!99730 e!673096))

(assert (=> start!99730 tp_is_empty!29839))

(declare-fun array_inv!28156 (array!76479) Bool)

(assert (=> start!99730 (array_inv!28156 _keys!1208)))

(assert (=> start!99730 true))

(assert (=> start!99730 tp!88641))

(declare-fun e!673091 () Bool)

(declare-fun array_inv!28157 (array!76481) Bool)

(assert (=> start!99730 (and (array_inv!28157 _values!996) e!673091)))

(declare-fun b!1183878 () Bool)

(declare-fun res!786861 () Bool)

(assert (=> b!1183878 (=> (not res!786861) (not e!673096))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1183878 (= res!786861 (validMask!0 mask!1564))))

(declare-fun mapIsEmpty!46586 () Bool)

(assert (=> mapIsEmpty!46586 mapRes!46586))

(declare-fun b!1183879 () Bool)

(declare-fun e!673095 () Bool)

(assert (=> b!1183879 (= e!673101 e!673095)))

(declare-fun res!786854 () Bool)

(assert (=> b!1183879 (=> res!786854 e!673095)))

(assert (=> b!1183879 (= res!786854 (not (validKeyInArray!0 (select (arr!36889 _keys!1208) from!1455))))))

(declare-fun lt!536562 () ListLongMap!17171)

(declare-fun lt!536575 () ListLongMap!17171)

(assert (=> b!1183879 (= lt!536562 lt!536575)))

(declare-fun lt!536567 () ListLongMap!17171)

(declare-fun -!1636 (ListLongMap!17171 (_ BitVec 64)) ListLongMap!17171)

(assert (=> b!1183879 (= lt!536575 (-!1636 lt!536567 k!934))))

(assert (=> b!1183879 (= lt!536562 (getCurrentListMapNoExtraKeys!5051 lt!536573 lt!536577 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1183879 (= lt!536567 (getCurrentListMapNoExtraKeys!5051 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!536572 () Unit!39189)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!856 (array!76479 array!76481 (_ BitVec 32) (_ BitVec 32) V!44913 V!44913 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39189)

(assert (=> b!1183879 (= lt!536572 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!856 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1183880 () Bool)

(assert (=> b!1183880 (= e!673097 (arrayContainsKey!0 _keys!1208 k!934 i!673))))

(declare-fun b!1183881 () Bool)

(assert (=> b!1183881 (= e!673091 (and e!673102 mapRes!46586))))

(declare-fun condMapEmpty!46586 () Bool)

(declare-fun mapDefault!46586 () ValueCell!14210)

