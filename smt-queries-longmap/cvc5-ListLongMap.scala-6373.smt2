; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!81974 () Bool)

(assert start!81974)

(declare-fun b!956149 () Bool)

(declare-fun res!640255 () Bool)

(declare-fun e!538704 () Bool)

(assert (=> b!956149 (=> (not res!640255) (not e!538704))))

(declare-datatypes ((array!58125 0))(
  ( (array!58126 (arr!27942 (Array (_ BitVec 32) (_ BitVec 64))) (size!28421 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!58125)

(declare-fun mask!1823 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58125 (_ BitVec 32)) Bool)

(assert (=> b!956149 (= res!640255 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1441 mask!1823))))

(declare-fun b!956150 () Bool)

(declare-fun e!538708 () Bool)

(declare-fun e!538706 () Bool)

(declare-fun mapRes!33481 () Bool)

(assert (=> b!956150 (= e!538708 (and e!538706 mapRes!33481))))

(declare-fun condMapEmpty!33481 () Bool)

(declare-datatypes ((V!33001 0))(
  ( (V!33002 (val!10557 Int)) )
))
(declare-datatypes ((ValueCell!10025 0))(
  ( (ValueCellFull!10025 (v!13112 V!33001)) (EmptyCell!10025) )
))
(declare-datatypes ((array!58127 0))(
  ( (array!58128 (arr!27943 (Array (_ BitVec 32) ValueCell!10025)) (size!28422 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!58127)

(declare-fun mapDefault!33481 () ValueCell!10025)

