; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69790 () Bool)

(assert start!69790)

(declare-fun b!811940 () Bool)

(declare-fun e!449593 () Bool)

(declare-fun tp_is_empty!13987 () Bool)

(assert (=> b!811940 (= e!449593 tp_is_empty!13987)))

(declare-fun b!811941 () Bool)

(declare-fun e!449592 () Bool)

(assert (=> b!811941 (= e!449592 tp_is_empty!13987)))

(declare-fun mapIsEmpty!22540 () Bool)

(declare-fun mapRes!22540 () Bool)

(assert (=> mapIsEmpty!22540 mapRes!22540))

(declare-fun res!554926 () Bool)

(declare-fun e!449591 () Bool)

(assert (=> start!69790 (=> (not res!554926) (not e!449591))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69790 (= res!554926 (validMask!0 mask!1312))))

(assert (=> start!69790 e!449591))

(declare-datatypes ((array!44194 0))(
  ( (array!44195 (arr!21164 (Array (_ BitVec 32) (_ BitVec 64))) (size!21585 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44194)

(declare-fun array_inv!16959 (array!44194) Bool)

(assert (=> start!69790 (array_inv!16959 _keys!976)))

(assert (=> start!69790 true))

(declare-datatypes ((V!23651 0))(
  ( (V!23652 (val!7041 Int)) )
))
(declare-datatypes ((ValueCell!6578 0))(
  ( (ValueCellFull!6578 (v!9467 V!23651)) (EmptyCell!6578) )
))
(declare-datatypes ((array!44196 0))(
  ( (array!44197 (arr!21165 (Array (_ BitVec 32) ValueCell!6578)) (size!21586 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44196)

(declare-fun e!449590 () Bool)

(declare-fun array_inv!16960 (array!44196) Bool)

(assert (=> start!69790 (and (array_inv!16960 _values!788) e!449590)))

(declare-fun b!811942 () Bool)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!811942 (= e!449591 (and (= (size!21586 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21585 _keys!976) (size!21586 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (size!21585 _keys!976) (bvadd #b00000000000000000000000000000001 mask!1312)) (bvsgt #b00000000000000000000000000000000 (size!21585 _keys!976))))))

(declare-fun mapNonEmpty!22540 () Bool)

(declare-fun tp!43648 () Bool)

(assert (=> mapNonEmpty!22540 (= mapRes!22540 (and tp!43648 e!449593))))

(declare-fun mapKey!22540 () (_ BitVec 32))

(declare-fun mapValue!22540 () ValueCell!6578)

(declare-fun mapRest!22540 () (Array (_ BitVec 32) ValueCell!6578))

(assert (=> mapNonEmpty!22540 (= (arr!21165 _values!788) (store mapRest!22540 mapKey!22540 mapValue!22540))))

(declare-fun b!811943 () Bool)

(assert (=> b!811943 (= e!449590 (and e!449592 mapRes!22540))))

(declare-fun condMapEmpty!22540 () Bool)

(declare-fun mapDefault!22540 () ValueCell!6578)

