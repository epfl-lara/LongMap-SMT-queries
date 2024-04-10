; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95626 () Bool)

(assert start!95626)

(declare-fun b_free!22279 () Bool)

(declare-fun b_next!22279 () Bool)

(assert (=> start!95626 (= b_free!22279 (not b_next!22279))))

(declare-fun tp!78686 () Bool)

(declare-fun b_and!35257 () Bool)

(assert (=> start!95626 (= tp!78686 b_and!35257)))

(declare-fun b!1080537 () Bool)

(declare-fun res!720166 () Bool)

(declare-fun e!617691 () Bool)

(assert (=> b!1080537 (=> (not res!720166) (not e!617691))))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((array!69513 0))(
  ( (array!69514 (arr!33430 (Array (_ BitVec 32) (_ BitVec 64))) (size!33966 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69513)

(assert (=> b!1080537 (= res!720166 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!33966 _keys!1070))))))

(declare-fun b!1080538 () Bool)

(declare-fun res!720168 () Bool)

(declare-fun e!617692 () Bool)

(assert (=> b!1080538 (=> (not res!720168) (not e!617692))))

(declare-fun lt!479042 () array!69513)

(declare-datatypes ((List!23295 0))(
  ( (Nil!23292) (Cons!23291 (h!24500 (_ BitVec 64)) (t!32654 List!23295)) )
))
(declare-fun arrayNoDuplicates!0 (array!69513 (_ BitVec 32) List!23295) Bool)

(assert (=> b!1080538 (= res!720168 (arrayNoDuplicates!0 lt!479042 #b00000000000000000000000000000000 Nil!23292))))

(declare-fun b!1080539 () Bool)

(assert (=> b!1080539 (= e!617692 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-datatypes ((V!40169 0))(
  ( (V!40170 (val!13197 Int)) )
))
(declare-fun minValue!831 () V!40169)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((ValueCell!12431 0))(
  ( (ValueCellFull!12431 (v!15818 V!40169)) (EmptyCell!12431) )
))
(declare-datatypes ((array!69515 0))(
  ( (array!69516 (arr!33431 (Array (_ BitVec 32) ValueCell!12431)) (size!33967 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69515)

(declare-fun zeroValue!831 () V!40169)

(declare-datatypes ((tuple2!16714 0))(
  ( (tuple2!16715 (_1!8368 (_ BitVec 64)) (_2!8368 V!40169)) )
))
(declare-datatypes ((List!23296 0))(
  ( (Nil!23293) (Cons!23292 (h!24501 tuple2!16714) (t!32655 List!23296)) )
))
(declare-datatypes ((ListLongMap!14683 0))(
  ( (ListLongMap!14684 (toList!7357 List!23296)) )
))
(declare-fun lt!479043 () ListLongMap!14683)

(declare-fun getCurrentListMapNoExtraKeys!3905 (array!69513 array!69515 (_ BitVec 32) (_ BitVec 32) V!40169 V!40169 (_ BitVec 32) Int) ListLongMap!14683)

(assert (=> b!1080539 (= lt!479043 (getCurrentListMapNoExtraKeys!3905 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun k!904 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!69513 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1080539 (arrayContainsKey!0 _keys!1070 k!904 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!35534 0))(
  ( (Unit!35535) )
))
(declare-fun lt!479044 () Unit!35534)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69513 (_ BitVec 64) (_ BitVec 32)) Unit!35534)

(assert (=> b!1080539 (= lt!479044 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k!904 i!650))))

(declare-fun b!1080540 () Bool)

(assert (=> b!1080540 (= e!617691 e!617692)))

(declare-fun res!720164 () Bool)

(assert (=> b!1080540 (=> (not res!720164) (not e!617692))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69513 (_ BitVec 32)) Bool)

(assert (=> b!1080540 (= res!720164 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!479042 mask!1414))))

(assert (=> b!1080540 (= lt!479042 (array!69514 (store (arr!33430 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33966 _keys!1070)))))

(declare-fun b!1080541 () Bool)

(declare-fun res!720171 () Bool)

(assert (=> b!1080541 (=> (not res!720171) (not e!617691))))

(assert (=> b!1080541 (= res!720171 (and (= (size!33967 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!33966 _keys!1070) (size!33967 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1080542 () Bool)

(declare-fun e!617693 () Bool)

(declare-fun tp_is_empty!26281 () Bool)

(assert (=> b!1080542 (= e!617693 tp_is_empty!26281)))

(declare-fun b!1080543 () Bool)

(declare-fun res!720167 () Bool)

(assert (=> b!1080543 (=> (not res!720167) (not e!617691))))

(assert (=> b!1080543 (= res!720167 (= (select (arr!33430 _keys!1070) i!650) k!904))))

(declare-fun b!1080544 () Bool)

(declare-fun res!720165 () Bool)

(assert (=> b!1080544 (=> (not res!720165) (not e!617691))))

(assert (=> b!1080544 (= res!720165 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23292))))

(declare-fun b!1080545 () Bool)

(declare-fun res!720163 () Bool)

(assert (=> b!1080545 (=> (not res!720163) (not e!617691))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1080545 (= res!720163 (validKeyInArray!0 k!904))))

(declare-fun mapNonEmpty!41176 () Bool)

(declare-fun mapRes!41176 () Bool)

(declare-fun tp!78685 () Bool)

(declare-fun e!617690 () Bool)

(assert (=> mapNonEmpty!41176 (= mapRes!41176 (and tp!78685 e!617690))))

(declare-fun mapRest!41176 () (Array (_ BitVec 32) ValueCell!12431))

(declare-fun mapValue!41176 () ValueCell!12431)

(declare-fun mapKey!41176 () (_ BitVec 32))

(assert (=> mapNonEmpty!41176 (= (arr!33431 _values!874) (store mapRest!41176 mapKey!41176 mapValue!41176))))

(declare-fun mapIsEmpty!41176 () Bool)

(assert (=> mapIsEmpty!41176 mapRes!41176))

(declare-fun b!1080546 () Bool)

(declare-fun e!617688 () Bool)

(assert (=> b!1080546 (= e!617688 (and e!617693 mapRes!41176))))

(declare-fun condMapEmpty!41176 () Bool)

(declare-fun mapDefault!41176 () ValueCell!12431)

