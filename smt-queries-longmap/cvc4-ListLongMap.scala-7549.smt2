; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95618 () Bool)

(assert start!95618)

(declare-fun b_free!22271 () Bool)

(declare-fun b_next!22271 () Bool)

(assert (=> start!95618 (= b_free!22271 (not b_next!22271))))

(declare-fun tp!78662 () Bool)

(declare-fun b_and!35249 () Bool)

(assert (=> start!95618 (= tp!78662 b_and!35249)))

(declare-fun b!1080393 () Bool)

(declare-fun e!617618 () Bool)

(assert (=> b!1080393 (= e!617618 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-datatypes ((V!40157 0))(
  ( (V!40158 (val!13193 Int)) )
))
(declare-fun minValue!831 () V!40157)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-datatypes ((tuple2!16708 0))(
  ( (tuple2!16709 (_1!8365 (_ BitVec 64)) (_2!8365 V!40157)) )
))
(declare-datatypes ((List!23288 0))(
  ( (Nil!23285) (Cons!23284 (h!24493 tuple2!16708) (t!32647 List!23288)) )
))
(declare-datatypes ((ListLongMap!14677 0))(
  ( (ListLongMap!14678 (toList!7354 List!23288)) )
))
(declare-fun lt!479006 () ListLongMap!14677)

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-fun zeroValue!831 () V!40157)

(declare-datatypes ((array!69497 0))(
  ( (array!69498 (arr!33422 (Array (_ BitVec 32) (_ BitVec 64))) (size!33958 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69497)

(declare-datatypes ((ValueCell!12427 0))(
  ( (ValueCellFull!12427 (v!15814 V!40157)) (EmptyCell!12427) )
))
(declare-datatypes ((array!69499 0))(
  ( (array!69500 (arr!33423 (Array (_ BitVec 32) ValueCell!12427)) (size!33959 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69499)

(declare-fun getCurrentListMapNoExtraKeys!3902 (array!69497 array!69499 (_ BitVec 32) (_ BitVec 32) V!40157 V!40157 (_ BitVec 32) Int) ListLongMap!14677)

(assert (=> b!1080393 (= lt!479006 (getCurrentListMapNoExtraKeys!3902 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun k!904 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!69497 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1080393 (arrayContainsKey!0 _keys!1070 k!904 #b00000000000000000000000000000000)))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((Unit!35528 0))(
  ( (Unit!35529) )
))
(declare-fun lt!479008 () Unit!35528)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69497 (_ BitVec 64) (_ BitVec 32)) Unit!35528)

(assert (=> b!1080393 (= lt!479008 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k!904 i!650))))

(declare-fun b!1080394 () Bool)

(declare-fun res!720061 () Bool)

(declare-fun e!617616 () Bool)

(assert (=> b!1080394 (=> (not res!720061) (not e!617616))))

(assert (=> b!1080394 (= res!720061 (= (select (arr!33422 _keys!1070) i!650) k!904))))

(declare-fun b!1080395 () Bool)

(declare-fun res!720056 () Bool)

(assert (=> b!1080395 (=> (not res!720056) (not e!617618))))

(declare-fun lt!479007 () array!69497)

(declare-datatypes ((List!23289 0))(
  ( (Nil!23286) (Cons!23285 (h!24494 (_ BitVec 64)) (t!32648 List!23289)) )
))
(declare-fun arrayNoDuplicates!0 (array!69497 (_ BitVec 32) List!23289) Bool)

(assert (=> b!1080395 (= res!720056 (arrayNoDuplicates!0 lt!479007 #b00000000000000000000000000000000 Nil!23286))))

(declare-fun b!1080396 () Bool)

(declare-fun res!720060 () Bool)

(assert (=> b!1080396 (=> (not res!720060) (not e!617616))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69497 (_ BitVec 32)) Bool)

(assert (=> b!1080396 (= res!720060 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun res!720063 () Bool)

(assert (=> start!95618 (=> (not res!720063) (not e!617616))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95618 (= res!720063 (validMask!0 mask!1414))))

(assert (=> start!95618 e!617616))

(assert (=> start!95618 tp!78662))

(assert (=> start!95618 true))

(declare-fun tp_is_empty!26273 () Bool)

(assert (=> start!95618 tp_is_empty!26273))

(declare-fun array_inv!25806 (array!69497) Bool)

(assert (=> start!95618 (array_inv!25806 _keys!1070)))

(declare-fun e!617621 () Bool)

(declare-fun array_inv!25807 (array!69499) Bool)

(assert (=> start!95618 (and (array_inv!25807 _values!874) e!617621)))

(declare-fun b!1080397 () Bool)

(assert (=> b!1080397 (= e!617616 e!617618)))

(declare-fun res!720062 () Bool)

(assert (=> b!1080397 (=> (not res!720062) (not e!617618))))

(assert (=> b!1080397 (= res!720062 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!479007 mask!1414))))

(assert (=> b!1080397 (= lt!479007 (array!69498 (store (arr!33422 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33958 _keys!1070)))))

(declare-fun b!1080398 () Bool)

(declare-fun res!720057 () Bool)

(assert (=> b!1080398 (=> (not res!720057) (not e!617616))))

(assert (=> b!1080398 (= res!720057 (and (= (size!33959 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!33958 _keys!1070) (size!33959 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1080399 () Bool)

(declare-fun e!617619 () Bool)

(assert (=> b!1080399 (= e!617619 tp_is_empty!26273)))

(declare-fun b!1080400 () Bool)

(declare-fun e!617620 () Bool)

(assert (=> b!1080400 (= e!617620 tp_is_empty!26273)))

(declare-fun mapIsEmpty!41164 () Bool)

(declare-fun mapRes!41164 () Bool)

(assert (=> mapIsEmpty!41164 mapRes!41164))

(declare-fun b!1080401 () Bool)

(assert (=> b!1080401 (= e!617621 (and e!617620 mapRes!41164))))

(declare-fun condMapEmpty!41164 () Bool)

(declare-fun mapDefault!41164 () ValueCell!12427)

