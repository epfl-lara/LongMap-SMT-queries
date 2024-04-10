; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96090 () Bool)

(assert start!96090)

(declare-fun b_free!22743 () Bool)

(declare-fun b_next!22743 () Bool)

(assert (=> start!96090 (= b_free!22743 (not b_next!22743))))

(declare-fun tp!80078 () Bool)

(declare-fun b_and!36161 () Bool)

(assert (=> start!96090 (= tp!80078 b_and!36161)))

(declare-fun b!1090095 () Bool)

(declare-fun res!727197 () Bool)

(declare-fun e!622605 () Bool)

(assert (=> b!1090095 (=> (not res!727197) (not e!622605))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1090095 (= res!727197 (validKeyInArray!0 k0!904))))

(declare-fun b!1090096 () Bool)

(declare-fun e!622604 () Bool)

(assert (=> b!1090096 (= e!622604 true)))

(declare-datatypes ((V!40787 0))(
  ( (V!40788 (val!13429 Int)) )
))
(declare-datatypes ((tuple2!17064 0))(
  ( (tuple2!17065 (_1!8543 (_ BitVec 64)) (_2!8543 V!40787)) )
))
(declare-datatypes ((List!23653 0))(
  ( (Nil!23650) (Cons!23649 (h!24858 tuple2!17064) (t!33454 List!23653)) )
))
(declare-datatypes ((ListLongMap!15033 0))(
  ( (ListLongMap!15034 (toList!7532 List!23653)) )
))
(declare-fun lt!486237 () ListLongMap!15033)

(declare-fun lt!486240 () ListLongMap!15033)

(declare-fun -!857 (ListLongMap!15033 (_ BitVec 64)) ListLongMap!15033)

(assert (=> b!1090096 (= (-!857 lt!486237 k0!904) lt!486240)))

(declare-fun lt!486229 () ListLongMap!15033)

(declare-fun minValue!831 () V!40787)

(declare-datatypes ((Unit!35880 0))(
  ( (Unit!35881) )
))
(declare-fun lt!486239 () Unit!35880)

(declare-fun addRemoveCommutativeForDiffKeys!81 (ListLongMap!15033 (_ BitVec 64) V!40787 (_ BitVec 64)) Unit!35880)

(assert (=> b!1090096 (= lt!486239 (addRemoveCommutativeForDiffKeys!81 lt!486229 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831 k0!904))))

(declare-fun b!1090097 () Bool)

(declare-fun res!727202 () Bool)

(assert (=> b!1090097 (=> (not res!727202) (not e!622605))))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((array!70413 0))(
  ( (array!70414 (arr!33880 (Array (_ BitVec 32) (_ BitVec 64))) (size!34416 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70413)

(assert (=> b!1090097 (= res!727202 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34416 _keys!1070))))))

(declare-fun b!1090098 () Bool)

(declare-fun e!622609 () Bool)

(declare-fun e!622607 () Bool)

(assert (=> b!1090098 (= e!622609 (not e!622607))))

(declare-fun res!727194 () Bool)

(assert (=> b!1090098 (=> res!727194 e!622607)))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1090098 (= res!727194 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun lt!486232 () ListLongMap!15033)

(declare-fun zeroValue!831 () V!40787)

