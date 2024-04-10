; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94352 () Bool)

(assert start!94352)

(declare-fun b_free!21693 () Bool)

(declare-fun b_next!21693 () Bool)

(assert (=> start!94352 (= b_free!21693 (not b_next!21693))))

(declare-fun tp!76522 () Bool)

(declare-fun b_and!34477 () Bool)

(assert (=> start!94352 (= tp!76522 b_and!34477)))

(declare-fun mapNonEmpty!39946 () Bool)

(declare-fun mapRes!39946 () Bool)

(declare-fun tp!76523 () Bool)

(declare-fun e!608467 () Bool)

(assert (=> mapNonEmpty!39946 (= mapRes!39946 (and tp!76523 e!608467))))

(declare-datatypes ((V!39139 0))(
  ( (V!39140 (val!12802 Int)) )
))
(declare-datatypes ((ValueCell!12048 0))(
  ( (ValueCellFull!12048 (v!15416 V!39139)) (EmptyCell!12048) )
))
(declare-fun mapRest!39946 () (Array (_ BitVec 32) ValueCell!12048))

(declare-fun mapValue!39946 () ValueCell!12048)

(declare-datatypes ((array!67991 0))(
  ( (array!67992 (arr!32696 (Array (_ BitVec 32) ValueCell!12048)) (size!33232 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67991)

(declare-fun mapKey!39946 () (_ BitVec 32))

(assert (=> mapNonEmpty!39946 (= (arr!32696 _values!955) (store mapRest!39946 mapKey!39946 mapValue!39946))))

(declare-fun b!1066932 () Bool)

(declare-fun res!712051 () Bool)

(declare-fun e!608466 () Bool)

(assert (=> b!1066932 (=> (not res!712051) (not e!608466))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!67993 0))(
  ( (array!67994 (arr!32697 (Array (_ BitVec 32) (_ BitVec 64))) (size!33233 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67993)

(assert (=> b!1066932 (= res!712051 (and (= (size!33232 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33233 _keys!1163) (size!33232 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1066933 () Bool)

(declare-fun res!712050 () Bool)

(assert (=> b!1066933 (=> (not res!712050) (not e!608466))))

(declare-datatypes ((List!22802 0))(
  ( (Nil!22799) (Cons!22798 (h!24007 (_ BitVec 64)) (t!32125 List!22802)) )
))
(declare-fun arrayNoDuplicates!0 (array!67993 (_ BitVec 32) List!22802) Bool)

(assert (=> b!1066933 (= res!712050 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22799))))

(declare-fun b!1066934 () Bool)

(declare-fun e!608465 () Bool)

(declare-fun e!608468 () Bool)

(assert (=> b!1066934 (= e!608465 (and e!608468 mapRes!39946))))

(declare-fun condMapEmpty!39946 () Bool)

(declare-fun mapDefault!39946 () ValueCell!12048)

(assert (=> b!1066934 (= condMapEmpty!39946 (= (arr!32696 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12048)) mapDefault!39946)))))

(declare-fun b!1066935 () Bool)

(assert (=> b!1066935 (= e!608466 (not true))))

(declare-datatypes ((tuple2!16240 0))(
  ( (tuple2!16241 (_1!8131 (_ BitVec 64)) (_2!8131 V!39139)) )
))
(declare-datatypes ((List!22803 0))(
  ( (Nil!22800) (Cons!22799 (h!24008 tuple2!16240) (t!32126 List!22803)) )
))
(declare-datatypes ((ListLongMap!14209 0))(
  ( (ListLongMap!14210 (toList!7120 List!22803)) )
))
(declare-fun lt!471231 () ListLongMap!14209)

(declare-fun lt!471230 () ListLongMap!14209)

(assert (=> b!1066935 (= lt!471231 lt!471230)))

(declare-datatypes ((Unit!35037 0))(
  ( (Unit!35038) )
))
(declare-fun lt!471229 () Unit!35037)

(declare-fun zeroValueBefore!47 () V!39139)

(declare-fun minValue!907 () V!39139)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39139)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!741 (array!67993 array!67991 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39139 V!39139 V!39139 V!39139 (_ BitVec 32) Int) Unit!35037)

(assert (=> b!1066935 (= lt!471229 (lemmaNoChangeToArrayThenSameMapNoExtras!741 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3704 (array!67993 array!67991 (_ BitVec 32) (_ BitVec 32) V!39139 V!39139 (_ BitVec 32) Int) ListLongMap!14209)

(assert (=> b!1066935 (= lt!471230 (getCurrentListMapNoExtraKeys!3704 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1066935 (= lt!471231 (getCurrentListMapNoExtraKeys!3704 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1066936 () Bool)

(declare-fun tp_is_empty!25503 () Bool)

(assert (=> b!1066936 (= e!608467 tp_is_empty!25503)))

(declare-fun b!1066937 () Bool)

(declare-fun res!712049 () Bool)

(assert (=> b!1066937 (=> (not res!712049) (not e!608466))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67993 (_ BitVec 32)) Bool)

(assert (=> b!1066937 (= res!712049 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1066938 () Bool)

(assert (=> b!1066938 (= e!608468 tp_is_empty!25503)))

(declare-fun mapIsEmpty!39946 () Bool)

(assert (=> mapIsEmpty!39946 mapRes!39946))

(declare-fun res!712052 () Bool)

(assert (=> start!94352 (=> (not res!712052) (not e!608466))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94352 (= res!712052 (validMask!0 mask!1515))))

(assert (=> start!94352 e!608466))

(assert (=> start!94352 true))

(assert (=> start!94352 tp_is_empty!25503))

(declare-fun array_inv!25314 (array!67991) Bool)

(assert (=> start!94352 (and (array_inv!25314 _values!955) e!608465)))

(assert (=> start!94352 tp!76522))

(declare-fun array_inv!25315 (array!67993) Bool)

(assert (=> start!94352 (array_inv!25315 _keys!1163)))

(assert (= (and start!94352 res!712052) b!1066932))

(assert (= (and b!1066932 res!712051) b!1066937))

(assert (= (and b!1066937 res!712049) b!1066933))

(assert (= (and b!1066933 res!712050) b!1066935))

(assert (= (and b!1066934 condMapEmpty!39946) mapIsEmpty!39946))

(assert (= (and b!1066934 (not condMapEmpty!39946)) mapNonEmpty!39946))

(get-info :version)

(assert (= (and mapNonEmpty!39946 ((_ is ValueCellFull!12048) mapValue!39946)) b!1066936))

(assert (= (and b!1066934 ((_ is ValueCellFull!12048) mapDefault!39946)) b!1066938))

(assert (= start!94352 b!1066934))

(declare-fun m!985665 () Bool)

(assert (=> mapNonEmpty!39946 m!985665))

(declare-fun m!985667 () Bool)

(assert (=> b!1066937 m!985667))

(declare-fun m!985669 () Bool)

(assert (=> b!1066933 m!985669))

(declare-fun m!985671 () Bool)

(assert (=> start!94352 m!985671))

(declare-fun m!985673 () Bool)

(assert (=> start!94352 m!985673))

(declare-fun m!985675 () Bool)

(assert (=> start!94352 m!985675))

(declare-fun m!985677 () Bool)

(assert (=> b!1066935 m!985677))

(declare-fun m!985679 () Bool)

(assert (=> b!1066935 m!985679))

(declare-fun m!985681 () Bool)

(assert (=> b!1066935 m!985681))

(check-sat (not b_next!21693) tp_is_empty!25503 (not b!1066933) b_and!34477 (not b!1066937) (not mapNonEmpty!39946) (not b!1066935) (not start!94352))
(check-sat b_and!34477 (not b_next!21693))
