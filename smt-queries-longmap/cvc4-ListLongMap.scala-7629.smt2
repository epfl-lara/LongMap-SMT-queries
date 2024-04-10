; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96098 () Bool)

(assert start!96098)

(declare-fun b_free!22751 () Bool)

(declare-fun b_next!22751 () Bool)

(assert (=> start!96098 (= b_free!22751 (not b_next!22751))))

(declare-fun tp!80101 () Bool)

(declare-fun b_and!36177 () Bool)

(assert (=> start!96098 (= tp!80101 b_and!36177)))

(declare-fun mapIsEmpty!41884 () Bool)

(declare-fun mapRes!41884 () Bool)

(assert (=> mapIsEmpty!41884 mapRes!41884))

(declare-fun b!1090271 () Bool)

(declare-fun e!622703 () Bool)

(declare-fun tp_is_empty!26753 () Bool)

(assert (=> b!1090271 (= e!622703 tp_is_empty!26753)))

(declare-fun b!1090272 () Bool)

(declare-fun res!727334 () Bool)

(declare-fun e!622701 () Bool)

(assert (=> b!1090272 (=> (not res!727334) (not e!622701))))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((array!70429 0))(
  ( (array!70430 (arr!33888 (Array (_ BitVec 32) (_ BitVec 64))) (size!34424 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70429)

(assert (=> b!1090272 (= res!727334 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34424 _keys!1070))))))

(declare-fun b!1090273 () Bool)

(declare-fun e!622699 () Bool)

(assert (=> b!1090273 (= e!622699 true)))

(declare-datatypes ((V!40797 0))(
  ( (V!40798 (val!13433 Int)) )
))
(declare-datatypes ((tuple2!17072 0))(
  ( (tuple2!17073 (_1!8547 (_ BitVec 64)) (_2!8547 V!40797)) )
))
(declare-datatypes ((List!23661 0))(
  ( (Nil!23658) (Cons!23657 (h!24866 tuple2!17072) (t!33470 List!23661)) )
))
(declare-datatypes ((ListLongMap!15041 0))(
  ( (ListLongMap!15042 (toList!7536 List!23661)) )
))
(declare-fun lt!486393 () ListLongMap!15041)

(declare-fun k!904 () (_ BitVec 64))

(declare-fun lt!486386 () ListLongMap!15041)

(declare-fun -!861 (ListLongMap!15041 (_ BitVec 64)) ListLongMap!15041)

(assert (=> b!1090273 (= (-!861 lt!486393 k!904) lt!486386)))

(declare-fun minValue!831 () V!40797)

(declare-fun lt!486397 () ListLongMap!15041)

(declare-datatypes ((Unit!35888 0))(
  ( (Unit!35889) )
))
(declare-fun lt!486392 () Unit!35888)

(declare-fun addRemoveCommutativeForDiffKeys!85 (ListLongMap!15041 (_ BitVec 64) V!40797 (_ BitVec 64)) Unit!35888)

(assert (=> b!1090273 (= lt!486392 (addRemoveCommutativeForDiffKeys!85 lt!486397 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831 k!904))))

(declare-fun b!1090274 () Bool)

(declare-fun res!727326 () Bool)

(assert (=> b!1090274 (=> (not res!727326) (not e!622701))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1090274 (= res!727326 (validKeyInArray!0 k!904))))

(declare-fun b!1090275 () Bool)

(declare-fun res!727325 () Bool)

(assert (=> b!1090275 (=> (not res!727325) (not e!622701))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70429 (_ BitVec 32)) Bool)

