; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101420 () Bool)

(assert start!101420)

(declare-fun b_free!26265 () Bool)

(declare-fun b_next!26265 () Bool)

(assert (=> start!101420 (= b_free!26265 (not b_next!26265))))

(declare-fun tp!91825 () Bool)

(declare-fun b_and!43701 () Bool)

(assert (=> start!101420 (= tp!91825 b_and!43701)))

(declare-fun b!1218872 () Bool)

(declare-fun e!692037 () Bool)

(declare-fun e!692040 () Bool)

(assert (=> b!1218872 (= e!692037 e!692040)))

(declare-fun res!809530 () Bool)

(assert (=> b!1218872 (=> (not res!809530) (not e!692040))))

(declare-datatypes ((array!78713 0))(
  ( (array!78714 (arr!37988 (Array (_ BitVec 32) (_ BitVec 64))) (size!38524 (_ BitVec 32))) )
))
(declare-fun lt!554119 () array!78713)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78713 (_ BitVec 32)) Bool)

(assert (=> b!1218872 (= res!809530 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!554119 mask!1564))))

(declare-fun _keys!1208 () array!78713)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1218872 (= lt!554119 (array!78714 (store (arr!37988 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38524 _keys!1208)))))

(declare-fun b!1218873 () Bool)

(declare-fun res!809518 () Bool)

(assert (=> b!1218873 (=> (not res!809518) (not e!692037))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1218873 (= res!809518 (validKeyInArray!0 k0!934))))

(declare-fun b!1218874 () Bool)

(declare-fun e!692041 () Bool)

(declare-fun e!692038 () Bool)

(assert (=> b!1218874 (= e!692041 e!692038)))

(declare-fun res!809525 () Bool)

(assert (=> b!1218874 (=> res!809525 e!692038)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1218874 (= res!809525 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-datatypes ((V!46419 0))(
  ( (V!46420 (val!15541 Int)) )
))
(declare-fun zeroValue!944 () V!46419)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((ValueCell!14775 0))(
  ( (ValueCellFull!14775 (v!18197 V!46419)) (EmptyCell!14775) )
))
(declare-datatypes ((array!78715 0))(
  ( (array!78716 (arr!37989 (Array (_ BitVec 32) ValueCell!14775)) (size!38525 (_ BitVec 32))) )
))
(declare-fun lt!554120 () array!78715)

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!19994 0))(
  ( (tuple2!19995 (_1!10008 (_ BitVec 64)) (_2!10008 V!46419)) )
))
(declare-datatypes ((List!26796 0))(
  ( (Nil!26793) (Cons!26792 (h!28001 tuple2!19994) (t!40041 List!26796)) )
))
(declare-datatypes ((ListLongMap!17963 0))(
  ( (ListLongMap!17964 (toList!8997 List!26796)) )
))
(declare-fun lt!554123 () ListLongMap!17963)

(declare-fun minValue!944 () V!46419)

(declare-fun getCurrentListMapNoExtraKeys!5423 (array!78713 array!78715 (_ BitVec 32) (_ BitVec 32) V!46419 V!46419 (_ BitVec 32) Int) ListLongMap!17963)

