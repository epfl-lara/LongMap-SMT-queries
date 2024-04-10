; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107130 () Bool)

(assert start!107130)

(declare-fun b_free!27635 () Bool)

(declare-fun b_next!27635 () Bool)

(assert (=> start!107130 (= b_free!27635 (not b_next!27635))))

(declare-fun tp!97131 () Bool)

(declare-fun b_and!45667 () Bool)

(assert (=> start!107130 (= tp!97131 b_and!45667)))

(declare-fun b!1270155 () Bool)

(declare-fun res!845252 () Bool)

(declare-fun e!723978 () Bool)

(assert (=> b!1270155 (=> (not res!845252) (not e!723978))))

(declare-datatypes ((array!82900 0))(
  ( (array!82901 (arr!39987 (Array (_ BitVec 32) (_ BitVec 64))) (size!40523 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82900)

(declare-datatypes ((List!28472 0))(
  ( (Nil!28469) (Cons!28468 (h!29677 (_ BitVec 64)) (t!42001 List!28472)) )
))
(declare-fun arrayNoDuplicates!0 (array!82900 (_ BitVec 32) List!28472) Bool)

(assert (=> b!1270155 (= res!845252 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28469))))

(declare-fun b!1270156 () Bool)

(declare-fun e!723975 () Bool)

(declare-fun e!723976 () Bool)

(declare-fun mapRes!50809 () Bool)

(assert (=> b!1270156 (= e!723975 (and e!723976 mapRes!50809))))

(declare-fun condMapEmpty!50809 () Bool)

(declare-datatypes ((V!48951 0))(
  ( (V!48952 (val!16484 Int)) )
))
(declare-datatypes ((ValueCell!15556 0))(
  ( (ValueCellFull!15556 (v!19121 V!48951)) (EmptyCell!15556) )
))
(declare-datatypes ((array!82902 0))(
  ( (array!82903 (arr!39988 (Array (_ BitVec 32) ValueCell!15556)) (size!40524 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82902)

(declare-fun mapDefault!50809 () ValueCell!15556)

