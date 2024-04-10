; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70018 () Bool)

(assert start!70018)

(declare-fun b_free!12439 () Bool)

(declare-fun b_next!12439 () Bool)

(assert (=> start!70018 (= b_free!12439 (not b_next!12439))))

(declare-fun tp!44032 () Bool)

(declare-fun b_and!21211 () Bool)

(assert (=> start!70018 (= tp!44032 b_and!21211)))

(declare-fun mapIsEmpty!22804 () Bool)

(declare-fun mapRes!22804 () Bool)

(assert (=> mapIsEmpty!22804 mapRes!22804))

(declare-fun b!813764 () Bool)

(declare-fun res!555892 () Bool)

(declare-fun e!450975 () Bool)

(assert (=> b!813764 (=> (not res!555892) (not e!450975))))

(declare-datatypes ((array!44506 0))(
  ( (array!44507 (arr!21313 (Array (_ BitVec 32) (_ BitVec 64))) (size!21734 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44506)

(declare-datatypes ((List!15161 0))(
  ( (Nil!15158) (Cons!15157 (h!16286 (_ BitVec 64)) (t!21478 List!15161)) )
))
(declare-fun arrayNoDuplicates!0 (array!44506 (_ BitVec 32) List!15161) Bool)

(assert (=> b!813764 (= res!555892 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15158))))

(declare-fun b!813765 () Bool)

(declare-fun res!555894 () Bool)

(assert (=> b!813765 (=> (not res!555894) (not e!450975))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-datatypes ((V!23867 0))(
  ( (V!23868 (val!7122 Int)) )
))
(declare-datatypes ((ValueCell!6659 0))(
  ( (ValueCellFull!6659 (v!9549 V!23867)) (EmptyCell!6659) )
))
(declare-datatypes ((array!44508 0))(
  ( (array!44509 (arr!21314 (Array (_ BitVec 32) ValueCell!6659)) (size!21735 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44508)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!813765 (= res!555894 (and (= (size!21735 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21734 _keys!976) (size!21735 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!813767 () Bool)

(declare-fun res!555891 () Bool)

(assert (=> b!813767 (=> (not res!555891) (not e!450975))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44506 (_ BitVec 32)) Bool)

(assert (=> b!813767 (= res!555891 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!813768 () Bool)

(declare-fun e!450974 () Bool)

(declare-fun e!450977 () Bool)

(assert (=> b!813768 (= e!450974 (and e!450977 mapRes!22804))))

(declare-fun condMapEmpty!22804 () Bool)

(declare-fun mapDefault!22804 () ValueCell!6659)

