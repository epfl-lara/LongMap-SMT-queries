; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70960 () Bool)

(assert start!70960)

(declare-fun b_free!13177 () Bool)

(declare-fun b_next!13177 () Bool)

(assert (=> start!70960 (= b_free!13177 (not b_next!13177))))

(declare-fun tp!46281 () Bool)

(declare-fun b_and!22073 () Bool)

(assert (=> start!70960 (= tp!46281 b_and!22073)))

(declare-fun mapNonEmpty!23947 () Bool)

(declare-fun mapRes!23947 () Bool)

(declare-fun tp!46282 () Bool)

(declare-fun e!458440 () Bool)

(assert (=> mapNonEmpty!23947 (= mapRes!23947 (and tp!46282 e!458440))))

(declare-datatypes ((V!24851 0))(
  ( (V!24852 (val!7491 Int)) )
))
(declare-datatypes ((ValueCell!7028 0))(
  ( (ValueCellFull!7028 (v!9924 V!24851)) (EmptyCell!7028) )
))
(declare-datatypes ((array!45962 0))(
  ( (array!45963 (arr!22029 (Array (_ BitVec 32) ValueCell!7028)) (size!22450 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45962)

(declare-fun mapKey!23947 () (_ BitVec 32))

(declare-fun mapValue!23947 () ValueCell!7028)

(declare-fun mapRest!23947 () (Array (_ BitVec 32) ValueCell!7028))

(assert (=> mapNonEmpty!23947 (= (arr!22029 _values!788) (store mapRest!23947 mapKey!23947 mapValue!23947))))

(declare-fun res!561896 () Bool)

(declare-fun e!458442 () Bool)

(assert (=> start!70960 (=> (not res!561896) (not e!458442))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70960 (= res!561896 (validMask!0 mask!1312))))

(assert (=> start!70960 e!458442))

(declare-fun tp_is_empty!14887 () Bool)

(assert (=> start!70960 tp_is_empty!14887))

(declare-datatypes ((array!45964 0))(
  ( (array!45965 (arr!22030 (Array (_ BitVec 32) (_ BitVec 64))) (size!22451 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45964)

(declare-fun array_inv!17577 (array!45964) Bool)

(assert (=> start!70960 (array_inv!17577 _keys!976)))

(assert (=> start!70960 true))

(declare-fun e!458443 () Bool)

(declare-fun array_inv!17578 (array!45962) Bool)

(assert (=> start!70960 (and (array_inv!17578 _values!788) e!458443)))

(assert (=> start!70960 tp!46281))

(declare-fun b!824095 () Bool)

(declare-fun res!561893 () Bool)

(assert (=> b!824095 (=> (not res!561893) (not e!458442))))

(declare-datatypes ((List!15722 0))(
  ( (Nil!15719) (Cons!15718 (h!16847 (_ BitVec 64)) (t!22063 List!15722)) )
))
(declare-fun arrayNoDuplicates!0 (array!45964 (_ BitVec 32) List!15722) Bool)

(assert (=> b!824095 (= res!561893 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15719))))

(declare-fun b!824096 () Bool)

(declare-fun e!458441 () Bool)

(assert (=> b!824096 (= e!458443 (and e!458441 mapRes!23947))))

(declare-fun condMapEmpty!23947 () Bool)

(declare-fun mapDefault!23947 () ValueCell!7028)

