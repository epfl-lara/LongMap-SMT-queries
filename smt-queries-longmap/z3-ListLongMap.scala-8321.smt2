; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101276 () Bool)

(assert start!101276)

(declare-fun b_free!26199 () Bool)

(declare-fun b_next!26199 () Bool)

(assert (=> start!101276 (= b_free!26199 (not b_next!26199))))

(declare-fun tp!91619 () Bool)

(declare-fun b_and!43515 () Bool)

(assert (=> start!101276 (= tp!91619 b_and!43515)))

(declare-fun b!1216680 () Bool)

(declare-fun e!690752 () Bool)

(declare-fun e!690749 () Bool)

(assert (=> b!1216680 (= e!690752 e!690749)))

(declare-fun res!807949 () Bool)

(assert (=> b!1216680 (=> res!807949 e!690749)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1216680 (= res!807949 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-datatypes ((V!46331 0))(
  ( (V!46332 (val!15508 Int)) )
))
(declare-fun zeroValue!944 () V!46331)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((ValueCell!14742 0))(
  ( (ValueCellFull!14742 (v!18161 V!46331)) (EmptyCell!14742) )
))
(declare-datatypes ((array!78577 0))(
  ( (array!78578 (arr!37923 (Array (_ BitVec 32) ValueCell!14742)) (size!38459 (_ BitVec 32))) )
))
(declare-fun lt!552991 () array!78577)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((array!78579 0))(
  ( (array!78580 (arr!37924 (Array (_ BitVec 32) (_ BitVec 64))) (size!38460 (_ BitVec 32))) )
))
(declare-fun lt!552992 () array!78579)

(declare-datatypes ((tuple2!19932 0))(
  ( (tuple2!19933 (_1!9977 (_ BitVec 64)) (_2!9977 V!46331)) )
))
(declare-datatypes ((List!26737 0))(
  ( (Nil!26734) (Cons!26733 (h!27942 tuple2!19932) (t!39916 List!26737)) )
))
(declare-datatypes ((ListLongMap!17901 0))(
  ( (ListLongMap!17902 (toList!8966 List!26737)) )
))
(declare-fun lt!552993 () ListLongMap!17901)

(declare-fun minValue!944 () V!46331)

(declare-fun getCurrentListMapNoExtraKeys!5393 (array!78579 array!78577 (_ BitVec 32) (_ BitVec 32) V!46331 V!46331 (_ BitVec 32) Int) ListLongMap!17901)

