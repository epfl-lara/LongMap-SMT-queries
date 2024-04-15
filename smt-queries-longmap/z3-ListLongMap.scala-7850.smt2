; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97838 () Bool)

(assert start!97838)

(declare-fun b_free!23545 () Bool)

(declare-fun b_next!23545 () Bool)

(assert (=> start!97838 (= b_free!23545 (not b_next!23545))))

(declare-fun tp!83338 () Bool)

(declare-fun b_and!37851 () Bool)

(assert (=> start!97838 (= tp!83338 b_and!37851)))

(declare-fun b!1119785 () Bool)

(declare-fun res!748042 () Bool)

(declare-fun e!637682 () Bool)

(assert (=> b!1119785 (=> (not res!748042) (not e!637682))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1119785 (= res!748042 (validKeyInArray!0 k0!934))))

(declare-fun b!1119786 () Bool)

(declare-fun res!748043 () Bool)

(assert (=> b!1119786 (=> (not res!748043) (not e!637682))))

(declare-datatypes ((array!72944 0))(
  ( (array!72945 (arr!35125 (Array (_ BitVec 32) (_ BitVec 64))) (size!35663 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72944)

(declare-datatypes ((List!24517 0))(
  ( (Nil!24514) (Cons!24513 (h!25722 (_ BitVec 64)) (t!35045 List!24517)) )
))
(declare-fun arrayNoDuplicates!0 (array!72944 (_ BitVec 32) List!24517) Bool)

(assert (=> b!1119786 (= res!748043 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24514))))

(declare-fun b!1119787 () Bool)

(declare-fun res!748047 () Bool)

(assert (=> b!1119787 (=> (not res!748047) (not e!637682))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1119787 (= res!748047 (validMask!0 mask!1564))))

(declare-fun res!748045 () Bool)

(assert (=> start!97838 (=> (not res!748045) (not e!637682))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97838 (= res!748045 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35663 _keys!1208))))))

(assert (=> start!97838 e!637682))

(declare-fun tp_is_empty!28075 () Bool)

(assert (=> start!97838 tp_is_empty!28075))

(declare-fun array_inv!27050 (array!72944) Bool)

(assert (=> start!97838 (array_inv!27050 _keys!1208)))

(assert (=> start!97838 true))

(assert (=> start!97838 tp!83338))

(declare-datatypes ((V!42561 0))(
  ( (V!42562 (val!14094 Int)) )
))
(declare-datatypes ((ValueCell!13328 0))(
  ( (ValueCellFull!13328 (v!16726 V!42561)) (EmptyCell!13328) )
))
(declare-datatypes ((array!72946 0))(
  ( (array!72947 (arr!35126 (Array (_ BitVec 32) ValueCell!13328)) (size!35664 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72946)

(declare-fun e!637680 () Bool)

(declare-fun array_inv!27051 (array!72946) Bool)

(assert (=> start!97838 (and (array_inv!27051 _values!996) e!637680)))

(declare-fun b!1119788 () Bool)

(declare-fun res!748038 () Bool)

(assert (=> b!1119788 (=> (not res!748038) (not e!637682))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1119788 (= res!748038 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35663 _keys!1208))))))

(declare-fun b!1119789 () Bool)

(declare-fun e!637683 () Bool)

(assert (=> b!1119789 (= e!637683 true)))

(declare-fun zeroValue!944 () V!42561)

(declare-fun lt!497684 () array!72944)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((tuple2!17746 0))(
  ( (tuple2!17747 (_1!8884 (_ BitVec 64)) (_2!8884 V!42561)) )
))
(declare-datatypes ((List!24518 0))(
  ( (Nil!24515) (Cons!24514 (h!25723 tuple2!17746) (t!35046 List!24518)) )
))
(declare-datatypes ((ListLongMap!15715 0))(
  ( (ListLongMap!15716 (toList!7873 List!24518)) )
))
(declare-fun lt!497685 () ListLongMap!15715)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!42561)

