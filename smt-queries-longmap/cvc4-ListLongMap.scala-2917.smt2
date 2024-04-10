; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41662 () Bool)

(assert start!41662)

(declare-fun b_free!11315 () Bool)

(declare-fun b_next!11315 () Bool)

(assert (=> start!41662 (= b_free!11315 (not b_next!11315))))

(declare-fun tp!39945 () Bool)

(declare-fun b_and!19663 () Bool)

(assert (=> start!41662 (= tp!39945 b_and!19663)))

(declare-fun mapNonEmpty!20794 () Bool)

(declare-fun mapRes!20794 () Bool)

(declare-fun tp!39946 () Bool)

(declare-fun e!271866 () Bool)

(assert (=> mapNonEmpty!20794 (= mapRes!20794 (and tp!39946 e!271866))))

(declare-datatypes ((V!18095 0))(
  ( (V!18096 (val!6416 Int)) )
))
(declare-datatypes ((ValueCell!6028 0))(
  ( (ValueCellFull!6028 (v!8703 V!18095)) (EmptyCell!6028) )
))
(declare-datatypes ((array!29271 0))(
  ( (array!29272 (arr!14066 (Array (_ BitVec 32) ValueCell!6028)) (size!14418 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29271)

(declare-fun mapKey!20794 () (_ BitVec 32))

(declare-fun mapValue!20794 () ValueCell!6028)

(declare-fun mapRest!20794 () (Array (_ BitVec 32) ValueCell!6028))

(assert (=> mapNonEmpty!20794 (= (arr!14066 _values!833) (store mapRest!20794 mapKey!20794 mapValue!20794))))

(declare-fun b!465239 () Bool)

(declare-fun e!271865 () Bool)

(declare-fun e!271863 () Bool)

(assert (=> b!465239 (= e!271865 (and e!271863 mapRes!20794))))

(declare-fun condMapEmpty!20794 () Bool)

(declare-fun mapDefault!20794 () ValueCell!6028)

