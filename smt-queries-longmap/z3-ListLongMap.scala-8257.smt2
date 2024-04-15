; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100484 () Bool)

(assert start!100484)

(declare-fun b_free!25813 () Bool)

(declare-fun b_next!25813 () Bool)

(assert (=> start!100484 (= b_free!25813 (not b_next!25813))))

(declare-fun tp!90429 () Bool)

(declare-fun b_and!42491 () Bool)

(assert (=> start!100484 (= tp!90429 b_and!42491)))

(declare-fun mapNonEmpty!47618 () Bool)

(declare-fun mapRes!47618 () Bool)

(declare-fun tp!90428 () Bool)

(declare-fun e!681571 () Bool)

(assert (=> mapNonEmpty!47618 (= mapRes!47618 (and tp!90428 e!681571))))

(declare-fun mapKey!47618 () (_ BitVec 32))

(declare-datatypes ((V!45817 0))(
  ( (V!45818 (val!15315 Int)) )
))
(declare-datatypes ((ValueCell!14549 0))(
  ( (ValueCellFull!14549 (v!17952 V!45817)) (EmptyCell!14549) )
))
(declare-fun mapRest!47618 () (Array (_ BitVec 32) ValueCell!14549))

(declare-datatypes ((array!77732 0))(
  ( (array!77733 (arr!37511 (Array (_ BitVec 32) ValueCell!14549)) (size!38049 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77732)

(declare-fun mapValue!47618 () ValueCell!14549)

(assert (=> mapNonEmpty!47618 (= (arr!37511 _values!996) (store mapRest!47618 mapKey!47618 mapValue!47618))))

(declare-fun b!1200164 () Bool)

(declare-fun res!798933 () Bool)

(declare-fun e!681575 () Bool)

(assert (=> b!1200164 (=> (not res!798933) (not e!681575))))

(declare-datatypes ((array!77734 0))(
  ( (array!77735 (arr!37512 (Array (_ BitVec 32) (_ BitVec 64))) (size!38050 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77734)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1200164 (= res!798933 (= (select (arr!37512 _keys!1208) i!673) k0!934))))

(declare-fun b!1200165 () Bool)

(declare-fun res!798929 () Bool)

(assert (=> b!1200165 (=> (not res!798929) (not e!681575))))

(declare-datatypes ((List!26483 0))(
  ( (Nil!26480) (Cons!26479 (h!27688 (_ BitVec 64)) (t!39267 List!26483)) )
))
(declare-fun arrayNoDuplicates!0 (array!77734 (_ BitVec 32) List!26483) Bool)

(assert (=> b!1200165 (= res!798929 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26480))))

(declare-fun b!1200166 () Bool)

(declare-fun e!681577 () Bool)

(assert (=> b!1200166 (= e!681575 e!681577)))

(declare-fun res!798926 () Bool)

(assert (=> b!1200166 (=> (not res!798926) (not e!681577))))

(declare-fun lt!543808 () array!77734)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77734 (_ BitVec 32)) Bool)

(assert (=> b!1200166 (= res!798926 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!543808 mask!1564))))

(assert (=> b!1200166 (= lt!543808 (array!77735 (store (arr!37512 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38050 _keys!1208)))))

(declare-fun b!1200167 () Bool)

(declare-fun e!681572 () Bool)

(declare-fun e!681573 () Bool)

(assert (=> b!1200167 (= e!681572 (and e!681573 mapRes!47618))))

(declare-fun condMapEmpty!47618 () Bool)

(declare-fun mapDefault!47618 () ValueCell!14549)

(assert (=> b!1200167 (= condMapEmpty!47618 (= (arr!37511 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14549)) mapDefault!47618)))))

(declare-fun res!798927 () Bool)

(assert (=> start!100484 (=> (not res!798927) (not e!681575))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!100484 (= res!798927 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38050 _keys!1208))))))

(assert (=> start!100484 e!681575))

(declare-fun tp_is_empty!30517 () Bool)

(assert (=> start!100484 tp_is_empty!30517))

(declare-fun array_inv!28702 (array!77734) Bool)

