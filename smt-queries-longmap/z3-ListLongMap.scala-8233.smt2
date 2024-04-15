; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100300 () Bool)

(assert start!100300)

(declare-fun b_free!25693 () Bool)

(declare-fun b_next!25693 () Bool)

(assert (=> start!100300 (= b_free!25693 (not b_next!25693))))

(declare-fun tp!90026 () Bool)

(declare-fun b_and!42231 () Bool)

(assert (=> start!100300 (= tp!90026 b_and!42231)))

(declare-fun b!1196789 () Bool)

(declare-fun e!679921 () Bool)

(declare-fun e!679915 () Bool)

(assert (=> b!1196789 (= e!679921 e!679915)))

(declare-fun res!796495 () Bool)

(assert (=> b!1196789 (=> (not res!796495) (not e!679915))))

(declare-datatypes ((array!77456 0))(
  ( (array!77457 (arr!37375 (Array (_ BitVec 32) (_ BitVec 64))) (size!37913 (_ BitVec 32))) )
))
(declare-fun lt!542973 () array!77456)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77456 (_ BitVec 32)) Bool)

(assert (=> b!1196789 (= res!796495 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!542973 mask!1564))))

(declare-fun _keys!1208 () array!77456)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1196789 (= lt!542973 (array!77457 (store (arr!37375 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37913 _keys!1208)))))

(declare-fun b!1196790 () Bool)

(declare-fun res!796499 () Bool)

(assert (=> b!1196790 (=> (not res!796499) (not e!679921))))

