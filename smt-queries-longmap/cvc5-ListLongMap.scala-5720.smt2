; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74104 () Bool)

(assert start!74104)

(declare-fun mapIsEmpty!27332 () Bool)

(declare-fun mapRes!27332 () Bool)

(assert (=> mapIsEmpty!27332 mapRes!27332))

(declare-fun b!871865 () Bool)

(declare-fun res!592624 () Bool)

(declare-fun e!485442 () Bool)

(assert (=> b!871865 (=> (not res!592624) (not e!485442))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!871865 (= res!592624 (validMask!0 mask!1196))))

(declare-fun b!871866 () Bool)

(declare-fun e!485441 () Bool)

(declare-fun e!485443 () Bool)

(assert (=> b!871866 (= e!485441 (and e!485443 mapRes!27332))))

(declare-fun condMapEmpty!27332 () Bool)

(declare-datatypes ((V!27921 0))(
  ( (V!27922 (val!8625 Int)) )
))
(declare-datatypes ((ValueCell!8138 0))(
  ( (ValueCellFull!8138 (v!11050 V!27921)) (EmptyCell!8138) )
))
(declare-datatypes ((array!50446 0))(
  ( (array!50447 (arr!24254 (Array (_ BitVec 32) ValueCell!8138)) (size!24694 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50446)

(declare-fun mapDefault!27332 () ValueCell!8138)

