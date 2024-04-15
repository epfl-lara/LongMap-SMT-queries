; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100430 () Bool)

(assert start!100430)

(declare-fun b_free!25759 () Bool)

(declare-fun b_next!25759 () Bool)

(assert (=> start!100430 (= b_free!25759 (not b_next!25759))))

(declare-fun tp!90267 () Bool)

(declare-fun b_and!42383 () Bool)

(assert (=> start!100430 (= tp!90267 b_and!42383)))

(declare-fun b!1198976 () Bool)

(declare-fun res!798044 () Bool)

(declare-fun e!681008 () Bool)

(assert (=> b!1198976 (=> (not res!798044) (not e!681008))))

(declare-datatypes ((array!77630 0))(
  ( (array!77631 (arr!37460 (Array (_ BitVec 32) (_ BitVec 64))) (size!37998 (_ BitVec 32))) )
))
(declare-fun lt!543487 () array!77630)

(declare-datatypes ((List!26445 0))(
  ( (Nil!26442) (Cons!26441 (h!27650 (_ BitVec 64)) (t!39175 List!26445)) )
))
(declare-fun arrayNoDuplicates!0 (array!77630 (_ BitVec 32) List!26445) Bool)

(assert (=> b!1198976 (= res!798044 (arrayNoDuplicates!0 lt!543487 #b00000000000000000000000000000000 Nil!26442))))

(declare-fun mapIsEmpty!47537 () Bool)

(declare-fun mapRes!47537 () Bool)

(assert (=> mapIsEmpty!47537 mapRes!47537))

(declare-fun res!798035 () Bool)

(declare-fun e!681005 () Bool)

(assert (=> start!100430 (=> (not res!798035) (not e!681005))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun _keys!1208 () array!77630)

(assert (=> start!100430 (= res!798035 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37998 _keys!1208))))))

(assert (=> start!100430 e!681005))

(declare-fun tp_is_empty!30463 () Bool)

(assert (=> start!100430 tp_is_empty!30463))

(declare-fun array_inv!28668 (array!77630) Bool)

(assert (=> start!100430 (array_inv!28668 _keys!1208)))

(assert (=> start!100430 true))

(assert (=> start!100430 tp!90267))

(declare-datatypes ((V!45745 0))(
  ( (V!45746 (val!15288 Int)) )
))
(declare-datatypes ((ValueCell!14522 0))(
  ( (ValueCellFull!14522 (v!17925 V!45745)) (EmptyCell!14522) )
))
(declare-datatypes ((array!77632 0))(
  ( (array!77633 (arr!37461 (Array (_ BitVec 32) ValueCell!14522)) (size!37999 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77632)

(declare-fun e!681004 () Bool)

(declare-fun array_inv!28669 (array!77632) Bool)

(assert (=> start!100430 (and (array_inv!28669 _values!996) e!681004)))

(declare-fun b!1198977 () Bool)

(declare-fun res!798039 () Bool)

(assert (=> b!1198977 (=> (not res!798039) (not e!681005))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1198977 (= res!798039 (validMask!0 mask!1564))))

(declare-fun b!1198978 () Bool)

(declare-fun res!798040 () Bool)

(assert (=> b!1198978 (=> (not res!798040) (not e!681005))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1198978 (= res!798040 (= (select (arr!37460 _keys!1208) i!673) k0!934))))

(declare-fun mapNonEmpty!47537 () Bool)

(declare-fun tp!90266 () Bool)

(declare-fun e!681006 () Bool)

(assert (=> mapNonEmpty!47537 (= mapRes!47537 (and tp!90266 e!681006))))

(declare-fun mapValue!47537 () ValueCell!14522)

(declare-fun mapRest!47537 () (Array (_ BitVec 32) ValueCell!14522))

(declare-fun mapKey!47537 () (_ BitVec 32))

(assert (=> mapNonEmpty!47537 (= (arr!37461 _values!996) (store mapRest!47537 mapKey!47537 mapValue!47537))))

(declare-fun b!1198979 () Bool)

(declare-fun e!681007 () Bool)

(assert (=> b!1198979 (= e!681008 (not e!681007))))

(declare-fun res!798041 () Bool)

(assert (=> b!1198979 (=> res!798041 e!681007)))

(assert (=> b!1198979 (= res!798041 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!77630 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1198979 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39619 0))(
  ( (Unit!39620) )
))
(declare-fun lt!543485 () Unit!39619)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77630 (_ BitVec 64) (_ BitVec 32)) Unit!39619)

(assert (=> b!1198979 (= lt!543485 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1198980 () Bool)

(declare-fun res!798043 () Bool)

(assert (=> b!1198980 (=> (not res!798043) (not e!681005))))

(assert (=> b!1198980 (= res!798043 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26442))))

(declare-fun b!1198981 () Bool)

(declare-fun e!681010 () Bool)

(assert (=> b!1198981 (= e!681004 (and e!681010 mapRes!47537))))

(declare-fun condMapEmpty!47537 () Bool)

(declare-fun mapDefault!47537 () ValueCell!14522)

(assert (=> b!1198981 (= condMapEmpty!47537 (= (arr!37461 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14522)) mapDefault!47537)))))

(declare-fun b!1198982 () Bool)

(assert (=> b!1198982 (= e!681010 tp_is_empty!30463)))

(declare-fun b!1198983 () Bool)

(declare-fun res!798038 () Bool)

(assert (=> b!1198983 (=> (not res!798038) (not e!681005))))

(assert (=> b!1198983 (= res!798038 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37998 _keys!1208))))))

