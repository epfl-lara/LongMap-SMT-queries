; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69788 () Bool)

(assert start!69788)

(declare-fun res!554923 () Bool)

(declare-fun e!449576 () Bool)

(assert (=> start!69788 (=> (not res!554923) (not e!449576))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69788 (= res!554923 (validMask!0 mask!1312))))

(assert (=> start!69788 e!449576))

(declare-datatypes ((array!44190 0))(
  ( (array!44191 (arr!21162 (Array (_ BitVec 32) (_ BitVec 64))) (size!21583 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44190)

(declare-fun array_inv!16957 (array!44190) Bool)

(assert (=> start!69788 (array_inv!16957 _keys!976)))

(assert (=> start!69788 true))

(declare-datatypes ((V!23647 0))(
  ( (V!23648 (val!7040 Int)) )
))
(declare-datatypes ((ValueCell!6577 0))(
  ( (ValueCellFull!6577 (v!9466 V!23647)) (EmptyCell!6577) )
))
(declare-datatypes ((array!44192 0))(
  ( (array!44193 (arr!21163 (Array (_ BitVec 32) ValueCell!6577)) (size!21584 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44192)

(declare-fun e!449578 () Bool)

(declare-fun array_inv!16958 (array!44192) Bool)

(assert (=> start!69788 (and (array_inv!16958 _values!788) e!449578)))

(declare-fun b!811928 () Bool)

(declare-fun e!449575 () Bool)

(declare-fun tp_is_empty!13985 () Bool)

(assert (=> b!811928 (= e!449575 tp_is_empty!13985)))

(declare-fun b!811929 () Bool)

(declare-fun e!449577 () Bool)

(assert (=> b!811929 (= e!449577 tp_is_empty!13985)))

(declare-fun mapNonEmpty!22537 () Bool)

(declare-fun mapRes!22537 () Bool)

(declare-fun tp!43645 () Bool)

(assert (=> mapNonEmpty!22537 (= mapRes!22537 (and tp!43645 e!449577))))

(declare-fun mapRest!22537 () (Array (_ BitVec 32) ValueCell!6577))

(declare-fun mapKey!22537 () (_ BitVec 32))

(declare-fun mapValue!22537 () ValueCell!6577)

(assert (=> mapNonEmpty!22537 (= (arr!21163 _values!788) (store mapRest!22537 mapKey!22537 mapValue!22537))))

(declare-fun b!811930 () Bool)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!811930 (= e!449576 (and (= (size!21584 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21583 _keys!976) (size!21584 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (size!21583 _keys!976) (bvadd #b00000000000000000000000000000001 mask!1312)))))))

(declare-fun mapIsEmpty!22537 () Bool)

(assert (=> mapIsEmpty!22537 mapRes!22537))

(declare-fun b!811931 () Bool)

(assert (=> b!811931 (= e!449578 (and e!449575 mapRes!22537))))

(declare-fun condMapEmpty!22537 () Bool)

(declare-fun mapDefault!22537 () ValueCell!6577)