(assert (=> start!100484 (array_inv!28702 _keys!1208)))

(assert (=> start!100484 true))

(assert (=> start!100484 tp!90429))

(declare-fun array_inv!28703 (array!77732) Bool)

(assert (=> start!100484 (and (array_inv!28703 _values!996) e!681572)))

(declare-fun b!1200168 () Bool)

(declare-fun res!798930 () Bool)

(assert (=> b!1200168 (=> (not res!798930) (not e!681577))))

(assert (=> b!1200168 (= res!798930 (arrayNoDuplicates!0 lt!543808 #b00000000000000000000000000000000 Nil!26480))))

(declare-fun b!1200169 () Bool)

(assert (=> b!1200169 (= e!681571 tp_is_empty!30517)))

(declare-fun b!1200170 () Bool)

(declare-fun res!798935 () Bool)

(assert (=> b!1200170 (=> (not res!798935) (not e!681575))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1200170 (= res!798935 (validKeyInArray!0 k0!934))))

(declare-fun b!1200171 () Bool)

(declare-fun e!681576 () Bool)

(assert (=> b!1200171 (= e!681576 (or (not (= from!1455 i!673)) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 from!1455) (size!38050 _keys!1208)) (bvslt (bvsub (size!38050 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) (bvsub (size!38050 _keys!1208) from!1455))))))

(declare-fun zeroValue!944 () V!45817)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!19692 0))(
  ( (tuple2!19693 (_1!9857 (_ BitVec 64)) (_2!9857 V!45817)) )
))
(declare-datatypes ((List!26484 0))(
  ( (Nil!26481) (Cons!26480 (h!27689 tuple2!19692) (t!39268 List!26484)) )
))
(declare-datatypes ((ListLongMap!17661 0))(
  ( (ListLongMap!17662 (toList!8846 List!26484)) )
))
(declare-fun lt!543810 () ListLongMap!17661)

(declare-fun minValue!944 () V!45817)

(declare-fun getCurrentListMapNoExtraKeys!5295 (array!77734 array!77732 (_ BitVec 32) (_ BitVec 32) V!45817 V!45817 (_ BitVec 32) Int) ListLongMap!17661)

(declare-fun dynLambda!3175 (Int (_ BitVec 64)) V!45817)

