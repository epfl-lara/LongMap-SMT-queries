; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70694 () Bool)

(assert start!70694)

(declare-fun b_free!12967 () Bool)

(declare-fun b_next!12967 () Bool)

(assert (=> start!70694 (= b_free!12967 (not b_next!12967))))

(declare-fun tp!45642 () Bool)

(declare-fun b_and!21829 () Bool)

(assert (=> start!70694 (= tp!45642 b_and!21829)))

(declare-fun b!821122 () Bool)

(declare-fun res!560158 () Bool)

(declare-fun e!456287 () Bool)

(assert (=> b!821122 (=> (not res!560158) (not e!456287))))

(declare-datatypes ((array!45550 0))(
  ( (array!45551 (arr!21826 (Array (_ BitVec 32) (_ BitVec 64))) (size!22247 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45550)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-datatypes ((V!24571 0))(
  ( (V!24572 (val!7386 Int)) )
))
(declare-datatypes ((ValueCell!6923 0))(
  ( (ValueCellFull!6923 (v!9817 V!24571)) (EmptyCell!6923) )
))
(declare-datatypes ((array!45552 0))(
  ( (array!45553 (arr!21827 (Array (_ BitVec 32) ValueCell!6923)) (size!22248 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45552)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!821122 (= res!560158 (and (= (size!22248 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22247 _keys!976) (size!22248 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!23623 () Bool)

(declare-fun mapRes!23623 () Bool)

(declare-fun tp!45643 () Bool)

(declare-fun e!456285 () Bool)

(assert (=> mapNonEmpty!23623 (= mapRes!23623 (and tp!45643 e!456285))))

(declare-fun mapValue!23623 () ValueCell!6923)

(declare-fun mapRest!23623 () (Array (_ BitVec 32) ValueCell!6923))

(declare-fun mapKey!23623 () (_ BitVec 32))

(assert (=> mapNonEmpty!23623 (= (arr!21827 _values!788) (store mapRest!23623 mapKey!23623 mapValue!23623))))

(declare-fun b!821123 () Bool)

(declare-fun res!560160 () Bool)

(assert (=> b!821123 (=> (not res!560160) (not e!456287))))

(declare-datatypes ((List!15560 0))(
  ( (Nil!15557) (Cons!15556 (h!16685 (_ BitVec 64)) (t!21895 List!15560)) )
))
(declare-fun arrayNoDuplicates!0 (array!45550 (_ BitVec 32) List!15560) Bool)

(assert (=> b!821123 (= res!560160 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15557))))

(declare-fun mapIsEmpty!23623 () Bool)

(assert (=> mapIsEmpty!23623 mapRes!23623))

(declare-fun b!821124 () Bool)

(declare-fun e!456288 () Bool)

(declare-fun e!456286 () Bool)

(assert (=> b!821124 (= e!456288 (and e!456286 mapRes!23623))))

(declare-fun condMapEmpty!23623 () Bool)

(declare-fun mapDefault!23623 () ValueCell!6923)

