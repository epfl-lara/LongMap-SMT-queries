; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99106 () Bool)

(assert start!99106)

(declare-fun b_free!24711 () Bool)

(declare-fun b_next!24711 () Bool)

(assert (=> start!99106 (= b_free!24711 (not b_next!24711))))

(declare-fun tp!86843 () Bool)

(declare-fun b_and!40271 () Bool)

(assert (=> start!99106 (= tp!86843 b_and!40271)))

(declare-fun b!1165766 () Bool)

(declare-fun e!662696 () Bool)

(declare-fun e!662699 () Bool)

(declare-fun mapRes!45686 () Bool)

(assert (=> b!1165766 (= e!662696 (and e!662699 mapRes!45686))))

(declare-fun condMapEmpty!45686 () Bool)

(declare-datatypes ((V!44115 0))(
  ( (V!44116 (val!14677 Int)) )
))
(declare-datatypes ((ValueCell!13911 0))(
  ( (ValueCellFull!13911 (v!17314 V!44115)) (EmptyCell!13911) )
))
(declare-datatypes ((array!75313 0))(
  ( (array!75314 (arr!36307 (Array (_ BitVec 32) ValueCell!13911)) (size!36843 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75313)

(declare-fun mapDefault!45686 () ValueCell!13911)

(assert (=> b!1165766 (= condMapEmpty!45686 (= (arr!36307 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13911)) mapDefault!45686)))))

(declare-fun b!1165767 () Bool)

(declare-fun res!773178 () Bool)

(declare-fun e!662700 () Bool)

(assert (=> b!1165767 (=> (not res!773178) (not e!662700))))

(declare-datatypes ((array!75315 0))(
  ( (array!75316 (arr!36308 (Array (_ BitVec 32) (_ BitVec 64))) (size!36844 (_ BitVec 32))) )
))
(declare-fun lt!525002 () array!75315)

(declare-datatypes ((List!25453 0))(
  ( (Nil!25450) (Cons!25449 (h!26658 (_ BitVec 64)) (t!37156 List!25453)) )
))
(declare-fun arrayNoDuplicates!0 (array!75315 (_ BitVec 32) List!25453) Bool)

(assert (=> b!1165767 (= res!773178 (arrayNoDuplicates!0 lt!525002 #b00000000000000000000000000000000 Nil!25450))))

(declare-fun b!1165768 () Bool)

(declare-fun e!662694 () Bool)

(declare-fun tp_is_empty!29241 () Bool)

(assert (=> b!1165768 (= e!662694 tp_is_empty!29241)))

(declare-fun b!1165769 () Bool)

(declare-fun e!662697 () Bool)

(assert (=> b!1165769 (= e!662697 true)))

(declare-fun zeroValue!944 () V!44115)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((tuple2!18716 0))(
  ( (tuple2!18717 (_1!9369 (_ BitVec 64)) (_2!9369 V!44115)) )
))
(declare-datatypes ((List!25454 0))(
  ( (Nil!25451) (Cons!25450 (h!26659 tuple2!18716) (t!37157 List!25454)) )
))
(declare-datatypes ((ListLongMap!16685 0))(
  ( (ListLongMap!16686 (toList!8358 List!25454)) )
))
(declare-fun lt!525000 () ListLongMap!16685)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun minValue!944 () V!44115)

(declare-fun getCurrentListMapNoExtraKeys!4822 (array!75315 array!75313 (_ BitVec 32) (_ BitVec 32) V!44115 V!44115 (_ BitVec 32) Int) ListLongMap!16685)

(declare-fun dynLambda!2812 (Int (_ BitVec 64)) V!44115)

(assert (=> b!1165769 (= lt!525000 (getCurrentListMapNoExtraKeys!4822 lt!525002 (array!75314 (store (arr!36307 _values!996) i!673 (ValueCellFull!13911 (dynLambda!2812 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36843 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun _keys!1208 () array!75315)

(declare-fun lt!525001 () ListLongMap!16685)

(assert (=> b!1165769 (= lt!525001 (getCurrentListMapNoExtraKeys!4822 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun mapNonEmpty!45686 () Bool)

(declare-fun tp!86844 () Bool)

(assert (=> mapNonEmpty!45686 (= mapRes!45686 (and tp!86844 e!662694))))

(declare-fun mapValue!45686 () ValueCell!13911)

(declare-fun mapKey!45686 () (_ BitVec 32))

(declare-fun mapRest!45686 () (Array (_ BitVec 32) ValueCell!13911))

(assert (=> mapNonEmpty!45686 (= (arr!36307 _values!996) (store mapRest!45686 mapKey!45686 mapValue!45686))))

(declare-fun b!1165770 () Bool)

(declare-fun res!773179 () Bool)

(declare-fun e!662698 () Bool)

(assert (=> b!1165770 (=> (not res!773179) (not e!662698))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1165770 (= res!773179 (validMask!0 mask!1564))))

(declare-fun mapIsEmpty!45686 () Bool)

(assert (=> mapIsEmpty!45686 mapRes!45686))

(declare-fun b!1165771 () Bool)

(assert (=> b!1165771 (= e!662699 tp_is_empty!29241)))

(declare-fun b!1165772 () Bool)

(declare-fun res!773181 () Bool)

(assert (=> b!1165772 (=> (not res!773181) (not e!662698))))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1165772 (= res!773181 (= (select (arr!36308 _keys!1208) i!673) k0!934))))

(declare-fun b!1165773 () Bool)

(assert (=> b!1165773 (= e!662700 (not e!662697))))

(declare-fun res!773177 () Bool)

(assert (=> b!1165773 (=> res!773177 e!662697)))

(assert (=> b!1165773 (= res!773177 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!75315 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1165773 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!38466 0))(
  ( (Unit!38467) )
))
(declare-fun lt!525003 () Unit!38466)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75315 (_ BitVec 64) (_ BitVec 32)) Unit!38466)

(assert (=> b!1165773 (= lt!525003 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1165775 () Bool)

(declare-fun res!773183 () Bool)

(assert (=> b!1165775 (=> (not res!773183) (not e!662698))))

(assert (=> b!1165775 (= res!773183 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25450))))

(declare-fun b!1165776 () Bool)

(declare-fun res!773186 () Bool)

(assert (=> b!1165776 (=> (not res!773186) (not e!662698))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1165776 (= res!773186 (validKeyInArray!0 k0!934))))

(declare-fun b!1165777 () Bool)

(declare-fun res!773184 () Bool)

(assert (=> b!1165777 (=> (not res!773184) (not e!662698))))

(assert (=> b!1165777 (= res!773184 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36844 _keys!1208))))))

(declare-fun b!1165778 () Bool)

(declare-fun res!773185 () Bool)

(assert (=> b!1165778 (=> (not res!773185) (not e!662698))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75315 (_ BitVec 32)) Bool)

(assert (=> b!1165778 (= res!773185 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1165779 () Bool)

(assert (=> b!1165779 (= e!662698 e!662700)))

(declare-fun res!773176 () Bool)

(assert (=> b!1165779 (=> (not res!773176) (not e!662700))))

(assert (=> b!1165779 (= res!773176 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!525002 mask!1564))))

(assert (=> b!1165779 (= lt!525002 (array!75316 (store (arr!36308 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36844 _keys!1208)))))

(declare-fun res!773180 () Bool)

(assert (=> start!99106 (=> (not res!773180) (not e!662698))))

(assert (=> start!99106 (= res!773180 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36844 _keys!1208))))))

(assert (=> start!99106 e!662698))

(assert (=> start!99106 tp_is_empty!29241))

(declare-fun array_inv!27768 (array!75315) Bool)

(assert (=> start!99106 (array_inv!27768 _keys!1208)))

(assert (=> start!99106 true))

(assert (=> start!99106 tp!86843))

(declare-fun array_inv!27769 (array!75313) Bool)

(assert (=> start!99106 (and (array_inv!27769 _values!996) e!662696)))

(declare-fun b!1165774 () Bool)

(declare-fun res!773182 () Bool)

(assert (=> b!1165774 (=> (not res!773182) (not e!662698))))

(assert (=> b!1165774 (= res!773182 (and (= (size!36843 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36844 _keys!1208) (size!36843 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(assert (= (and start!99106 res!773180) b!1165770))

(assert (= (and b!1165770 res!773179) b!1165774))

(assert (= (and b!1165774 res!773182) b!1165778))

(assert (= (and b!1165778 res!773185) b!1165775))

(assert (= (and b!1165775 res!773183) b!1165777))

(assert (= (and b!1165777 res!773184) b!1165776))

(assert (= (and b!1165776 res!773186) b!1165772))

(assert (= (and b!1165772 res!773181) b!1165779))

(assert (= (and b!1165779 res!773176) b!1165767))

(assert (= (and b!1165767 res!773178) b!1165773))

(assert (= (and b!1165773 (not res!773177)) b!1165769))

(assert (= (and b!1165766 condMapEmpty!45686) mapIsEmpty!45686))

(assert (= (and b!1165766 (not condMapEmpty!45686)) mapNonEmpty!45686))

(get-info :version)

(assert (= (and mapNonEmpty!45686 ((_ is ValueCellFull!13911) mapValue!45686)) b!1165768))

(assert (= (and b!1165766 ((_ is ValueCellFull!13911) mapDefault!45686)) b!1165771))

(assert (= start!99106 b!1165766))

(declare-fun b_lambda!19817 () Bool)

(assert (=> (not b_lambda!19817) (not b!1165769)))

(declare-fun t!37155 () Bool)

(declare-fun tb!9523 () Bool)

(assert (=> (and start!99106 (= defaultEntry!1004 defaultEntry!1004) t!37155) tb!9523))

(declare-fun result!19611 () Bool)

(assert (=> tb!9523 (= result!19611 tp_is_empty!29241)))

(assert (=> b!1165769 t!37155))

(declare-fun b_and!40273 () Bool)

(assert (= b_and!40271 (and (=> t!37155 result!19611) b_and!40273)))

(declare-fun m!1073889 () Bool)

(assert (=> mapNonEmpty!45686 m!1073889))

(declare-fun m!1073891 () Bool)

(assert (=> b!1165770 m!1073891))

(declare-fun m!1073893 () Bool)

(assert (=> b!1165779 m!1073893))

(declare-fun m!1073895 () Bool)

(assert (=> b!1165779 m!1073895))

(declare-fun m!1073897 () Bool)

(assert (=> b!1165767 m!1073897))

(declare-fun m!1073899 () Bool)

(assert (=> b!1165778 m!1073899))

(declare-fun m!1073901 () Bool)

(assert (=> b!1165775 m!1073901))

(declare-fun m!1073903 () Bool)

(assert (=> b!1165773 m!1073903))

(declare-fun m!1073905 () Bool)

(assert (=> b!1165773 m!1073905))

(declare-fun m!1073907 () Bool)

(assert (=> start!99106 m!1073907))

(declare-fun m!1073909 () Bool)

(assert (=> start!99106 m!1073909))

(declare-fun m!1073911 () Bool)

(assert (=> b!1165772 m!1073911))

(declare-fun m!1073913 () Bool)

(assert (=> b!1165776 m!1073913))

(declare-fun m!1073915 () Bool)

(assert (=> b!1165769 m!1073915))

(declare-fun m!1073917 () Bool)

(assert (=> b!1165769 m!1073917))

(declare-fun m!1073919 () Bool)

(assert (=> b!1165769 m!1073919))

(declare-fun m!1073921 () Bool)

(assert (=> b!1165769 m!1073921))

(check-sat (not b!1165769) (not b!1165778) (not b_next!24711) tp_is_empty!29241 (not mapNonEmpty!45686) (not b!1165775) (not b!1165773) (not b!1165776) (not start!99106) (not b!1165767) b_and!40273 (not b!1165770) (not b_lambda!19817) (not b!1165779))
(check-sat b_and!40273 (not b_next!24711))
