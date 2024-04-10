; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95732 () Bool)

(assert start!95732)

(declare-fun b_free!22385 () Bool)

(declare-fun b_next!22385 () Bool)

(assert (=> start!95732 (= b_free!22385 (not b_next!22385))))

(declare-fun tp!79003 () Bool)

(declare-fun b_and!35445 () Bool)

(assert (=> start!95732 (= tp!79003 b_and!35445)))

(declare-fun b!1082527 () Bool)

(declare-fun e!618644 () Bool)

(declare-fun e!618642 () Bool)

(assert (=> b!1082527 (= e!618644 e!618642)))

(declare-fun res!721596 () Bool)

(assert (=> b!1082527 (=> (not res!721596) (not e!618642))))

(declare-datatypes ((array!69721 0))(
  ( (array!69722 (arr!33534 (Array (_ BitVec 32) (_ BitVec 64))) (size!34070 (_ BitVec 32))) )
))
(declare-fun lt!479646 () array!69721)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69721 (_ BitVec 32)) Bool)

(assert (=> b!1082527 (= res!721596 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!479646 mask!1414))))

(declare-fun _keys!1070 () array!69721)

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1082527 (= lt!479646 (array!69722 (store (arr!33534 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34070 _keys!1070)))))

(declare-fun mapIsEmpty!41335 () Bool)

(declare-fun mapRes!41335 () Bool)

(assert (=> mapIsEmpty!41335 mapRes!41335))

(declare-fun mapNonEmpty!41335 () Bool)

(declare-fun tp!79004 () Bool)

(declare-fun e!618645 () Bool)

(assert (=> mapNonEmpty!41335 (= mapRes!41335 (and tp!79004 e!618645))))

(declare-datatypes ((V!40309 0))(
  ( (V!40310 (val!13250 Int)) )
))
(declare-datatypes ((ValueCell!12484 0))(
  ( (ValueCellFull!12484 (v!15871 V!40309)) (EmptyCell!12484) )
))
(declare-datatypes ((array!69723 0))(
  ( (array!69724 (arr!33535 (Array (_ BitVec 32) ValueCell!12484)) (size!34071 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69723)

(declare-fun mapValue!41335 () ValueCell!12484)

(declare-fun mapKey!41335 () (_ BitVec 32))

(declare-fun mapRest!41335 () (Array (_ BitVec 32) ValueCell!12484))

(assert (=> mapNonEmpty!41335 (= (arr!33535 _values!874) (store mapRest!41335 mapKey!41335 mapValue!41335))))

(declare-fun b!1082528 () Bool)

(declare-fun res!721595 () Bool)

(assert (=> b!1082528 (=> (not res!721595) (not e!618644))))

(assert (=> b!1082528 (= res!721595 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1082529 () Bool)

(declare-fun res!721599 () Bool)

(assert (=> b!1082529 (=> (not res!721599) (not e!618642))))

(declare-datatypes ((List!23373 0))(
  ( (Nil!23370) (Cons!23369 (h!24578 (_ BitVec 64)) (t!32816 List!23373)) )
))
(declare-fun arrayNoDuplicates!0 (array!69721 (_ BitVec 32) List!23373) Bool)

(assert (=> b!1082529 (= res!721599 (arrayNoDuplicates!0 lt!479646 #b00000000000000000000000000000000 Nil!23370))))

(declare-fun b!1082530 () Bool)

(declare-fun res!721597 () Bool)

(assert (=> b!1082530 (=> (not res!721597) (not e!618644))))

(declare-fun k!904 () (_ BitVec 64))

(assert (=> b!1082530 (= res!721597 (= (select (arr!33534 _keys!1070) i!650) k!904))))

(declare-fun b!1082531 () Bool)

(declare-fun res!721600 () Bool)

(assert (=> b!1082531 (=> (not res!721600) (not e!618644))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1082531 (= res!721600 (and (= (size!34071 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34070 _keys!1070) (size!34071 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1082532 () Bool)

(declare-fun e!618643 () Bool)

(declare-fun e!618646 () Bool)

(assert (=> b!1082532 (= e!618643 (and e!618646 mapRes!41335))))

(declare-fun condMapEmpty!41335 () Bool)

(declare-fun mapDefault!41335 () ValueCell!12484)

