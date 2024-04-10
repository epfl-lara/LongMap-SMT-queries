; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71430 () Bool)

(assert start!71430)

(declare-fun b_free!13475 () Bool)

(declare-fun b_next!13475 () Bool)

(assert (=> start!71430 (= b_free!13475 (not b_next!13475))))

(declare-fun tp!47205 () Bool)

(declare-fun b_and!22481 () Bool)

(assert (=> start!71430 (= tp!47205 b_and!22481)))

(declare-fun b!829553 () Bool)

(declare-fun e!462414 () Bool)

(declare-fun tp_is_empty!15185 () Bool)

(assert (=> b!829553 (= e!462414 tp_is_empty!15185)))

(declare-fun b!829554 () Bool)

(declare-fun res!565101 () Bool)

(declare-fun e!462411 () Bool)

(assert (=> b!829554 (=> (not res!565101) (not e!462411))))

(declare-datatypes ((array!46536 0))(
  ( (array!46537 (arr!22306 (Array (_ BitVec 32) (_ BitVec 64))) (size!22727 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46536)

(declare-datatypes ((List!15926 0))(
  ( (Nil!15923) (Cons!15922 (h!17051 (_ BitVec 64)) (t!22287 List!15926)) )
))
(declare-fun arrayNoDuplicates!0 (array!46536 (_ BitVec 32) List!15926) Bool)

(assert (=> b!829554 (= res!565101 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15923))))

(declare-fun b!829555 () Bool)

(declare-fun res!565102 () Bool)

(assert (=> b!829555 (=> (not res!565102) (not e!462411))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-datatypes ((V!25247 0))(
  ( (V!25248 (val!7640 Int)) )
))
(declare-datatypes ((ValueCell!7177 0))(
  ( (ValueCellFull!7177 (v!10080 V!25247)) (EmptyCell!7177) )
))
(declare-datatypes ((array!46538 0))(
  ( (array!46539 (arr!22307 (Array (_ BitVec 32) ValueCell!7177)) (size!22728 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46538)

(assert (=> b!829555 (= res!565102 (and (= (size!22728 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22727 _keys!976) (size!22728 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!829556 () Bool)

(declare-fun e!462413 () Bool)

(declare-fun e!462415 () Bool)

(declare-fun mapRes!24424 () Bool)

(assert (=> b!829556 (= e!462413 (and e!462415 mapRes!24424))))

(declare-fun condMapEmpty!24424 () Bool)

(declare-fun mapDefault!24424 () ValueCell!7177)

