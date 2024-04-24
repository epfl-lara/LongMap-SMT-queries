; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101468 () Bool)

(assert start!101468)

(declare-fun b_free!26155 () Bool)

(declare-fun b_next!26155 () Bool)

(assert (=> start!101468 (= b_free!26155 (not b_next!26155))))

(declare-fun tp!91486 () Bool)

(declare-fun b_and!43429 () Bool)

(assert (=> start!101468 (= tp!91486 b_and!43429)))

(declare-fun b!1216971 () Bool)

(declare-fun res!807700 () Bool)

(declare-fun e!691095 () Bool)

(assert (=> b!1216971 (=> (not res!807700) (not e!691095))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!78533 0))(
  ( (array!78534 (arr!37895 (Array (_ BitVec 32) (_ BitVec 64))) (size!38432 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78533)

(assert (=> b!1216971 (= res!807700 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38432 _keys!1208))))))

(declare-fun mapIsEmpty!48163 () Bool)

(declare-fun mapRes!48163 () Bool)

(assert (=> mapIsEmpty!48163 mapRes!48163))

(declare-fun b!1216972 () Bool)

(declare-fun res!807694 () Bool)

(assert (=> b!1216972 (=> (not res!807694) (not e!691095))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78533 (_ BitVec 32)) Bool)

