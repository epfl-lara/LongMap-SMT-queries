; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96156 () Bool)

(assert start!96156)

(declare-fun b_free!22809 () Bool)

(declare-fun b_next!22809 () Bool)

(assert (=> start!96156 (= b_free!22809 (not b_next!22809))))

(declare-fun tp!80276 () Bool)

(declare-fun b_and!36293 () Bool)

(assert (=> start!96156 (= tp!80276 b_and!36293)))

(declare-fun b!1091547 () Bool)

(declare-fun e!623400 () Bool)

(declare-fun e!623399 () Bool)

(assert (=> b!1091547 (= e!623400 (not e!623399))))

(declare-fun res!728288 () Bool)

(assert (=> b!1091547 (=> res!728288 e!623399)))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1091547 (= res!728288 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-datatypes ((V!40875 0))(
  ( (V!40876 (val!13462 Int)) )
))
(declare-fun minValue!831 () V!40875)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-datatypes ((tuple2!17124 0))(
  ( (tuple2!17125 (_1!8573 (_ BitVec 64)) (_2!8573 V!40875)) )
))
(declare-datatypes ((List!23708 0))(
  ( (Nil!23705) (Cons!23704 (h!24913 tuple2!17124) (t!33575 List!23708)) )
))
(declare-datatypes ((ListLongMap!15093 0))(
  ( (ListLongMap!15094 (toList!7562 List!23708)) )
))
(declare-fun lt!487528 () ListLongMap!15093)

(declare-fun zeroValue!831 () V!40875)

