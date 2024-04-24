; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98032 () Bool)

(assert start!98032)

(declare-fun b_free!23497 () Bool)

(declare-fun b_next!23497 () Bool)

(assert (=> start!98032 (= b_free!23497 (not b_next!23497))))

(declare-fun tp!83195 () Bool)

(declare-fun b_and!37787 () Bool)

(assert (=> start!98032 (= tp!83195 b_and!37787)))

(declare-fun b!1120185 () Bool)

(declare-fun e!638115 () Bool)

(declare-fun e!638112 () Bool)

(assert (=> b!1120185 (= e!638115 (not e!638112))))

(declare-fun res!747846 () Bool)

(assert (=> b!1120185 (=> res!747846 e!638112)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1120185 (= res!747846 (bvsgt from!1455 i!673))))

(declare-datatypes ((array!72991 0))(
  ( (array!72992 (arr!35142 (Array (_ BitVec 32) (_ BitVec 64))) (size!35679 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72991)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!72991 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1120185 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36701 0))(
  ( (Unit!36702) )
))
(declare-fun lt!498109 () Unit!36701)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72991 (_ BitVec 64) (_ BitVec 32)) Unit!36701)

(assert (=> b!1120185 (= lt!498109 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1120186 () Bool)

(declare-fun res!747837 () Bool)

(declare-fun e!638111 () Bool)

(assert (=> b!1120186 (=> (not res!747837) (not e!638111))))

(declare-datatypes ((List!24458 0))(
  ( (Nil!24455) (Cons!24454 (h!25672 (_ BitVec 64)) (t!34939 List!24458)) )
))
(declare-fun arrayNoDuplicates!0 (array!72991 (_ BitVec 32) List!24458) Bool)

(assert (=> b!1120186 (= res!747837 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24455))))

(declare-fun res!747841 () Bool)

(assert (=> start!98032 (=> (not res!747841) (not e!638111))))

(assert (=> start!98032 (= res!747841 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35679 _keys!1208))))))

(assert (=> start!98032 e!638111))

(declare-fun tp_is_empty!28027 () Bool)

(assert (=> start!98032 tp_is_empty!28027))

(declare-fun array_inv!27058 (array!72991) Bool)

(assert (=> start!98032 (array_inv!27058 _keys!1208)))

(assert (=> start!98032 true))

(assert (=> start!98032 tp!83195))

