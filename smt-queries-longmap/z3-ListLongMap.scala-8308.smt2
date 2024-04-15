; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101190 () Bool)

(assert start!101190)

(declare-fun b_free!26119 () Bool)

(declare-fun b_next!26119 () Bool)

(assert (=> start!101190 (= b_free!26119 (not b_next!26119))))

(declare-fun tp!91379 () Bool)

(declare-fun b_and!43337 () Bool)

(assert (=> start!101190 (= tp!91379 b_and!43337)))

(declare-fun b!1214783 () Bool)

(declare-fun res!806532 () Bool)

(declare-fun e!689812 () Bool)

(assert (=> b!1214783 (=> (not res!806532) (not e!689812))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1214783 (= res!806532 (validMask!0 mask!1564))))

(declare-fun b!1214784 () Bool)

(declare-fun e!689815 () Bool)

(assert (=> b!1214784 (= e!689815 true)))

(declare-datatypes ((V!46225 0))(
  ( (V!46226 (val!15468 Int)) )
))
(declare-fun zeroValue!944 () V!46225)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((array!78344 0))(
  ( (array!78345 (arr!37807 (Array (_ BitVec 32) (_ BitVec 64))) (size!38345 (_ BitVec 32))) )
))
(declare-fun lt!552287 () array!78344)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((tuple2!19962 0))(
  ( (tuple2!19963 (_1!9992 (_ BitVec 64)) (_2!9992 V!46225)) )
))
(declare-datatypes ((List!26741 0))(
  ( (Nil!26738) (Cons!26737 (h!27946 tuple2!19962) (t!39831 List!26741)) )
))
(declare-datatypes ((ListLongMap!17931 0))(
  ( (ListLongMap!17932 (toList!8981 List!26741)) )
))
(declare-fun lt!552285 () ListLongMap!17931)

(declare-fun minValue!944 () V!46225)

