; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94664 () Bool)

(assert start!94664)

(declare-fun b_free!21933 () Bool)

(declare-fun b_next!21933 () Bool)

(assert (=> start!94664 (= b_free!21933 (not b_next!21933))))

(declare-fun tp!77254 () Bool)

(declare-fun b_and!34753 () Bool)

(assert (=> start!94664 (= tp!77254 b_and!34753)))

(declare-fun b!1070301 () Bool)

(declare-fun e!610943 () Bool)

(declare-fun tp_is_empty!25743 () Bool)

(assert (=> b!1070301 (= e!610943 tp_is_empty!25743)))

(declare-fun b!1070302 () Bool)

(declare-fun e!610944 () Bool)

(assert (=> b!1070302 (= e!610944 true)))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((V!39459 0))(
  ( (V!39460 (val!12922 Int)) )
))
(declare-fun zeroValueBefore!47 () V!39459)

(declare-datatypes ((tuple2!16428 0))(
  ( (tuple2!16429 (_1!8225 (_ BitVec 64)) (_2!8225 V!39459)) )
))
(declare-datatypes ((List!22971 0))(
  ( (Nil!22968) (Cons!22967 (h!24176 tuple2!16428) (t!32302 List!22971)) )
))
(declare-datatypes ((ListLongMap!14397 0))(
  ( (ListLongMap!14398 (toList!7214 List!22971)) )
))
(declare-fun lt!473004 () ListLongMap!14397)

