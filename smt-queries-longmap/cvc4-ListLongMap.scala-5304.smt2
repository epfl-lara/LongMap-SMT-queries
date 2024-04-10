; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71032 () Bool)

(assert start!71032)

(declare-fun b_free!13235 () Bool)

(declare-fun b_next!13235 () Bool)

(assert (=> start!71032 (= b_free!13235 (not b_next!13235))))

(declare-fun tp!46458 () Bool)

(declare-fun b_and!22139 () Bool)

(assert (=> start!71032 (= tp!46458 b_and!22139)))

(declare-fun b!824860 () Bool)

(declare-fun res!562343 () Bool)

(declare-fun e!459000 () Bool)

(assert (=> b!824860 (=> (not res!562343) (not e!459000))))

(declare-datatypes ((array!46078 0))(
  ( (array!46079 (arr!22086 (Array (_ BitVec 32) (_ BitVec 64))) (size!22507 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46078)

(declare-datatypes ((List!15762 0))(
  ( (Nil!15759) (Cons!15758 (h!16887 (_ BitVec 64)) (t!22105 List!15762)) )
))
(declare-fun arrayNoDuplicates!0 (array!46078 (_ BitVec 32) List!15762) Bool)

(assert (=> b!824860 (= res!562343 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15759))))

(declare-fun mapNonEmpty!24037 () Bool)

(declare-fun mapRes!24037 () Bool)

(declare-fun tp!46459 () Bool)

(declare-fun e!459001 () Bool)

(assert (=> mapNonEmpty!24037 (= mapRes!24037 (and tp!46459 e!459001))))

(declare-datatypes ((V!24927 0))(
  ( (V!24928 (val!7520 Int)) )
))
(declare-datatypes ((ValueCell!7057 0))(
  ( (ValueCellFull!7057 (v!9953 V!24927)) (EmptyCell!7057) )
))
(declare-fun mapRest!24037 () (Array (_ BitVec 32) ValueCell!7057))

(declare-fun mapValue!24037 () ValueCell!7057)

(declare-datatypes ((array!46080 0))(
  ( (array!46081 (arr!22087 (Array (_ BitVec 32) ValueCell!7057)) (size!22508 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46080)

(declare-fun mapKey!24037 () (_ BitVec 32))

(assert (=> mapNonEmpty!24037 (= (arr!22087 _values!788) (store mapRest!24037 mapKey!24037 mapValue!24037))))

(declare-fun b!824861 () Bool)

(declare-fun tp_is_empty!14945 () Bool)

(assert (=> b!824861 (= e!459001 tp_is_empty!14945)))

(declare-fun b!824862 () Bool)

(declare-fun res!562347 () Bool)

(assert (=> b!824862 (=> (not res!562347) (not e!459000))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!824862 (= res!562347 (and (= (size!22508 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22507 _keys!976) (size!22508 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!24037 () Bool)

(assert (=> mapIsEmpty!24037 mapRes!24037))

(declare-fun b!824863 () Bool)

(declare-fun e!459002 () Bool)

(declare-fun e!459003 () Bool)

(assert (=> b!824863 (= e!459002 (and e!459003 mapRes!24037))))

(declare-fun condMapEmpty!24037 () Bool)

(declare-fun mapDefault!24037 () ValueCell!7057)

