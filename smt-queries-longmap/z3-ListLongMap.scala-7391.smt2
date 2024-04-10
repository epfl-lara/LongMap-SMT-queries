; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94124 () Bool)

(assert start!94124)

(declare-fun b_free!21525 () Bool)

(declare-fun b_next!21525 () Bool)

(assert (=> start!94124 (= b_free!21525 (not b_next!21525))))

(declare-fun tp!76010 () Bool)

(declare-fun b_and!34275 () Bool)

(assert (=> start!94124 (= tp!76010 b_and!34275)))

(declare-fun b!1064396 () Bool)

(declare-fun e!606620 () Bool)

(declare-fun e!606619 () Bool)

(declare-fun mapRes!39685 () Bool)

(assert (=> b!1064396 (= e!606620 (and e!606619 mapRes!39685))))

(declare-fun condMapEmpty!39685 () Bool)

(declare-datatypes ((V!38915 0))(
  ( (V!38916 (val!12718 Int)) )
))
(declare-datatypes ((ValueCell!11964 0))(
  ( (ValueCellFull!11964 (v!15330 V!38915)) (EmptyCell!11964) )
))
(declare-datatypes ((array!67661 0))(
  ( (array!67662 (arr!32534 (Array (_ BitVec 32) ValueCell!11964)) (size!33070 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67661)

(declare-fun mapDefault!39685 () ValueCell!11964)

(assert (=> b!1064396 (= condMapEmpty!39685 (= (arr!32534 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11964)) mapDefault!39685)))))

(declare-fun b!1064397 () Bool)

(declare-fun e!606617 () Bool)

(assert (=> b!1064397 (= e!606617 true)))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun zeroValueBefore!47 () V!38915)

(declare-fun defaultEntry!963 () Int)

(declare-fun minValue!907 () V!38915)

(declare-datatypes ((tuple2!16104 0))(
  ( (tuple2!16105 (_1!8063 (_ BitVec 64)) (_2!8063 V!38915)) )
))
(declare-datatypes ((List!22678 0))(
  ( (Nil!22675) (Cons!22674 (h!23883 tuple2!16104) (t!31995 List!22678)) )
))
(declare-datatypes ((ListLongMap!14073 0))(
  ( (ListLongMap!14074 (toList!7052 List!22678)) )
))
(declare-fun lt!469178 () ListLongMap!14073)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!67663 0))(
  ( (array!67664 (arr!32535 (Array (_ BitVec 32) (_ BitVec 64))) (size!33071 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67663)

(declare-fun getCurrentListMap!4014 (array!67663 array!67661 (_ BitVec 32) (_ BitVec 32) V!38915 V!38915 (_ BitVec 32) Int) ListLongMap!14073)

(assert (=> b!1064397 (= lt!469178 (getCurrentListMap!4014 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1064398 () Bool)

(declare-fun res!710566 () Bool)

(declare-fun e!606622 () Bool)

(assert (=> b!1064398 (=> (not res!710566) (not e!606622))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(assert (=> b!1064398 (= res!710566 (and (= (size!33070 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33071 _keys!1163) (size!33070 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1064399 () Bool)

(assert (=> b!1064399 (= e!606622 (not e!606617))))

(declare-fun res!710565 () Bool)

(assert (=> b!1064399 (=> res!710565 e!606617)))

(assert (=> b!1064399 (= res!710565 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun lt!469179 () ListLongMap!14073)

(declare-fun lt!469181 () ListLongMap!14073)

(assert (=> b!1064399 (= lt!469179 lt!469181)))

(declare-fun zeroValueAfter!47 () V!38915)

(declare-datatypes ((Unit!34904 0))(
  ( (Unit!34905) )
))
(declare-fun lt!469180 () Unit!34904)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!681 (array!67663 array!67661 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38915 V!38915 V!38915 V!38915 (_ BitVec 32) Int) Unit!34904)

(assert (=> b!1064399 (= lt!469180 (lemmaNoChangeToArrayThenSameMapNoExtras!681 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3644 (array!67663 array!67661 (_ BitVec 32) (_ BitVec 32) V!38915 V!38915 (_ BitVec 32) Int) ListLongMap!14073)

(assert (=> b!1064399 (= lt!469181 (getCurrentListMapNoExtraKeys!3644 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1064399 (= lt!469179 (getCurrentListMapNoExtraKeys!3644 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1064400 () Bool)

(declare-fun tp_is_empty!25335 () Bool)

(assert (=> b!1064400 (= e!606619 tp_is_empty!25335)))

(declare-fun res!710564 () Bool)

(assert (=> start!94124 (=> (not res!710564) (not e!606622))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94124 (= res!710564 (validMask!0 mask!1515))))

(assert (=> start!94124 e!606622))

(assert (=> start!94124 true))

(assert (=> start!94124 tp_is_empty!25335))

(declare-fun array_inv!25194 (array!67661) Bool)

(assert (=> start!94124 (and (array_inv!25194 _values!955) e!606620)))

(assert (=> start!94124 tp!76010))

(declare-fun array_inv!25195 (array!67663) Bool)

(assert (=> start!94124 (array_inv!25195 _keys!1163)))

(declare-fun mapIsEmpty!39685 () Bool)

(assert (=> mapIsEmpty!39685 mapRes!39685))

(declare-fun b!1064401 () Bool)

(declare-fun res!710567 () Bool)

(assert (=> b!1064401 (=> (not res!710567) (not e!606622))))

(declare-datatypes ((List!22679 0))(
  ( (Nil!22676) (Cons!22675 (h!23884 (_ BitVec 64)) (t!31996 List!22679)) )
))
(declare-fun arrayNoDuplicates!0 (array!67663 (_ BitVec 32) List!22679) Bool)

(assert (=> b!1064401 (= res!710567 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22676))))

(declare-fun b!1064402 () Bool)

(declare-fun e!606618 () Bool)

(assert (=> b!1064402 (= e!606618 tp_is_empty!25335)))

(declare-fun b!1064403 () Bool)

(declare-fun res!710563 () Bool)

(assert (=> b!1064403 (=> (not res!710563) (not e!606622))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67663 (_ BitVec 32)) Bool)

(assert (=> b!1064403 (= res!710563 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun mapNonEmpty!39685 () Bool)

(declare-fun tp!76009 () Bool)

(assert (=> mapNonEmpty!39685 (= mapRes!39685 (and tp!76009 e!606618))))

(declare-fun mapKey!39685 () (_ BitVec 32))

(declare-fun mapValue!39685 () ValueCell!11964)

(declare-fun mapRest!39685 () (Array (_ BitVec 32) ValueCell!11964))

(assert (=> mapNonEmpty!39685 (= (arr!32534 _values!955) (store mapRest!39685 mapKey!39685 mapValue!39685))))

(assert (= (and start!94124 res!710564) b!1064398))

(assert (= (and b!1064398 res!710566) b!1064403))

(assert (= (and b!1064403 res!710563) b!1064401))

(assert (= (and b!1064401 res!710567) b!1064399))

(assert (= (and b!1064399 (not res!710565)) b!1064397))

(assert (= (and b!1064396 condMapEmpty!39685) mapIsEmpty!39685))

(assert (= (and b!1064396 (not condMapEmpty!39685)) mapNonEmpty!39685))

(get-info :version)

(assert (= (and mapNonEmpty!39685 ((_ is ValueCellFull!11964) mapValue!39685)) b!1064402))

(assert (= (and b!1064396 ((_ is ValueCellFull!11964) mapDefault!39685)) b!1064400))

(assert (= start!94124 b!1064396))

(declare-fun m!982949 () Bool)

(assert (=> b!1064397 m!982949))

(declare-fun m!982951 () Bool)

(assert (=> b!1064401 m!982951))

(declare-fun m!982953 () Bool)

(assert (=> b!1064399 m!982953))

(declare-fun m!982955 () Bool)

(assert (=> b!1064399 m!982955))

(declare-fun m!982957 () Bool)

(assert (=> b!1064399 m!982957))

(declare-fun m!982959 () Bool)

(assert (=> mapNonEmpty!39685 m!982959))

(declare-fun m!982961 () Bool)

(assert (=> b!1064403 m!982961))

(declare-fun m!982963 () Bool)

(assert (=> start!94124 m!982963))

(declare-fun m!982965 () Bool)

(assert (=> start!94124 m!982965))

(declare-fun m!982967 () Bool)

(assert (=> start!94124 m!982967))

(check-sat (not start!94124) (not b!1064401) (not b_next!21525) (not b!1064403) tp_is_empty!25335 (not b!1064399) (not mapNonEmpty!39685) b_and!34275 (not b!1064397))
(check-sat b_and!34275 (not b_next!21525))
