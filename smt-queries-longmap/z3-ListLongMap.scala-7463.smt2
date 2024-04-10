; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94688 () Bool)

(assert start!94688)

(declare-fun b_free!21957 () Bool)

(declare-fun b_next!21957 () Bool)

(assert (=> start!94688 (= b_free!21957 (not b_next!21957))))

(declare-fun tp!77327 () Bool)

(declare-fun b_and!34777 () Bool)

(assert (=> start!94688 (= tp!77327 b_and!34777)))

(declare-fun b!1070589 () Bool)

(declare-fun res!714221 () Bool)

(declare-fun e!611160 () Bool)

(assert (=> b!1070589 (=> (not res!714221) (not e!611160))))

(declare-datatypes ((array!68509 0))(
  ( (array!68510 (arr!32951 (Array (_ BitVec 32) (_ BitVec 64))) (size!33487 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68509)

(declare-datatypes ((List!22994 0))(
  ( (Nil!22991) (Cons!22990 (h!24199 (_ BitVec 64)) (t!32325 List!22994)) )
))
(declare-fun arrayNoDuplicates!0 (array!68509 (_ BitVec 32) List!22994) Bool)

(assert (=> b!1070589 (= res!714221 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22991))))

(declare-fun b!1070590 () Bool)

(declare-fun e!611161 () Bool)

(declare-fun tp_is_empty!25767 () Bool)

(assert (=> b!1070590 (= e!611161 tp_is_empty!25767)))

(declare-fun b!1070591 () Bool)

(declare-fun res!714219 () Bool)

(assert (=> b!1070591 (=> (not res!714219) (not e!611160))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68509 (_ BitVec 32)) Bool)

(assert (=> b!1070591 (= res!714219 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1070592 () Bool)

(declare-fun e!611158 () Bool)

(assert (=> b!1070592 (= e!611158 tp_is_empty!25767)))

(declare-fun b!1070593 () Bool)

(declare-fun e!611156 () Bool)

(declare-fun mapRes!40354 () Bool)

(assert (=> b!1070593 (= e!611156 (and e!611161 mapRes!40354))))

(declare-fun condMapEmpty!40354 () Bool)

(declare-datatypes ((V!39491 0))(
  ( (V!39492 (val!12934 Int)) )
))
(declare-datatypes ((ValueCell!12180 0))(
  ( (ValueCellFull!12180 (v!15550 V!39491)) (EmptyCell!12180) )
))
(declare-datatypes ((array!68511 0))(
  ( (array!68512 (arr!32952 (Array (_ BitVec 32) ValueCell!12180)) (size!33488 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68511)

(declare-fun mapDefault!40354 () ValueCell!12180)

(assert (=> b!1070593 (= condMapEmpty!40354 (= (arr!32952 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12180)) mapDefault!40354)))))

(declare-fun mapIsEmpty!40354 () Bool)

(assert (=> mapIsEmpty!40354 mapRes!40354))

(declare-fun b!1070594 () Bool)

(declare-fun e!611157 () Bool)

(assert (=> b!1070594 (= e!611160 (not e!611157))))

(declare-fun res!714222 () Bool)

(assert (=> b!1070594 (=> res!714222 e!611157)))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1070594 (= res!714222 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!16450 0))(
  ( (tuple2!16451 (_1!8236 (_ BitVec 64)) (_2!8236 V!39491)) )
))
(declare-datatypes ((List!22995 0))(
  ( (Nil!22992) (Cons!22991 (h!24200 tuple2!16450) (t!32326 List!22995)) )
))
(declare-datatypes ((ListLongMap!14419 0))(
  ( (ListLongMap!14420 (toList!7225 List!22995)) )
))
(declare-fun lt!473149 () ListLongMap!14419)

(declare-fun lt!473146 () ListLongMap!14419)

(assert (=> b!1070594 (= lt!473149 lt!473146)))

(declare-fun zeroValueBefore!47 () V!39491)

(declare-datatypes ((Unit!35249 0))(
  ( (Unit!35250) )
))
(declare-fun lt!473147 () Unit!35249)

(declare-fun minValue!907 () V!39491)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39491)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!838 (array!68509 array!68511 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39491 V!39491 V!39491 V!39491 (_ BitVec 32) Int) Unit!35249)

(assert (=> b!1070594 (= lt!473147 (lemmaNoChangeToArrayThenSameMapNoExtras!838 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3801 (array!68509 array!68511 (_ BitVec 32) (_ BitVec 32) V!39491 V!39491 (_ BitVec 32) Int) ListLongMap!14419)

(assert (=> b!1070594 (= lt!473146 (getCurrentListMapNoExtraKeys!3801 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1070594 (= lt!473149 (getCurrentListMapNoExtraKeys!3801 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapNonEmpty!40354 () Bool)

(declare-fun tp!77326 () Bool)

(assert (=> mapNonEmpty!40354 (= mapRes!40354 (and tp!77326 e!611158))))

(declare-fun mapKey!40354 () (_ BitVec 32))

(declare-fun mapRest!40354 () (Array (_ BitVec 32) ValueCell!12180))

(declare-fun mapValue!40354 () ValueCell!12180)

(assert (=> mapNonEmpty!40354 (= (arr!32952 _values!955) (store mapRest!40354 mapKey!40354 mapValue!40354))))

(declare-fun res!714218 () Bool)

(assert (=> start!94688 (=> (not res!714218) (not e!611160))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94688 (= res!714218 (validMask!0 mask!1515))))

(assert (=> start!94688 e!611160))

(assert (=> start!94688 true))

(assert (=> start!94688 tp_is_empty!25767))

(declare-fun array_inv!25486 (array!68511) Bool)

(assert (=> start!94688 (and (array_inv!25486 _values!955) e!611156)))

(assert (=> start!94688 tp!77327))

(declare-fun array_inv!25487 (array!68509) Bool)

(assert (=> start!94688 (array_inv!25487 _keys!1163)))

(declare-fun b!1070595 () Bool)

(assert (=> b!1070595 (= e!611157 true)))

(declare-fun lt!473148 () ListLongMap!14419)

(declare-fun getCurrentListMap!4128 (array!68509 array!68511 (_ BitVec 32) (_ BitVec 32) V!39491 V!39491 (_ BitVec 32) Int) ListLongMap!14419)

(assert (=> b!1070595 (= lt!473148 (getCurrentListMap!4128 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1070596 () Bool)

(declare-fun res!714220 () Bool)

(assert (=> b!1070596 (=> (not res!714220) (not e!611160))))

(assert (=> b!1070596 (= res!714220 (and (= (size!33488 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33487 _keys!1163) (size!33488 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (= (and start!94688 res!714218) b!1070596))

(assert (= (and b!1070596 res!714220) b!1070591))

(assert (= (and b!1070591 res!714219) b!1070589))

(assert (= (and b!1070589 res!714221) b!1070594))

(assert (= (and b!1070594 (not res!714222)) b!1070595))

(assert (= (and b!1070593 condMapEmpty!40354) mapIsEmpty!40354))

(assert (= (and b!1070593 (not condMapEmpty!40354)) mapNonEmpty!40354))

(get-info :version)

(assert (= (and mapNonEmpty!40354 ((_ is ValueCellFull!12180) mapValue!40354)) b!1070592))

(assert (= (and b!1070593 ((_ is ValueCellFull!12180) mapDefault!40354)) b!1070590))

(assert (= start!94688 b!1070593))

(declare-fun m!988913 () Bool)

(assert (=> b!1070594 m!988913))

(declare-fun m!988915 () Bool)

(assert (=> b!1070594 m!988915))

(declare-fun m!988917 () Bool)

(assert (=> b!1070594 m!988917))

(declare-fun m!988919 () Bool)

(assert (=> mapNonEmpty!40354 m!988919))

(declare-fun m!988921 () Bool)

(assert (=> b!1070591 m!988921))

(declare-fun m!988923 () Bool)

(assert (=> b!1070595 m!988923))

(declare-fun m!988925 () Bool)

(assert (=> b!1070589 m!988925))

(declare-fun m!988927 () Bool)

(assert (=> start!94688 m!988927))

(declare-fun m!988929 () Bool)

(assert (=> start!94688 m!988929))

(declare-fun m!988931 () Bool)

(assert (=> start!94688 m!988931))

(check-sat (not b!1070595) (not b_next!21957) (not b!1070589) (not b!1070594) b_and!34777 (not b!1070591) tp_is_empty!25767 (not mapNonEmpty!40354) (not start!94688))
(check-sat b_and!34777 (not b_next!21957))
