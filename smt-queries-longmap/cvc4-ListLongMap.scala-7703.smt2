; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96752 () Bool)

(assert start!96752)

(declare-fun b_free!23147 () Bool)

(declare-fun b_next!23147 () Bool)

(assert (=> start!96752 (= b_free!23147 (not b_next!23147))))

(declare-fun tp!81388 () Bool)

(declare-fun b_and!37055 () Bool)

(assert (=> start!96752 (= tp!81388 b_and!37055)))

(declare-fun b!1100514 () Bool)

(declare-fun res!734368 () Bool)

(declare-fun e!628144 () Bool)

(assert (=> b!1100514 (=> (not res!734368) (not e!628144))))

(declare-fun k!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1100514 (= res!734368 (validKeyInArray!0 k!904))))

(declare-fun b!1100515 () Bool)

(declare-fun res!734369 () Bool)

(assert (=> b!1100515 (=> (not res!734369) (not e!628144))))

(declare-datatypes ((array!71313 0))(
  ( (array!71314 (arr!34321 (Array (_ BitVec 32) (_ BitVec 64))) (size!34857 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!71313)

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1100515 (= res!734369 (= (select (arr!34321 _keys!1070) i!650) k!904))))

(declare-fun res!734372 () Bool)

(assert (=> start!96752 (=> (not res!734372) (not e!628144))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96752 (= res!734372 (validMask!0 mask!1414))))

(assert (=> start!96752 e!628144))

(assert (=> start!96752 tp!81388))

(assert (=> start!96752 true))

(declare-fun tp_is_empty!27197 () Bool)

(assert (=> start!96752 tp_is_empty!27197))

(declare-fun array_inv!26436 (array!71313) Bool)

(assert (=> start!96752 (array_inv!26436 _keys!1070)))

(declare-datatypes ((V!41389 0))(
  ( (V!41390 (val!13655 Int)) )
))
(declare-datatypes ((ValueCell!12889 0))(
  ( (ValueCellFull!12889 (v!16283 V!41389)) (EmptyCell!12889) )
))
(declare-datatypes ((array!71315 0))(
  ( (array!71316 (arr!34322 (Array (_ BitVec 32) ValueCell!12889)) (size!34858 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!71315)

(declare-fun e!628140 () Bool)

(declare-fun array_inv!26437 (array!71315) Bool)

(assert (=> start!96752 (and (array_inv!26437 _values!874) e!628140)))

(declare-fun b!1100516 () Bool)

(declare-fun e!628146 () Bool)

(assert (=> b!1100516 (= e!628146 tp_is_empty!27197)))

(declare-fun b!1100517 () Bool)

(declare-fun e!628145 () Bool)

(assert (=> b!1100517 (= e!628145 (bvslt i!650 (size!34858 _values!874)))))

(declare-datatypes ((tuple2!17362 0))(
  ( (tuple2!17363 (_1!8692 (_ BitVec 64)) (_2!8692 V!41389)) )
))
(declare-datatypes ((List!23977 0))(
  ( (Nil!23974) (Cons!23973 (h!25182 tuple2!17362) (t!34170 List!23977)) )
))
(declare-datatypes ((ListLongMap!15331 0))(
  ( (ListLongMap!15332 (toList!7681 List!23977)) )
))
(declare-fun lt!493131 () ListLongMap!15331)

(declare-fun lt!493129 () ListLongMap!15331)

(declare-fun -!967 (ListLongMap!15331 (_ BitVec 64)) ListLongMap!15331)

(assert (=> b!1100517 (= (-!967 lt!493131 k!904) lt!493129)))

(declare-datatypes ((Unit!36180 0))(
  ( (Unit!36181) )
))
(declare-fun lt!493122 () Unit!36180)

(declare-fun lt!493128 () ListLongMap!15331)

(declare-fun zeroValue!831 () V!41389)

(declare-fun addRemoveCommutativeForDiffKeys!130 (ListLongMap!15331 (_ BitVec 64) V!41389 (_ BitVec 64)) Unit!36180)

(assert (=> b!1100517 (= lt!493122 (addRemoveCommutativeForDiffKeys!130 lt!493128 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831 k!904))))

(declare-fun mapIsEmpty!42577 () Bool)

(declare-fun mapRes!42577 () Bool)

(assert (=> mapIsEmpty!42577 mapRes!42577))

(declare-fun b!1100518 () Bool)

(declare-fun e!628141 () Bool)

(assert (=> b!1100518 (= e!628141 e!628145)))

(declare-fun res!734373 () Bool)

(assert (=> b!1100518 (=> res!734373 e!628145)))

(assert (=> b!1100518 (= res!734373 (= #b0000000000000000000000000000000000000000000000000000000000000000 k!904))))

(declare-fun lt!493130 () ListLongMap!15331)

(assert (=> b!1100518 (= lt!493130 lt!493129)))

(declare-fun lt!493133 () ListLongMap!15331)

(declare-fun lt!493126 () tuple2!17362)

(declare-fun +!3386 (ListLongMap!15331 tuple2!17362) ListLongMap!15331)

(assert (=> b!1100518 (= lt!493129 (+!3386 lt!493133 lt!493126))))

(declare-fun lt!493127 () ListLongMap!15331)

(assert (=> b!1100518 (= lt!493127 lt!493131)))

(assert (=> b!1100518 (= lt!493131 (+!3386 lt!493128 lt!493126))))

(declare-fun lt!493124 () ListLongMap!15331)

(assert (=> b!1100518 (= lt!493130 (+!3386 lt!493124 lt!493126))))

(assert (=> b!1100518 (= lt!493126 (tuple2!17363 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun b!1100519 () Bool)

(declare-fun e!628139 () Bool)

(assert (=> b!1100519 (= e!628144 e!628139)))

(declare-fun res!734376 () Bool)

(assert (=> b!1100519 (=> (not res!734376) (not e!628139))))

(declare-fun lt!493132 () array!71313)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71313 (_ BitVec 32)) Bool)

(assert (=> b!1100519 (= res!734376 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!493132 mask!1414))))

(assert (=> b!1100519 (= lt!493132 (array!71314 (store (arr!34321 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34857 _keys!1070)))))

(declare-fun b!1100520 () Bool)

(declare-fun res!734370 () Bool)

(assert (=> b!1100520 (=> (not res!734370) (not e!628144))))

(assert (=> b!1100520 (= res!734370 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1100521 () Bool)

(declare-fun res!734378 () Bool)

(assert (=> b!1100521 (=> (not res!734378) (not e!628144))))

(declare-datatypes ((List!23978 0))(
  ( (Nil!23975) (Cons!23974 (h!25183 (_ BitVec 64)) (t!34171 List!23978)) )
))
(declare-fun arrayNoDuplicates!0 (array!71313 (_ BitVec 32) List!23978) Bool)

(assert (=> b!1100521 (= res!734378 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23975))))

(declare-fun b!1100522 () Bool)

(declare-fun res!734374 () Bool)

(assert (=> b!1100522 (=> (not res!734374) (not e!628139))))

(assert (=> b!1100522 (= res!734374 (arrayNoDuplicates!0 lt!493132 #b00000000000000000000000000000000 Nil!23975))))

(declare-fun b!1100523 () Bool)

(declare-fun res!734377 () Bool)

(assert (=> b!1100523 (=> (not res!734377) (not e!628144))))

(assert (=> b!1100523 (= res!734377 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34857 _keys!1070))))))

(declare-fun b!1100524 () Bool)

(declare-fun e!628142 () Bool)

(assert (=> b!1100524 (= e!628140 (and e!628142 mapRes!42577))))

(declare-fun condMapEmpty!42577 () Bool)

(declare-fun mapDefault!42577 () ValueCell!12889)

