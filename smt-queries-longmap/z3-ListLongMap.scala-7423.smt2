; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94610 () Bool)

(assert start!94610)

(declare-fun b_free!21715 () Bool)

(declare-fun b_next!21715 () Bool)

(assert (=> start!94610 (= b_free!21715 (not b_next!21715))))

(declare-fun tp!76589 () Bool)

(declare-fun b_and!34509 () Bool)

(assert (=> start!94610 (= tp!76589 b_and!34509)))

(declare-fun b!1068490 () Bool)

(declare-fun res!712704 () Bool)

(declare-fun e!609487 () Bool)

(assert (=> b!1068490 (=> (not res!712704) (not e!609487))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((V!39169 0))(
  ( (V!39170 (val!12813 Int)) )
))
(declare-datatypes ((ValueCell!12059 0))(
  ( (ValueCellFull!12059 (v!15423 V!39169)) (EmptyCell!12059) )
))
(declare-datatypes ((array!68079 0))(
  ( (array!68080 (arr!32734 (Array (_ BitVec 32) ValueCell!12059)) (size!33271 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68079)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!68081 0))(
  ( (array!68082 (arr!32735 (Array (_ BitVec 32) (_ BitVec 64))) (size!33272 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68081)

(assert (=> b!1068490 (= res!712704 (and (= (size!33271 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33272 _keys!1163) (size!33271 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1068491 () Bool)

(declare-fun e!609488 () Bool)

(declare-fun tp_is_empty!25525 () Bool)

(assert (=> b!1068491 (= e!609488 tp_is_empty!25525)))

(declare-fun b!1068492 () Bool)

(declare-fun e!609486 () Bool)

(assert (=> b!1068492 (= e!609486 tp_is_empty!25525)))

(declare-fun b!1068493 () Bool)

(declare-fun res!712703 () Bool)

(assert (=> b!1068493 (=> (not res!712703) (not e!609487))))

(declare-datatypes ((List!22805 0))(
  ( (Nil!22802) (Cons!22801 (h!24019 (_ BitVec 64)) (t!32120 List!22805)) )
))
(declare-fun arrayNoDuplicates!0 (array!68081 (_ BitVec 32) List!22805) Bool)

(assert (=> b!1068493 (= res!712703 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22802))))

(declare-fun res!712706 () Bool)

(assert (=> start!94610 (=> (not res!712706) (not e!609487))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94610 (= res!712706 (validMask!0 mask!1515))))

(assert (=> start!94610 e!609487))

(assert (=> start!94610 true))

(assert (=> start!94610 tp_is_empty!25525))

(declare-fun e!609485 () Bool)

(declare-fun array_inv!25364 (array!68079) Bool)

(assert (=> start!94610 (and (array_inv!25364 _values!955) e!609485)))

(assert (=> start!94610 tp!76589))

(declare-fun array_inv!25365 (array!68081) Bool)

(assert (=> start!94610 (array_inv!25365 _keys!1163)))

(declare-fun b!1068494 () Bool)

(assert (=> b!1068494 (= e!609487 (not true))))

(declare-datatypes ((tuple2!16236 0))(
  ( (tuple2!16237 (_1!8129 (_ BitVec 64)) (_2!8129 V!39169)) )
))
(declare-datatypes ((List!22806 0))(
  ( (Nil!22803) (Cons!22802 (h!24020 tuple2!16236) (t!32121 List!22806)) )
))
(declare-datatypes ((ListLongMap!14213 0))(
  ( (ListLongMap!14214 (toList!7122 List!22806)) )
))
(declare-fun lt!471845 () ListLongMap!14213)

(declare-fun lt!471844 () ListLongMap!14213)

(assert (=> b!1068494 (= lt!471845 lt!471844)))

(declare-fun zeroValueBefore!47 () V!39169)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39169)

(declare-datatypes ((Unit!35042 0))(
  ( (Unit!35043) )
))
(declare-fun lt!471843 () Unit!35042)

(declare-fun minValue!907 () V!39169)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!744 (array!68081 array!68079 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39169 V!39169 V!39169 V!39169 (_ BitVec 32) Int) Unit!35042)

(assert (=> b!1068494 (= lt!471843 (lemmaNoChangeToArrayThenSameMapNoExtras!744 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3741 (array!68081 array!68079 (_ BitVec 32) (_ BitVec 32) V!39169 V!39169 (_ BitVec 32) Int) ListLongMap!14213)

(assert (=> b!1068494 (= lt!471844 (getCurrentListMapNoExtraKeys!3741 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1068494 (= lt!471845 (getCurrentListMapNoExtraKeys!3741 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapIsEmpty!39979 () Bool)

(declare-fun mapRes!39979 () Bool)

(assert (=> mapIsEmpty!39979 mapRes!39979))

(declare-fun b!1068495 () Bool)

(assert (=> b!1068495 (= e!609485 (and e!609486 mapRes!39979))))

(declare-fun condMapEmpty!39979 () Bool)

(declare-fun mapDefault!39979 () ValueCell!12059)

(assert (=> b!1068495 (= condMapEmpty!39979 (= (arr!32734 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12059)) mapDefault!39979)))))

(declare-fun b!1068496 () Bool)

(declare-fun res!712705 () Bool)

(assert (=> b!1068496 (=> (not res!712705) (not e!609487))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68081 (_ BitVec 32)) Bool)

(assert (=> b!1068496 (= res!712705 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun mapNonEmpty!39979 () Bool)

(declare-fun tp!76588 () Bool)

(assert (=> mapNonEmpty!39979 (= mapRes!39979 (and tp!76588 e!609488))))

(declare-fun mapKey!39979 () (_ BitVec 32))

(declare-fun mapRest!39979 () (Array (_ BitVec 32) ValueCell!12059))

(declare-fun mapValue!39979 () ValueCell!12059)

(assert (=> mapNonEmpty!39979 (= (arr!32734 _values!955) (store mapRest!39979 mapKey!39979 mapValue!39979))))

(assert (= (and start!94610 res!712706) b!1068490))

(assert (= (and b!1068490 res!712704) b!1068496))

(assert (= (and b!1068496 res!712705) b!1068493))

(assert (= (and b!1068493 res!712703) b!1068494))

(assert (= (and b!1068495 condMapEmpty!39979) mapIsEmpty!39979))

(assert (= (and b!1068495 (not condMapEmpty!39979)) mapNonEmpty!39979))

(get-info :version)

(assert (= (and mapNonEmpty!39979 ((_ is ValueCellFull!12059) mapValue!39979)) b!1068491))

(assert (= (and b!1068495 ((_ is ValueCellFull!12059) mapDefault!39979)) b!1068492))

(assert (= start!94610 b!1068495))

(declare-fun m!987535 () Bool)

(assert (=> mapNonEmpty!39979 m!987535))

(declare-fun m!987537 () Bool)

(assert (=> b!1068494 m!987537))

(declare-fun m!987539 () Bool)

(assert (=> b!1068494 m!987539))

(declare-fun m!987541 () Bool)

(assert (=> b!1068494 m!987541))

(declare-fun m!987543 () Bool)

(assert (=> start!94610 m!987543))

(declare-fun m!987545 () Bool)

(assert (=> start!94610 m!987545))

(declare-fun m!987547 () Bool)

(assert (=> start!94610 m!987547))

(declare-fun m!987549 () Bool)

(assert (=> b!1068496 m!987549))

(declare-fun m!987551 () Bool)

(assert (=> b!1068493 m!987551))

(check-sat tp_is_empty!25525 (not b!1068496) (not start!94610) b_and!34509 (not b_next!21715) (not mapNonEmpty!39979) (not b!1068493) (not b!1068494))
(check-sat b_and!34509 (not b_next!21715))