(declare-fun getCurrentListMapNoExtraKeys!4382 (array!72944 array!72946 (_ BitVec 32) (_ BitVec 32) V!42561 V!42561 (_ BitVec 32) Int) ListLongMap!15715)

(declare-fun dynLambda!2425 (Int (_ BitVec 64)) V!42561)

(assert (=> b!1119789 (= lt!497685 (getCurrentListMapNoExtraKeys!4382 lt!497684 (array!72947 (store (arr!35126 _values!996) i!673 (ValueCellFull!13328 (dynLambda!2425 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35664 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!497683 () ListLongMap!15715)

(assert (=> b!1119789 (= lt!497683 (getCurrentListMapNoExtraKeys!4382 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun mapIsEmpty!43930 () Bool)

(declare-fun mapRes!43930 () Bool)

(assert (=> mapIsEmpty!43930 mapRes!43930))

(declare-fun b!1119790 () Bool)

(declare-fun res!748041 () Bool)

(assert (=> b!1119790 (=> (not res!748041) (not e!637682))))

(assert (=> b!1119790 (= res!748041 (and (= (size!35664 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35663 _keys!1208) (size!35664 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1119791 () Bool)

(declare-fun res!748048 () Bool)

(assert (=> b!1119791 (=> (not res!748048) (not e!637682))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72944 (_ BitVec 32)) Bool)

(assert (=> b!1119791 (= res!748048 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1119792 () Bool)

(declare-fun res!748046 () Bool)

(declare-fun e!637679 () Bool)

(assert (=> b!1119792 (=> (not res!748046) (not e!637679))))

(assert (=> b!1119792 (= res!748046 (arrayNoDuplicates!0 lt!497684 #b00000000000000000000000000000000 Nil!24514))))

(declare-fun b!1119793 () Bool)

(declare-fun e!637678 () Bool)

(assert (=> b!1119793 (= e!637680 (and e!637678 mapRes!43930))))

(declare-fun condMapEmpty!43930 () Bool)

(declare-fun mapDefault!43930 () ValueCell!13328)

(assert (=> b!1119793 (= condMapEmpty!43930 (= (arr!35126 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13328)) mapDefault!43930)))))

(declare-fun b!1119794 () Bool)

(declare-fun res!748039 () Bool)

(assert (=> b!1119794 (=> (not res!748039) (not e!637682))))

(assert (=> b!1119794 (= res!748039 (= (select (arr!35125 _keys!1208) i!673) k0!934))))

(declare-fun b!1119795 () Bool)

(declare-fun e!637677 () Bool)

(assert (=> b!1119795 (= e!637677 tp_is_empty!28075)))

(declare-fun b!1119796 () Bool)

(assert (=> b!1119796 (= e!637682 e!637679)))

(declare-fun res!748040 () Bool)

(assert (=> b!1119796 (=> (not res!748040) (not e!637679))))

(assert (=> b!1119796 (= res!748040 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!497684 mask!1564))))

(assert (=> b!1119796 (= lt!497684 (array!72945 (store (arr!35125 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35663 _keys!1208)))))

(declare-fun mapNonEmpty!43930 () Bool)

(declare-fun tp!83339 () Bool)

(assert (=> mapNonEmpty!43930 (= mapRes!43930 (and tp!83339 e!637677))))

(declare-fun mapKey!43930 () (_ BitVec 32))

(declare-fun mapValue!43930 () ValueCell!13328)

(declare-fun mapRest!43930 () (Array (_ BitVec 32) ValueCell!13328))

(assert (=> mapNonEmpty!43930 (= (arr!35126 _values!996) (store mapRest!43930 mapKey!43930 mapValue!43930))))

(declare-fun b!1119797 () Bool)

(assert (=> b!1119797 (= e!637678 tp_is_empty!28075)))

(declare-fun b!1119798 () Bool)

(assert (=> b!1119798 (= e!637679 (not e!637683))))

(declare-fun res!748044 () Bool)

(assert (=> b!1119798 (=> res!748044 e!637683)))

(assert (=> b!1119798 (= res!748044 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!72944 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1119798 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36573 0))(
  ( (Unit!36574) )
))
(declare-fun lt!497682 () Unit!36573)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72944 (_ BitVec 64) (_ BitVec 32)) Unit!36573)

(assert (=> b!1119798 (= lt!497682 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(assert (= (and start!97838 res!748045) b!1119787))

(assert (= (and b!1119787 res!748047) b!1119790))

(assert (= (and b!1119790 res!748041) b!1119791))

(assert (= (and b!1119791 res!748048) b!1119786))

(assert (= (and b!1119786 res!748043) b!1119788))

(assert (= (and b!1119788 res!748038) b!1119785))

(assert (= (and b!1119785 res!748042) b!1119794))

(assert (= (and b!1119794 res!748039) b!1119796))

(assert (= (and b!1119796 res!748040) b!1119792))

(assert (= (and b!1119792 res!748046) b!1119798))

(assert (= (and b!1119798 (not res!748044)) b!1119789))

(assert (= (and b!1119793 condMapEmpty!43930) mapIsEmpty!43930))

(assert (= (and b!1119793 (not condMapEmpty!43930)) mapNonEmpty!43930))

(get-info :version)

(assert (= (and mapNonEmpty!43930 ((_ is ValueCellFull!13328) mapValue!43930)) b!1119795))

(assert (= (and b!1119793 ((_ is ValueCellFull!13328) mapDefault!43930)) b!1119797))

(assert (= start!97838 b!1119793))

(declare-fun b_lambda!18497 () Bool)

(assert (=> (not b_lambda!18497) (not b!1119789)))

(declare-fun t!35044 () Bool)

(declare-fun tb!8349 () Bool)

(assert (=> (and start!97838 (= defaultEntry!1004 defaultEntry!1004) t!35044) tb!8349))

(declare-fun result!17267 () Bool)

(assert (=> tb!8349 (= result!17267 tp_is_empty!28075)))

(assert (=> b!1119789 t!35044))

(declare-fun b_and!37853 () Bool)

(assert (= b_and!37851 (and (=> t!35044 result!17267) b_and!37853)))

(declare-fun m!1034463 () Bool)

(assert (=> b!1119796 m!1034463))

(declare-fun m!1034465 () Bool)

(assert (=> b!1119796 m!1034465))

(declare-fun m!1034467 () Bool)

(assert (=> b!1119789 m!1034467))

(declare-fun m!1034469 () Bool)

(assert (=> b!1119789 m!1034469))

(declare-fun m!1034471 () Bool)

(assert (=> b!1119789 m!1034471))

(declare-fun m!1034473 () Bool)

(assert (=> b!1119789 m!1034473))

(declare-fun m!1034475 () Bool)

(assert (=> b!1119798 m!1034475))

(declare-fun m!1034477 () Bool)

(assert (=> b!1119798 m!1034477))

(declare-fun m!1034479 () Bool)

(assert (=> b!1119787 m!1034479))

(declare-fun m!1034481 () Bool)

(assert (=> mapNonEmpty!43930 m!1034481))

(declare-fun m!1034483 () Bool)

(assert (=> start!97838 m!1034483))

(declare-fun m!1034485 () Bool)

(assert (=> start!97838 m!1034485))

(declare-fun m!1034487 () Bool)

(assert (=> b!1119794 m!1034487))

(declare-fun m!1034489 () Bool)

(assert (=> b!1119792 m!1034489))

(declare-fun m!1034491 () Bool)

(assert (=> b!1119785 m!1034491))

(declare-fun m!1034493 () Bool)

(assert (=> b!1119791 m!1034493))

(declare-fun m!1034495 () Bool)

(assert (=> b!1119786 m!1034495))

(check-sat tp_is_empty!28075 (not b!1119791) (not b!1119796) (not b!1119785) (not b!1119786) (not start!97838) (not b!1119787) (not b_next!23545) (not b!1119798) b_and!37853 (not mapNonEmpty!43930) (not b!1119789) (not b!1119792) (not b_lambda!18497))
(check-sat b_and!37853 (not b_next!23545))