(declare-datatypes ((array!70541 0))(
  ( (array!70542 (arr!33944 (Array (_ BitVec 32) (_ BitVec 64))) (size!34480 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70541)

(declare-datatypes ((ValueCell!12696 0))(
  ( (ValueCellFull!12696 (v!16083 V!40875)) (EmptyCell!12696) )
))
(declare-datatypes ((array!70543 0))(
  ( (array!70544 (arr!33945 (Array (_ BitVec 32) ValueCell!12696)) (size!34481 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70543)

(declare-fun getCurrentListMap!4321 (array!70541 array!70543 (_ BitVec 32) (_ BitVec 32) V!40875 V!40875 (_ BitVec 32) Int) ListLongMap!15093)

(assert (=> b!1091547 (= lt!487528 (getCurrentListMap!4321 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!487525 () array!70541)

(declare-fun lt!487526 () array!70543)

(declare-fun lt!487518 () ListLongMap!15093)

(assert (=> b!1091547 (= lt!487518 (getCurrentListMap!4321 lt!487525 lt!487526 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!487527 () ListLongMap!15093)

(declare-fun lt!487519 () ListLongMap!15093)

(assert (=> b!1091547 (and (= lt!487527 lt!487519) (= lt!487519 lt!487527))))

(declare-fun lt!487522 () ListLongMap!15093)

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun -!883 (ListLongMap!15093 (_ BitVec 64)) ListLongMap!15093)

(assert (=> b!1091547 (= lt!487519 (-!883 lt!487522 k0!904))))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((Unit!35932 0))(
  ( (Unit!35933) )
))
(declare-fun lt!487520 () Unit!35932)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!140 (array!70541 array!70543 (_ BitVec 32) (_ BitVec 32) V!40875 V!40875 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35932)

(assert (=> b!1091547 (= lt!487520 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!140 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4081 (array!70541 array!70543 (_ BitVec 32) (_ BitVec 32) V!40875 V!40875 (_ BitVec 32) Int) ListLongMap!15093)

(assert (=> b!1091547 (= lt!487527 (getCurrentListMapNoExtraKeys!4081 lt!487525 lt!487526 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2218 (Int (_ BitVec 64)) V!40875)

(assert (=> b!1091547 (= lt!487526 (array!70544 (store (arr!33945 _values!874) i!650 (ValueCellFull!12696 (dynLambda!2218 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34481 _values!874)))))

(assert (=> b!1091547 (= lt!487522 (getCurrentListMapNoExtraKeys!4081 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70541 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1091547 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!487516 () Unit!35932)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70541 (_ BitVec 64) (_ BitVec 32)) Unit!35932)

(assert (=> b!1091547 (= lt!487516 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun mapIsEmpty!41971 () Bool)

(declare-fun mapRes!41971 () Bool)

(assert (=> mapIsEmpty!41971 mapRes!41971))

(declare-fun b!1091548 () Bool)

(declare-fun e!623396 () Bool)

(assert (=> b!1091548 (= e!623396 e!623400)))

(declare-fun res!728291 () Bool)

(assert (=> b!1091548 (=> (not res!728291) (not e!623400))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70541 (_ BitVec 32)) Bool)

(assert (=> b!1091548 (= res!728291 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!487525 mask!1414))))

(assert (=> b!1091548 (= lt!487525 (array!70542 (store (arr!33944 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34480 _keys!1070)))))

(declare-fun mapNonEmpty!41971 () Bool)

(declare-fun tp!80275 () Bool)

(declare-fun e!623395 () Bool)

(assert (=> mapNonEmpty!41971 (= mapRes!41971 (and tp!80275 e!623395))))

(declare-fun mapValue!41971 () ValueCell!12696)

(declare-fun mapRest!41971 () (Array (_ BitVec 32) ValueCell!12696))

(declare-fun mapKey!41971 () (_ BitVec 32))

(assert (=> mapNonEmpty!41971 (= (arr!33945 _values!874) (store mapRest!41971 mapKey!41971 mapValue!41971))))

(declare-fun b!1091549 () Bool)

(declare-fun res!728292 () Bool)

(assert (=> b!1091549 (=> (not res!728292) (not e!623400))))

(declare-datatypes ((List!23709 0))(
  ( (Nil!23706) (Cons!23705 (h!24914 (_ BitVec 64)) (t!33576 List!23709)) )
))
(declare-fun arrayNoDuplicates!0 (array!70541 (_ BitVec 32) List!23709) Bool)

(assert (=> b!1091549 (= res!728292 (arrayNoDuplicates!0 lt!487525 #b00000000000000000000000000000000 Nil!23706))))

(declare-fun b!1091550 () Bool)

(declare-fun res!728282 () Bool)

(assert (=> b!1091550 (=> (not res!728282) (not e!623396))))

(assert (=> b!1091550 (= res!728282 (and (= (size!34481 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34480 _keys!1070) (size!34481 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1091551 () Bool)

(declare-fun e!623401 () Bool)

(declare-fun tp_is_empty!26811 () Bool)

(assert (=> b!1091551 (= e!623401 tp_is_empty!26811)))

(declare-fun b!1091552 () Bool)

(declare-fun res!728283 () Bool)

(assert (=> b!1091552 (=> (not res!728283) (not e!623396))))

(assert (=> b!1091552 (= res!728283 (= (select (arr!33944 _keys!1070) i!650) k0!904))))

(declare-fun res!728284 () Bool)

(assert (=> start!96156 (=> (not res!728284) (not e!623396))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96156 (= res!728284 (validMask!0 mask!1414))))

(assert (=> start!96156 e!623396))

(assert (=> start!96156 tp!80276))

(assert (=> start!96156 true))

(assert (=> start!96156 tp_is_empty!26811))

(declare-fun array_inv!26172 (array!70541) Bool)

(assert (=> start!96156 (array_inv!26172 _keys!1070)))

(declare-fun e!623398 () Bool)

(declare-fun array_inv!26173 (array!70543) Bool)

(assert (=> start!96156 (and (array_inv!26173 _values!874) e!623398)))

(declare-fun b!1091553 () Bool)

(declare-fun res!728290 () Bool)

(assert (=> b!1091553 (=> (not res!728290) (not e!623396))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1091553 (= res!728290 (validKeyInArray!0 k0!904))))

(declare-fun b!1091554 () Bool)

(declare-fun res!728285 () Bool)

(assert (=> b!1091554 (=> (not res!728285) (not e!623396))))

(assert (=> b!1091554 (= res!728285 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1091555 () Bool)

(declare-fun res!728286 () Bool)

(assert (=> b!1091555 (=> (not res!728286) (not e!623396))))

(assert (=> b!1091555 (= res!728286 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23706))))

(declare-fun b!1091556 () Bool)

(declare-fun res!728289 () Bool)

(assert (=> b!1091556 (=> (not res!728289) (not e!623396))))

(assert (=> b!1091556 (= res!728289 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34480 _keys!1070))))))

(declare-fun b!1091557 () Bool)

(assert (=> b!1091557 (= e!623398 (and e!623401 mapRes!41971))))

(declare-fun condMapEmpty!41971 () Bool)

(declare-fun mapDefault!41971 () ValueCell!12696)

(assert (=> b!1091557 (= condMapEmpty!41971 (= (arr!33945 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12696)) mapDefault!41971)))))

(declare-fun b!1091558 () Bool)

(assert (=> b!1091558 (= e!623395 tp_is_empty!26811)))

(declare-fun b!1091559 () Bool)

(declare-fun e!623397 () Bool)

(assert (=> b!1091559 (= e!623399 e!623397)))

(declare-fun res!728287 () Bool)

(assert (=> b!1091559 (=> res!728287 e!623397)))

(assert (=> b!1091559 (= res!728287 (= #b1000000000000000000000000000000000000000000000000000000000000000 k0!904))))

(declare-fun lt!487521 () ListLongMap!15093)

(assert (=> b!1091559 (= lt!487528 lt!487521)))

(declare-fun lt!487517 () tuple2!17124)

(declare-fun +!3345 (ListLongMap!15093 tuple2!17124) ListLongMap!15093)

(assert (=> b!1091559 (= lt!487521 (+!3345 lt!487522 lt!487517))))

(declare-fun lt!487523 () ListLongMap!15093)

(assert (=> b!1091559 (= lt!487518 lt!487523)))

(assert (=> b!1091559 (= lt!487523 (+!3345 lt!487519 lt!487517))))

(assert (=> b!1091559 (= lt!487518 (+!3345 lt!487527 lt!487517))))

(assert (=> b!1091559 (= lt!487517 (tuple2!17125 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(declare-fun b!1091560 () Bool)

(assert (=> b!1091560 (= e!623397 true)))

(assert (=> b!1091560 (= (-!883 lt!487521 k0!904) lt!487523)))

(declare-fun lt!487524 () Unit!35932)

(declare-fun addRemoveCommutativeForDiffKeys!105 (ListLongMap!15093 (_ BitVec 64) V!40875 (_ BitVec 64)) Unit!35932)

(assert (=> b!1091560 (= lt!487524 (addRemoveCommutativeForDiffKeys!105 lt!487522 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831 k0!904))))

(assert (= (and start!96156 res!728284) b!1091550))

(assert (= (and b!1091550 res!728282) b!1091554))

(assert (= (and b!1091554 res!728285) b!1091555))

(assert (= (and b!1091555 res!728286) b!1091556))

(assert (= (and b!1091556 res!728289) b!1091553))

(assert (= (and b!1091553 res!728290) b!1091552))

(assert (= (and b!1091552 res!728283) b!1091548))

(assert (= (and b!1091548 res!728291) b!1091549))

(assert (= (and b!1091549 res!728292) b!1091547))

(assert (= (and b!1091547 (not res!728288)) b!1091559))

(assert (= (and b!1091559 (not res!728287)) b!1091560))

(assert (= (and b!1091557 condMapEmpty!41971) mapIsEmpty!41971))

(assert (= (and b!1091557 (not condMapEmpty!41971)) mapNonEmpty!41971))

(get-info :version)

(assert (= (and mapNonEmpty!41971 ((_ is ValueCellFull!12696) mapValue!41971)) b!1091558))

(assert (= (and b!1091557 ((_ is ValueCellFull!12696) mapDefault!41971)) b!1091551))

(assert (= start!96156 b!1091557))

(declare-fun b_lambda!17479 () Bool)

(assert (=> (not b_lambda!17479) (not b!1091547)))

(declare-fun t!33574 () Bool)

(declare-fun tb!7687 () Bool)

(assert (=> (and start!96156 (= defaultEntry!882 defaultEntry!882) t!33574) tb!7687))

(declare-fun result!15893 () Bool)

(assert (=> tb!7687 (= result!15893 tp_is_empty!26811)))

(assert (=> b!1091547 t!33574))

(declare-fun b_and!36295 () Bool)

(assert (= b_and!36293 (and (=> t!33574 result!15893) b_and!36295)))

(declare-fun m!1011155 () Bool)

(assert (=> b!1091553 m!1011155))

(declare-fun m!1011157 () Bool)

(assert (=> b!1091552 m!1011157))

(declare-fun m!1011159 () Bool)

(assert (=> b!1091560 m!1011159))

(declare-fun m!1011161 () Bool)

(assert (=> b!1091560 m!1011161))

(declare-fun m!1011163 () Bool)

(assert (=> b!1091555 m!1011163))

(declare-fun m!1011165 () Bool)

(assert (=> b!1091554 m!1011165))

(declare-fun m!1011167 () Bool)

(assert (=> b!1091547 m!1011167))

(declare-fun m!1011169 () Bool)

(assert (=> b!1091547 m!1011169))

(declare-fun m!1011171 () Bool)

(assert (=> b!1091547 m!1011171))

(declare-fun m!1011173 () Bool)

(assert (=> b!1091547 m!1011173))

(declare-fun m!1011175 () Bool)

(assert (=> b!1091547 m!1011175))

(declare-fun m!1011177 () Bool)

(assert (=> b!1091547 m!1011177))

(declare-fun m!1011179 () Bool)

(assert (=> b!1091547 m!1011179))

(declare-fun m!1011181 () Bool)

(assert (=> b!1091547 m!1011181))

(declare-fun m!1011183 () Bool)

(assert (=> b!1091547 m!1011183))

(declare-fun m!1011185 () Bool)

(assert (=> b!1091547 m!1011185))

(declare-fun m!1011187 () Bool)

(assert (=> mapNonEmpty!41971 m!1011187))

(declare-fun m!1011189 () Bool)

(assert (=> start!96156 m!1011189))

(declare-fun m!1011191 () Bool)

(assert (=> start!96156 m!1011191))

(declare-fun m!1011193 () Bool)

(assert (=> start!96156 m!1011193))

(declare-fun m!1011195 () Bool)

(assert (=> b!1091548 m!1011195))

(declare-fun m!1011197 () Bool)

(assert (=> b!1091548 m!1011197))

(declare-fun m!1011199 () Bool)

(assert (=> b!1091559 m!1011199))

(declare-fun m!1011201 () Bool)

(assert (=> b!1091559 m!1011201))

(declare-fun m!1011203 () Bool)

(assert (=> b!1091559 m!1011203))

(declare-fun m!1011205 () Bool)

(assert (=> b!1091549 m!1011205))

(check-sat (not b!1091549) (not b!1091547) (not b_next!22809) (not b!1091559) (not b!1091554) (not b!1091548) tp_is_empty!26811 (not b!1091555) (not start!96156) (not mapNonEmpty!41971) b_and!36295 (not b!1091560) (not b!1091553) (not b_lambda!17479))
(check-sat b_and!36295 (not b_next!22809))
