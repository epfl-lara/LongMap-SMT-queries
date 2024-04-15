; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69844 () Bool)

(assert start!69844)

(declare-fun b!812094 () Bool)

(declare-fun e!449761 () Bool)

(assert (=> b!812094 (= e!449761 false)))

(declare-fun lt!363879 () Bool)

(declare-datatypes ((array!44259 0))(
  ( (array!44260 (arr!21192 (Array (_ BitVec 32) (_ BitVec 64))) (size!21613 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44259)

(declare-datatypes ((List!15133 0))(
  ( (Nil!15130) (Cons!15129 (h!16258 (_ BitVec 64)) (t!21439 List!15133)) )
))
(declare-fun arrayNoDuplicates!0 (array!44259 (_ BitVec 32) List!15133) Bool)

(assert (=> b!812094 (= lt!363879 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15130))))

(declare-fun res!555021 () Bool)

(assert (=> start!69844 (=> (not res!555021) (not e!449761))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69844 (= res!555021 (validMask!0 mask!1312))))

(assert (=> start!69844 e!449761))

(declare-fun array_inv!17065 (array!44259) Bool)

(assert (=> start!69844 (array_inv!17065 _keys!976)))

(assert (=> start!69844 true))

(declare-datatypes ((V!23691 0))(
  ( (V!23692 (val!7056 Int)) )
))
(declare-datatypes ((ValueCell!6593 0))(
  ( (ValueCellFull!6593 (v!9477 V!23691)) (EmptyCell!6593) )
))
(declare-datatypes ((array!44261 0))(
  ( (array!44262 (arr!21193 (Array (_ BitVec 32) ValueCell!6593)) (size!21614 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44261)

(declare-fun e!449762 () Bool)

(declare-fun array_inv!17066 (array!44261) Bool)

(assert (=> start!69844 (and (array_inv!17066 _values!788) e!449762)))

(declare-fun b!812095 () Bool)

(declare-fun res!555022 () Bool)

(assert (=> b!812095 (=> (not res!555022) (not e!449761))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44259 (_ BitVec 32)) Bool)

(assert (=> b!812095 (= res!555022 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun mapIsEmpty!22600 () Bool)

(declare-fun mapRes!22600 () Bool)

(assert (=> mapIsEmpty!22600 mapRes!22600))

(declare-fun b!812096 () Bool)

(declare-fun res!555023 () Bool)

(assert (=> b!812096 (=> (not res!555023) (not e!449761))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!812096 (= res!555023 (and (= (size!21614 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21613 _keys!976) (size!21614 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!22600 () Bool)

(declare-fun tp!43708 () Bool)

(declare-fun e!449760 () Bool)

(assert (=> mapNonEmpty!22600 (= mapRes!22600 (and tp!43708 e!449760))))

(declare-fun mapKey!22600 () (_ BitVec 32))

(declare-fun mapValue!22600 () ValueCell!6593)

(declare-fun mapRest!22600 () (Array (_ BitVec 32) ValueCell!6593))

(assert (=> mapNonEmpty!22600 (= (arr!21193 _values!788) (store mapRest!22600 mapKey!22600 mapValue!22600))))

(declare-fun b!812097 () Bool)

(declare-fun e!449763 () Bool)

(assert (=> b!812097 (= e!449762 (and e!449763 mapRes!22600))))

(declare-fun condMapEmpty!22600 () Bool)

(declare-fun mapDefault!22600 () ValueCell!6593)

(assert (=> b!812097 (= condMapEmpty!22600 (= (arr!21193 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6593)) mapDefault!22600)))))

(declare-fun b!812098 () Bool)

(declare-fun tp_is_empty!14017 () Bool)

(assert (=> b!812098 (= e!449763 tp_is_empty!14017)))

(declare-fun b!812099 () Bool)

(assert (=> b!812099 (= e!449760 tp_is_empty!14017)))

(assert (= (and start!69844 res!555021) b!812096))

(assert (= (and b!812096 res!555023) b!812095))

(assert (= (and b!812095 res!555022) b!812094))

(assert (= (and b!812097 condMapEmpty!22600) mapIsEmpty!22600))

(assert (= (and b!812097 (not condMapEmpty!22600)) mapNonEmpty!22600))

(get-info :version)

(assert (= (and mapNonEmpty!22600 ((_ is ValueCellFull!6593) mapValue!22600)) b!812099))

(assert (= (and b!812097 ((_ is ValueCellFull!6593) mapDefault!22600)) b!812098))

(assert (= start!69844 b!812097))

(declare-fun m!754009 () Bool)

(assert (=> b!812094 m!754009))

(declare-fun m!754011 () Bool)

(assert (=> start!69844 m!754011))

(declare-fun m!754013 () Bool)

(assert (=> start!69844 m!754013))

(declare-fun m!754015 () Bool)

(assert (=> start!69844 m!754015))

(declare-fun m!754017 () Bool)

(assert (=> b!812095 m!754017))

(declare-fun m!754019 () Bool)

(assert (=> mapNonEmpty!22600 m!754019))

(check-sat (not mapNonEmpty!22600) tp_is_empty!14017 (not b!812095) (not start!69844) (not b!812094))
(check-sat)
