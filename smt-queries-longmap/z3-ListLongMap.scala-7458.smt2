; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94658 () Bool)

(assert start!94658)

(declare-fun b_free!21927 () Bool)

(declare-fun b_next!21927 () Bool)

(assert (=> start!94658 (= b_free!21927 (not b_next!21927))))

(declare-fun tp!77236 () Bool)

(declare-fun b_and!34747 () Bool)

(assert (=> start!94658 (= tp!77236 b_and!34747)))

(declare-fun mapIsEmpty!40309 () Bool)

(declare-fun mapRes!40309 () Bool)

(assert (=> mapIsEmpty!40309 mapRes!40309))

(declare-fun b!1070229 () Bool)

(declare-fun e!610887 () Bool)

(assert (=> b!1070229 (= e!610887 true)))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((V!39451 0))(
  ( (V!39452 (val!12919 Int)) )
))
(declare-fun zeroValueBefore!47 () V!39451)

(declare-datatypes ((tuple2!16424 0))(
  ( (tuple2!16425 (_1!8223 (_ BitVec 64)) (_2!8223 V!39451)) )
))
(declare-datatypes ((List!22967 0))(
  ( (Nil!22964) (Cons!22963 (h!24172 tuple2!16424) (t!32298 List!22967)) )
))
(declare-datatypes ((ListLongMap!14393 0))(
  ( (ListLongMap!14394 (toList!7212 List!22967)) )
))
(declare-fun lt!472967 () ListLongMap!14393)

