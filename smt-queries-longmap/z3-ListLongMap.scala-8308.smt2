; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101432 () Bool)

(assert start!101432)

(declare-fun b_free!26119 () Bool)

(declare-fun b_next!26119 () Bool)

(assert (=> start!101432 (= b_free!26119 (not b_next!26119))))

(declare-fun tp!91378 () Bool)

(declare-fun b_and!43357 () Bool)

(assert (=> start!101432 (= tp!91378 b_and!43357)))

(declare-fun b!1216179 () Bool)

(declare-fun res!807099 () Bool)

(declare-fun e!690718 () Bool)

(assert (=> b!1216179 (=> (not res!807099) (not e!690718))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1216179 (= res!807099 (validMask!0 mask!1564))))

(declare-fun b!1216180 () Bool)

(declare-fun e!690712 () Bool)

(declare-fun tp_is_empty!30823 () Bool)

(assert (=> b!1216180 (= e!690712 tp_is_empty!30823)))

(declare-fun b!1216181 () Bool)

(declare-fun e!690716 () Bool)

(declare-fun e!690715 () Bool)

(assert (=> b!1216181 (= e!690716 (not e!690715))))

(declare-fun res!807104 () Bool)

(assert (=> b!1216181 (=> res!807104 e!690715)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1216181 (= res!807104 (bvsgt from!1455 i!673))))

(declare-datatypes ((array!78465 0))(
  ( (array!78466 (arr!37861 (Array (_ BitVec 32) (_ BitVec 64))) (size!38398 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78465)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!78465 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1216181 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!40260 0))(
  ( (Unit!40261) )
))
(declare-fun lt!552948 () Unit!40260)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78465 (_ BitVec 64) (_ BitVec 32)) Unit!40260)

(assert (=> b!1216181 (= lt!552948 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun mapIsEmpty!48109 () Bool)

(declare-fun mapRes!48109 () Bool)

(assert (=> mapIsEmpty!48109 mapRes!48109))

(declare-fun mapNonEmpty!48109 () Bool)

(declare-fun tp!91379 () Bool)

(declare-fun e!690713 () Bool)

(assert (=> mapNonEmpty!48109 (= mapRes!48109 (and tp!91379 e!690713))))

(declare-fun mapKey!48109 () (_ BitVec 32))

(declare-datatypes ((V!46225 0))(
  ( (V!46226 (val!15468 Int)) )
))
(declare-datatypes ((ValueCell!14702 0))(
  ( (ValueCellFull!14702 (v!18117 V!46225)) (EmptyCell!14702) )
))
(declare-fun mapValue!48109 () ValueCell!14702)

(declare-datatypes ((array!78467 0))(
  ( (array!78468 (arr!37862 (Array (_ BitVec 32) ValueCell!14702)) (size!38399 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78467)

(declare-fun mapRest!48109 () (Array (_ BitVec 32) ValueCell!14702))

(assert (=> mapNonEmpty!48109 (= (arr!37862 _values!996) (store mapRest!48109 mapKey!48109 mapValue!48109))))

(declare-fun b!1216182 () Bool)

(declare-fun res!807103 () Bool)

(assert (=> b!1216182 (=> (not res!807103) (not e!690718))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1216182 (= res!807103 (validKeyInArray!0 k0!934))))

(declare-fun b!1216183 () Bool)

(assert (=> b!1216183 (= e!690713 tp_is_empty!30823)))

(declare-fun res!807101 () Bool)

(assert (=> start!101432 (=> (not res!807101) (not e!690718))))

(assert (=> start!101432 (= res!807101 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38398 _keys!1208))))))

(assert (=> start!101432 e!690718))

(assert (=> start!101432 tp_is_empty!30823))

(declare-fun array_inv!28894 (array!78465) Bool)

(assert (=> start!101432 (array_inv!28894 _keys!1208)))

(assert (=> start!101432 true))

(assert (=> start!101432 tp!91378))

(declare-fun e!690717 () Bool)

(declare-fun array_inv!28895 (array!78467) Bool)

(assert (=> start!101432 (and (array_inv!28895 _values!996) e!690717)))

(declare-fun b!1216184 () Bool)

(declare-fun res!807107 () Bool)

(assert (=> b!1216184 (=> (not res!807107) (not e!690718))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1216184 (= res!807107 (and (= (size!38399 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38398 _keys!1208) (size!38399 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1216185 () Bool)

(declare-fun res!807102 () Bool)

(assert (=> b!1216185 (=> (not res!807102) (not e!690718))))

(assert (=> b!1216185 (= res!807102 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38398 _keys!1208))))))

(declare-fun b!1216186 () Bool)

(assert (=> b!1216186 (= e!690717 (and e!690712 mapRes!48109))))

(declare-fun condMapEmpty!48109 () Bool)

(declare-fun mapDefault!48109 () ValueCell!14702)

(assert (=> b!1216186 (= condMapEmpty!48109 (= (arr!37862 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14702)) mapDefault!48109)))))

(declare-fun b!1216187 () Bool)

(assert (=> b!1216187 (= e!690715 true)))

(declare-fun zeroValue!944 () V!46225)

(declare-fun lt!552946 () array!78465)

(declare-fun minValue!944 () V!46225)

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!19902 0))(
  ( (tuple2!19903 (_1!9962 (_ BitVec 64)) (_2!9962 V!46225)) )
))
(declare-datatypes ((List!26705 0))(
  ( (Nil!26702) (Cons!26701 (h!27919 tuple2!19902) (t!39796 List!26705)) )
))
(declare-datatypes ((ListLongMap!17879 0))(
  ( (ListLongMap!17880 (toList!8955 List!26705)) )
))
(declare-fun lt!552947 () ListLongMap!17879)