(assert (=> b!1200171 (= lt!543810 (getCurrentListMapNoExtraKeys!5295 lt!543808 (array!77733 (store (arr!37511 _values!996) i!673 (ValueCellFull!14549 (dynLambda!3175 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38049 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!543811 () ListLongMap!17661)

(assert (=> b!1200171 (= lt!543811 (getCurrentListMapNoExtraKeys!5295 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1200172 () Bool)

(assert (=> b!1200172 (= e!681577 (not e!681576))))

(declare-fun res!798934 () Bool)

(assert (=> b!1200172 (=> res!798934 e!681576)))

(assert (=> b!1200172 (= res!798934 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!77734 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1200172 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39653 0))(
  ( (Unit!39654) )
))
(declare-fun lt!543809 () Unit!39653)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77734 (_ BitVec 64) (_ BitVec 32)) Unit!39653)

(assert (=> b!1200172 (= lt!543809 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1200173 () Bool)

(declare-fun res!798932 () Bool)

(assert (=> b!1200173 (=> (not res!798932) (not e!681575))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1200173 (= res!798932 (validMask!0 mask!1564))))

(declare-fun mapIsEmpty!47618 () Bool)

(assert (=> mapIsEmpty!47618 mapRes!47618))

(declare-fun b!1200174 () Bool)

(declare-fun res!798936 () Bool)

(assert (=> b!1200174 (=> (not res!798936) (not e!681575))))

(assert (=> b!1200174 (= res!798936 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1200175 () Bool)

(declare-fun res!798931 () Bool)

(assert (=> b!1200175 (=> (not res!798931) (not e!681575))))

(assert (=> b!1200175 (= res!798931 (and (= (size!38049 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38050 _keys!1208) (size!38049 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1200176 () Bool)

(declare-fun res!798928 () Bool)

(assert (=> b!1200176 (=> (not res!798928) (not e!681575))))

(assert (=> b!1200176 (= res!798928 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38050 _keys!1208))))))

(declare-fun b!1200177 () Bool)

(assert (=> b!1200177 (= e!681573 tp_is_empty!30517)))

(assert (= (and start!100484 res!798927) b!1200173))

(assert (= (and b!1200173 res!798932) b!1200175))

(assert (= (and b!1200175 res!798931) b!1200174))

(assert (= (and b!1200174 res!798936) b!1200165))

(assert (= (and b!1200165 res!798929) b!1200176))

(assert (= (and b!1200176 res!798928) b!1200170))

(assert (= (and b!1200170 res!798935) b!1200164))

(assert (= (and b!1200164 res!798933) b!1200166))

(assert (= (and b!1200166 res!798926) b!1200168))

(assert (= (and b!1200168 res!798930) b!1200172))

(assert (= (and b!1200172 (not res!798934)) b!1200171))

(assert (= (and b!1200167 condMapEmpty!47618) mapIsEmpty!47618))

(assert (= (and b!1200167 (not condMapEmpty!47618)) mapNonEmpty!47618))

(get-info :version)

(assert (= (and mapNonEmpty!47618 ((_ is ValueCellFull!14549) mapValue!47618)) b!1200169))

(assert (= (and b!1200167 ((_ is ValueCellFull!14549) mapDefault!47618)) b!1200177))

(assert (= start!100484 b!1200167))

(declare-fun b_lambda!20991 () Bool)

(assert (=> (not b_lambda!20991) (not b!1200171)))

(declare-fun t!39266 () Bool)

(declare-fun tb!10605 () Bool)

(assert (=> (and start!100484 (= defaultEntry!1004 defaultEntry!1004) t!39266) tb!10605))

(declare-fun result!21795 () Bool)

(assert (=> tb!10605 (= result!21795 tp_is_empty!30517)))

(assert (=> b!1200171 t!39266))

(declare-fun b_and!42493 () Bool)

(assert (= b_and!42491 (and (=> t!39266 result!21795) b_and!42493)))

(declare-fun m!1106023 () Bool)

(assert (=> b!1200173 m!1106023))

(declare-fun m!1106025 () Bool)

(assert (=> b!1200172 m!1106025))

(declare-fun m!1106027 () Bool)

(assert (=> b!1200172 m!1106027))

(declare-fun m!1106029 () Bool)

(assert (=> start!100484 m!1106029))

(declare-fun m!1106031 () Bool)

(assert (=> start!100484 m!1106031))

(declare-fun m!1106033 () Bool)

(assert (=> b!1200165 m!1106033))

(declare-fun m!1106035 () Bool)

(assert (=> b!1200174 m!1106035))

(declare-fun m!1106037 () Bool)

(assert (=> b!1200168 m!1106037))

(declare-fun m!1106039 () Bool)

(assert (=> mapNonEmpty!47618 m!1106039))

(declare-fun m!1106041 () Bool)

(assert (=> b!1200164 m!1106041))

(declare-fun m!1106043 () Bool)

(assert (=> b!1200171 m!1106043))

(declare-fun m!1106045 () Bool)

(assert (=> b!1200171 m!1106045))

(declare-fun m!1106047 () Bool)

(assert (=> b!1200171 m!1106047))

(declare-fun m!1106049 () Bool)

(assert (=> b!1200171 m!1106049))

(declare-fun m!1106051 () Bool)

(assert (=> b!1200166 m!1106051))

(declare-fun m!1106053 () Bool)

(assert (=> b!1200166 m!1106053))

(declare-fun m!1106055 () Bool)

(assert (=> b!1200170 m!1106055))

(check-sat (not mapNonEmpty!47618) (not b!1200173) (not b!1200171) (not b!1200165) (not b!1200168) (not b!1200170) (not b!1200166) (not b_next!25813) b_and!42493 (not b!1200172) (not b!1200174) (not start!100484) (not b_lambda!20991) tp_is_empty!30517)
(check-sat b_and!42493 (not b_next!25813))
