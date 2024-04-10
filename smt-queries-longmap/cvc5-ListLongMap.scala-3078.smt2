; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43360 () Bool)

(assert start!43360)

(declare-fun b_free!12187 () Bool)

(declare-fun b_next!12187 () Bool)

(assert (=> start!43360 (= b_free!12187 (not b_next!12187))))

(declare-fun tp!42838 () Bool)

(declare-fun b_and!20943 () Bool)

(assert (=> start!43360 (= tp!42838 b_and!20943)))

(declare-fun b!480297 () Bool)

(declare-fun res!286439 () Bool)

(declare-fun e!282619 () Bool)

(assert (=> b!480297 (=> (not res!286439) (not e!282619))))

(declare-fun k!1332 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!480297 (= res!286439 (validKeyInArray!0 k!1332))))

(declare-fun b!480298 () Bool)

(declare-fun res!286442 () Bool)

(assert (=> b!480298 (=> (not res!286442) (not e!282619))))

(declare-datatypes ((array!31067 0))(
  ( (array!31068 (arr!14938 (Array (_ BitVec 32) (_ BitVec 64))) (size!15296 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!31067)

(declare-datatypes ((List!9131 0))(
  ( (Nil!9128) (Cons!9127 (h!9983 (_ BitVec 64)) (t!15341 List!9131)) )
))
(declare-fun arrayNoDuplicates!0 (array!31067 (_ BitVec 32) List!9131) Bool)

(assert (=> b!480298 (= res!286442 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9128))))

(declare-fun b!480299 () Bool)

(declare-fun e!282621 () Bool)

(declare-fun e!282617 () Bool)

(declare-fun mapRes!22252 () Bool)

(assert (=> b!480299 (= e!282621 (and e!282617 mapRes!22252))))

(declare-fun condMapEmpty!22252 () Bool)

(declare-datatypes ((V!19337 0))(
  ( (V!19338 (val!6897 Int)) )
))
(declare-datatypes ((ValueCell!6488 0))(
  ( (ValueCellFull!6488 (v!9188 V!19337)) (EmptyCell!6488) )
))
(declare-datatypes ((array!31069 0))(
  ( (array!31070 (arr!14939 (Array (_ BitVec 32) ValueCell!6488)) (size!15297 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!31069)

(declare-fun mapDefault!22252 () ValueCell!6488)

