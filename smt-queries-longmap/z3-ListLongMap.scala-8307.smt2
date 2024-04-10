; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101192 () Bool)

(assert start!101192)

(declare-fun b_free!26115 () Bool)

(declare-fun b_next!26115 () Bool)

(assert (=> start!101192 (= b_free!26115 (not b_next!26115))))

(declare-fun tp!91367 () Bool)

(declare-fun b_and!43347 () Bool)

(assert (=> start!101192 (= tp!91367 b_and!43347)))

(declare-fun b!1214804 () Bool)

(declare-fun e!689845 () Bool)

(declare-fun tp_is_empty!30819 () Bool)

(assert (=> b!1214804 (= e!689845 tp_is_empty!30819)))

(declare-fun b!1214805 () Bool)

(declare-fun res!806529 () Bool)

(declare-fun e!689844 () Bool)

(assert (=> b!1214805 (=> (not res!806529) (not e!689844))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!78417 0))(
  ( (array!78418 (arr!37843 (Array (_ BitVec 32) (_ BitVec 64))) (size!38379 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78417)

(assert (=> b!1214805 (= res!806529 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38379 _keys!1208))))))

(declare-fun mapIsEmpty!48103 () Bool)

(declare-fun mapRes!48103 () Bool)

(assert (=> mapIsEmpty!48103 mapRes!48103))

(declare-fun b!1214806 () Bool)

(declare-fun e!689842 () Bool)

(declare-fun e!689839 () Bool)

(assert (=> b!1214806 (= e!689842 (not e!689839))))

(declare-fun res!806534 () Bool)

(assert (=> b!1214806 (=> res!806534 e!689839)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1214806 (= res!806534 (bvsgt from!1455 i!673))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!78417 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1214806 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!40282 0))(
  ( (Unit!40283) )
))
(declare-fun lt!552443 () Unit!40282)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78417 (_ BitVec 64) (_ BitVec 32)) Unit!40282)