(declare-datatypes ((ValueCell!12663 0))(
  ( (ValueCellFull!12663 (v!16050 V!40787)) (EmptyCell!12663) )
))
(declare-datatypes ((array!70415 0))(
  ( (array!70416 (arr!33881 (Array (_ BitVec 32) ValueCell!12663)) (size!34417 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70415)

(declare-fun getCurrentListMap!4301 (array!70413 array!70415 (_ BitVec 32) (_ BitVec 32) V!40787 V!40787 (_ BitVec 32) Int) ListLongMap!15033)

(assert (=> b!1090098 (= lt!486232 (getCurrentListMap!4301 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!486233 () ListLongMap!15033)

(declare-fun lt!486234 () array!70415)

(declare-fun lt!486231 () array!70413)

(assert (=> b!1090098 (= lt!486233 (getCurrentListMap!4301 lt!486231 lt!486234 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!486230 () ListLongMap!15033)

(declare-fun lt!486241 () ListLongMap!15033)

(assert (=> b!1090098 (and (= lt!486230 lt!486241) (= lt!486241 lt!486230))))

(assert (=> b!1090098 (= lt!486241 (-!857 lt!486229 k0!904))))

(declare-fun lt!486238 () Unit!35880)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!120 (array!70413 array!70415 (_ BitVec 32) (_ BitVec 32) V!40787 V!40787 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35880)

(assert (=> b!1090098 (= lt!486238 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!120 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4061 (array!70413 array!70415 (_ BitVec 32) (_ BitVec 32) V!40787 V!40787 (_ BitVec 32) Int) ListLongMap!15033)

(assert (=> b!1090098 (= lt!486230 (getCurrentListMapNoExtraKeys!4061 lt!486231 lt!486234 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2198 (Int (_ BitVec 64)) V!40787)

(assert (=> b!1090098 (= lt!486234 (array!70416 (store (arr!33881 _values!874) i!650 (ValueCellFull!12663 (dynLambda!2198 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34417 _values!874)))))

(assert (=> b!1090098 (= lt!486229 (getCurrentListMapNoExtraKeys!4061 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70413 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1090098 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!486236 () Unit!35880)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70413 (_ BitVec 64) (_ BitVec 32)) Unit!35880)

(assert (=> b!1090098 (= lt!486236 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1090099 () Bool)

(declare-fun e!622610 () Bool)

(declare-fun tp_is_empty!26745 () Bool)

(assert (=> b!1090099 (= e!622610 tp_is_empty!26745)))

(declare-fun b!1090100 () Bool)

(declare-fun res!727193 () Bool)

(assert (=> b!1090100 (=> (not res!727193) (not e!622605))))

(assert (=> b!1090100 (= res!727193 (and (= (size!34417 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34416 _keys!1070) (size!34417 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1090101 () Bool)

(declare-fun e!622606 () Bool)

(assert (=> b!1090101 (= e!622606 tp_is_empty!26745)))

(declare-fun mapIsEmpty!41872 () Bool)

(declare-fun mapRes!41872 () Bool)

(assert (=> mapIsEmpty!41872 mapRes!41872))

(declare-fun mapNonEmpty!41872 () Bool)

(declare-fun tp!80077 () Bool)

(assert (=> mapNonEmpty!41872 (= mapRes!41872 (and tp!80077 e!622606))))

(declare-fun mapValue!41872 () ValueCell!12663)

(declare-fun mapRest!41872 () (Array (_ BitVec 32) ValueCell!12663))

(declare-fun mapKey!41872 () (_ BitVec 32))

(assert (=> mapNonEmpty!41872 (= (arr!33881 _values!874) (store mapRest!41872 mapKey!41872 mapValue!41872))))

(declare-fun b!1090102 () Bool)

(assert (=> b!1090102 (= e!622607 e!622604)))

(declare-fun res!727201 () Bool)

(assert (=> b!1090102 (=> res!727201 e!622604)))

(assert (=> b!1090102 (= res!727201 (= #b1000000000000000000000000000000000000000000000000000000000000000 k0!904))))

(assert (=> b!1090102 (= lt!486232 lt!486237)))

(declare-fun lt!486235 () tuple2!17064)

(declare-fun +!3323 (ListLongMap!15033 tuple2!17064) ListLongMap!15033)

(assert (=> b!1090102 (= lt!486237 (+!3323 lt!486229 lt!486235))))

(assert (=> b!1090102 (= lt!486233 lt!486240)))

(assert (=> b!1090102 (= lt!486240 (+!3323 lt!486241 lt!486235))))

(assert (=> b!1090102 (= lt!486233 (+!3323 lt!486230 lt!486235))))

(assert (=> b!1090102 (= lt!486235 (tuple2!17065 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(declare-fun b!1090104 () Bool)

(declare-fun res!727195 () Bool)

(assert (=> b!1090104 (=> (not res!727195) (not e!622605))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70413 (_ BitVec 32)) Bool)

(assert (=> b!1090104 (= res!727195 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1090105 () Bool)

(declare-fun res!727198 () Bool)

(assert (=> b!1090105 (=> (not res!727198) (not e!622609))))

(declare-datatypes ((List!23654 0))(
  ( (Nil!23651) (Cons!23650 (h!24859 (_ BitVec 64)) (t!33455 List!23654)) )
))
(declare-fun arrayNoDuplicates!0 (array!70413 (_ BitVec 32) List!23654) Bool)

(assert (=> b!1090105 (= res!727198 (arrayNoDuplicates!0 lt!486231 #b00000000000000000000000000000000 Nil!23651))))

(declare-fun b!1090106 () Bool)

(declare-fun res!727196 () Bool)

(assert (=> b!1090106 (=> (not res!727196) (not e!622605))))

(assert (=> b!1090106 (= res!727196 (= (select (arr!33880 _keys!1070) i!650) k0!904))))

(declare-fun b!1090107 () Bool)

(declare-fun res!727203 () Bool)

(assert (=> b!1090107 (=> (not res!727203) (not e!622605))))

(assert (=> b!1090107 (= res!727203 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23651))))

(declare-fun b!1090108 () Bool)

(assert (=> b!1090108 (= e!622605 e!622609)))

(declare-fun res!727199 () Bool)

(assert (=> b!1090108 (=> (not res!727199) (not e!622609))))

(assert (=> b!1090108 (= res!727199 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!486231 mask!1414))))

(assert (=> b!1090108 (= lt!486231 (array!70414 (store (arr!33880 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34416 _keys!1070)))))

(declare-fun res!727200 () Bool)

(assert (=> start!96090 (=> (not res!727200) (not e!622605))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96090 (= res!727200 (validMask!0 mask!1414))))

(assert (=> start!96090 e!622605))

(assert (=> start!96090 tp!80078))

(assert (=> start!96090 true))

(assert (=> start!96090 tp_is_empty!26745))

(declare-fun array_inv!26126 (array!70413) Bool)

(assert (=> start!96090 (array_inv!26126 _keys!1070)))

(declare-fun e!622603 () Bool)

(declare-fun array_inv!26127 (array!70415) Bool)

(assert (=> start!96090 (and (array_inv!26127 _values!874) e!622603)))

(declare-fun b!1090103 () Bool)

(assert (=> b!1090103 (= e!622603 (and e!622610 mapRes!41872))))

(declare-fun condMapEmpty!41872 () Bool)

(declare-fun mapDefault!41872 () ValueCell!12663)

(assert (=> b!1090103 (= condMapEmpty!41872 (= (arr!33881 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12663)) mapDefault!41872)))))

(assert (= (and start!96090 res!727200) b!1090100))

(assert (= (and b!1090100 res!727193) b!1090104))

(assert (= (and b!1090104 res!727195) b!1090107))

(assert (= (and b!1090107 res!727203) b!1090097))

(assert (= (and b!1090097 res!727202) b!1090095))

(assert (= (and b!1090095 res!727197) b!1090106))

(assert (= (and b!1090106 res!727196) b!1090108))

(assert (= (and b!1090108 res!727199) b!1090105))

(assert (= (and b!1090105 res!727198) b!1090098))

(assert (= (and b!1090098 (not res!727194)) b!1090102))

(assert (= (and b!1090102 (not res!727201)) b!1090096))

(assert (= (and b!1090103 condMapEmpty!41872) mapIsEmpty!41872))

(assert (= (and b!1090103 (not condMapEmpty!41872)) mapNonEmpty!41872))

(get-info :version)

(assert (= (and mapNonEmpty!41872 ((_ is ValueCellFull!12663) mapValue!41872)) b!1090101))

(assert (= (and b!1090103 ((_ is ValueCellFull!12663) mapDefault!41872)) b!1090099))

(assert (= start!96090 b!1090103))

(declare-fun b_lambda!17413 () Bool)

(assert (=> (not b_lambda!17413) (not b!1090098)))

(declare-fun t!33453 () Bool)

(declare-fun tb!7621 () Bool)

(assert (=> (and start!96090 (= defaultEntry!882 defaultEntry!882) t!33453) tb!7621))

(declare-fun result!15761 () Bool)

(assert (=> tb!7621 (= result!15761 tp_is_empty!26745)))

(assert (=> b!1090098 t!33453))

(declare-fun b_and!36163 () Bool)

(assert (= b_and!36161 (and (=> t!33453 result!15761) b_and!36163)))

(declare-fun m!1009439 () Bool)

(assert (=> b!1090108 m!1009439))

(declare-fun m!1009441 () Bool)

(assert (=> b!1090108 m!1009441))

(declare-fun m!1009443 () Bool)

(assert (=> b!1090105 m!1009443))

(declare-fun m!1009445 () Bool)

(assert (=> b!1090095 m!1009445))

(declare-fun m!1009447 () Bool)

(assert (=> b!1090102 m!1009447))

(declare-fun m!1009449 () Bool)

(assert (=> b!1090102 m!1009449))

(declare-fun m!1009451 () Bool)

(assert (=> b!1090102 m!1009451))

(declare-fun m!1009453 () Bool)

(assert (=> b!1090096 m!1009453))

(declare-fun m!1009455 () Bool)

(assert (=> b!1090096 m!1009455))

(declare-fun m!1009457 () Bool)

(assert (=> b!1090098 m!1009457))

(declare-fun m!1009459 () Bool)

(assert (=> b!1090098 m!1009459))

(declare-fun m!1009461 () Bool)

(assert (=> b!1090098 m!1009461))

(declare-fun m!1009463 () Bool)

(assert (=> b!1090098 m!1009463))

(declare-fun m!1009465 () Bool)

(assert (=> b!1090098 m!1009465))

(declare-fun m!1009467 () Bool)

(assert (=> b!1090098 m!1009467))

(declare-fun m!1009469 () Bool)

(assert (=> b!1090098 m!1009469))

(declare-fun m!1009471 () Bool)

(assert (=> b!1090098 m!1009471))

(declare-fun m!1009473 () Bool)

(assert (=> b!1090098 m!1009473))

(declare-fun m!1009475 () Bool)

(assert (=> b!1090098 m!1009475))

(declare-fun m!1009477 () Bool)

(assert (=> mapNonEmpty!41872 m!1009477))

(declare-fun m!1009479 () Bool)

(assert (=> b!1090104 m!1009479))

(declare-fun m!1009481 () Bool)

(assert (=> b!1090107 m!1009481))

(declare-fun m!1009483 () Bool)

(assert (=> start!96090 m!1009483))

(declare-fun m!1009485 () Bool)

(assert (=> start!96090 m!1009485))

(declare-fun m!1009487 () Bool)

(assert (=> start!96090 m!1009487))

(declare-fun m!1009489 () Bool)

(assert (=> b!1090106 m!1009489))

(check-sat (not b!1090096) (not b_next!22743) (not start!96090) (not b!1090098) (not b!1090105) (not b_lambda!17413) (not mapNonEmpty!41872) (not b!1090108) (not b!1090095) (not b!1090102) (not b!1090107) tp_is_empty!26745 b_and!36163 (not b!1090104))
(check-sat b_and!36163 (not b_next!22743))