(declare-fun b!1198984 () Bool)

(assert (=> b!1198984 (= e!681005 e!681008)))

(declare-fun res!798037 () Bool)

(assert (=> b!1198984 (=> (not res!798037) (not e!681008))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77630 (_ BitVec 32)) Bool)

(assert (=> b!1198984 (= res!798037 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!543487 mask!1564))))

(assert (=> b!1198984 (= lt!543487 (array!77631 (store (arr!37460 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37998 _keys!1208)))))

(declare-fun b!1198985 () Bool)

(declare-fun res!798036 () Bool)

(assert (=> b!1198985 (=> (not res!798036) (not e!681005))))

(assert (=> b!1198985 (= res!798036 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1198986 () Bool)

(declare-fun res!798045 () Bool)

(assert (=> b!1198986 (=> (not res!798045) (not e!681005))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1198986 (= res!798045 (and (= (size!37999 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37998 _keys!1208) (size!37999 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1198987 () Bool)

(assert (=> b!1198987 (= e!681007 true)))

(declare-fun zeroValue!944 () V!45745)

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!19656 0))(
  ( (tuple2!19657 (_1!9839 (_ BitVec 64)) (_2!9839 V!45745)) )
))
(declare-datatypes ((List!26446 0))(
  ( (Nil!26443) (Cons!26442 (h!27651 tuple2!19656) (t!39176 List!26446)) )
))
(declare-datatypes ((ListLongMap!17625 0))(
  ( (ListLongMap!17626 (toList!8828 List!26446)) )
))
(declare-fun lt!543484 () ListLongMap!17625)

(declare-fun minValue!944 () V!45745)

(declare-fun getCurrentListMapNoExtraKeys!5277 (array!77630 array!77632 (_ BitVec 32) (_ BitVec 32) V!45745 V!45745 (_ BitVec 32) Int) ListLongMap!17625)

(declare-fun dynLambda!3157 (Int (_ BitVec 64)) V!45745)

(assert (=> b!1198987 (= lt!543484 (getCurrentListMapNoExtraKeys!5277 lt!543487 (array!77633 (store (arr!37461 _values!996) i!673 (ValueCellFull!14522 (dynLambda!3157 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37999 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!543486 () ListLongMap!17625)

(assert (=> b!1198987 (= lt!543486 (getCurrentListMapNoExtraKeys!5277 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1198988 () Bool)

(assert (=> b!1198988 (= e!681006 tp_is_empty!30463)))

(declare-fun b!1198989 () Bool)

(declare-fun res!798042 () Bool)

(assert (=> b!1198989 (=> (not res!798042) (not e!681005))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1198989 (= res!798042 (validKeyInArray!0 k0!934))))

(assert (= (and start!100430 res!798035) b!1198977))

(assert (= (and b!1198977 res!798039) b!1198986))

(assert (= (and b!1198986 res!798045) b!1198985))

(assert (= (and b!1198985 res!798036) b!1198980))

(assert (= (and b!1198980 res!798043) b!1198983))

(assert (= (and b!1198983 res!798038) b!1198989))

(assert (= (and b!1198989 res!798042) b!1198978))

(assert (= (and b!1198978 res!798040) b!1198984))

(assert (= (and b!1198984 res!798037) b!1198976))

(assert (= (and b!1198976 res!798044) b!1198979))

(assert (= (and b!1198979 (not res!798041)) b!1198987))

(assert (= (and b!1198981 condMapEmpty!47537) mapIsEmpty!47537))

(assert (= (and b!1198981 (not condMapEmpty!47537)) mapNonEmpty!47537))

(get-info :version)

(assert (= (and mapNonEmpty!47537 ((_ is ValueCellFull!14522) mapValue!47537)) b!1198988))

(assert (= (and b!1198981 ((_ is ValueCellFull!14522) mapDefault!47537)) b!1198982))

(assert (= start!100430 b!1198981))

(declare-fun b_lambda!20937 () Bool)

(assert (=> (not b_lambda!20937) (not b!1198987)))

(declare-fun t!39174 () Bool)

(declare-fun tb!10551 () Bool)

(assert (=> (and start!100430 (= defaultEntry!1004 defaultEntry!1004) t!39174) tb!10551))

(declare-fun result!21687 () Bool)

(assert (=> tb!10551 (= result!21687 tp_is_empty!30463)))

(assert (=> b!1198987 t!39174))

(declare-fun b_and!42385 () Bool)

(assert (= b_and!42383 (and (=> t!39174 result!21687) b_and!42385)))

(declare-fun m!1105105 () Bool)

(assert (=> b!1198987 m!1105105))

(declare-fun m!1105107 () Bool)

(assert (=> b!1198987 m!1105107))

(declare-fun m!1105109 () Bool)

(assert (=> b!1198987 m!1105109))

(declare-fun m!1105111 () Bool)

(assert (=> b!1198987 m!1105111))

(declare-fun m!1105113 () Bool)

(assert (=> b!1198979 m!1105113))

(declare-fun m!1105115 () Bool)

(assert (=> b!1198979 m!1105115))

(declare-fun m!1105117 () Bool)

(assert (=> b!1198985 m!1105117))

(declare-fun m!1105119 () Bool)

(assert (=> mapNonEmpty!47537 m!1105119))

(declare-fun m!1105121 () Bool)

(assert (=> b!1198989 m!1105121))

(declare-fun m!1105123 () Bool)

(assert (=> b!1198980 m!1105123))

(declare-fun m!1105125 () Bool)

(assert (=> b!1198984 m!1105125))

(declare-fun m!1105127 () Bool)

(assert (=> b!1198984 m!1105127))

(declare-fun m!1105129 () Bool)

(assert (=> b!1198976 m!1105129))

(declare-fun m!1105131 () Bool)

(assert (=> start!100430 m!1105131))

(declare-fun m!1105133 () Bool)

(assert (=> start!100430 m!1105133))

(declare-fun m!1105135 () Bool)

(assert (=> b!1198978 m!1105135))

(declare-fun m!1105137 () Bool)

(assert (=> b!1198977 m!1105137))

(check-sat (not b!1198979) (not b!1198989) (not b!1198984) (not b!1198987) (not b!1198980) (not b!1198976) (not start!100430) (not b!1198985) tp_is_empty!30463 b_and!42385 (not b_next!25759) (not b!1198977) (not mapNonEmpty!47537) (not b_lambda!20937))
(check-sat b_and!42385 (not b_next!25759))
