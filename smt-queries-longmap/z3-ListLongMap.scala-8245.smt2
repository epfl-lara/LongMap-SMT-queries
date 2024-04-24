; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100654 () Bool)

(assert start!100654)

(declare-fun b_free!25741 () Bool)

(declare-fun b_next!25741 () Bool)

(assert (=> start!100654 (= b_free!25741 (not b_next!25741))))

(declare-fun tp!90212 () Bool)

(declare-fun b_and!42371 () Bool)

(assert (=> start!100654 (= tp!90212 b_and!42371)))

(declare-fun b!1199993 () Bool)

(declare-fun e!681728 () Bool)

(declare-fun e!681725 () Bool)

(declare-fun mapRes!47510 () Bool)

(assert (=> b!1199993 (= e!681728 (and e!681725 mapRes!47510))))

(declare-fun condMapEmpty!47510 () Bool)

(declare-datatypes ((V!45721 0))(
  ( (V!45722 (val!15279 Int)) )
))
(declare-datatypes ((ValueCell!14513 0))(
  ( (ValueCellFull!14513 (v!17913 V!45721)) (EmptyCell!14513) )
))
(declare-datatypes ((array!77705 0))(
  ( (array!77706 (arr!37491 (Array (_ BitVec 32) ValueCell!14513)) (size!38028 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77705)

(declare-fun mapDefault!47510 () ValueCell!14513)

(assert (=> b!1199993 (= condMapEmpty!47510 (= (arr!37491 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14513)) mapDefault!47510)))))

(declare-fun b!1199994 () Bool)

(declare-fun res!798321 () Bool)

(declare-fun e!681731 () Bool)

(assert (=> b!1199994 (=> (not res!798321) (not e!681731))))

(declare-datatypes ((array!77707 0))(
  ( (array!77708 (arr!37492 (Array (_ BitVec 32) (_ BitVec 64))) (size!38029 (_ BitVec 32))) )
))
(declare-fun lt!544055 () array!77707)

(declare-datatypes ((List!26388 0))(
  ( (Nil!26385) (Cons!26384 (h!27602 (_ BitVec 64)) (t!39101 List!26388)) )
))
(declare-fun arrayNoDuplicates!0 (array!77707 (_ BitVec 32) List!26388) Bool)

(assert (=> b!1199994 (= res!798321 (arrayNoDuplicates!0 lt!544055 #b00000000000000000000000000000000 Nil!26385))))

(declare-fun b!1199995 () Bool)

(declare-fun res!798312 () Bool)

(declare-fun e!681726 () Bool)

(assert (=> b!1199995 (=> (not res!798312) (not e!681726))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1199995 (= res!798312 (validMask!0 mask!1564))))

(declare-fun b!1199996 () Bool)

(declare-fun res!798316 () Bool)

(assert (=> b!1199996 (=> (not res!798316) (not e!681726))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1199996 (= res!798316 (validKeyInArray!0 k0!934))))

(declare-fun b!1199997 () Bool)

(declare-fun tp_is_empty!30445 () Bool)

(assert (=> b!1199997 (= e!681725 tp_is_empty!30445)))

(declare-fun mapIsEmpty!47510 () Bool)

(assert (=> mapIsEmpty!47510 mapRes!47510))

(declare-fun b!1199999 () Bool)

(declare-fun res!798314 () Bool)

(assert (=> b!1199999 (=> (not res!798314) (not e!681726))))

(declare-fun _keys!1208 () array!77707)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77707 (_ BitVec 32)) Bool)

(assert (=> b!1199999 (= res!798314 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun res!798318 () Bool)

(assert (=> start!100654 (=> (not res!798318) (not e!681726))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!100654 (= res!798318 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38029 _keys!1208))))))

(assert (=> start!100654 e!681726))

(assert (=> start!100654 tp_is_empty!30445))

(declare-fun array_inv!28642 (array!77707) Bool)

(assert (=> start!100654 (array_inv!28642 _keys!1208)))

(assert (=> start!100654 true))

(assert (=> start!100654 tp!90212))

(declare-fun array_inv!28643 (array!77705) Bool)

(assert (=> start!100654 (and (array_inv!28643 _values!996) e!681728)))

(declare-fun b!1199998 () Bool)

(declare-fun res!798322 () Bool)

(assert (=> b!1199998 (=> (not res!798322) (not e!681726))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1199998 (= res!798322 (and (= (size!38028 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38029 _keys!1208) (size!38028 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1200000 () Bool)

(declare-fun res!798313 () Bool)

(assert (=> b!1200000 (=> (not res!798313) (not e!681726))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1200000 (= res!798313 (= (select (arr!37492 _keys!1208) i!673) k0!934))))

(declare-fun b!1200001 () Bool)

(declare-fun e!681729 () Bool)

(assert (=> b!1200001 (= e!681729 tp_is_empty!30445)))

(declare-fun b!1200002 () Bool)

(declare-fun res!798320 () Bool)

(assert (=> b!1200002 (=> (not res!798320) (not e!681726))))

(assert (=> b!1200002 (= res!798320 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38029 _keys!1208))))))

(declare-fun b!1200003 () Bool)

(assert (=> b!1200003 (= e!681726 e!681731)))

(declare-fun res!798319 () Bool)

(assert (=> b!1200003 (=> (not res!798319) (not e!681731))))

(assert (=> b!1200003 (= res!798319 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!544055 mask!1564))))

(assert (=> b!1200003 (= lt!544055 (array!77708 (store (arr!37492 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38029 _keys!1208)))))

(declare-fun b!1200004 () Bool)

(declare-fun res!798317 () Bool)

(assert (=> b!1200004 (=> (not res!798317) (not e!681726))))

(assert (=> b!1200004 (= res!798317 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26385))))

(declare-fun b!1200005 () Bool)

(declare-fun e!681727 () Bool)

(assert (=> b!1200005 (= e!681727 true)))

(declare-fun zeroValue!944 () V!45721)

(declare-datatypes ((tuple2!19574 0))(
  ( (tuple2!19575 (_1!9798 (_ BitVec 64)) (_2!9798 V!45721)) )
))
(declare-datatypes ((List!26389 0))(
  ( (Nil!26386) (Cons!26385 (h!27603 tuple2!19574) (t!39102 List!26389)) )
))
(declare-datatypes ((ListLongMap!17551 0))(
  ( (ListLongMap!17552 (toList!8791 List!26389)) )
))
(declare-fun lt!544052 () ListLongMap!17551)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!45721)

(declare-fun getCurrentListMapNoExtraKeys!5258 (array!77707 array!77705 (_ BitVec 32) (_ BitVec 32) V!45721 V!45721 (_ BitVec 32) Int) ListLongMap!17551)

(declare-fun dynLambda!3202 (Int (_ BitVec 64)) V!45721)

(assert (=> b!1200005 (= lt!544052 (getCurrentListMapNoExtraKeys!5258 lt!544055 (array!77706 (store (arr!37491 _values!996) i!673 (ValueCellFull!14513 (dynLambda!3202 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38028 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!544054 () ListLongMap!17551)

(assert (=> b!1200005 (= lt!544054 (getCurrentListMapNoExtraKeys!5258 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun mapNonEmpty!47510 () Bool)

(declare-fun tp!90213 () Bool)

(assert (=> mapNonEmpty!47510 (= mapRes!47510 (and tp!90213 e!681729))))

(declare-fun mapValue!47510 () ValueCell!14513)

(declare-fun mapRest!47510 () (Array (_ BitVec 32) ValueCell!14513))

(declare-fun mapKey!47510 () (_ BitVec 32))

(assert (=> mapNonEmpty!47510 (= (arr!37491 _values!996) (store mapRest!47510 mapKey!47510 mapValue!47510))))

(declare-fun b!1200006 () Bool)

(assert (=> b!1200006 (= e!681731 (not e!681727))))

(declare-fun res!798315 () Bool)

(assert (=> b!1200006 (=> res!798315 e!681727)))

(assert (=> b!1200006 (= res!798315 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!77707 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1200006 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39707 0))(
  ( (Unit!39708) )
))
(declare-fun lt!544053 () Unit!39707)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77707 (_ BitVec 64) (_ BitVec 32)) Unit!39707)

(assert (=> b!1200006 (= lt!544053 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(assert (= (and start!100654 res!798318) b!1199995))

(assert (= (and b!1199995 res!798312) b!1199998))

(assert (= (and b!1199998 res!798322) b!1199999))

(assert (= (and b!1199999 res!798314) b!1200004))

(assert (= (and b!1200004 res!798317) b!1200002))

(assert (= (and b!1200002 res!798320) b!1199996))

(assert (= (and b!1199996 res!798316) b!1200000))

(assert (= (and b!1200000 res!798313) b!1200003))

(assert (= (and b!1200003 res!798319) b!1199994))

(assert (= (and b!1199994 res!798321) b!1200006))

(assert (= (and b!1200006 (not res!798315)) b!1200005))

(assert (= (and b!1199993 condMapEmpty!47510) mapIsEmpty!47510))

(assert (= (and b!1199993 (not condMapEmpty!47510)) mapNonEmpty!47510))

(get-info :version)

(assert (= (and mapNonEmpty!47510 ((_ is ValueCellFull!14513) mapValue!47510)) b!1200001))

(assert (= (and b!1199993 ((_ is ValueCellFull!14513) mapDefault!47510)) b!1199997))

(assert (= start!100654 b!1199993))

(declare-fun b_lambda!20931 () Bool)

(assert (=> (not b_lambda!20931) (not b!1200005)))

(declare-fun t!39100 () Bool)

(declare-fun tb!10533 () Bool)

(assert (=> (and start!100654 (= defaultEntry!1004 defaultEntry!1004) t!39100) tb!10533))

(declare-fun result!21651 () Bool)

(assert (=> tb!10533 (= result!21651 tp_is_empty!30445)))

(assert (=> b!1200005 t!39100))

(declare-fun b_and!42373 () Bool)

(assert (= b_and!42371 (and (=> t!39100 result!21651) b_and!42373)))

(declare-fun m!1106981 () Bool)

(assert (=> b!1200004 m!1106981))

(declare-fun m!1106983 () Bool)

(assert (=> b!1199994 m!1106983))

(declare-fun m!1106985 () Bool)

(assert (=> b!1199995 m!1106985))

(declare-fun m!1106987 () Bool)

(assert (=> b!1200006 m!1106987))

(declare-fun m!1106989 () Bool)

(assert (=> b!1200006 m!1106989))

(declare-fun m!1106991 () Bool)

(assert (=> b!1200005 m!1106991))

(declare-fun m!1106993 () Bool)

(assert (=> b!1200005 m!1106993))

(declare-fun m!1106995 () Bool)

(assert (=> b!1200005 m!1106995))

(declare-fun m!1106997 () Bool)

(assert (=> b!1200005 m!1106997))

(declare-fun m!1106999 () Bool)

(assert (=> b!1199996 m!1106999))

(declare-fun m!1107001 () Bool)

(assert (=> start!100654 m!1107001))

(declare-fun m!1107003 () Bool)

(assert (=> start!100654 m!1107003))

(declare-fun m!1107005 () Bool)

(assert (=> b!1199999 m!1107005))

(declare-fun m!1107007 () Bool)

(assert (=> b!1200000 m!1107007))

(declare-fun m!1107009 () Bool)

(assert (=> mapNonEmpty!47510 m!1107009))

(declare-fun m!1107011 () Bool)

(assert (=> b!1200003 m!1107011))

(declare-fun m!1107013 () Bool)

(assert (=> b!1200003 m!1107013))

(check-sat (not b!1200005) (not b!1200003) (not b_lambda!20931) tp_is_empty!30445 (not start!100654) (not b!1200004) b_and!42373 (not b!1199999) (not mapNonEmpty!47510) (not b!1199994) (not b!1200006) (not b_next!25741) (not b!1199996) (not b!1199995))
(check-sat b_and!42373 (not b_next!25741))
