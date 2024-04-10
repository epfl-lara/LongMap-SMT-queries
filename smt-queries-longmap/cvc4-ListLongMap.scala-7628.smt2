; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96092 () Bool)

(assert start!96092)

(declare-fun b_free!22745 () Bool)

(declare-fun b_next!22745 () Bool)

(assert (=> start!96092 (= b_free!22745 (not b_next!22745))))

(declare-fun tp!80084 () Bool)

(declare-fun b_and!36165 () Bool)

(assert (=> start!96092 (= tp!80084 b_and!36165)))

(declare-fun b!1090139 () Bool)

(declare-fun res!727232 () Bool)

(declare-fun e!622633 () Bool)

(assert (=> b!1090139 (=> (not res!727232) (not e!622633))))

(declare-fun k!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1090139 (= res!727232 (validKeyInArray!0 k!904))))

(declare-fun b!1090140 () Bool)

(declare-fun res!727229 () Bool)

(assert (=> b!1090140 (=> (not res!727229) (not e!622633))))

(declare-datatypes ((array!70417 0))(
  ( (array!70418 (arr!33882 (Array (_ BitVec 32) (_ BitVec 64))) (size!34418 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70417)

(declare-datatypes ((List!23655 0))(
  ( (Nil!23652) (Cons!23651 (h!24860 (_ BitVec 64)) (t!33458 List!23655)) )
))
(declare-fun arrayNoDuplicates!0 (array!70417 (_ BitVec 32) List!23655) Bool)

(assert (=> b!1090140 (= res!727229 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23652))))

(declare-fun mapNonEmpty!41875 () Bool)

(declare-fun mapRes!41875 () Bool)

(declare-fun tp!80083 () Bool)

(declare-fun e!622631 () Bool)

(assert (=> mapNonEmpty!41875 (= mapRes!41875 (and tp!80083 e!622631))))

(declare-fun mapKey!41875 () (_ BitVec 32))

(declare-datatypes ((V!40789 0))(
  ( (V!40790 (val!13430 Int)) )
))
(declare-datatypes ((ValueCell!12664 0))(
  ( (ValueCellFull!12664 (v!16051 V!40789)) (EmptyCell!12664) )
))
(declare-datatypes ((array!70419 0))(
  ( (array!70420 (arr!33883 (Array (_ BitVec 32) ValueCell!12664)) (size!34419 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70419)

(declare-fun mapValue!41875 () ValueCell!12664)

(declare-fun mapRest!41875 () (Array (_ BitVec 32) ValueCell!12664))

(assert (=> mapNonEmpty!41875 (= (arr!33883 _values!874) (store mapRest!41875 mapKey!41875 mapValue!41875))))

(declare-fun b!1090141 () Bool)

(declare-fun res!727227 () Bool)

(assert (=> b!1090141 (=> (not res!727227) (not e!622633))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1090141 (= res!727227 (and (= (size!34419 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34418 _keys!1070) (size!34419 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!41875 () Bool)

(assert (=> mapIsEmpty!41875 mapRes!41875))

(declare-fun b!1090142 () Bool)

(declare-fun e!622632 () Bool)

(assert (=> b!1090142 (= e!622633 e!622632)))

(declare-fun res!727226 () Bool)

(assert (=> b!1090142 (=> (not res!727226) (not e!622632))))

(declare-fun lt!486269 () array!70417)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70417 (_ BitVec 32)) Bool)

(assert (=> b!1090142 (= res!727226 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!486269 mask!1414))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1090142 (= lt!486269 (array!70418 (store (arr!33882 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34418 _keys!1070)))))

(declare-fun b!1090143 () Bool)

(declare-fun res!727235 () Bool)

(assert (=> b!1090143 (=> (not res!727235) (not e!622633))))

(assert (=> b!1090143 (= res!727235 (= (select (arr!33882 _keys!1070) i!650) k!904))))

(declare-fun res!727230 () Bool)

(assert (=> start!96092 (=> (not res!727230) (not e!622633))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96092 (= res!727230 (validMask!0 mask!1414))))

(assert (=> start!96092 e!622633))

(assert (=> start!96092 tp!80084))

(assert (=> start!96092 true))

(declare-fun tp_is_empty!26747 () Bool)

(assert (=> start!96092 tp_is_empty!26747))

(declare-fun array_inv!26128 (array!70417) Bool)

(assert (=> start!96092 (array_inv!26128 _keys!1070)))

(declare-fun e!622634 () Bool)

(declare-fun array_inv!26129 (array!70419) Bool)

(assert (=> start!96092 (and (array_inv!26129 _values!874) e!622634)))

(declare-fun b!1090144 () Bool)

(assert (=> b!1090144 (= e!622631 tp_is_empty!26747)))

(declare-fun b!1090145 () Bool)

(declare-fun res!727231 () Bool)

(assert (=> b!1090145 (=> (not res!727231) (not e!622632))))

(assert (=> b!1090145 (= res!727231 (arrayNoDuplicates!0 lt!486269 #b00000000000000000000000000000000 Nil!23652))))

(declare-fun b!1090146 () Bool)

(declare-fun e!622627 () Bool)

(assert (=> b!1090146 (= e!622627 true)))

(declare-datatypes ((tuple2!17066 0))(
  ( (tuple2!17067 (_1!8544 (_ BitVec 64)) (_2!8544 V!40789)) )
))
(declare-datatypes ((List!23656 0))(
  ( (Nil!23653) (Cons!23652 (h!24861 tuple2!17066) (t!33459 List!23656)) )
))
(declare-datatypes ((ListLongMap!15035 0))(
  ( (ListLongMap!15036 (toList!7533 List!23656)) )
))
(declare-fun lt!486273 () ListLongMap!15035)

(declare-fun lt!486277 () ListLongMap!15035)

(declare-fun -!858 (ListLongMap!15035 (_ BitVec 64)) ListLongMap!15035)

(assert (=> b!1090146 (= (-!858 lt!486273 k!904) lt!486277)))

(declare-fun minValue!831 () V!40789)

(declare-fun lt!486271 () ListLongMap!15035)

(declare-datatypes ((Unit!35882 0))(
  ( (Unit!35883) )
))
(declare-fun lt!486270 () Unit!35882)

(declare-fun addRemoveCommutativeForDiffKeys!82 (ListLongMap!15035 (_ BitVec 64) V!40789 (_ BitVec 64)) Unit!35882)

(assert (=> b!1090146 (= lt!486270 (addRemoveCommutativeForDiffKeys!82 lt!486271 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831 k!904))))

(declare-fun b!1090147 () Bool)

(declare-fun e!622629 () Bool)

(assert (=> b!1090147 (= e!622632 (not e!622629))))

(declare-fun res!727233 () Bool)

(assert (=> b!1090147 (=> res!727233 e!622629)))

(assert (=> b!1090147 (= res!727233 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun zeroValue!831 () V!40789)

(declare-fun lt!486279 () ListLongMap!15035)

(declare-fun getCurrentListMap!4302 (array!70417 array!70419 (_ BitVec 32) (_ BitVec 32) V!40789 V!40789 (_ BitVec 32) Int) ListLongMap!15035)

(assert (=> b!1090147 (= lt!486279 (getCurrentListMap!4302 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!486278 () ListLongMap!15035)

(declare-fun lt!486268 () array!70419)

(assert (=> b!1090147 (= lt!486278 (getCurrentListMap!4302 lt!486269 lt!486268 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!486276 () ListLongMap!15035)

(declare-fun lt!486274 () ListLongMap!15035)

(assert (=> b!1090147 (and (= lt!486276 lt!486274) (= lt!486274 lt!486276))))

(assert (=> b!1090147 (= lt!486274 (-!858 lt!486271 k!904))))

(declare-fun lt!486275 () Unit!35882)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!121 (array!70417 array!70419 (_ BitVec 32) (_ BitVec 32) V!40789 V!40789 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35882)

(assert (=> b!1090147 (= lt!486275 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!121 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4062 (array!70417 array!70419 (_ BitVec 32) (_ BitVec 32) V!40789 V!40789 (_ BitVec 32) Int) ListLongMap!15035)

(assert (=> b!1090147 (= lt!486276 (getCurrentListMapNoExtraKeys!4062 lt!486269 lt!486268 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2199 (Int (_ BitVec 64)) V!40789)

(assert (=> b!1090147 (= lt!486268 (array!70420 (store (arr!33883 _values!874) i!650 (ValueCellFull!12664 (dynLambda!2199 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34419 _values!874)))))

(assert (=> b!1090147 (= lt!486271 (getCurrentListMapNoExtraKeys!4062 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70417 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1090147 (arrayContainsKey!0 _keys!1070 k!904 #b00000000000000000000000000000000)))

(declare-fun lt!486280 () Unit!35882)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70417 (_ BitVec 64) (_ BitVec 32)) Unit!35882)

(assert (=> b!1090147 (= lt!486280 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k!904 i!650))))

(declare-fun b!1090148 () Bool)

(declare-fun e!622630 () Bool)

(assert (=> b!1090148 (= e!622630 tp_is_empty!26747)))

(declare-fun b!1090149 () Bool)

(assert (=> b!1090149 (= e!622634 (and e!622630 mapRes!41875))))

(declare-fun condMapEmpty!41875 () Bool)

(declare-fun mapDefault!41875 () ValueCell!12664)

