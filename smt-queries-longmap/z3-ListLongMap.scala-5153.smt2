; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69862 () Bool)

(assert start!69862)

(declare-fun b!812256 () Bool)

(declare-fun e!449897 () Bool)

(declare-fun e!449895 () Bool)

(declare-fun mapRes!22627 () Bool)

(assert (=> b!812256 (= e!449897 (and e!449895 mapRes!22627))))

(declare-fun condMapEmpty!22627 () Bool)

(declare-datatypes ((V!23715 0))(
  ( (V!23716 (val!7065 Int)) )
))
(declare-datatypes ((ValueCell!6602 0))(
  ( (ValueCellFull!6602 (v!9486 V!23715)) (EmptyCell!6602) )
))
(declare-datatypes ((array!44291 0))(
  ( (array!44292 (arr!21208 (Array (_ BitVec 32) ValueCell!6602)) (size!21629 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44291)

(declare-fun mapDefault!22627 () ValueCell!6602)

(assert (=> b!812256 (= condMapEmpty!22627 (= (arr!21208 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6602)) mapDefault!22627)))))

(declare-fun mapNonEmpty!22627 () Bool)

(declare-fun tp!43735 () Bool)

(declare-fun e!449894 () Bool)

(assert (=> mapNonEmpty!22627 (= mapRes!22627 (and tp!43735 e!449894))))

(declare-fun mapValue!22627 () ValueCell!6602)

(declare-fun mapRest!22627 () (Array (_ BitVec 32) ValueCell!6602))

(declare-fun mapKey!22627 () (_ BitVec 32))

(assert (=> mapNonEmpty!22627 (= (arr!21208 _values!788) (store mapRest!22627 mapKey!22627 mapValue!22627))))

(declare-fun res!555103 () Bool)

(declare-fun e!449898 () Bool)

(assert (=> start!69862 (=> (not res!555103) (not e!449898))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69862 (= res!555103 (validMask!0 mask!1312))))

(assert (=> start!69862 e!449898))

(declare-datatypes ((array!44293 0))(
  ( (array!44294 (arr!21209 (Array (_ BitVec 32) (_ BitVec 64))) (size!21630 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44293)

(declare-fun array_inv!17075 (array!44293) Bool)

(assert (=> start!69862 (array_inv!17075 _keys!976)))

(assert (=> start!69862 true))

(declare-fun array_inv!17076 (array!44291) Bool)

(assert (=> start!69862 (and (array_inv!17076 _values!788) e!449897)))

(declare-fun b!812257 () Bool)

(declare-fun res!555104 () Bool)

(assert (=> b!812257 (=> (not res!555104) (not e!449898))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!812257 (= res!555104 (and (= (size!21629 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21630 _keys!976) (size!21629 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!22627 () Bool)

(assert (=> mapIsEmpty!22627 mapRes!22627))

(declare-fun b!812258 () Bool)

(declare-fun tp_is_empty!14035 () Bool)

(assert (=> b!812258 (= e!449894 tp_is_empty!14035)))

(declare-fun b!812259 () Bool)

(assert (=> b!812259 (= e!449895 tp_is_empty!14035)))

(declare-fun b!812260 () Bool)

(declare-fun res!555102 () Bool)

(assert (=> b!812260 (=> (not res!555102) (not e!449898))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44293 (_ BitVec 32)) Bool)

(assert (=> b!812260 (= res!555102 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!812261 () Bool)

(assert (=> b!812261 (= e!449898 false)))

(declare-fun lt!363906 () Bool)

(declare-datatypes ((List!15138 0))(
  ( (Nil!15135) (Cons!15134 (h!16263 (_ BitVec 64)) (t!21444 List!15138)) )
))
(declare-fun arrayNoDuplicates!0 (array!44293 (_ BitVec 32) List!15138) Bool)

(assert (=> b!812261 (= lt!363906 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15135))))

(assert (= (and start!69862 res!555103) b!812257))

(assert (= (and b!812257 res!555104) b!812260))

(assert (= (and b!812260 res!555102) b!812261))

(assert (= (and b!812256 condMapEmpty!22627) mapIsEmpty!22627))

(assert (= (and b!812256 (not condMapEmpty!22627)) mapNonEmpty!22627))

(get-info :version)

(assert (= (and mapNonEmpty!22627 ((_ is ValueCellFull!6602) mapValue!22627)) b!812258))

(assert (= (and b!812256 ((_ is ValueCellFull!6602) mapDefault!22627)) b!812259))

(assert (= start!69862 b!812256))

(declare-fun m!754117 () Bool)

(assert (=> mapNonEmpty!22627 m!754117))

(declare-fun m!754119 () Bool)

(assert (=> start!69862 m!754119))

(declare-fun m!754121 () Bool)

(assert (=> start!69862 m!754121))

(declare-fun m!754123 () Bool)

(assert (=> start!69862 m!754123))

(declare-fun m!754125 () Bool)

(assert (=> b!812260 m!754125))

(declare-fun m!754127 () Bool)

(assert (=> b!812261 m!754127))

(check-sat tp_is_empty!14035 (not b!812260) (not start!69862) (not mapNonEmpty!22627) (not b!812261))
(check-sat)
