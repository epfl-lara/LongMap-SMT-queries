; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99142 () Bool)

(assert start!99142)

(declare-fun b_free!24747 () Bool)

(declare-fun b_next!24747 () Bool)

(assert (=> start!99142 (= b_free!24747 (not b_next!24747))))

(declare-fun tp!86951 () Bool)

(declare-fun b_and!40343 () Bool)

(assert (=> start!99142 (= tp!86951 b_and!40343)))

(declare-fun b!1166608 () Bool)

(declare-fun res!773823 () Bool)

(declare-fun e!663123 () Bool)

(assert (=> b!1166608 (=> (not res!773823) (not e!663123))))

(declare-datatypes ((array!75385 0))(
  ( (array!75386 (arr!36343 (Array (_ BitVec 32) (_ BitVec 64))) (size!36879 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75385)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75385 (_ BitVec 32)) Bool)

(assert (=> b!1166608 (= res!773823 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1166609 () Bool)

(declare-fun res!773821 () Bool)

(assert (=> b!1166609 (=> (not res!773821) (not e!663123))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1166609 (= res!773821 (validKeyInArray!0 k0!934))))

(declare-fun mapIsEmpty!45740 () Bool)

(declare-fun mapRes!45740 () Bool)

(assert (=> mapIsEmpty!45740 mapRes!45740))

(declare-fun mapNonEmpty!45740 () Bool)

(declare-fun tp!86952 () Bool)

(declare-fun e!663125 () Bool)

(assert (=> mapNonEmpty!45740 (= mapRes!45740 (and tp!86952 e!663125))))

(declare-datatypes ((V!44163 0))(
  ( (V!44164 (val!14695 Int)) )
))
(declare-datatypes ((ValueCell!13929 0))(
  ( (ValueCellFull!13929 (v!17332 V!44163)) (EmptyCell!13929) )
))
(declare-fun mapValue!45740 () ValueCell!13929)

(declare-fun mapRest!45740 () (Array (_ BitVec 32) ValueCell!13929))

(declare-fun mapKey!45740 () (_ BitVec 32))

(declare-datatypes ((array!75387 0))(
  ( (array!75388 (arr!36344 (Array (_ BitVec 32) ValueCell!13929)) (size!36880 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75387)

(assert (=> mapNonEmpty!45740 (= (arr!36344 _values!996) (store mapRest!45740 mapKey!45740 mapValue!45740))))

(declare-fun b!1166610 () Bool)

(declare-fun e!663127 () Bool)

(assert (=> b!1166610 (= e!663123 e!663127)))

(declare-fun res!773828 () Bool)

(assert (=> b!1166610 (=> (not res!773828) (not e!663127))))

(declare-fun lt!525316 () array!75385)

(assert (=> b!1166610 (= res!773828 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!525316 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1166610 (= lt!525316 (array!75386 (store (arr!36343 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36879 _keys!1208)))))

(declare-fun b!1166611 () Bool)

(declare-fun res!773831 () Bool)

(assert (=> b!1166611 (=> (not res!773831) (not e!663127))))

(declare-datatypes ((List!25481 0))(
  ( (Nil!25478) (Cons!25477 (h!26686 (_ BitVec 64)) (t!37220 List!25481)) )
))
(declare-fun arrayNoDuplicates!0 (array!75385 (_ BitVec 32) List!25481) Bool)

(assert (=> b!1166611 (= res!773831 (arrayNoDuplicates!0 lt!525316 #b00000000000000000000000000000000 Nil!25478))))

(declare-fun res!773825 () Bool)

(assert (=> start!99142 (=> (not res!773825) (not e!663123))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!99142 (= res!773825 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36879 _keys!1208))))))

(assert (=> start!99142 e!663123))

(declare-fun tp_is_empty!29277 () Bool)

(assert (=> start!99142 tp_is_empty!29277))

(declare-fun array_inv!27792 (array!75385) Bool)

(assert (=> start!99142 (array_inv!27792 _keys!1208)))

(assert (=> start!99142 true))

(assert (=> start!99142 tp!86951))

(declare-fun e!663128 () Bool)

(declare-fun array_inv!27793 (array!75387) Bool)

(assert (=> start!99142 (and (array_inv!27793 _values!996) e!663128)))

(declare-fun b!1166612 () Bool)

(declare-fun res!773820 () Bool)

(assert (=> b!1166612 (=> (not res!773820) (not e!663123))))

(assert (=> b!1166612 (= res!773820 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36879 _keys!1208))))))

(declare-fun b!1166613 () Bool)

(declare-fun res!773827 () Bool)

(assert (=> b!1166613 (=> (not res!773827) (not e!663123))))

(assert (=> b!1166613 (= res!773827 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25478))))

(declare-fun b!1166614 () Bool)

(declare-fun res!773822 () Bool)

(assert (=> b!1166614 (=> (not res!773822) (not e!663123))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1166614 (= res!773822 (validMask!0 mask!1564))))

(declare-fun b!1166615 () Bool)

(declare-fun e!663124 () Bool)

(assert (=> b!1166615 (= e!663127 (not e!663124))))

(declare-fun res!773830 () Bool)

(assert (=> b!1166615 (=> res!773830 e!663124)))

(assert (=> b!1166615 (= res!773830 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!75385 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1166615 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!38494 0))(
  ( (Unit!38495) )
))
(declare-fun lt!525320 () Unit!38494)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75385 (_ BitVec 64) (_ BitVec 32)) Unit!38494)

(assert (=> b!1166615 (= lt!525320 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1166616 () Bool)

(declare-fun e!663122 () Bool)

(assert (=> b!1166616 (= e!663124 e!663122)))

(declare-fun res!773826 () Bool)

(assert (=> b!1166616 (=> res!773826 e!663122)))

(assert (=> b!1166616 (= res!773826 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!44163)

(declare-datatypes ((tuple2!18740 0))(
  ( (tuple2!18741 (_1!9381 (_ BitVec 64)) (_2!9381 V!44163)) )
))
(declare-datatypes ((List!25482 0))(
  ( (Nil!25479) (Cons!25478 (h!26687 tuple2!18740) (t!37221 List!25482)) )
))
(declare-datatypes ((ListLongMap!16709 0))(
  ( (ListLongMap!16710 (toList!8370 List!25482)) )
))
(declare-fun lt!525321 () ListLongMap!16709)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!44163)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!525317 () array!75387)

(declare-fun getCurrentListMapNoExtraKeys!4834 (array!75385 array!75387 (_ BitVec 32) (_ BitVec 32) V!44163 V!44163 (_ BitVec 32) Int) ListLongMap!16709)

(assert (=> b!1166616 (= lt!525321 (getCurrentListMapNoExtraKeys!4834 lt!525316 lt!525317 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2823 (Int (_ BitVec 64)) V!44163)

(assert (=> b!1166616 (= lt!525317 (array!75388 (store (arr!36344 _values!996) i!673 (ValueCellFull!13929 (dynLambda!2823 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36880 _values!996)))))

(declare-fun lt!525318 () ListLongMap!16709)

(assert (=> b!1166616 (= lt!525318 (getCurrentListMapNoExtraKeys!4834 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1166617 () Bool)

(assert (=> b!1166617 (= e!663122 true)))

(declare-fun -!1447 (ListLongMap!16709 (_ BitVec 64)) ListLongMap!16709)

(assert (=> b!1166617 (= (getCurrentListMapNoExtraKeys!4834 lt!525316 lt!525317 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1447 (getCurrentListMapNoExtraKeys!4834 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun lt!525319 () Unit!38494)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!674 (array!75385 array!75387 (_ BitVec 32) (_ BitVec 32) V!44163 V!44163 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38494)

(assert (=> b!1166617 (= lt!525319 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!674 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1166618 () Bool)

(declare-fun e!663126 () Bool)

(assert (=> b!1166618 (= e!663128 (and e!663126 mapRes!45740))))

(declare-fun condMapEmpty!45740 () Bool)

(declare-fun mapDefault!45740 () ValueCell!13929)

(assert (=> b!1166618 (= condMapEmpty!45740 (= (arr!36344 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13929)) mapDefault!45740)))))

(declare-fun b!1166619 () Bool)

(assert (=> b!1166619 (= e!663125 tp_is_empty!29277)))

(declare-fun b!1166620 () Bool)

(assert (=> b!1166620 (= e!663126 tp_is_empty!29277)))

(declare-fun b!1166621 () Bool)

(declare-fun res!773829 () Bool)

(assert (=> b!1166621 (=> (not res!773829) (not e!663123))))

(assert (=> b!1166621 (= res!773829 (and (= (size!36880 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36879 _keys!1208) (size!36880 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1166622 () Bool)

(declare-fun res!773824 () Bool)

(assert (=> b!1166622 (=> (not res!773824) (not e!663123))))

(assert (=> b!1166622 (= res!773824 (= (select (arr!36343 _keys!1208) i!673) k0!934))))

(assert (= (and start!99142 res!773825) b!1166614))

(assert (= (and b!1166614 res!773822) b!1166621))

(assert (= (and b!1166621 res!773829) b!1166608))

(assert (= (and b!1166608 res!773823) b!1166613))

(assert (= (and b!1166613 res!773827) b!1166612))

(assert (= (and b!1166612 res!773820) b!1166609))

(assert (= (and b!1166609 res!773821) b!1166622))

(assert (= (and b!1166622 res!773824) b!1166610))

(assert (= (and b!1166610 res!773828) b!1166611))

(assert (= (and b!1166611 res!773831) b!1166615))

(assert (= (and b!1166615 (not res!773830)) b!1166616))

(assert (= (and b!1166616 (not res!773826)) b!1166617))

(assert (= (and b!1166618 condMapEmpty!45740) mapIsEmpty!45740))

(assert (= (and b!1166618 (not condMapEmpty!45740)) mapNonEmpty!45740))

(get-info :version)

(assert (= (and mapNonEmpty!45740 ((_ is ValueCellFull!13929) mapValue!45740)) b!1166619))

(assert (= (and b!1166618 ((_ is ValueCellFull!13929) mapDefault!45740)) b!1166620))

(assert (= start!99142 b!1166618))

(declare-fun b_lambda!19853 () Bool)

(assert (=> (not b_lambda!19853) (not b!1166616)))

(declare-fun t!37219 () Bool)

(declare-fun tb!9559 () Bool)

(assert (=> (and start!99142 (= defaultEntry!1004 defaultEntry!1004) t!37219) tb!9559))

(declare-fun result!19683 () Bool)

(assert (=> tb!9559 (= result!19683 tp_is_empty!29277)))

(assert (=> b!1166616 t!37219))

(declare-fun b_and!40345 () Bool)

(assert (= b_and!40343 (and (=> t!37219 result!19683) b_and!40345)))

(declare-fun m!1074629 () Bool)

(assert (=> b!1166615 m!1074629))

(declare-fun m!1074631 () Bool)

(assert (=> b!1166615 m!1074631))

(declare-fun m!1074633 () Bool)

(assert (=> mapNonEmpty!45740 m!1074633))

(declare-fun m!1074635 () Bool)

(assert (=> start!99142 m!1074635))

(declare-fun m!1074637 () Bool)

(assert (=> start!99142 m!1074637))

(declare-fun m!1074639 () Bool)

(assert (=> b!1166610 m!1074639))

(declare-fun m!1074641 () Bool)

(assert (=> b!1166610 m!1074641))

(declare-fun m!1074643 () Bool)

(assert (=> b!1166611 m!1074643))

(declare-fun m!1074645 () Bool)

(assert (=> b!1166616 m!1074645))

(declare-fun m!1074647 () Bool)

(assert (=> b!1166616 m!1074647))

(declare-fun m!1074649 () Bool)

(assert (=> b!1166616 m!1074649))

(declare-fun m!1074651 () Bool)

(assert (=> b!1166616 m!1074651))

(declare-fun m!1074653 () Bool)

(assert (=> b!1166614 m!1074653))

(declare-fun m!1074655 () Bool)

(assert (=> b!1166608 m!1074655))

(declare-fun m!1074657 () Bool)

(assert (=> b!1166622 m!1074657))

(declare-fun m!1074659 () Bool)

(assert (=> b!1166609 m!1074659))

(declare-fun m!1074661 () Bool)

(assert (=> b!1166613 m!1074661))

(declare-fun m!1074663 () Bool)

(assert (=> b!1166617 m!1074663))

(declare-fun m!1074665 () Bool)

(assert (=> b!1166617 m!1074665))

(assert (=> b!1166617 m!1074665))

(declare-fun m!1074667 () Bool)

(assert (=> b!1166617 m!1074667))

(declare-fun m!1074669 () Bool)

(assert (=> b!1166617 m!1074669))

(check-sat (not b!1166610) (not b!1166611) b_and!40345 (not mapNonEmpty!45740) (not b!1166616) (not b!1166617) (not start!99142) (not b!1166614) (not b!1166608) (not b_lambda!19853) tp_is_empty!29277 (not b_next!24747) (not b!1166609) (not b!1166615) (not b!1166613))
(check-sat b_and!40345 (not b_next!24747))
