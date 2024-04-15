; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99032 () Bool)

(assert start!99032)

(declare-fun b_free!24643 () Bool)

(declare-fun b_next!24643 () Bool)

(assert (=> start!99032 (= b_free!24643 (not b_next!24643))))

(declare-fun tp!86639 () Bool)

(declare-fun b_and!40113 () Bool)

(assert (=> start!99032 (= tp!86639 b_and!40113)))

(declare-fun b!1164146 () Bool)

(declare-fun res!771991 () Bool)

(declare-fun e!661904 () Bool)

(assert (=> b!1164146 (=> (not res!771991) (not e!661904))))

(declare-datatypes ((array!75102 0))(
  ( (array!75103 (arr!36202 (Array (_ BitVec 32) (_ BitVec 64))) (size!36740 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75102)

(declare-datatypes ((List!25474 0))(
  ( (Nil!25471) (Cons!25470 (h!26679 (_ BitVec 64)) (t!37100 List!25474)) )
))
(declare-fun arrayNoDuplicates!0 (array!75102 (_ BitVec 32) List!25474) Bool)

(assert (=> b!1164146 (= res!771991 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25471))))

(declare-fun b!1164147 () Bool)

(declare-fun e!661902 () Bool)

(assert (=> b!1164147 (= e!661904 e!661902)))

(declare-fun res!771992 () Bool)

(assert (=> b!1164147 (=> (not res!771992) (not e!661902))))

(declare-fun lt!524400 () array!75102)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75102 (_ BitVec 32)) Bool)

(assert (=> b!1164147 (= res!771992 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!524400 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1164147 (= lt!524400 (array!75103 (store (arr!36202 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36740 _keys!1208)))))

(declare-fun b!1164148 () Bool)

(declare-fun e!661907 () Bool)

(declare-fun tp_is_empty!29173 () Bool)

(assert (=> b!1164148 (= e!661907 tp_is_empty!29173)))

(declare-fun res!771998 () Bool)

(assert (=> start!99032 (=> (not res!771998) (not e!661904))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!99032 (= res!771998 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36740 _keys!1208))))))

(assert (=> start!99032 e!661904))

(assert (=> start!99032 tp_is_empty!29173))

(declare-fun array_inv!27800 (array!75102) Bool)

(assert (=> start!99032 (array_inv!27800 _keys!1208)))

(assert (=> start!99032 true))

(assert (=> start!99032 tp!86639))

