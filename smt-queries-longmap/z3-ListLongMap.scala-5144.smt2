; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69764 () Bool)

(assert start!69764)

(declare-fun b!811659 () Bool)

(declare-fun e!449395 () Bool)

(declare-fun e!449396 () Bool)

(declare-fun mapRes!22531 () Bool)

(assert (=> b!811659 (= e!449395 (and e!449396 mapRes!22531))))

(declare-fun condMapEmpty!22531 () Bool)

(declare-datatypes ((V!23643 0))(
  ( (V!23644 (val!7038 Int)) )
))
(declare-datatypes ((ValueCell!6575 0))(
  ( (ValueCellFull!6575 (v!9458 V!23643)) (EmptyCell!6575) )
))
(declare-datatypes ((array!44181 0))(
  ( (array!44182 (arr!21158 (Array (_ BitVec 32) ValueCell!6575)) (size!21579 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44181)

(declare-fun mapDefault!22531 () ValueCell!6575)

(assert (=> b!811659 (= condMapEmpty!22531 (= (arr!21158 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6575)) mapDefault!22531)))))

(declare-fun b!811660 () Bool)

(declare-fun e!449394 () Bool)

(declare-fun tp_is_empty!13981 () Bool)

(assert (=> b!811660 (= e!449394 tp_is_empty!13981)))

(declare-fun mapIsEmpty!22531 () Bool)

(assert (=> mapIsEmpty!22531 mapRes!22531))

(declare-fun res!554811 () Bool)

(declare-fun e!449397 () Bool)

(assert (=> start!69764 (=> (not res!554811) (not e!449397))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69764 (= res!554811 (validMask!0 mask!1312))))

(assert (=> start!69764 e!449397))

(declare-datatypes ((array!44183 0))(
  ( (array!44184 (arr!21159 (Array (_ BitVec 32) (_ BitVec 64))) (size!21580 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44183)

(declare-fun array_inv!17041 (array!44183) Bool)

(assert (=> start!69764 (array_inv!17041 _keys!976)))

(assert (=> start!69764 true))

(declare-fun array_inv!17042 (array!44181) Bool)

(assert (=> start!69764 (and (array_inv!17042 _values!788) e!449395)))

(declare-fun b!811658 () Bool)

(assert (=> b!811658 (= e!449396 tp_is_empty!13981)))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun b!811661 () Bool)

(assert (=> b!811661 (= e!449397 (and (= (size!21579 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21580 _keys!976) (size!21579 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (size!21580 _keys!976) (bvadd #b00000000000000000000000000000001 mask!1312)))))))

(declare-fun mapNonEmpty!22531 () Bool)

(declare-fun tp!43639 () Bool)

(assert (=> mapNonEmpty!22531 (= mapRes!22531 (and tp!43639 e!449394))))

(declare-fun mapKey!22531 () (_ BitVec 32))

(declare-fun mapValue!22531 () ValueCell!6575)

(declare-fun mapRest!22531 () (Array (_ BitVec 32) ValueCell!6575))

(assert (=> mapNonEmpty!22531 (= (arr!21158 _values!788) (store mapRest!22531 mapKey!22531 mapValue!22531))))

(assert (= (and start!69764 res!554811) b!811661))

(assert (= (and b!811659 condMapEmpty!22531) mapIsEmpty!22531))

(assert (= (and b!811659 (not condMapEmpty!22531)) mapNonEmpty!22531))

(get-info :version)

(assert (= (and mapNonEmpty!22531 ((_ is ValueCellFull!6575) mapValue!22531)) b!811660))

(assert (= (and b!811659 ((_ is ValueCellFull!6575) mapDefault!22531)) b!811658))

(assert (= start!69764 b!811659))

(declare-fun m!753741 () Bool)

(assert (=> start!69764 m!753741))

(declare-fun m!753743 () Bool)

(assert (=> start!69764 m!753743))

(declare-fun m!753745 () Bool)

(assert (=> start!69764 m!753745))

(declare-fun m!753747 () Bool)

(assert (=> mapNonEmpty!22531 m!753747))

(check-sat (not start!69764) (not mapNonEmpty!22531) tp_is_empty!13981)
(check-sat)
