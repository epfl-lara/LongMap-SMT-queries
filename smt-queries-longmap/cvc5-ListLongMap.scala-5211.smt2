; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70298 () Bool)

(assert start!70298)

(declare-fun b_free!12673 () Bool)

(declare-fun b_next!12673 () Bool)

(assert (=> start!70298 (= b_free!12673 (not b_next!12673))))

(declare-fun tp!44743 () Bool)

(declare-fun b_and!21473 () Bool)

(assert (=> start!70298 (= tp!44743 b_and!21473)))

(declare-fun b!816703 () Bool)

(declare-fun res!557570 () Bool)

(declare-fun e!453078 () Bool)

(assert (=> b!816703 (=> (not res!557570) (not e!453078))))

(declare-datatypes ((array!44966 0))(
  ( (array!44967 (arr!21540 (Array (_ BitVec 32) (_ BitVec 64))) (size!21961 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44966)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-datatypes ((V!24179 0))(
  ( (V!24180 (val!7239 Int)) )
))
(declare-datatypes ((ValueCell!6776 0))(
  ( (ValueCellFull!6776 (v!9667 V!24179)) (EmptyCell!6776) )
))
(declare-datatypes ((array!44968 0))(
  ( (array!44969 (arr!21541 (Array (_ BitVec 32) ValueCell!6776)) (size!21962 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44968)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!816703 (= res!557570 (and (= (size!21962 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21961 _keys!976) (size!21962 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!23164 () Bool)

(declare-fun mapRes!23164 () Bool)

(assert (=> mapIsEmpty!23164 mapRes!23164))

(declare-fun b!816704 () Bool)

(declare-fun e!453077 () Bool)

(declare-fun e!453081 () Bool)

(assert (=> b!816704 (= e!453077 (and e!453081 mapRes!23164))))

(declare-fun condMapEmpty!23164 () Bool)

(declare-fun mapDefault!23164 () ValueCell!6776)

