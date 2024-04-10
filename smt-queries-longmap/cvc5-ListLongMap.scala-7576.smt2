; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95776 () Bool)

(assert start!95776)

(declare-fun b_free!22429 () Bool)

(declare-fun b_next!22429 () Bool)

(assert (=> start!95776 (= b_free!22429 (not b_next!22429))))

(declare-fun tp!79135 () Bool)

(declare-fun b_and!35533 () Bool)

(assert (=> start!95776 (= tp!79135 b_and!35533)))

(declare-fun b!1083364 () Bool)

(declare-fun res!722195 () Bool)

(declare-fun e!619042 () Bool)

(assert (=> b!1083364 (=> (not res!722195) (not e!619042))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((array!69805 0))(
  ( (array!69806 (arr!33576 (Array (_ BitVec 32) (_ BitVec 64))) (size!34112 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69805)

(declare-datatypes ((V!40369 0))(
  ( (V!40370 (val!13272 Int)) )
))
(declare-datatypes ((ValueCell!12506 0))(
  ( (ValueCellFull!12506 (v!15893 V!40369)) (EmptyCell!12506) )
))
(declare-datatypes ((array!69807 0))(
  ( (array!69808 (arr!33577 (Array (_ BitVec 32) ValueCell!12506)) (size!34113 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69807)

(assert (=> b!1083364 (= res!722195 (and (= (size!34113 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34112 _keys!1070) (size!34113 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1083365 () Bool)

(declare-fun res!722190 () Bool)

(assert (=> b!1083365 (=> (not res!722190) (not e!619042))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69805 (_ BitVec 32)) Bool)

(assert (=> b!1083365 (= res!722190 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1083366 () Bool)

(declare-fun e!619040 () Bool)

(declare-fun tp_is_empty!26431 () Bool)

(assert (=> b!1083366 (= e!619040 tp_is_empty!26431)))

(declare-fun b!1083367 () Bool)

(declare-fun res!722196 () Bool)

(declare-fun e!619041 () Bool)

(assert (=> b!1083367 (=> (not res!722196) (not e!619041))))

(declare-fun lt!480043 () array!69805)

(declare-datatypes ((List!23405 0))(
  ( (Nil!23402) (Cons!23401 (h!24610 (_ BitVec 64)) (t!32892 List!23405)) )
))
(declare-fun arrayNoDuplicates!0 (array!69805 (_ BitVec 32) List!23405) Bool)

(assert (=> b!1083367 (= res!722196 (arrayNoDuplicates!0 lt!480043 #b00000000000000000000000000000000 Nil!23402))))

(declare-fun b!1083368 () Bool)

(declare-fun e!619038 () Bool)

(assert (=> b!1083368 (= e!619038 tp_is_empty!26431)))

(declare-fun b!1083369 () Bool)

(declare-fun e!619039 () Bool)

(declare-fun mapRes!41401 () Bool)

(assert (=> b!1083369 (= e!619039 (and e!619038 mapRes!41401))))

(declare-fun condMapEmpty!41401 () Bool)

(declare-fun mapDefault!41401 () ValueCell!12506)

