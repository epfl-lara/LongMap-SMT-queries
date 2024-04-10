; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95560 () Bool)

(assert start!95560)

(declare-fun b!1079349 () Bool)

(declare-fun e!617098 () Bool)

(declare-fun e!617099 () Bool)

(assert (=> b!1079349 (= e!617098 e!617099)))

(declare-fun res!719278 () Bool)

(assert (=> b!1079349 (=> (not res!719278) (not e!617099))))

(declare-datatypes ((array!69385 0))(
  ( (array!69386 (arr!33366 (Array (_ BitVec 32) (_ BitVec 64))) (size!33902 (_ BitVec 32))) )
))
(declare-fun lt!478797 () array!69385)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69385 (_ BitVec 32)) Bool)

(assert (=> b!1079349 (= res!719278 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!478797 mask!1414))))

(declare-fun _keys!1070 () array!69385)

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1079349 (= lt!478797 (array!69386 (store (arr!33366 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33902 _keys!1070)))))

(declare-fun mapNonEmpty!41077 () Bool)

(declare-fun mapRes!41077 () Bool)

(declare-fun tp!78539 () Bool)

(declare-fun e!617094 () Bool)

(assert (=> mapNonEmpty!41077 (= mapRes!41077 (and tp!78539 e!617094))))

(declare-fun mapKey!41077 () (_ BitVec 32))

(declare-datatypes ((V!40081 0))(
  ( (V!40082 (val!13164 Int)) )
))
(declare-datatypes ((ValueCell!12398 0))(
  ( (ValueCellFull!12398 (v!15785 V!40081)) (EmptyCell!12398) )
))
(declare-fun mapValue!41077 () ValueCell!12398)

(declare-fun mapRest!41077 () (Array (_ BitVec 32) ValueCell!12398))

(declare-datatypes ((array!69387 0))(
  ( (array!69388 (arr!33367 (Array (_ BitVec 32) ValueCell!12398)) (size!33903 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69387)

(assert (=> mapNonEmpty!41077 (= (arr!33367 _values!874) (store mapRest!41077 mapKey!41077 mapValue!41077))))

(declare-fun b!1079350 () Bool)

(declare-fun res!719280 () Bool)

(assert (=> b!1079350 (=> (not res!719280) (not e!617099))))

(declare-datatypes ((List!23257 0))(
  ( (Nil!23254) (Cons!23253 (h!24462 (_ BitVec 64)) (t!32616 List!23257)) )
))
(declare-fun arrayNoDuplicates!0 (array!69385 (_ BitVec 32) List!23257) Bool)

(assert (=> b!1079350 (= res!719280 (arrayNoDuplicates!0 lt!478797 #b00000000000000000000000000000000 Nil!23254))))

(declare-fun b!1079351 () Bool)

(declare-fun res!719272 () Bool)

(assert (=> b!1079351 (=> (not res!719272) (not e!617098))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1079351 (= res!719272 (and (= (size!33903 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!33902 _keys!1070) (size!33903 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1079352 () Bool)

(declare-fun res!719274 () Bool)

(assert (=> b!1079352 (=> (not res!719274) (not e!617098))))

(assert (=> b!1079352 (= res!719274 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23254))))

(declare-fun b!1079353 () Bool)

(declare-fun res!719275 () Bool)

(assert (=> b!1079353 (=> (not res!719275) (not e!617098))))

(declare-fun k!904 () (_ BitVec 64))

(assert (=> b!1079353 (= res!719275 (= (select (arr!33366 _keys!1070) i!650) k!904))))

(declare-fun b!1079354 () Bool)

(declare-fun e!617096 () Bool)

(declare-fun tp_is_empty!26215 () Bool)

(assert (=> b!1079354 (= e!617096 tp_is_empty!26215)))

(declare-fun mapIsEmpty!41077 () Bool)

(assert (=> mapIsEmpty!41077 mapRes!41077))

(declare-fun b!1079356 () Bool)

(declare-fun res!719273 () Bool)

(assert (=> b!1079356 (=> (not res!719273) (not e!617098))))

(assert (=> b!1079356 (= res!719273 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1079357 () Bool)

(declare-fun res!719277 () Bool)

(assert (=> b!1079357 (=> (not res!719277) (not e!617098))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1079357 (= res!719277 (validKeyInArray!0 k!904))))

(declare-fun b!1079358 () Bool)

(declare-fun e!617097 () Bool)

(assert (=> b!1079358 (= e!617097 (and e!617096 mapRes!41077))))

(declare-fun condMapEmpty!41077 () Bool)

(declare-fun mapDefault!41077 () ValueCell!12398)

