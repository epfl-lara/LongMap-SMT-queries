; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96318 () Bool)

(assert start!96318)

(declare-fun b_free!22735 () Bool)

(declare-fun b_next!22735 () Bool)

(assert (=> start!96318 (= b_free!22735 (not b_next!22735))))

(declare-fun tp!80054 () Bool)

(declare-fun b_and!36155 () Bool)

(assert (=> start!96318 (= tp!80054 b_and!36155)))

(declare-fun b!1091246 () Bool)

(declare-fun e!623364 () Bool)

(declare-fun e!623363 () Bool)

(assert (=> b!1091246 (= e!623364 e!623363)))

(declare-fun res!727591 () Bool)

(assert (=> b!1091246 (=> res!727591 e!623363)))

(declare-fun k0!904 () (_ BitVec 64))

(assert (=> b!1091246 (= res!727591 (= #b1000000000000000000000000000000000000000000000000000000000000000 k0!904))))

(declare-datatypes ((V!40777 0))(
  ( (V!40778 (val!13425 Int)) )
))
(declare-datatypes ((tuple2!17070 0))(
  ( (tuple2!17071 (_1!8546 (_ BitVec 64)) (_2!8546 V!40777)) )
))
(declare-datatypes ((List!23662 0))(
  ( (Nil!23659) (Cons!23658 (h!24876 tuple2!17070) (t!33447 List!23662)) )
))
(declare-datatypes ((ListLongMap!15047 0))(
  ( (ListLongMap!15048 (toList!7539 List!23662)) )
))
(declare-fun lt!486596 () ListLongMap!15047)

(declare-fun lt!486593 () ListLongMap!15047)

(assert (=> b!1091246 (= lt!486596 lt!486593)))

(declare-fun lt!486600 () ListLongMap!15047)

(declare-fun lt!486589 () tuple2!17070)

(declare-fun +!3357 (ListLongMap!15047 tuple2!17070) ListLongMap!15047)

(assert (=> b!1091246 (= lt!486593 (+!3357 lt!486600 lt!486589))))

(declare-fun lt!486599 () ListLongMap!15047)

(declare-fun lt!486594 () ListLongMap!15047)

(assert (=> b!1091246 (= lt!486599 lt!486594)))

(declare-fun lt!486595 () ListLongMap!15047)

(assert (=> b!1091246 (= lt!486594 (+!3357 lt!486595 lt!486589))))

(declare-fun lt!486588 () ListLongMap!15047)

(assert (=> b!1091246 (= lt!486599 (+!3357 lt!486588 lt!486589))))

(declare-fun minValue!831 () V!40777)

(assert (=> b!1091246 (= lt!486589 (tuple2!17071 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(declare-fun b!1091247 () Bool)

(declare-fun e!623362 () Bool)

(declare-fun e!623369 () Bool)

(assert (=> b!1091247 (= e!623362 e!623369)))

(declare-fun res!727592 () Bool)

(assert (=> b!1091247 (=> (not res!727592) (not e!623369))))

(declare-datatypes ((array!70433 0))(
  ( (array!70434 (arr!33884 (Array (_ BitVec 32) (_ BitVec 64))) (size!34421 (_ BitVec 32))) )
))
(declare-fun lt!486592 () array!70433)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70433 (_ BitVec 32)) Bool)

(assert (=> b!1091247 (= res!727592 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!486592 mask!1414))))

(declare-fun _keys!1070 () array!70433)

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1091247 (= lt!486592 (array!70434 (store (arr!33884 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34421 _keys!1070)))))

(declare-fun res!727590 () Bool)

(assert (=> start!96318 (=> (not res!727590) (not e!623362))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96318 (= res!727590 (validMask!0 mask!1414))))

(assert (=> start!96318 e!623362))

(assert (=> start!96318 tp!80054))

(assert (=> start!96318 true))

(declare-fun tp_is_empty!26737 () Bool)

(assert (=> start!96318 tp_is_empty!26737))

(declare-fun array_inv!26182 (array!70433) Bool)

(assert (=> start!96318 (array_inv!26182 _keys!1070)))

(declare-datatypes ((ValueCell!12659 0))(
  ( (ValueCellFull!12659 (v!16042 V!40777)) (EmptyCell!12659) )
))
(declare-datatypes ((array!70435 0))(
  ( (array!70436 (arr!33885 (Array (_ BitVec 32) ValueCell!12659)) (size!34422 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70435)

(declare-fun e!623365 () Bool)

(declare-fun array_inv!26183 (array!70435) Bool)

(assert (=> start!96318 (and (array_inv!26183 _values!874) e!623365)))

(declare-fun b!1091248 () Bool)

(declare-fun res!727585 () Bool)

(assert (=> b!1091248 (=> (not res!727585) (not e!623362))))

(assert (=> b!1091248 (= res!727585 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34421 _keys!1070))))))

(declare-fun b!1091249 () Bool)

(declare-fun res!727583 () Bool)

(assert (=> b!1091249 (=> (not res!727583) (not e!623362))))

(declare-datatypes ((List!23663 0))(
  ( (Nil!23660) (Cons!23659 (h!24877 (_ BitVec 64)) (t!33448 List!23663)) )
))
(declare-fun arrayNoDuplicates!0 (array!70433 (_ BitVec 32) List!23663) Bool)

(assert (=> b!1091249 (= res!727583 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23660))))

(declare-fun b!1091250 () Bool)

(assert (=> b!1091250 (= e!623363 true)))

(declare-fun -!847 (ListLongMap!15047 (_ BitVec 64)) ListLongMap!15047)

(assert (=> b!1091250 (= (-!847 lt!486593 k0!904) lt!486594)))

(declare-datatypes ((Unit!35861 0))(
  ( (Unit!35862) )
))
(declare-fun lt!486598 () Unit!35861)

(declare-fun addRemoveCommutativeForDiffKeys!83 (ListLongMap!15047 (_ BitVec 64) V!40777 (_ BitVec 64)) Unit!35861)

(assert (=> b!1091250 (= lt!486598 (addRemoveCommutativeForDiffKeys!83 lt!486600 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831 k0!904))))

(declare-fun b!1091251 () Bool)

(declare-fun res!727589 () Bool)

(assert (=> b!1091251 (=> (not res!727589) (not e!623362))))

(assert (=> b!1091251 (= res!727589 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1091252 () Bool)

(declare-fun e!623366 () Bool)

(declare-fun mapRes!41860 () Bool)

(assert (=> b!1091252 (= e!623365 (and e!623366 mapRes!41860))))

(declare-fun condMapEmpty!41860 () Bool)

(declare-fun mapDefault!41860 () ValueCell!12659)

(assert (=> b!1091252 (= condMapEmpty!41860 (= (arr!33885 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12659)) mapDefault!41860)))))

(declare-fun b!1091253 () Bool)

(declare-fun res!727587 () Bool)

(assert (=> b!1091253 (=> (not res!727587) (not e!623362))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1091253 (= res!727587 (validKeyInArray!0 k0!904))))

(declare-fun b!1091254 () Bool)

(assert (=> b!1091254 (= e!623366 tp_is_empty!26737)))

(declare-fun b!1091255 () Bool)

(declare-fun e!623367 () Bool)

(assert (=> b!1091255 (= e!623367 tp_is_empty!26737)))

(declare-fun b!1091256 () Bool)

(declare-fun res!727584 () Bool)

(assert (=> b!1091256 (=> (not res!727584) (not e!623362))))

(assert (=> b!1091256 (= res!727584 (= (select (arr!33884 _keys!1070) i!650) k0!904))))

(declare-fun b!1091257 () Bool)

(declare-fun res!727593 () Bool)

(assert (=> b!1091257 (=> (not res!727593) (not e!623369))))

(assert (=> b!1091257 (= res!727593 (arrayNoDuplicates!0 lt!486592 #b00000000000000000000000000000000 Nil!23660))))

(declare-fun mapIsEmpty!41860 () Bool)

(assert (=> mapIsEmpty!41860 mapRes!41860))

(declare-fun b!1091258 () Bool)

(declare-fun res!727586 () Bool)

(assert (=> b!1091258 (=> (not res!727586) (not e!623362))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1091258 (= res!727586 (and (= (size!34422 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34421 _keys!1070) (size!34422 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1091259 () Bool)

(assert (=> b!1091259 (= e!623369 (not e!623364))))

(declare-fun res!727588 () Bool)

(assert (=> b!1091259 (=> res!727588 e!623364)))

(assert (=> b!1091259 (= res!727588 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun zeroValue!831 () V!40777)

(declare-fun getCurrentListMap!4294 (array!70433 array!70435 (_ BitVec 32) (_ BitVec 32) V!40777 V!40777 (_ BitVec 32) Int) ListLongMap!15047)

(assert (=> b!1091259 (= lt!486596 (getCurrentListMap!4294 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!486591 () array!70435)

(assert (=> b!1091259 (= lt!486599 (getCurrentListMap!4294 lt!486592 lt!486591 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> b!1091259 (and (= lt!486588 lt!486595) (= lt!486595 lt!486588))))

(assert (=> b!1091259 (= lt!486595 (-!847 lt!486600 k0!904))))

(declare-fun lt!486590 () Unit!35861)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!123 (array!70433 array!70435 (_ BitVec 32) (_ BitVec 32) V!40777 V!40777 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35861)

(assert (=> b!1091259 (= lt!486590 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!123 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4099 (array!70433 array!70435 (_ BitVec 32) (_ BitVec 32) V!40777 V!40777 (_ BitVec 32) Int) ListLongMap!15047)

(assert (=> b!1091259 (= lt!486588 (getCurrentListMapNoExtraKeys!4099 lt!486592 lt!486591 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2220 (Int (_ BitVec 64)) V!40777)

(assert (=> b!1091259 (= lt!486591 (array!70436 (store (arr!33885 _values!874) i!650 (ValueCellFull!12659 (dynLambda!2220 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34422 _values!874)))))

(assert (=> b!1091259 (= lt!486600 (getCurrentListMapNoExtraKeys!4099 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70433 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1091259 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!486597 () Unit!35861)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70433 (_ BitVec 64) (_ BitVec 32)) Unit!35861)

(assert (=> b!1091259 (= lt!486597 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun mapNonEmpty!41860 () Bool)

(declare-fun tp!80053 () Bool)

(assert (=> mapNonEmpty!41860 (= mapRes!41860 (and tp!80053 e!623367))))

(declare-fun mapValue!41860 () ValueCell!12659)

(declare-fun mapKey!41860 () (_ BitVec 32))

(declare-fun mapRest!41860 () (Array (_ BitVec 32) ValueCell!12659))

(assert (=> mapNonEmpty!41860 (= (arr!33885 _values!874) (store mapRest!41860 mapKey!41860 mapValue!41860))))

(assert (= (and start!96318 res!727590) b!1091258))

(assert (= (and b!1091258 res!727586) b!1091251))

(assert (= (and b!1091251 res!727589) b!1091249))

(assert (= (and b!1091249 res!727583) b!1091248))

(assert (= (and b!1091248 res!727585) b!1091253))

(assert (= (and b!1091253 res!727587) b!1091256))

(assert (= (and b!1091256 res!727584) b!1091247))

(assert (= (and b!1091247 res!727592) b!1091257))

(assert (= (and b!1091257 res!727593) b!1091259))

(assert (= (and b!1091259 (not res!727588)) b!1091246))

(assert (= (and b!1091246 (not res!727591)) b!1091250))

(assert (= (and b!1091252 condMapEmpty!41860) mapIsEmpty!41860))

(assert (= (and b!1091252 (not condMapEmpty!41860)) mapNonEmpty!41860))

(get-info :version)

(assert (= (and mapNonEmpty!41860 ((_ is ValueCellFull!12659) mapValue!41860)) b!1091255))

(assert (= (and b!1091252 ((_ is ValueCellFull!12659) mapDefault!41860)) b!1091254))

(assert (= start!96318 b!1091252))

(declare-fun b_lambda!17415 () Bool)

(assert (=> (not b_lambda!17415) (not b!1091259)))

(declare-fun t!33446 () Bool)

(declare-fun tb!7605 () Bool)

(assert (=> (and start!96318 (= defaultEntry!882 defaultEntry!882) t!33446) tb!7605))

(declare-fun result!15737 () Bool)

(assert (=> tb!7605 (= result!15737 tp_is_empty!26737)))

(assert (=> b!1091259 t!33446))

(declare-fun b_and!36157 () Bool)

(assert (= b_and!36155 (and (=> t!33446 result!15737) b_and!36157)))

(declare-fun m!1010903 () Bool)

(assert (=> b!1091246 m!1010903))

(declare-fun m!1010905 () Bool)

(assert (=> b!1091246 m!1010905))

(declare-fun m!1010907 () Bool)

(assert (=> b!1091246 m!1010907))

(declare-fun m!1010909 () Bool)

(assert (=> mapNonEmpty!41860 m!1010909))

(declare-fun m!1010911 () Bool)

(assert (=> b!1091250 m!1010911))

(declare-fun m!1010913 () Bool)

(assert (=> b!1091250 m!1010913))

(declare-fun m!1010915 () Bool)

(assert (=> b!1091249 m!1010915))

(declare-fun m!1010917 () Bool)

(assert (=> b!1091259 m!1010917))

(declare-fun m!1010919 () Bool)

(assert (=> b!1091259 m!1010919))

(declare-fun m!1010921 () Bool)

(assert (=> b!1091259 m!1010921))

(declare-fun m!1010923 () Bool)

(assert (=> b!1091259 m!1010923))

(declare-fun m!1010925 () Bool)

(assert (=> b!1091259 m!1010925))

(declare-fun m!1010927 () Bool)

(assert (=> b!1091259 m!1010927))

(declare-fun m!1010929 () Bool)

(assert (=> b!1091259 m!1010929))

(declare-fun m!1010931 () Bool)

(assert (=> b!1091259 m!1010931))

(declare-fun m!1010933 () Bool)

(assert (=> b!1091259 m!1010933))

(declare-fun m!1010935 () Bool)

(assert (=> b!1091259 m!1010935))

(declare-fun m!1010937 () Bool)

(assert (=> start!96318 m!1010937))

(declare-fun m!1010939 () Bool)

(assert (=> start!96318 m!1010939))

(declare-fun m!1010941 () Bool)

(assert (=> start!96318 m!1010941))

(declare-fun m!1010943 () Bool)

(assert (=> b!1091257 m!1010943))

(declare-fun m!1010945 () Bool)

(assert (=> b!1091247 m!1010945))

(declare-fun m!1010947 () Bool)

(assert (=> b!1091247 m!1010947))

(declare-fun m!1010949 () Bool)

(assert (=> b!1091251 m!1010949))

(declare-fun m!1010951 () Bool)

(assert (=> b!1091256 m!1010951))

(declare-fun m!1010953 () Bool)

(assert (=> b!1091253 m!1010953))

(check-sat (not mapNonEmpty!41860) (not b!1091253) (not start!96318) (not b!1091257) (not b!1091259) (not b_lambda!17415) (not b!1091251) (not b!1091246) (not b!1091249) (not b_next!22735) b_and!36157 (not b!1091250) (not b!1091247) tp_is_empty!26737)
(check-sat b_and!36157 (not b_next!22735))
