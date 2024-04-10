; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69802 () Bool)

(assert start!69802)

(declare-fun b!811988 () Bool)

(declare-fun res!554940 () Bool)

(declare-fun e!449644 () Bool)

(assert (=> b!811988 (=> (not res!554940) (not e!449644))))

(declare-datatypes ((array!44208 0))(
  ( (array!44209 (arr!21170 (Array (_ BitVec 32) (_ BitVec 64))) (size!21591 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44208)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-datatypes ((V!23659 0))(
  ( (V!23660 (val!7044 Int)) )
))
(declare-datatypes ((ValueCell!6581 0))(
  ( (ValueCellFull!6581 (v!9470 V!23659)) (EmptyCell!6581) )
))
(declare-datatypes ((array!44210 0))(
  ( (array!44211 (arr!21171 (Array (_ BitVec 32) ValueCell!6581)) (size!21592 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44210)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!811988 (= res!554940 (and (= (size!21592 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21591 _keys!976) (size!21592 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!22552 () Bool)

(declare-fun mapRes!22552 () Bool)

(assert (=> mapIsEmpty!22552 mapRes!22552))

(declare-fun b!811989 () Bool)

(declare-fun e!449642 () Bool)

(declare-fun tp_is_empty!13993 () Bool)

(assert (=> b!811989 (= e!449642 tp_is_empty!13993)))

(declare-fun mapNonEmpty!22552 () Bool)

(declare-fun tp!43660 () Bool)

(declare-fun e!449640 () Bool)

(assert (=> mapNonEmpty!22552 (= mapRes!22552 (and tp!43660 e!449640))))

(declare-fun mapRest!22552 () (Array (_ BitVec 32) ValueCell!6581))

(declare-fun mapKey!22552 () (_ BitVec 32))

(declare-fun mapValue!22552 () ValueCell!6581)

(assert (=> mapNonEmpty!22552 (= (arr!21171 _values!788) (store mapRest!22552 mapKey!22552 mapValue!22552))))

(declare-fun res!554939 () Bool)

(assert (=> start!69802 (=> (not res!554939) (not e!449644))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69802 (= res!554939 (validMask!0 mask!1312))))

(assert (=> start!69802 e!449644))

(declare-fun array_inv!16963 (array!44208) Bool)

(assert (=> start!69802 (array_inv!16963 _keys!976)))

(assert (=> start!69802 true))

(declare-fun e!449643 () Bool)

(declare-fun array_inv!16964 (array!44210) Bool)

(assert (=> start!69802 (and (array_inv!16964 _values!788) e!449643)))

(declare-fun b!811990 () Bool)

(assert (=> b!811990 (= e!449644 (bvsgt #b00000000000000000000000000000000 (size!21591 _keys!976)))))

(declare-fun b!811991 () Bool)

(assert (=> b!811991 (= e!449643 (and e!449642 mapRes!22552))))

(declare-fun condMapEmpty!22552 () Bool)

(declare-fun mapDefault!22552 () ValueCell!6581)

