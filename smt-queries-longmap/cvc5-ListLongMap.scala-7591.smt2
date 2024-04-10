; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95866 () Bool)

(assert start!95866)

(declare-fun b_free!22519 () Bool)

(declare-fun b_next!22519 () Bool)

(assert (=> start!95866 (= b_free!22519 (not b_next!22519))))

(declare-fun tp!79405 () Bool)

(declare-fun b_and!35713 () Bool)

(assert (=> start!95866 (= tp!79405 b_and!35713)))

(declare-fun b!1085149 () Bool)

(declare-fun res!723489 () Bool)

(declare-fun e!619916 () Bool)

(assert (=> b!1085149 (=> (not res!723489) (not e!619916))))

(declare-fun k!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1085149 (= res!723489 (validKeyInArray!0 k!904))))

(declare-fun mapIsEmpty!41536 () Bool)

(declare-fun mapRes!41536 () Bool)

(assert (=> mapIsEmpty!41536 mapRes!41536))

(declare-fun b!1085150 () Bool)

(declare-fun e!619918 () Bool)

(declare-fun tp_is_empty!26521 () Bool)

(assert (=> b!1085150 (= e!619918 tp_is_empty!26521)))

(declare-fun b!1085151 () Bool)

(declare-fun e!619922 () Bool)

(assert (=> b!1085151 (= e!619922 true)))

(declare-datatypes ((V!40489 0))(
  ( (V!40490 (val!13317 Int)) )
))
(declare-datatypes ((tuple2!16884 0))(
  ( (tuple2!16885 (_1!8453 (_ BitVec 64)) (_2!8453 V!40489)) )
))
(declare-datatypes ((List!23473 0))(
  ( (Nil!23470) (Cons!23469 (h!24678 tuple2!16884) (t!33050 List!23473)) )
))
(declare-datatypes ((ListLongMap!14853 0))(
  ( (ListLongMap!14854 (toList!7442 List!23473)) )
))
(declare-fun lt!481358 () ListLongMap!14853)

(declare-fun lt!481347 () ListLongMap!14853)

(declare-fun lt!481348 () tuple2!16884)

(declare-fun -!768 (ListLongMap!14853 (_ BitVec 64)) ListLongMap!14853)

(declare-fun +!3251 (ListLongMap!14853 tuple2!16884) ListLongMap!14853)

(assert (=> b!1085151 (= (-!768 lt!481358 k!904) (+!3251 lt!481347 lt!481348))))

(declare-fun minValue!831 () V!40489)

(declare-datatypes ((Unit!35702 0))(
  ( (Unit!35703) )
))
(declare-fun lt!481352 () Unit!35702)

(declare-fun lt!481355 () ListLongMap!14853)

(declare-fun addRemoveCommutativeForDiffKeys!7 (ListLongMap!14853 (_ BitVec 64) V!40489 (_ BitVec 64)) Unit!35702)

(assert (=> b!1085151 (= lt!481352 (addRemoveCommutativeForDiffKeys!7 lt!481355 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831 k!904))))

(declare-fun res!723480 () Bool)

(assert (=> start!95866 (=> (not res!723480) (not e!619916))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95866 (= res!723480 (validMask!0 mask!1414))))

(assert (=> start!95866 e!619916))

(assert (=> start!95866 tp!79405))

(assert (=> start!95866 true))

(assert (=> start!95866 tp_is_empty!26521))

(declare-datatypes ((array!69977 0))(
  ( (array!69978 (arr!33662 (Array (_ BitVec 32) (_ BitVec 64))) (size!34198 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69977)

(declare-fun array_inv!25978 (array!69977) Bool)

(assert (=> start!95866 (array_inv!25978 _keys!1070)))

(declare-datatypes ((ValueCell!12551 0))(
  ( (ValueCellFull!12551 (v!15938 V!40489)) (EmptyCell!12551) )
))
(declare-datatypes ((array!69979 0))(
  ( (array!69980 (arr!33663 (Array (_ BitVec 32) ValueCell!12551)) (size!34199 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69979)

(declare-fun e!619917 () Bool)

(declare-fun array_inv!25979 (array!69979) Bool)

(assert (=> start!95866 (and (array_inv!25979 _values!874) e!619917)))

(declare-fun mapNonEmpty!41536 () Bool)

(declare-fun tp!79406 () Bool)

(declare-fun e!619920 () Bool)

(assert (=> mapNonEmpty!41536 (= mapRes!41536 (and tp!79406 e!619920))))

(declare-fun mapKey!41536 () (_ BitVec 32))

(declare-fun mapValue!41536 () ValueCell!12551)

(declare-fun mapRest!41536 () (Array (_ BitVec 32) ValueCell!12551))

(assert (=> mapNonEmpty!41536 (= (arr!33663 _values!874) (store mapRest!41536 mapKey!41536 mapValue!41536))))

(declare-fun b!1085152 () Bool)

(assert (=> b!1085152 (= e!619917 (and e!619918 mapRes!41536))))

(declare-fun condMapEmpty!41536 () Bool)

(declare-fun mapDefault!41536 () ValueCell!12551)

