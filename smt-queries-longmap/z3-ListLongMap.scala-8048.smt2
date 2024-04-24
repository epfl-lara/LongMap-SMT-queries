; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99364 () Bool)

(assert start!99364)

(declare-fun b_free!24733 () Bool)

(declare-fun b_next!24733 () Bool)

(assert (=> start!99364 (= b_free!24733 (not b_next!24733))))

(declare-fun tp!86910 () Bool)

(declare-fun b_and!40317 () Bool)

(assert (=> start!99364 (= tp!86910 b_and!40317)))

(declare-fun mapNonEmpty!45719 () Bool)

(declare-fun mapRes!45719 () Bool)

(declare-fun tp!86909 () Bool)

(declare-fun e!663789 () Bool)

(assert (=> mapNonEmpty!45719 (= mapRes!45719 (and tp!86909 e!663789))))

(declare-fun mapKey!45719 () (_ BitVec 32))

(declare-datatypes ((V!44145 0))(
  ( (V!44146 (val!14688 Int)) )
))
(declare-datatypes ((ValueCell!13922 0))(
  ( (ValueCellFull!13922 (v!17321 V!44145)) (EmptyCell!13922) )
))
(declare-fun mapValue!45719 () ValueCell!13922)

(declare-datatypes ((array!75407 0))(
  ( (array!75408 (arr!36348 (Array (_ BitVec 32) ValueCell!13922)) (size!36885 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75407)

(declare-fun mapRest!45719 () (Array (_ BitVec 32) ValueCell!13922))

(assert (=> mapNonEmpty!45719 (= (arr!36348 _values!996) (store mapRest!45719 mapKey!45719 mapValue!45719))))

(declare-fun b!1167568 () Bool)

(declare-fun res!774087 () Bool)

(declare-fun e!663792 () Bool)

(assert (=> b!1167568 (=> (not res!774087) (not e!663792))))

(declare-datatypes ((array!75409 0))(
  ( (array!75410 (arr!36349 (Array (_ BitVec 32) (_ BitVec 64))) (size!36886 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75409)

(declare-datatypes ((List!25507 0))(
  ( (Nil!25504) (Cons!25503 (h!26721 (_ BitVec 64)) (t!37224 List!25507)) )
))
(declare-fun arrayNoDuplicates!0 (array!75409 (_ BitVec 32) List!25507) Bool)

(assert (=> b!1167568 (= res!774087 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25504))))

(declare-fun b!1167569 () Bool)

(declare-fun res!774082 () Bool)

(assert (=> b!1167569 (=> (not res!774082) (not e!663792))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75409 (_ BitVec 32)) Bool)

(assert (=> b!1167569 (= res!774082 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1167570 () Bool)

(declare-fun e!663788 () Bool)

(assert (=> b!1167570 (= e!663792 e!663788)))

(declare-fun res!774080 () Bool)

(assert (=> b!1167570 (=> (not res!774080) (not e!663788))))

(declare-fun lt!525674 () array!75409)

(assert (=> b!1167570 (= res!774080 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!525674 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1167570 (= lt!525674 (array!75410 (store (arr!36349 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36886 _keys!1208)))))

(declare-fun b!1167571 () Bool)

(declare-fun res!774079 () Bool)

(assert (=> b!1167571 (=> (not res!774079) (not e!663792))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1167571 (= res!774079 (validMask!0 mask!1564))))

(declare-fun b!1167572 () Bool)

(declare-fun res!774086 () Bool)

(assert (=> b!1167572 (=> (not res!774086) (not e!663792))))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1167572 (= res!774086 (= (select (arr!36349 _keys!1208) i!673) k0!934))))

(declare-fun b!1167574 () Bool)

(declare-fun e!663786 () Bool)

(declare-fun e!663793 () Bool)

(assert (=> b!1167574 (= e!663786 (and e!663793 mapRes!45719))))

(declare-fun condMapEmpty!45719 () Bool)

(declare-fun mapDefault!45719 () ValueCell!13922)

(assert (=> b!1167574 (= condMapEmpty!45719 (= (arr!36348 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13922)) mapDefault!45719)))))

(declare-fun res!774084 () Bool)

(assert (=> start!99364 (=> (not res!774084) (not e!663792))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!99364 (= res!774084 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36886 _keys!1208))))))

(assert (=> start!99364 e!663792))

(declare-fun tp_is_empty!29263 () Bool)

(assert (=> start!99364 tp_is_empty!29263))

(declare-fun array_inv!27866 (array!75409) Bool)

(assert (=> start!99364 (array_inv!27866 _keys!1208)))

(assert (=> start!99364 true))

(assert (=> start!99364 tp!86910))

(declare-fun array_inv!27867 (array!75407) Bool)

(assert (=> start!99364 (and (array_inv!27867 _values!996) e!663786)))

(declare-fun b!1167573 () Bool)

(assert (=> b!1167573 (= e!663793 tp_is_empty!29263)))

(declare-fun b!1167575 () Bool)

(declare-fun res!774081 () Bool)

(assert (=> b!1167575 (=> (not res!774081) (not e!663792))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1167575 (= res!774081 (and (= (size!36885 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36886 _keys!1208) (size!36885 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1167576 () Bool)

(declare-fun e!663787 () Bool)

(assert (=> b!1167576 (= e!663788 (not e!663787))))

(declare-fun res!774085 () Bool)

(assert (=> b!1167576 (=> res!774085 e!663787)))

(assert (=> b!1167576 (= res!774085 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!75409 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1167576 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!38475 0))(
  ( (Unit!38476) )
))
(declare-fun lt!525675 () Unit!38475)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75409 (_ BitVec 64) (_ BitVec 32)) Unit!38475)

(assert (=> b!1167576 (= lt!525675 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1167577 () Bool)

(declare-fun res!774076 () Bool)

(assert (=> b!1167577 (=> (not res!774076) (not e!663788))))

(assert (=> b!1167577 (= res!774076 (arrayNoDuplicates!0 lt!525674 #b00000000000000000000000000000000 Nil!25504))))

(declare-fun b!1167578 () Bool)

(declare-fun res!774083 () Bool)

(assert (=> b!1167578 (=> (not res!774083) (not e!663792))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1167578 (= res!774083 (validKeyInArray!0 k0!934))))

(declare-fun mapIsEmpty!45719 () Bool)

(assert (=> mapIsEmpty!45719 mapRes!45719))

(declare-fun b!1167579 () Bool)

(declare-fun res!774077 () Bool)

(assert (=> b!1167579 (=> (not res!774077) (not e!663792))))

(assert (=> b!1167579 (= res!774077 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36886 _keys!1208))))))

(declare-fun b!1167580 () Bool)

(declare-fun e!663790 () Bool)

(assert (=> b!1167580 (= e!663787 e!663790)))

(declare-fun res!774078 () Bool)

(assert (=> b!1167580 (=> res!774078 e!663790)))

(assert (=> b!1167580 (= res!774078 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!44145)

(declare-datatypes ((tuple2!18768 0))(
  ( (tuple2!18769 (_1!9395 (_ BitVec 64)) (_2!9395 V!44145)) )
))
(declare-datatypes ((List!25508 0))(
  ( (Nil!25505) (Cons!25504 (h!26722 tuple2!18768) (t!37225 List!25508)) )
))
(declare-datatypes ((ListLongMap!16745 0))(
  ( (ListLongMap!16746 (toList!8388 List!25508)) )
))
(declare-fun lt!525679 () ListLongMap!16745)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!525676 () array!75407)

(declare-fun minValue!944 () V!44145)

(declare-fun getCurrentListMapNoExtraKeys!4879 (array!75409 array!75407 (_ BitVec 32) (_ BitVec 32) V!44145 V!44145 (_ BitVec 32) Int) ListLongMap!16745)

(assert (=> b!1167580 (= lt!525679 (getCurrentListMapNoExtraKeys!4879 lt!525674 lt!525676 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2868 (Int (_ BitVec 64)) V!44145)

(assert (=> b!1167580 (= lt!525676 (array!75408 (store (arr!36348 _values!996) i!673 (ValueCellFull!13922 (dynLambda!2868 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36885 _values!996)))))

(declare-fun lt!525678 () ListLongMap!16745)

(assert (=> b!1167580 (= lt!525678 (getCurrentListMapNoExtraKeys!4879 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1167581 () Bool)

(assert (=> b!1167581 (= e!663790 true)))

(declare-fun -!1452 (ListLongMap!16745 (_ BitVec 64)) ListLongMap!16745)

(assert (=> b!1167581 (= (getCurrentListMapNoExtraKeys!4879 lt!525674 lt!525676 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1452 (getCurrentListMapNoExtraKeys!4879 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun lt!525677 () Unit!38475)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!677 (array!75409 array!75407 (_ BitVec 32) (_ BitVec 32) V!44145 V!44145 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38475)

(assert (=> b!1167581 (= lt!525677 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!677 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1167582 () Bool)

(assert (=> b!1167582 (= e!663789 tp_is_empty!29263)))

(assert (= (and start!99364 res!774084) b!1167571))

(assert (= (and b!1167571 res!774079) b!1167575))

(assert (= (and b!1167575 res!774081) b!1167569))

(assert (= (and b!1167569 res!774082) b!1167568))

(assert (= (and b!1167568 res!774087) b!1167579))

(assert (= (and b!1167579 res!774077) b!1167578))

(assert (= (and b!1167578 res!774083) b!1167572))

(assert (= (and b!1167572 res!774086) b!1167570))

(assert (= (and b!1167570 res!774080) b!1167577))

(assert (= (and b!1167577 res!774076) b!1167576))

(assert (= (and b!1167576 (not res!774085)) b!1167580))

(assert (= (and b!1167580 (not res!774078)) b!1167581))

(assert (= (and b!1167574 condMapEmpty!45719) mapIsEmpty!45719))

(assert (= (and b!1167574 (not condMapEmpty!45719)) mapNonEmpty!45719))

(get-info :version)

(assert (= (and mapNonEmpty!45719 ((_ is ValueCellFull!13922) mapValue!45719)) b!1167582))

(assert (= (and b!1167574 ((_ is ValueCellFull!13922) mapDefault!45719)) b!1167573))

(assert (= start!99364 b!1167574))

(declare-fun b_lambda!19833 () Bool)

(assert (=> (not b_lambda!19833) (not b!1167580)))

(declare-fun t!37223 () Bool)

(declare-fun tb!9537 () Bool)

(assert (=> (and start!99364 (= defaultEntry!1004 defaultEntry!1004) t!37223) tb!9537))

(declare-fun result!19647 () Bool)

(assert (=> tb!9537 (= result!19647 tp_is_empty!29263)))

(assert (=> b!1167580 t!37223))

(declare-fun b_and!40319 () Bool)

(assert (= b_and!40317 (and (=> t!37223 result!19647) b_and!40319)))

(declare-fun m!1075907 () Bool)

(assert (=> b!1167570 m!1075907))

(declare-fun m!1075909 () Bool)

(assert (=> b!1167570 m!1075909))

(declare-fun m!1075911 () Bool)

(assert (=> b!1167572 m!1075911))

(declare-fun m!1075913 () Bool)

(assert (=> b!1167580 m!1075913))

(declare-fun m!1075915 () Bool)

(assert (=> b!1167580 m!1075915))

(declare-fun m!1075917 () Bool)

(assert (=> b!1167580 m!1075917))

(declare-fun m!1075919 () Bool)

(assert (=> b!1167580 m!1075919))

(declare-fun m!1075921 () Bool)

(assert (=> b!1167576 m!1075921))

(declare-fun m!1075923 () Bool)

(assert (=> b!1167576 m!1075923))

(declare-fun m!1075925 () Bool)

(assert (=> b!1167568 m!1075925))

(declare-fun m!1075927 () Bool)

(assert (=> b!1167569 m!1075927))

(declare-fun m!1075929 () Bool)

(assert (=> start!99364 m!1075929))

(declare-fun m!1075931 () Bool)

(assert (=> start!99364 m!1075931))

(declare-fun m!1075933 () Bool)

(assert (=> b!1167577 m!1075933))

(declare-fun m!1075935 () Bool)

(assert (=> b!1167571 m!1075935))

(declare-fun m!1075937 () Bool)

(assert (=> b!1167581 m!1075937))

(declare-fun m!1075939 () Bool)

(assert (=> b!1167581 m!1075939))

(assert (=> b!1167581 m!1075939))

(declare-fun m!1075941 () Bool)

(assert (=> b!1167581 m!1075941))

(declare-fun m!1075943 () Bool)

(assert (=> b!1167581 m!1075943))

(declare-fun m!1075945 () Bool)

(assert (=> mapNonEmpty!45719 m!1075945))

(declare-fun m!1075947 () Bool)

(assert (=> b!1167578 m!1075947))

(check-sat (not b!1167570) (not b_next!24733) (not b!1167580) (not b!1167581) (not start!99364) (not b!1167571) b_and!40319 (not mapNonEmpty!45719) (not b_lambda!19833) (not b!1167569) (not b!1167577) (not b!1167578) (not b!1167568) (not b!1167576) tp_is_empty!29263)
(check-sat b_and!40319 (not b_next!24733))
