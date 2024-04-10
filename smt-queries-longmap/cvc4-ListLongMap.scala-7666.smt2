; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96320 () Bool)

(assert start!96320)

(declare-fun res!730476 () Bool)

(declare-fun e!624947 () Bool)

(assert (=> start!96320 (=> (not res!730476) (not e!624947))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96320 (= res!730476 (validMask!0 mask!1414))))

(assert (=> start!96320 e!624947))

(assert (=> start!96320 true))

(declare-datatypes ((array!70863 0))(
  ( (array!70864 (arr!34105 (Array (_ BitVec 32) (_ BitVec 64))) (size!34641 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70863)

(declare-fun array_inv!26280 (array!70863) Bool)

(assert (=> start!96320 (array_inv!26280 _keys!1070)))

(declare-datatypes ((V!41093 0))(
  ( (V!41094 (val!13544 Int)) )
))
(declare-datatypes ((ValueCell!12778 0))(
  ( (ValueCellFull!12778 (v!16165 V!41093)) (EmptyCell!12778) )
))
(declare-datatypes ((array!70865 0))(
  ( (array!70866 (arr!34106 (Array (_ BitVec 32) ValueCell!12778)) (size!34642 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70865)

(declare-fun e!624943 () Bool)

(declare-fun array_inv!26281 (array!70865) Bool)

(assert (=> start!96320 (and (array_inv!26281 _values!874) e!624943)))

(declare-fun b!1094615 () Bool)

(declare-fun res!730472 () Bool)

(assert (=> b!1094615 (=> (not res!730472) (not e!624947))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1094615 (= res!730472 (and (= (size!34642 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34641 _keys!1070) (size!34642 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1094616 () Bool)

(declare-fun res!730471 () Bool)

(assert (=> b!1094616 (=> (not res!730471) (not e!624947))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1094616 (= res!730471 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34641 _keys!1070))))))

(declare-fun mapIsEmpty!42217 () Bool)

(declare-fun mapRes!42217 () Bool)

(assert (=> mapIsEmpty!42217 mapRes!42217))

(declare-fun b!1094617 () Bool)

(declare-fun e!624945 () Bool)

(declare-fun tp_is_empty!26975 () Bool)

(assert (=> b!1094617 (= e!624945 tp_is_empty!26975)))

(declare-fun mapNonEmpty!42217 () Bool)

(declare-fun tp!80732 () Bool)

(declare-fun e!624944 () Bool)

(assert (=> mapNonEmpty!42217 (= mapRes!42217 (and tp!80732 e!624944))))

(declare-fun mapKey!42217 () (_ BitVec 32))

(declare-fun mapValue!42217 () ValueCell!12778)

(declare-fun mapRest!42217 () (Array (_ BitVec 32) ValueCell!12778))

(assert (=> mapNonEmpty!42217 (= (arr!34106 _values!874) (store mapRest!42217 mapKey!42217 mapValue!42217))))

(declare-fun b!1094618 () Bool)

(declare-fun res!730473 () Bool)

(assert (=> b!1094618 (=> (not res!730473) (not e!624947))))

(declare-fun k!904 () (_ BitVec 64))

(assert (=> b!1094618 (= res!730473 (= (select (arr!34105 _keys!1070) i!650) k!904))))

(declare-fun b!1094619 () Bool)

(declare-fun res!730475 () Bool)

(assert (=> b!1094619 (=> (not res!730475) (not e!624947))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1094619 (= res!730475 (validKeyInArray!0 k!904))))

(declare-fun b!1094620 () Bool)

(declare-fun res!730470 () Bool)

(assert (=> b!1094620 (=> (not res!730470) (not e!624947))))

(declare-datatypes ((List!23823 0))(
  ( (Nil!23820) (Cons!23819 (h!25028 (_ BitVec 64)) (t!33830 List!23823)) )
))
(declare-fun arrayNoDuplicates!0 (array!70863 (_ BitVec 32) List!23823) Bool)

(assert (=> b!1094620 (= res!730470 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23820))))

(declare-fun b!1094621 () Bool)

(assert (=> b!1094621 (= e!624944 tp_is_empty!26975)))

(declare-fun b!1094622 () Bool)

(assert (=> b!1094622 (= e!624947 false)))

(declare-fun lt!489673 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70863 (_ BitVec 32)) Bool)

(assert (=> b!1094622 (= lt!489673 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!70864 (store (arr!34105 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34641 _keys!1070)) mask!1414))))

(declare-fun b!1094623 () Bool)

(declare-fun res!730474 () Bool)

(assert (=> b!1094623 (=> (not res!730474) (not e!624947))))

(assert (=> b!1094623 (= res!730474 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1094624 () Bool)

(assert (=> b!1094624 (= e!624943 (and e!624945 mapRes!42217))))

(declare-fun condMapEmpty!42217 () Bool)

(declare-fun mapDefault!42217 () ValueCell!12778)