(assert (=> b!1196790 (= res!796499 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1196791 () Bool)

(declare-fun e!679919 () Bool)

(assert (=> b!1196791 (= e!679919 true)))

(declare-fun e!679920 () Bool)

(assert (=> b!1196791 e!679920))

(declare-fun c!117328 () Bool)

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1196791 (= c!117328 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun k0!934 () (_ BitVec 64))

(declare-datatypes ((V!45625 0))(
  ( (V!45626 (val!15243 Int)) )
))
(declare-datatypes ((ValueCell!14477 0))(
  ( (ValueCellFull!14477 (v!17880 V!45625)) (EmptyCell!14477) )
))
(declare-datatypes ((array!77458 0))(
  ( (array!77459 (arr!37376 (Array (_ BitVec 32) ValueCell!14477)) (size!37914 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77458)

(declare-fun minValue!944 () V!45625)

(declare-fun zeroValue!944 () V!45625)

(declare-datatypes ((Unit!39557 0))(
  ( (Unit!39558) )
))
(declare-fun lt!542972 () Unit!39557)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!994 (array!77456 array!77458 (_ BitVec 32) (_ BitVec 32) V!45625 V!45625 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39557)

(assert (=> b!1196791 (= lt!542972 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!994 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-datatypes ((tuple2!19612 0))(
  ( (tuple2!19613 (_1!9817 (_ BitVec 64)) (_2!9817 V!45625)) )
))
(declare-datatypes ((List!26389 0))(
  ( (Nil!26386) (Cons!26385 (h!27594 tuple2!19612) (t!39065 List!26389)) )
))
(declare-datatypes ((ListLongMap!17581 0))(
  ( (ListLongMap!17582 (toList!8806 List!26389)) )
))
(declare-fun call!57178 () ListLongMap!17581)

(declare-fun bm!57174 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!5256 (array!77456 array!77458 (_ BitVec 32) (_ BitVec 32) V!45625 V!45625 (_ BitVec 32) Int) ListLongMap!17581)

(assert (=> bm!57174 (= call!57178 (getCurrentListMapNoExtraKeys!5256 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapNonEmpty!47396 () Bool)

(declare-fun mapRes!47396 () Bool)

(declare-fun tp!90027 () Bool)

(declare-fun e!679918 () Bool)

(assert (=> mapNonEmpty!47396 (= mapRes!47396 (and tp!90027 e!679918))))

(declare-fun mapRest!47396 () (Array (_ BitVec 32) ValueCell!14477))

(declare-fun mapKey!47396 () (_ BitVec 32))

(declare-fun mapValue!47396 () ValueCell!14477)

(assert (=> mapNonEmpty!47396 (= (arr!37376 _values!996) (store mapRest!47396 mapKey!47396 mapValue!47396))))

(declare-fun mapIsEmpty!47396 () Bool)

(assert (=> mapIsEmpty!47396 mapRes!47396))

(declare-fun b!1196792 () Bool)

(declare-fun res!796493 () Bool)

(assert (=> b!1196792 (=> (not res!796493) (not e!679915))))

(declare-datatypes ((List!26390 0))(
  ( (Nil!26387) (Cons!26386 (h!27595 (_ BitVec 64)) (t!39066 List!26390)) )
))
(declare-fun arrayNoDuplicates!0 (array!77456 (_ BitVec 32) List!26390) Bool)

(assert (=> b!1196792 (= res!796493 (arrayNoDuplicates!0 lt!542973 #b00000000000000000000000000000000 Nil!26387))))

(declare-fun b!1196793 () Bool)

(declare-fun res!796498 () Bool)

(assert (=> b!1196793 (=> (not res!796498) (not e!679921))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1196793 (= res!796498 (validMask!0 mask!1564))))

(declare-fun b!1196794 () Bool)

(declare-fun res!796497 () Bool)

(assert (=> b!1196794 (=> (not res!796497) (not e!679921))))

(assert (=> b!1196794 (= res!796497 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26387))))

(declare-fun b!1196795 () Bool)

(declare-fun e!679916 () Bool)

(declare-fun tp_is_empty!30373 () Bool)

(assert (=> b!1196795 (= e!679916 tp_is_empty!30373)))

(declare-fun b!1196796 () Bool)

(declare-fun e!679917 () Bool)

(assert (=> b!1196796 (= e!679917 (and e!679916 mapRes!47396))))

(declare-fun condMapEmpty!47396 () Bool)

(declare-fun mapDefault!47396 () ValueCell!14477)

(assert (=> b!1196796 (= condMapEmpty!47396 (= (arr!37376 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14477)) mapDefault!47396)))))

(declare-fun b!1196797 () Bool)

(declare-fun call!57177 () ListLongMap!17581)

(declare-fun -!1743 (ListLongMap!17581 (_ BitVec 64)) ListLongMap!17581)

(assert (=> b!1196797 (= e!679920 (= call!57177 (-!1743 call!57178 k0!934)))))

(declare-fun b!1196798 () Bool)

(assert (=> b!1196798 (= e!679915 (not e!679919))))

(declare-fun res!796494 () Bool)

(assert (=> b!1196798 (=> res!796494 e!679919)))

(assert (=> b!1196798 (= res!796494 (or (bvsle from!1455 i!673) (bvsgt (bvadd #b00000000000000000000000000000001 from!1455) (size!37913 _keys!1208)) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!77456 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1196798 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!542971 () Unit!39557)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77456 (_ BitVec 64) (_ BitVec 32)) Unit!39557)

(assert (=> b!1196798 (= lt!542971 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1196799 () Bool)

(assert (=> b!1196799 (= e!679918 tp_is_empty!30373)))

(declare-fun res!796501 () Bool)

(assert (=> start!100300 (=> (not res!796501) (not e!679921))))

(assert (=> start!100300 (= res!796501 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37913 _keys!1208))))))

(assert (=> start!100300 e!679921))

(assert (=> start!100300 tp_is_empty!30373))

(declare-fun array_inv!28610 (array!77456) Bool)

(assert (=> start!100300 (array_inv!28610 _keys!1208)))

(assert (=> start!100300 true))

(assert (=> start!100300 tp!90026))

(declare-fun array_inv!28611 (array!77458) Bool)

(assert (=> start!100300 (and (array_inv!28611 _values!996) e!679917)))

(declare-fun bm!57175 () Bool)

(declare-fun dynLambda!3140 (Int (_ BitVec 64)) V!45625)

(assert (=> bm!57175 (= call!57177 (getCurrentListMapNoExtraKeys!5256 lt!542973 (array!77459 (store (arr!37376 _values!996) i!673 (ValueCellFull!14477 (dynLambda!3140 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37914 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1196800 () Bool)

(declare-fun res!796496 () Bool)

(assert (=> b!1196800 (=> (not res!796496) (not e!679921))))

(assert (=> b!1196800 (= res!796496 (and (= (size!37914 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37913 _keys!1208) (size!37914 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1196801 () Bool)

(declare-fun res!796491 () Bool)

(assert (=> b!1196801 (=> (not res!796491) (not e!679921))))

(assert (=> b!1196801 (= res!796491 (= (select (arr!37375 _keys!1208) i!673) k0!934))))

(declare-fun b!1196802 () Bool)

(declare-fun res!796500 () Bool)

(assert (=> b!1196802 (=> (not res!796500) (not e!679921))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1196802 (= res!796500 (validKeyInArray!0 k0!934))))

(declare-fun b!1196803 () Bool)

(assert (=> b!1196803 (= e!679920 (= call!57177 call!57178))))

(declare-fun b!1196804 () Bool)

(declare-fun res!796492 () Bool)

(assert (=> b!1196804 (=> (not res!796492) (not e!679921))))

(assert (=> b!1196804 (= res!796492 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37913 _keys!1208))))))

(assert (= (and start!100300 res!796501) b!1196793))

(assert (= (and b!1196793 res!796498) b!1196800))

(assert (= (and b!1196800 res!796496) b!1196790))

(assert (= (and b!1196790 res!796499) b!1196794))

(assert (= (and b!1196794 res!796497) b!1196804))

(assert (= (and b!1196804 res!796492) b!1196802))

(assert (= (and b!1196802 res!796500) b!1196801))

(assert (= (and b!1196801 res!796491) b!1196789))

(assert (= (and b!1196789 res!796495) b!1196792))

(assert (= (and b!1196792 res!796493) b!1196798))

(assert (= (and b!1196798 (not res!796494)) b!1196791))

(assert (= (and b!1196791 c!117328) b!1196797))

(assert (= (and b!1196791 (not c!117328)) b!1196803))

(assert (= (or b!1196797 b!1196803) bm!57175))

(assert (= (or b!1196797 b!1196803) bm!57174))

(assert (= (and b!1196796 condMapEmpty!47396) mapIsEmpty!47396))

(assert (= (and b!1196796 (not condMapEmpty!47396)) mapNonEmpty!47396))

(get-info :version)

(assert (= (and mapNonEmpty!47396 ((_ is ValueCellFull!14477) mapValue!47396)) b!1196799))

(assert (= (and b!1196796 ((_ is ValueCellFull!14477) mapDefault!47396)) b!1196795))

(assert (= start!100300 b!1196796))

(declare-fun b_lambda!20819 () Bool)

(assert (=> (not b_lambda!20819) (not bm!57175)))

(declare-fun t!39064 () Bool)

(declare-fun tb!10497 () Bool)

(assert (=> (and start!100300 (= defaultEntry!1004 defaultEntry!1004) t!39064) tb!10497))

(declare-fun result!21575 () Bool)

(assert (=> tb!10497 (= result!21575 tp_is_empty!30373)))

(assert (=> bm!57175 t!39064))

(declare-fun b_and!42233 () Bool)

(assert (= b_and!42231 (and (=> t!39064 result!21575) b_and!42233)))

(declare-fun m!1103405 () Bool)

(assert (=> b!1196789 m!1103405))

(declare-fun m!1103407 () Bool)

(assert (=> b!1196789 m!1103407))

(declare-fun m!1103409 () Bool)

(assert (=> mapNonEmpty!47396 m!1103409))

(declare-fun m!1103411 () Bool)

(assert (=> start!100300 m!1103411))

(declare-fun m!1103413 () Bool)

(assert (=> start!100300 m!1103413))

(declare-fun m!1103415 () Bool)

(assert (=> b!1196791 m!1103415))

(declare-fun m!1103417 () Bool)

(assert (=> b!1196801 m!1103417))

(declare-fun m!1103419 () Bool)

(assert (=> b!1196792 m!1103419))

(declare-fun m!1103421 () Bool)

(assert (=> bm!57175 m!1103421))

(declare-fun m!1103423 () Bool)

(assert (=> bm!57175 m!1103423))

(declare-fun m!1103425 () Bool)

(assert (=> bm!57175 m!1103425))

(declare-fun m!1103427 () Bool)

(assert (=> b!1196793 m!1103427))

(declare-fun m!1103429 () Bool)

(assert (=> b!1196790 m!1103429))

(declare-fun m!1103431 () Bool)

(assert (=> b!1196797 m!1103431))

(declare-fun m!1103433 () Bool)

(assert (=> b!1196798 m!1103433))

(declare-fun m!1103435 () Bool)

(assert (=> b!1196798 m!1103435))

(declare-fun m!1103437 () Bool)

(assert (=> bm!57174 m!1103437))

(declare-fun m!1103439 () Bool)

(assert (=> b!1196802 m!1103439))

(declare-fun m!1103441 () Bool)

(assert (=> b!1196794 m!1103441))

(check-sat (not bm!57175) b_and!42233 (not b_lambda!20819) (not bm!57174) (not b!1196798) (not b!1196790) (not b!1196792) (not b!1196789) (not mapNonEmpty!47396) (not start!100300) tp_is_empty!30373 (not b!1196794) (not b!1196797) (not b!1196802) (not b!1196791) (not b!1196793) (not b_next!25693))
(check-sat b_and!42233 (not b_next!25693))
