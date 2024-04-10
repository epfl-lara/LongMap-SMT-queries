; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94080 () Bool)

(assert start!94080)

(declare-fun b_free!21495 () Bool)

(declare-fun b_next!21495 () Bool)

(assert (=> start!94080 (= b_free!21495 (not b_next!21495))))

(declare-fun tp!75917 () Bool)

(declare-fun b_and!34237 () Bool)

(assert (=> start!94080 (= tp!75917 b_and!34237)))

(declare-fun b!1063991 () Bool)

(declare-fun e!606334 () Bool)

(declare-fun tp_is_empty!25305 () Bool)

(assert (=> b!1063991 (= e!606334 tp_is_empty!25305)))

(declare-fun mapNonEmpty!39637 () Bool)

(declare-fun mapRes!39637 () Bool)

(declare-fun tp!75916 () Bool)

(assert (=> mapNonEmpty!39637 (= mapRes!39637 (and tp!75916 e!606334))))

(declare-datatypes ((V!38875 0))(
  ( (V!38876 (val!12703 Int)) )
))
(declare-datatypes ((ValueCell!11949 0))(
  ( (ValueCellFull!11949 (v!15315 V!38875)) (EmptyCell!11949) )
))
(declare-fun mapRest!39637 () (Array (_ BitVec 32) ValueCell!11949))

(declare-fun mapValue!39637 () ValueCell!11949)