(assert (=> b!1216972 (= res!807694 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1216973 () Bool)

(declare-fun e!691093 () Bool)

(declare-fun e!691096 () Bool)

(assert (=> b!1216973 (= e!691093 (and e!691096 mapRes!48163))))

(declare-fun condMapEmpty!48163 () Bool)

(declare-datatypes ((V!46273 0))(
  ( (V!46274 (val!15486 Int)) )
))
(declare-datatypes ((ValueCell!14720 0))(
  ( (ValueCellFull!14720 (v!18135 V!46273)) (EmptyCell!14720) )
))
(declare-datatypes ((array!78535 0))(
  ( (array!78536 (arr!37896 (Array (_ BitVec 32) ValueCell!14720)) (size!38433 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78535)

(declare-fun mapDefault!48163 () ValueCell!14720)

(assert (=> b!1216973 (= condMapEmpty!48163 (= (arr!37896 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14720)) mapDefault!48163)))))

(declare-fun b!1216974 () Bool)

(declare-fun e!691090 () Bool)

(assert (=> b!1216974 (= e!691095 e!691090)))

(declare-fun res!807703 () Bool)

(assert (=> b!1216974 (=> (not res!807703) (not e!691090))))

(declare-fun lt!553164 () array!78533)

(assert (=> b!1216974 (= res!807703 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!553164 mask!1564))))

(assert (=> b!1216974 (= lt!553164 (array!78534 (store (arr!37895 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38432 _keys!1208)))))

(declare-fun b!1216975 () Bool)

(declare-fun res!807693 () Bool)

(assert (=> b!1216975 (=> (not res!807693) (not e!691095))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1216975 (= res!807693 (validMask!0 mask!1564))))

(declare-fun b!1216976 () Bool)

(declare-fun tp_is_empty!30859 () Bool)

(assert (=> b!1216976 (= e!691096 tp_is_empty!30859)))

(declare-fun b!1216977 () Bool)

(declare-fun res!807699 () Bool)

(assert (=> b!1216977 (=> (not res!807699) (not e!691095))))

(declare-datatypes ((List!26728 0))(
  ( (Nil!26725) (Cons!26724 (h!27942 (_ BitVec 64)) (t!39855 List!26728)) )
))
(declare-fun arrayNoDuplicates!0 (array!78533 (_ BitVec 32) List!26728) Bool)

(assert (=> b!1216977 (= res!807699 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26725))))

(declare-fun b!1216978 () Bool)

(declare-fun res!807696 () Bool)

(assert (=> b!1216978 (=> (not res!807696) (not e!691095))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1216978 (= res!807696 (validKeyInArray!0 k0!934))))

(declare-fun b!1216979 () Bool)

(declare-fun res!807695 () Bool)

(assert (=> b!1216979 (=> (not res!807695) (not e!691095))))

(assert (=> b!1216979 (= res!807695 (= (select (arr!37895 _keys!1208) i!673) k0!934))))

(declare-fun b!1216980 () Bool)

(declare-fun e!691091 () Bool)

(assert (=> b!1216980 (= e!691091 true)))

(declare-fun zeroValue!944 () V!46273)

(declare-datatypes ((tuple2!19922 0))(
  ( (tuple2!19923 (_1!9972 (_ BitVec 64)) (_2!9972 V!46273)) )
))
(declare-datatypes ((List!26729 0))(
  ( (Nil!26726) (Cons!26725 (h!27943 tuple2!19922) (t!39856 List!26729)) )
))
(declare-datatypes ((ListLongMap!17899 0))(
  ( (ListLongMap!17900 (toList!8965 List!26729)) )
))
(declare-fun lt!553163 () ListLongMap!17899)

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun minValue!944 () V!46273)

(declare-fun getCurrentListMapNoExtraKeys!5422 (array!78533 array!78535 (_ BitVec 32) (_ BitVec 32) V!46273 V!46273 (_ BitVec 32) Int) ListLongMap!17899)

(declare-fun dynLambda!3334 (Int (_ BitVec 64)) V!46273)

(assert (=> b!1216980 (= lt!553163 (getCurrentListMapNoExtraKeys!5422 lt!553164 (array!78536 (store (arr!37896 _values!996) i!673 (ValueCellFull!14720 (dynLambda!3334 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38433 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!553161 () ListLongMap!17899)

(assert (=> b!1216980 (= lt!553161 (getCurrentListMapNoExtraKeys!5422 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1216981 () Bool)

(assert (=> b!1216981 (= e!691090 (not e!691091))))

(declare-fun res!807698 () Bool)

(assert (=> b!1216981 (=> res!807698 e!691091)))

(assert (=> b!1216981 (= res!807698 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!78533 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1216981 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!40284 0))(
  ( (Unit!40285) )
))
(declare-fun lt!553162 () Unit!40284)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78533 (_ BitVec 64) (_ BitVec 32)) Unit!40284)

(assert (=> b!1216981 (= lt!553162 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1216982 () Bool)

(declare-fun res!807697 () Bool)

(assert (=> b!1216982 (=> (not res!807697) (not e!691090))))

(assert (=> b!1216982 (= res!807697 (arrayNoDuplicates!0 lt!553164 #b00000000000000000000000000000000 Nil!26725))))

(declare-fun b!1216983 () Bool)

(declare-fun res!807701 () Bool)

(assert (=> b!1216983 (=> (not res!807701) (not e!691095))))

(assert (=> b!1216983 (= res!807701 (and (= (size!38433 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38432 _keys!1208) (size!38433 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1216984 () Bool)

(declare-fun e!691094 () Bool)

(assert (=> b!1216984 (= e!691094 tp_is_empty!30859)))

(declare-fun res!807702 () Bool)

(assert (=> start!101468 (=> (not res!807702) (not e!691095))))

(assert (=> start!101468 (= res!807702 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38432 _keys!1208))))))

(assert (=> start!101468 e!691095))

(assert (=> start!101468 tp_is_empty!30859))

(declare-fun array_inv!28920 (array!78533) Bool)

(assert (=> start!101468 (array_inv!28920 _keys!1208)))

(assert (=> start!101468 true))

(assert (=> start!101468 tp!91486))

(declare-fun array_inv!28921 (array!78535) Bool)

(assert (=> start!101468 (and (array_inv!28921 _values!996) e!691093)))

(declare-fun mapNonEmpty!48163 () Bool)

(declare-fun tp!91487 () Bool)

(assert (=> mapNonEmpty!48163 (= mapRes!48163 (and tp!91487 e!691094))))

(declare-fun mapRest!48163 () (Array (_ BitVec 32) ValueCell!14720))

(declare-fun mapValue!48163 () ValueCell!14720)

(declare-fun mapKey!48163 () (_ BitVec 32))

(assert (=> mapNonEmpty!48163 (= (arr!37896 _values!996) (store mapRest!48163 mapKey!48163 mapValue!48163))))

(assert (= (and start!101468 res!807702) b!1216975))

(assert (= (and b!1216975 res!807693) b!1216983))

(assert (= (and b!1216983 res!807701) b!1216972))

(assert (= (and b!1216972 res!807694) b!1216977))

(assert (= (and b!1216977 res!807699) b!1216971))

(assert (= (and b!1216971 res!807700) b!1216978))

(assert (= (and b!1216978 res!807696) b!1216979))

(assert (= (and b!1216979 res!807695) b!1216974))

(assert (= (and b!1216974 res!807703) b!1216982))

(assert (= (and b!1216982 res!807697) b!1216981))

(assert (= (and b!1216981 (not res!807698)) b!1216980))

(assert (= (and b!1216973 condMapEmpty!48163) mapIsEmpty!48163))

(assert (= (and b!1216973 (not condMapEmpty!48163)) mapNonEmpty!48163))

(get-info :version)

(assert (= (and mapNonEmpty!48163 ((_ is ValueCellFull!14720) mapValue!48163)) b!1216984))

(assert (= (and b!1216973 ((_ is ValueCellFull!14720) mapDefault!48163)) b!1216976))

(assert (= start!101468 b!1216973))

(declare-fun b_lambda!21825 () Bool)

(assert (=> (not b_lambda!21825) (not b!1216980)))

(declare-fun t!39854 () Bool)

(declare-fun tb!10947 () Bool)

(assert (=> (and start!101468 (= defaultEntry!1004 defaultEntry!1004) t!39854) tb!10947))

(declare-fun result!22499 () Bool)

(assert (=> tb!10947 (= result!22499 tp_is_empty!30859)))

(assert (=> b!1216980 t!39854))

(declare-fun b_and!43431 () Bool)

(assert (= b_and!43429 (and (=> t!39854 result!22499) b_and!43431)))

(declare-fun m!1122189 () Bool)

(assert (=> start!101468 m!1122189))

(declare-fun m!1122191 () Bool)

(assert (=> start!101468 m!1122191))

(declare-fun m!1122193 () Bool)

(assert (=> b!1216980 m!1122193))

(declare-fun m!1122195 () Bool)

(assert (=> b!1216980 m!1122195))

(declare-fun m!1122197 () Bool)

(assert (=> b!1216980 m!1122197))

(declare-fun m!1122199 () Bool)

(assert (=> b!1216980 m!1122199))

(declare-fun m!1122201 () Bool)

(assert (=> b!1216974 m!1122201))

(declare-fun m!1122203 () Bool)

(assert (=> b!1216974 m!1122203))

(declare-fun m!1122205 () Bool)

(assert (=> b!1216972 m!1122205))

(declare-fun m!1122207 () Bool)

(assert (=> b!1216981 m!1122207))

(declare-fun m!1122209 () Bool)

(assert (=> b!1216981 m!1122209))

(declare-fun m!1122211 () Bool)

(assert (=> b!1216979 m!1122211))

(declare-fun m!1122213 () Bool)

(assert (=> b!1216975 m!1122213))

(declare-fun m!1122215 () Bool)

(assert (=> b!1216978 m!1122215))

(declare-fun m!1122217 () Bool)

(assert (=> mapNonEmpty!48163 m!1122217))

(declare-fun m!1122219 () Bool)

(assert (=> b!1216982 m!1122219))

(declare-fun m!1122221 () Bool)

(assert (=> b!1216977 m!1122221))

(check-sat (not b!1216978) tp_is_empty!30859 (not b!1216977) (not b_next!26155) (not start!101468) (not b_lambda!21825) (not b!1216982) (not b!1216974) (not mapNonEmpty!48163) (not b!1216975) (not b!1216981) (not b!1216980) (not b!1216972) b_and!43431)
(check-sat b_and!43431 (not b_next!26155))
