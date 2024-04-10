; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96070 () Bool)

(assert start!96070)

(declare-fun b_free!22723 () Bool)

(declare-fun b_next!22723 () Bool)

(assert (=> start!96070 (= b_free!22723 (not b_next!22723))))

(declare-fun tp!80018 () Bool)

(declare-fun b_and!36121 () Bool)

(assert (=> start!96070 (= tp!80018 b_and!36121)))

(declare-fun b!1089646 () Bool)

(declare-fun res!726856 () Bool)

(declare-fun e!622368 () Bool)

(assert (=> b!1089646 (=> (not res!726856) (not e!622368))))

(declare-datatypes ((array!70373 0))(
  ( (array!70374 (arr!33860 (Array (_ BitVec 32) (_ BitVec 64))) (size!34396 (_ BitVec 32))) )
))
(declare-fun lt!485871 () array!70373)

(declare-datatypes ((List!23638 0))(
  ( (Nil!23635) (Cons!23634 (h!24843 (_ BitVec 64)) (t!33419 List!23638)) )
))
(declare-fun arrayNoDuplicates!0 (array!70373 (_ BitVec 32) List!23638) Bool)

(assert (=> b!1089646 (= res!726856 (arrayNoDuplicates!0 lt!485871 #b00000000000000000000000000000000 Nil!23635))))

(declare-fun mapNonEmpty!41842 () Bool)

(declare-fun mapRes!41842 () Bool)

(declare-fun tp!80017 () Bool)

(declare-fun e!622370 () Bool)

(assert (=> mapNonEmpty!41842 (= mapRes!41842 (and tp!80017 e!622370))))

(declare-datatypes ((V!40761 0))(
  ( (V!40762 (val!13419 Int)) )
))
(declare-datatypes ((ValueCell!12653 0))(
  ( (ValueCellFull!12653 (v!16040 V!40761)) (EmptyCell!12653) )
))
(declare-datatypes ((array!70375 0))(
  ( (array!70376 (arr!33861 (Array (_ BitVec 32) ValueCell!12653)) (size!34397 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70375)

(declare-fun mapValue!41842 () ValueCell!12653)

(declare-fun mapKey!41842 () (_ BitVec 32))

(declare-fun mapRest!41842 () (Array (_ BitVec 32) ValueCell!12653))

(assert (=> mapNonEmpty!41842 (= (arr!33861 _values!874) (store mapRest!41842 mapKey!41842 mapValue!41842))))

(declare-fun b!1089647 () Bool)

(declare-fun tp_is_empty!26725 () Bool)

(assert (=> b!1089647 (= e!622370 tp_is_empty!26725)))

(declare-fun b!1089648 () Bool)

(declare-fun e!622366 () Bool)

(declare-fun e!622363 () Bool)

(assert (=> b!1089648 (= e!622366 (and e!622363 mapRes!41842))))

(declare-fun condMapEmpty!41842 () Bool)

(declare-fun mapDefault!41842 () ValueCell!12653)