(declare-datatypes ((V!44025 0))(
  ( (V!44026 (val!14643 Int)) )
))
(declare-datatypes ((ValueCell!13877 0))(
  ( (ValueCellFull!13877 (v!17279 V!44025)) (EmptyCell!13877) )
))
(declare-datatypes ((array!75104 0))(
  ( (array!75105 (arr!36203 (Array (_ BitVec 32) ValueCell!13877)) (size!36741 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75104)

(declare-fun e!661905 () Bool)

(declare-fun array_inv!27801 (array!75104) Bool)

(assert (=> start!99032 (and (array_inv!27801 _values!996) e!661905)))

(declare-fun b!1164149 () Bool)

(declare-fun res!771993 () Bool)

(assert (=> b!1164149 (=> (not res!771993) (not e!661904))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1164149 (= res!771993 (validMask!0 mask!1564))))

(declare-fun b!1164150 () Bool)

(declare-fun e!661903 () Bool)

(assert (=> b!1164150 (= e!661902 (not e!661903))))

(declare-fun res!771996 () Bool)

(assert (=> b!1164150 (=> res!771996 e!661903)))

(assert (=> b!1164150 (= res!771996 (bvsgt from!1455 i!673))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!75102 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1164150 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!38257 0))(
  ( (Unit!38258) )
))
(declare-fun lt!524401 () Unit!38257)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75102 (_ BitVec 64) (_ BitVec 32)) Unit!38257)

(assert (=> b!1164150 (= lt!524401 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1164151 () Bool)

(declare-fun e!661908 () Bool)

(assert (=> b!1164151 (= e!661908 tp_is_empty!29173)))

(declare-fun b!1164152 () Bool)

(declare-fun res!771990 () Bool)

(assert (=> b!1164152 (=> (not res!771990) (not e!661904))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1164152 (= res!771990 (validKeyInArray!0 k0!934))))

(declare-fun mapNonEmpty!45584 () Bool)

(declare-fun mapRes!45584 () Bool)

(declare-fun tp!86640 () Bool)

(assert (=> mapNonEmpty!45584 (= mapRes!45584 (and tp!86640 e!661908))))

(declare-fun mapValue!45584 () ValueCell!13877)

(declare-fun mapRest!45584 () (Array (_ BitVec 32) ValueCell!13877))

(declare-fun mapKey!45584 () (_ BitVec 32))

(assert (=> mapNonEmpty!45584 (= (arr!36203 _values!996) (store mapRest!45584 mapKey!45584 mapValue!45584))))

(declare-fun b!1164153 () Bool)

(declare-fun res!771988 () Bool)

(assert (=> b!1164153 (=> (not res!771988) (not e!661902))))

(assert (=> b!1164153 (= res!771988 (arrayNoDuplicates!0 lt!524400 #b00000000000000000000000000000000 Nil!25471))))

(declare-fun b!1164154 () Bool)

(declare-fun res!771994 () Bool)

(assert (=> b!1164154 (=> (not res!771994) (not e!661904))))

(assert (=> b!1164154 (= res!771994 (= (select (arr!36202 _keys!1208) i!673) k0!934))))

(declare-fun b!1164155 () Bool)

(assert (=> b!1164155 (= e!661903 true)))

(declare-fun zeroValue!944 () V!44025)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((tuple2!18756 0))(
  ( (tuple2!18757 (_1!9389 (_ BitVec 64)) (_2!9389 V!44025)) )
))
(declare-datatypes ((List!25475 0))(
  ( (Nil!25472) (Cons!25471 (h!26680 tuple2!18756) (t!37101 List!25475)) )
))
(declare-datatypes ((ListLongMap!16725 0))(
  ( (ListLongMap!16726 (toList!8378 List!25475)) )
))
(declare-fun lt!524403 () ListLongMap!16725)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!44025)

(declare-fun getCurrentListMapNoExtraKeys!4854 (array!75102 array!75104 (_ BitVec 32) (_ BitVec 32) V!44025 V!44025 (_ BitVec 32) Int) ListLongMap!16725)

(declare-fun dynLambda!2787 (Int (_ BitVec 64)) V!44025)

(assert (=> b!1164155 (= lt!524403 (getCurrentListMapNoExtraKeys!4854 lt!524400 (array!75105 (store (arr!36203 _values!996) i!673 (ValueCellFull!13877 (dynLambda!2787 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36741 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!524402 () ListLongMap!16725)

(assert (=> b!1164155 (= lt!524402 (getCurrentListMapNoExtraKeys!4854 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1164156 () Bool)

(assert (=> b!1164156 (= e!661905 (and e!661907 mapRes!45584))))

(declare-fun condMapEmpty!45584 () Bool)

(declare-fun mapDefault!45584 () ValueCell!13877)

(assert (=> b!1164156 (= condMapEmpty!45584 (= (arr!36203 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13877)) mapDefault!45584)))))

(declare-fun b!1164157 () Bool)

(declare-fun res!771995 () Bool)

(assert (=> b!1164157 (=> (not res!771995) (not e!661904))))

(assert (=> b!1164157 (= res!771995 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1164158 () Bool)

(declare-fun res!771989 () Bool)

(assert (=> b!1164158 (=> (not res!771989) (not e!661904))))

(assert (=> b!1164158 (= res!771989 (and (= (size!36741 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36740 _keys!1208) (size!36741 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1164159 () Bool)

(declare-fun res!771997 () Bool)

(assert (=> b!1164159 (=> (not res!771997) (not e!661904))))

(assert (=> b!1164159 (= res!771997 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36740 _keys!1208))))))

(declare-fun mapIsEmpty!45584 () Bool)

(assert (=> mapIsEmpty!45584 mapRes!45584))

(assert (= (and start!99032 res!771998) b!1164149))

(assert (= (and b!1164149 res!771993) b!1164158))

(assert (= (and b!1164158 res!771989) b!1164157))

(assert (= (and b!1164157 res!771995) b!1164146))

(assert (= (and b!1164146 res!771991) b!1164159))

(assert (= (and b!1164159 res!771997) b!1164152))

(assert (= (and b!1164152 res!771990) b!1164154))

(assert (= (and b!1164154 res!771994) b!1164147))

(assert (= (and b!1164147 res!771992) b!1164153))

(assert (= (and b!1164153 res!771988) b!1164150))

(assert (= (and b!1164150 (not res!771996)) b!1164155))

(assert (= (and b!1164156 condMapEmpty!45584) mapIsEmpty!45584))

(assert (= (and b!1164156 (not condMapEmpty!45584)) mapNonEmpty!45584))

(get-info :version)

(assert (= (and mapNonEmpty!45584 ((_ is ValueCellFull!13877) mapValue!45584)) b!1164151))

(assert (= (and b!1164156 ((_ is ValueCellFull!13877) mapDefault!45584)) b!1164148))

(assert (= start!99032 b!1164156))

(declare-fun b_lambda!19731 () Bool)

(assert (=> (not b_lambda!19731) (not b!1164155)))

(declare-fun t!37099 () Bool)

(declare-fun tb!9447 () Bool)

(assert (=> (and start!99032 (= defaultEntry!1004 defaultEntry!1004) t!37099) tb!9447))

(declare-fun result!19467 () Bool)

(assert (=> tb!9447 (= result!19467 tp_is_empty!29173)))

(assert (=> b!1164155 t!37099))

(declare-fun b_and!40115 () Bool)

(assert (= b_and!40113 (and (=> t!37099 result!19467) b_and!40115)))

(declare-fun m!1072123 () Bool)

(assert (=> b!1164157 m!1072123))

(declare-fun m!1072125 () Bool)

(assert (=> b!1164146 m!1072125))

(declare-fun m!1072127 () Bool)

(assert (=> b!1164149 m!1072127))

(declare-fun m!1072129 () Bool)

(assert (=> mapNonEmpty!45584 m!1072129))

(declare-fun m!1072131 () Bool)

(assert (=> b!1164152 m!1072131))

(declare-fun m!1072133 () Bool)

(assert (=> b!1164154 m!1072133))

(declare-fun m!1072135 () Bool)

(assert (=> b!1164147 m!1072135))

(declare-fun m!1072137 () Bool)

(assert (=> b!1164147 m!1072137))

(declare-fun m!1072139 () Bool)

(assert (=> b!1164150 m!1072139))

(declare-fun m!1072141 () Bool)

(assert (=> b!1164150 m!1072141))

(declare-fun m!1072143 () Bool)

(assert (=> b!1164155 m!1072143))

(declare-fun m!1072145 () Bool)

(assert (=> b!1164155 m!1072145))

(declare-fun m!1072147 () Bool)

(assert (=> b!1164155 m!1072147))

(declare-fun m!1072149 () Bool)

(assert (=> b!1164155 m!1072149))

(declare-fun m!1072151 () Bool)

(assert (=> start!99032 m!1072151))

(declare-fun m!1072153 () Bool)

(assert (=> start!99032 m!1072153))

(declare-fun m!1072155 () Bool)

(assert (=> b!1164153 m!1072155))

(check-sat (not start!99032) (not b!1164147) (not mapNonEmpty!45584) (not b!1164152) (not b!1164146) (not b!1164157) tp_is_empty!29173 (not b_next!24643) (not b!1164153) (not b_lambda!19731) (not b!1164149) (not b!1164150) (not b!1164155) b_and!40115)
(check-sat b_and!40115 (not b_next!24643))
