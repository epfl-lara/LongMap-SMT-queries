; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93546 () Bool)

(assert start!93546)

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun e!602452 () Bool)

(declare-datatypes ((V!38337 0))(
  ( (V!38338 (val!12501 Int)) )
))
(declare-datatypes ((ValueCell!11747 0))(
  ( (ValueCellFull!11747 (v!15109 V!38337)) (EmptyCell!11747) )
))
(declare-datatypes ((array!66764 0))(
  ( (array!66765 (arr!32097 (Array (_ BitVec 32) ValueCell!11747)) (size!32635 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!66764)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-fun b!1058768 () Bool)

(declare-datatypes ((array!66766 0))(
  ( (array!66767 (arr!32098 (Array (_ BitVec 32) (_ BitVec 64))) (size!32636 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!66766)

(assert (=> b!1058768 (= e!602452 (and (= (size!32635 _values!955) (bvadd #b00000000000000000000000000000001 mask!1515)) (= (size!32636 _keys!1163) (size!32635 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (size!32636 _keys!1163) (bvadd #b00000000000000000000000000000001 mask!1515)))))))

(declare-fun b!1058769 () Bool)

(declare-fun e!602455 () Bool)

(declare-fun tp_is_empty!24901 () Bool)

(assert (=> b!1058769 (= e!602455 tp_is_empty!24901)))

(declare-fun b!1058770 () Bool)

(declare-fun e!602454 () Bool)

(declare-fun mapRes!39001 () Bool)

(assert (=> b!1058770 (= e!602454 (and e!602455 mapRes!39001))))

(declare-fun condMapEmpty!39001 () Bool)

(declare-fun mapDefault!39001 () ValueCell!11747)

(assert (=> b!1058770 (= condMapEmpty!39001 (= (arr!32097 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11747)) mapDefault!39001)))))

(declare-fun mapIsEmpty!39001 () Bool)

(assert (=> mapIsEmpty!39001 mapRes!39001))

(declare-fun b!1058771 () Bool)

(declare-fun e!602451 () Bool)

(assert (=> b!1058771 (= e!602451 tp_is_empty!24901)))

(declare-fun mapNonEmpty!39001 () Bool)

(declare-fun tp!74807 () Bool)

(assert (=> mapNonEmpty!39001 (= mapRes!39001 (and tp!74807 e!602451))))

(declare-fun mapRest!39001 () (Array (_ BitVec 32) ValueCell!11747))

(declare-fun mapValue!39001 () ValueCell!11747)

(declare-fun mapKey!39001 () (_ BitVec 32))

(assert (=> mapNonEmpty!39001 (= (arr!32097 _values!955) (store mapRest!39001 mapKey!39001 mapValue!39001))))

(declare-fun res!707402 () Bool)

(assert (=> start!93546 (=> (not res!707402) (not e!602452))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93546 (= res!707402 (validMask!0 mask!1515))))

(assert (=> start!93546 e!602452))

(assert (=> start!93546 true))

(declare-fun array_inv!24880 (array!66764) Bool)

(assert (=> start!93546 (and (array_inv!24880 _values!955) e!602454)))

(declare-fun array_inv!24881 (array!66766) Bool)

(assert (=> start!93546 (array_inv!24881 _keys!1163)))

(assert (= (and start!93546 res!707402) b!1058768))

(assert (= (and b!1058770 condMapEmpty!39001) mapIsEmpty!39001))

(assert (= (and b!1058770 (not condMapEmpty!39001)) mapNonEmpty!39001))

(get-info :version)

(assert (= (and mapNonEmpty!39001 ((_ is ValueCellFull!11747) mapValue!39001)) b!1058771))

(assert (= (and b!1058770 ((_ is ValueCellFull!11747) mapDefault!39001)) b!1058769))

(assert (= start!93546 b!1058770))

(declare-fun m!977917 () Bool)

(assert (=> mapNonEmpty!39001 m!977917))

(declare-fun m!977919 () Bool)

(assert (=> start!93546 m!977919))

(declare-fun m!977921 () Bool)

(assert (=> start!93546 m!977921))

(declare-fun m!977923 () Bool)

(assert (=> start!93546 m!977923))

(check-sat (not start!93546) (not mapNonEmpty!39001) tp_is_empty!24901)
(check-sat)