(declare-datatypes ((V!42497 0))(
  ( (V!42498 (val!14070 Int)) )
))
(declare-datatypes ((ValueCell!13304 0))(
  ( (ValueCellFull!13304 (v!16699 V!42497)) (EmptyCell!13304) )
))
(declare-datatypes ((array!72993 0))(
  ( (array!72994 (arr!35143 (Array (_ BitVec 32) ValueCell!13304)) (size!35680 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72993)

(declare-fun e!638109 () Bool)

(declare-fun array_inv!27059 (array!72993) Bool)

(assert (=> start!98032 (and (array_inv!27059 _values!996) e!638109)))

(declare-fun b!1120187 () Bool)

(declare-fun res!747839 () Bool)

(assert (=> b!1120187 (=> (not res!747839) (not e!638111))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1120187 (= res!747839 (validMask!0 mask!1564))))

(declare-fun b!1120188 () Bool)

(declare-fun res!747847 () Bool)

(assert (=> b!1120188 (=> (not res!747847) (not e!638111))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72991 (_ BitVec 32)) Bool)

(assert (=> b!1120188 (= res!747847 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1120189 () Bool)

(declare-fun e!638114 () Bool)

(declare-fun mapRes!43858 () Bool)

(assert (=> b!1120189 (= e!638109 (and e!638114 mapRes!43858))))

(declare-fun condMapEmpty!43858 () Bool)

(declare-fun mapDefault!43858 () ValueCell!13304)

(assert (=> b!1120189 (= condMapEmpty!43858 (= (arr!35143 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13304)) mapDefault!43858)))))

(declare-fun b!1120190 () Bool)

(assert (=> b!1120190 (= e!638112 true)))

(declare-fun zeroValue!944 () V!42497)

(declare-fun lt!498112 () array!72991)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!17668 0))(
  ( (tuple2!17669 (_1!8845 (_ BitVec 64)) (_2!8845 V!42497)) )
))
(declare-datatypes ((List!24459 0))(
  ( (Nil!24456) (Cons!24455 (h!25673 tuple2!17668) (t!34940 List!24459)) )
))
(declare-datatypes ((ListLongMap!15645 0))(
  ( (ListLongMap!15646 (toList!7838 List!24459)) )
))
(declare-fun lt!498110 () ListLongMap!15645)

(declare-fun minValue!944 () V!42497)

(declare-fun getCurrentListMapNoExtraKeys!4368 (array!72991 array!72993 (_ BitVec 32) (_ BitVec 32) V!42497 V!42497 (_ BitVec 32) Int) ListLongMap!15645)

(declare-fun dynLambda!2457 (Int (_ BitVec 64)) V!42497)

(assert (=> b!1120190 (= lt!498110 (getCurrentListMapNoExtraKeys!4368 lt!498112 (array!72994 (store (arr!35143 _values!996) i!673 (ValueCellFull!13304 (dynLambda!2457 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35680 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!498111 () ListLongMap!15645)

(assert (=> b!1120190 (= lt!498111 (getCurrentListMapNoExtraKeys!4368 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1120191 () Bool)

(declare-fun res!747840 () Bool)

(assert (=> b!1120191 (=> (not res!747840) (not e!638111))))

(assert (=> b!1120191 (= res!747840 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35679 _keys!1208))))))

(declare-fun mapIsEmpty!43858 () Bool)

(assert (=> mapIsEmpty!43858 mapRes!43858))

(declare-fun b!1120192 () Bool)

(declare-fun e!638110 () Bool)

(assert (=> b!1120192 (= e!638110 tp_is_empty!28027)))

(declare-fun b!1120193 () Bool)

(declare-fun res!747838 () Bool)

(assert (=> b!1120193 (=> (not res!747838) (not e!638115))))

(assert (=> b!1120193 (= res!747838 (arrayNoDuplicates!0 lt!498112 #b00000000000000000000000000000000 Nil!24455))))

(declare-fun b!1120194 () Bool)

(assert (=> b!1120194 (= e!638114 tp_is_empty!28027)))

(declare-fun b!1120195 () Bool)

(assert (=> b!1120195 (= e!638111 e!638115)))

(declare-fun res!747843 () Bool)

(assert (=> b!1120195 (=> (not res!747843) (not e!638115))))

(assert (=> b!1120195 (= res!747843 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!498112 mask!1564))))

(assert (=> b!1120195 (= lt!498112 (array!72992 (store (arr!35142 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35679 _keys!1208)))))

(declare-fun b!1120196 () Bool)

(declare-fun res!747842 () Bool)

(assert (=> b!1120196 (=> (not res!747842) (not e!638111))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1120196 (= res!747842 (validKeyInArray!0 k0!934))))

(declare-fun b!1120197 () Bool)

(declare-fun res!747845 () Bool)

(assert (=> b!1120197 (=> (not res!747845) (not e!638111))))

(assert (=> b!1120197 (= res!747845 (= (select (arr!35142 _keys!1208) i!673) k0!934))))

(declare-fun mapNonEmpty!43858 () Bool)

(declare-fun tp!83194 () Bool)

(assert (=> mapNonEmpty!43858 (= mapRes!43858 (and tp!83194 e!638110))))

(declare-fun mapRest!43858 () (Array (_ BitVec 32) ValueCell!13304))

(declare-fun mapKey!43858 () (_ BitVec 32))

(declare-fun mapValue!43858 () ValueCell!13304)

(assert (=> mapNonEmpty!43858 (= (arr!35143 _values!996) (store mapRest!43858 mapKey!43858 mapValue!43858))))

(declare-fun b!1120198 () Bool)

(declare-fun res!747844 () Bool)

(assert (=> b!1120198 (=> (not res!747844) (not e!638111))))

(assert (=> b!1120198 (= res!747844 (and (= (size!35680 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35679 _keys!1208) (size!35680 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(assert (= (and start!98032 res!747841) b!1120187))

(assert (= (and b!1120187 res!747839) b!1120198))

(assert (= (and b!1120198 res!747844) b!1120188))

(assert (= (and b!1120188 res!747847) b!1120186))

(assert (= (and b!1120186 res!747837) b!1120191))

(assert (= (and b!1120191 res!747840) b!1120196))

(assert (= (and b!1120196 res!747842) b!1120197))

(assert (= (and b!1120197 res!747845) b!1120195))

(assert (= (and b!1120195 res!747843) b!1120193))

(assert (= (and b!1120193 res!747838) b!1120185))

(assert (= (and b!1120185 (not res!747846)) b!1120190))

(assert (= (and b!1120189 condMapEmpty!43858) mapIsEmpty!43858))

(assert (= (and b!1120189 (not condMapEmpty!43858)) mapNonEmpty!43858))

(get-info :version)

(assert (= (and mapNonEmpty!43858 ((_ is ValueCellFull!13304) mapValue!43858)) b!1120192))

(assert (= (and b!1120189 ((_ is ValueCellFull!13304) mapDefault!43858)) b!1120194))

(assert (= start!98032 b!1120189))

(declare-fun b_lambda!18477 () Bool)

(assert (=> (not b_lambda!18477) (not b!1120190)))

(declare-fun t!34938 () Bool)

(declare-fun tb!8301 () Bool)

(assert (=> (and start!98032 (= defaultEntry!1004 defaultEntry!1004) t!34938) tb!8301))

(declare-fun result!17171 () Bool)

(assert (=> tb!8301 (= result!17171 tp_is_empty!28027)))

(assert (=> b!1120190 t!34938))

(declare-fun b_and!37789 () Bool)

(assert (= b_and!37787 (and (=> t!34938 result!17171) b_and!37789)))

(declare-fun m!1035945 () Bool)

(assert (=> start!98032 m!1035945))

(declare-fun m!1035947 () Bool)

(assert (=> start!98032 m!1035947))

(declare-fun m!1035949 () Bool)

(assert (=> mapNonEmpty!43858 m!1035949))

(declare-fun m!1035951 () Bool)

(assert (=> b!1120188 m!1035951))

(declare-fun m!1035953 () Bool)

(assert (=> b!1120196 m!1035953))

(declare-fun m!1035955 () Bool)

(assert (=> b!1120186 m!1035955))

(declare-fun m!1035957 () Bool)

(assert (=> b!1120193 m!1035957))

(declare-fun m!1035959 () Bool)

(assert (=> b!1120185 m!1035959))

(declare-fun m!1035961 () Bool)

(assert (=> b!1120185 m!1035961))

(declare-fun m!1035963 () Bool)

(assert (=> b!1120195 m!1035963))

(declare-fun m!1035965 () Bool)

(assert (=> b!1120195 m!1035965))

(declare-fun m!1035967 () Bool)

(assert (=> b!1120197 m!1035967))

(declare-fun m!1035969 () Bool)

(assert (=> b!1120187 m!1035969))

(declare-fun m!1035971 () Bool)

(assert (=> b!1120190 m!1035971))

(declare-fun m!1035973 () Bool)

(assert (=> b!1120190 m!1035973))

(declare-fun m!1035975 () Bool)

(assert (=> b!1120190 m!1035975))

(declare-fun m!1035977 () Bool)

(assert (=> b!1120190 m!1035977))

(check-sat (not b!1120195) (not b!1120196) (not b!1120188) b_and!37789 (not b!1120187) (not b!1120186) (not b_next!23497) (not b_lambda!18477) (not mapNonEmpty!43858) tp_is_empty!28027 (not b!1120193) (not b!1120190) (not start!98032) (not b!1120185))
(check-sat b_and!37789 (not b_next!23497))