(assert (=> b!1214806 (= lt!552443 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun mapNonEmpty!48103 () Bool)

(declare-fun tp!91366 () Bool)

(assert (=> mapNonEmpty!48103 (= mapRes!48103 (and tp!91366 e!689845))))

(declare-fun mapKey!48103 () (_ BitVec 32))

(declare-datatypes ((V!46219 0))(
  ( (V!46220 (val!15466 Int)) )
))
(declare-datatypes ((ValueCell!14700 0))(
  ( (ValueCellFull!14700 (v!18119 V!46219)) (EmptyCell!14700) )
))
(declare-datatypes ((array!78419 0))(
  ( (array!78420 (arr!37844 (Array (_ BitVec 32) ValueCell!14700)) (size!38380 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78419)

(declare-fun mapValue!48103 () ValueCell!14700)

(declare-fun mapRest!48103 () (Array (_ BitVec 32) ValueCell!14700))

(assert (=> mapNonEmpty!48103 (= (arr!37844 _values!996) (store mapRest!48103 mapKey!48103 mapValue!48103))))

(declare-fun b!1214807 () Bool)

(declare-fun res!806531 () Bool)

(assert (=> b!1214807 (=> (not res!806531) (not e!689844))))

(assert (=> b!1214807 (= res!806531 (= (select (arr!37843 _keys!1208) i!673) k0!934))))

(declare-fun b!1214808 () Bool)

(assert (=> b!1214808 (= e!689844 e!689842)))

(declare-fun res!806537 () Bool)

(assert (=> b!1214808 (=> (not res!806537) (not e!689842))))

(declare-fun lt!552444 () array!78417)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78417 (_ BitVec 32)) Bool)

(assert (=> b!1214808 (= res!806537 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!552444 mask!1564))))

(assert (=> b!1214808 (= lt!552444 (array!78418 (store (arr!37843 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38379 _keys!1208)))))

(declare-fun b!1214809 () Bool)

(declare-fun res!806536 () Bool)

(assert (=> b!1214809 (=> (not res!806536) (not e!689844))))

(declare-datatypes ((List!26679 0))(
  ( (Nil!26676) (Cons!26675 (h!27884 (_ BitVec 64)) (t!39774 List!26679)) )
))
(declare-fun arrayNoDuplicates!0 (array!78417 (_ BitVec 32) List!26679) Bool)

(assert (=> b!1214809 (= res!806536 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26676))))

(declare-fun b!1214810 () Bool)

(declare-fun res!806532 () Bool)

(assert (=> b!1214810 (=> (not res!806532) (not e!689844))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1214810 (= res!806532 (validKeyInArray!0 k0!934))))

(declare-fun b!1214811 () Bool)

(declare-fun e!689843 () Bool)

(assert (=> b!1214811 (= e!689843 tp_is_empty!30819)))

(declare-fun b!1214812 () Bool)

(declare-fun res!806533 () Bool)

(assert (=> b!1214812 (=> (not res!806533) (not e!689844))))

(assert (=> b!1214812 (= res!806533 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun res!806535 () Bool)

(assert (=> start!101192 (=> (not res!806535) (not e!689844))))

(assert (=> start!101192 (= res!806535 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38379 _keys!1208))))))

(assert (=> start!101192 e!689844))

(assert (=> start!101192 tp_is_empty!30819))

(declare-fun array_inv!28814 (array!78417) Bool)

(assert (=> start!101192 (array_inv!28814 _keys!1208)))

(assert (=> start!101192 true))

(assert (=> start!101192 tp!91367))

(declare-fun e!689840 () Bool)

(declare-fun array_inv!28815 (array!78419) Bool)

(assert (=> start!101192 (and (array_inv!28815 _values!996) e!689840)))

(declare-fun b!1214813 () Bool)

(declare-fun res!806528 () Bool)

(assert (=> b!1214813 (=> (not res!806528) (not e!689842))))

(assert (=> b!1214813 (= res!806528 (arrayNoDuplicates!0 lt!552444 #b00000000000000000000000000000000 Nil!26676))))

(declare-fun b!1214814 () Bool)

(assert (=> b!1214814 (= e!689840 (and e!689843 mapRes!48103))))

(declare-fun condMapEmpty!48103 () Bool)

(declare-fun mapDefault!48103 () ValueCell!14700)

(assert (=> b!1214814 (= condMapEmpty!48103 (= (arr!37844 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14700)) mapDefault!48103)))))

(declare-fun b!1214815 () Bool)

(declare-fun res!806527 () Bool)

(assert (=> b!1214815 (=> (not res!806527) (not e!689844))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1214815 (= res!806527 (and (= (size!38380 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38379 _keys!1208) (size!38380 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1214816 () Bool)

(declare-fun res!806530 () Bool)

(assert (=> b!1214816 (=> (not res!806530) (not e!689844))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1214816 (= res!806530 (validMask!0 mask!1564))))

(declare-fun b!1214817 () Bool)

(assert (=> b!1214817 (= e!689839 true)))

(declare-fun zeroValue!944 () V!46219)

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!19880 0))(
  ( (tuple2!19881 (_1!9951 (_ BitVec 64)) (_2!9951 V!46219)) )
))
(declare-datatypes ((List!26680 0))(
  ( (Nil!26677) (Cons!26676 (h!27885 tuple2!19880) (t!39775 List!26680)) )
))
(declare-datatypes ((ListLongMap!17849 0))(
  ( (ListLongMap!17850 (toList!8940 List!26680)) )
))
(declare-fun lt!552442 () ListLongMap!17849)

(declare-fun minValue!944 () V!46219)

(declare-fun getCurrentListMapNoExtraKeys!5367 (array!78417 array!78419 (_ BitVec 32) (_ BitVec 32) V!46219 V!46219 (_ BitVec 32) Int) ListLongMap!17849)

(declare-fun dynLambda!3256 (Int (_ BitVec 64)) V!46219)

(assert (=> b!1214817 (= lt!552442 (getCurrentListMapNoExtraKeys!5367 lt!552444 (array!78420 (store (arr!37844 _values!996) i!673 (ValueCellFull!14700 (dynLambda!3256 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38380 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!552441 () ListLongMap!17849)

(assert (=> b!1214817 (= lt!552441 (getCurrentListMapNoExtraKeys!5367 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (= (and start!101192 res!806535) b!1214816))

(assert (= (and b!1214816 res!806530) b!1214815))

(assert (= (and b!1214815 res!806527) b!1214812))

(assert (= (and b!1214812 res!806533) b!1214809))

(assert (= (and b!1214809 res!806536) b!1214805))

(assert (= (and b!1214805 res!806529) b!1214810))

(assert (= (and b!1214810 res!806532) b!1214807))

(assert (= (and b!1214807 res!806531) b!1214808))

(assert (= (and b!1214808 res!806537) b!1214813))

(assert (= (and b!1214813 res!806528) b!1214806))

(assert (= (and b!1214806 (not res!806534)) b!1214817))

(assert (= (and b!1214814 condMapEmpty!48103) mapIsEmpty!48103))

(assert (= (and b!1214814 (not condMapEmpty!48103)) mapNonEmpty!48103))

(get-info :version)

(assert (= (and mapNonEmpty!48103 ((_ is ValueCellFull!14700) mapValue!48103)) b!1214804))

(assert (= (and b!1214814 ((_ is ValueCellFull!14700) mapDefault!48103)) b!1214811))

(assert (= start!101192 b!1214814))

(declare-fun b_lambda!21791 () Bool)

(assert (=> (not b_lambda!21791) (not b!1214817)))

(declare-fun t!39773 () Bool)

(declare-fun tb!10915 () Bool)

(assert (=> (and start!101192 (= defaultEntry!1004 defaultEntry!1004) t!39773) tb!10915))

(declare-fun result!22427 () Bool)

(assert (=> tb!10915 (= result!22427 tp_is_empty!30819)))

(assert (=> b!1214817 t!39773))

(declare-fun b_and!43349 () Bool)

(assert (= b_and!43347 (and (=> t!39773 result!22427) b_and!43349)))

(declare-fun m!1119919 () Bool)

(assert (=> b!1214808 m!1119919))

(declare-fun m!1119921 () Bool)

(assert (=> b!1214808 m!1119921))

(declare-fun m!1119923 () Bool)

(assert (=> b!1214817 m!1119923))

(declare-fun m!1119925 () Bool)

(assert (=> b!1214817 m!1119925))

(declare-fun m!1119927 () Bool)

(assert (=> b!1214817 m!1119927))

(declare-fun m!1119929 () Bool)

(assert (=> b!1214817 m!1119929))

(declare-fun m!1119931 () Bool)

(assert (=> b!1214816 m!1119931))

(declare-fun m!1119933 () Bool)

(assert (=> mapNonEmpty!48103 m!1119933))

(declare-fun m!1119935 () Bool)

(assert (=> start!101192 m!1119935))

(declare-fun m!1119937 () Bool)

(assert (=> start!101192 m!1119937))

(declare-fun m!1119939 () Bool)

(assert (=> b!1214807 m!1119939))

(declare-fun m!1119941 () Bool)

(assert (=> b!1214809 m!1119941))

(declare-fun m!1119943 () Bool)

(assert (=> b!1214813 m!1119943))

(declare-fun m!1119945 () Bool)

(assert (=> b!1214812 m!1119945))

(declare-fun m!1119947 () Bool)

(assert (=> b!1214810 m!1119947))

(declare-fun m!1119949 () Bool)

(assert (=> b!1214806 m!1119949))

(declare-fun m!1119951 () Bool)

(assert (=> b!1214806 m!1119951))

(check-sat tp_is_empty!30819 (not b!1214817) (not b!1214816) (not b!1214810) (not b_lambda!21791) (not b!1214806) b_and!43349 (not start!101192) (not b!1214808) (not b!1214812) (not mapNonEmpty!48103) (not b!1214809) (not b!1214813) (not b_next!26115))
(check-sat b_and!43349 (not b_next!26115))