(assert (=> b!1090275 (= res!727325 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun res!727329 () Bool)

(assert (=> start!96098 (=> (not res!727329) (not e!622701))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96098 (= res!727329 (validMask!0 mask!1414))))

(assert (=> start!96098 e!622701))

(assert (=> start!96098 tp!80101))

(assert (=> start!96098 true))

(assert (=> start!96098 tp_is_empty!26753))

(declare-fun array_inv!26134 (array!70429) Bool)

(assert (=> start!96098 (array_inv!26134 _keys!1070)))

(declare-datatypes ((ValueCell!12667 0))(
  ( (ValueCellFull!12667 (v!16054 V!40797)) (EmptyCell!12667) )
))
(declare-datatypes ((array!70431 0))(
  ( (array!70432 (arr!33889 (Array (_ BitVec 32) ValueCell!12667)) (size!34425 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70431)

(declare-fun e!622702 () Bool)

(declare-fun array_inv!26135 (array!70431) Bool)

(assert (=> start!96098 (and (array_inv!26135 _values!874) e!622702)))

(declare-fun b!1090276 () Bool)

(declare-fun res!727332 () Bool)

(assert (=> b!1090276 (=> (not res!727332) (not e!622701))))

(assert (=> b!1090276 (= res!727332 (= (select (arr!33888 _keys!1070) i!650) k!904))))

(declare-fun b!1090277 () Bool)

(declare-fun e!622704 () Bool)

(assert (=> b!1090277 (= e!622701 e!622704)))

(declare-fun res!727328 () Bool)

(assert (=> b!1090277 (=> (not res!727328) (not e!622704))))

(declare-fun lt!486385 () array!70429)

(assert (=> b!1090277 (= res!727328 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!486385 mask!1414))))

(assert (=> b!1090277 (= lt!486385 (array!70430 (store (arr!33888 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34424 _keys!1070)))))

(declare-fun mapNonEmpty!41884 () Bool)

(declare-fun tp!80102 () Bool)

(declare-fun e!622706 () Bool)

(assert (=> mapNonEmpty!41884 (= mapRes!41884 (and tp!80102 e!622706))))

(declare-fun mapRest!41884 () (Array (_ BitVec 32) ValueCell!12667))

(declare-fun mapKey!41884 () (_ BitVec 32))

(declare-fun mapValue!41884 () ValueCell!12667)

(assert (=> mapNonEmpty!41884 (= (arr!33889 _values!874) (store mapRest!41884 mapKey!41884 mapValue!41884))))

(declare-fun b!1090278 () Bool)

(declare-fun res!727333 () Bool)

(assert (=> b!1090278 (=> (not res!727333) (not e!622701))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1090278 (= res!727333 (and (= (size!34425 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34424 _keys!1070) (size!34425 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1090279 () Bool)

(declare-fun e!622700 () Bool)

(assert (=> b!1090279 (= e!622704 (not e!622700))))

(declare-fun res!727335 () Bool)

(assert (=> b!1090279 (=> res!727335 e!622700)))

(assert (=> b!1090279 (= res!727335 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!486396 () ListLongMap!15041)

(declare-fun zeroValue!831 () V!40797)

(declare-fun defaultEntry!882 () Int)

(declare-fun getCurrentListMap!4304 (array!70429 array!70431 (_ BitVec 32) (_ BitVec 32) V!40797 V!40797 (_ BitVec 32) Int) ListLongMap!15041)

(assert (=> b!1090279 (= lt!486396 (getCurrentListMap!4304 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!486389 () ListLongMap!15041)

(declare-fun lt!486387 () array!70431)

(assert (=> b!1090279 (= lt!486389 (getCurrentListMap!4304 lt!486385 lt!486387 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!486394 () ListLongMap!15041)

(declare-fun lt!486390 () ListLongMap!15041)

(assert (=> b!1090279 (and (= lt!486394 lt!486390) (= lt!486390 lt!486394))))

(assert (=> b!1090279 (= lt!486390 (-!861 lt!486397 k!904))))

(declare-fun lt!486388 () Unit!35888)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!123 (array!70429 array!70431 (_ BitVec 32) (_ BitVec 32) V!40797 V!40797 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35888)

(assert (=> b!1090279 (= lt!486388 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!123 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4064 (array!70429 array!70431 (_ BitVec 32) (_ BitVec 32) V!40797 V!40797 (_ BitVec 32) Int) ListLongMap!15041)

(assert (=> b!1090279 (= lt!486394 (getCurrentListMapNoExtraKeys!4064 lt!486385 lt!486387 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2201 (Int (_ BitVec 64)) V!40797)

(assert (=> b!1090279 (= lt!486387 (array!70432 (store (arr!33889 _values!874) i!650 (ValueCellFull!12667 (dynLambda!2201 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34425 _values!874)))))

(assert (=> b!1090279 (= lt!486397 (getCurrentListMapNoExtraKeys!4064 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70429 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1090279 (arrayContainsKey!0 _keys!1070 k!904 #b00000000000000000000000000000000)))

(declare-fun lt!486395 () Unit!35888)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70429 (_ BitVec 64) (_ BitVec 32)) Unit!35888)

(assert (=> b!1090279 (= lt!486395 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k!904 i!650))))

(declare-fun b!1090280 () Bool)

(assert (=> b!1090280 (= e!622700 e!622699)))

(declare-fun res!727327 () Bool)

(assert (=> b!1090280 (=> res!727327 e!622699)))

(assert (=> b!1090280 (= res!727327 (= #b1000000000000000000000000000000000000000000000000000000000000000 k!904))))

(assert (=> b!1090280 (= lt!486396 lt!486393)))

(declare-fun lt!486391 () tuple2!17072)

(declare-fun +!3325 (ListLongMap!15041 tuple2!17072) ListLongMap!15041)

(assert (=> b!1090280 (= lt!486393 (+!3325 lt!486397 lt!486391))))

(assert (=> b!1090280 (= lt!486389 lt!486386)))

(assert (=> b!1090280 (= lt!486386 (+!3325 lt!486390 lt!486391))))

(assert (=> b!1090280 (= lt!486389 (+!3325 lt!486394 lt!486391))))

(assert (=> b!1090280 (= lt!486391 (tuple2!17073 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(declare-fun b!1090281 () Bool)

(declare-fun res!727330 () Bool)

(assert (=> b!1090281 (=> (not res!727330) (not e!622701))))

(declare-datatypes ((List!23662 0))(
  ( (Nil!23659) (Cons!23658 (h!24867 (_ BitVec 64)) (t!33471 List!23662)) )
))
(declare-fun arrayNoDuplicates!0 (array!70429 (_ BitVec 32) List!23662) Bool)

(assert (=> b!1090281 (= res!727330 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23659))))

(declare-fun b!1090282 () Bool)

(assert (=> b!1090282 (= e!622702 (and e!622703 mapRes!41884))))

(declare-fun condMapEmpty!41884 () Bool)

(declare-fun mapDefault!41884 () ValueCell!12667)

