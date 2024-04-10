; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95782 () Bool)

(assert start!95782)

(declare-fun b_free!22435 () Bool)

(declare-fun b_next!22435 () Bool)

(assert (=> start!95782 (= b_free!22435 (not b_next!22435))))

(declare-fun tp!79153 () Bool)

(declare-fun b_and!35545 () Bool)

(assert (=> start!95782 (= tp!79153 b_and!35545)))

(declare-fun b!1083477 () Bool)

(declare-fun res!722270 () Bool)

(declare-fun e!619092 () Bool)

(assert (=> b!1083477 (=> (not res!722270) (not e!619092))))

(declare-datatypes ((array!69817 0))(
  ( (array!69818 (arr!33582 (Array (_ BitVec 32) (_ BitVec 64))) (size!34118 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69817)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69817 (_ BitVec 32)) Bool)

(assert (=> b!1083477 (= res!722270 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun mapIsEmpty!41410 () Bool)

(declare-fun mapRes!41410 () Bool)

(assert (=> mapIsEmpty!41410 mapRes!41410))

(declare-fun b!1083478 () Bool)

(declare-fun e!619093 () Bool)

(assert (=> b!1083478 (= e!619092 e!619093)))

(declare-fun res!722269 () Bool)

(assert (=> b!1083478 (=> (not res!722269) (not e!619093))))

(declare-fun lt!480095 () array!69817)

(assert (=> b!1083478 (= res!722269 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!480095 mask!1414))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1083478 (= lt!480095 (array!69818 (store (arr!33582 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34118 _keys!1070)))))

(declare-fun b!1083479 () Bool)

(declare-fun res!722276 () Bool)

(assert (=> b!1083479 (=> (not res!722276) (not e!619092))))

(assert (=> b!1083479 (= res!722276 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34118 _keys!1070))))))

(declare-fun res!722273 () Bool)

(assert (=> start!95782 (=> (not res!722273) (not e!619092))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95782 (= res!722273 (validMask!0 mask!1414))))

(assert (=> start!95782 e!619092))

(assert (=> start!95782 tp!79153))

(assert (=> start!95782 true))

(declare-fun tp_is_empty!26437 () Bool)

(assert (=> start!95782 tp_is_empty!26437))

(declare-fun array_inv!25918 (array!69817) Bool)

(assert (=> start!95782 (array_inv!25918 _keys!1070)))

(declare-datatypes ((V!40377 0))(
  ( (V!40378 (val!13275 Int)) )
))
(declare-datatypes ((ValueCell!12509 0))(
  ( (ValueCellFull!12509 (v!15896 V!40377)) (EmptyCell!12509) )
))
(declare-datatypes ((array!69819 0))(
  ( (array!69820 (arr!33583 (Array (_ BitVec 32) ValueCell!12509)) (size!34119 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69819)

(declare-fun e!619095 () Bool)

(declare-fun array_inv!25919 (array!69819) Bool)

(assert (=> start!95782 (and (array_inv!25919 _values!874) e!619095)))

(declare-fun b!1083480 () Bool)

(declare-fun e!619094 () Bool)

(assert (=> b!1083480 (= e!619094 tp_is_empty!26437)))

(declare-fun b!1083481 () Bool)

(declare-fun res!722272 () Bool)

(assert (=> b!1083481 (=> (not res!722272) (not e!619092))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1083481 (= res!722272 (and (= (size!34119 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34118 _keys!1070) (size!34119 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1083482 () Bool)

(declare-fun res!722271 () Bool)

(assert (=> b!1083482 (=> (not res!722271) (not e!619092))))

(declare-fun k!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1083482 (= res!722271 (validKeyInArray!0 k!904))))

(declare-fun mapNonEmpty!41410 () Bool)

(declare-fun tp!79154 () Bool)

(assert (=> mapNonEmpty!41410 (= mapRes!41410 (and tp!79154 e!619094))))

(declare-fun mapRest!41410 () (Array (_ BitVec 32) ValueCell!12509))

(declare-fun mapKey!41410 () (_ BitVec 32))

(declare-fun mapValue!41410 () ValueCell!12509)

(assert (=> mapNonEmpty!41410 (= (arr!33583 _values!874) (store mapRest!41410 mapKey!41410 mapValue!41410))))

(declare-fun b!1083483 () Bool)

(declare-fun res!722277 () Bool)

(assert (=> b!1083483 (=> (not res!722277) (not e!619093))))

(declare-datatypes ((List!23409 0))(
  ( (Nil!23406) (Cons!23405 (h!24614 (_ BitVec 64)) (t!32902 List!23409)) )
))
(declare-fun arrayNoDuplicates!0 (array!69817 (_ BitVec 32) List!23409) Bool)

(assert (=> b!1083483 (= res!722277 (arrayNoDuplicates!0 lt!480095 #b00000000000000000000000000000000 Nil!23406))))

(declare-fun b!1083484 () Bool)

(declare-fun e!619096 () Bool)

(assert (=> b!1083484 (= e!619096 tp_is_empty!26437)))

(declare-fun b!1083485 () Bool)

(assert (=> b!1083485 (= e!619095 (and e!619096 mapRes!41410))))

(declare-fun condMapEmpty!41410 () Bool)

(declare-fun mapDefault!41410 () ValueCell!12509)

