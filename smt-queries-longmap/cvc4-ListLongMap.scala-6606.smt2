; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83524 () Bool)

(assert start!83524)

(declare-fun b_free!19511 () Bool)

(declare-fun b_next!19511 () Bool)

(assert (=> start!83524 (= b_free!19511 (not b_next!19511))))

(declare-fun tp!67820 () Bool)

(declare-fun b_and!31117 () Bool)

(assert (=> start!83524 (= tp!67820 b_and!31117)))

(declare-fun b!975838 () Bool)

(declare-fun e!549955 () Bool)

(declare-fun tp_is_empty!22415 () Bool)

(assert (=> b!975838 (= e!549955 tp_is_empty!22415)))

(declare-fun b!975839 () Bool)

(declare-fun res!653264 () Bool)

(declare-fun e!549956 () Bool)

(assert (=> b!975839 (=> (not res!653264) (not e!549956))))

(declare-datatypes ((array!60859 0))(
  ( (array!60860 (arr!29293 (Array (_ BitVec 32) (_ BitVec 64))) (size!29772 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60859)

(declare-datatypes ((List!20332 0))(
  ( (Nil!20329) (Cons!20328 (h!21490 (_ BitVec 64)) (t!28815 List!20332)) )
))
(declare-fun arrayNoDuplicates!0 (array!60859 (_ BitVec 32) List!20332) Bool)

(assert (=> b!975839 (= res!653264 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20329))))

(declare-fun b!975840 () Bool)

(declare-fun e!549954 () Bool)

(declare-fun e!549953 () Bool)

(declare-fun mapRes!35632 () Bool)

(assert (=> b!975840 (= e!549954 (and e!549953 mapRes!35632))))

(declare-fun condMapEmpty!35632 () Bool)

(declare-datatypes ((V!34869 0))(
  ( (V!34870 (val!11258 Int)) )
))
(declare-datatypes ((ValueCell!10726 0))(
  ( (ValueCellFull!10726 (v!13817 V!34869)) (EmptyCell!10726) )
))
(declare-datatypes ((array!60861 0))(
  ( (array!60862 (arr!29294 (Array (_ BitVec 32) ValueCell!10726)) (size!29773 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60861)

(declare-fun mapDefault!35632 () ValueCell!10726)