(assert (=> b!1218874 (= lt!554123 (getCurrentListMapNoExtraKeys!5423 lt!554119 lt!554120 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun _values!996 () array!78715)

(declare-fun lt!554127 () V!46419)

(assert (=> b!1218874 (= lt!554120 (array!78716 (store (arr!37989 _values!996) i!673 (ValueCellFull!14775 lt!554127)) (size!38525 _values!996)))))

(declare-fun dynLambda!3306 (Int (_ BitVec 64)) V!46419)

(assert (=> b!1218874 (= lt!554127 (dynLambda!3306 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!554121 () ListLongMap!17963)

(assert (=> b!1218874 (= lt!554121 (getCurrentListMapNoExtraKeys!5423 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1218875 () Bool)

(assert (=> b!1218875 (= e!692040 (not e!692041))))

(declare-fun res!809527 () Bool)

(assert (=> b!1218875 (=> res!809527 e!692041)))

(assert (=> b!1218875 (= res!809527 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!78713 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1218875 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!40396 0))(
  ( (Unit!40397) )
))
(declare-fun lt!554122 () Unit!40396)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78713 (_ BitVec 64) (_ BitVec 32)) Unit!40396)

(assert (=> b!1218875 (= lt!554122 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1218876 () Bool)

(declare-fun res!809531 () Bool)

(assert (=> b!1218876 (=> (not res!809531) (not e!692037))))

(assert (=> b!1218876 (= res!809531 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun res!809520 () Bool)

(assert (=> start!101420 (=> (not res!809520) (not e!692037))))

(assert (=> start!101420 (= res!809520 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38524 _keys!1208))))))

(assert (=> start!101420 e!692037))

(declare-fun tp_is_empty!30969 () Bool)

(assert (=> start!101420 tp_is_empty!30969))

(declare-fun array_inv!28912 (array!78713) Bool)

(assert (=> start!101420 (array_inv!28912 _keys!1208)))

(assert (=> start!101420 true))

(assert (=> start!101420 tp!91825))

(declare-fun e!692045 () Bool)

(declare-fun array_inv!28913 (array!78715) Bool)

(assert (=> start!101420 (and (array_inv!28913 _values!996) e!692045)))

(declare-fun b!1218877 () Bool)

(declare-fun res!809526 () Bool)

(assert (=> b!1218877 (=> (not res!809526) (not e!692037))))

(declare-datatypes ((List!26797 0))(
  ( (Nil!26794) (Cons!26793 (h!28002 (_ BitVec 64)) (t!40042 List!26797)) )
))
(declare-fun arrayNoDuplicates!0 (array!78713 (_ BitVec 32) List!26797) Bool)

(assert (=> b!1218877 (= res!809526 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26794))))

(declare-fun b!1218878 () Bool)

(declare-fun res!809521 () Bool)

(assert (=> b!1218878 (=> (not res!809521) (not e!692037))))

(assert (=> b!1218878 (= res!809521 (and (= (size!38525 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38524 _keys!1208) (size!38525 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1218879 () Bool)

(declare-fun e!692042 () Bool)

(assert (=> b!1218879 (= e!692042 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1218880 () Bool)

(declare-fun res!809522 () Bool)

(assert (=> b!1218880 (=> (not res!809522) (not e!692040))))

(assert (=> b!1218880 (= res!809522 (arrayNoDuplicates!0 lt!554119 #b00000000000000000000000000000000 Nil!26794))))

(declare-fun b!1218881 () Bool)

(declare-fun res!809528 () Bool)

(assert (=> b!1218881 (=> (not res!809528) (not e!692037))))

(assert (=> b!1218881 (= res!809528 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38524 _keys!1208))))))

(declare-fun b!1218882 () Bool)

(declare-fun e!692036 () Bool)

(assert (=> b!1218882 (= e!692036 true)))

(declare-fun e!692043 () Bool)

(assert (=> b!1218882 e!692043))

(declare-fun res!809524 () Bool)

(assert (=> b!1218882 (=> (not res!809524) (not e!692043))))

(declare-fun lt!554126 () ListLongMap!17963)

(declare-fun +!4066 (ListLongMap!17963 tuple2!19994) ListLongMap!17963)

(declare-fun get!19367 (ValueCell!14775 V!46419) V!46419)

(assert (=> b!1218882 (= res!809524 (= lt!554123 (+!4066 lt!554126 (tuple2!19995 (select (arr!37988 _keys!1208) from!1455) (get!19367 (select (arr!37989 _values!996) from!1455) lt!554127)))))))

(declare-fun mapIsEmpty!48337 () Bool)

(declare-fun mapRes!48337 () Bool)

(assert (=> mapIsEmpty!48337 mapRes!48337))

(declare-fun b!1218883 () Bool)

(assert (=> b!1218883 (= e!692038 e!692036)))

(declare-fun res!809532 () Bool)

(assert (=> b!1218883 (=> res!809532 e!692036)))

(assert (=> b!1218883 (= res!809532 (not (validKeyInArray!0 (select (arr!37988 _keys!1208) from!1455))))))

(declare-fun lt!554118 () ListLongMap!17963)

(assert (=> b!1218883 (= lt!554118 lt!554126)))

(declare-fun lt!554124 () ListLongMap!17963)

(declare-fun -!1910 (ListLongMap!17963 (_ BitVec 64)) ListLongMap!17963)

(assert (=> b!1218883 (= lt!554126 (-!1910 lt!554124 k0!934))))

(assert (=> b!1218883 (= lt!554118 (getCurrentListMapNoExtraKeys!5423 lt!554119 lt!554120 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1218883 (= lt!554124 (getCurrentListMapNoExtraKeys!5423 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!554125 () Unit!40396)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1117 (array!78713 array!78715 (_ BitVec 32) (_ BitVec 32) V!46419 V!46419 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40396)

(assert (=> b!1218883 (= lt!554125 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1117 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1218884 () Bool)

(declare-fun e!692035 () Bool)

(assert (=> b!1218884 (= e!692045 (and e!692035 mapRes!48337))))

(declare-fun condMapEmpty!48337 () Bool)

(declare-fun mapDefault!48337 () ValueCell!14775)

(assert (=> b!1218884 (= condMapEmpty!48337 (= (arr!37989 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14775)) mapDefault!48337)))))

(declare-fun mapNonEmpty!48337 () Bool)

(declare-fun tp!91826 () Bool)

(declare-fun e!692044 () Bool)

(assert (=> mapNonEmpty!48337 (= mapRes!48337 (and tp!91826 e!692044))))

(declare-fun mapValue!48337 () ValueCell!14775)

(declare-fun mapRest!48337 () (Array (_ BitVec 32) ValueCell!14775))

(declare-fun mapKey!48337 () (_ BitVec 32))

(assert (=> mapNonEmpty!48337 (= (arr!37989 _values!996) (store mapRest!48337 mapKey!48337 mapValue!48337))))

(declare-fun b!1218885 () Bool)

(declare-fun res!809519 () Bool)

(assert (=> b!1218885 (=> (not res!809519) (not e!692037))))

(assert (=> b!1218885 (= res!809519 (= (select (arr!37988 _keys!1208) i!673) k0!934))))

(declare-fun b!1218886 () Bool)

(assert (=> b!1218886 (= e!692043 e!692042)))

(declare-fun res!809523 () Bool)

(assert (=> b!1218886 (=> res!809523 e!692042)))

(assert (=> b!1218886 (= res!809523 (not (= (select (arr!37988 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1218887 () Bool)

(assert (=> b!1218887 (= e!692044 tp_is_empty!30969)))

(declare-fun b!1218888 () Bool)

(declare-fun res!809529 () Bool)

(assert (=> b!1218888 (=> (not res!809529) (not e!692037))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1218888 (= res!809529 (validMask!0 mask!1564))))

(declare-fun b!1218889 () Bool)

(assert (=> b!1218889 (= e!692035 tp_is_empty!30969)))

(assert (= (and start!101420 res!809520) b!1218888))

(assert (= (and b!1218888 res!809529) b!1218878))

(assert (= (and b!1218878 res!809521) b!1218876))

(assert (= (and b!1218876 res!809531) b!1218877))

(assert (= (and b!1218877 res!809526) b!1218881))

(assert (= (and b!1218881 res!809528) b!1218873))

(assert (= (and b!1218873 res!809518) b!1218885))

(assert (= (and b!1218885 res!809519) b!1218872))

(assert (= (and b!1218872 res!809530) b!1218880))

(assert (= (and b!1218880 res!809522) b!1218875))

(assert (= (and b!1218875 (not res!809527)) b!1218874))

(assert (= (and b!1218874 (not res!809525)) b!1218883))

(assert (= (and b!1218883 (not res!809532)) b!1218882))

(assert (= (and b!1218882 res!809524) b!1218886))

(assert (= (and b!1218886 (not res!809523)) b!1218879))

(assert (= (and b!1218884 condMapEmpty!48337) mapIsEmpty!48337))

(assert (= (and b!1218884 (not condMapEmpty!48337)) mapNonEmpty!48337))

(get-info :version)

(assert (= (and mapNonEmpty!48337 ((_ is ValueCellFull!14775) mapValue!48337)) b!1218887))

(assert (= (and b!1218884 ((_ is ValueCellFull!14775) mapDefault!48337)) b!1218889))

(assert (= start!101420 b!1218884))

(declare-fun b_lambda!22055 () Bool)

(assert (=> (not b_lambda!22055) (not b!1218874)))

(declare-fun t!40040 () Bool)

(declare-fun tb!11065 () Bool)

(assert (=> (and start!101420 (= defaultEntry!1004 defaultEntry!1004) t!40040) tb!11065))

(declare-fun result!22733 () Bool)

(assert (=> tb!11065 (= result!22733 tp_is_empty!30969)))

(assert (=> b!1218874 t!40040))

(declare-fun b_and!43703 () Bool)

(assert (= b_and!43701 (and (=> t!40040 result!22733) b_and!43703)))

(declare-fun m!1123633 () Bool)

(assert (=> b!1218876 m!1123633))

(declare-fun m!1123635 () Bool)

(assert (=> b!1218883 m!1123635))

(declare-fun m!1123637 () Bool)

(assert (=> b!1218883 m!1123637))

(declare-fun m!1123639 () Bool)

(assert (=> b!1218883 m!1123639))

(declare-fun m!1123641 () Bool)

(assert (=> b!1218883 m!1123641))

(declare-fun m!1123643 () Bool)

(assert (=> b!1218883 m!1123643))

(declare-fun m!1123645 () Bool)

(assert (=> b!1218883 m!1123645))

(assert (=> b!1218883 m!1123641))

(declare-fun m!1123647 () Bool)

(assert (=> b!1218873 m!1123647))

(declare-fun m!1123649 () Bool)

(assert (=> b!1218888 m!1123649))

(declare-fun m!1123651 () Bool)

(assert (=> mapNonEmpty!48337 m!1123651))

(declare-fun m!1123653 () Bool)

(assert (=> b!1218885 m!1123653))

(declare-fun m!1123655 () Bool)

(assert (=> start!101420 m!1123655))

(declare-fun m!1123657 () Bool)

(assert (=> start!101420 m!1123657))

(declare-fun m!1123659 () Bool)

(assert (=> b!1218880 m!1123659))

(assert (=> b!1218886 m!1123641))

(declare-fun m!1123661 () Bool)

(assert (=> b!1218874 m!1123661))

(declare-fun m!1123663 () Bool)

(assert (=> b!1218874 m!1123663))

(declare-fun m!1123665 () Bool)

(assert (=> b!1218874 m!1123665))

(declare-fun m!1123667 () Bool)

(assert (=> b!1218874 m!1123667))

(declare-fun m!1123669 () Bool)

(assert (=> b!1218877 m!1123669))

(declare-fun m!1123671 () Bool)

(assert (=> b!1218879 m!1123671))

(declare-fun m!1123673 () Bool)

(assert (=> b!1218872 m!1123673))

(declare-fun m!1123675 () Bool)

(assert (=> b!1218872 m!1123675))

(assert (=> b!1218882 m!1123641))

(declare-fun m!1123677 () Bool)

(assert (=> b!1218882 m!1123677))

(assert (=> b!1218882 m!1123677))

(declare-fun m!1123679 () Bool)

(assert (=> b!1218882 m!1123679))

(declare-fun m!1123681 () Bool)

(assert (=> b!1218882 m!1123681))

(declare-fun m!1123683 () Bool)

(assert (=> b!1218875 m!1123683))

(declare-fun m!1123685 () Bool)

(assert (=> b!1218875 m!1123685))

(check-sat (not b_next!26265) (not b!1218873) (not b!1218875) (not mapNonEmpty!48337) (not b!1218880) (not b!1218872) (not b!1218882) tp_is_empty!30969 b_and!43703 (not b_lambda!22055) (not b!1218876) (not b!1218874) (not start!101420) (not b!1218888) (not b!1218877) (not b!1218883) (not b!1218879))
(check-sat b_and!43703 (not b_next!26265))
