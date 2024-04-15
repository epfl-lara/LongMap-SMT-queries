; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101220 () Bool)

(assert start!101220)

(declare-fun b_free!26149 () Bool)

(declare-fun b_next!26149 () Bool)

(assert (=> start!101220 (= b_free!26149 (not b_next!26149))))

(declare-fun tp!91469 () Bool)

(declare-fun b_and!43397 () Bool)

(assert (=> start!101220 (= tp!91469 b_and!43397)))

(declare-fun b!1215443 () Bool)

(declare-fun res!807031 () Bool)

(declare-fun e!690130 () Bool)

(assert (=> b!1215443 (=> (not res!807031) (not e!690130))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1215443 (= res!807031 (validKeyInArray!0 k0!934))))

(declare-fun b!1215444 () Bool)

(declare-fun e!690127 () Bool)

(assert (=> b!1215444 (= e!690127 true)))

(declare-datatypes ((V!46265 0))(
  ( (V!46266 (val!15483 Int)) )
))
(declare-fun zeroValue!944 () V!46265)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((array!78402 0))(
  ( (array!78403 (arr!37836 (Array (_ BitVec 32) (_ BitVec 64))) (size!38374 (_ BitVec 32))) )
))
(declare-fun lt!552465 () array!78402)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!14717 0))(
  ( (ValueCellFull!14717 (v!18135 V!46265)) (EmptyCell!14717) )
))
(declare-datatypes ((array!78404 0))(
  ( (array!78405 (arr!37837 (Array (_ BitVec 32) ValueCell!14717)) (size!38375 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78404)

(declare-fun minValue!944 () V!46265)

(declare-datatypes ((tuple2!19986 0))(
  ( (tuple2!19987 (_1!10004 (_ BitVec 64)) (_2!10004 V!46265)) )
))
(declare-datatypes ((List!26766 0))(
  ( (Nil!26763) (Cons!26762 (h!27971 tuple2!19986) (t!39886 List!26766)) )
))
(declare-datatypes ((ListLongMap!17955 0))(
  ( (ListLongMap!17956 (toList!8993 List!26766)) )
))
(declare-fun lt!552467 () ListLongMap!17955)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!5432 (array!78402 array!78404 (_ BitVec 32) (_ BitVec 32) V!46265 V!46265 (_ BitVec 32) Int) ListLongMap!17955)

(declare-fun dynLambda!3284 (Int (_ BitVec 64)) V!46265)

(assert (=> b!1215444 (= lt!552467 (getCurrentListMapNoExtraKeys!5432 lt!552465 (array!78405 (store (arr!37837 _values!996) i!673 (ValueCellFull!14717 (dynLambda!3284 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38375 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!552464 () ListLongMap!17955)

(declare-fun _keys!1208 () array!78402)

(assert (=> b!1215444 (= lt!552464 (getCurrentListMapNoExtraKeys!5432 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun res!807028 () Bool)

(assert (=> start!101220 (=> (not res!807028) (not e!690130))))

(assert (=> start!101220 (= res!807028 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38374 _keys!1208))))))

(assert (=> start!101220 e!690130))

(declare-fun tp_is_empty!30853 () Bool)

(assert (=> start!101220 tp_is_empty!30853))

(declare-fun array_inv!28922 (array!78402) Bool)

(assert (=> start!101220 (array_inv!28922 _keys!1208)))

(assert (=> start!101220 true))

(assert (=> start!101220 tp!91469))

(declare-fun e!690132 () Bool)

(declare-fun array_inv!28923 (array!78404) Bool)

(assert (=> start!101220 (and (array_inv!28923 _values!996) e!690132)))

(declare-fun mapIsEmpty!48154 () Bool)

(declare-fun mapRes!48154 () Bool)

(assert (=> mapIsEmpty!48154 mapRes!48154))

(declare-fun b!1215445 () Bool)

(declare-fun e!690128 () Bool)

(assert (=> b!1215445 (= e!690132 (and e!690128 mapRes!48154))))

(declare-fun condMapEmpty!48154 () Bool)

(declare-fun mapDefault!48154 () ValueCell!14717)

(assert (=> b!1215445 (= condMapEmpty!48154 (= (arr!37837 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14717)) mapDefault!48154)))))

(declare-fun b!1215446 () Bool)

(declare-fun res!807033 () Bool)

(assert (=> b!1215446 (=> (not res!807033) (not e!690130))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1215446 (= res!807033 (validMask!0 mask!1564))))

(declare-fun b!1215447 () Bool)

(declare-fun res!807037 () Bool)

(assert (=> b!1215447 (=> (not res!807037) (not e!690130))))

(assert (=> b!1215447 (= res!807037 (= (select (arr!37836 _keys!1208) i!673) k0!934))))

(declare-fun b!1215448 () Bool)

(declare-fun res!807035 () Bool)

(assert (=> b!1215448 (=> (not res!807035) (not e!690130))))

(assert (=> b!1215448 (= res!807035 (and (= (size!38375 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38374 _keys!1208) (size!38375 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1215449 () Bool)

(declare-fun res!807034 () Bool)

(assert (=> b!1215449 (=> (not res!807034) (not e!690130))))

(assert (=> b!1215449 (= res!807034 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38374 _keys!1208))))))

(declare-fun b!1215450 () Bool)

(declare-fun res!807030 () Bool)

(declare-fun e!690133 () Bool)

(assert (=> b!1215450 (=> (not res!807030) (not e!690133))))

(declare-datatypes ((List!26767 0))(
  ( (Nil!26764) (Cons!26763 (h!27972 (_ BitVec 64)) (t!39887 List!26767)) )
))
(declare-fun arrayNoDuplicates!0 (array!78402 (_ BitVec 32) List!26767) Bool)

(assert (=> b!1215450 (= res!807030 (arrayNoDuplicates!0 lt!552465 #b00000000000000000000000000000000 Nil!26764))))

(declare-fun b!1215451 () Bool)

(assert (=> b!1215451 (= e!690130 e!690133)))

(declare-fun res!807036 () Bool)

(assert (=> b!1215451 (=> (not res!807036) (not e!690133))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78402 (_ BitVec 32)) Bool)

(assert (=> b!1215451 (= res!807036 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!552465 mask!1564))))

(assert (=> b!1215451 (= lt!552465 (array!78403 (store (arr!37836 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38374 _keys!1208)))))

(declare-fun b!1215452 () Bool)

(declare-fun e!690129 () Bool)

(assert (=> b!1215452 (= e!690129 tp_is_empty!30853)))

(declare-fun b!1215453 () Bool)

(assert (=> b!1215453 (= e!690133 (not e!690127))))

(declare-fun res!807029 () Bool)

(assert (=> b!1215453 (=> res!807029 e!690127)))

(assert (=> b!1215453 (= res!807029 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!78402 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1215453 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!40161 0))(
  ( (Unit!40162) )
))
(declare-fun lt!552466 () Unit!40161)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78402 (_ BitVec 64) (_ BitVec 32)) Unit!40161)

(assert (=> b!1215453 (= lt!552466 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1215454 () Bool)

(declare-fun res!807027 () Bool)

(assert (=> b!1215454 (=> (not res!807027) (not e!690130))))

(assert (=> b!1215454 (= res!807027 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapNonEmpty!48154 () Bool)

(declare-fun tp!91468 () Bool)

(assert (=> mapNonEmpty!48154 (= mapRes!48154 (and tp!91468 e!690129))))

(declare-fun mapValue!48154 () ValueCell!14717)

(declare-fun mapRest!48154 () (Array (_ BitVec 32) ValueCell!14717))

(declare-fun mapKey!48154 () (_ BitVec 32))

(assert (=> mapNonEmpty!48154 (= (arr!37837 _values!996) (store mapRest!48154 mapKey!48154 mapValue!48154))))

(declare-fun b!1215455 () Bool)

(assert (=> b!1215455 (= e!690128 tp_is_empty!30853)))

(declare-fun b!1215456 () Bool)

(declare-fun res!807032 () Bool)

(assert (=> b!1215456 (=> (not res!807032) (not e!690130))))

(assert (=> b!1215456 (= res!807032 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26764))))

(assert (= (and start!101220 res!807028) b!1215446))

(assert (= (and b!1215446 res!807033) b!1215448))

(assert (= (and b!1215448 res!807035) b!1215454))

(assert (= (and b!1215454 res!807027) b!1215456))

(assert (= (and b!1215456 res!807032) b!1215449))

(assert (= (and b!1215449 res!807034) b!1215443))

(assert (= (and b!1215443 res!807031) b!1215447))

(assert (= (and b!1215447 res!807037) b!1215451))

(assert (= (and b!1215451 res!807036) b!1215450))

(assert (= (and b!1215450 res!807030) b!1215453))

(assert (= (and b!1215453 (not res!807029)) b!1215444))

(assert (= (and b!1215445 condMapEmpty!48154) mapIsEmpty!48154))

(assert (= (and b!1215445 (not condMapEmpty!48154)) mapNonEmpty!48154))

(get-info :version)

(assert (= (and mapNonEmpty!48154 ((_ is ValueCellFull!14717) mapValue!48154)) b!1215452))

(assert (= (and b!1215445 ((_ is ValueCellFull!14717) mapDefault!48154)) b!1215455))

(assert (= start!101220 b!1215445))

(declare-fun b_lambda!21815 () Bool)

(assert (=> (not b_lambda!21815) (not b!1215444)))

(declare-fun t!39885 () Bool)

(declare-fun tb!10941 () Bool)

(assert (=> (and start!101220 (= defaultEntry!1004 defaultEntry!1004) t!39885) tb!10941))

(declare-fun result!22487 () Bool)

(assert (=> tb!10941 (= result!22487 tp_is_empty!30853)))

(assert (=> b!1215444 t!39885))

(declare-fun b_and!43399 () Bool)

(assert (= b_and!43397 (and (=> t!39885 result!22487) b_and!43399)))

(declare-fun m!1119933 () Bool)

(assert (=> b!1215454 m!1119933))

(declare-fun m!1119935 () Bool)

(assert (=> b!1215450 m!1119935))

(declare-fun m!1119937 () Bool)

(assert (=> b!1215446 m!1119937))

(declare-fun m!1119939 () Bool)

(assert (=> b!1215444 m!1119939))

(declare-fun m!1119941 () Bool)

(assert (=> b!1215444 m!1119941))

(declare-fun m!1119943 () Bool)

(assert (=> b!1215444 m!1119943))

(declare-fun m!1119945 () Bool)

(assert (=> b!1215444 m!1119945))

(declare-fun m!1119947 () Bool)

(assert (=> mapNonEmpty!48154 m!1119947))

(declare-fun m!1119949 () Bool)

(assert (=> b!1215453 m!1119949))

(declare-fun m!1119951 () Bool)

(assert (=> b!1215453 m!1119951))

(declare-fun m!1119953 () Bool)

(assert (=> start!101220 m!1119953))

(declare-fun m!1119955 () Bool)

(assert (=> start!101220 m!1119955))

(declare-fun m!1119957 () Bool)

(assert (=> b!1215456 m!1119957))

(declare-fun m!1119959 () Bool)

(assert (=> b!1215447 m!1119959))

(declare-fun m!1119961 () Bool)

(assert (=> b!1215451 m!1119961))

(declare-fun m!1119963 () Bool)

(assert (=> b!1215451 m!1119963))

(declare-fun m!1119965 () Bool)

(assert (=> b!1215443 m!1119965))

(check-sat (not b_lambda!21815) (not b!1215451) (not start!101220) (not b_next!26149) b_and!43399 (not b!1215456) (not b!1215446) (not b!1215454) (not b!1215443) (not b!1215450) tp_is_empty!30853 (not b!1215444) (not b!1215453) (not mapNonEmpty!48154))
(check-sat b_and!43399 (not b_next!26149))
