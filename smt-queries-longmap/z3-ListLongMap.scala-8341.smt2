; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101532 () Bool)

(assert start!101532)

(declare-fun b_free!26319 () Bool)

(declare-fun b_next!26319 () Bool)

(assert (=> start!101532 (= b_free!26319 (not b_next!26319))))

(declare-fun tp!91994 () Bool)

(declare-fun b_and!43845 () Bool)

(assert (=> start!101532 (= tp!91994 b_and!43845)))

(declare-fun b!1220760 () Bool)

(declare-fun e!693213 () Bool)

(declare-fun e!693203 () Bool)

(assert (=> b!1220760 (= e!693213 e!693203)))

(declare-fun res!810951 () Bool)

(assert (=> b!1220760 (=> (not res!810951) (not e!693203))))

(declare-datatypes ((array!78825 0))(
  ( (array!78826 (arr!38042 (Array (_ BitVec 32) (_ BitVec 64))) (size!38578 (_ BitVec 32))) )
))
(declare-fun lt!555204 () array!78825)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78825 (_ BitVec 32)) Bool)

(assert (=> b!1220760 (= res!810951 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!555204 mask!1564))))

(declare-fun _keys!1208 () array!78825)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1220760 (= lt!555204 (array!78826 (store (arr!38042 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38578 _keys!1208)))))

(declare-fun b!1220761 () Bool)

(declare-fun res!810944 () Bool)

(assert (=> b!1220761 (=> (not res!810944) (not e!693213))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1220761 (= res!810944 (validMask!0 mask!1564))))

(declare-fun res!810939 () Bool)

(assert (=> start!101532 (=> (not res!810939) (not e!693213))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!101532 (= res!810939 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38578 _keys!1208))))))

(assert (=> start!101532 e!693213))

(declare-fun tp_is_empty!31023 () Bool)

(assert (=> start!101532 tp_is_empty!31023))

(declare-fun array_inv!28948 (array!78825) Bool)

(assert (=> start!101532 (array_inv!28948 _keys!1208)))

(assert (=> start!101532 true))

(assert (=> start!101532 tp!91994))

(declare-datatypes ((V!46491 0))(
  ( (V!46492 (val!15568 Int)) )
))
(declare-datatypes ((ValueCell!14802 0))(
  ( (ValueCellFull!14802 (v!18226 V!46491)) (EmptyCell!14802) )
))
(declare-datatypes ((array!78827 0))(
  ( (array!78828 (arr!38043 (Array (_ BitVec 32) ValueCell!14802)) (size!38579 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78827)

(declare-fun e!693205 () Bool)

(declare-fun array_inv!28949 (array!78827) Bool)

(assert (=> start!101532 (and (array_inv!28949 _values!996) e!693205)))

(declare-fun mapIsEmpty!48424 () Bool)

(declare-fun mapRes!48424 () Bool)

(assert (=> mapIsEmpty!48424 mapRes!48424))

(declare-fun b!1220762 () Bool)

(declare-fun res!810948 () Bool)

(assert (=> b!1220762 (=> (not res!810948) (not e!693213))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1220762 (= res!810948 (validKeyInArray!0 k0!934))))

(declare-fun b!1220763 () Bool)

(declare-fun res!810943 () Bool)

(assert (=> b!1220763 (=> (not res!810943) (not e!693213))))

(declare-datatypes ((List!26843 0))(
  ( (Nil!26840) (Cons!26839 (h!28048 (_ BitVec 64)) (t!40142 List!26843)) )
))
(declare-fun arrayNoDuplicates!0 (array!78825 (_ BitVec 32) List!26843) Bool)

(assert (=> b!1220763 (= res!810943 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26840))))

(declare-fun mapNonEmpty!48424 () Bool)

(declare-fun tp!91993 () Bool)

(declare-fun e!693212 () Bool)

(assert (=> mapNonEmpty!48424 (= mapRes!48424 (and tp!91993 e!693212))))

(declare-fun mapValue!48424 () ValueCell!14802)

(declare-fun mapRest!48424 () (Array (_ BitVec 32) ValueCell!14802))

(declare-fun mapKey!48424 () (_ BitVec 32))

(assert (=> mapNonEmpty!48424 (= (arr!38043 _values!996) (store mapRest!48424 mapKey!48424 mapValue!48424))))

(declare-fun b!1220764 () Bool)

(declare-fun res!810949 () Bool)

(assert (=> b!1220764 (=> (not res!810949) (not e!693213))))

(assert (=> b!1220764 (= res!810949 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38578 _keys!1208))))))

