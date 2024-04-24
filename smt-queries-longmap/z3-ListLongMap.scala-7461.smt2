; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94910 () Bool)

(assert start!94910)

(declare-fun b_free!21943 () Bool)

(declare-fun b_next!21943 () Bool)

(assert (=> start!94910 (= b_free!21943 (not b_next!21943))))

(declare-fun tp!77285 () Bool)

(declare-fun b_and!34773 () Bool)

(assert (=> start!94910 (= tp!77285 b_and!34773)))

(declare-fun b!1071748 () Bool)

(declare-fun res!714638 () Bool)

(declare-fun e!611890 () Bool)

(assert (=> b!1071748 (=> (not res!714638) (not e!611890))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((V!39473 0))(
  ( (V!39474 (val!12927 Int)) )
))
(declare-datatypes ((ValueCell!12173 0))(
  ( (ValueCellFull!12173 (v!15539 V!39473)) (EmptyCell!12173) )
))
(declare-datatypes ((array!68521 0))(
  ( (array!68522 (arr!32951 (Array (_ BitVec 32) ValueCell!12173)) (size!33488 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68521)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!68523 0))(
  ( (array!68524 (arr!32952 (Array (_ BitVec 32) (_ BitVec 64))) (size!33489 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68523)

(assert (=> b!1071748 (= res!714638 (and (= (size!33488 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33489 _keys!1163) (size!33488 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1071749 () Bool)

(declare-fun e!611889 () Bool)

(assert (=> b!1071749 (= e!611889 true)))

(declare-fun zeroValueBefore!47 () V!39473)

(declare-datatypes ((tuple2!16414 0))(
  ( (tuple2!16415 (_1!8218 (_ BitVec 64)) (_2!8218 V!39473)) )
))
(declare-datatypes ((List!22980 0))(
  ( (Nil!22977) (Cons!22976 (h!24194 tuple2!16414) (t!32303 List!22980)) )
))
(declare-datatypes ((ListLongMap!14391 0))(
  ( (ListLongMap!14392 (toList!7211 List!22980)) )
))
(declare-fun lt!473577 () ListLongMap!14391)

(declare-fun defaultEntry!963 () Int)

(declare-fun minValue!907 () V!39473)

(declare-fun getCurrentListMap!4112 (array!68523 array!68521 (_ BitVec 32) (_ BitVec 32) V!39473 V!39473 (_ BitVec 32) Int) ListLongMap!14391)

(assert (=> b!1071749 (= lt!473577 (getCurrentListMap!4112 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1071751 () Bool)

(declare-fun e!611885 () Bool)

(declare-fun tp_is_empty!25753 () Bool)

(assert (=> b!1071751 (= e!611885 tp_is_empty!25753)))

(declare-fun b!1071752 () Bool)

(assert (=> b!1071752 (= e!611890 (not e!611889))))

(declare-fun res!714637 () Bool)

(assert (=> b!1071752 (=> res!714637 e!611889)))

(assert (=> b!1071752 (= res!714637 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun lt!473578 () ListLongMap!14391)

(declare-fun lt!473579 () ListLongMap!14391)

(assert (=> b!1071752 (= lt!473578 lt!473579)))

(declare-datatypes ((Unit!35208 0))(
  ( (Unit!35209) )
))
(declare-fun lt!473580 () Unit!35208)

(declare-fun zeroValueAfter!47 () V!39473)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!822 (array!68523 array!68521 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39473 V!39473 V!39473 V!39473 (_ BitVec 32) Int) Unit!35208)

(assert (=> b!1071752 (= lt!473580 (lemmaNoChangeToArrayThenSameMapNoExtras!822 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3819 (array!68523 array!68521 (_ BitVec 32) (_ BitVec 32) V!39473 V!39473 (_ BitVec 32) Int) ListLongMap!14391)

(assert (=> b!1071752 (= lt!473579 (getCurrentListMapNoExtraKeys!3819 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1071752 (= lt!473578 (getCurrentListMapNoExtraKeys!3819 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapNonEmpty!40333 () Bool)

(declare-fun mapRes!40333 () Bool)

(declare-fun tp!77284 () Bool)

(assert (=> mapNonEmpty!40333 (= mapRes!40333 (and tp!77284 e!611885))))

(declare-fun mapRest!40333 () (Array (_ BitVec 32) ValueCell!12173))

(declare-fun mapValue!40333 () ValueCell!12173)

(declare-fun mapKey!40333 () (_ BitVec 32))

(assert (=> mapNonEmpty!40333 (= (arr!32951 _values!955) (store mapRest!40333 mapKey!40333 mapValue!40333))))

(declare-fun b!1071753 () Bool)

(declare-fun res!714639 () Bool)

(assert (=> b!1071753 (=> (not res!714639) (not e!611890))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68523 (_ BitVec 32)) Bool)

(assert (=> b!1071753 (= res!714639 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1071754 () Bool)

(declare-fun e!611888 () Bool)

(assert (=> b!1071754 (= e!611888 tp_is_empty!25753)))

(declare-fun b!1071750 () Bool)

(declare-fun res!714636 () Bool)

(assert (=> b!1071750 (=> (not res!714636) (not e!611890))))

(declare-datatypes ((List!22981 0))(
  ( (Nil!22978) (Cons!22977 (h!24195 (_ BitVec 64)) (t!32304 List!22981)) )
))
(declare-fun arrayNoDuplicates!0 (array!68523 (_ BitVec 32) List!22981) Bool)

(assert (=> b!1071750 (= res!714636 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22978))))

(declare-fun res!714635 () Bool)

(assert (=> start!94910 (=> (not res!714635) (not e!611890))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94910 (= res!714635 (validMask!0 mask!1515))))

(assert (=> start!94910 e!611890))

(assert (=> start!94910 true))

(assert (=> start!94910 tp_is_empty!25753))

(declare-fun e!611887 () Bool)

(declare-fun array_inv!25518 (array!68521) Bool)

(assert (=> start!94910 (and (array_inv!25518 _values!955) e!611887)))

(assert (=> start!94910 tp!77285))

(declare-fun array_inv!25519 (array!68523) Bool)

(assert (=> start!94910 (array_inv!25519 _keys!1163)))

(declare-fun b!1071755 () Bool)

(assert (=> b!1071755 (= e!611887 (and e!611888 mapRes!40333))))

(declare-fun condMapEmpty!40333 () Bool)

(declare-fun mapDefault!40333 () ValueCell!12173)

(assert (=> b!1071755 (= condMapEmpty!40333 (= (arr!32951 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12173)) mapDefault!40333)))))

(declare-fun mapIsEmpty!40333 () Bool)

(assert (=> mapIsEmpty!40333 mapRes!40333))

(assert (= (and start!94910 res!714635) b!1071748))

(assert (= (and b!1071748 res!714638) b!1071753))

(assert (= (and b!1071753 res!714639) b!1071750))

(assert (= (and b!1071750 res!714636) b!1071752))

(assert (= (and b!1071752 (not res!714637)) b!1071749))

(assert (= (and b!1071755 condMapEmpty!40333) mapIsEmpty!40333))

(assert (= (and b!1071755 (not condMapEmpty!40333)) mapNonEmpty!40333))

(get-info :version)

(assert (= (and mapNonEmpty!40333 ((_ is ValueCellFull!12173) mapValue!40333)) b!1071751))

(assert (= (and b!1071755 ((_ is ValueCellFull!12173) mapDefault!40333)) b!1071754))

(assert (= start!94910 b!1071755))

(declare-fun m!990445 () Bool)

(assert (=> start!94910 m!990445))

(declare-fun m!990447 () Bool)

(assert (=> start!94910 m!990447))

(declare-fun m!990449 () Bool)

(assert (=> start!94910 m!990449))

(declare-fun m!990451 () Bool)

(assert (=> b!1071749 m!990451))

(declare-fun m!990453 () Bool)

(assert (=> mapNonEmpty!40333 m!990453))

(declare-fun m!990455 () Bool)

(assert (=> b!1071752 m!990455))

(declare-fun m!990457 () Bool)

(assert (=> b!1071752 m!990457))

(declare-fun m!990459 () Bool)

(assert (=> b!1071752 m!990459))

(declare-fun m!990461 () Bool)

(assert (=> b!1071753 m!990461))

(declare-fun m!990463 () Bool)

(assert (=> b!1071750 m!990463))

(check-sat (not b_next!21943) (not b!1071749) tp_is_empty!25753 (not mapNonEmpty!40333) (not start!94910) b_and!34773 (not b!1071750) (not b!1071752) (not b!1071753))
(check-sat b_and!34773 (not b_next!21943))
