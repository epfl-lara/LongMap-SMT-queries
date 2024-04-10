; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96086 () Bool)

(assert start!96086)

(declare-fun b_free!22739 () Bool)

(declare-fun b_next!22739 () Bool)

(assert (=> start!96086 (= b_free!22739 (not b_next!22739))))

(declare-fun tp!80066 () Bool)

(declare-fun b_and!36153 () Bool)

(assert (=> start!96086 (= tp!80066 b_and!36153)))

(declare-fun b!1090007 () Bool)

(declare-fun res!727132 () Bool)

(declare-fun e!622558 () Bool)

(assert (=> b!1090007 (=> (not res!727132) (not e!622558))))

(declare-fun k!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1090007 (= res!727132 (validKeyInArray!0 k!904))))

(declare-fun mapIsEmpty!41866 () Bool)

(declare-fun mapRes!41866 () Bool)

(assert (=> mapIsEmpty!41866 mapRes!41866))

(declare-fun b!1090008 () Bool)

(declare-fun res!727131 () Bool)

(assert (=> b!1090008 (=> (not res!727131) (not e!622558))))

(declare-datatypes ((array!70405 0))(
  ( (array!70406 (arr!33876 (Array (_ BitVec 32) (_ BitVec 64))) (size!34412 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70405)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70405 (_ BitVec 32)) Bool)

(assert (=> b!1090008 (= res!727131 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1090009 () Bool)

(declare-fun e!622561 () Bool)

(declare-fun tp_is_empty!26741 () Bool)

(assert (=> b!1090009 (= e!622561 tp_is_empty!26741)))

(declare-fun res!727137 () Bool)

(assert (=> start!96086 (=> (not res!727137) (not e!622558))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96086 (= res!727137 (validMask!0 mask!1414))))

(assert (=> start!96086 e!622558))

(assert (=> start!96086 tp!80066))

(assert (=> start!96086 true))

(assert (=> start!96086 tp_is_empty!26741))

(declare-fun array_inv!26124 (array!70405) Bool)

(assert (=> start!96086 (array_inv!26124 _keys!1070)))

(declare-datatypes ((V!40781 0))(
  ( (V!40782 (val!13427 Int)) )
))
(declare-datatypes ((ValueCell!12661 0))(
  ( (ValueCellFull!12661 (v!16048 V!40781)) (EmptyCell!12661) )
))
(declare-datatypes ((array!70407 0))(
  ( (array!70408 (arr!33877 (Array (_ BitVec 32) ValueCell!12661)) (size!34413 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70407)

(declare-fun e!622557 () Bool)

(declare-fun array_inv!26125 (array!70407) Bool)

(assert (=> start!96086 (and (array_inv!26125 _values!874) e!622557)))

(declare-fun b!1090010 () Bool)

(declare-fun e!622559 () Bool)

(assert (=> b!1090010 (= e!622557 (and e!622559 mapRes!41866))))

(declare-fun condMapEmpty!41866 () Bool)

(declare-fun mapDefault!41866 () ValueCell!12661)

