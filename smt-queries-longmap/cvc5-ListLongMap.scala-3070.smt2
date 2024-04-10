; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43272 () Bool)

(assert start!43272)

(declare-fun b_free!12139 () Bool)

(declare-fun b_next!12139 () Bool)

(assert (=> start!43272 (= b_free!12139 (not b_next!12139))))

(declare-fun tp!42687 () Bool)

(declare-fun b_and!20891 () Bool)

(assert (=> start!43272 (= tp!42687 b_and!20891)))

(declare-fun mapNonEmpty!22174 () Bool)

(declare-fun mapRes!22174 () Bool)

(declare-fun tp!42688 () Bool)

(declare-fun e!282058 () Bool)

(assert (=> mapNonEmpty!22174 (= mapRes!22174 (and tp!42688 e!282058))))

(declare-datatypes ((V!19273 0))(
  ( (V!19274 (val!6873 Int)) )
))
(declare-datatypes ((ValueCell!6464 0))(
  ( (ValueCellFull!6464 (v!9162 V!19273)) (EmptyCell!6464) )
))
(declare-fun mapValue!22174 () ValueCell!6464)

(declare-fun mapKey!22174 () (_ BitVec 32))

(declare-fun mapRest!22174 () (Array (_ BitVec 32) ValueCell!6464))

(declare-datatypes ((array!30975 0))(
  ( (array!30976 (arr!14894 (Array (_ BitVec 32) ValueCell!6464)) (size!15252 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!30975)

(assert (=> mapNonEmpty!22174 (= (arr!14894 _values!1516) (store mapRest!22174 mapKey!22174 mapValue!22174))))

(declare-fun b!479426 () Bool)

(declare-fun res!285983 () Bool)

(declare-fun e!282060 () Bool)

(assert (=> b!479426 (=> (not res!285983) (not e!282060))))

(declare-datatypes ((array!30977 0))(
  ( (array!30978 (arr!14895 (Array (_ BitVec 32) (_ BitVec 64))) (size!15253 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!30977)

(declare-fun mask!2352 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30977 (_ BitVec 32)) Bool)

(assert (=> b!479426 (= res!285983 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun b!479427 () Bool)

(declare-fun e!282057 () Bool)

(declare-fun e!282056 () Bool)

(assert (=> b!479427 (= e!282057 (and e!282056 mapRes!22174))))

(declare-fun condMapEmpty!22174 () Bool)

(declare-fun mapDefault!22174 () ValueCell!6464)

