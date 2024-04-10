; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95996 () Bool)

(assert start!95996)

(declare-fun b_free!22649 () Bool)

(declare-fun b_next!22649 () Bool)

(assert (=> start!95996 (= b_free!22649 (not b_next!22649))))

(declare-fun tp!79795 () Bool)

(declare-fun b_and!35973 () Bool)

(assert (=> start!95996 (= tp!79795 b_and!35973)))

(declare-fun b!1088018 () Bool)

(declare-fun res!725636 () Bool)

(declare-fun e!621476 () Bool)

(assert (=> b!1088018 (=> (not res!725636) (not e!621476))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((array!70227 0))(
  ( (array!70228 (arr!33787 (Array (_ BitVec 32) (_ BitVec 64))) (size!34323 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70227)

(declare-datatypes ((V!40661 0))(
  ( (V!40662 (val!13382 Int)) )
))
(declare-datatypes ((ValueCell!12616 0))(
  ( (ValueCellFull!12616 (v!16003 V!40661)) (EmptyCell!12616) )
))
(declare-datatypes ((array!70229 0))(
  ( (array!70230 (arr!33788 (Array (_ BitVec 32) ValueCell!12616)) (size!34324 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70229)

(assert (=> b!1088018 (= res!725636 (and (= (size!34324 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34323 _keys!1070) (size!34324 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1088019 () Bool)

(declare-fun res!725642 () Bool)

(assert (=> b!1088019 (=> (not res!725642) (not e!621476))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1088019 (= res!725642 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34323 _keys!1070))))))

(declare-fun b!1088020 () Bool)

(declare-fun res!725643 () Bool)

(assert (=> b!1088020 (=> (not res!725643) (not e!621476))))

(declare-datatypes ((List!23572 0))(
  ( (Nil!23569) (Cons!23568 (h!24777 (_ BitVec 64)) (t!33279 List!23572)) )
))
(declare-fun arrayNoDuplicates!0 (array!70227 (_ BitVec 32) List!23572) Bool)

(assert (=> b!1088020 (= res!725643 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23569))))

(declare-fun b!1088021 () Bool)

(declare-fun res!725641 () Bool)

(assert (=> b!1088021 (=> (not res!725641) (not e!621476))))

(declare-fun k!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1088021 (= res!725641 (validKeyInArray!0 k!904))))

(declare-fun res!725640 () Bool)

(assert (=> start!95996 (=> (not res!725640) (not e!621476))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95996 (= res!725640 (validMask!0 mask!1414))))

(assert (=> start!95996 e!621476))

(assert (=> start!95996 tp!79795))

(assert (=> start!95996 true))

(declare-fun tp_is_empty!26651 () Bool)

(assert (=> start!95996 tp_is_empty!26651))

(declare-fun array_inv!26058 (array!70227) Bool)

(assert (=> start!95996 (array_inv!26058 _keys!1070)))

(declare-fun e!621482 () Bool)

(declare-fun array_inv!26059 (array!70229) Bool)

(assert (=> start!95996 (and (array_inv!26059 _values!874) e!621482)))

(declare-fun b!1088022 () Bool)

(declare-fun res!725633 () Bool)

(assert (=> b!1088022 (=> (not res!725633) (not e!621476))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70227 (_ BitVec 32)) Bool)

(assert (=> b!1088022 (= res!725633 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1088023 () Bool)

(declare-fun e!621475 () Bool)

(declare-fun mapRes!41731 () Bool)

(assert (=> b!1088023 (= e!621482 (and e!621475 mapRes!41731))))

(declare-fun condMapEmpty!41731 () Bool)

(declare-fun mapDefault!41731 () ValueCell!12616)

