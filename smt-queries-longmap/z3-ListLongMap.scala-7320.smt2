; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93552 () Bool)

(assert start!93552)

(declare-fun b!1058804 () Bool)

(declare-fun e!602498 () Bool)

(declare-fun tp_is_empty!24907 () Bool)

(assert (=> b!1058804 (= e!602498 tp_is_empty!24907)))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun e!602500 () Bool)

(declare-datatypes ((V!38345 0))(
  ( (V!38346 (val!12504 Int)) )
))
(declare-datatypes ((ValueCell!11750 0))(
  ( (ValueCellFull!11750 (v!15112 V!38345)) (EmptyCell!11750) )
))
(declare-datatypes ((array!66774 0))(
  ( (array!66775 (arr!32102 (Array (_ BitVec 32) ValueCell!11750)) (size!32640 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!66774)

(declare-fun b!1058805 () Bool)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!66776 0))(
  ( (array!66777 (arr!32103 (Array (_ BitVec 32) (_ BitVec 64))) (size!32641 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!66776)

(assert (=> b!1058805 (= e!602500 (and (= (size!32640 _values!955) (bvadd #b00000000000000000000000000000001 mask!1515)) (= (size!32641 _keys!1163) (size!32640 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (size!32641 _keys!1163) (bvadd #b00000000000000000000000000000001 mask!1515)) (bvsgt #b00000000000000000000000000000000 (size!32641 _keys!1163))))))

(declare-fun mapNonEmpty!39010 () Bool)

(declare-fun mapRes!39010 () Bool)

(declare-fun tp!74816 () Bool)

(assert (=> mapNonEmpty!39010 (= mapRes!39010 (and tp!74816 e!602498))))

(declare-fun mapValue!39010 () ValueCell!11750)

(declare-fun mapRest!39010 () (Array (_ BitVec 32) ValueCell!11750))

(declare-fun mapKey!39010 () (_ BitVec 32))

(assert (=> mapNonEmpty!39010 (= (arr!32102 _values!955) (store mapRest!39010 mapKey!39010 mapValue!39010))))

(declare-fun b!1058806 () Bool)

(declare-fun e!602497 () Bool)

(assert (=> b!1058806 (= e!602497 tp_is_empty!24907)))

(declare-fun b!1058807 () Bool)

(declare-fun e!602499 () Bool)

(assert (=> b!1058807 (= e!602499 (and e!602497 mapRes!39010))))

(declare-fun condMapEmpty!39010 () Bool)

(declare-fun mapDefault!39010 () ValueCell!11750)

(assert (=> b!1058807 (= condMapEmpty!39010 (= (arr!32102 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11750)) mapDefault!39010)))))

(declare-fun res!707411 () Bool)

(assert (=> start!93552 (=> (not res!707411) (not e!602500))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93552 (= res!707411 (validMask!0 mask!1515))))

(assert (=> start!93552 e!602500))

(assert (=> start!93552 true))

(declare-fun array_inv!24884 (array!66774) Bool)

(assert (=> start!93552 (and (array_inv!24884 _values!955) e!602499)))

(declare-fun array_inv!24885 (array!66776) Bool)

(assert (=> start!93552 (array_inv!24885 _keys!1163)))

(declare-fun mapIsEmpty!39010 () Bool)

(assert (=> mapIsEmpty!39010 mapRes!39010))

(assert (= (and start!93552 res!707411) b!1058805))

(assert (= (and b!1058807 condMapEmpty!39010) mapIsEmpty!39010))

(assert (= (and b!1058807 (not condMapEmpty!39010)) mapNonEmpty!39010))

(get-info :version)

(assert (= (and mapNonEmpty!39010 ((_ is ValueCellFull!11750) mapValue!39010)) b!1058804))

(assert (= (and b!1058807 ((_ is ValueCellFull!11750) mapDefault!39010)) b!1058806))

(assert (= start!93552 b!1058807))

(declare-fun m!977941 () Bool)

(assert (=> mapNonEmpty!39010 m!977941))

(declare-fun m!977943 () Bool)

(assert (=> start!93552 m!977943))

(declare-fun m!977945 () Bool)

(assert (=> start!93552 m!977945))

(declare-fun m!977947 () Bool)

(assert (=> start!93552 m!977947))

(check-sat (not start!93552) (not mapNonEmpty!39010) tp_is_empty!24907)
(check-sat)
(get-model)

(declare-fun d!128519 () Bool)

(assert (=> d!128519 (= (validMask!0 mask!1515) (and (or (= mask!1515 #b00000000000000000000000000000111) (= mask!1515 #b00000000000000000000000000001111) (= mask!1515 #b00000000000000000000000000011111) (= mask!1515 #b00000000000000000000000000111111) (= mask!1515 #b00000000000000000000000001111111) (= mask!1515 #b00000000000000000000000011111111) (= mask!1515 #b00000000000000000000000111111111) (= mask!1515 #b00000000000000000000001111111111) (= mask!1515 #b00000000000000000000011111111111) (= mask!1515 #b00000000000000000000111111111111) (= mask!1515 #b00000000000000000001111111111111) (= mask!1515 #b00000000000000000011111111111111) (= mask!1515 #b00000000000000000111111111111111) (= mask!1515 #b00000000000000001111111111111111) (= mask!1515 #b00000000000000011111111111111111) (= mask!1515 #b00000000000000111111111111111111) (= mask!1515 #b00000000000001111111111111111111) (= mask!1515 #b00000000000011111111111111111111) (= mask!1515 #b00000000000111111111111111111111) (= mask!1515 #b00000000001111111111111111111111) (= mask!1515 #b00000000011111111111111111111111) (= mask!1515 #b00000000111111111111111111111111) (= mask!1515 #b00000001111111111111111111111111) (= mask!1515 #b00000011111111111111111111111111) (= mask!1515 #b00000111111111111111111111111111) (= mask!1515 #b00001111111111111111111111111111) (= mask!1515 #b00011111111111111111111111111111) (= mask!1515 #b00111111111111111111111111111111)) (bvsle mask!1515 #b00111111111111111111111111111111)))))

(assert (=> start!93552 d!128519))

(declare-fun d!128521 () Bool)

(assert (=> d!128521 (= (array_inv!24884 _values!955) (bvsge (size!32640 _values!955) #b00000000000000000000000000000000))))

(assert (=> start!93552 d!128521))

(declare-fun d!128523 () Bool)

(assert (=> d!128523 (= (array_inv!24885 _keys!1163) (bvsge (size!32641 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> start!93552 d!128523))

(declare-fun condMapEmpty!39019 () Bool)

(declare-fun mapDefault!39019 () ValueCell!11750)

(assert (=> mapNonEmpty!39010 (= condMapEmpty!39019 (= mapRest!39010 ((as const (Array (_ BitVec 32) ValueCell!11750)) mapDefault!39019)))))

(declare-fun e!602536 () Bool)

(declare-fun mapRes!39019 () Bool)

(assert (=> mapNonEmpty!39010 (= tp!74816 (and e!602536 mapRes!39019))))

(declare-fun mapNonEmpty!39019 () Bool)

(declare-fun tp!74825 () Bool)

(declare-fun e!602535 () Bool)

(assert (=> mapNonEmpty!39019 (= mapRes!39019 (and tp!74825 e!602535))))

(declare-fun mapValue!39019 () ValueCell!11750)

(declare-fun mapRest!39019 () (Array (_ BitVec 32) ValueCell!11750))

(declare-fun mapKey!39019 () (_ BitVec 32))

(assert (=> mapNonEmpty!39019 (= mapRest!39010 (store mapRest!39019 mapKey!39019 mapValue!39019))))

(declare-fun b!1058839 () Bool)

(assert (=> b!1058839 (= e!602536 tp_is_empty!24907)))

(declare-fun b!1058838 () Bool)

(assert (=> b!1058838 (= e!602535 tp_is_empty!24907)))

(declare-fun mapIsEmpty!39019 () Bool)

(assert (=> mapIsEmpty!39019 mapRes!39019))

(assert (= (and mapNonEmpty!39010 condMapEmpty!39019) mapIsEmpty!39019))

(assert (= (and mapNonEmpty!39010 (not condMapEmpty!39019)) mapNonEmpty!39019))

(assert (= (and mapNonEmpty!39019 ((_ is ValueCellFull!11750) mapValue!39019)) b!1058838))

(assert (= (and mapNonEmpty!39010 ((_ is ValueCellFull!11750) mapDefault!39019)) b!1058839))

(declare-fun m!977965 () Bool)

(assert (=> mapNonEmpty!39019 m!977965))

(check-sat (not mapNonEmpty!39019) tp_is_empty!24907)
(check-sat)
