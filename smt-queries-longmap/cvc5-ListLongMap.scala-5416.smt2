; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72280 () Bool)

(assert start!72280)

(declare-fun b!837461 () Bool)

(declare-fun e!467396 () Bool)

(declare-fun tp_is_empty!15331 () Bool)

(assert (=> b!837461 (= e!467396 tp_is_empty!15331)))

(declare-fun b!837462 () Bool)

(declare-fun res!569560 () Bool)

(declare-fun e!467398 () Bool)

(assert (=> b!837462 (=> (not res!569560) (not e!467398))))

(declare-datatypes ((array!46960 0))(
  ( (array!46961 (arr!22511 (Array (_ BitVec 32) (_ BitVec 64))) (size!22951 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!46960)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46960 (_ BitVec 32)) Bool)

(assert (=> b!837462 (= res!569560 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapIsEmpty!24596 () Bool)

(declare-fun mapRes!24596 () Bool)

(assert (=> mapIsEmpty!24596 mapRes!24596))

(declare-fun b!837463 () Bool)

(declare-fun res!569559 () Bool)

(assert (=> b!837463 (=> (not res!569559) (not e!467398))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!837463 (= res!569559 (validMask!0 mask!1196))))

(declare-fun mapNonEmpty!24596 () Bool)

(declare-fun tp!47590 () Bool)

(assert (=> mapNonEmpty!24596 (= mapRes!24596 (and tp!47590 e!467396))))

(declare-datatypes ((V!25489 0))(
  ( (V!25490 (val!7713 Int)) )
))
(declare-datatypes ((ValueCell!7226 0))(
  ( (ValueCellFull!7226 (v!10138 V!25489)) (EmptyCell!7226) )
))
(declare-fun mapValue!24596 () ValueCell!7226)

(declare-fun mapRest!24596 () (Array (_ BitVec 32) ValueCell!7226))

(declare-fun mapKey!24596 () (_ BitVec 32))

(declare-datatypes ((array!46962 0))(
  ( (array!46963 (arr!22512 (Array (_ BitVec 32) ValueCell!7226)) (size!22952 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!46962)

(assert (=> mapNonEmpty!24596 (= (arr!22512 _values!688) (store mapRest!24596 mapKey!24596 mapValue!24596))))

(declare-fun b!837464 () Bool)

(declare-fun e!467395 () Bool)

(declare-fun e!467394 () Bool)

(assert (=> b!837464 (= e!467395 (and e!467394 mapRes!24596))))

(declare-fun condMapEmpty!24596 () Bool)

(declare-fun mapDefault!24596 () ValueCell!7226)

