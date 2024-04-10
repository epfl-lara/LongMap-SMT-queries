; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97242 () Bool)

(assert start!97242)

(declare-fun b!1106733 () Bool)

(declare-fun e!631512 () Bool)

(declare-fun tp_is_empty!27473 () Bool)

(assert (=> b!1106733 (= e!631512 tp_is_empty!27473)))

(declare-fun b!1106734 () Bool)

(declare-fun res!738590 () Bool)

(declare-fun e!631513 () Bool)

(assert (=> b!1106734 (=> (not res!738590) (not e!631513))))

(declare-datatypes ((array!71863 0))(
  ( (array!71864 (arr!34584 (Array (_ BitVec 32) (_ BitVec 64))) (size!35120 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!71863)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71863 (_ BitVec 32)) Bool)

(assert (=> b!1106734 (= res!738590 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1106735 () Bool)

(declare-fun e!631514 () Bool)

(declare-fun e!631511 () Bool)

(declare-fun mapRes!43027 () Bool)

(assert (=> b!1106735 (= e!631514 (and e!631511 mapRes!43027))))

(declare-fun condMapEmpty!43027 () Bool)

(declare-datatypes ((V!41757 0))(
  ( (V!41758 (val!13793 Int)) )
))
(declare-datatypes ((ValueCell!13027 0))(
  ( (ValueCellFull!13027 (v!16426 V!41757)) (EmptyCell!13027) )
))
(declare-datatypes ((array!71865 0))(
  ( (array!71866 (arr!34585 (Array (_ BitVec 32) ValueCell!13027)) (size!35121 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71865)

(declare-fun mapDefault!43027 () ValueCell!13027)

