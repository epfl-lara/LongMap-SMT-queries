; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94420 () Bool)

(assert start!94420)

(declare-fun b_free!21747 () Bool)

(declare-fun b_next!21747 () Bool)

(assert (=> start!94420 (= b_free!21747 (not b_next!21747))))

(declare-fun tp!76687 () Bool)

(declare-fun b_and!34539 () Bool)

(assert (=> start!94420 (= tp!76687 b_and!34539)))

(declare-fun res!712410 () Bool)

(declare-fun e!608931 () Bool)

(assert (=> start!94420 (=> (not res!712410) (not e!608931))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94420 (= res!712410 (validMask!0 mask!1515))))

(assert (=> start!94420 e!608931))

(assert (=> start!94420 true))

(declare-fun tp_is_empty!25557 () Bool)

(assert (=> start!94420 tp_is_empty!25557))

(declare-datatypes ((V!39211 0))(
  ( (V!39212 (val!12829 Int)) )
))
(declare-datatypes ((ValueCell!12075 0))(
  ( (ValueCellFull!12075 (v!15443 V!39211)) (EmptyCell!12075) )
))
(declare-datatypes ((array!68097 0))(
  ( (array!68098 (arr!32748 (Array (_ BitVec 32) ValueCell!12075)) (size!33284 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68097)

(declare-fun e!608930 () Bool)

(declare-fun array_inv!25352 (array!68097) Bool)

(assert (=> start!94420 (and (array_inv!25352 _values!955) e!608930)))

(assert (=> start!94420 tp!76687))

(declare-datatypes ((array!68099 0))(
  ( (array!68100 (arr!32749 (Array (_ BitVec 32) (_ BitVec 64))) (size!33285 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68099)

(declare-fun array_inv!25353 (array!68099) Bool)

(assert (=> start!94420 (array_inv!25353 _keys!1163)))

(declare-fun b!1067589 () Bool)

(declare-fun e!608934 () Bool)

(assert (=> b!1067589 (= e!608931 (not e!608934))))

(declare-fun res!712412 () Bool)

(assert (=> b!1067589 (=> res!712412 e!608934)))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1067589 (= res!712412 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-datatypes ((tuple2!16280 0))(
  ( (tuple2!16281 (_1!8151 (_ BitVec 64)) (_2!8151 V!39211)) )
))
(declare-datatypes ((List!22838 0))(
  ( (Nil!22835) (Cons!22834 (h!24043 tuple2!16280) (t!32163 List!22838)) )
))
(declare-datatypes ((ListLongMap!14249 0))(
  ( (ListLongMap!14250 (toList!7140 List!22838)) )
))
(declare-fun lt!471517 () ListLongMap!14249)

(declare-fun lt!471519 () ListLongMap!14249)

(assert (=> b!1067589 (= lt!471517 lt!471519)))

(declare-fun zeroValueBefore!47 () V!39211)

(declare-datatypes ((Unit!35077 0))(
  ( (Unit!35078) )
))
(declare-fun lt!471520 () Unit!35077)

(declare-fun minValue!907 () V!39211)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39211)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!761 (array!68099 array!68097 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39211 V!39211 V!39211 V!39211 (_ BitVec 32) Int) Unit!35077)

(assert (=> b!1067589 (= lt!471520 (lemmaNoChangeToArrayThenSameMapNoExtras!761 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3724 (array!68099 array!68097 (_ BitVec 32) (_ BitVec 32) V!39211 V!39211 (_ BitVec 32) Int) ListLongMap!14249)

(assert (=> b!1067589 (= lt!471519 (getCurrentListMapNoExtraKeys!3724 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1067589 (= lt!471517 (getCurrentListMapNoExtraKeys!3724 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1067590 () Bool)

(declare-fun res!712411 () Bool)

(assert (=> b!1067590 (=> (not res!712411) (not e!608931))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68099 (_ BitVec 32)) Bool)

(assert (=> b!1067590 (= res!712411 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1067591 () Bool)

(declare-fun e!608932 () Bool)

(declare-fun mapRes!40030 () Bool)

(assert (=> b!1067591 (= e!608930 (and e!608932 mapRes!40030))))

(declare-fun condMapEmpty!40030 () Bool)

(declare-fun mapDefault!40030 () ValueCell!12075)

(assert (=> b!1067591 (= condMapEmpty!40030 (= (arr!32748 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12075)) mapDefault!40030)))))

(declare-fun mapNonEmpty!40030 () Bool)

(declare-fun tp!76688 () Bool)

(declare-fun e!608935 () Bool)

(assert (=> mapNonEmpty!40030 (= mapRes!40030 (and tp!76688 e!608935))))

(declare-fun mapRest!40030 () (Array (_ BitVec 32) ValueCell!12075))

(declare-fun mapValue!40030 () ValueCell!12075)

(declare-fun mapKey!40030 () (_ BitVec 32))

(assert (=> mapNonEmpty!40030 (= (arr!32748 _values!955) (store mapRest!40030 mapKey!40030 mapValue!40030))))

(declare-fun b!1067592 () Bool)

(assert (=> b!1067592 (= e!608934 true)))

(declare-fun lt!471518 () Bool)

(declare-fun contains!6277 (ListLongMap!14249 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4074 (array!68099 array!68097 (_ BitVec 32) (_ BitVec 32) V!39211 V!39211 (_ BitVec 32) Int) ListLongMap!14249)

(assert (=> b!1067592 (= lt!471518 (contains!6277 (getCurrentListMap!4074 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1067593 () Bool)

(assert (=> b!1067593 (= e!608935 tp_is_empty!25557)))

(declare-fun b!1067594 () Bool)

(declare-fun res!712413 () Bool)

(assert (=> b!1067594 (=> (not res!712413) (not e!608931))))

(declare-datatypes ((List!22839 0))(
  ( (Nil!22836) (Cons!22835 (h!24044 (_ BitVec 64)) (t!32164 List!22839)) )
))
(declare-fun arrayNoDuplicates!0 (array!68099 (_ BitVec 32) List!22839) Bool)

(assert (=> b!1067594 (= res!712413 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22836))))

(declare-fun mapIsEmpty!40030 () Bool)

(assert (=> mapIsEmpty!40030 mapRes!40030))

(declare-fun b!1067595 () Bool)

(assert (=> b!1067595 (= e!608932 tp_is_empty!25557)))

(declare-fun b!1067596 () Bool)

(declare-fun res!712409 () Bool)

(assert (=> b!1067596 (=> (not res!712409) (not e!608931))))

(assert (=> b!1067596 (= res!712409 (and (= (size!33284 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33285 _keys!1163) (size!33284 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (= (and start!94420 res!712410) b!1067596))

(assert (= (and b!1067596 res!712409) b!1067590))

(assert (= (and b!1067590 res!712411) b!1067594))

(assert (= (and b!1067594 res!712413) b!1067589))

(assert (= (and b!1067589 (not res!712412)) b!1067592))

(assert (= (and b!1067591 condMapEmpty!40030) mapIsEmpty!40030))

(assert (= (and b!1067591 (not condMapEmpty!40030)) mapNonEmpty!40030))

(get-info :version)

(assert (= (and mapNonEmpty!40030 ((_ is ValueCellFull!12075) mapValue!40030)) b!1067593))

(assert (= (and b!1067591 ((_ is ValueCellFull!12075) mapDefault!40030)) b!1067595))

(assert (= start!94420 b!1067591))

(declare-fun m!986221 () Bool)

(assert (=> b!1067589 m!986221))

(declare-fun m!986223 () Bool)

(assert (=> b!1067589 m!986223))

(declare-fun m!986225 () Bool)

(assert (=> b!1067589 m!986225))

(declare-fun m!986227 () Bool)

(assert (=> mapNonEmpty!40030 m!986227))

(declare-fun m!986229 () Bool)

(assert (=> b!1067590 m!986229))

(declare-fun m!986231 () Bool)

(assert (=> b!1067592 m!986231))

(assert (=> b!1067592 m!986231))

(declare-fun m!986233 () Bool)

(assert (=> b!1067592 m!986233))

(declare-fun m!986235 () Bool)

(assert (=> start!94420 m!986235))

(declare-fun m!986237 () Bool)

(assert (=> start!94420 m!986237))

(declare-fun m!986239 () Bool)

(assert (=> start!94420 m!986239))

(declare-fun m!986241 () Bool)

(assert (=> b!1067594 m!986241))

(check-sat (not b!1067594) (not b!1067590) (not b!1067589) (not b_next!21747) b_and!34539 (not mapNonEmpty!40030) (not start!94420) (not b!1067592) tp_is_empty!25557)
(check-sat b_and!34539 (not b_next!21747))
