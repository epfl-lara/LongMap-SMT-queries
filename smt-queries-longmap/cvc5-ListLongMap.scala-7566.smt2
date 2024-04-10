; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95716 () Bool)

(assert start!95716)

(declare-fun b_free!22369 () Bool)

(declare-fun b_next!22369 () Bool)

(assert (=> start!95716 (= b_free!22369 (not b_next!22369))))

(declare-fun tp!78955 () Bool)

(declare-fun b_and!35413 () Bool)

(assert (=> start!95716 (= tp!78955 b_and!35413)))

(declare-fun mapIsEmpty!41311 () Bool)

(declare-fun mapRes!41311 () Bool)

(assert (=> mapIsEmpty!41311 mapRes!41311))

(declare-fun b!1082223 () Bool)

(declare-fun e!618502 () Bool)

(declare-fun e!618498 () Bool)

(assert (=> b!1082223 (= e!618502 e!618498)))

(declare-fun res!721379 () Bool)

(assert (=> b!1082223 (=> (not res!721379) (not e!618498))))

(declare-datatypes ((array!69689 0))(
  ( (array!69690 (arr!33518 (Array (_ BitVec 32) (_ BitVec 64))) (size!34054 (_ BitVec 32))) )
))
(declare-fun lt!479551 () array!69689)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69689 (_ BitVec 32)) Bool)

(assert (=> b!1082223 (= res!721379 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!479551 mask!1414))))

(declare-fun _keys!1070 () array!69689)

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1082223 (= lt!479551 (array!69690 (store (arr!33518 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34054 _keys!1070)))))

(declare-fun mapNonEmpty!41311 () Bool)

(declare-fun tp!78956 () Bool)

(declare-fun e!618503 () Bool)

(assert (=> mapNonEmpty!41311 (= mapRes!41311 (and tp!78956 e!618503))))

(declare-datatypes ((V!40289 0))(
  ( (V!40290 (val!13242 Int)) )
))
(declare-datatypes ((ValueCell!12476 0))(
  ( (ValueCellFull!12476 (v!15863 V!40289)) (EmptyCell!12476) )
))
(declare-datatypes ((array!69691 0))(
  ( (array!69692 (arr!33519 (Array (_ BitVec 32) ValueCell!12476)) (size!34055 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69691)

(declare-fun mapValue!41311 () ValueCell!12476)

(declare-fun mapKey!41311 () (_ BitVec 32))

(declare-fun mapRest!41311 () (Array (_ BitVec 32) ValueCell!12476))

(assert (=> mapNonEmpty!41311 (= (arr!33519 _values!874) (store mapRest!41311 mapKey!41311 mapValue!41311))))

(declare-fun b!1082224 () Bool)

(declare-fun e!618499 () Bool)

(declare-fun e!618500 () Bool)

(assert (=> b!1082224 (= e!618499 (and e!618500 mapRes!41311))))

(declare-fun condMapEmpty!41311 () Bool)

(declare-fun mapDefault!41311 () ValueCell!12476)

