; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96758 () Bool)

(assert start!96758)

(declare-fun b_free!23153 () Bool)

(declare-fun b_next!23153 () Bool)

(assert (=> start!96758 (= b_free!23153 (not b_next!23153))))

(declare-fun tp!81407 () Bool)

(declare-fun b_and!37067 () Bool)

(assert (=> start!96758 (= tp!81407 b_and!37067)))

(declare-fun mapIsEmpty!42586 () Bool)

(declare-fun mapRes!42586 () Bool)

(assert (=> mapIsEmpty!42586 mapRes!42586))

(declare-fun b!1100646 () Bool)

(declare-fun e!628213 () Bool)

(declare-fun tp_is_empty!27203 () Bool)

(assert (=> b!1100646 (= e!628213 tp_is_empty!27203)))

(declare-fun b!1100647 () Bool)

(declare-fun res!734471 () Bool)

(declare-fun e!628215 () Bool)

(assert (=> b!1100647 (=> (not res!734471) (not e!628215))))

(declare-datatypes ((array!71325 0))(
  ( (array!71326 (arr!34327 (Array (_ BitVec 32) (_ BitVec 64))) (size!34863 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!71325)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71325 (_ BitVec 32)) Bool)

(assert (=> b!1100647 (= res!734471 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1100648 () Bool)

(declare-fun res!734477 () Bool)

(assert (=> b!1100648 (=> (not res!734477) (not e!628215))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((V!41397 0))(
  ( (V!41398 (val!13658 Int)) )
))
(declare-datatypes ((ValueCell!12892 0))(
  ( (ValueCellFull!12892 (v!16286 V!41397)) (EmptyCell!12892) )
))
(declare-datatypes ((array!71327 0))(
  ( (array!71328 (arr!34328 (Array (_ BitVec 32) ValueCell!12892)) (size!34864 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!71327)

(assert (=> b!1100648 (= res!734477 (and (= (size!34864 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34863 _keys!1070) (size!34864 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!42586 () Bool)

(declare-fun tp!81406 () Bool)

(declare-fun e!628218 () Bool)

(assert (=> mapNonEmpty!42586 (= mapRes!42586 (and tp!81406 e!628218))))

(declare-fun mapRest!42586 () (Array (_ BitVec 32) ValueCell!12892))

(declare-fun mapValue!42586 () ValueCell!12892)

(declare-fun mapKey!42586 () (_ BitVec 32))

(assert (=> mapNonEmpty!42586 (= (arr!34328 _values!874) (store mapRest!42586 mapKey!42586 mapValue!42586))))

(declare-fun b!1100649 () Bool)

(declare-fun res!734468 () Bool)

(assert (=> b!1100649 (=> (not res!734468) (not e!628215))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1100649 (= res!734468 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34863 _keys!1070))))))

(declare-fun b!1100650 () Bool)

(declare-fun res!734476 () Bool)

(declare-fun e!628217 () Bool)

(assert (=> b!1100650 (=> (not res!734476) (not e!628217))))

(declare-fun lt!493247 () array!71325)

(declare-datatypes ((List!23983 0))(
  ( (Nil!23980) (Cons!23979 (h!25188 (_ BitVec 64)) (t!34182 List!23983)) )
))
(declare-fun arrayNoDuplicates!0 (array!71325 (_ BitVec 32) List!23983) Bool)

(assert (=> b!1100650 (= res!734476 (arrayNoDuplicates!0 lt!493247 #b00000000000000000000000000000000 Nil!23980))))

(declare-fun b!1100651 () Bool)

(declare-fun e!628211 () Bool)

(declare-fun e!628216 () Bool)

(assert (=> b!1100651 (= e!628211 e!628216)))

(declare-fun res!734470 () Bool)

(assert (=> b!1100651 (=> res!734470 e!628216)))

(declare-fun k!904 () (_ BitVec 64))

(assert (=> b!1100651 (= res!734470 (= #b0000000000000000000000000000000000000000000000000000000000000000 k!904))))

(declare-datatypes ((tuple2!17368 0))(
  ( (tuple2!17369 (_1!8695 (_ BitVec 64)) (_2!8695 V!41397)) )
))
(declare-datatypes ((List!23984 0))(
  ( (Nil!23981) (Cons!23980 (h!25189 tuple2!17368) (t!34183 List!23984)) )
))
(declare-datatypes ((ListLongMap!15337 0))(
  ( (ListLongMap!15338 (toList!7684 List!23984)) )
))
(declare-fun lt!493244 () ListLongMap!15337)

(declare-fun lt!493240 () ListLongMap!15337)

(assert (=> b!1100651 (= lt!493244 lt!493240)))

(declare-fun lt!493243 () ListLongMap!15337)

(declare-fun lt!493242 () tuple2!17368)

(declare-fun +!3389 (ListLongMap!15337 tuple2!17368) ListLongMap!15337)

(assert (=> b!1100651 (= lt!493240 (+!3389 lt!493243 lt!493242))))

(declare-fun lt!493241 () ListLongMap!15337)

(declare-fun lt!493246 () ListLongMap!15337)

(assert (=> b!1100651 (= lt!493241 lt!493246)))

(declare-fun lt!493248 () ListLongMap!15337)

(assert (=> b!1100651 (= lt!493246 (+!3389 lt!493248 lt!493242))))

(declare-fun lt!493239 () ListLongMap!15337)

(assert (=> b!1100651 (= lt!493244 (+!3389 lt!493239 lt!493242))))

(declare-fun zeroValue!831 () V!41397)

(assert (=> b!1100651 (= lt!493242 (tuple2!17369 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun b!1100652 () Bool)

(assert (=> b!1100652 (= e!628215 e!628217)))

(declare-fun res!734474 () Bool)

(assert (=> b!1100652 (=> (not res!734474) (not e!628217))))

(assert (=> b!1100652 (= res!734474 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!493247 mask!1414))))

(assert (=> b!1100652 (= lt!493247 (array!71326 (store (arr!34327 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34863 _keys!1070)))))

(declare-fun b!1100653 () Bool)

(assert (=> b!1100653 (= e!628218 tp_is_empty!27203)))

(declare-fun b!1100654 () Bool)

(declare-fun res!734467 () Bool)

(assert (=> b!1100654 (=> (not res!734467) (not e!628215))))

(assert (=> b!1100654 (= res!734467 (= (select (arr!34327 _keys!1070) i!650) k!904))))

(declare-fun b!1100655 () Bool)

(declare-fun res!734473 () Bool)

(assert (=> b!1100655 (=> (not res!734473) (not e!628215))))

(assert (=> b!1100655 (= res!734473 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23980))))

(declare-fun res!734469 () Bool)

(assert (=> start!96758 (=> (not res!734469) (not e!628215))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96758 (= res!734469 (validMask!0 mask!1414))))

(assert (=> start!96758 e!628215))

(assert (=> start!96758 tp!81407))

(assert (=> start!96758 true))

(assert (=> start!96758 tp_is_empty!27203))

(declare-fun array_inv!26440 (array!71325) Bool)

(assert (=> start!96758 (array_inv!26440 _keys!1070)))

(declare-fun e!628212 () Bool)

(declare-fun array_inv!26441 (array!71327) Bool)

(assert (=> start!96758 (and (array_inv!26441 _values!874) e!628212)))

(declare-fun b!1100656 () Bool)

(declare-fun res!734472 () Bool)

(assert (=> b!1100656 (=> (not res!734472) (not e!628215))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1100656 (= res!734472 (validKeyInArray!0 k!904))))

(declare-fun b!1100657 () Bool)

(declare-fun -!969 (ListLongMap!15337 (_ BitVec 64)) ListLongMap!15337)

(assert (=> b!1100657 (= e!628216 (= (-!969 lt!493241 k!904) lt!493244))))

(assert (=> b!1100657 (= (-!969 lt!493246 k!904) lt!493240)))

(declare-datatypes ((Unit!36184 0))(
  ( (Unit!36185) )
))
(declare-fun lt!493251 () Unit!36184)

(declare-fun addRemoveCommutativeForDiffKeys!132 (ListLongMap!15337 (_ BitVec 64) V!41397 (_ BitVec 64)) Unit!36184)

(assert (=> b!1100657 (= lt!493251 (addRemoveCommutativeForDiffKeys!132 lt!493248 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831 k!904))))

(declare-fun b!1100658 () Bool)

(assert (=> b!1100658 (= e!628212 (and e!628213 mapRes!42586))))

(declare-fun condMapEmpty!42586 () Bool)

(declare-fun mapDefault!42586 () ValueCell!12892)

