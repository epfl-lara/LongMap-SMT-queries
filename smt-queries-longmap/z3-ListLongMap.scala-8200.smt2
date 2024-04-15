; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100060 () Bool)

(assert start!100060)

(declare-fun b_free!25645 () Bool)

(declare-fun b_next!25645 () Bool)

(assert (=> start!100060 (= b_free!25645 (not b_next!25645))))

(declare-fun tp!89649 () Bool)

(declare-fun b_and!42135 () Bool)

(assert (=> start!100060 (= tp!89649 b_and!42135)))

(declare-fun b!1192707 () Bool)

(declare-fun res!793489 () Bool)

(declare-fun e!677904 () Bool)

(assert (=> b!1192707 (=> (not res!793489) (not e!677904))))

(declare-datatypes ((array!77068 0))(
  ( (array!77069 (arr!37184 (Array (_ BitVec 32) (_ BitVec 64))) (size!37722 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77068)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!45361 0))(
  ( (V!45362 (val!15144 Int)) )
))
(declare-datatypes ((ValueCell!14378 0))(
  ( (ValueCellFull!14378 (v!17781 V!45361)) (EmptyCell!14378) )
))
(declare-datatypes ((array!77070 0))(
  ( (array!77071 (arr!37185 (Array (_ BitVec 32) ValueCell!14378)) (size!37723 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77070)

(assert (=> b!1192707 (= res!793489 (and (= (size!37723 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37722 _keys!1208) (size!37723 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1192708 () Bool)

(declare-fun e!677902 () Bool)

(assert (=> b!1192708 (= e!677904 e!677902)))

(declare-fun res!793487 () Bool)

(assert (=> b!1192708 (=> (not res!793487) (not e!677902))))

(declare-fun lt!542176 () array!77068)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77068 (_ BitVec 32)) Bool)

(assert (=> b!1192708 (= res!793487 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!542176 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1192708 (= lt!542176 (array!77069 (store (arr!37184 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37722 _keys!1208)))))

(declare-fun mapNonEmpty!47090 () Bool)

(declare-fun mapRes!47090 () Bool)

(declare-fun tp!89648 () Bool)

(declare-fun e!677901 () Bool)

(assert (=> mapNonEmpty!47090 (= mapRes!47090 (and tp!89648 e!677901))))

(declare-fun mapKey!47090 () (_ BitVec 32))

(declare-fun mapRest!47090 () (Array (_ BitVec 32) ValueCell!14378))

(declare-fun mapValue!47090 () ValueCell!14378)

(assert (=> mapNonEmpty!47090 (= (arr!37185 _values!996) (store mapRest!47090 mapKey!47090 mapValue!47090))))

(declare-fun b!1192709 () Bool)

(declare-fun res!793486 () Bool)

(assert (=> b!1192709 (=> (not res!793486) (not e!677904))))

(declare-datatypes ((List!26295 0))(
  ( (Nil!26292) (Cons!26291 (h!27500 (_ BitVec 64)) (t!38923 List!26295)) )
))
(declare-fun arrayNoDuplicates!0 (array!77068 (_ BitVec 32) List!26295) Bool)

(assert (=> b!1192709 (= res!793486 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26292))))

(declare-fun res!793479 () Bool)

(assert (=> start!100060 (=> (not res!793479) (not e!677904))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!100060 (= res!793479 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37722 _keys!1208))))))

(assert (=> start!100060 e!677904))

(declare-fun tp_is_empty!30175 () Bool)

(assert (=> start!100060 tp_is_empty!30175))

(declare-fun array_inv!28476 (array!77068) Bool)

(assert (=> start!100060 (array_inv!28476 _keys!1208)))

(assert (=> start!100060 true))

(assert (=> start!100060 tp!89649))

(declare-fun e!677907 () Bool)

(declare-fun array_inv!28477 (array!77070) Bool)

(assert (=> start!100060 (and (array_inv!28477 _values!996) e!677907)))

(declare-fun mapIsEmpty!47090 () Bool)

(assert (=> mapIsEmpty!47090 mapRes!47090))

(declare-fun b!1192710 () Bool)

(declare-fun res!793480 () Bool)

(assert (=> b!1192710 (=> (not res!793480) (not e!677902))))

(assert (=> b!1192710 (= res!793480 (arrayNoDuplicates!0 lt!542176 #b00000000000000000000000000000000 Nil!26292))))

(declare-fun b!1192711 () Bool)

(declare-fun res!793485 () Bool)

(assert (=> b!1192711 (=> (not res!793485) (not e!677904))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1192711 (= res!793485 (validMask!0 mask!1564))))

(declare-fun b!1192712 () Bool)

(declare-fun res!793481 () Bool)

(assert (=> b!1192712 (=> (not res!793481) (not e!677904))))

(assert (=> b!1192712 (= res!793481 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37722 _keys!1208))))))

(declare-fun b!1192713 () Bool)

(declare-fun res!793482 () Bool)

(assert (=> b!1192713 (=> (not res!793482) (not e!677904))))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1192713 (= res!793482 (= (select (arr!37184 _keys!1208) i!673) k0!934))))

(declare-fun b!1192714 () Bool)

(assert (=> b!1192714 (= e!677901 tp_is_empty!30175)))

(declare-fun b!1192715 () Bool)

(declare-fun e!677903 () Bool)

(declare-fun e!677905 () Bool)

(assert (=> b!1192715 (= e!677903 e!677905)))

(declare-fun res!793483 () Bool)

(assert (=> b!1192715 (=> res!793483 e!677905)))

(assert (=> b!1192715 (= res!793483 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!45361)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!542174 () array!77070)

(declare-fun minValue!944 () V!45361)

(declare-datatypes ((tuple2!19580 0))(
  ( (tuple2!19581 (_1!9801 (_ BitVec 64)) (_2!9801 V!45361)) )
))
(declare-datatypes ((List!26296 0))(
  ( (Nil!26293) (Cons!26292 (h!27501 tuple2!19580) (t!38924 List!26296)) )
))
(declare-datatypes ((ListLongMap!17549 0))(
  ( (ListLongMap!17550 (toList!8790 List!26296)) )
))
(declare-fun lt!542175 () ListLongMap!17549)

(declare-fun getCurrentListMapNoExtraKeys!5240 (array!77068 array!77070 (_ BitVec 32) (_ BitVec 32) V!45361 V!45361 (_ BitVec 32) Int) ListLongMap!17549)

(assert (=> b!1192715 (= lt!542175 (getCurrentListMapNoExtraKeys!5240 lt!542176 lt!542174 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3125 (Int (_ BitVec 64)) V!45361)

(assert (=> b!1192715 (= lt!542174 (array!77071 (store (arr!37185 _values!996) i!673 (ValueCellFull!14378 (dynLambda!3125 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37723 _values!996)))))

(declare-fun lt!542178 () ListLongMap!17549)

(assert (=> b!1192715 (= lt!542178 (getCurrentListMapNoExtraKeys!5240 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1192716 () Bool)

(assert (=> b!1192716 (= e!677905 true)))

(declare-fun -!1731 (ListLongMap!17549 (_ BitVec 64)) ListLongMap!17549)

(assert (=> b!1192716 (= (getCurrentListMapNoExtraKeys!5240 lt!542176 lt!542174 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1731 (getCurrentListMapNoExtraKeys!5240 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-datatypes ((Unit!39447 0))(
  ( (Unit!39448) )
))
(declare-fun lt!542177 () Unit!39447)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!981 (array!77068 array!77070 (_ BitVec 32) (_ BitVec 32) V!45361 V!45361 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39447)

(assert (=> b!1192716 (= lt!542177 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!981 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1192717 () Bool)

(assert (=> b!1192717 (= e!677902 (not e!677903))))

(declare-fun res!793484 () Bool)

(assert (=> b!1192717 (=> res!793484 e!677903)))

(assert (=> b!1192717 (= res!793484 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!77068 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1192717 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!542173 () Unit!39447)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77068 (_ BitVec 64) (_ BitVec 32)) Unit!39447)

(assert (=> b!1192717 (= lt!542173 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1192718 () Bool)

(declare-fun res!793488 () Bool)

(assert (=> b!1192718 (=> (not res!793488) (not e!677904))))

(assert (=> b!1192718 (= res!793488 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1192719 () Bool)

(declare-fun res!793478 () Bool)

(assert (=> b!1192719 (=> (not res!793478) (not e!677904))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1192719 (= res!793478 (validKeyInArray!0 k0!934))))

(declare-fun b!1192720 () Bool)

(declare-fun e!677906 () Bool)

(assert (=> b!1192720 (= e!677907 (and e!677906 mapRes!47090))))

(declare-fun condMapEmpty!47090 () Bool)

(declare-fun mapDefault!47090 () ValueCell!14378)

(assert (=> b!1192720 (= condMapEmpty!47090 (= (arr!37185 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14378)) mapDefault!47090)))))

(declare-fun b!1192721 () Bool)

(assert (=> b!1192721 (= e!677906 tp_is_empty!30175)))

(assert (= (and start!100060 res!793479) b!1192711))

(assert (= (and b!1192711 res!793485) b!1192707))

(assert (= (and b!1192707 res!793489) b!1192718))

(assert (= (and b!1192718 res!793488) b!1192709))

(assert (= (and b!1192709 res!793486) b!1192712))

(assert (= (and b!1192712 res!793481) b!1192719))

(assert (= (and b!1192719 res!793478) b!1192713))

(assert (= (and b!1192713 res!793482) b!1192708))

(assert (= (and b!1192708 res!793487) b!1192710))

(assert (= (and b!1192710 res!793480) b!1192717))

(assert (= (and b!1192717 (not res!793484)) b!1192715))

(assert (= (and b!1192715 (not res!793483)) b!1192716))

(assert (= (and b!1192720 condMapEmpty!47090) mapIsEmpty!47090))

(assert (= (and b!1192720 (not condMapEmpty!47090)) mapNonEmpty!47090))

(get-info :version)

(assert (= (and mapNonEmpty!47090 ((_ is ValueCellFull!14378) mapValue!47090)) b!1192714))

(assert (= (and b!1192720 ((_ is ValueCellFull!14378) mapDefault!47090)) b!1192721))

(assert (= start!100060 b!1192720))

(declare-fun b_lambda!20771 () Bool)

(assert (=> (not b_lambda!20771) (not b!1192715)))

(declare-fun t!38922 () Bool)

(declare-fun tb!10449 () Bool)

(assert (=> (and start!100060 (= defaultEntry!1004 defaultEntry!1004) t!38922) tb!10449))

(declare-fun result!21473 () Bool)

(assert (=> tb!10449 (= result!21473 tp_is_empty!30175)))

(assert (=> b!1192715 t!38922))

(declare-fun b_and!42137 () Bool)

(assert (= b_and!42135 (and (=> t!38922 result!21473) b_and!42137)))

(declare-fun m!1100537 () Bool)

(assert (=> b!1192713 m!1100537))

(declare-fun m!1100539 () Bool)

(assert (=> b!1192718 m!1100539))

(declare-fun m!1100541 () Bool)

(assert (=> b!1192709 m!1100541))

(declare-fun m!1100543 () Bool)

(assert (=> b!1192708 m!1100543))

(declare-fun m!1100545 () Bool)

(assert (=> b!1192708 m!1100545))

(declare-fun m!1100547 () Bool)

(assert (=> b!1192717 m!1100547))

(declare-fun m!1100549 () Bool)

(assert (=> b!1192717 m!1100549))

(declare-fun m!1100551 () Bool)

(assert (=> b!1192715 m!1100551))

(declare-fun m!1100553 () Bool)

(assert (=> b!1192715 m!1100553))

(declare-fun m!1100555 () Bool)

(assert (=> b!1192715 m!1100555))

(declare-fun m!1100557 () Bool)

(assert (=> b!1192715 m!1100557))

(declare-fun m!1100559 () Bool)

(assert (=> b!1192719 m!1100559))

(declare-fun m!1100561 () Bool)

(assert (=> mapNonEmpty!47090 m!1100561))

(declare-fun m!1100563 () Bool)

(assert (=> start!100060 m!1100563))

(declare-fun m!1100565 () Bool)

(assert (=> start!100060 m!1100565))

(declare-fun m!1100567 () Bool)

(assert (=> b!1192711 m!1100567))

(declare-fun m!1100569 () Bool)

(assert (=> b!1192716 m!1100569))

(declare-fun m!1100571 () Bool)

(assert (=> b!1192716 m!1100571))

(assert (=> b!1192716 m!1100571))

(declare-fun m!1100573 () Bool)

(assert (=> b!1192716 m!1100573))

(declare-fun m!1100575 () Bool)

(assert (=> b!1192716 m!1100575))

(declare-fun m!1100577 () Bool)

(assert (=> b!1192710 m!1100577))

(check-sat (not b!1192719) (not b!1192715) (not b!1192716) (not mapNonEmpty!47090) b_and!42137 (not b_lambda!20771) (not b!1192709) (not b!1192708) (not start!100060) (not b!1192711) (not b!1192717) tp_is_empty!30175 (not b!1192718) (not b!1192710) (not b_next!25645))
(check-sat b_and!42137 (not b_next!25645))
