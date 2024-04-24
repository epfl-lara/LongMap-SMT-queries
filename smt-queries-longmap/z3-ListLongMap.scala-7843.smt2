; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98038 () Bool)

(assert start!98038)

(declare-fun b_free!23503 () Bool)

(declare-fun b_next!23503 () Bool)

(assert (=> start!98038 (= b_free!23503 (not b_next!23503))))

(declare-fun tp!83212 () Bool)

(declare-fun b_and!37799 () Bool)

(assert (=> start!98038 (= tp!83212 b_and!37799)))

(declare-fun b!1120317 () Bool)

(declare-fun e!638178 () Bool)

(declare-fun e!638175 () Bool)

(declare-fun mapRes!43867 () Bool)

(assert (=> b!1120317 (= e!638178 (and e!638175 mapRes!43867))))

(declare-fun condMapEmpty!43867 () Bool)

(declare-datatypes ((V!42505 0))(
  ( (V!42506 (val!14073 Int)) )
))
(declare-datatypes ((ValueCell!13307 0))(
  ( (ValueCellFull!13307 (v!16702 V!42505)) (EmptyCell!13307) )
))
(declare-datatypes ((array!73001 0))(
  ( (array!73002 (arr!35147 (Array (_ BitVec 32) ValueCell!13307)) (size!35684 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73001)

(declare-fun mapDefault!43867 () ValueCell!13307)

(assert (=> b!1120317 (= condMapEmpty!43867 (= (arr!35147 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13307)) mapDefault!43867)))))

(declare-fun b!1120318 () Bool)

(declare-fun tp_is_empty!28033 () Bool)

(assert (=> b!1120318 (= e!638175 tp_is_empty!28033)))

(declare-fun b!1120319 () Bool)

(declare-fun res!747936 () Bool)

(declare-fun e!638176 () Bool)

(assert (=> b!1120319 (=> (not res!747936) (not e!638176))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1120319 (= res!747936 (validMask!0 mask!1564))))

(declare-fun b!1120320 () Bool)

(declare-fun res!747937 () Bool)

(assert (=> b!1120320 (=> (not res!747937) (not e!638176))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!73003 0))(
  ( (array!73004 (arr!35148 (Array (_ BitVec 32) (_ BitVec 64))) (size!35685 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73003)

(assert (=> b!1120320 (= res!747937 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35685 _keys!1208))))))

(declare-fun mapNonEmpty!43867 () Bool)

(declare-fun tp!83213 () Bool)

(declare-fun e!638177 () Bool)

(assert (=> mapNonEmpty!43867 (= mapRes!43867 (and tp!83213 e!638177))))

(declare-fun mapKey!43867 () (_ BitVec 32))

(declare-fun mapValue!43867 () ValueCell!13307)

(declare-fun mapRest!43867 () (Array (_ BitVec 32) ValueCell!13307))

(assert (=> mapNonEmpty!43867 (= (arr!35147 _values!996) (store mapRest!43867 mapKey!43867 mapValue!43867))))

(declare-fun b!1120321 () Bool)

(declare-fun res!747940 () Bool)

(declare-fun e!638174 () Bool)

(assert (=> b!1120321 (=> (not res!747940) (not e!638174))))

(declare-fun lt!498146 () array!73003)

(declare-datatypes ((List!24462 0))(
  ( (Nil!24459) (Cons!24458 (h!25676 (_ BitVec 64)) (t!34949 List!24462)) )
))
(declare-fun arrayNoDuplicates!0 (array!73003 (_ BitVec 32) List!24462) Bool)

(assert (=> b!1120321 (= res!747940 (arrayNoDuplicates!0 lt!498146 #b00000000000000000000000000000000 Nil!24459))))

(declare-fun b!1120322 () Bool)

(declare-fun res!747941 () Bool)

(assert (=> b!1120322 (=> (not res!747941) (not e!638176))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1120322 (= res!747941 (validKeyInArray!0 k0!934))))

(declare-fun b!1120323 () Bool)

(declare-fun e!638172 () Bool)

(assert (=> b!1120323 (= e!638174 (not e!638172))))

(declare-fun res!747939 () Bool)

(assert (=> b!1120323 (=> res!747939 e!638172)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1120323 (= res!747939 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73003 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1120323 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36705 0))(
  ( (Unit!36706) )
))
(declare-fun lt!498148 () Unit!36705)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73003 (_ BitVec 64) (_ BitVec 32)) Unit!36705)

(assert (=> b!1120323 (= lt!498148 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1120324 () Bool)

(declare-fun res!747944 () Bool)

(assert (=> b!1120324 (=> (not res!747944) (not e!638176))))

(assert (=> b!1120324 (= res!747944 (= (select (arr!35148 _keys!1208) i!673) k0!934))))

(declare-fun b!1120325 () Bool)

(assert (=> b!1120325 (= e!638177 tp_is_empty!28033)))

(declare-fun b!1120326 () Bool)

(declare-fun res!747946 () Bool)

(assert (=> b!1120326 (=> (not res!747946) (not e!638176))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1120326 (= res!747946 (and (= (size!35684 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35685 _keys!1208) (size!35684 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1120327 () Bool)

(assert (=> b!1120327 (= e!638172 true)))

(declare-fun zeroValue!944 () V!42505)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!42505)

(declare-datatypes ((tuple2!17672 0))(
  ( (tuple2!17673 (_1!8847 (_ BitVec 64)) (_2!8847 V!42505)) )
))
(declare-datatypes ((List!24463 0))(
  ( (Nil!24460) (Cons!24459 (h!25677 tuple2!17672) (t!34950 List!24463)) )
))
(declare-datatypes ((ListLongMap!15649 0))(
  ( (ListLongMap!15650 (toList!7840 List!24463)) )
))
(declare-fun lt!498145 () ListLongMap!15649)

(declare-fun getCurrentListMapNoExtraKeys!4370 (array!73003 array!73001 (_ BitVec 32) (_ BitVec 32) V!42505 V!42505 (_ BitVec 32) Int) ListLongMap!15649)

(declare-fun dynLambda!2459 (Int (_ BitVec 64)) V!42505)

(assert (=> b!1120327 (= lt!498145 (getCurrentListMapNoExtraKeys!4370 lt!498146 (array!73002 (store (arr!35147 _values!996) i!673 (ValueCellFull!13307 (dynLambda!2459 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35684 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!498147 () ListLongMap!15649)

(assert (=> b!1120327 (= lt!498147 (getCurrentListMapNoExtraKeys!4370 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1120328 () Bool)

(assert (=> b!1120328 (= e!638176 e!638174)))

(declare-fun res!747938 () Bool)

(assert (=> b!1120328 (=> (not res!747938) (not e!638174))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73003 (_ BitVec 32)) Bool)

(assert (=> b!1120328 (= res!747938 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!498146 mask!1564))))

(assert (=> b!1120328 (= lt!498146 (array!73004 (store (arr!35148 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35685 _keys!1208)))))

(declare-fun b!1120329 () Bool)

(declare-fun res!747945 () Bool)

(assert (=> b!1120329 (=> (not res!747945) (not e!638176))))

(assert (=> b!1120329 (= res!747945 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24459))))

(declare-fun mapIsEmpty!43867 () Bool)

(assert (=> mapIsEmpty!43867 mapRes!43867))

(declare-fun res!747942 () Bool)

(assert (=> start!98038 (=> (not res!747942) (not e!638176))))

(assert (=> start!98038 (= res!747942 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35685 _keys!1208))))))

(assert (=> start!98038 e!638176))

(assert (=> start!98038 tp_is_empty!28033))

(declare-fun array_inv!27062 (array!73003) Bool)

(assert (=> start!98038 (array_inv!27062 _keys!1208)))

(assert (=> start!98038 true))

(assert (=> start!98038 tp!83212))

(declare-fun array_inv!27063 (array!73001) Bool)

(assert (=> start!98038 (and (array_inv!27063 _values!996) e!638178)))

(declare-fun b!1120330 () Bool)

(declare-fun res!747943 () Bool)

(assert (=> b!1120330 (=> (not res!747943) (not e!638176))))

(assert (=> b!1120330 (= res!747943 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(assert (= (and start!98038 res!747942) b!1120319))

(assert (= (and b!1120319 res!747936) b!1120326))

(assert (= (and b!1120326 res!747946) b!1120330))

(assert (= (and b!1120330 res!747943) b!1120329))

(assert (= (and b!1120329 res!747945) b!1120320))

(assert (= (and b!1120320 res!747937) b!1120322))

(assert (= (and b!1120322 res!747941) b!1120324))

(assert (= (and b!1120324 res!747944) b!1120328))

(assert (= (and b!1120328 res!747938) b!1120321))

(assert (= (and b!1120321 res!747940) b!1120323))

(assert (= (and b!1120323 (not res!747939)) b!1120327))

(assert (= (and b!1120317 condMapEmpty!43867) mapIsEmpty!43867))

(assert (= (and b!1120317 (not condMapEmpty!43867)) mapNonEmpty!43867))

(get-info :version)

(assert (= (and mapNonEmpty!43867 ((_ is ValueCellFull!13307) mapValue!43867)) b!1120325))

(assert (= (and b!1120317 ((_ is ValueCellFull!13307) mapDefault!43867)) b!1120318))

(assert (= start!98038 b!1120317))

(declare-fun b_lambda!18483 () Bool)

(assert (=> (not b_lambda!18483) (not b!1120327)))

(declare-fun t!34948 () Bool)

(declare-fun tb!8307 () Bool)

(assert (=> (and start!98038 (= defaultEntry!1004 defaultEntry!1004) t!34948) tb!8307))

(declare-fun result!17183 () Bool)

(assert (=> tb!8307 (= result!17183 tp_is_empty!28033)))

(assert (=> b!1120327 t!34948))

(declare-fun b_and!37801 () Bool)

(assert (= b_and!37799 (and (=> t!34948 result!17183) b_and!37801)))

(declare-fun m!1036047 () Bool)

(assert (=> start!98038 m!1036047))

(declare-fun m!1036049 () Bool)

(assert (=> start!98038 m!1036049))

(declare-fun m!1036051 () Bool)

(assert (=> b!1120328 m!1036051))

(declare-fun m!1036053 () Bool)

(assert (=> b!1120328 m!1036053))

(declare-fun m!1036055 () Bool)

(assert (=> b!1120324 m!1036055))

(declare-fun m!1036057 () Bool)

(assert (=> b!1120329 m!1036057))

(declare-fun m!1036059 () Bool)

(assert (=> b!1120323 m!1036059))

(declare-fun m!1036061 () Bool)

(assert (=> b!1120323 m!1036061))

(declare-fun m!1036063 () Bool)

(assert (=> b!1120322 m!1036063))

(declare-fun m!1036065 () Bool)

(assert (=> b!1120319 m!1036065))

(declare-fun m!1036067 () Bool)

(assert (=> b!1120327 m!1036067))

(declare-fun m!1036069 () Bool)

(assert (=> b!1120327 m!1036069))

(declare-fun m!1036071 () Bool)

(assert (=> b!1120327 m!1036071))

(declare-fun m!1036073 () Bool)

(assert (=> b!1120327 m!1036073))

(declare-fun m!1036075 () Bool)

(assert (=> mapNonEmpty!43867 m!1036075))

(declare-fun m!1036077 () Bool)

(assert (=> b!1120321 m!1036077))

(declare-fun m!1036079 () Bool)

(assert (=> b!1120330 m!1036079))

(check-sat b_and!37801 (not b!1120322) (not start!98038) (not b_next!23503) (not b!1120329) (not b!1120321) (not b!1120328) tp_is_empty!28033 (not b!1120330) (not b!1120319) (not b!1120323) (not b_lambda!18483) (not mapNonEmpty!43867) (not b!1120327))
(check-sat b_and!37801 (not b_next!23503))
