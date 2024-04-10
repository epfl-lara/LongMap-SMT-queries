; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95614 () Bool)

(assert start!95614)

(declare-fun b_free!22267 () Bool)

(declare-fun b_next!22267 () Bool)

(assert (=> start!95614 (= b_free!22267 (not b_next!22267))))

(declare-fun tp!78650 () Bool)

(declare-fun b_and!35245 () Bool)

(assert (=> start!95614 (= tp!78650 b_and!35245)))

(declare-fun res!720007 () Bool)

(declare-fun e!617582 () Bool)

(assert (=> start!95614 (=> (not res!720007) (not e!617582))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95614 (= res!720007 (validMask!0 mask!1414))))

(assert (=> start!95614 e!617582))

(assert (=> start!95614 tp!78650))

(assert (=> start!95614 true))

(declare-fun tp_is_empty!26269 () Bool)

(assert (=> start!95614 tp_is_empty!26269))

(declare-datatypes ((array!69489 0))(
  ( (array!69490 (arr!33418 (Array (_ BitVec 32) (_ BitVec 64))) (size!33954 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69489)

(declare-fun array_inv!25802 (array!69489) Bool)

(assert (=> start!95614 (array_inv!25802 _keys!1070)))

(declare-datatypes ((V!40153 0))(
  ( (V!40154 (val!13191 Int)) )
))
(declare-datatypes ((ValueCell!12425 0))(
  ( (ValueCellFull!12425 (v!15812 V!40153)) (EmptyCell!12425) )
))
(declare-datatypes ((array!69491 0))(
  ( (array!69492 (arr!33419 (Array (_ BitVec 32) ValueCell!12425)) (size!33955 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69491)

(declare-fun e!617581 () Bool)

(declare-fun array_inv!25803 (array!69491) Bool)

(assert (=> start!95614 (and (array_inv!25803 _values!874) e!617581)))

(declare-fun b!1080321 () Bool)

(declare-fun e!617585 () Bool)

(assert (=> b!1080321 (= e!617585 tp_is_empty!26269)))

(declare-fun mapNonEmpty!41158 () Bool)

(declare-fun mapRes!41158 () Bool)

(declare-fun tp!78649 () Bool)

(declare-fun e!617580 () Bool)

(assert (=> mapNonEmpty!41158 (= mapRes!41158 (and tp!78649 e!617580))))

(declare-fun mapValue!41158 () ValueCell!12425)

(declare-fun mapRest!41158 () (Array (_ BitVec 32) ValueCell!12425))

(declare-fun mapKey!41158 () (_ BitVec 32))

(assert (=> mapNonEmpty!41158 (= (arr!33419 _values!874) (store mapRest!41158 mapKey!41158 mapValue!41158))))

(declare-fun b!1080322 () Bool)

(assert (=> b!1080322 (= e!617580 tp_is_empty!26269)))

(declare-fun b!1080323 () Bool)

(declare-fun res!720006 () Bool)

(assert (=> b!1080323 (=> (not res!720006) (not e!617582))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1080323 (= res!720006 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!33954 _keys!1070))))))

(declare-fun b!1080324 () Bool)

(declare-fun e!617583 () Bool)

(assert (=> b!1080324 (= e!617582 e!617583)))

(declare-fun res!720003 () Bool)

(assert (=> b!1080324 (=> (not res!720003) (not e!617583))))

(declare-fun lt!478988 () array!69489)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69489 (_ BitVec 32)) Bool)

(assert (=> b!1080324 (= res!720003 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!478988 mask!1414))))

(assert (=> b!1080324 (= lt!478988 (array!69490 (store (arr!33418 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33954 _keys!1070)))))

(declare-fun b!1080325 () Bool)

(declare-fun res!720004 () Bool)

(assert (=> b!1080325 (=> (not res!720004) (not e!617582))))

(declare-fun k!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1080325 (= res!720004 (validKeyInArray!0 k!904))))

(declare-fun mapIsEmpty!41158 () Bool)

(assert (=> mapIsEmpty!41158 mapRes!41158))

(declare-fun b!1080326 () Bool)

(assert (=> b!1080326 (= e!617581 (and e!617585 mapRes!41158))))

(declare-fun condMapEmpty!41158 () Bool)

(declare-fun mapDefault!41158 () ValueCell!12425)

