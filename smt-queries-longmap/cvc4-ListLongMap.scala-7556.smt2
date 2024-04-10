; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95660 () Bool)

(assert start!95660)

(declare-fun b_free!22313 () Bool)

(declare-fun b_next!22313 () Bool)

(assert (=> start!95660 (= b_free!22313 (not b_next!22313))))

(declare-fun tp!78787 () Bool)

(declare-fun b_and!35301 () Bool)

(assert (=> start!95660 (= tp!78787 b_and!35301)))

(declare-fun b!1081159 () Bool)

(declare-fun e!617995 () Bool)

(assert (=> b!1081159 (= e!617995 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-datatypes ((V!40213 0))(
  ( (V!40214 (val!13214 Int)) )
))
(declare-datatypes ((ValueCell!12448 0))(
  ( (ValueCellFull!12448 (v!15835 V!40213)) (EmptyCell!12448) )
))
(declare-datatypes ((array!69577 0))(
  ( (array!69578 (arr!33462 (Array (_ BitVec 32) ValueCell!12448)) (size!33998 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69577)

(declare-fun minValue!831 () V!40213)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((tuple2!16738 0))(
  ( (tuple2!16739 (_1!8380 (_ BitVec 64)) (_2!8380 V!40213)) )
))
(declare-datatypes ((List!23319 0))(
  ( (Nil!23316) (Cons!23315 (h!24524 tuple2!16738) (t!32690 List!23319)) )
))
(declare-datatypes ((ListLongMap!14707 0))(
  ( (ListLongMap!14708 (toList!7369 List!23319)) )
))
(declare-fun lt!479212 () ListLongMap!14707)

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((array!69579 0))(
  ( (array!69580 (arr!33463 (Array (_ BitVec 32) (_ BitVec 64))) (size!33999 (_ BitVec 32))) )
))
(declare-fun lt!479213 () array!69579)

(declare-fun zeroValue!831 () V!40213)

(declare-fun getCurrentListMapNoExtraKeys!3917 (array!69579 array!69577 (_ BitVec 32) (_ BitVec 32) V!40213 V!40213 (_ BitVec 32) Int) ListLongMap!14707)

(declare-fun dynLambda!2054 (Int (_ BitVec 64)) V!40213)

(assert (=> b!1081159 (= lt!479212 (getCurrentListMapNoExtraKeys!3917 lt!479213 (array!69578 (store (arr!33462 _values!874) i!650 (ValueCellFull!12448 (dynLambda!2054 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!33998 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!479214 () ListLongMap!14707)

(declare-fun _keys!1070 () array!69579)

(assert (=> b!1081159 (= lt!479214 (getCurrentListMapNoExtraKeys!3917 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun k!904 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!69579 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1081159 (arrayContainsKey!0 _keys!1070 k!904 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!35558 0))(
  ( (Unit!35559) )
))
(declare-fun lt!479215 () Unit!35558)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69579 (_ BitVec 64) (_ BitVec 32)) Unit!35558)

(assert (=> b!1081159 (= lt!479215 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k!904 i!650))))

(declare-fun b!1081160 () Bool)

(declare-fun res!720623 () Bool)

(declare-fun e!617997 () Bool)

(assert (=> b!1081160 (=> (not res!720623) (not e!617997))))

(assert (=> b!1081160 (= res!720623 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!33999 _keys!1070))))))

(declare-fun b!1081162 () Bool)

(declare-fun e!617998 () Bool)

(declare-fun e!617996 () Bool)

(declare-fun mapRes!41227 () Bool)

(assert (=> b!1081162 (= e!617998 (and e!617996 mapRes!41227))))

(declare-fun condMapEmpty!41227 () Bool)

(declare-fun mapDefault!41227 () ValueCell!12448)