(declare-datatypes ((ValueCell!14702 0))(
  ( (ValueCellFull!14702 (v!18120 V!46225)) (EmptyCell!14702) )
))
(declare-datatypes ((array!78346 0))(
  ( (array!78347 (arr!37808 (Array (_ BitVec 32) ValueCell!14702)) (size!38346 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78346)

(declare-fun getCurrentListMapNoExtraKeys!5420 (array!78344 array!78346 (_ BitVec 32) (_ BitVec 32) V!46225 V!46225 (_ BitVec 32) Int) ListLongMap!17931)

(declare-fun dynLambda!3272 (Int (_ BitVec 64)) V!46225)

(assert (=> b!1214784 (= lt!552285 (getCurrentListMapNoExtraKeys!5420 lt!552287 (array!78347 (store (arr!37808 _values!996) i!673 (ValueCellFull!14702 (dynLambda!3272 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38346 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun _keys!1208 () array!78344)

(declare-fun lt!552284 () ListLongMap!17931)

(assert (=> b!1214784 (= lt!552284 (getCurrentListMapNoExtraKeys!5420 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1214785 () Bool)

(declare-fun e!689813 () Bool)

(assert (=> b!1214785 (= e!689813 (not e!689815))))

(declare-fun res!806533 () Bool)

(assert (=> b!1214785 (=> res!806533 e!689815)))

(assert (=> b!1214785 (= res!806533 (bvsgt from!1455 i!673))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!78344 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1214785 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!40139 0))(
  ( (Unit!40140) )
))
(declare-fun lt!552286 () Unit!40139)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78344 (_ BitVec 64) (_ BitVec 32)) Unit!40139)

(assert (=> b!1214785 (= lt!552286 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1214786 () Bool)

(declare-fun res!806536 () Bool)

(assert (=> b!1214786 (=> (not res!806536) (not e!689812))))

(declare-datatypes ((List!26742 0))(
  ( (Nil!26739) (Cons!26738 (h!27947 (_ BitVec 64)) (t!39832 List!26742)) )
))
(declare-fun arrayNoDuplicates!0 (array!78344 (_ BitVec 32) List!26742) Bool)

(assert (=> b!1214786 (= res!806536 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26739))))

(declare-fun res!806542 () Bool)

(assert (=> start!101190 (=> (not res!806542) (not e!689812))))

(assert (=> start!101190 (= res!806542 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38345 _keys!1208))))))

(assert (=> start!101190 e!689812))

(declare-fun tp_is_empty!30823 () Bool)

(assert (=> start!101190 tp_is_empty!30823))

(declare-fun array_inv!28902 (array!78344) Bool)

(assert (=> start!101190 (array_inv!28902 _keys!1208)))

(assert (=> start!101190 true))

(assert (=> start!101190 tp!91379))

(declare-fun e!689814 () Bool)

(declare-fun array_inv!28903 (array!78346) Bool)

(assert (=> start!101190 (and (array_inv!28903 _values!996) e!689814)))

(declare-fun b!1214787 () Bool)

(declare-fun e!689818 () Bool)

(assert (=> b!1214787 (= e!689818 tp_is_empty!30823)))

(declare-fun b!1214788 () Bool)

(declare-fun res!806538 () Bool)

(assert (=> b!1214788 (=> (not res!806538) (not e!689812))))

(assert (=> b!1214788 (= res!806538 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38345 _keys!1208))))))

(declare-fun b!1214789 () Bool)

(declare-fun mapRes!48109 () Bool)

(assert (=> b!1214789 (= e!689814 (and e!689818 mapRes!48109))))

(declare-fun condMapEmpty!48109 () Bool)

(declare-fun mapDefault!48109 () ValueCell!14702)

(assert (=> b!1214789 (= condMapEmpty!48109 (= (arr!37808 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14702)) mapDefault!48109)))))

(declare-fun b!1214790 () Bool)

(declare-fun res!806535 () Bool)

(assert (=> b!1214790 (=> (not res!806535) (not e!689812))))

(assert (=> b!1214790 (= res!806535 (= (select (arr!37807 _keys!1208) i!673) k0!934))))

(declare-fun b!1214791 () Bool)

(assert (=> b!1214791 (= e!689812 e!689813)))

(declare-fun res!806534 () Bool)

(assert (=> b!1214791 (=> (not res!806534) (not e!689813))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78344 (_ BitVec 32)) Bool)

(assert (=> b!1214791 (= res!806534 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!552287 mask!1564))))

(assert (=> b!1214791 (= lt!552287 (array!78345 (store (arr!37807 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38345 _keys!1208)))))

(declare-fun b!1214792 () Bool)

(declare-fun res!806541 () Bool)

(assert (=> b!1214792 (=> (not res!806541) (not e!689812))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1214792 (= res!806541 (validKeyInArray!0 k0!934))))

(declare-fun mapNonEmpty!48109 () Bool)

(declare-fun tp!91378 () Bool)

(declare-fun e!689816 () Bool)

(assert (=> mapNonEmpty!48109 (= mapRes!48109 (and tp!91378 e!689816))))

(declare-fun mapValue!48109 () ValueCell!14702)

(declare-fun mapKey!48109 () (_ BitVec 32))

(declare-fun mapRest!48109 () (Array (_ BitVec 32) ValueCell!14702))

(assert (=> mapNonEmpty!48109 (= (arr!37808 _values!996) (store mapRest!48109 mapKey!48109 mapValue!48109))))

(declare-fun b!1214793 () Bool)

(declare-fun res!806537 () Bool)

(assert (=> b!1214793 (=> (not res!806537) (not e!689812))))

(assert (=> b!1214793 (= res!806537 (and (= (size!38346 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38345 _keys!1208) (size!38346 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1214794 () Bool)

(declare-fun res!806539 () Bool)

(assert (=> b!1214794 (=> (not res!806539) (not e!689813))))

(assert (=> b!1214794 (= res!806539 (arrayNoDuplicates!0 lt!552287 #b00000000000000000000000000000000 Nil!26739))))

(declare-fun mapIsEmpty!48109 () Bool)

(assert (=> mapIsEmpty!48109 mapRes!48109))

(declare-fun b!1214795 () Bool)

(declare-fun res!806540 () Bool)

(assert (=> b!1214795 (=> (not res!806540) (not e!689812))))

(assert (=> b!1214795 (= res!806540 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1214796 () Bool)

(assert (=> b!1214796 (= e!689816 tp_is_empty!30823)))

(assert (= (and start!101190 res!806542) b!1214783))

(assert (= (and b!1214783 res!806532) b!1214793))

(assert (= (and b!1214793 res!806537) b!1214795))

(assert (= (and b!1214795 res!806540) b!1214786))

(assert (= (and b!1214786 res!806536) b!1214788))

(assert (= (and b!1214788 res!806538) b!1214792))

(assert (= (and b!1214792 res!806541) b!1214790))

(assert (= (and b!1214790 res!806535) b!1214791))

(assert (= (and b!1214791 res!806534) b!1214794))

(assert (= (and b!1214794 res!806539) b!1214785))

(assert (= (and b!1214785 (not res!806533)) b!1214784))

(assert (= (and b!1214789 condMapEmpty!48109) mapIsEmpty!48109))

(assert (= (and b!1214789 (not condMapEmpty!48109)) mapNonEmpty!48109))

(get-info :version)

(assert (= (and mapNonEmpty!48109 ((_ is ValueCellFull!14702) mapValue!48109)) b!1214796))

(assert (= (and b!1214789 ((_ is ValueCellFull!14702) mapDefault!48109)) b!1214787))

(assert (= start!101190 b!1214789))

(declare-fun b_lambda!21785 () Bool)

(assert (=> (not b_lambda!21785) (not b!1214784)))

(declare-fun t!39830 () Bool)

(declare-fun tb!10911 () Bool)

(assert (=> (and start!101190 (= defaultEntry!1004 defaultEntry!1004) t!39830) tb!10911))

(declare-fun result!22427 () Bool)

(assert (=> tb!10911 (= result!22427 tp_is_empty!30823)))

(assert (=> b!1214784 t!39830))

(declare-fun b_and!43339 () Bool)

(assert (= b_and!43337 (and (=> t!39830 result!22427) b_and!43339)))

(declare-fun m!1119423 () Bool)

(assert (=> b!1214794 m!1119423))

(declare-fun m!1119425 () Bool)

(assert (=> b!1214792 m!1119425))

(declare-fun m!1119427 () Bool)

(assert (=> b!1214795 m!1119427))

(declare-fun m!1119429 () Bool)

(assert (=> b!1214790 m!1119429))

(declare-fun m!1119431 () Bool)

(assert (=> b!1214783 m!1119431))

(declare-fun m!1119433 () Bool)

(assert (=> b!1214784 m!1119433))

(declare-fun m!1119435 () Bool)

(assert (=> b!1214784 m!1119435))

(declare-fun m!1119437 () Bool)

(assert (=> b!1214784 m!1119437))

(declare-fun m!1119439 () Bool)

(assert (=> b!1214784 m!1119439))

(declare-fun m!1119441 () Bool)

(assert (=> b!1214786 m!1119441))

(declare-fun m!1119443 () Bool)

(assert (=> mapNonEmpty!48109 m!1119443))

(declare-fun m!1119445 () Bool)

(assert (=> b!1214791 m!1119445))

(declare-fun m!1119447 () Bool)

(assert (=> b!1214791 m!1119447))

(declare-fun m!1119449 () Bool)

(assert (=> b!1214785 m!1119449))

(declare-fun m!1119451 () Bool)

(assert (=> b!1214785 m!1119451))

(declare-fun m!1119453 () Bool)

(assert (=> start!101190 m!1119453))

(declare-fun m!1119455 () Bool)

(assert (=> start!101190 m!1119455))

(check-sat tp_is_empty!30823 (not b!1214783) (not b_lambda!21785) (not b_next!26119) (not b!1214795) (not b!1214786) (not b!1214791) (not b!1214785) (not b!1214794) (not start!101190) (not b!1214784) (not mapNonEmpty!48109) (not b!1214792) b_and!43339)
(check-sat b_and!43339 (not b_next!26119))
