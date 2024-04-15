; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99964 () Bool)

(assert start!99964)

(declare-fun b_free!25549 () Bool)

(declare-fun b_next!25549 () Bool)

(assert (=> start!99964 (= b_free!25549 (not b_next!25549))))

(declare-fun tp!89361 () Bool)

(declare-fun b_and!41943 () Bool)

(assert (=> start!99964 (= tp!89361 b_and!41943)))

(declare-fun b!1190451 () Bool)

(declare-fun e!676756 () Bool)

(declare-fun e!676751 () Bool)

(declare-fun mapRes!46946 () Bool)

(assert (=> b!1190451 (= e!676756 (and e!676751 mapRes!46946))))

(declare-fun condMapEmpty!46946 () Bool)

(declare-datatypes ((V!45233 0))(
  ( (V!45234 (val!15096 Int)) )
))
(declare-datatypes ((ValueCell!14330 0))(
  ( (ValueCellFull!14330 (v!17733 V!45233)) (EmptyCell!14330) )
))
(declare-datatypes ((array!76882 0))(
  ( (array!76883 (arr!37091 (Array (_ BitVec 32) ValueCell!14330)) (size!37629 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76882)

(declare-fun mapDefault!46946 () ValueCell!14330)

(assert (=> b!1190451 (= condMapEmpty!46946 (= (arr!37091 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14330)) mapDefault!46946)))))

(declare-fun b!1190452 () Bool)

(declare-fun res!791757 () Bool)

(declare-fun e!676754 () Bool)

(assert (=> b!1190452 (=> (not res!791757) (not e!676754))))

(declare-datatypes ((array!76884 0))(
  ( (array!76885 (arr!37092 (Array (_ BitVec 32) (_ BitVec 64))) (size!37630 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76884)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1190452 (= res!791757 (= (select (arr!37092 _keys!1208) i!673) k0!934))))

(declare-fun b!1190453 () Bool)

(declare-fun e!676753 () Bool)

(declare-fun e!676749 () Bool)

(assert (=> b!1190453 (= e!676753 (not e!676749))))

(declare-fun res!791761 () Bool)

(assert (=> b!1190453 (=> res!791761 e!676749)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1190453 (= res!791761 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!76884 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1190453 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39371 0))(
  ( (Unit!39372) )
))
(declare-fun lt!541314 () Unit!39371)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76884 (_ BitVec 64) (_ BitVec 32)) Unit!39371)

(assert (=> b!1190453 (= lt!541314 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1190454 () Bool)

(declare-fun res!791754 () Bool)

(assert (=> b!1190454 (=> (not res!791754) (not e!676754))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76884 (_ BitVec 32)) Bool)

(assert (=> b!1190454 (= res!791754 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1190455 () Bool)

(declare-fun res!791758 () Bool)

(assert (=> b!1190455 (=> (not res!791758) (not e!676753))))

(declare-fun lt!541310 () array!76884)

(declare-datatypes ((List!26222 0))(
  ( (Nil!26219) (Cons!26218 (h!27427 (_ BitVec 64)) (t!38754 List!26222)) )
))
(declare-fun arrayNoDuplicates!0 (array!76884 (_ BitVec 32) List!26222) Bool)

(assert (=> b!1190455 (= res!791758 (arrayNoDuplicates!0 lt!541310 #b00000000000000000000000000000000 Nil!26219))))

(declare-fun mapNonEmpty!46946 () Bool)

(declare-fun tp!89360 () Bool)

(declare-fun e!676752 () Bool)

(assert (=> mapNonEmpty!46946 (= mapRes!46946 (and tp!89360 e!676752))))

(declare-fun mapKey!46946 () (_ BitVec 32))

(declare-fun mapRest!46946 () (Array (_ BitVec 32) ValueCell!14330))

(declare-fun mapValue!46946 () ValueCell!14330)

(assert (=> mapNonEmpty!46946 (= (arr!37091 _values!996) (store mapRest!46946 mapKey!46946 mapValue!46946))))

(declare-fun b!1190456 () Bool)

(declare-fun res!791753 () Bool)

(assert (=> b!1190456 (=> (not res!791753) (not e!676754))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1190456 (= res!791753 (validMask!0 mask!1564))))

(declare-fun b!1190457 () Bool)

(declare-fun tp_is_empty!30079 () Bool)

(assert (=> b!1190457 (= e!676752 tp_is_empty!30079)))

(declare-fun b!1190458 () Bool)

(declare-fun res!791750 () Bool)

(assert (=> b!1190458 (=> (not res!791750) (not e!676754))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1190458 (= res!791750 (and (= (size!37629 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37630 _keys!1208) (size!37629 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1190459 () Bool)

(declare-fun res!791752 () Bool)

(assert (=> b!1190459 (=> (not res!791752) (not e!676754))))

(assert (=> b!1190459 (= res!791752 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37630 _keys!1208))))))

(declare-fun b!1190460 () Bool)

(declare-fun res!791756 () Bool)

(assert (=> b!1190460 (=> (not res!791756) (not e!676754))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1190460 (= res!791756 (validKeyInArray!0 k0!934))))

(declare-fun b!1190461 () Bool)

(assert (=> b!1190461 (= e!676751 tp_is_empty!30079)))

(declare-fun res!791751 () Bool)

(assert (=> start!99964 (=> (not res!791751) (not e!676754))))

(assert (=> start!99964 (= res!791751 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37630 _keys!1208))))))

(assert (=> start!99964 e!676754))

(assert (=> start!99964 tp_is_empty!30079))

(declare-fun array_inv!28414 (array!76884) Bool)

(assert (=> start!99964 (array_inv!28414 _keys!1208)))

(assert (=> start!99964 true))

(assert (=> start!99964 tp!89361))

(declare-fun array_inv!28415 (array!76882) Bool)

(assert (=> start!99964 (and (array_inv!28415 _values!996) e!676756)))

(declare-fun b!1190462 () Bool)

(declare-fun e!676755 () Bool)

(assert (=> b!1190462 (= e!676749 e!676755)))

(declare-fun res!791755 () Bool)

(assert (=> b!1190462 (=> res!791755 e!676755)))

(assert (=> b!1190462 (= res!791755 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!45233)

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!19508 0))(
  ( (tuple2!19509 (_1!9765 (_ BitVec 64)) (_2!9765 V!45233)) )
))
(declare-datatypes ((List!26223 0))(
  ( (Nil!26220) (Cons!26219 (h!27428 tuple2!19508) (t!38755 List!26223)) )
))
(declare-datatypes ((ListLongMap!17477 0))(
  ( (ListLongMap!17478 (toList!8754 List!26223)) )
))
(declare-fun lt!541309 () ListLongMap!17477)

(declare-fun minValue!944 () V!45233)

(declare-fun lt!541313 () array!76882)

(declare-fun getCurrentListMapNoExtraKeys!5204 (array!76884 array!76882 (_ BitVec 32) (_ BitVec 32) V!45233 V!45233 (_ BitVec 32) Int) ListLongMap!17477)

(assert (=> b!1190462 (= lt!541309 (getCurrentListMapNoExtraKeys!5204 lt!541310 lt!541313 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3095 (Int (_ BitVec 64)) V!45233)

(assert (=> b!1190462 (= lt!541313 (array!76883 (store (arr!37091 _values!996) i!673 (ValueCellFull!14330 (dynLambda!3095 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37629 _values!996)))))

(declare-fun lt!541312 () ListLongMap!17477)

(assert (=> b!1190462 (= lt!541312 (getCurrentListMapNoExtraKeys!5204 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1190463 () Bool)

(assert (=> b!1190463 (= e!676755 true)))

(declare-fun -!1699 (ListLongMap!17477 (_ BitVec 64)) ListLongMap!17477)

(assert (=> b!1190463 (= (getCurrentListMapNoExtraKeys!5204 lt!541310 lt!541313 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1699 (getCurrentListMapNoExtraKeys!5204 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun lt!541311 () Unit!39371)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!949 (array!76884 array!76882 (_ BitVec 32) (_ BitVec 32) V!45233 V!45233 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39371)

(assert (=> b!1190463 (= lt!541311 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!949 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1190464 () Bool)

(declare-fun res!791760 () Bool)

(assert (=> b!1190464 (=> (not res!791760) (not e!676754))))

(assert (=> b!1190464 (= res!791760 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26219))))

(declare-fun b!1190465 () Bool)

(assert (=> b!1190465 (= e!676754 e!676753)))

(declare-fun res!791759 () Bool)

(assert (=> b!1190465 (=> (not res!791759) (not e!676753))))

(assert (=> b!1190465 (= res!791759 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!541310 mask!1564))))

(assert (=> b!1190465 (= lt!541310 (array!76885 (store (arr!37092 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37630 _keys!1208)))))

(declare-fun mapIsEmpty!46946 () Bool)

(assert (=> mapIsEmpty!46946 mapRes!46946))

(assert (= (and start!99964 res!791751) b!1190456))

(assert (= (and b!1190456 res!791753) b!1190458))

(assert (= (and b!1190458 res!791750) b!1190454))

(assert (= (and b!1190454 res!791754) b!1190464))

(assert (= (and b!1190464 res!791760) b!1190459))

(assert (= (and b!1190459 res!791752) b!1190460))

(assert (= (and b!1190460 res!791756) b!1190452))

(assert (= (and b!1190452 res!791757) b!1190465))

(assert (= (and b!1190465 res!791759) b!1190455))

(assert (= (and b!1190455 res!791758) b!1190453))

(assert (= (and b!1190453 (not res!791761)) b!1190462))

(assert (= (and b!1190462 (not res!791755)) b!1190463))

(assert (= (and b!1190451 condMapEmpty!46946) mapIsEmpty!46946))

(assert (= (and b!1190451 (not condMapEmpty!46946)) mapNonEmpty!46946))

(get-info :version)

(assert (= (and mapNonEmpty!46946 ((_ is ValueCellFull!14330) mapValue!46946)) b!1190457))

(assert (= (and b!1190451 ((_ is ValueCellFull!14330) mapDefault!46946)) b!1190461))

(assert (= start!99964 b!1190451))

(declare-fun b_lambda!20675 () Bool)

(assert (=> (not b_lambda!20675) (not b!1190462)))

(declare-fun t!38753 () Bool)

(declare-fun tb!10353 () Bool)

(assert (=> (and start!99964 (= defaultEntry!1004 defaultEntry!1004) t!38753) tb!10353))

(declare-fun result!21281 () Bool)

(assert (=> tb!10353 (= result!21281 tp_is_empty!30079)))

(assert (=> b!1190462 t!38753))

(declare-fun b_and!41945 () Bool)

(assert (= b_and!41943 (and (=> t!38753 result!21281) b_and!41945)))

(declare-fun m!1098521 () Bool)

(assert (=> b!1190460 m!1098521))

(declare-fun m!1098523 () Bool)

(assert (=> b!1190456 m!1098523))

(declare-fun m!1098525 () Bool)

(assert (=> b!1190452 m!1098525))

(declare-fun m!1098527 () Bool)

(assert (=> b!1190463 m!1098527))

(declare-fun m!1098529 () Bool)

(assert (=> b!1190463 m!1098529))

(assert (=> b!1190463 m!1098529))

(declare-fun m!1098531 () Bool)

(assert (=> b!1190463 m!1098531))

(declare-fun m!1098533 () Bool)

(assert (=> b!1190463 m!1098533))

(declare-fun m!1098535 () Bool)

(assert (=> b!1190465 m!1098535))

(declare-fun m!1098537 () Bool)

(assert (=> b!1190465 m!1098537))

(declare-fun m!1098539 () Bool)

(assert (=> b!1190455 m!1098539))

(declare-fun m!1098541 () Bool)

(assert (=> mapNonEmpty!46946 m!1098541))

(declare-fun m!1098543 () Bool)

(assert (=> b!1190453 m!1098543))

(declare-fun m!1098545 () Bool)

(assert (=> b!1190453 m!1098545))

(declare-fun m!1098547 () Bool)

(assert (=> b!1190454 m!1098547))

(declare-fun m!1098549 () Bool)

(assert (=> b!1190464 m!1098549))

(declare-fun m!1098551 () Bool)

(assert (=> b!1190462 m!1098551))

(declare-fun m!1098553 () Bool)

(assert (=> b!1190462 m!1098553))

(declare-fun m!1098555 () Bool)

(assert (=> b!1190462 m!1098555))

(declare-fun m!1098557 () Bool)

(assert (=> b!1190462 m!1098557))

(declare-fun m!1098559 () Bool)

(assert (=> start!99964 m!1098559))

(declare-fun m!1098561 () Bool)

(assert (=> start!99964 m!1098561))

(check-sat (not b!1190453) (not b_lambda!20675) (not b!1190460) (not start!99964) (not b!1190455) (not b!1190465) (not mapNonEmpty!46946) (not b!1190463) (not b!1190462) (not b!1190464) b_and!41945 (not b_next!25549) (not b!1190456) tp_is_empty!30079 (not b!1190454))
(check-sat b_and!41945 (not b_next!25549))
