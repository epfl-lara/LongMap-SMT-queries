; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69794 () Bool)

(assert start!69794)

(declare-fun b!811964 () Bool)

(declare-fun e!449623 () Bool)

(declare-fun tp_is_empty!13991 () Bool)

(assert (=> b!811964 (= e!449623 tp_is_empty!13991)))

(declare-fun b!811965 () Bool)

(declare-fun e!449619 () Bool)

(assert (=> b!811965 (= e!449619 tp_is_empty!13991)))

(declare-fun mapIsEmpty!22546 () Bool)

(declare-fun mapRes!22546 () Bool)

(assert (=> mapIsEmpty!22546 mapRes!22546))

(declare-fun b!811967 () Bool)

(declare-datatypes ((array!44202 0))(
  ( (array!44203 (arr!21168 (Array (_ BitVec 32) (_ BitVec 64))) (size!21589 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44202)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-datatypes ((V!23655 0))(
  ( (V!23656 (val!7043 Int)) )
))
(declare-datatypes ((ValueCell!6580 0))(
  ( (ValueCellFull!6580 (v!9469 V!23655)) (EmptyCell!6580) )
))
(declare-datatypes ((array!44204 0))(
  ( (array!44205 (arr!21169 (Array (_ BitVec 32) ValueCell!6580)) (size!21590 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44204)

(declare-fun e!449620 () Bool)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!811967 (= e!449620 (and (= (size!21590 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21589 _keys!976) (size!21590 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (size!21589 _keys!976) (bvadd #b00000000000000000000000000000001 mask!1312)) (bvsgt #b00000000000000000000000000000000 (size!21589 _keys!976))))))

(declare-fun mapNonEmpty!22546 () Bool)

(declare-fun tp!43654 () Bool)

(assert (=> mapNonEmpty!22546 (= mapRes!22546 (and tp!43654 e!449619))))

(declare-fun mapValue!22546 () ValueCell!6580)

(declare-fun mapRest!22546 () (Array (_ BitVec 32) ValueCell!6580))

(declare-fun mapKey!22546 () (_ BitVec 32))

(assert (=> mapNonEmpty!22546 (= (arr!21169 _values!788) (store mapRest!22546 mapKey!22546 mapValue!22546))))

(declare-fun b!811966 () Bool)

(declare-fun e!449621 () Bool)

(assert (=> b!811966 (= e!449621 (and e!449623 mapRes!22546))))

(declare-fun condMapEmpty!22546 () Bool)

(declare-fun mapDefault!22546 () ValueCell!6580)

