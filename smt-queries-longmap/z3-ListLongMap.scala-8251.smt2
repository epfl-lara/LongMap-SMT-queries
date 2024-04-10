; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100456 () Bool)

(assert start!100456)

(declare-fun b_free!25779 () Bool)

(declare-fun b_next!25779 () Bool)

(assert (=> start!100456 (= b_free!25779 (not b_next!25779))))

(declare-fun tp!90327 () Bool)

(declare-fun b_and!42445 () Bool)

(assert (=> start!100456 (= tp!90327 b_and!42445)))

(declare-fun b!1199540 () Bool)

(declare-fun res!798439 () Bool)

(declare-fun e!681298 () Bool)

(assert (=> b!1199540 (=> (not res!798439) (not e!681298))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!77741 0))(
  ( (array!77742 (arr!37515 (Array (_ BitVec 32) (_ BitVec 64))) (size!38051 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77741)

(assert (=> b!1199540 (= res!798439 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38051 _keys!1208))))))

(declare-fun b!1199541 () Bool)

(declare-fun res!798438 () Bool)

(assert (=> b!1199541 (=> (not res!798438) (not e!681298))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1199541 (= res!798438 (validMask!0 mask!1564))))

(declare-fun b!1199542 () Bool)

(declare-fun res!798434 () Bool)

(declare-fun e!681293 () Bool)

(assert (=> b!1199542 (=> (not res!798434) (not e!681293))))

(declare-fun lt!543798 () array!77741)

(declare-datatypes ((List!26400 0))(
  ( (Nil!26397) (Cons!26396 (h!27605 (_ BitVec 64)) (t!39159 List!26400)) )
))
(declare-fun arrayNoDuplicates!0 (array!77741 (_ BitVec 32) List!26400) Bool)

(assert (=> b!1199542 (= res!798434 (arrayNoDuplicates!0 lt!543798 #b00000000000000000000000000000000 Nil!26397))))

(declare-fun b!1199543 () Bool)

(declare-fun e!681292 () Bool)

(declare-fun tp_is_empty!30483 () Bool)

(assert (=> b!1199543 (= e!681292 tp_is_empty!30483)))

(declare-fun mapIsEmpty!47567 () Bool)

(declare-fun mapRes!47567 () Bool)

(assert (=> mapIsEmpty!47567 mapRes!47567))

(declare-fun b!1199544 () Bool)

(declare-fun res!798437 () Bool)

(assert (=> b!1199544 (=> (not res!798437) (not e!681298))))

(assert (=> b!1199544 (= res!798437 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26397))))

(declare-fun res!798435 () Bool)

(assert (=> start!100456 (=> (not res!798435) (not e!681298))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!100456 (= res!798435 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38051 _keys!1208))))))

(assert (=> start!100456 e!681298))

(assert (=> start!100456 tp_is_empty!30483))

(declare-fun array_inv!28586 (array!77741) Bool)

(assert (=> start!100456 (array_inv!28586 _keys!1208)))

(assert (=> start!100456 true))

(assert (=> start!100456 tp!90327))

