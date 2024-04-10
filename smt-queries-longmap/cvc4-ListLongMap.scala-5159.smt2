; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69932 () Bool)

(assert start!69932)

(declare-fun b_free!12365 () Bool)

(declare-fun b_next!12365 () Bool)

(assert (=> start!69932 (= b_free!12365 (not b_next!12365))))

(declare-fun tp!43807 () Bool)

(declare-fun b_and!21133 () Bool)

(assert (=> start!69932 (= tp!43807 b_and!21133)))

(declare-fun b!812914 () Bool)

(declare-fun e!450372 () Bool)

(assert (=> b!812914 (= e!450372 false)))

(declare-datatypes ((V!23767 0))(
  ( (V!23768 (val!7085 Int)) )
))
(declare-fun zeroValueBefore!34 () V!23767)

(declare-datatypes ((array!44366 0))(
  ( (array!44367 (arr!21244 (Array (_ BitVec 32) (_ BitVec 64))) (size!21665 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44366)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun minValue!754 () V!23767)

(declare-datatypes ((ValueCell!6622 0))(
  ( (ValueCellFull!6622 (v!9512 V!23767)) (EmptyCell!6622) )
))
(declare-datatypes ((array!44368 0))(
  ( (array!44369 (arr!21245 (Array (_ BitVec 32) ValueCell!6622)) (size!21666 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44368)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((tuple2!9282 0))(
  ( (tuple2!9283 (_1!4652 (_ BitVec 64)) (_2!4652 V!23767)) )
))
(declare-datatypes ((List!15112 0))(
  ( (Nil!15109) (Cons!15108 (h!16237 tuple2!9282) (t!21427 List!15112)) )
))
(declare-datatypes ((ListLongMap!8105 0))(
  ( (ListLongMap!8106 (toList!4068 List!15112)) )
))
(declare-fun lt!364209 () ListLongMap!8105)

(declare-fun getCurrentListMapNoExtraKeys!2118 (array!44366 array!44368 (_ BitVec 32) (_ BitVec 32) V!23767 V!23767 (_ BitVec 32) Int) ListLongMap!8105)

(assert (=> b!812914 (= lt!364209 (getCurrentListMapNoExtraKeys!2118 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!812915 () Bool)

(declare-fun res!555420 () Bool)

(assert (=> b!812915 (=> (not res!555420) (not e!450372))))

(declare-datatypes ((List!15113 0))(
  ( (Nil!15110) (Cons!15109 (h!16238 (_ BitVec 64)) (t!21428 List!15113)) )
))
(declare-fun arrayNoDuplicates!0 (array!44366 (_ BitVec 32) List!15113) Bool)

(assert (=> b!812915 (= res!555420 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15110))))

(declare-fun mapNonEmpty!22690 () Bool)

(declare-fun mapRes!22690 () Bool)

(declare-fun tp!43806 () Bool)

(declare-fun e!450371 () Bool)

(assert (=> mapNonEmpty!22690 (= mapRes!22690 (and tp!43806 e!450371))))

(declare-fun mapKey!22690 () (_ BitVec 32))

(declare-fun mapRest!22690 () (Array (_ BitVec 32) ValueCell!6622))

(declare-fun mapValue!22690 () ValueCell!6622)

(assert (=> mapNonEmpty!22690 (= (arr!21245 _values!788) (store mapRest!22690 mapKey!22690 mapValue!22690))))

(declare-fun mapIsEmpty!22690 () Bool)

(assert (=> mapIsEmpty!22690 mapRes!22690))

(declare-fun b!812916 () Bool)

(declare-fun res!555423 () Bool)

(assert (=> b!812916 (=> (not res!555423) (not e!450372))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44366 (_ BitVec 32)) Bool)

(assert (=> b!812916 (= res!555423 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!812917 () Bool)

(declare-fun e!450375 () Bool)

(declare-fun tp_is_empty!14075 () Bool)

(assert (=> b!812917 (= e!450375 tp_is_empty!14075)))

(declare-fun b!812918 () Bool)

(assert (=> b!812918 (= e!450371 tp_is_empty!14075)))

(declare-fun res!555421 () Bool)

(assert (=> start!69932 (=> (not res!555421) (not e!450372))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69932 (= res!555421 (validMask!0 mask!1312))))

(assert (=> start!69932 e!450372))

(assert (=> start!69932 tp_is_empty!14075))

(declare-fun array_inv!17017 (array!44366) Bool)

(assert (=> start!69932 (array_inv!17017 _keys!976)))

(assert (=> start!69932 true))

(declare-fun e!450373 () Bool)

(declare-fun array_inv!17018 (array!44368) Bool)

(assert (=> start!69932 (and (array_inv!17018 _values!788) e!450373)))

(assert (=> start!69932 tp!43807))

(declare-fun b!812919 () Bool)

(declare-fun res!555422 () Bool)

(assert (=> b!812919 (=> (not res!555422) (not e!450372))))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!812919 (= res!555422 (and (= (size!21666 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21665 _keys!976) (size!21666 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!812920 () Bool)

(assert (=> b!812920 (= e!450373 (and e!450375 mapRes!22690))))

(declare-fun condMapEmpty!22690 () Bool)

(declare-fun mapDefault!22690 () ValueCell!6622)