(declare-fun b!1220765 () Bool)

(declare-fun res!810954 () Bool)

(assert (=> b!1220765 (=> (not res!810954) (not e!693213))))

(assert (=> b!1220765 (= res!810954 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1220766 () Bool)

(declare-fun e!693204 () Bool)

(assert (=> b!1220766 (= e!693203 (not e!693204))))

(declare-fun res!810953 () Bool)

(assert (=> b!1220766 (=> res!810953 e!693204)))

(assert (=> b!1220766 (= res!810953 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!78825 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1220766 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!40446 0))(
  ( (Unit!40447) )
))
(declare-fun lt!555196 () Unit!40446)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78825 (_ BitVec 64) (_ BitVec 32)) Unit!40446)

(assert (=> b!1220766 (= lt!555196 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1220767 () Bool)

(assert (=> b!1220767 (= e!693212 tp_is_empty!31023)))

(declare-fun b!1220768 () Bool)

(declare-fun res!810940 () Bool)

(assert (=> b!1220768 (=> (not res!810940) (not e!693213))))

(assert (=> b!1220768 (= res!810940 (= (select (arr!38042 _keys!1208) i!673) k0!934))))

(declare-fun b!1220769 () Bool)

(declare-fun e!693210 () Bool)

(assert (=> b!1220769 (= e!693210 (or (bvsge (size!38578 _keys!1208) #b01111111111111111111111111111111) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38578 _keys!1208))))))

(assert (=> b!1220769 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26840)))

(declare-fun lt!555197 () Unit!40446)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!78825 (_ BitVec 32) (_ BitVec 32)) Unit!40446)

(assert (=> b!1220769 (= lt!555197 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1220769 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!555200 () Unit!40446)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!78825 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!40446)

(assert (=> b!1220769 (= lt!555200 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1220770 () Bool)

(declare-fun e!693207 () Bool)

(assert (=> b!1220770 (= e!693207 tp_is_empty!31023)))

(declare-fun b!1220771 () Bool)

(declare-fun e!693209 () Bool)

(declare-fun e!693211 () Bool)

(assert (=> b!1220771 (= e!693209 e!693211)))

(declare-fun res!810952 () Bool)

(assert (=> b!1220771 (=> res!810952 e!693211)))

(assert (=> b!1220771 (= res!810952 (not (validKeyInArray!0 (select (arr!38042 _keys!1208) from!1455))))))

(declare-datatypes ((tuple2!20042 0))(
  ( (tuple2!20043 (_1!10032 (_ BitVec 64)) (_2!10032 V!46491)) )
))
(declare-datatypes ((List!26844 0))(
  ( (Nil!26841) (Cons!26840 (h!28049 tuple2!20042) (t!40143 List!26844)) )
))
(declare-datatypes ((ListLongMap!18011 0))(
  ( (ListLongMap!18012 (toList!9021 List!26844)) )
))
(declare-fun lt!555203 () ListLongMap!18011)

(declare-fun lt!555199 () ListLongMap!18011)

(assert (=> b!1220771 (= lt!555203 lt!555199)))

(declare-fun lt!555205 () ListLongMap!18011)

(declare-fun -!1930 (ListLongMap!18011 (_ BitVec 64)) ListLongMap!18011)

(assert (=> b!1220771 (= lt!555199 (-!1930 lt!555205 k0!934))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!46491)

(declare-fun zeroValue!944 () V!46491)

(declare-fun lt!555206 () array!78827)

(declare-fun getCurrentListMapNoExtraKeys!5444 (array!78825 array!78827 (_ BitVec 32) (_ BitVec 32) V!46491 V!46491 (_ BitVec 32) Int) ListLongMap!18011)

(assert (=> b!1220771 (= lt!555203 (getCurrentListMapNoExtraKeys!5444 lt!555204 lt!555206 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1220771 (= lt!555205 (getCurrentListMapNoExtraKeys!5444 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!555207 () Unit!40446)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1137 (array!78825 array!78827 (_ BitVec 32) (_ BitVec 32) V!46491 V!46491 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40446)

(assert (=> b!1220771 (= lt!555207 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1137 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1220772 () Bool)

(declare-fun res!810950 () Bool)

(assert (=> b!1220772 (=> (not res!810950) (not e!693203))))

(assert (=> b!1220772 (= res!810950 (arrayNoDuplicates!0 lt!555204 #b00000000000000000000000000000000 Nil!26840))))

(declare-fun e!693206 () Bool)

(declare-fun b!1220773 () Bool)

(assert (=> b!1220773 (= e!693206 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1220774 () Bool)

(assert (=> b!1220774 (= e!693211 e!693210)))

(declare-fun res!810947 () Bool)

(assert (=> b!1220774 (=> res!810947 e!693210)))

(assert (=> b!1220774 (= res!810947 (not (= (select (arr!38042 _keys!1208) from!1455) k0!934)))))

(declare-fun e!693208 () Bool)

(assert (=> b!1220774 e!693208))

(declare-fun res!810941 () Bool)

(assert (=> b!1220774 (=> (not res!810941) (not e!693208))))

(declare-fun lt!555198 () V!46491)

(declare-fun lt!555201 () ListLongMap!18011)

(declare-fun +!4087 (ListLongMap!18011 tuple2!20042) ListLongMap!18011)

(declare-fun get!19410 (ValueCell!14802 V!46491) V!46491)

(assert (=> b!1220774 (= res!810941 (= lt!555201 (+!4087 lt!555199 (tuple2!20043 (select (arr!38042 _keys!1208) from!1455) (get!19410 (select (arr!38043 _values!996) from!1455) lt!555198)))))))

(declare-fun b!1220775 () Bool)

(assert (=> b!1220775 (= e!693208 e!693206)))

(declare-fun res!810946 () Bool)

(assert (=> b!1220775 (=> res!810946 e!693206)))

(assert (=> b!1220775 (= res!810946 (not (= (select (arr!38042 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1220776 () Bool)

(declare-fun res!810945 () Bool)

(assert (=> b!1220776 (=> (not res!810945) (not e!693213))))

(assert (=> b!1220776 (= res!810945 (and (= (size!38579 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38578 _keys!1208) (size!38579 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1220777 () Bool)

(assert (=> b!1220777 (= e!693205 (and e!693207 mapRes!48424))))

(declare-fun condMapEmpty!48424 () Bool)

(declare-fun mapDefault!48424 () ValueCell!14802)

(assert (=> b!1220777 (= condMapEmpty!48424 (= (arr!38043 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14802)) mapDefault!48424)))))

(declare-fun b!1220778 () Bool)

(assert (=> b!1220778 (= e!693204 e!693209)))

(declare-fun res!810942 () Bool)

(assert (=> b!1220778 (=> res!810942 e!693209)))

(assert (=> b!1220778 (= res!810942 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(assert (=> b!1220778 (= lt!555201 (getCurrentListMapNoExtraKeys!5444 lt!555204 lt!555206 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1220778 (= lt!555206 (array!78828 (store (arr!38043 _values!996) i!673 (ValueCellFull!14802 lt!555198)) (size!38579 _values!996)))))

(declare-fun dynLambda!3325 (Int (_ BitVec 64)) V!46491)

(assert (=> b!1220778 (= lt!555198 (dynLambda!3325 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!555202 () ListLongMap!18011)

(assert (=> b!1220778 (= lt!555202 (getCurrentListMapNoExtraKeys!5444 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (= (and start!101532 res!810939) b!1220761))

(assert (= (and b!1220761 res!810944) b!1220776))

(assert (= (and b!1220776 res!810945) b!1220765))

(assert (= (and b!1220765 res!810954) b!1220763))

(assert (= (and b!1220763 res!810943) b!1220764))

(assert (= (and b!1220764 res!810949) b!1220762))

(assert (= (and b!1220762 res!810948) b!1220768))

(assert (= (and b!1220768 res!810940) b!1220760))

(assert (= (and b!1220760 res!810951) b!1220772))

(assert (= (and b!1220772 res!810950) b!1220766))

(assert (= (and b!1220766 (not res!810953)) b!1220778))

(assert (= (and b!1220778 (not res!810942)) b!1220771))

(assert (= (and b!1220771 (not res!810952)) b!1220774))

(assert (= (and b!1220774 res!810941) b!1220775))

(assert (= (and b!1220775 (not res!810946)) b!1220773))

(assert (= (and b!1220774 (not res!810947)) b!1220769))

(assert (= (and b!1220777 condMapEmpty!48424) mapIsEmpty!48424))

(assert (= (and b!1220777 (not condMapEmpty!48424)) mapNonEmpty!48424))

(get-info :version)

(assert (= (and mapNonEmpty!48424 ((_ is ValueCellFull!14802) mapValue!48424)) b!1220767))

(assert (= (and b!1220777 ((_ is ValueCellFull!14802) mapDefault!48424)) b!1220770))

(assert (= start!101532 b!1220777))

(declare-fun b_lambda!22185 () Bool)

(assert (=> (not b_lambda!22185) (not b!1220778)))

(declare-fun t!40141 () Bool)

(declare-fun tb!11119 () Bool)

(assert (=> (and start!101532 (= defaultEntry!1004 defaultEntry!1004) t!40141) tb!11119))

(declare-fun result!22845 () Bool)

(assert (=> tb!11119 (= result!22845 tp_is_empty!31023)))

(assert (=> b!1220778 t!40141))

(declare-fun b_and!43847 () Bool)

(assert (= b_and!43845 (and (=> t!40141 result!22845) b_and!43847)))

(declare-fun m!1125593 () Bool)

(assert (=> b!1220765 m!1125593))

(declare-fun m!1125595 () Bool)

(assert (=> b!1220771 m!1125595))

(declare-fun m!1125597 () Bool)

(assert (=> b!1220771 m!1125597))

(declare-fun m!1125599 () Bool)

(assert (=> b!1220771 m!1125599))

(declare-fun m!1125601 () Bool)

(assert (=> b!1220771 m!1125601))

(declare-fun m!1125603 () Bool)

(assert (=> b!1220771 m!1125603))

(declare-fun m!1125605 () Bool)

(assert (=> b!1220771 m!1125605))

(assert (=> b!1220771 m!1125603))

(declare-fun m!1125607 () Bool)

(assert (=> b!1220762 m!1125607))

(declare-fun m!1125609 () Bool)

(assert (=> b!1220760 m!1125609))

(declare-fun m!1125611 () Bool)

(assert (=> b!1220760 m!1125611))

(declare-fun m!1125613 () Bool)

(assert (=> b!1220772 m!1125613))

(declare-fun m!1125615 () Bool)

(assert (=> mapNonEmpty!48424 m!1125615))

(declare-fun m!1125617 () Bool)

(assert (=> b!1220761 m!1125617))

(declare-fun m!1125619 () Bool)

(assert (=> b!1220773 m!1125619))

(declare-fun m!1125621 () Bool)

(assert (=> b!1220766 m!1125621))

(declare-fun m!1125623 () Bool)

(assert (=> b!1220766 m!1125623))

(declare-fun m!1125625 () Bool)

(assert (=> start!101532 m!1125625))

(declare-fun m!1125627 () Bool)

(assert (=> start!101532 m!1125627))

(assert (=> b!1220775 m!1125603))

(declare-fun m!1125629 () Bool)

(assert (=> b!1220769 m!1125629))

(declare-fun m!1125631 () Bool)

(assert (=> b!1220769 m!1125631))

(declare-fun m!1125633 () Bool)

(assert (=> b!1220769 m!1125633))

(declare-fun m!1125635 () Bool)

(assert (=> b!1220769 m!1125635))

(declare-fun m!1125637 () Bool)

(assert (=> b!1220768 m!1125637))

(declare-fun m!1125639 () Bool)

(assert (=> b!1220763 m!1125639))

(declare-fun m!1125641 () Bool)

(assert (=> b!1220778 m!1125641))

(declare-fun m!1125643 () Bool)

(assert (=> b!1220778 m!1125643))

(declare-fun m!1125645 () Bool)

(assert (=> b!1220778 m!1125645))

(declare-fun m!1125647 () Bool)

(assert (=> b!1220778 m!1125647))

(assert (=> b!1220774 m!1125603))

(declare-fun m!1125649 () Bool)

(assert (=> b!1220774 m!1125649))

(assert (=> b!1220774 m!1125649))

(declare-fun m!1125651 () Bool)

(assert (=> b!1220774 m!1125651))

(declare-fun m!1125653 () Bool)

(assert (=> b!1220774 m!1125653))

(check-sat (not b!1220778) (not b!1220761) (not start!101532) (not b!1220766) (not b!1220762) (not b!1220765) (not b!1220771) (not b!1220769) (not b!1220773) (not b!1220772) b_and!43847 (not b!1220763) (not mapNonEmpty!48424) (not b!1220774) tp_is_empty!31023 (not b_lambda!22185) (not b_next!26319) (not b!1220760))
(check-sat b_and!43847 (not b_next!26319))
