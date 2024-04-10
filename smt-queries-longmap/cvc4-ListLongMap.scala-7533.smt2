; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95506 () Bool)

(assert start!95506)

(declare-fun b!1078616 () Bool)

(declare-fun res!718738 () Bool)

(declare-fun e!616715 () Bool)

(assert (=> b!1078616 (=> (not res!718738) (not e!616715))))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((array!69309 0))(
  ( (array!69310 (arr!33329 (Array (_ BitVec 32) (_ BitVec 64))) (size!33865 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69309)

(assert (=> b!1078616 (= res!718738 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!33865 _keys!1070))))))

(declare-fun res!718741 () Bool)

(assert (=> start!95506 (=> (not res!718741) (not e!616715))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95506 (= res!718741 (validMask!0 mask!1414))))

(assert (=> start!95506 e!616715))

(assert (=> start!95506 true))

(declare-fun array_inv!25746 (array!69309) Bool)

(assert (=> start!95506 (array_inv!25746 _keys!1070)))

(declare-datatypes ((V!40029 0))(
  ( (V!40030 (val!13145 Int)) )
))
(declare-datatypes ((ValueCell!12379 0))(
  ( (ValueCellFull!12379 (v!15766 V!40029)) (EmptyCell!12379) )
))
(declare-datatypes ((array!69311 0))(
  ( (array!69312 (arr!33330 (Array (_ BitVec 32) ValueCell!12379)) (size!33866 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69311)

(declare-fun e!616712 () Bool)

(declare-fun array_inv!25747 (array!69311) Bool)

(assert (=> start!95506 (and (array_inv!25747 _values!874) e!616712)))

(declare-fun mapNonEmpty!41017 () Bool)

(declare-fun mapRes!41017 () Bool)

(declare-fun tp!78479 () Bool)

(declare-fun e!616713 () Bool)

(assert (=> mapNonEmpty!41017 (= mapRes!41017 (and tp!78479 e!616713))))

(declare-fun mapValue!41017 () ValueCell!12379)

(declare-fun mapKey!41017 () (_ BitVec 32))

(declare-fun mapRest!41017 () (Array (_ BitVec 32) ValueCell!12379))

(assert (=> mapNonEmpty!41017 (= (arr!33330 _values!874) (store mapRest!41017 mapKey!41017 mapValue!41017))))

(declare-fun b!1078617 () Bool)

(declare-fun res!718735 () Bool)

(assert (=> b!1078617 (=> (not res!718735) (not e!616715))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69309 (_ BitVec 32)) Bool)

(assert (=> b!1078617 (= res!718735 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1078618 () Bool)

(declare-fun res!718740 () Bool)

(assert (=> b!1078618 (=> (not res!718740) (not e!616715))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1078618 (= res!718740 (and (= (size!33866 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!33865 _keys!1070) (size!33866 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!41017 () Bool)

(assert (=> mapIsEmpty!41017 mapRes!41017))

(declare-fun b!1078619 () Bool)

(declare-fun res!718736 () Bool)

(assert (=> b!1078619 (=> (not res!718736) (not e!616715))))

(declare-fun k!904 () (_ BitVec 64))

(assert (=> b!1078619 (= res!718736 (= (select (arr!33329 _keys!1070) i!650) k!904))))

(declare-fun b!1078620 () Bool)

(declare-fun res!718739 () Bool)

(assert (=> b!1078620 (=> (not res!718739) (not e!616715))))

(declare-datatypes ((List!23244 0))(
  ( (Nil!23241) (Cons!23240 (h!24449 (_ BitVec 64)) (t!32603 List!23244)) )
))
(declare-fun arrayNoDuplicates!0 (array!69309 (_ BitVec 32) List!23244) Bool)

(assert (=> b!1078620 (= res!718739 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23241))))

(declare-fun b!1078621 () Bool)

(declare-fun e!616717 () Bool)

(assert (=> b!1078621 (= e!616712 (and e!616717 mapRes!41017))))

(declare-fun condMapEmpty!41017 () Bool)

(declare-fun mapDefault!41017 () ValueCell!12379)

