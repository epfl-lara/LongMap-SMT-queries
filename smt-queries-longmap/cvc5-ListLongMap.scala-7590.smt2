; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95860 () Bool)

(assert start!95860)

(declare-fun b_free!22513 () Bool)

(declare-fun b_next!22513 () Bool)

(assert (=> start!95860 (= b_free!22513 (not b_next!22513))))

(declare-fun tp!79388 () Bool)

(declare-fun b_and!35701 () Bool)

(assert (=> start!95860 (= tp!79388 b_and!35701)))

(declare-fun mapNonEmpty!41527 () Bool)

(declare-fun mapRes!41527 () Bool)

(declare-fun tp!79387 () Bool)

(declare-fun e!619843 () Bool)

(assert (=> mapNonEmpty!41527 (= mapRes!41527 (and tp!79387 e!619843))))

(declare-datatypes ((V!40481 0))(
  ( (V!40482 (val!13314 Int)) )
))
(declare-datatypes ((ValueCell!12548 0))(
  ( (ValueCellFull!12548 (v!15935 V!40481)) (EmptyCell!12548) )
))
(declare-datatypes ((array!69967 0))(
  ( (array!69968 (arr!33657 (Array (_ BitVec 32) ValueCell!12548)) (size!34193 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69967)

(declare-fun mapRest!41527 () (Array (_ BitVec 32) ValueCell!12548))

(declare-fun mapKey!41527 () (_ BitVec 32))

(declare-fun mapValue!41527 () ValueCell!12548)

(assert (=> mapNonEmpty!41527 (= (arr!33657 _values!874) (store mapRest!41527 mapKey!41527 mapValue!41527))))

(declare-fun res!723381 () Bool)

(declare-fun e!619844 () Bool)

(assert (=> start!95860 (=> (not res!723381) (not e!619844))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95860 (= res!723381 (validMask!0 mask!1414))))

(assert (=> start!95860 e!619844))

(assert (=> start!95860 tp!79388))

(assert (=> start!95860 true))

(declare-fun tp_is_empty!26515 () Bool)

(assert (=> start!95860 tp_is_empty!26515))

(declare-datatypes ((array!69969 0))(
  ( (array!69970 (arr!33658 (Array (_ BitVec 32) (_ BitVec 64))) (size!34194 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69969)

(declare-fun array_inv!25974 (array!69969) Bool)

(assert (=> start!95860 (array_inv!25974 _keys!1070)))

(declare-fun e!619846 () Bool)

(declare-fun array_inv!25975 (array!69967) Bool)

(assert (=> start!95860 (and (array_inv!25975 _values!874) e!619846)))

(declare-fun b!1085017 () Bool)

(declare-fun res!723384 () Bool)

(assert (=> b!1085017 (=> (not res!723384) (not e!619844))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1085017 (= res!723384 (and (= (size!34193 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34194 _keys!1070) (size!34193 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1085018 () Bool)

(declare-fun res!723382 () Bool)

(declare-fun e!619847 () Bool)

(assert (=> b!1085018 (=> (not res!723382) (not e!619847))))

(declare-fun lt!481196 () array!69969)

(declare-datatypes ((List!23469 0))(
  ( (Nil!23466) (Cons!23465 (h!24674 (_ BitVec 64)) (t!33040 List!23469)) )
))
(declare-fun arrayNoDuplicates!0 (array!69969 (_ BitVec 32) List!23469) Bool)

(assert (=> b!1085018 (= res!723382 (arrayNoDuplicates!0 lt!481196 #b00000000000000000000000000000000 Nil!23466))))

(declare-fun b!1085019 () Bool)

(declare-fun res!723388 () Bool)

(assert (=> b!1085019 (=> (not res!723388) (not e!619844))))

(declare-fun k!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1085019 (= res!723388 (validKeyInArray!0 k!904))))

(declare-fun b!1085020 () Bool)

(declare-fun e!619845 () Bool)

(declare-fun e!619850 () Bool)

(assert (=> b!1085020 (= e!619845 e!619850)))

(declare-fun res!723387 () Bool)

(assert (=> b!1085020 (=> res!723387 e!619850)))

(assert (=> b!1085020 (= res!723387 (= #b1000000000000000000000000000000000000000000000000000000000000000 k!904))))

(declare-datatypes ((tuple2!16880 0))(
  ( (tuple2!16881 (_1!8451 (_ BitVec 64)) (_2!8451 V!40481)) )
))
(declare-datatypes ((List!23470 0))(
  ( (Nil!23467) (Cons!23466 (h!24675 tuple2!16880) (t!33041 List!23470)) )
))
(declare-datatypes ((ListLongMap!14849 0))(
  ( (ListLongMap!14850 (toList!7440 List!23470)) )
))
(declare-fun lt!481195 () ListLongMap!14849)

(declare-fun lt!481209 () ListLongMap!14849)

(assert (=> b!1085020 (= lt!481195 lt!481209)))

(declare-fun lt!481202 () ListLongMap!14849)

(declare-fun -!766 (ListLongMap!14849 (_ BitVec 64)) ListLongMap!14849)

(assert (=> b!1085020 (= lt!481195 (-!766 lt!481202 k!904))))

(declare-fun lt!481210 () ListLongMap!14849)

(declare-fun zeroValue!831 () V!40481)

(declare-datatypes ((Unit!35698 0))(
  ( (Unit!35699) )
))
(declare-fun lt!481198 () Unit!35698)

(declare-fun addRemoveCommutativeForDiffKeys!5 (ListLongMap!14849 (_ BitVec 64) V!40481 (_ BitVec 64)) Unit!35698)

(assert (=> b!1085020 (= lt!481198 (addRemoveCommutativeForDiffKeys!5 lt!481210 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831 k!904))))

(declare-fun lt!481204 () ListLongMap!14849)

(declare-fun lt!481206 () tuple2!16880)

(declare-fun +!3249 (ListLongMap!14849 tuple2!16880) ListLongMap!14849)

(assert (=> b!1085020 (= lt!481204 (+!3249 lt!481209 lt!481206))))

(declare-fun lt!481200 () ListLongMap!14849)

(declare-fun lt!481201 () tuple2!16880)

(assert (=> b!1085020 (= lt!481209 (+!3249 lt!481200 lt!481201))))

(declare-fun lt!481205 () ListLongMap!14849)

(declare-fun lt!481203 () ListLongMap!14849)

(assert (=> b!1085020 (= lt!481205 lt!481203)))

(assert (=> b!1085020 (= lt!481203 (+!3249 lt!481202 lt!481206))))

(assert (=> b!1085020 (= lt!481202 (+!3249 lt!481210 lt!481201))))

(declare-fun lt!481208 () ListLongMap!14849)

(assert (=> b!1085020 (= lt!481204 (+!3249 (+!3249 lt!481208 lt!481201) lt!481206))))

(declare-fun minValue!831 () V!40481)

(assert (=> b!1085020 (= lt!481206 (tuple2!16881 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(assert (=> b!1085020 (= lt!481201 (tuple2!16881 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun b!1085021 () Bool)

(declare-fun res!723386 () Bool)

(assert (=> b!1085021 (=> (not res!723386) (not e!619844))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1085021 (= res!723386 (= (select (arr!33658 _keys!1070) i!650) k!904))))

(declare-fun b!1085022 () Bool)

(assert (=> b!1085022 (= e!619844 e!619847)))

(declare-fun res!723380 () Bool)

(assert (=> b!1085022 (=> (not res!723380) (not e!619847))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69969 (_ BitVec 32)) Bool)

(assert (=> b!1085022 (= res!723380 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!481196 mask!1414))))

(assert (=> b!1085022 (= lt!481196 (array!69970 (store (arr!33658 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34194 _keys!1070)))))

(declare-fun b!1085023 () Bool)

(assert (=> b!1085023 (= e!619843 tp_is_empty!26515)))

(declare-fun b!1085024 () Bool)

(declare-fun res!723390 () Bool)

(assert (=> b!1085024 (=> (not res!723390) (not e!619844))))

(assert (=> b!1085024 (= res!723390 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23466))))

(declare-fun b!1085025 () Bool)

(declare-fun res!723389 () Bool)

(assert (=> b!1085025 (=> (not res!723389) (not e!619844))))

(assert (=> b!1085025 (= res!723389 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1085026 () Bool)

(declare-fun res!723385 () Bool)

(assert (=> b!1085026 (=> (not res!723385) (not e!619844))))

(assert (=> b!1085026 (= res!723385 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34194 _keys!1070))))))

(declare-fun b!1085027 () Bool)

(declare-fun e!619849 () Bool)

(assert (=> b!1085027 (= e!619846 (and e!619849 mapRes!41527))))

(declare-fun condMapEmpty!41527 () Bool)

(declare-fun mapDefault!41527 () ValueCell!12548)

