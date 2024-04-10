; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69786 () Bool)

(assert start!69786)

(declare-fun b!811916 () Bool)

(declare-fun e!449559 () Bool)

(declare-fun tp_is_empty!13983 () Bool)

(assert (=> b!811916 (= e!449559 tp_is_empty!13983)))

(declare-fun mapIsEmpty!22534 () Bool)

(declare-fun mapRes!22534 () Bool)

(assert (=> mapIsEmpty!22534 mapRes!22534))

(declare-fun b!811917 () Bool)

(declare-fun e!449563 () Bool)

(assert (=> b!811917 (= e!449563 tp_is_empty!13983)))

(declare-fun mapNonEmpty!22534 () Bool)

(declare-fun tp!43642 () Bool)

(assert (=> mapNonEmpty!22534 (= mapRes!22534 (and tp!43642 e!449559))))

(declare-datatypes ((V!23645 0))(
  ( (V!23646 (val!7039 Int)) )
))
(declare-datatypes ((ValueCell!6576 0))(
  ( (ValueCellFull!6576 (v!9465 V!23645)) (EmptyCell!6576) )
))
(declare-fun mapRest!22534 () (Array (_ BitVec 32) ValueCell!6576))

(declare-datatypes ((array!44186 0))(
  ( (array!44187 (arr!21160 (Array (_ BitVec 32) ValueCell!6576)) (size!21581 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44186)

(declare-fun mapKey!22534 () (_ BitVec 32))

(declare-fun mapValue!22534 () ValueCell!6576)

(assert (=> mapNonEmpty!22534 (= (arr!21160 _values!788) (store mapRest!22534 mapKey!22534 mapValue!22534))))

(declare-fun res!554920 () Bool)

(declare-fun e!449562 () Bool)

(assert (=> start!69786 (=> (not res!554920) (not e!449562))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69786 (= res!554920 (validMask!0 mask!1312))))

(assert (=> start!69786 e!449562))

(declare-datatypes ((array!44188 0))(
  ( (array!44189 (arr!21161 (Array (_ BitVec 32) (_ BitVec 64))) (size!21582 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44188)

(declare-fun array_inv!16955 (array!44188) Bool)

(assert (=> start!69786 (array_inv!16955 _keys!976)))

(assert (=> start!69786 true))

(declare-fun e!449560 () Bool)

(declare-fun array_inv!16956 (array!44186) Bool)

(assert (=> start!69786 (and (array_inv!16956 _values!788) e!449560)))

(declare-fun b!811918 () Bool)

(assert (=> b!811918 (= e!449560 (and e!449563 mapRes!22534))))

(declare-fun condMapEmpty!22534 () Bool)

(declare-fun mapDefault!22534 () ValueCell!6576)

(assert (=> b!811918 (= condMapEmpty!22534 (= (arr!21160 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6576)) mapDefault!22534)))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun b!811919 () Bool)

(assert (=> b!811919 (= e!449562 (and (= (size!21581 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21582 _keys!976) (size!21581 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (size!21582 _keys!976) (bvadd #b00000000000000000000000000000001 mask!1312)))))))

(assert (= (and start!69786 res!554920) b!811919))

(assert (= (and b!811918 condMapEmpty!22534) mapIsEmpty!22534))

(assert (= (and b!811918 (not condMapEmpty!22534)) mapNonEmpty!22534))

(get-info :version)

(assert (= (and mapNonEmpty!22534 ((_ is ValueCellFull!6576) mapValue!22534)) b!811916))

(assert (= (and b!811918 ((_ is ValueCellFull!6576) mapDefault!22534)) b!811917))

(assert (= start!69786 b!811918))

(declare-fun m!754501 () Bool)

(assert (=> mapNonEmpty!22534 m!754501))

(declare-fun m!754503 () Bool)

(assert (=> start!69786 m!754503))

(declare-fun m!754505 () Bool)

(assert (=> start!69786 m!754505))

(declare-fun m!754507 () Bool)

(assert (=> start!69786 m!754507))

(check-sat (not start!69786) (not mapNonEmpty!22534) tp_is_empty!13983)
(check-sat)
