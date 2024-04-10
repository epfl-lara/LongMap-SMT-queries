; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94608 () Bool)

(assert start!94608)

(declare-fun b_free!21891 () Bool)

(declare-fun b_next!21891 () Bool)

(assert (=> start!94608 (= b_free!21891 (not b_next!21891))))

(declare-fun tp!77126 () Bool)

(declare-fun b_and!34703 () Bool)

(assert (=> start!94608 (= tp!77126 b_and!34703)))

(declare-fun res!713726 () Bool)

(declare-fun e!610539 () Bool)

(assert (=> start!94608 (=> (not res!713726) (not e!610539))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94608 (= res!713726 (validMask!0 mask!1515))))

(assert (=> start!94608 e!610539))

(assert (=> start!94608 true))

(declare-fun tp_is_empty!25701 () Bool)

(assert (=> start!94608 tp_is_empty!25701))

(declare-datatypes ((V!39403 0))(
  ( (V!39404 (val!12901 Int)) )
))
(declare-datatypes ((ValueCell!12147 0))(
  ( (ValueCellFull!12147 (v!15517 V!39403)) (EmptyCell!12147) )
))
(declare-datatypes ((array!68379 0))(
  ( (array!68380 (arr!32887 (Array (_ BitVec 32) ValueCell!12147)) (size!33423 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68379)

(declare-fun e!610540 () Bool)

(declare-fun array_inv!25446 (array!68379) Bool)

(assert (=> start!94608 (and (array_inv!25446 _values!955) e!610540)))

(assert (=> start!94608 tp!77126))

(declare-datatypes ((array!68381 0))(
  ( (array!68382 (arr!32888 (Array (_ BitVec 32) (_ BitVec 64))) (size!33424 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68381)

(declare-fun array_inv!25447 (array!68381) Bool)

(assert (=> start!94608 (array_inv!25447 _keys!1163)))

(declare-fun b!1069743 () Bool)

(declare-fun res!713724 () Bool)

(assert (=> b!1069743 (=> (not res!713724) (not e!610539))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68381 (_ BitVec 32)) Bool)

(assert (=> b!1069743 (= res!713724 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun mapIsEmpty!40252 () Bool)

(declare-fun mapRes!40252 () Bool)

(assert (=> mapIsEmpty!40252 mapRes!40252))

(declare-fun b!1069744 () Bool)

(declare-fun e!610538 () Bool)

(assert (=> b!1069744 (= e!610538 tp_is_empty!25701)))

(declare-fun mapNonEmpty!40252 () Bool)

(declare-fun tp!77125 () Bool)

(declare-fun e!610542 () Bool)

(assert (=> mapNonEmpty!40252 (= mapRes!40252 (and tp!77125 e!610542))))

(declare-fun mapRest!40252 () (Array (_ BitVec 32) ValueCell!12147))

(declare-fun mapValue!40252 () ValueCell!12147)

(declare-fun mapKey!40252 () (_ BitVec 32))

(assert (=> mapNonEmpty!40252 (= (arr!32887 _values!955) (store mapRest!40252 mapKey!40252 mapValue!40252))))

(declare-fun b!1069745 () Bool)

(assert (=> b!1069745 (= e!610539 (not true))))

(declare-datatypes ((tuple2!16398 0))(
  ( (tuple2!16399 (_1!8210 (_ BitVec 64)) (_2!8210 V!39403)) )
))
(declare-datatypes ((List!22941 0))(
  ( (Nil!22938) (Cons!22937 (h!24146 tuple2!16398) (t!32270 List!22941)) )
))
(declare-datatypes ((ListLongMap!14367 0))(
  ( (ListLongMap!14368 (toList!7199 List!22941)) )
))
(declare-fun lt!472743 () ListLongMap!14367)

(declare-fun lt!472741 () ListLongMap!14367)

(assert (=> b!1069745 (= lt!472743 lt!472741)))

(declare-fun zeroValueBefore!47 () V!39403)

(declare-datatypes ((Unit!35197 0))(
  ( (Unit!35198) )
))
(declare-fun lt!472742 () Unit!35197)

(declare-fun minValue!907 () V!39403)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39403)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!812 (array!68381 array!68379 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39403 V!39403 V!39403 V!39403 (_ BitVec 32) Int) Unit!35197)

(assert (=> b!1069745 (= lt!472742 (lemmaNoChangeToArrayThenSameMapNoExtras!812 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3775 (array!68381 array!68379 (_ BitVec 32) (_ BitVec 32) V!39403 V!39403 (_ BitVec 32) Int) ListLongMap!14367)

(assert (=> b!1069745 (= lt!472741 (getCurrentListMapNoExtraKeys!3775 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1069745 (= lt!472743 (getCurrentListMapNoExtraKeys!3775 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1069746 () Bool)

(declare-fun res!713725 () Bool)

(assert (=> b!1069746 (=> (not res!713725) (not e!610539))))

(declare-datatypes ((List!22942 0))(
  ( (Nil!22939) (Cons!22938 (h!24147 (_ BitVec 64)) (t!32271 List!22942)) )
))
(declare-fun arrayNoDuplicates!0 (array!68381 (_ BitVec 32) List!22942) Bool)

(assert (=> b!1069746 (= res!713725 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22939))))

(declare-fun b!1069747 () Bool)

(assert (=> b!1069747 (= e!610540 (and e!610538 mapRes!40252))))

(declare-fun condMapEmpty!40252 () Bool)

(declare-fun mapDefault!40252 () ValueCell!12147)

(assert (=> b!1069747 (= condMapEmpty!40252 (= (arr!32887 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12147)) mapDefault!40252)))))

(declare-fun b!1069748 () Bool)

(declare-fun res!713723 () Bool)

(assert (=> b!1069748 (=> (not res!713723) (not e!610539))))

(assert (=> b!1069748 (= res!713723 (and (= (size!33423 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33424 _keys!1163) (size!33423 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1069749 () Bool)

(assert (=> b!1069749 (= e!610542 tp_is_empty!25701)))

(assert (= (and start!94608 res!713726) b!1069748))

(assert (= (and b!1069748 res!713723) b!1069743))

(assert (= (and b!1069743 res!713724) b!1069746))

(assert (= (and b!1069746 res!713725) b!1069745))

(assert (= (and b!1069747 condMapEmpty!40252) mapIsEmpty!40252))

(assert (= (and b!1069747 (not condMapEmpty!40252)) mapNonEmpty!40252))

(get-info :version)

(assert (= (and mapNonEmpty!40252 ((_ is ValueCellFull!12147) mapValue!40252)) b!1069749))

(assert (= (and b!1069747 ((_ is ValueCellFull!12147) mapDefault!40252)) b!1069744))

(assert (= start!94608 b!1069747))

(declare-fun m!988209 () Bool)

(assert (=> start!94608 m!988209))

(declare-fun m!988211 () Bool)

(assert (=> start!94608 m!988211))

(declare-fun m!988213 () Bool)

(assert (=> start!94608 m!988213))

(declare-fun m!988215 () Bool)

(assert (=> b!1069746 m!988215))

(declare-fun m!988217 () Bool)

(assert (=> mapNonEmpty!40252 m!988217))

(declare-fun m!988219 () Bool)

(assert (=> b!1069743 m!988219))

(declare-fun m!988221 () Bool)

(assert (=> b!1069745 m!988221))

(declare-fun m!988223 () Bool)

(assert (=> b!1069745 m!988223))

(declare-fun m!988225 () Bool)

(assert (=> b!1069745 m!988225))

(check-sat (not b_next!21891) (not b!1069746) (not b!1069743) tp_is_empty!25701 b_and!34703 (not b!1069745) (not start!94608) (not mapNonEmpty!40252))
(check-sat b_and!34703 (not b_next!21891))