(assert (=> b!1216680 (= lt!552993 (getCurrentListMapNoExtraKeys!5393 lt!552992 lt!552991 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun _values!996 () array!78577)

(declare-fun dynLambda!3282 (Int (_ BitVec 64)) V!46331)

(assert (=> b!1216680 (= lt!552991 (array!78578 (store (arr!37923 _values!996) i!673 (ValueCellFull!14742 (dynLambda!3282 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38459 _values!996)))))

(declare-fun lt!552995 () ListLongMap!17901)

(declare-fun _keys!1208 () array!78579)

(assert (=> b!1216680 (= lt!552995 (getCurrentListMapNoExtraKeys!5393 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun mapNonEmpty!48229 () Bool)

(declare-fun mapRes!48229 () Bool)

(declare-fun tp!91618 () Bool)

(declare-fun e!690753 () Bool)

(assert (=> mapNonEmpty!48229 (= mapRes!48229 (and tp!91618 e!690753))))

(declare-fun mapRest!48229 () (Array (_ BitVec 32) ValueCell!14742))

(declare-fun mapValue!48229 () ValueCell!14742)

(declare-fun mapKey!48229 () (_ BitVec 32))

(assert (=> mapNonEmpty!48229 (= (arr!37923 _values!996) (store mapRest!48229 mapKey!48229 mapValue!48229))))

(declare-fun b!1216681 () Bool)

(declare-fun res!807948 () Bool)

(declare-fun e!690754 () Bool)

(assert (=> b!1216681 (=> (not res!807948) (not e!690754))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1216681 (= res!807948 (validMask!0 mask!1564))))

(declare-fun b!1216682 () Bool)

(declare-fun e!690757 () Bool)

(assert (=> b!1216682 (= e!690749 e!690757)))

(declare-fun res!807941 () Bool)

(assert (=> b!1216682 (=> res!807941 e!690757)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1216682 (= res!807941 (not (validKeyInArray!0 (select (arr!37924 _keys!1208) from!1455))))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun -!1885 (ListLongMap!17901 (_ BitVec 64)) ListLongMap!17901)

(assert (=> b!1216682 (= (getCurrentListMapNoExtraKeys!5393 lt!552992 lt!552991 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1885 (getCurrentListMapNoExtraKeys!5393 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-datatypes ((Unit!40340 0))(
  ( (Unit!40341) )
))
(declare-fun lt!552996 () Unit!40340)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1092 (array!78579 array!78577 (_ BitVec 32) (_ BitVec 32) V!46331 V!46331 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40340)

(assert (=> b!1216682 (= lt!552996 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1092 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1216683 () Bool)

(declare-fun e!690751 () Bool)

(declare-fun tp_is_empty!30903 () Bool)

(assert (=> b!1216683 (= e!690751 tp_is_empty!30903)))

(declare-fun b!1216684 () Bool)

(declare-fun res!807950 () Bool)

(assert (=> b!1216684 (=> (not res!807950) (not e!690754))))

(declare-datatypes ((List!26738 0))(
  ( (Nil!26735) (Cons!26734 (h!27943 (_ BitVec 64)) (t!39917 List!26738)) )
))
(declare-fun arrayNoDuplicates!0 (array!78579 (_ BitVec 32) List!26738) Bool)

(assert (=> b!1216684 (= res!807950 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26735))))

(declare-fun mapIsEmpty!48229 () Bool)

(assert (=> mapIsEmpty!48229 mapRes!48229))

(declare-fun res!807947 () Bool)

(assert (=> start!101276 (=> (not res!807947) (not e!690754))))

(assert (=> start!101276 (= res!807947 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38460 _keys!1208))))))

(assert (=> start!101276 e!690754))

(assert (=> start!101276 tp_is_empty!30903))

(declare-fun array_inv!28872 (array!78579) Bool)

(assert (=> start!101276 (array_inv!28872 _keys!1208)))

(assert (=> start!101276 true))

(assert (=> start!101276 tp!91619))

(declare-fun e!690750 () Bool)

(declare-fun array_inv!28873 (array!78577) Bool)

(assert (=> start!101276 (and (array_inv!28873 _values!996) e!690750)))

(declare-fun b!1216685 () Bool)

(declare-fun res!807951 () Bool)

(assert (=> b!1216685 (=> (not res!807951) (not e!690754))))

(assert (=> b!1216685 (= res!807951 (= (select (arr!37924 _keys!1208) i!673) k0!934))))

(declare-fun b!1216686 () Bool)

(declare-fun res!807952 () Bool)

(assert (=> b!1216686 (=> (not res!807952) (not e!690754))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78579 (_ BitVec 32)) Bool)

(assert (=> b!1216686 (= res!807952 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1216687 () Bool)

(assert (=> b!1216687 (= e!690753 tp_is_empty!30903)))

(declare-fun b!1216688 () Bool)

(declare-fun e!690756 () Bool)

(assert (=> b!1216688 (= e!690754 e!690756)))

(declare-fun res!807946 () Bool)

(assert (=> b!1216688 (=> (not res!807946) (not e!690756))))

(assert (=> b!1216688 (= res!807946 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!552992 mask!1564))))

(assert (=> b!1216688 (= lt!552992 (array!78580 (store (arr!37924 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38460 _keys!1208)))))

(declare-fun b!1216689 () Bool)

(declare-fun res!807943 () Bool)

(assert (=> b!1216689 (=> (not res!807943) (not e!690754))))

(assert (=> b!1216689 (= res!807943 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38460 _keys!1208))))))

(declare-fun b!1216690 () Bool)

(declare-fun res!807944 () Bool)

(assert (=> b!1216690 (=> (not res!807944) (not e!690756))))

(assert (=> b!1216690 (= res!807944 (arrayNoDuplicates!0 lt!552992 #b00000000000000000000000000000000 Nil!26735))))

(declare-fun b!1216691 () Bool)

(assert (=> b!1216691 (= e!690756 (not e!690752))))

(declare-fun res!807942 () Bool)

(assert (=> b!1216691 (=> res!807942 e!690752)))

(assert (=> b!1216691 (= res!807942 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!78579 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1216691 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!552994 () Unit!40340)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78579 (_ BitVec 64) (_ BitVec 32)) Unit!40340)

(assert (=> b!1216691 (= lt!552994 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1216692 () Bool)

(assert (=> b!1216692 (= e!690750 (and e!690751 mapRes!48229))))

(declare-fun condMapEmpty!48229 () Bool)

(declare-fun mapDefault!48229 () ValueCell!14742)

(assert (=> b!1216692 (= condMapEmpty!48229 (= (arr!37923 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14742)) mapDefault!48229)))))

(declare-fun b!1216693 () Bool)

(declare-fun res!807945 () Bool)

(assert (=> b!1216693 (=> (not res!807945) (not e!690754))))

(assert (=> b!1216693 (= res!807945 (validKeyInArray!0 k0!934))))

(declare-fun b!1216694 () Bool)

(assert (=> b!1216694 (= e!690757 (bvslt i!673 (size!38459 _values!996)))))

(declare-fun b!1216695 () Bool)

(declare-fun res!807953 () Bool)

(assert (=> b!1216695 (=> (not res!807953) (not e!690754))))

(assert (=> b!1216695 (= res!807953 (and (= (size!38459 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38460 _keys!1208) (size!38459 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(assert (= (and start!101276 res!807947) b!1216681))

(assert (= (and b!1216681 res!807948) b!1216695))

(assert (= (and b!1216695 res!807953) b!1216686))

(assert (= (and b!1216686 res!807952) b!1216684))

(assert (= (and b!1216684 res!807950) b!1216689))

(assert (= (and b!1216689 res!807943) b!1216693))

(assert (= (and b!1216693 res!807945) b!1216685))

(assert (= (and b!1216685 res!807951) b!1216688))

(assert (= (and b!1216688 res!807946) b!1216690))

(assert (= (and b!1216690 res!807944) b!1216691))

(assert (= (and b!1216691 (not res!807942)) b!1216680))

(assert (= (and b!1216680 (not res!807949)) b!1216682))

(assert (= (and b!1216682 (not res!807941)) b!1216694))

(assert (= (and b!1216692 condMapEmpty!48229) mapIsEmpty!48229))

(assert (= (and b!1216692 (not condMapEmpty!48229)) mapNonEmpty!48229))

(get-info :version)

(assert (= (and mapNonEmpty!48229 ((_ is ValueCellFull!14742) mapValue!48229)) b!1216687))

(assert (= (and b!1216692 ((_ is ValueCellFull!14742) mapDefault!48229)) b!1216683))

(assert (= start!101276 b!1216692))

(declare-fun b_lambda!21875 () Bool)

(assert (=> (not b_lambda!21875) (not b!1216680)))

(declare-fun t!39915 () Bool)

(declare-fun tb!10999 () Bool)

(assert (=> (and start!101276 (= defaultEntry!1004 defaultEntry!1004) t!39915) tb!10999))

(declare-fun result!22595 () Bool)

(assert (=> tb!10999 (= result!22595 tp_is_empty!30903)))

(assert (=> b!1216680 t!39915))

(declare-fun b_and!43517 () Bool)

(assert (= b_and!43515 (and (=> t!39915 result!22595) b_and!43517)))

(declare-fun m!1121407 () Bool)

(assert (=> b!1216685 m!1121407))

(declare-fun m!1121409 () Bool)

(assert (=> start!101276 m!1121409))

(declare-fun m!1121411 () Bool)

(assert (=> start!101276 m!1121411))

(declare-fun m!1121413 () Bool)

(assert (=> b!1216691 m!1121413))

(declare-fun m!1121415 () Bool)

(assert (=> b!1216691 m!1121415))

(declare-fun m!1121417 () Bool)

(assert (=> b!1216686 m!1121417))

(declare-fun m!1121419 () Bool)

(assert (=> b!1216681 m!1121419))

(declare-fun m!1121421 () Bool)

(assert (=> mapNonEmpty!48229 m!1121421))

(declare-fun m!1121423 () Bool)

(assert (=> b!1216684 m!1121423))

(declare-fun m!1121425 () Bool)

(assert (=> b!1216690 m!1121425))

(declare-fun m!1121427 () Bool)

(assert (=> b!1216680 m!1121427))

(declare-fun m!1121429 () Bool)

(assert (=> b!1216680 m!1121429))

(declare-fun m!1121431 () Bool)

(assert (=> b!1216680 m!1121431))

(declare-fun m!1121433 () Bool)

(assert (=> b!1216680 m!1121433))

(declare-fun m!1121435 () Bool)

(assert (=> b!1216682 m!1121435))

(declare-fun m!1121437 () Bool)

(assert (=> b!1216682 m!1121437))

(assert (=> b!1216682 m!1121435))

(declare-fun m!1121439 () Bool)

(assert (=> b!1216682 m!1121439))

(declare-fun m!1121441 () Bool)

(assert (=> b!1216682 m!1121441))

(declare-fun m!1121443 () Bool)

(assert (=> b!1216682 m!1121443))

(assert (=> b!1216682 m!1121441))

(declare-fun m!1121445 () Bool)

(assert (=> b!1216682 m!1121445))

(declare-fun m!1121447 () Bool)

(assert (=> b!1216693 m!1121447))

(declare-fun m!1121449 () Bool)

(assert (=> b!1216688 m!1121449))

(declare-fun m!1121451 () Bool)

(assert (=> b!1216688 m!1121451))

(check-sat (not b!1216680) tp_is_empty!30903 b_and!43517 (not b!1216684) (not b!1216690) (not b!1216681) (not b!1216691) (not b_next!26199) (not b!1216686) (not b!1216682) (not mapNonEmpty!48229) (not b_lambda!21875) (not b!1216693) (not b!1216688) (not start!101276))
(check-sat b_and!43517 (not b_next!26199))