(declare-datatypes ((ValueCell!12168 0))(
  ( (ValueCellFull!12168 (v!15538 V!39459)) (EmptyCell!12168) )
))
(declare-datatypes ((array!68461 0))(
  ( (array!68462 (arr!32927 (Array (_ BitVec 32) ValueCell!12168)) (size!33463 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68461)

(declare-fun defaultEntry!963 () Int)

(declare-fun minValue!907 () V!39459)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!68463 0))(
  ( (array!68464 (arr!32928 (Array (_ BitVec 32) (_ BitVec 64))) (size!33464 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68463)

(declare-fun getCurrentListMap!4117 (array!68463 array!68461 (_ BitVec 32) (_ BitVec 32) V!39459 V!39459 (_ BitVec 32) Int) ListLongMap!14397)

(assert (=> b!1070302 (= lt!473004 (getCurrentListMap!4117 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1070303 () Bool)

(declare-fun res!714040 () Bool)

(declare-fun e!610942 () Bool)

(assert (=> b!1070303 (=> (not res!714040) (not e!610942))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68463 (_ BitVec 32)) Bool)

(assert (=> b!1070303 (= res!714040 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1070304 () Bool)

(declare-fun e!610941 () Bool)

(assert (=> b!1070304 (= e!610941 tp_is_empty!25743)))

(declare-fun res!714042 () Bool)

(assert (=> start!94664 (=> (not res!714042) (not e!610942))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94664 (= res!714042 (validMask!0 mask!1515))))

(assert (=> start!94664 e!610942))

(assert (=> start!94664 true))

(assert (=> start!94664 tp_is_empty!25743))

(declare-fun e!610940 () Bool)

(declare-fun array_inv!25470 (array!68461) Bool)

(assert (=> start!94664 (and (array_inv!25470 _values!955) e!610940)))

(assert (=> start!94664 tp!77254))

(declare-fun array_inv!25471 (array!68463) Bool)

(assert (=> start!94664 (array_inv!25471 _keys!1163)))

(declare-fun mapIsEmpty!40318 () Bool)

(declare-fun mapRes!40318 () Bool)

(assert (=> mapIsEmpty!40318 mapRes!40318))

(declare-fun b!1070305 () Bool)

(declare-fun res!714038 () Bool)

(assert (=> b!1070305 (=> (not res!714038) (not e!610942))))

(declare-datatypes ((List!22972 0))(
  ( (Nil!22969) (Cons!22968 (h!24177 (_ BitVec 64)) (t!32303 List!22972)) )
))
(declare-fun arrayNoDuplicates!0 (array!68463 (_ BitVec 32) List!22972) Bool)

(assert (=> b!1070305 (= res!714038 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22969))))

(declare-fun b!1070306 () Bool)

(assert (=> b!1070306 (= e!610942 (not e!610944))))

(declare-fun res!714039 () Bool)

(assert (=> b!1070306 (=> res!714039 e!610944)))

(assert (=> b!1070306 (= res!714039 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun lt!473005 () ListLongMap!14397)

(declare-fun lt!473003 () ListLongMap!14397)

(assert (=> b!1070306 (= lt!473005 lt!473003)))

(declare-datatypes ((Unit!35227 0))(
  ( (Unit!35228) )
))
(declare-fun lt!473002 () Unit!35227)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun zeroValueAfter!47 () V!39459)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!827 (array!68463 array!68461 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39459 V!39459 V!39459 V!39459 (_ BitVec 32) Int) Unit!35227)

(assert (=> b!1070306 (= lt!473002 (lemmaNoChangeToArrayThenSameMapNoExtras!827 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3790 (array!68463 array!68461 (_ BitVec 32) (_ BitVec 32) V!39459 V!39459 (_ BitVec 32) Int) ListLongMap!14397)

(assert (=> b!1070306 (= lt!473003 (getCurrentListMapNoExtraKeys!3790 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1070306 (= lt!473005 (getCurrentListMapNoExtraKeys!3790 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapNonEmpty!40318 () Bool)

(declare-fun tp!77255 () Bool)

(assert (=> mapNonEmpty!40318 (= mapRes!40318 (and tp!77255 e!610941))))

(declare-fun mapRest!40318 () (Array (_ BitVec 32) ValueCell!12168))

(declare-fun mapValue!40318 () ValueCell!12168)

(declare-fun mapKey!40318 () (_ BitVec 32))

(assert (=> mapNonEmpty!40318 (= (arr!32927 _values!955) (store mapRest!40318 mapKey!40318 mapValue!40318))))

(declare-fun b!1070307 () Bool)

(declare-fun res!714041 () Bool)

(assert (=> b!1070307 (=> (not res!714041) (not e!610942))))

(assert (=> b!1070307 (= res!714041 (and (= (size!33463 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33464 _keys!1163) (size!33463 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1070308 () Bool)

(assert (=> b!1070308 (= e!610940 (and e!610943 mapRes!40318))))

(declare-fun condMapEmpty!40318 () Bool)

(declare-fun mapDefault!40318 () ValueCell!12168)

(assert (=> b!1070308 (= condMapEmpty!40318 (= (arr!32927 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12168)) mapDefault!40318)))))

(assert (= (and start!94664 res!714042) b!1070307))

(assert (= (and b!1070307 res!714041) b!1070303))

(assert (= (and b!1070303 res!714040) b!1070305))

(assert (= (and b!1070305 res!714038) b!1070306))

(assert (= (and b!1070306 (not res!714039)) b!1070302))

(assert (= (and b!1070308 condMapEmpty!40318) mapIsEmpty!40318))

(assert (= (and b!1070308 (not condMapEmpty!40318)) mapNonEmpty!40318))

(get-info :version)

(assert (= (and mapNonEmpty!40318 ((_ is ValueCellFull!12168) mapValue!40318)) b!1070304))

(assert (= (and b!1070308 ((_ is ValueCellFull!12168) mapDefault!40318)) b!1070301))

(assert (= start!94664 b!1070308))

(declare-fun m!988673 () Bool)

(assert (=> start!94664 m!988673))

(declare-fun m!988675 () Bool)

(assert (=> start!94664 m!988675))

(declare-fun m!988677 () Bool)

(assert (=> start!94664 m!988677))

(declare-fun m!988679 () Bool)

(assert (=> b!1070303 m!988679))

(declare-fun m!988681 () Bool)

(assert (=> b!1070306 m!988681))

(declare-fun m!988683 () Bool)

(assert (=> b!1070306 m!988683))

(declare-fun m!988685 () Bool)

(assert (=> b!1070306 m!988685))

(declare-fun m!988687 () Bool)

(assert (=> b!1070302 m!988687))

(declare-fun m!988689 () Bool)

(assert (=> b!1070305 m!988689))

(declare-fun m!988691 () Bool)

(assert (=> mapNonEmpty!40318 m!988691))

(check-sat (not b!1070305) (not b_next!21933) (not start!94664) (not b!1070306) (not b!1070302) (not b!1070303) (not mapNonEmpty!40318) tp_is_empty!25743 b_and!34753)
(check-sat b_and!34753 (not b_next!21933))
