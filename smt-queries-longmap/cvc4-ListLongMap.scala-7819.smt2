; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97662 () Bool)

(assert start!97662)

(declare-fun b!1116147 () Bool)

(declare-fun res!745221 () Bool)

(declare-fun e!635961 () Bool)

(assert (=> b!1116147 (=> (not res!745221) (not e!635961))))

(declare-datatypes ((array!72683 0))(
  ( (array!72684 (arr!34994 (Array (_ BitVec 32) (_ BitVec 64))) (size!35530 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72683)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72683 (_ BitVec 32)) Bool)

(assert (=> b!1116147 (= res!745221 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1116148 () Bool)

(declare-fun e!635958 () Bool)

(declare-fun tp_is_empty!27893 () Bool)

(assert (=> b!1116148 (= e!635958 tp_is_empty!27893)))

(declare-fun b!1116149 () Bool)

(declare-fun e!635957 () Bool)

(declare-fun mapRes!43657 () Bool)

(assert (=> b!1116149 (= e!635957 (and e!635958 mapRes!43657))))

(declare-fun condMapEmpty!43657 () Bool)

(declare-datatypes ((V!42317 0))(
  ( (V!42318 (val!14003 Int)) )
))
(declare-datatypes ((ValueCell!13237 0))(
  ( (ValueCellFull!13237 (v!16636 V!42317)) (EmptyCell!13237) )
))
(declare-datatypes ((array!72685 0))(
  ( (array!72686 (arr!34995 (Array (_ BitVec 32) ValueCell!13237)) (size!35531 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72685)

(declare-fun mapDefault!43657 () ValueCell!13237)