(declare-datatypes ((V!45771 0))(
  ( (V!45772 (val!15298 Int)) )
))
(declare-datatypes ((ValueCell!14532 0))(
  ( (ValueCellFull!14532 (v!17936 V!45771)) (EmptyCell!14532) )
))
(declare-datatypes ((array!77743 0))(
  ( (array!77744 (arr!37516 (Array (_ BitVec 32) ValueCell!14532)) (size!38052 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77743)

(declare-fun e!681296 () Bool)

(declare-fun array_inv!28587 (array!77743) Bool)

(assert (=> start!100456 (and (array_inv!28587 _values!996) e!681296)))

(declare-fun b!1199545 () Bool)

(declare-fun res!798440 () Bool)

(assert (=> b!1199545 (=> (not res!798440) (not e!681298))))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1199545 (= res!798440 (= (select (arr!37515 _keys!1208) i!673) k0!934))))

(declare-fun b!1199546 () Bool)

(declare-fun res!798441 () Bool)

(assert (=> b!1199546 (=> (not res!798441) (not e!681298))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77741 (_ BitVec 32)) Bool)

(assert (=> b!1199546 (= res!798441 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1199547 () Bool)

(declare-fun e!681297 () Bool)

(assert (=> b!1199547 (= e!681293 (not e!681297))))

(declare-fun res!798436 () Bool)

(assert (=> b!1199547 (=> res!798436 e!681297)))

(assert (=> b!1199547 (= res!798436 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!77741 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1199547 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39770 0))(
  ( (Unit!39771) )
))
(declare-fun lt!543799 () Unit!39770)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77741 (_ BitVec 64) (_ BitVec 32)) Unit!39770)

(assert (=> b!1199547 (= lt!543799 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1199548 () Bool)

(assert (=> b!1199548 (= e!681298 e!681293)))

(declare-fun res!798431 () Bool)

(assert (=> b!1199548 (=> (not res!798431) (not e!681293))))

(assert (=> b!1199548 (= res!798431 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!543798 mask!1564))))

(assert (=> b!1199548 (= lt!543798 (array!77742 (store (arr!37515 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38051 _keys!1208)))))

(declare-fun b!1199549 () Bool)

(declare-fun e!681295 () Bool)

(assert (=> b!1199549 (= e!681295 tp_is_empty!30483)))

(declare-fun mapNonEmpty!47567 () Bool)

(declare-fun tp!90326 () Bool)

(assert (=> mapNonEmpty!47567 (= mapRes!47567 (and tp!90326 e!681292))))

(declare-fun mapKey!47567 () (_ BitVec 32))

(declare-fun mapValue!47567 () ValueCell!14532)

(declare-fun mapRest!47567 () (Array (_ BitVec 32) ValueCell!14532))

(assert (=> mapNonEmpty!47567 (= (arr!37516 _values!996) (store mapRest!47567 mapKey!47567 mapValue!47567))))

(declare-fun b!1199550 () Bool)

(declare-fun res!798433 () Bool)

(assert (=> b!1199550 (=> (not res!798433) (not e!681298))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1199550 (= res!798433 (and (= (size!38052 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38051 _keys!1208) (size!38052 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1199551 () Bool)

(assert (=> b!1199551 (= e!681297 true)))

(declare-fun zeroValue!944 () V!45771)

(declare-fun minValue!944 () V!45771)

(declare-datatypes ((tuple2!19584 0))(
  ( (tuple2!19585 (_1!9803 (_ BitVec 64)) (_2!9803 V!45771)) )
))
(declare-datatypes ((List!26401 0))(
  ( (Nil!26398) (Cons!26397 (h!27606 tuple2!19584) (t!39160 List!26401)) )
))
(declare-datatypes ((ListLongMap!17553 0))(
  ( (ListLongMap!17554 (toList!8792 List!26401)) )
))
(declare-fun lt!543797 () ListLongMap!17553)

(declare-fun defaultEntry!1004 () Int)

(declare-fun getCurrentListMapNoExtraKeys!5231 (array!77741 array!77743 (_ BitVec 32) (_ BitVec 32) V!45771 V!45771 (_ BitVec 32) Int) ListLongMap!17553)

(declare-fun dynLambda!3151 (Int (_ BitVec 64)) V!45771)

(assert (=> b!1199551 (= lt!543797 (getCurrentListMapNoExtraKeys!5231 lt!543798 (array!77744 (store (arr!37516 _values!996) i!673 (ValueCellFull!14532 (dynLambda!3151 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38052 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!543796 () ListLongMap!17553)

(assert (=> b!1199551 (= lt!543796 (getCurrentListMapNoExtraKeys!5231 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1199552 () Bool)

(declare-fun res!798432 () Bool)

(assert (=> b!1199552 (=> (not res!798432) (not e!681298))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1199552 (= res!798432 (validKeyInArray!0 k0!934))))

(declare-fun b!1199553 () Bool)

(assert (=> b!1199553 (= e!681296 (and e!681295 mapRes!47567))))

(declare-fun condMapEmpty!47567 () Bool)

(declare-fun mapDefault!47567 () ValueCell!14532)

(assert (=> b!1199553 (= condMapEmpty!47567 (= (arr!37516 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14532)) mapDefault!47567)))))

(assert (= (and start!100456 res!798435) b!1199541))

(assert (= (and b!1199541 res!798438) b!1199550))

(assert (= (and b!1199550 res!798433) b!1199546))

(assert (= (and b!1199546 res!798441) b!1199544))

(assert (= (and b!1199544 res!798437) b!1199540))

(assert (= (and b!1199540 res!798439) b!1199552))

(assert (= (and b!1199552 res!798432) b!1199545))

(assert (= (and b!1199545 res!798440) b!1199548))

(assert (= (and b!1199548 res!798431) b!1199542))

(assert (= (and b!1199542 res!798434) b!1199547))

(assert (= (and b!1199547 (not res!798436)) b!1199551))

(assert (= (and b!1199553 condMapEmpty!47567) mapIsEmpty!47567))

(assert (= (and b!1199553 (not condMapEmpty!47567)) mapNonEmpty!47567))

(get-info :version)

(assert (= (and mapNonEmpty!47567 ((_ is ValueCellFull!14532) mapValue!47567)) b!1199543))

(assert (= (and b!1199553 ((_ is ValueCellFull!14532) mapDefault!47567)) b!1199549))

(assert (= start!100456 b!1199553))

(declare-fun b_lambda!20975 () Bool)

(assert (=> (not b_lambda!20975) (not b!1199551)))

(declare-fun t!39158 () Bool)

(declare-fun tb!10579 () Bool)

(assert (=> (and start!100456 (= defaultEntry!1004 defaultEntry!1004) t!39158) tb!10579))

(declare-fun result!21735 () Bool)

(assert (=> tb!10579 (= result!21735 tp_is_empty!30483)))

(assert (=> b!1199551 t!39158))

(declare-fun b_and!42447 () Bool)

(assert (= b_and!42445 (and (=> t!39158 result!21735) b_and!42447)))

(declare-fun m!1106055 () Bool)

(assert (=> b!1199541 m!1106055))

(declare-fun m!1106057 () Bool)

(assert (=> b!1199551 m!1106057))

(declare-fun m!1106059 () Bool)

(assert (=> b!1199551 m!1106059))

(declare-fun m!1106061 () Bool)

(assert (=> b!1199551 m!1106061))

(declare-fun m!1106063 () Bool)

(assert (=> b!1199551 m!1106063))

(declare-fun m!1106065 () Bool)

(assert (=> mapNonEmpty!47567 m!1106065))

(declare-fun m!1106067 () Bool)

(assert (=> b!1199547 m!1106067))

(declare-fun m!1106069 () Bool)

(assert (=> b!1199547 m!1106069))

(declare-fun m!1106071 () Bool)

(assert (=> b!1199546 m!1106071))

(declare-fun m!1106073 () Bool)

(assert (=> b!1199552 m!1106073))

(declare-fun m!1106075 () Bool)

(assert (=> b!1199544 m!1106075))

(declare-fun m!1106077 () Bool)

(assert (=> start!100456 m!1106077))

(declare-fun m!1106079 () Bool)

(assert (=> start!100456 m!1106079))

(declare-fun m!1106081 () Bool)

(assert (=> b!1199545 m!1106081))

(declare-fun m!1106083 () Bool)

(assert (=> b!1199548 m!1106083))

(declare-fun m!1106085 () Bool)

(assert (=> b!1199548 m!1106085))

(declare-fun m!1106087 () Bool)

(assert (=> b!1199542 m!1106087))

(check-sat (not b!1199551) (not b!1199541) (not b!1199546) b_and!42447 tp_is_empty!30483 (not b!1199552) (not start!100456) (not mapNonEmpty!47567) (not b!1199548) (not b!1199542) (not b_next!25779) (not b!1199547) (not b_lambda!20975) (not b!1199544))
(check-sat b_and!42447 (not b_next!25779))
