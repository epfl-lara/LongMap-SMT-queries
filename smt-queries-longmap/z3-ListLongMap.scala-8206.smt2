; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100338 () Bool)

(assert start!100338)

(declare-fun b_free!25675 () Bool)

(declare-fun b_next!25675 () Bool)

(assert (=> start!100338 (= b_free!25675 (not b_next!25675))))

(declare-fun tp!89748 () Bool)

(declare-fun b_and!42219 () Bool)

(assert (=> start!100338 (= tp!89748 b_and!42219)))

(declare-fun b!1194958 () Bool)

(declare-fun res!794681 () Bool)

(declare-fun e!679234 () Bool)

(assert (=> b!1194958 (=> (not res!794681) (not e!679234))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1194958 (= res!794681 (validKeyInArray!0 k0!934))))

(declare-fun b!1194959 () Bool)

(declare-fun e!679233 () Bool)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1194959 (= e!679233 (or (= from!1455 i!673) (bvslt from!1455 i!673)))))

(declare-datatypes ((V!45409 0))(
  ( (V!45410 (val!15162 Int)) )
))
(declare-fun zeroValue!944 () V!45409)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!14396 0))(
  ( (ValueCellFull!14396 (v!17796 V!45409)) (EmptyCell!14396) )
))
(declare-datatypes ((array!77243 0))(
  ( (array!77244 (arr!37265 (Array (_ BitVec 32) ValueCell!14396)) (size!37802 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77243)

(declare-datatypes ((array!77245 0))(
  ( (array!77246 (arr!37266 (Array (_ BitVec 32) (_ BitVec 64))) (size!37803 (_ BitVec 32))) )
))
(declare-fun lt!543136 () array!77245)

(declare-fun minValue!944 () V!45409)

(declare-datatypes ((tuple2!19530 0))(
  ( (tuple2!19531 (_1!9776 (_ BitVec 64)) (_2!9776 V!45409)) )
))
(declare-datatypes ((List!26271 0))(
  ( (Nil!26268) (Cons!26267 (h!27485 tuple2!19530) (t!38930 List!26271)) )
))
(declare-datatypes ((ListLongMap!17507 0))(
  ( (ListLongMap!17508 (toList!8769 List!26271)) )
))
(declare-fun lt!543133 () ListLongMap!17507)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!5236 (array!77245 array!77243 (_ BitVec 32) (_ BitVec 32) V!45409 V!45409 (_ BitVec 32) Int) ListLongMap!17507)

(declare-fun dynLambda!3184 (Int (_ BitVec 64)) V!45409)

(assert (=> b!1194959 (= lt!543133 (getCurrentListMapNoExtraKeys!5236 lt!543136 (array!77244 (store (arr!37265 _values!996) i!673 (ValueCellFull!14396 (dynLambda!3184 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37802 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun _keys!1208 () array!77245)

(declare-fun lt!543134 () ListLongMap!17507)

(assert (=> b!1194959 (= lt!543134 (getCurrentListMapNoExtraKeys!5236 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1194960 () Bool)

(declare-fun e!679232 () Bool)

(declare-fun e!679237 () Bool)

(declare-fun mapRes!47144 () Bool)

(assert (=> b!1194960 (= e!679232 (and e!679237 mapRes!47144))))

(declare-fun condMapEmpty!47144 () Bool)

(declare-fun mapDefault!47144 () ValueCell!14396)

(assert (=> b!1194960 (= condMapEmpty!47144 (= (arr!37265 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14396)) mapDefault!47144)))))

(declare-fun b!1194961 () Bool)

(declare-fun res!794688 () Bool)

(assert (=> b!1194961 (=> (not res!794688) (not e!679234))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1194961 (= res!794688 (validMask!0 mask!1564))))

(declare-fun res!794682 () Bool)

(assert (=> start!100338 (=> (not res!794682) (not e!679234))))

(assert (=> start!100338 (= res!794682 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37803 _keys!1208))))))

(assert (=> start!100338 e!679234))

(declare-fun tp_is_empty!30211 () Bool)

(assert (=> start!100338 tp_is_empty!30211))

(declare-fun array_inv!28476 (array!77245) Bool)

(assert (=> start!100338 (array_inv!28476 _keys!1208)))

(assert (=> start!100338 true))

(assert (=> start!100338 tp!89748))

(declare-fun array_inv!28477 (array!77243) Bool)

(assert (=> start!100338 (and (array_inv!28477 _values!996) e!679232)))

(declare-fun mapNonEmpty!47144 () Bool)

(declare-fun tp!89747 () Bool)

(declare-fun e!679236 () Bool)

(assert (=> mapNonEmpty!47144 (= mapRes!47144 (and tp!89747 e!679236))))

(declare-fun mapRest!47144 () (Array (_ BitVec 32) ValueCell!14396))

(declare-fun mapValue!47144 () ValueCell!14396)

(declare-fun mapKey!47144 () (_ BitVec 32))

(assert (=> mapNonEmpty!47144 (= (arr!37265 _values!996) (store mapRest!47144 mapKey!47144 mapValue!47144))))

(declare-fun b!1194962 () Bool)

(assert (=> b!1194962 (= e!679237 tp_is_empty!30211)))

(declare-fun b!1194963 () Bool)

(declare-fun res!794680 () Bool)

(assert (=> b!1194963 (=> (not res!794680) (not e!679234))))

(assert (=> b!1194963 (= res!794680 (and (= (size!37802 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37803 _keys!1208) (size!37802 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1194964 () Bool)

(declare-fun res!794689 () Bool)

(declare-fun e!679235 () Bool)

(assert (=> b!1194964 (=> (not res!794689) (not e!679235))))

(declare-datatypes ((List!26272 0))(
  ( (Nil!26269) (Cons!26268 (h!27486 (_ BitVec 64)) (t!38931 List!26272)) )
))
(declare-fun arrayNoDuplicates!0 (array!77245 (_ BitVec 32) List!26272) Bool)

(assert (=> b!1194964 (= res!794689 (arrayNoDuplicates!0 lt!543136 #b00000000000000000000000000000000 Nil!26269))))

(declare-fun b!1194965 () Bool)

(declare-fun res!794684 () Bool)

(assert (=> b!1194965 (=> (not res!794684) (not e!679234))))

(assert (=> b!1194965 (= res!794684 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26269))))

(declare-fun b!1194966 () Bool)

(assert (=> b!1194966 (= e!679235 (not e!679233))))

(declare-fun res!794686 () Bool)

(assert (=> b!1194966 (=> res!794686 e!679233)))

(assert (=> b!1194966 (= res!794686 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!77245 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1194966 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39575 0))(
  ( (Unit!39576) )
))
(declare-fun lt!543135 () Unit!39575)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77245 (_ BitVec 64) (_ BitVec 32)) Unit!39575)

(assert (=> b!1194966 (= lt!543135 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1194967 () Bool)

(declare-fun res!794687 () Bool)

(assert (=> b!1194967 (=> (not res!794687) (not e!679234))))

(assert (=> b!1194967 (= res!794687 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37803 _keys!1208))))))

(declare-fun b!1194968 () Bool)

(assert (=> b!1194968 (= e!679236 tp_is_empty!30211)))

(declare-fun b!1194969 () Bool)

(assert (=> b!1194969 (= e!679234 e!679235)))

(declare-fun res!794690 () Bool)

(assert (=> b!1194969 (=> (not res!794690) (not e!679235))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77245 (_ BitVec 32)) Bool)

(assert (=> b!1194969 (= res!794690 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!543136 mask!1564))))

(assert (=> b!1194969 (= lt!543136 (array!77246 (store (arr!37266 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37803 _keys!1208)))))

(declare-fun b!1194970 () Bool)

(declare-fun res!794685 () Bool)

(assert (=> b!1194970 (=> (not res!794685) (not e!679234))))

(assert (=> b!1194970 (= res!794685 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1194971 () Bool)

(declare-fun res!794683 () Bool)

(assert (=> b!1194971 (=> (not res!794683) (not e!679234))))

(assert (=> b!1194971 (= res!794683 (= (select (arr!37266 _keys!1208) i!673) k0!934))))

(declare-fun mapIsEmpty!47144 () Bool)

(assert (=> mapIsEmpty!47144 mapRes!47144))

(assert (= (and start!100338 res!794682) b!1194961))

(assert (= (and b!1194961 res!794688) b!1194963))

(assert (= (and b!1194963 res!794680) b!1194970))

(assert (= (and b!1194970 res!794685) b!1194965))

(assert (= (and b!1194965 res!794684) b!1194967))

(assert (= (and b!1194967 res!794687) b!1194958))

(assert (= (and b!1194958 res!794681) b!1194971))

(assert (= (and b!1194971 res!794683) b!1194969))

(assert (= (and b!1194969 res!794690) b!1194964))

(assert (= (and b!1194964 res!794689) b!1194966))

(assert (= (and b!1194966 (not res!794686)) b!1194959))

(assert (= (and b!1194960 condMapEmpty!47144) mapIsEmpty!47144))

(assert (= (and b!1194960 (not condMapEmpty!47144)) mapNonEmpty!47144))

(get-info :version)

(assert (= (and mapNonEmpty!47144 ((_ is ValueCellFull!14396) mapValue!47144)) b!1194968))

(assert (= (and b!1194960 ((_ is ValueCellFull!14396) mapDefault!47144)) b!1194962))

(assert (= start!100338 b!1194960))

(declare-fun b_lambda!20813 () Bool)

(assert (=> (not b_lambda!20813) (not b!1194959)))

(declare-fun t!38929 () Bool)

(declare-fun tb!10479 () Bool)

(assert (=> (and start!100338 (= defaultEntry!1004 defaultEntry!1004) t!38929) tb!10479))

(declare-fun result!21533 () Bool)

(assert (=> tb!10479 (= result!21533 tp_is_empty!30211)))

(assert (=> b!1194959 t!38929))

(declare-fun b_and!42221 () Bool)

(assert (= b_and!42219 (and (=> t!38929 result!21533) b_and!42221)))

(declare-fun m!1103433 () Bool)

(assert (=> b!1194959 m!1103433))

(declare-fun m!1103435 () Bool)

(assert (=> b!1194959 m!1103435))

(declare-fun m!1103437 () Bool)

(assert (=> b!1194959 m!1103437))

(declare-fun m!1103439 () Bool)

(assert (=> b!1194959 m!1103439))

(declare-fun m!1103441 () Bool)

(assert (=> b!1194965 m!1103441))

(declare-fun m!1103443 () Bool)

(assert (=> b!1194964 m!1103443))

(declare-fun m!1103445 () Bool)

(assert (=> mapNonEmpty!47144 m!1103445))

(declare-fun m!1103447 () Bool)

(assert (=> b!1194970 m!1103447))

(declare-fun m!1103449 () Bool)

(assert (=> start!100338 m!1103449))

(declare-fun m!1103451 () Bool)

(assert (=> start!100338 m!1103451))

(declare-fun m!1103453 () Bool)

(assert (=> b!1194971 m!1103453))

(declare-fun m!1103455 () Bool)

(assert (=> b!1194961 m!1103455))

(declare-fun m!1103457 () Bool)

(assert (=> b!1194969 m!1103457))

(declare-fun m!1103459 () Bool)

(assert (=> b!1194969 m!1103459))

(declare-fun m!1103461 () Bool)

(assert (=> b!1194966 m!1103461))

(declare-fun m!1103463 () Bool)

(assert (=> b!1194966 m!1103463))

(declare-fun m!1103465 () Bool)

(assert (=> b!1194958 m!1103465))

(check-sat (not b_next!25675) (not b!1194959) (not b!1194966) (not b!1194964) tp_is_empty!30211 (not b!1194970) b_and!42221 (not b_lambda!20813) (not b!1194958) (not b!1194961) (not b!1194969) (not start!100338) (not mapNonEmpty!47144) (not b!1194965))
(check-sat b_and!42221 (not b_next!25675))