(declare-fun getCurrentListMapNoExtraKeys!5412 (array!78465 array!78467 (_ BitVec 32) (_ BitVec 32) V!46225 V!46225 (_ BitVec 32) Int) ListLongMap!17879)

(declare-fun dynLambda!3324 (Int (_ BitVec 64)) V!46225)

(assert (=> b!1216187 (= lt!552947 (getCurrentListMapNoExtraKeys!5412 lt!552946 (array!78468 (store (arr!37862 _values!996) i!673 (ValueCellFull!14702 (dynLambda!3324 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38399 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!552945 () ListLongMap!17879)

(assert (=> b!1216187 (= lt!552945 (getCurrentListMapNoExtraKeys!5412 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1216188 () Bool)

(declare-fun res!807108 () Bool)

(assert (=> b!1216188 (=> (not res!807108) (not e!690718))))

(assert (=> b!1216188 (= res!807108 (= (select (arr!37861 _keys!1208) i!673) k0!934))))

(declare-fun b!1216189 () Bool)

(declare-fun res!807100 () Bool)

(assert (=> b!1216189 (=> (not res!807100) (not e!690718))))

(declare-datatypes ((List!26706 0))(
  ( (Nil!26703) (Cons!26702 (h!27920 (_ BitVec 64)) (t!39797 List!26706)) )
))
(declare-fun arrayNoDuplicates!0 (array!78465 (_ BitVec 32) List!26706) Bool)

(assert (=> b!1216189 (= res!807100 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26703))))

(declare-fun b!1216190 () Bool)

(declare-fun res!807105 () Bool)

(assert (=> b!1216190 (=> (not res!807105) (not e!690718))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78465 (_ BitVec 32)) Bool)

(assert (=> b!1216190 (= res!807105 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1216191 () Bool)

(declare-fun res!807106 () Bool)

(assert (=> b!1216191 (=> (not res!807106) (not e!690716))))

(assert (=> b!1216191 (= res!807106 (arrayNoDuplicates!0 lt!552946 #b00000000000000000000000000000000 Nil!26703))))

(declare-fun b!1216192 () Bool)

(assert (=> b!1216192 (= e!690718 e!690716)))

(declare-fun res!807109 () Bool)

(assert (=> b!1216192 (=> (not res!807109) (not e!690716))))

(assert (=> b!1216192 (= res!807109 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!552946 mask!1564))))

(assert (=> b!1216192 (= lt!552946 (array!78466 (store (arr!37861 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38398 _keys!1208)))))

(assert (= (and start!101432 res!807101) b!1216179))

(assert (= (and b!1216179 res!807099) b!1216184))

(assert (= (and b!1216184 res!807107) b!1216190))

(assert (= (and b!1216190 res!807105) b!1216189))

(assert (= (and b!1216189 res!807100) b!1216185))

(assert (= (and b!1216185 res!807102) b!1216182))

(assert (= (and b!1216182 res!807103) b!1216188))

(assert (= (and b!1216188 res!807108) b!1216192))

(assert (= (and b!1216192 res!807109) b!1216191))

(assert (= (and b!1216191 res!807106) b!1216181))

(assert (= (and b!1216181 (not res!807104)) b!1216187))

(assert (= (and b!1216186 condMapEmpty!48109) mapIsEmpty!48109))

(assert (= (and b!1216186 (not condMapEmpty!48109)) mapNonEmpty!48109))

(get-info :version)

(assert (= (and mapNonEmpty!48109 ((_ is ValueCellFull!14702) mapValue!48109)) b!1216183))

(assert (= (and b!1216186 ((_ is ValueCellFull!14702) mapDefault!48109)) b!1216180))

(assert (= start!101432 b!1216186))

(declare-fun b_lambda!21789 () Bool)

(assert (=> (not b_lambda!21789) (not b!1216187)))

(declare-fun t!39795 () Bool)

(declare-fun tb!10911 () Bool)

(assert (=> (and start!101432 (= defaultEntry!1004 defaultEntry!1004) t!39795) tb!10911))

(declare-fun result!22427 () Bool)

(assert (=> tb!10911 (= result!22427 tp_is_empty!30823)))

(assert (=> b!1216187 t!39795))

(declare-fun b_and!43359 () Bool)

(assert (= b_and!43357 (and (=> t!39795 result!22427) b_and!43359)))

(declare-fun m!1121577 () Bool)

(assert (=> b!1216188 m!1121577))

(declare-fun m!1121579 () Bool)

(assert (=> b!1216189 m!1121579))

(declare-fun m!1121581 () Bool)

(assert (=> b!1216187 m!1121581))

(declare-fun m!1121583 () Bool)

(assert (=> b!1216187 m!1121583))

(declare-fun m!1121585 () Bool)

(assert (=> b!1216187 m!1121585))

(declare-fun m!1121587 () Bool)

(assert (=> b!1216187 m!1121587))

(declare-fun m!1121589 () Bool)

(assert (=> b!1216192 m!1121589))

(declare-fun m!1121591 () Bool)

(assert (=> b!1216192 m!1121591))

(declare-fun m!1121593 () Bool)

(assert (=> start!101432 m!1121593))

(declare-fun m!1121595 () Bool)

(assert (=> start!101432 m!1121595))

(declare-fun m!1121597 () Bool)

(assert (=> b!1216190 m!1121597))

(declare-fun m!1121599 () Bool)

(assert (=> b!1216181 m!1121599))

(declare-fun m!1121601 () Bool)

(assert (=> b!1216181 m!1121601))

(declare-fun m!1121603 () Bool)

(assert (=> b!1216191 m!1121603))

(declare-fun m!1121605 () Bool)

(assert (=> b!1216182 m!1121605))

(declare-fun m!1121607 () Bool)

(assert (=> mapNonEmpty!48109 m!1121607))

(declare-fun m!1121609 () Bool)

(assert (=> b!1216179 m!1121609))

(check-sat (not mapNonEmpty!48109) (not b!1216192) (not b_lambda!21789) (not b!1216190) (not start!101432) (not b!1216182) (not b!1216189) (not b_next!26119) (not b!1216187) b_and!43359 (not b!1216191) (not b!1216179) (not b!1216181) tp_is_empty!30823)
(check-sat b_and!43359 (not b_next!26119))
