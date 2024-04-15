; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97832 () Bool)

(assert start!97832)

(declare-fun b_free!23539 () Bool)

(declare-fun b_next!23539 () Bool)

(assert (=> start!97832 (= b_free!23539 (not b_next!23539))))

(declare-fun tp!83320 () Bool)

(declare-fun b_and!37839 () Bool)

(assert (=> start!97832 (= tp!83320 b_and!37839)))

(declare-fun b!1119653 () Bool)

(declare-fun res!747941 () Bool)

(declare-fun e!637620 () Bool)

(assert (=> b!1119653 (=> (not res!747941) (not e!637620))))

(declare-datatypes ((array!72932 0))(
  ( (array!72933 (arr!35119 (Array (_ BitVec 32) (_ BitVec 64))) (size!35657 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72932)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72932 (_ BitVec 32)) Bool)

(assert (=> b!1119653 (= res!747941 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapNonEmpty!43921 () Bool)

(declare-fun mapRes!43921 () Bool)

(declare-fun tp!83321 () Bool)

(declare-fun e!637619 () Bool)

(assert (=> mapNonEmpty!43921 (= mapRes!43921 (and tp!83321 e!637619))))

(declare-datatypes ((V!42553 0))(
  ( (V!42554 (val!14091 Int)) )
))
(declare-datatypes ((ValueCell!13325 0))(
  ( (ValueCellFull!13325 (v!16723 V!42553)) (EmptyCell!13325) )
))
(declare-datatypes ((array!72934 0))(
  ( (array!72935 (arr!35120 (Array (_ BitVec 32) ValueCell!13325)) (size!35658 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72934)

(declare-fun mapRest!43921 () (Array (_ BitVec 32) ValueCell!13325))

(declare-fun mapKey!43921 () (_ BitVec 32))

(declare-fun mapValue!43921 () ValueCell!13325)

(assert (=> mapNonEmpty!43921 (= (arr!35120 _values!996) (store mapRest!43921 mapKey!43921 mapValue!43921))))

(declare-fun mapIsEmpty!43921 () Bool)

(assert (=> mapIsEmpty!43921 mapRes!43921))

(declare-fun b!1119654 () Bool)

(declare-fun res!747948 () Bool)

(assert (=> b!1119654 (=> (not res!747948) (not e!637620))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1119654 (= res!747948 (validMask!0 mask!1564))))

(declare-fun b!1119655 () Bool)

(declare-fun e!637617 () Bool)

(declare-fun e!637614 () Bool)

(assert (=> b!1119655 (= e!637617 (and e!637614 mapRes!43921))))

(declare-fun condMapEmpty!43921 () Bool)

(declare-fun mapDefault!43921 () ValueCell!13325)

(assert (=> b!1119655 (= condMapEmpty!43921 (= (arr!35120 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13325)) mapDefault!43921)))))

(declare-fun res!747949 () Bool)

(assert (=> start!97832 (=> (not res!747949) (not e!637620))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97832 (= res!747949 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35657 _keys!1208))))))

(assert (=> start!97832 e!637620))

(declare-fun tp_is_empty!28069 () Bool)

(assert (=> start!97832 tp_is_empty!28069))

(declare-fun array_inv!27044 (array!72932) Bool)

(assert (=> start!97832 (array_inv!27044 _keys!1208)))

(assert (=> start!97832 true))

(assert (=> start!97832 tp!83320))

(declare-fun array_inv!27045 (array!72934) Bool)

(assert (=> start!97832 (and (array_inv!27045 _values!996) e!637617)))

(declare-fun b!1119656 () Bool)

(declare-fun res!747946 () Bool)

(assert (=> b!1119656 (=> (not res!747946) (not e!637620))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1119656 (= res!747946 (and (= (size!35658 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35657 _keys!1208) (size!35658 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1119657 () Bool)

(declare-fun e!637615 () Bool)

(declare-fun e!637616 () Bool)

(assert (=> b!1119657 (= e!637615 (not e!637616))))

(declare-fun res!747940 () Bool)

(assert (=> b!1119657 (=> res!747940 e!637616)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1119657 (= res!747940 (bvsgt from!1455 i!673))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!72932 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1119657 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36569 0))(
  ( (Unit!36570) )
))
(declare-fun lt!497647 () Unit!36569)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72932 (_ BitVec 64) (_ BitVec 32)) Unit!36569)

(assert (=> b!1119657 (= lt!497647 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1119658 () Bool)

(declare-fun res!747947 () Bool)

(assert (=> b!1119658 (=> (not res!747947) (not e!637615))))

(declare-fun lt!497648 () array!72932)

(declare-datatypes ((List!24511 0))(
  ( (Nil!24508) (Cons!24507 (h!25716 (_ BitVec 64)) (t!35033 List!24511)) )
))
(declare-fun arrayNoDuplicates!0 (array!72932 (_ BitVec 32) List!24511) Bool)

(assert (=> b!1119658 (= res!747947 (arrayNoDuplicates!0 lt!497648 #b00000000000000000000000000000000 Nil!24508))))

(declare-fun b!1119659 () Bool)

(declare-fun res!747943 () Bool)

(assert (=> b!1119659 (=> (not res!747943) (not e!637620))))

(assert (=> b!1119659 (= res!747943 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24508))))

(declare-fun b!1119660 () Bool)

(assert (=> b!1119660 (= e!637614 tp_is_empty!28069)))

(declare-fun b!1119661 () Bool)

(declare-fun res!747939 () Bool)

(assert (=> b!1119661 (=> (not res!747939) (not e!637620))))

(assert (=> b!1119661 (= res!747939 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35657 _keys!1208))))))

(declare-fun b!1119662 () Bool)

(assert (=> b!1119662 (= e!637616 true)))

(declare-fun zeroValue!944 () V!42553)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!42553)

(declare-datatypes ((tuple2!17740 0))(
  ( (tuple2!17741 (_1!8881 (_ BitVec 64)) (_2!8881 V!42553)) )
))
(declare-datatypes ((List!24512 0))(
  ( (Nil!24509) (Cons!24508 (h!25717 tuple2!17740) (t!35034 List!24512)) )
))
(declare-datatypes ((ListLongMap!15709 0))(
  ( (ListLongMap!15710 (toList!7870 List!24512)) )
))
(declare-fun lt!497646 () ListLongMap!15709)

(declare-fun getCurrentListMapNoExtraKeys!4379 (array!72932 array!72934 (_ BitVec 32) (_ BitVec 32) V!42553 V!42553 (_ BitVec 32) Int) ListLongMap!15709)

(declare-fun dynLambda!2422 (Int (_ BitVec 64)) V!42553)

(assert (=> b!1119662 (= lt!497646 (getCurrentListMapNoExtraKeys!4379 lt!497648 (array!72935 (store (arr!35120 _values!996) i!673 (ValueCellFull!13325 (dynLambda!2422 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35658 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!497649 () ListLongMap!15709)

(assert (=> b!1119662 (= lt!497649 (getCurrentListMapNoExtraKeys!4379 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1119663 () Bool)

(assert (=> b!1119663 (= e!637619 tp_is_empty!28069)))

(declare-fun b!1119664 () Bool)

(declare-fun res!747945 () Bool)

(assert (=> b!1119664 (=> (not res!747945) (not e!637620))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1119664 (= res!747945 (validKeyInArray!0 k0!934))))

(declare-fun b!1119665 () Bool)

(assert (=> b!1119665 (= e!637620 e!637615)))

(declare-fun res!747942 () Bool)

(assert (=> b!1119665 (=> (not res!747942) (not e!637615))))

(assert (=> b!1119665 (= res!747942 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!497648 mask!1564))))

(assert (=> b!1119665 (= lt!497648 (array!72933 (store (arr!35119 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35657 _keys!1208)))))

(declare-fun b!1119666 () Bool)

(declare-fun res!747944 () Bool)

(assert (=> b!1119666 (=> (not res!747944) (not e!637620))))

(assert (=> b!1119666 (= res!747944 (= (select (arr!35119 _keys!1208) i!673) k0!934))))

(assert (= (and start!97832 res!747949) b!1119654))

(assert (= (and b!1119654 res!747948) b!1119656))

(assert (= (and b!1119656 res!747946) b!1119653))

(assert (= (and b!1119653 res!747941) b!1119659))

(assert (= (and b!1119659 res!747943) b!1119661))

(assert (= (and b!1119661 res!747939) b!1119664))

(assert (= (and b!1119664 res!747945) b!1119666))

(assert (= (and b!1119666 res!747944) b!1119665))

(assert (= (and b!1119665 res!747942) b!1119658))

(assert (= (and b!1119658 res!747947) b!1119657))

(assert (= (and b!1119657 (not res!747940)) b!1119662))

(assert (= (and b!1119655 condMapEmpty!43921) mapIsEmpty!43921))

(assert (= (and b!1119655 (not condMapEmpty!43921)) mapNonEmpty!43921))

(get-info :version)

(assert (= (and mapNonEmpty!43921 ((_ is ValueCellFull!13325) mapValue!43921)) b!1119663))

(assert (= (and b!1119655 ((_ is ValueCellFull!13325) mapDefault!43921)) b!1119660))

(assert (= start!97832 b!1119655))

(declare-fun b_lambda!18491 () Bool)

(assert (=> (not b_lambda!18491) (not b!1119662)))

(declare-fun t!35032 () Bool)

(declare-fun tb!8343 () Bool)

(assert (=> (and start!97832 (= defaultEntry!1004 defaultEntry!1004) t!35032) tb!8343))

(declare-fun result!17255 () Bool)

(assert (=> tb!8343 (= result!17255 tp_is_empty!28069)))

(assert (=> b!1119662 t!35032))

(declare-fun b_and!37841 () Bool)

(assert (= b_and!37839 (and (=> t!35032 result!17255) b_and!37841)))

(declare-fun m!1034361 () Bool)

(assert (=> b!1119664 m!1034361))

(declare-fun m!1034363 () Bool)

(assert (=> b!1119659 m!1034363))

(declare-fun m!1034365 () Bool)

(assert (=> b!1119665 m!1034365))

(declare-fun m!1034367 () Bool)

(assert (=> b!1119665 m!1034367))

(declare-fun m!1034369 () Bool)

(assert (=> b!1119662 m!1034369))

(declare-fun m!1034371 () Bool)

(assert (=> b!1119662 m!1034371))

(declare-fun m!1034373 () Bool)

(assert (=> b!1119662 m!1034373))

(declare-fun m!1034375 () Bool)

(assert (=> b!1119662 m!1034375))

(declare-fun m!1034377 () Bool)

(assert (=> b!1119666 m!1034377))

(declare-fun m!1034379 () Bool)

(assert (=> mapNonEmpty!43921 m!1034379))

(declare-fun m!1034381 () Bool)

(assert (=> b!1119653 m!1034381))

(declare-fun m!1034383 () Bool)

(assert (=> b!1119658 m!1034383))

(declare-fun m!1034385 () Bool)

(assert (=> start!97832 m!1034385))

(declare-fun m!1034387 () Bool)

(assert (=> start!97832 m!1034387))

(declare-fun m!1034389 () Bool)

(assert (=> b!1119654 m!1034389))

(declare-fun m!1034391 () Bool)

(assert (=> b!1119657 m!1034391))

(declare-fun m!1034393 () Bool)

(assert (=> b!1119657 m!1034393))

(check-sat (not b!1119659) (not b!1119658) (not start!97832) (not b!1119657) (not b!1119665) tp_is_empty!28069 (not b_next!23539) (not b!1119664) (not mapNonEmpty!43921) (not b!1119662) (not b!1119654) (not b!1119653) b_and!37841 (not b_lambda!18491))
(check-sat b_and!37841 (not b_next!23539))