(declare-datatypes ((array!67607 0))(
  ( (array!67608 (arr!32508 (Array (_ BitVec 32) ValueCell!11949)) (size!33044 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67607)

(declare-fun mapKey!39637 () (_ BitVec 32))

(assert (=> mapNonEmpty!39637 (= (arr!32508 _values!955) (store mapRest!39637 mapKey!39637 mapValue!39637))))

(declare-fun b!1063992 () Bool)

(declare-fun e!606335 () Bool)

(declare-fun e!606332 () Bool)

(assert (=> b!1063992 (= e!606335 (and e!606332 mapRes!39637))))

(declare-fun condMapEmpty!39637 () Bool)

(declare-fun mapDefault!39637 () ValueCell!11949)

(assert (=> b!1063992 (= condMapEmpty!39637 (= (arr!32508 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11949)) mapDefault!39637)))))

(declare-fun b!1063993 () Bool)

(declare-fun res!710350 () Bool)

(declare-fun e!606333 () Bool)

(assert (=> b!1063993 (=> (not res!710350) (not e!606333))))

(declare-datatypes ((array!67609 0))(
  ( (array!67610 (arr!32509 (Array (_ BitVec 32) (_ BitVec 64))) (size!33045 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67609)

(declare-datatypes ((List!22661 0))(
  ( (Nil!22658) (Cons!22657 (h!23866 (_ BitVec 64)) (t!31976 List!22661)) )
))
(declare-fun arrayNoDuplicates!0 (array!67609 (_ BitVec 32) List!22661) Bool)

(assert (=> b!1063993 (= res!710350 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22658))))

(declare-fun b!1063994 () Bool)

(assert (=> b!1063994 (= e!606333 (not true))))

(declare-datatypes ((tuple2!16086 0))(
  ( (tuple2!16087 (_1!8054 (_ BitVec 64)) (_2!8054 V!38875)) )
))
(declare-datatypes ((List!22662 0))(
  ( (Nil!22659) (Cons!22658 (h!23867 tuple2!16086) (t!31977 List!22662)) )
))
(declare-datatypes ((ListLongMap!14055 0))(
  ( (ListLongMap!14056 (toList!7043 List!22662)) )
))
(declare-fun lt!469000 () ListLongMap!14055)

(declare-fun lt!468998 () ListLongMap!14055)

(assert (=> b!1063994 (= lt!469000 lt!468998)))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun zeroValueBefore!47 () V!38875)

(declare-datatypes ((Unit!34886 0))(
  ( (Unit!34887) )
))
(declare-fun lt!468999 () Unit!34886)

(declare-fun minValue!907 () V!38875)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!38875)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!672 (array!67609 array!67607 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38875 V!38875 V!38875 V!38875 (_ BitVec 32) Int) Unit!34886)

(assert (=> b!1063994 (= lt!468999 (lemmaNoChangeToArrayThenSameMapNoExtras!672 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3635 (array!67609 array!67607 (_ BitVec 32) (_ BitVec 32) V!38875 V!38875 (_ BitVec 32) Int) ListLongMap!14055)

(assert (=> b!1063994 (= lt!468998 (getCurrentListMapNoExtraKeys!3635 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1063994 (= lt!469000 (getCurrentListMapNoExtraKeys!3635 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun res!710347 () Bool)

(assert (=> start!94080 (=> (not res!710347) (not e!606333))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94080 (= res!710347 (validMask!0 mask!1515))))

(assert (=> start!94080 e!606333))

(assert (=> start!94080 true))

(assert (=> start!94080 tp_is_empty!25305))

(declare-fun array_inv!25176 (array!67607) Bool)

(assert (=> start!94080 (and (array_inv!25176 _values!955) e!606335)))

(assert (=> start!94080 tp!75917))

(declare-fun array_inv!25177 (array!67609) Bool)

(assert (=> start!94080 (array_inv!25177 _keys!1163)))

(declare-fun b!1063995 () Bool)

(assert (=> b!1063995 (= e!606332 tp_is_empty!25305)))

(declare-fun b!1063996 () Bool)

(declare-fun res!710348 () Bool)

(assert (=> b!1063996 (=> (not res!710348) (not e!606333))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67609 (_ BitVec 32)) Bool)

(assert (=> b!1063996 (= res!710348 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1063997 () Bool)

(declare-fun res!710349 () Bool)

(assert (=> b!1063997 (=> (not res!710349) (not e!606333))))

(assert (=> b!1063997 (= res!710349 (and (= (size!33044 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33045 _keys!1163) (size!33044 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!39637 () Bool)

(assert (=> mapIsEmpty!39637 mapRes!39637))

(assert (= (and start!94080 res!710347) b!1063997))

(assert (= (and b!1063997 res!710349) b!1063996))

(assert (= (and b!1063996 res!710348) b!1063993))

(assert (= (and b!1063993 res!710350) b!1063994))

(assert (= (and b!1063992 condMapEmpty!39637) mapIsEmpty!39637))

(assert (= (and b!1063992 (not condMapEmpty!39637)) mapNonEmpty!39637))

(get-info :version)

(assert (= (and mapNonEmpty!39637 ((_ is ValueCellFull!11949) mapValue!39637)) b!1063991))

(assert (= (and b!1063992 ((_ is ValueCellFull!11949) mapDefault!39637)) b!1063995))

(assert (= start!94080 b!1063992))

(declare-fun m!982611 () Bool)

(assert (=> mapNonEmpty!39637 m!982611))

(declare-fun m!982613 () Bool)

(assert (=> start!94080 m!982613))

(declare-fun m!982615 () Bool)

(assert (=> start!94080 m!982615))

(declare-fun m!982617 () Bool)

(assert (=> start!94080 m!982617))

(declare-fun m!982619 () Bool)

(assert (=> b!1063996 m!982619))

(declare-fun m!982621 () Bool)

(assert (=> b!1063994 m!982621))

(declare-fun m!982623 () Bool)

(assert (=> b!1063994 m!982623))

(declare-fun m!982625 () Bool)

(assert (=> b!1063994 m!982625))

(declare-fun m!982627 () Bool)

(assert (=> b!1063993 m!982627))

(check-sat (not mapNonEmpty!39637) (not b!1063994) (not b!1063993) (not b!1063996) tp_is_empty!25305 b_and!34237 (not start!94080) (not b_next!21495))
(check-sat b_and!34237 (not b_next!21495))
