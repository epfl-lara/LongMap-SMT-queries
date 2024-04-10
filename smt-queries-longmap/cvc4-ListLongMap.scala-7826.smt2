; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97704 () Bool)

(assert start!97704)

(declare-fun b!1116966 () Bool)

(declare-fun res!745850 () Bool)

(declare-fun e!636339 () Bool)

(assert (=> b!1116966 (=> (not res!745850) (not e!636339))))

(declare-datatypes ((array!72767 0))(
  ( (array!72768 (arr!35036 (Array (_ BitVec 32) (_ BitVec 64))) (size!35572 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72767)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72767 (_ BitVec 32)) Bool)

(assert (=> b!1116966 (= res!745850 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1116967 () Bool)

(declare-fun e!636336 () Bool)

(declare-fun tp_is_empty!27935 () Bool)

(assert (=> b!1116967 (= e!636336 tp_is_empty!27935)))

(declare-fun b!1116968 () Bool)

(declare-fun e!636337 () Bool)

(declare-fun mapRes!43720 () Bool)

(assert (=> b!1116968 (= e!636337 (and e!636336 mapRes!43720))))

(declare-fun condMapEmpty!43720 () Bool)

(declare-datatypes ((V!42373 0))(
  ( (V!42374 (val!14024 Int)) )
))
(declare-datatypes ((ValueCell!13258 0))(
  ( (ValueCellFull!13258 (v!16657 V!42373)) (EmptyCell!13258) )
))
(declare-datatypes ((array!72769 0))(
  ( (array!72770 (arr!35037 (Array (_ BitVec 32) ValueCell!13258)) (size!35573 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72769)

(declare-fun mapDefault!43720 () ValueCell!13258)