(declare-datatypes ((ValueCell!12165 0))(
  ( (ValueCellFull!12165 (v!15535 V!39451)) (EmptyCell!12165) )
))
(declare-datatypes ((array!68449 0))(
  ( (array!68450 (arr!32921 (Array (_ BitVec 32) ValueCell!12165)) (size!33457 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68449)

(declare-fun defaultEntry!963 () Int)

(declare-fun minValue!907 () V!39451)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!68451 0))(
  ( (array!68452 (arr!32922 (Array (_ BitVec 32) (_ BitVec 64))) (size!33458 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68451)

(declare-fun getCurrentListMap!4115 (array!68451 array!68449 (_ BitVec 32) (_ BitVec 32) V!39451 V!39451 (_ BitVec 32) Int) ListLongMap!14393)

(assert (=> b!1070229 (= lt!472967 (getCurrentListMap!4115 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1070230 () Bool)

(declare-fun res!713997 () Bool)

(declare-fun e!610891 () Bool)

(assert (=> b!1070230 (=> (not res!713997) (not e!610891))))

(declare-datatypes ((List!22968 0))(
  ( (Nil!22965) (Cons!22964 (h!24173 (_ BitVec 64)) (t!32299 List!22968)) )
))
(declare-fun arrayNoDuplicates!0 (array!68451 (_ BitVec 32) List!22968) Bool)

(assert (=> b!1070230 (= res!713997 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22965))))

(declare-fun b!1070231 () Bool)

(declare-fun e!610889 () Bool)

(declare-fun e!610886 () Bool)

(assert (=> b!1070231 (= e!610889 (and e!610886 mapRes!40309))))

(declare-fun condMapEmpty!40309 () Bool)

(declare-fun mapDefault!40309 () ValueCell!12165)

(assert (=> b!1070231 (= condMapEmpty!40309 (= (arr!32921 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12165)) mapDefault!40309)))))

(declare-fun b!1070232 () Bool)

(declare-fun res!713994 () Bool)

(assert (=> b!1070232 (=> (not res!713994) (not e!610891))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(assert (=> b!1070232 (= res!713994 (and (= (size!33457 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33458 _keys!1163) (size!33457 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!40309 () Bool)

(declare-fun tp!77237 () Bool)

(declare-fun e!610890 () Bool)

(assert (=> mapNonEmpty!40309 (= mapRes!40309 (and tp!77237 e!610890))))

(declare-fun mapValue!40309 () ValueCell!12165)

(declare-fun mapRest!40309 () (Array (_ BitVec 32) ValueCell!12165))

(declare-fun mapKey!40309 () (_ BitVec 32))

(assert (=> mapNonEmpty!40309 (= (arr!32921 _values!955) (store mapRest!40309 mapKey!40309 mapValue!40309))))

(declare-fun res!713995 () Bool)

(assert (=> start!94658 (=> (not res!713995) (not e!610891))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94658 (= res!713995 (validMask!0 mask!1515))))

(assert (=> start!94658 e!610891))

(assert (=> start!94658 true))

(declare-fun tp_is_empty!25737 () Bool)

(assert (=> start!94658 tp_is_empty!25737))

(declare-fun array_inv!25466 (array!68449) Bool)

(assert (=> start!94658 (and (array_inv!25466 _values!955) e!610889)))

(assert (=> start!94658 tp!77236))

(declare-fun array_inv!25467 (array!68451) Bool)

(assert (=> start!94658 (array_inv!25467 _keys!1163)))

(declare-fun b!1070233 () Bool)

(declare-fun res!713996 () Bool)

(assert (=> b!1070233 (=> (not res!713996) (not e!610891))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68451 (_ BitVec 32)) Bool)

(assert (=> b!1070233 (= res!713996 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1070234 () Bool)

(assert (=> b!1070234 (= e!610890 tp_is_empty!25737)))

(declare-fun b!1070235 () Bool)

(assert (=> b!1070235 (= e!610886 tp_is_empty!25737)))

(declare-fun b!1070236 () Bool)

(assert (=> b!1070236 (= e!610891 (not e!610887))))

(declare-fun res!713993 () Bool)

(assert (=> b!1070236 (=> res!713993 e!610887)))

(assert (=> b!1070236 (= res!713993 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun lt!472966 () ListLongMap!14393)

(declare-fun lt!472969 () ListLongMap!14393)

(assert (=> b!1070236 (= lt!472966 lt!472969)))

(declare-fun zeroValueAfter!47 () V!39451)

(declare-datatypes ((Unit!35223 0))(
  ( (Unit!35224) )
))
(declare-fun lt!472968 () Unit!35223)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!825 (array!68451 array!68449 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39451 V!39451 V!39451 V!39451 (_ BitVec 32) Int) Unit!35223)

(assert (=> b!1070236 (= lt!472968 (lemmaNoChangeToArrayThenSameMapNoExtras!825 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3788 (array!68451 array!68449 (_ BitVec 32) (_ BitVec 32) V!39451 V!39451 (_ BitVec 32) Int) ListLongMap!14393)

(assert (=> b!1070236 (= lt!472969 (getCurrentListMapNoExtraKeys!3788 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1070236 (= lt!472966 (getCurrentListMapNoExtraKeys!3788 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (= (and start!94658 res!713995) b!1070232))

(assert (= (and b!1070232 res!713994) b!1070233))

(assert (= (and b!1070233 res!713996) b!1070230))

(assert (= (and b!1070230 res!713997) b!1070236))

(assert (= (and b!1070236 (not res!713993)) b!1070229))

(assert (= (and b!1070231 condMapEmpty!40309) mapIsEmpty!40309))

(assert (= (and b!1070231 (not condMapEmpty!40309)) mapNonEmpty!40309))

(get-info :version)

(assert (= (and mapNonEmpty!40309 ((_ is ValueCellFull!12165) mapValue!40309)) b!1070234))

(assert (= (and b!1070231 ((_ is ValueCellFull!12165) mapDefault!40309)) b!1070235))

(assert (= start!94658 b!1070231))

(declare-fun m!988613 () Bool)

(assert (=> mapNonEmpty!40309 m!988613))

(declare-fun m!988615 () Bool)

(assert (=> b!1070233 m!988615))

(declare-fun m!988617 () Bool)

(assert (=> start!94658 m!988617))

(declare-fun m!988619 () Bool)

(assert (=> start!94658 m!988619))

(declare-fun m!988621 () Bool)

(assert (=> start!94658 m!988621))

(declare-fun m!988623 () Bool)

(assert (=> b!1070236 m!988623))

(declare-fun m!988625 () Bool)

(assert (=> b!1070236 m!988625))

(declare-fun m!988627 () Bool)

(assert (=> b!1070236 m!988627))

(declare-fun m!988629 () Bool)

(assert (=> b!1070230 m!988629))

(declare-fun m!988631 () Bool)

(assert (=> b!1070229 m!988631))

(check-sat (not b!1070229) (not b!1070230) (not start!94658) b_and!34747 (not b!1070236) (not mapNonEmpty!40309) (not b!1070233) tp_is_empty!25737 (not b_next!21927))
(check-sat b_and!34747 (not b_next!21927))
