; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95564 () Bool)

(assert start!95564)

(declare-fun b!1079421 () Bool)

(declare-fun e!617133 () Bool)

(declare-fun e!617132 () Bool)

(assert (=> b!1079421 (= e!617133 e!617132)))

(declare-fun res!719332 () Bool)

(assert (=> b!1079421 (=> (not res!719332) (not e!617132))))

(declare-datatypes ((array!69393 0))(
  ( (array!69394 (arr!33370 (Array (_ BitVec 32) (_ BitVec 64))) (size!33906 (_ BitVec 32))) )
))
(declare-fun lt!478810 () array!69393)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69393 (_ BitVec 32)) Bool)

(assert (=> b!1079421 (= res!719332 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!478810 mask!1414))))

(declare-fun _keys!1070 () array!69393)

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1079421 (= lt!478810 (array!69394 (store (arr!33370 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33906 _keys!1070)))))

(declare-fun mapNonEmpty!41083 () Bool)

(declare-fun mapRes!41083 () Bool)

(declare-fun tp!78545 () Bool)

(declare-fun e!617134 () Bool)

(assert (=> mapNonEmpty!41083 (= mapRes!41083 (and tp!78545 e!617134))))

(declare-datatypes ((V!40085 0))(
  ( (V!40086 (val!13166 Int)) )
))
(declare-datatypes ((ValueCell!12400 0))(
  ( (ValueCellFull!12400 (v!15787 V!40085)) (EmptyCell!12400) )
))
(declare-datatypes ((array!69395 0))(
  ( (array!69396 (arr!33371 (Array (_ BitVec 32) ValueCell!12400)) (size!33907 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69395)

(declare-fun mapRest!41083 () (Array (_ BitVec 32) ValueCell!12400))

(declare-fun mapKey!41083 () (_ BitVec 32))

(declare-fun mapValue!41083 () ValueCell!12400)

(assert (=> mapNonEmpty!41083 (= (arr!33371 _values!874) (store mapRest!41083 mapKey!41083 mapValue!41083))))

(declare-fun b!1079422 () Bool)

(declare-fun res!719328 () Bool)

(assert (=> b!1079422 (=> (not res!719328) (not e!617133))))

(declare-datatypes ((List!23259 0))(
  ( (Nil!23256) (Cons!23255 (h!24464 (_ BitVec 64)) (t!32618 List!23259)) )
))
(declare-fun arrayNoDuplicates!0 (array!69393 (_ BitVec 32) List!23259) Bool)

(assert (=> b!1079422 (= res!719328 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23256))))

(declare-fun b!1079423 () Bool)

(declare-fun res!719334 () Bool)

(assert (=> b!1079423 (=> (not res!719334) (not e!617132))))

(assert (=> b!1079423 (= res!719334 (arrayNoDuplicates!0 lt!478810 #b00000000000000000000000000000000 Nil!23256))))

(declare-fun b!1079424 () Bool)

(declare-fun res!719326 () Bool)

(assert (=> b!1079424 (=> (not res!719326) (not e!617133))))

(assert (=> b!1079424 (= res!719326 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!33906 _keys!1070))))))

(declare-fun b!1079425 () Bool)

(declare-fun res!719329 () Bool)

(assert (=> b!1079425 (=> (not res!719329) (not e!617133))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1079425 (= res!719329 (and (= (size!33907 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!33906 _keys!1070) (size!33907 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!41083 () Bool)

(assert (=> mapIsEmpty!41083 mapRes!41083))

(declare-fun b!1079426 () Bool)

(declare-fun e!617135 () Bool)

(declare-fun e!617131 () Bool)

(assert (=> b!1079426 (= e!617135 (and e!617131 mapRes!41083))))

(declare-fun condMapEmpty!41083 () Bool)

(declare-fun mapDefault!41083 () ValueCell!12400)

