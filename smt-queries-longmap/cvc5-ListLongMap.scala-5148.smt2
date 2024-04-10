; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69830 () Bool)

(assert start!69830)

(declare-fun mapIsEmpty!22576 () Bool)

(declare-fun mapRes!22576 () Bool)

(assert (=> mapIsEmpty!22576 mapRes!22576))

(declare-fun res!555008 () Bool)

(declare-fun e!449762 () Bool)

(assert (=> start!69830 (=> (not res!555008) (not e!449762))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69830 (= res!555008 (validMask!0 mask!1312))))

(assert (=> start!69830 e!449762))

(declare-datatypes ((array!44234 0))(
  ( (array!44235 (arr!21181 (Array (_ BitVec 32) (_ BitVec 64))) (size!21602 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44234)

(declare-fun array_inv!16971 (array!44234) Bool)

(assert (=> start!69830 (array_inv!16971 _keys!976)))

(assert (=> start!69830 true))

(declare-datatypes ((V!23675 0))(
  ( (V!23676 (val!7050 Int)) )
))
(declare-datatypes ((ValueCell!6587 0))(
  ( (ValueCellFull!6587 (v!9476 V!23675)) (EmptyCell!6587) )
))
(declare-datatypes ((array!44236 0))(
  ( (array!44237 (arr!21182 (Array (_ BitVec 32) ValueCell!6587)) (size!21603 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44236)

(declare-fun e!449763 () Bool)

(declare-fun array_inv!16972 (array!44236) Bool)

(assert (=> start!69830 (and (array_inv!16972 _values!788) e!449763)))

(declare-fun b!812138 () Bool)

(declare-fun e!449761 () Bool)

(declare-fun tp_is_empty!14005 () Bool)

(assert (=> b!812138 (= e!449761 tp_is_empty!14005)))

(declare-fun b!812139 () Bool)

(declare-datatypes ((List!15089 0))(
  ( (Nil!15086) (Cons!15085 (h!16214 (_ BitVec 64)) (t!21404 List!15089)) )
))
(declare-fun noDuplicate!1290 (List!15089) Bool)

(assert (=> b!812139 (= e!449762 (not (noDuplicate!1290 Nil!15086)))))

(declare-fun b!812140 () Bool)

(declare-fun res!555010 () Bool)

(assert (=> b!812140 (=> (not res!555010) (not e!449762))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!812140 (= res!555010 (and (= (size!21603 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21602 _keys!976) (size!21603 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!22576 () Bool)

(declare-fun tp!43684 () Bool)

(assert (=> mapNonEmpty!22576 (= mapRes!22576 (and tp!43684 e!449761))))

(declare-fun mapValue!22576 () ValueCell!6587)

(declare-fun mapRest!22576 () (Array (_ BitVec 32) ValueCell!6587))

(declare-fun mapKey!22576 () (_ BitVec 32))

(assert (=> mapNonEmpty!22576 (= (arr!21182 _values!788) (store mapRest!22576 mapKey!22576 mapValue!22576))))

(declare-fun b!812141 () Bool)

(declare-fun e!449764 () Bool)

(assert (=> b!812141 (= e!449763 (and e!449764 mapRes!22576))))

(declare-fun condMapEmpty!22576 () Bool)

(declare-fun mapDefault!22576 () ValueCell!6587)

