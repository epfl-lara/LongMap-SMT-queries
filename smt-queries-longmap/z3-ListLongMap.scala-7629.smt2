; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96096 () Bool)

(assert start!96096)

(declare-fun b_free!22749 () Bool)

(declare-fun b_next!22749 () Bool)

(assert (=> start!96096 (= b_free!22749 (not b_next!22749))))

(declare-fun tp!80096 () Bool)

(declare-fun b_and!36173 () Bool)

(assert (=> start!96096 (= tp!80096 b_and!36173)))

(declare-fun b!1090227 () Bool)

(declare-fun res!727301 () Bool)

(declare-fun e!622682 () Bool)

(assert (=> b!1090227 (=> (not res!727301) (not e!622682))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((array!70425 0))(
  ( (array!70426 (arr!33886 (Array (_ BitVec 32) (_ BitVec 64))) (size!34422 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70425)

(declare-datatypes ((V!40795 0))(
  ( (V!40796 (val!13432 Int)) )
))
(declare-datatypes ((ValueCell!12666 0))(
  ( (ValueCellFull!12666 (v!16053 V!40795)) (EmptyCell!12666) )
))
(declare-datatypes ((array!70427 0))(
  ( (array!70428 (arr!33887 (Array (_ BitVec 32) ValueCell!12666)) (size!34423 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70427)

(assert (=> b!1090227 (= res!727301 (and (= (size!34423 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34422 _keys!1070) (size!34423 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun res!727300 () Bool)

(assert (=> start!96096 (=> (not res!727300) (not e!622682))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96096 (= res!727300 (validMask!0 mask!1414))))

(assert (=> start!96096 e!622682))

(assert (=> start!96096 tp!80096))

(assert (=> start!96096 true))

(declare-fun tp_is_empty!26751 () Bool)

(assert (=> start!96096 tp_is_empty!26751))

(declare-fun array_inv!26132 (array!70425) Bool)

(assert (=> start!96096 (array_inv!26132 _keys!1070)))

(declare-fun e!622678 () Bool)

(declare-fun array_inv!26133 (array!70427) Bool)

(assert (=> start!96096 (and (array_inv!26133 _values!874) e!622678)))

(declare-fun b!1090228 () Bool)

(declare-fun res!727296 () Bool)

(assert (=> b!1090228 (=> (not res!727296) (not e!622682))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1090228 (= res!727296 (validKeyInArray!0 k0!904))))

(declare-fun b!1090229 () Bool)

(declare-fun e!622679 () Bool)

(declare-fun e!622675 () Bool)

(assert (=> b!1090229 (= e!622679 (not e!622675))))

(declare-fun res!727297 () Bool)

(assert (=> b!1090229 (=> res!727297 e!622675)))

(assert (=> b!1090229 (= res!727297 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40795)

(declare-datatypes ((tuple2!17070 0))(
  ( (tuple2!17071 (_1!8546 (_ BitVec 64)) (_2!8546 V!40795)) )
))
(declare-datatypes ((List!23659 0))(
  ( (Nil!23656) (Cons!23655 (h!24864 tuple2!17070) (t!33466 List!23659)) )
))
(declare-datatypes ((ListLongMap!15039 0))(
  ( (ListLongMap!15040 (toList!7535 List!23659)) )
))
(declare-fun lt!486353 () ListLongMap!15039)

(declare-fun zeroValue!831 () V!40795)

(declare-fun getCurrentListMap!4303 (array!70425 array!70427 (_ BitVec 32) (_ BitVec 32) V!40795 V!40795 (_ BitVec 32) Int) ListLongMap!15039)

(assert (=> b!1090229 (= lt!486353 (getCurrentListMap!4303 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!486350 () array!70425)

(declare-fun lt!486355 () array!70427)

(declare-fun lt!486346 () ListLongMap!15039)

(assert (=> b!1090229 (= lt!486346 (getCurrentListMap!4303 lt!486350 lt!486355 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!486348 () ListLongMap!15039)

(declare-fun lt!486356 () ListLongMap!15039)

(assert (=> b!1090229 (and (= lt!486348 lt!486356) (= lt!486356 lt!486348))))

(declare-fun lt!486357 () ListLongMap!15039)

(declare-fun -!860 (ListLongMap!15039 (_ BitVec 64)) ListLongMap!15039)

(assert (=> b!1090229 (= lt!486356 (-!860 lt!486357 k0!904))))

(declare-datatypes ((Unit!35886 0))(
  ( (Unit!35887) )
))
(declare-fun lt!486358 () Unit!35886)

(declare-fun i!650 () (_ BitVec 32))

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!122 (array!70425 array!70427 (_ BitVec 32) (_ BitVec 32) V!40795 V!40795 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35886)

(assert (=> b!1090229 (= lt!486358 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!122 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4063 (array!70425 array!70427 (_ BitVec 32) (_ BitVec 32) V!40795 V!40795 (_ BitVec 32) Int) ListLongMap!15039)

(assert (=> b!1090229 (= lt!486348 (getCurrentListMapNoExtraKeys!4063 lt!486350 lt!486355 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2200 (Int (_ BitVec 64)) V!40795)

(assert (=> b!1090229 (= lt!486355 (array!70428 (store (arr!33887 _values!874) i!650 (ValueCellFull!12666 (dynLambda!2200 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34423 _values!874)))))

(assert (=> b!1090229 (= lt!486357 (getCurrentListMapNoExtraKeys!4063 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70425 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1090229 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!486347 () Unit!35886)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70425 (_ BitVec 64) (_ BitVec 32)) Unit!35886)

(assert (=> b!1090229 (= lt!486347 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1090230 () Bool)

(declare-fun e!622676 () Bool)

(declare-fun mapRes!41881 () Bool)

(assert (=> b!1090230 (= e!622678 (and e!622676 mapRes!41881))))

(declare-fun condMapEmpty!41881 () Bool)

(declare-fun mapDefault!41881 () ValueCell!12666)

(assert (=> b!1090230 (= condMapEmpty!41881 (= (arr!33887 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12666)) mapDefault!41881)))))

(declare-fun b!1090231 () Bool)

(declare-fun e!622681 () Bool)

(assert (=> b!1090231 (= e!622681 true)))

(declare-fun lt!486349 () ListLongMap!15039)

(declare-fun lt!486352 () ListLongMap!15039)

(assert (=> b!1090231 (= (-!860 lt!486349 k0!904) lt!486352)))

(declare-fun lt!486351 () Unit!35886)

(declare-fun addRemoveCommutativeForDiffKeys!84 (ListLongMap!15039 (_ BitVec 64) V!40795 (_ BitVec 64)) Unit!35886)

(assert (=> b!1090231 (= lt!486351 (addRemoveCommutativeForDiffKeys!84 lt!486357 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831 k0!904))))

(declare-fun b!1090232 () Bool)

(declare-fun res!727295 () Bool)

(assert (=> b!1090232 (=> (not res!727295) (not e!622682))))

(assert (=> b!1090232 (= res!727295 (= (select (arr!33886 _keys!1070) i!650) k0!904))))

(declare-fun b!1090233 () Bool)

(assert (=> b!1090233 (= e!622675 e!622681)))

(declare-fun res!727293 () Bool)

(assert (=> b!1090233 (=> res!727293 e!622681)))

(assert (=> b!1090233 (= res!727293 (= #b1000000000000000000000000000000000000000000000000000000000000000 k0!904))))

(assert (=> b!1090233 (= lt!486353 lt!486349)))

(declare-fun lt!486354 () tuple2!17070)

(declare-fun +!3324 (ListLongMap!15039 tuple2!17070) ListLongMap!15039)

(assert (=> b!1090233 (= lt!486349 (+!3324 lt!486357 lt!486354))))

(assert (=> b!1090233 (= lt!486346 lt!486352)))

(assert (=> b!1090233 (= lt!486352 (+!3324 lt!486356 lt!486354))))

(assert (=> b!1090233 (= lt!486346 (+!3324 lt!486348 lt!486354))))

(assert (=> b!1090233 (= lt!486354 (tuple2!17071 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(declare-fun mapNonEmpty!41881 () Bool)

(declare-fun tp!80095 () Bool)

(declare-fun e!622677 () Bool)

(assert (=> mapNonEmpty!41881 (= mapRes!41881 (and tp!80095 e!622677))))

(declare-fun mapValue!41881 () ValueCell!12666)

(declare-fun mapRest!41881 () (Array (_ BitVec 32) ValueCell!12666))

(declare-fun mapKey!41881 () (_ BitVec 32))

(assert (=> mapNonEmpty!41881 (= (arr!33887 _values!874) (store mapRest!41881 mapKey!41881 mapValue!41881))))

(declare-fun mapIsEmpty!41881 () Bool)

(assert (=> mapIsEmpty!41881 mapRes!41881))

(declare-fun b!1090234 () Bool)

(declare-fun res!727299 () Bool)

(assert (=> b!1090234 (=> (not res!727299) (not e!622682))))

(declare-datatypes ((List!23660 0))(
  ( (Nil!23657) (Cons!23656 (h!24865 (_ BitVec 64)) (t!33467 List!23660)) )
))
(declare-fun arrayNoDuplicates!0 (array!70425 (_ BitVec 32) List!23660) Bool)

(assert (=> b!1090234 (= res!727299 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23657))))

(declare-fun b!1090235 () Bool)

(assert (=> b!1090235 (= e!622676 tp_is_empty!26751)))

(declare-fun b!1090236 () Bool)

(assert (=> b!1090236 (= e!622682 e!622679)))

(declare-fun res!727298 () Bool)

(assert (=> b!1090236 (=> (not res!727298) (not e!622679))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70425 (_ BitVec 32)) Bool)

(assert (=> b!1090236 (= res!727298 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!486350 mask!1414))))

(assert (=> b!1090236 (= lt!486350 (array!70426 (store (arr!33886 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34422 _keys!1070)))))

(declare-fun b!1090237 () Bool)

(declare-fun res!727294 () Bool)

(assert (=> b!1090237 (=> (not res!727294) (not e!622682))))

(assert (=> b!1090237 (= res!727294 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1090238 () Bool)

(assert (=> b!1090238 (= e!622677 tp_is_empty!26751)))

(declare-fun b!1090239 () Bool)

(declare-fun res!727302 () Bool)

(assert (=> b!1090239 (=> (not res!727302) (not e!622679))))

(assert (=> b!1090239 (= res!727302 (arrayNoDuplicates!0 lt!486350 #b00000000000000000000000000000000 Nil!23657))))

(declare-fun b!1090240 () Bool)

(declare-fun res!727292 () Bool)

(assert (=> b!1090240 (=> (not res!727292) (not e!622682))))

(assert (=> b!1090240 (= res!727292 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34422 _keys!1070))))))

(assert (= (and start!96096 res!727300) b!1090227))

(assert (= (and b!1090227 res!727301) b!1090237))

(assert (= (and b!1090237 res!727294) b!1090234))

(assert (= (and b!1090234 res!727299) b!1090240))

(assert (= (and b!1090240 res!727292) b!1090228))

(assert (= (and b!1090228 res!727296) b!1090232))

(assert (= (and b!1090232 res!727295) b!1090236))

(assert (= (and b!1090236 res!727298) b!1090239))

(assert (= (and b!1090239 res!727302) b!1090229))

(assert (= (and b!1090229 (not res!727297)) b!1090233))

(assert (= (and b!1090233 (not res!727293)) b!1090231))

(assert (= (and b!1090230 condMapEmpty!41881) mapIsEmpty!41881))

(assert (= (and b!1090230 (not condMapEmpty!41881)) mapNonEmpty!41881))

(get-info :version)

(assert (= (and mapNonEmpty!41881 ((_ is ValueCellFull!12666) mapValue!41881)) b!1090238))

(assert (= (and b!1090230 ((_ is ValueCellFull!12666) mapDefault!41881)) b!1090235))

(assert (= start!96096 b!1090230))

(declare-fun b_lambda!17419 () Bool)

(assert (=> (not b_lambda!17419) (not b!1090229)))

(declare-fun t!33465 () Bool)

(declare-fun tb!7627 () Bool)

(assert (=> (and start!96096 (= defaultEntry!882 defaultEntry!882) t!33465) tb!7627))

(declare-fun result!15773 () Bool)

(assert (=> tb!7627 (= result!15773 tp_is_empty!26751)))

(assert (=> b!1090229 t!33465))

(declare-fun b_and!36175 () Bool)

(assert (= b_and!36173 (and (=> t!33465 result!15773) b_and!36175)))

(declare-fun m!1009595 () Bool)

(assert (=> b!1090236 m!1009595))

(declare-fun m!1009597 () Bool)

(assert (=> b!1090236 m!1009597))

(declare-fun m!1009599 () Bool)

(assert (=> mapNonEmpty!41881 m!1009599))

(declare-fun m!1009601 () Bool)

(assert (=> b!1090231 m!1009601))

(declare-fun m!1009603 () Bool)

(assert (=> b!1090231 m!1009603))

(declare-fun m!1009605 () Bool)

(assert (=> start!96096 m!1009605))

(declare-fun m!1009607 () Bool)

(assert (=> start!96096 m!1009607))

(declare-fun m!1009609 () Bool)

(assert (=> start!96096 m!1009609))

(declare-fun m!1009611 () Bool)

(assert (=> b!1090229 m!1009611))

(declare-fun m!1009613 () Bool)

(assert (=> b!1090229 m!1009613))

(declare-fun m!1009615 () Bool)

(assert (=> b!1090229 m!1009615))

(declare-fun m!1009617 () Bool)

(assert (=> b!1090229 m!1009617))

(declare-fun m!1009619 () Bool)

(assert (=> b!1090229 m!1009619))

(declare-fun m!1009621 () Bool)

(assert (=> b!1090229 m!1009621))

(declare-fun m!1009623 () Bool)

(assert (=> b!1090229 m!1009623))

(declare-fun m!1009625 () Bool)

(assert (=> b!1090229 m!1009625))

(declare-fun m!1009627 () Bool)

(assert (=> b!1090229 m!1009627))

(declare-fun m!1009629 () Bool)

(assert (=> b!1090229 m!1009629))

(declare-fun m!1009631 () Bool)

(assert (=> b!1090237 m!1009631))

(declare-fun m!1009633 () Bool)

(assert (=> b!1090234 m!1009633))

(declare-fun m!1009635 () Bool)

(assert (=> b!1090228 m!1009635))

(declare-fun m!1009637 () Bool)

(assert (=> b!1090232 m!1009637))

(declare-fun m!1009639 () Bool)

(assert (=> b!1090233 m!1009639))

(declare-fun m!1009641 () Bool)

(assert (=> b!1090233 m!1009641))

(declare-fun m!1009643 () Bool)

(assert (=> b!1090233 m!1009643))

(declare-fun m!1009645 () Bool)

(assert (=> b!1090239 m!1009645))

(check-sat (not mapNonEmpty!41881) (not b_next!22749) (not b!1090234) (not start!96096) (not b!1090236) (not b!1090231) (not b_lambda!17419) tp_is_empty!26751 (not b!1090237) (not b!1090239) b_and!36175 (not b!1090229) (not b!1090228) (not b!1090233))
(check-sat b_and!36175 (not b_next!22749))
