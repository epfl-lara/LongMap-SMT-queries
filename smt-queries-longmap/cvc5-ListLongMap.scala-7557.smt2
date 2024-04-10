; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95662 () Bool)

(assert start!95662)

(declare-fun b_free!22315 () Bool)

(declare-fun b_next!22315 () Bool)

(assert (=> start!95662 (= b_free!22315 (not b_next!22315))))

(declare-fun tp!78794 () Bool)

(declare-fun b_and!35305 () Bool)

(assert (=> start!95662 (= tp!78794 b_and!35305)))

(declare-fun mapNonEmpty!41230 () Bool)

(declare-fun mapRes!41230 () Bool)

(declare-fun tp!78793 () Bool)

(declare-fun e!618012 () Bool)

(assert (=> mapNonEmpty!41230 (= mapRes!41230 (and tp!78793 e!618012))))

(declare-datatypes ((V!40217 0))(
  ( (V!40218 (val!13215 Int)) )
))
(declare-datatypes ((ValueCell!12449 0))(
  ( (ValueCellFull!12449 (v!15836 V!40217)) (EmptyCell!12449) )
))
(declare-datatypes ((array!69581 0))(
  ( (array!69582 (arr!33464 (Array (_ BitVec 32) ValueCell!12449)) (size!34000 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69581)

(declare-fun mapRest!41230 () (Array (_ BitVec 32) ValueCell!12449))

(declare-fun mapValue!41230 () ValueCell!12449)

(declare-fun mapKey!41230 () (_ BitVec 32))

(assert (=> mapNonEmpty!41230 (= (arr!33464 _values!874) (store mapRest!41230 mapKey!41230 mapValue!41230))))

(declare-fun b!1081197 () Bool)

(declare-fun e!618017 () Bool)

(declare-fun tp_is_empty!26317 () Bool)

(assert (=> b!1081197 (= e!618017 tp_is_empty!26317)))

(declare-fun b!1081198 () Bool)

(declare-fun e!618013 () Bool)

(declare-fun e!618015 () Bool)

(assert (=> b!1081198 (= e!618013 e!618015)))

(declare-fun res!720649 () Bool)

(assert (=> b!1081198 (=> (not res!720649) (not e!618015))))

(declare-datatypes ((array!69583 0))(
  ( (array!69584 (arr!33465 (Array (_ BitVec 32) (_ BitVec 64))) (size!34001 (_ BitVec 32))) )
))
(declare-fun lt!479224 () array!69583)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69583 (_ BitVec 32)) Bool)

(assert (=> b!1081198 (= res!720649 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!479224 mask!1414))))

(declare-fun _keys!1070 () array!69583)

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1081198 (= lt!479224 (array!69584 (store (arr!33465 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34001 _keys!1070)))))

(declare-fun mapIsEmpty!41230 () Bool)

(assert (=> mapIsEmpty!41230 mapRes!41230))

(declare-fun b!1081199 () Bool)

(declare-fun res!720652 () Bool)

(assert (=> b!1081199 (=> (not res!720652) (not e!618013))))

(declare-fun k!904 () (_ BitVec 64))

(assert (=> b!1081199 (= res!720652 (= (select (arr!33465 _keys!1070) i!650) k!904))))

(declare-fun b!1081200 () Bool)

(assert (=> b!1081200 (= e!618012 tp_is_empty!26317)))

(declare-fun b!1081201 () Bool)

(assert (=> b!1081201 (= e!618015 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40217)

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-fun zeroValue!831 () V!40217)

(declare-datatypes ((tuple2!16740 0))(
  ( (tuple2!16741 (_1!8381 (_ BitVec 64)) (_2!8381 V!40217)) )
))
(declare-datatypes ((List!23320 0))(
  ( (Nil!23317) (Cons!23316 (h!24525 tuple2!16740) (t!32693 List!23320)) )
))
(declare-datatypes ((ListLongMap!14709 0))(
  ( (ListLongMap!14710 (toList!7370 List!23320)) )
))
(declare-fun lt!479226 () ListLongMap!14709)

(declare-fun getCurrentListMapNoExtraKeys!3918 (array!69583 array!69581 (_ BitVec 32) (_ BitVec 32) V!40217 V!40217 (_ BitVec 32) Int) ListLongMap!14709)

(declare-fun dynLambda!2055 (Int (_ BitVec 64)) V!40217)

(assert (=> b!1081201 (= lt!479226 (getCurrentListMapNoExtraKeys!3918 lt!479224 (array!69582 (store (arr!33464 _values!874) i!650 (ValueCellFull!12449 (dynLambda!2055 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34000 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!479225 () ListLongMap!14709)

(assert (=> b!1081201 (= lt!479225 (getCurrentListMapNoExtraKeys!3918 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!69583 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1081201 (arrayContainsKey!0 _keys!1070 k!904 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!35560 0))(
  ( (Unit!35561) )
))
(declare-fun lt!479227 () Unit!35560)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69583 (_ BitVec 64) (_ BitVec 32)) Unit!35560)

(assert (=> b!1081201 (= lt!479227 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k!904 i!650))))

(declare-fun b!1081202 () Bool)

(declare-fun res!720651 () Bool)

(assert (=> b!1081202 (=> (not res!720651) (not e!618013))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1081202 (= res!720651 (validKeyInArray!0 k!904))))

(declare-fun b!1081203 () Bool)

(declare-fun res!720653 () Bool)

(assert (=> b!1081203 (=> (not res!720653) (not e!618013))))

(assert (=> b!1081203 (= res!720653 (and (= (size!34000 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34001 _keys!1070) (size!34000 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1081204 () Bool)

(declare-fun res!720657 () Bool)

(assert (=> b!1081204 (=> (not res!720657) (not e!618013))))

(assert (=> b!1081204 (= res!720657 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34001 _keys!1070))))))

(declare-fun res!720654 () Bool)

(assert (=> start!95662 (=> (not res!720654) (not e!618013))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95662 (= res!720654 (validMask!0 mask!1414))))

(assert (=> start!95662 e!618013))

(assert (=> start!95662 tp!78794))

(assert (=> start!95662 true))

(assert (=> start!95662 tp_is_empty!26317))

(declare-fun array_inv!25834 (array!69583) Bool)

(assert (=> start!95662 (array_inv!25834 _keys!1070)))

(declare-fun e!618016 () Bool)

(declare-fun array_inv!25835 (array!69581) Bool)

(assert (=> start!95662 (and (array_inv!25835 _values!874) e!618016)))

(declare-fun b!1081205 () Bool)

(declare-fun res!720656 () Bool)

(assert (=> b!1081205 (=> (not res!720656) (not e!618013))))

(assert (=> b!1081205 (= res!720656 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1081206 () Bool)

(assert (=> b!1081206 (= e!618016 (and e!618017 mapRes!41230))))

(declare-fun condMapEmpty!41230 () Bool)

(declare-fun mapDefault!41230 () ValueCell!12449)

