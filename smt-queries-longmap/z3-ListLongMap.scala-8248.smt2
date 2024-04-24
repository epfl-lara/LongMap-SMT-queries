; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100672 () Bool)

(assert start!100672)

(declare-fun b_free!25759 () Bool)

(declare-fun b_next!25759 () Bool)

(assert (=> start!100672 (= b_free!25759 (not b_next!25759))))

(declare-fun tp!90266 () Bool)

(declare-fun b_and!42407 () Bool)

(assert (=> start!100672 (= tp!90266 b_and!42407)))

(declare-fun b!1200389 () Bool)

(declare-fun e!681916 () Bool)

(declare-fun e!681918 () Bool)

(assert (=> b!1200389 (= e!681916 (not e!681918))))

(declare-fun res!798609 () Bool)

(assert (=> b!1200389 (=> res!798609 e!681918)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1200389 (= res!798609 (bvsgt from!1455 i!673))))

(declare-datatypes ((array!77741 0))(
  ( (array!77742 (arr!37509 (Array (_ BitVec 32) (_ BitVec 64))) (size!38046 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77741)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!77741 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1200389 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39719 0))(
  ( (Unit!39720) )
))
(declare-fun lt!544163 () Unit!39719)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77741 (_ BitVec 64) (_ BitVec 32)) Unit!39719)

