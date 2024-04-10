; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41924 () Bool)

(assert start!41924)

(declare-fun b_free!11513 () Bool)

(declare-fun b_next!11513 () Bool)

(assert (=> start!41924 (= b_free!11513 (not b_next!11513))))

(declare-fun tp!40552 () Bool)

(declare-fun b_and!19901 () Bool)

(assert (=> start!41924 (= tp!40552 b_and!19901)))

(declare-fun b!468062 () Bool)

(declare-fun res!279736 () Bool)

(declare-fun e!273887 () Bool)

(assert (=> b!468062 (=> (not res!279736) (not e!273887))))

(declare-datatypes ((array!29659 0))(
  ( (array!29660 (arr!14256 (Array (_ BitVec 32) (_ BitVec 64))) (size!14608 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29659)

(declare-datatypes ((List!8646 0))(
  ( (Nil!8643) (Cons!8642 (h!9498 (_ BitVec 64)) (t!14602 List!8646)) )
))
(declare-fun arrayNoDuplicates!0 (array!29659 (_ BitVec 32) List!8646) Bool)

(assert (=> b!468062 (= res!279736 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8643))))

(declare-fun mapIsEmpty!21103 () Bool)

(declare-fun mapRes!21103 () Bool)

(assert (=> mapIsEmpty!21103 mapRes!21103))

(declare-fun b!468063 () Bool)

(declare-fun res!279734 () Bool)

(assert (=> b!468063 (=> (not res!279734) (not e!273887))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((V!18359 0))(
  ( (V!18360 (val!6515 Int)) )
))
(declare-datatypes ((ValueCell!6127 0))(
  ( (ValueCellFull!6127 (v!8804 V!18359)) (EmptyCell!6127) )
))
(declare-datatypes ((array!29661 0))(
  ( (array!29662 (arr!14257 (Array (_ BitVec 32) ValueCell!6127)) (size!14609 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29661)

(assert (=> b!468063 (= res!279734 (and (= (size!14609 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14608 _keys!1025) (size!14609 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!468064 () Bool)

(declare-fun e!273886 () Bool)

(declare-fun e!273889 () Bool)

(assert (=> b!468064 (= e!273886 (and e!273889 mapRes!21103))))

(declare-fun condMapEmpty!21103 () Bool)

(declare-fun mapDefault!21103 () ValueCell!6127)

