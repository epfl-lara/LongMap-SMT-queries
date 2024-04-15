; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101196 () Bool)

(assert start!101196)

(declare-fun b_free!26125 () Bool)

(declare-fun b_next!26125 () Bool)

(assert (=> start!101196 (= b_free!26125 (not b_next!26125))))

(declare-fun tp!91396 () Bool)

(declare-fun b_and!43349 () Bool)

(assert (=> start!101196 (= tp!91396 b_and!43349)))

(declare-fun b!1214915 () Bool)

(declare-fun e!689877 () Bool)

(declare-fun tp_is_empty!30829 () Bool)

(assert (=> b!1214915 (= e!689877 tp_is_empty!30829)))

(declare-fun b!1214916 () Bool)

(declare-fun e!689879 () Bool)

(declare-fun e!689878 () Bool)

(declare-fun mapRes!48118 () Bool)

(assert (=> b!1214916 (= e!689879 (and e!689878 mapRes!48118))))

(declare-fun condMapEmpty!48118 () Bool)

(declare-datatypes ((V!46233 0))(
  ( (V!46234 (val!15471 Int)) )
))
(declare-datatypes ((ValueCell!14705 0))(
  ( (ValueCellFull!14705 (v!18123 V!46233)) (EmptyCell!14705) )
))
(declare-datatypes ((array!78356 0))(
  ( (array!78357 (arr!37813 (Array (_ BitVec 32) ValueCell!14705)) (size!38351 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78356)

(declare-fun mapDefault!48118 () ValueCell!14705)

(assert (=> b!1214916 (= condMapEmpty!48118 (= (arr!37813 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14705)) mapDefault!48118)))))

(declare-fun b!1214917 () Bool)

(declare-fun e!689876 () Bool)

(declare-fun e!689880 () Bool)

(assert (=> b!1214917 (= e!689876 (not e!689880))))

(declare-fun res!806640 () Bool)

(assert (=> b!1214917 (=> res!806640 e!689880)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1214917 (= res!806640 (bvsgt from!1455 i!673))))

(declare-datatypes ((array!78358 0))(
  ( (array!78359 (arr!37814 (Array (_ BitVec 32) (_ BitVec 64))) (size!38352 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78358)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!78358 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1214917 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!40143 0))(
  ( (Unit!40144) )
))
(declare-fun lt!552322 () Unit!40143)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78358 (_ BitVec 64) (_ BitVec 32)) Unit!40143)

(assert (=> b!1214917 (= lt!552322 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1214918 () Bool)

(declare-fun res!806633 () Bool)

(declare-fun e!689881 () Bool)

(assert (=> b!1214918 (=> (not res!806633) (not e!689881))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78358 (_ BitVec 32)) Bool)

(assert (=> b!1214918 (= res!806633 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1214919 () Bool)

(declare-fun res!806632 () Bool)

(assert (=> b!1214919 (=> (not res!806632) (not e!689881))))

(assert (=> b!1214919 (= res!806632 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38352 _keys!1208))))))

(declare-fun b!1214920 () Bool)

(declare-fun res!806638 () Bool)

(assert (=> b!1214920 (=> (not res!806638) (not e!689881))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1214920 (= res!806638 (and (= (size!38351 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38352 _keys!1208) (size!38351 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1214921 () Bool)

(assert (=> b!1214921 (= e!689878 tp_is_empty!30829)))

(declare-fun b!1214922 () Bool)

(declare-fun res!806641 () Bool)

(assert (=> b!1214922 (=> (not res!806641) (not e!689881))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1214922 (= res!806641 (validKeyInArray!0 k0!934))))

(declare-fun b!1214923 () Bool)

(assert (=> b!1214923 (= e!689881 e!689876)))

(declare-fun res!806639 () Bool)

(assert (=> b!1214923 (=> (not res!806639) (not e!689876))))

(declare-fun lt!552320 () array!78358)

(assert (=> b!1214923 (= res!806639 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!552320 mask!1564))))

(assert (=> b!1214923 (= lt!552320 (array!78359 (store (arr!37814 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38352 _keys!1208)))))

(declare-fun b!1214924 () Bool)

(declare-fun res!806631 () Bool)

(assert (=> b!1214924 (=> (not res!806631) (not e!689881))))

(declare-datatypes ((List!26746 0))(
  ( (Nil!26743) (Cons!26742 (h!27951 (_ BitVec 64)) (t!39842 List!26746)) )
))
(declare-fun arrayNoDuplicates!0 (array!78358 (_ BitVec 32) List!26746) Bool)

(assert (=> b!1214924 (= res!806631 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26743))))

(declare-fun b!1214925 () Bool)

(declare-fun res!806635 () Bool)

(assert (=> b!1214925 (=> (not res!806635) (not e!689881))))

(assert (=> b!1214925 (= res!806635 (= (select (arr!37814 _keys!1208) i!673) k0!934))))

(declare-fun mapIsEmpty!48118 () Bool)

(assert (=> mapIsEmpty!48118 mapRes!48118))

(declare-fun b!1214926 () Bool)

(declare-fun res!806634 () Bool)

(assert (=> b!1214926 (=> (not res!806634) (not e!689876))))

(assert (=> b!1214926 (= res!806634 (arrayNoDuplicates!0 lt!552320 #b00000000000000000000000000000000 Nil!26743))))

(declare-fun b!1214927 () Bool)

(declare-fun res!806636 () Bool)

(assert (=> b!1214927 (=> (not res!806636) (not e!689881))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1214927 (= res!806636 (validMask!0 mask!1564))))

(declare-fun res!806637 () Bool)

(assert (=> start!101196 (=> (not res!806637) (not e!689881))))

(assert (=> start!101196 (= res!806637 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38352 _keys!1208))))))

(assert (=> start!101196 e!689881))

(assert (=> start!101196 tp_is_empty!30829))

(declare-fun array_inv!28906 (array!78358) Bool)

(assert (=> start!101196 (array_inv!28906 _keys!1208)))

(assert (=> start!101196 true))

(assert (=> start!101196 tp!91396))

(declare-fun array_inv!28907 (array!78356) Bool)

(assert (=> start!101196 (and (array_inv!28907 _values!996) e!689879)))

(declare-fun b!1214928 () Bool)

(assert (=> b!1214928 (= e!689880 true)))

(declare-fun zeroValue!944 () V!46233)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!46233)

(declare-datatypes ((tuple2!19966 0))(
  ( (tuple2!19967 (_1!9994 (_ BitVec 64)) (_2!9994 V!46233)) )
))
(declare-datatypes ((List!26747 0))(
  ( (Nil!26744) (Cons!26743 (h!27952 tuple2!19966) (t!39843 List!26747)) )
))
(declare-datatypes ((ListLongMap!17935 0))(
  ( (ListLongMap!17936 (toList!8983 List!26747)) )
))
(declare-fun lt!552323 () ListLongMap!17935)

(declare-fun getCurrentListMapNoExtraKeys!5422 (array!78358 array!78356 (_ BitVec 32) (_ BitVec 32) V!46233 V!46233 (_ BitVec 32) Int) ListLongMap!17935)

(declare-fun dynLambda!3274 (Int (_ BitVec 64)) V!46233)

(assert (=> b!1214928 (= lt!552323 (getCurrentListMapNoExtraKeys!5422 lt!552320 (array!78357 (store (arr!37813 _values!996) i!673 (ValueCellFull!14705 (dynLambda!3274 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38351 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!552321 () ListLongMap!17935)

(assert (=> b!1214928 (= lt!552321 (getCurrentListMapNoExtraKeys!5422 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun mapNonEmpty!48118 () Bool)

(declare-fun tp!91397 () Bool)

(assert (=> mapNonEmpty!48118 (= mapRes!48118 (and tp!91397 e!689877))))

(declare-fun mapValue!48118 () ValueCell!14705)

(declare-fun mapRest!48118 () (Array (_ BitVec 32) ValueCell!14705))

(declare-fun mapKey!48118 () (_ BitVec 32))

(assert (=> mapNonEmpty!48118 (= (arr!37813 _values!996) (store mapRest!48118 mapKey!48118 mapValue!48118))))

(assert (= (and start!101196 res!806637) b!1214927))

(assert (= (and b!1214927 res!806636) b!1214920))

(assert (= (and b!1214920 res!806638) b!1214918))

(assert (= (and b!1214918 res!806633) b!1214924))

(assert (= (and b!1214924 res!806631) b!1214919))

(assert (= (and b!1214919 res!806632) b!1214922))

(assert (= (and b!1214922 res!806641) b!1214925))

(assert (= (and b!1214925 res!806635) b!1214923))

(assert (= (and b!1214923 res!806639) b!1214926))

(assert (= (and b!1214926 res!806634) b!1214917))

(assert (= (and b!1214917 (not res!806640)) b!1214928))

(assert (= (and b!1214916 condMapEmpty!48118) mapIsEmpty!48118))

(assert (= (and b!1214916 (not condMapEmpty!48118)) mapNonEmpty!48118))

(get-info :version)

(assert (= (and mapNonEmpty!48118 ((_ is ValueCellFull!14705) mapValue!48118)) b!1214915))

(assert (= (and b!1214916 ((_ is ValueCellFull!14705) mapDefault!48118)) b!1214921))

(assert (= start!101196 b!1214916))

(declare-fun b_lambda!21791 () Bool)

(assert (=> (not b_lambda!21791) (not b!1214928)))

(declare-fun t!39841 () Bool)

(declare-fun tb!10917 () Bool)

(assert (=> (and start!101196 (= defaultEntry!1004 defaultEntry!1004) t!39841) tb!10917))

(declare-fun result!22439 () Bool)

(assert (=> tb!10917 (= result!22439 tp_is_empty!30829)))

(assert (=> b!1214928 t!39841))

(declare-fun b_and!43351 () Bool)

(assert (= b_and!43349 (and (=> t!39841 result!22439) b_and!43351)))

(declare-fun m!1119525 () Bool)

(assert (=> b!1214924 m!1119525))

(declare-fun m!1119527 () Bool)

(assert (=> b!1214917 m!1119527))

(declare-fun m!1119529 () Bool)

(assert (=> b!1214917 m!1119529))

(declare-fun m!1119531 () Bool)

(assert (=> b!1214928 m!1119531))

(declare-fun m!1119533 () Bool)

(assert (=> b!1214928 m!1119533))

(declare-fun m!1119535 () Bool)

(assert (=> b!1214928 m!1119535))

(declare-fun m!1119537 () Bool)

(assert (=> b!1214928 m!1119537))

(declare-fun m!1119539 () Bool)

(assert (=> b!1214922 m!1119539))

(declare-fun m!1119541 () Bool)

(assert (=> b!1214927 m!1119541))

(declare-fun m!1119543 () Bool)

(assert (=> mapNonEmpty!48118 m!1119543))

(declare-fun m!1119545 () Bool)

(assert (=> start!101196 m!1119545))

(declare-fun m!1119547 () Bool)

(assert (=> start!101196 m!1119547))

(declare-fun m!1119549 () Bool)

(assert (=> b!1214918 m!1119549))

(declare-fun m!1119551 () Bool)

(assert (=> b!1214926 m!1119551))

(declare-fun m!1119553 () Bool)

(assert (=> b!1214923 m!1119553))

(declare-fun m!1119555 () Bool)

(assert (=> b!1214923 m!1119555))

(declare-fun m!1119557 () Bool)

(assert (=> b!1214925 m!1119557))

(check-sat (not b!1214923) (not b!1214917) (not mapNonEmpty!48118) b_and!43351 (not b!1214922) (not b!1214928) (not b!1214924) (not b_next!26125) (not start!101196) (not b_lambda!21791) (not b!1214918) (not b!1214927) tp_is_empty!30829 (not b!1214926))
(check-sat b_and!43351 (not b_next!26125))