(assert (=> b!1200389 (= lt!544163 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1200390 () Bool)

(assert (=> b!1200390 (= e!681918 true)))

(declare-datatypes ((V!45745 0))(
  ( (V!45746 (val!15288 Int)) )
))
(declare-fun zeroValue!944 () V!45745)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!14522 0))(
  ( (ValueCellFull!14522 (v!17922 V!45745)) (EmptyCell!14522) )
))
(declare-datatypes ((array!77743 0))(
  ( (array!77744 (arr!37510 (Array (_ BitVec 32) ValueCell!14522)) (size!38047 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77743)

(declare-fun minValue!944 () V!45745)

(declare-datatypes ((tuple2!19584 0))(
  ( (tuple2!19585 (_1!9803 (_ BitVec 64)) (_2!9803 V!45745)) )
))
(declare-datatypes ((List!26400 0))(
  ( (Nil!26397) (Cons!26396 (h!27614 tuple2!19584) (t!39131 List!26400)) )
))
(declare-datatypes ((ListLongMap!17561 0))(
  ( (ListLongMap!17562 (toList!8796 List!26400)) )
))
(declare-fun lt!544160 () ListLongMap!17561)

(declare-fun lt!544161 () array!77741)

(declare-fun getCurrentListMapNoExtraKeys!5263 (array!77741 array!77743 (_ BitVec 32) (_ BitVec 32) V!45745 V!45745 (_ BitVec 32) Int) ListLongMap!17561)

(declare-fun dynLambda!3207 (Int (_ BitVec 64)) V!45745)

(assert (=> b!1200390 (= lt!544160 (getCurrentListMapNoExtraKeys!5263 lt!544161 (array!77744 (store (arr!37510 _values!996) i!673 (ValueCellFull!14522 (dynLambda!3207 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38047 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!544162 () ListLongMap!17561)

(assert (=> b!1200390 (= lt!544162 (getCurrentListMapNoExtraKeys!5263 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun mapIsEmpty!47537 () Bool)

(declare-fun mapRes!47537 () Bool)

(assert (=> mapIsEmpty!47537 mapRes!47537))

(declare-fun b!1200391 () Bool)

(declare-fun res!798613 () Bool)

(declare-fun e!681917 () Bool)

(assert (=> b!1200391 (=> (not res!798613) (not e!681917))))

(declare-datatypes ((List!26401 0))(
  ( (Nil!26398) (Cons!26397 (h!27615 (_ BitVec 64)) (t!39132 List!26401)) )
))
(declare-fun arrayNoDuplicates!0 (array!77741 (_ BitVec 32) List!26401) Bool)

(assert (=> b!1200391 (= res!798613 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26398))))

(declare-fun b!1200392 () Bool)

(declare-fun e!681919 () Bool)

(declare-fun e!681914 () Bool)

(assert (=> b!1200392 (= e!681919 (and e!681914 mapRes!47537))))

(declare-fun condMapEmpty!47537 () Bool)

(declare-fun mapDefault!47537 () ValueCell!14522)

(assert (=> b!1200392 (= condMapEmpty!47537 (= (arr!37510 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14522)) mapDefault!47537)))))

(declare-fun b!1200393 () Bool)

(declare-fun tp_is_empty!30463 () Bool)

(assert (=> b!1200393 (= e!681914 tp_is_empty!30463)))

(declare-fun b!1200394 () Bool)

(declare-fun res!798610 () Bool)

(assert (=> b!1200394 (=> (not res!798610) (not e!681917))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77741 (_ BitVec 32)) Bool)

(assert (=> b!1200394 (= res!798610 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1200395 () Bool)

(assert (=> b!1200395 (= e!681917 e!681916)))

(declare-fun res!798614 () Bool)

(assert (=> b!1200395 (=> (not res!798614) (not e!681916))))

(assert (=> b!1200395 (= res!798614 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!544161 mask!1564))))

(assert (=> b!1200395 (= lt!544161 (array!77742 (store (arr!37509 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38046 _keys!1208)))))

(declare-fun res!798611 () Bool)

(assert (=> start!100672 (=> (not res!798611) (not e!681917))))

(assert (=> start!100672 (= res!798611 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38046 _keys!1208))))))

(assert (=> start!100672 e!681917))

(assert (=> start!100672 tp_is_empty!30463))

(declare-fun array_inv!28656 (array!77741) Bool)

(assert (=> start!100672 (array_inv!28656 _keys!1208)))

(assert (=> start!100672 true))

(assert (=> start!100672 tp!90266))

(declare-fun array_inv!28657 (array!77743) Bool)

(assert (=> start!100672 (and (array_inv!28657 _values!996) e!681919)))

(declare-fun b!1200396 () Bool)

(declare-fun e!681915 () Bool)

(assert (=> b!1200396 (= e!681915 tp_is_empty!30463)))

(declare-fun b!1200397 () Bool)

(declare-fun res!798616 () Bool)

(assert (=> b!1200397 (=> (not res!798616) (not e!681917))))

(assert (=> b!1200397 (= res!798616 (and (= (size!38047 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38046 _keys!1208) (size!38047 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1200398 () Bool)

(declare-fun res!798619 () Bool)

(assert (=> b!1200398 (=> (not res!798619) (not e!681917))))

(assert (=> b!1200398 (= res!798619 (= (select (arr!37509 _keys!1208) i!673) k0!934))))

(declare-fun b!1200399 () Bool)

(declare-fun res!798612 () Bool)

(assert (=> b!1200399 (=> (not res!798612) (not e!681917))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1200399 (= res!798612 (validMask!0 mask!1564))))

(declare-fun mapNonEmpty!47537 () Bool)

(declare-fun tp!90267 () Bool)

(assert (=> mapNonEmpty!47537 (= mapRes!47537 (and tp!90267 e!681915))))

(declare-fun mapRest!47537 () (Array (_ BitVec 32) ValueCell!14522))

(declare-fun mapValue!47537 () ValueCell!14522)

(declare-fun mapKey!47537 () (_ BitVec 32))

(assert (=> mapNonEmpty!47537 (= (arr!37510 _values!996) (store mapRest!47537 mapKey!47537 mapValue!47537))))

(declare-fun b!1200400 () Bool)

(declare-fun res!798617 () Bool)

(assert (=> b!1200400 (=> (not res!798617) (not e!681916))))

(assert (=> b!1200400 (= res!798617 (arrayNoDuplicates!0 lt!544161 #b00000000000000000000000000000000 Nil!26398))))

(declare-fun b!1200401 () Bool)

(declare-fun res!798618 () Bool)

(assert (=> b!1200401 (=> (not res!798618) (not e!681917))))

(assert (=> b!1200401 (= res!798618 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38046 _keys!1208))))))

(declare-fun b!1200402 () Bool)

(declare-fun res!798615 () Bool)

(assert (=> b!1200402 (=> (not res!798615) (not e!681917))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1200402 (= res!798615 (validKeyInArray!0 k0!934))))

(assert (= (and start!100672 res!798611) b!1200399))

(assert (= (and b!1200399 res!798612) b!1200397))

(assert (= (and b!1200397 res!798616) b!1200394))

(assert (= (and b!1200394 res!798610) b!1200391))

(assert (= (and b!1200391 res!798613) b!1200401))

(assert (= (and b!1200401 res!798618) b!1200402))

(assert (= (and b!1200402 res!798615) b!1200398))

(assert (= (and b!1200398 res!798619) b!1200395))

(assert (= (and b!1200395 res!798614) b!1200400))

(assert (= (and b!1200400 res!798617) b!1200389))

(assert (= (and b!1200389 (not res!798609)) b!1200390))

(assert (= (and b!1200392 condMapEmpty!47537) mapIsEmpty!47537))

(assert (= (and b!1200392 (not condMapEmpty!47537)) mapNonEmpty!47537))

(get-info :version)

(assert (= (and mapNonEmpty!47537 ((_ is ValueCellFull!14522) mapValue!47537)) b!1200396))

(assert (= (and b!1200392 ((_ is ValueCellFull!14522) mapDefault!47537)) b!1200393))

(assert (= start!100672 b!1200392))

(declare-fun b_lambda!20949 () Bool)

(assert (=> (not b_lambda!20949) (not b!1200390)))

(declare-fun t!39130 () Bool)

(declare-fun tb!10551 () Bool)

(assert (=> (and start!100672 (= defaultEntry!1004 defaultEntry!1004) t!39130) tb!10551))

(declare-fun result!21687 () Bool)

(assert (=> tb!10551 (= result!21687 tp_is_empty!30463)))

(assert (=> b!1200390 t!39130))

(declare-fun b_and!42409 () Bool)

(assert (= b_and!42407 (and (=> t!39130 result!21687) b_and!42409)))

(declare-fun m!1107287 () Bool)

(assert (=> b!1200402 m!1107287))

(declare-fun m!1107289 () Bool)

(assert (=> b!1200395 m!1107289))

(declare-fun m!1107291 () Bool)

(assert (=> b!1200395 m!1107291))

(declare-fun m!1107293 () Bool)

(assert (=> b!1200399 m!1107293))

(declare-fun m!1107295 () Bool)

(assert (=> b!1200398 m!1107295))

(declare-fun m!1107297 () Bool)

(assert (=> b!1200394 m!1107297))

(declare-fun m!1107299 () Bool)

(assert (=> b!1200389 m!1107299))

(declare-fun m!1107301 () Bool)

(assert (=> b!1200389 m!1107301))

(declare-fun m!1107303 () Bool)

(assert (=> mapNonEmpty!47537 m!1107303))

(declare-fun m!1107305 () Bool)

(assert (=> b!1200400 m!1107305))

(declare-fun m!1107307 () Bool)

(assert (=> b!1200390 m!1107307))

(declare-fun m!1107309 () Bool)

(assert (=> b!1200390 m!1107309))

(declare-fun m!1107311 () Bool)

(assert (=> b!1200390 m!1107311))

(declare-fun m!1107313 () Bool)

(assert (=> b!1200390 m!1107313))

(declare-fun m!1107315 () Bool)

(assert (=> start!100672 m!1107315))

(declare-fun m!1107317 () Bool)

(assert (=> start!100672 m!1107317))

(declare-fun m!1107319 () Bool)

(assert (=> b!1200391 m!1107319))

(check-sat (not b!1200389) (not b!1200390) (not b!1200400) (not b_next!25759) (not b!1200399) tp_is_empty!30463 b_and!42409 (not mapNonEmpty!47537) (not b!1200391) (not start!100672) (not b!1200394) (not b_lambda!20949) (not b!1200395) (not b!1200402))
(check-sat b_and!42409 (not b_next!25759))
