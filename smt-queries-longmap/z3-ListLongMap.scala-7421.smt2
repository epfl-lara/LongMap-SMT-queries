; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94356 () Bool)

(assert start!94356)

(declare-fun b_free!21703 () Bool)

(declare-fun b_next!21703 () Bool)

(assert (=> start!94356 (= b_free!21703 (not b_next!21703))))

(declare-fun tp!76552 () Bool)

(declare-fun b_and!34461 () Bool)

(assert (=> start!94356 (= tp!76552 b_and!34461)))

(declare-fun b!1066884 () Bool)

(declare-fun res!712041 () Bool)

(declare-fun e!608450 () Bool)

(assert (=> b!1066884 (=> (not res!712041) (not e!608450))))

(declare-datatypes ((array!67954 0))(
  ( (array!67955 (arr!32678 (Array (_ BitVec 32) (_ BitVec 64))) (size!33216 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67954)

(declare-datatypes ((List!22843 0))(
  ( (Nil!22840) (Cons!22839 (h!24048 (_ BitVec 64)) (t!32157 List!22843)) )
))
(declare-fun arrayNoDuplicates!0 (array!67954 (_ BitVec 32) List!22843) Bool)

(assert (=> b!1066884 (= res!712041 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22840))))

(declare-fun b!1066885 () Bool)

(declare-fun res!712040 () Bool)

(assert (=> b!1066885 (=> (not res!712040) (not e!608450))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67954 (_ BitVec 32)) Bool)

(assert (=> b!1066885 (= res!712040 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun mapIsEmpty!39961 () Bool)

(declare-fun mapRes!39961 () Bool)

(assert (=> mapIsEmpty!39961 mapRes!39961))

(declare-fun b!1066886 () Bool)

(assert (=> b!1066886 (= e!608450 (not true))))

(declare-datatypes ((V!39153 0))(
  ( (V!39154 (val!12807 Int)) )
))
(declare-datatypes ((tuple2!16300 0))(
  ( (tuple2!16301 (_1!8161 (_ BitVec 64)) (_2!8161 V!39153)) )
))
(declare-datatypes ((List!22844 0))(
  ( (Nil!22841) (Cons!22840 (h!24049 tuple2!16300) (t!32158 List!22844)) )
))
(declare-datatypes ((ListLongMap!14269 0))(
  ( (ListLongMap!14270 (toList!7150 List!22844)) )
))
(declare-fun lt!471076 () ListLongMap!14269)

(declare-fun lt!471075 () ListLongMap!14269)

(assert (=> b!1066886 (= lt!471076 lt!471075)))

(declare-fun zeroValueBefore!47 () V!39153)

(declare-datatypes ((Unit!34890 0))(
  ( (Unit!34891) )
))
(declare-fun lt!471074 () Unit!34890)

(declare-datatypes ((ValueCell!12053 0))(
  ( (ValueCellFull!12053 (v!15420 V!39153)) (EmptyCell!12053) )
))
(declare-datatypes ((array!67956 0))(
  ( (array!67957 (arr!32679 (Array (_ BitVec 32) ValueCell!12053)) (size!33217 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67956)

(declare-fun minValue!907 () V!39153)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39153)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!740 (array!67954 array!67956 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39153 V!39153 V!39153 V!39153 (_ BitVec 32) Int) Unit!34890)

(assert (=> b!1066886 (= lt!471074 (lemmaNoChangeToArrayThenSameMapNoExtras!740 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3746 (array!67954 array!67956 (_ BitVec 32) (_ BitVec 32) V!39153 V!39153 (_ BitVec 32) Int) ListLongMap!14269)

(assert (=> b!1066886 (= lt!471075 (getCurrentListMapNoExtraKeys!3746 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1066886 (= lt!471076 (getCurrentListMapNoExtraKeys!3746 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1066887 () Bool)

(declare-fun e!608451 () Bool)

(declare-fun e!608447 () Bool)

(assert (=> b!1066887 (= e!608451 (and e!608447 mapRes!39961))))

(declare-fun condMapEmpty!39961 () Bool)

(declare-fun mapDefault!39961 () ValueCell!12053)

(assert (=> b!1066887 (= condMapEmpty!39961 (= (arr!32679 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12053)) mapDefault!39961)))))

(declare-fun res!712042 () Bool)

(assert (=> start!94356 (=> (not res!712042) (not e!608450))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94356 (= res!712042 (validMask!0 mask!1515))))

(assert (=> start!94356 e!608450))

(assert (=> start!94356 true))

(declare-fun tp_is_empty!25513 () Bool)

(assert (=> start!94356 tp_is_empty!25513))

(declare-fun array_inv!25298 (array!67956) Bool)

(assert (=> start!94356 (and (array_inv!25298 _values!955) e!608451)))

(assert (=> start!94356 tp!76552))

(declare-fun array_inv!25299 (array!67954) Bool)

(assert (=> start!94356 (array_inv!25299 _keys!1163)))

(declare-fun mapNonEmpty!39961 () Bool)

(declare-fun tp!76553 () Bool)

(declare-fun e!608449 () Bool)

(assert (=> mapNonEmpty!39961 (= mapRes!39961 (and tp!76553 e!608449))))

(declare-fun mapValue!39961 () ValueCell!12053)

(declare-fun mapKey!39961 () (_ BitVec 32))

(declare-fun mapRest!39961 () (Array (_ BitVec 32) ValueCell!12053))

(assert (=> mapNonEmpty!39961 (= (arr!32679 _values!955) (store mapRest!39961 mapKey!39961 mapValue!39961))))

(declare-fun b!1066888 () Bool)

(assert (=> b!1066888 (= e!608447 tp_is_empty!25513)))

(declare-fun b!1066889 () Bool)

(declare-fun res!712043 () Bool)

(assert (=> b!1066889 (=> (not res!712043) (not e!608450))))

(assert (=> b!1066889 (= res!712043 (and (= (size!33217 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33216 _keys!1163) (size!33217 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1066890 () Bool)

(assert (=> b!1066890 (= e!608449 tp_is_empty!25513)))

(assert (= (and start!94356 res!712042) b!1066889))

(assert (= (and b!1066889 res!712043) b!1066885))

(assert (= (and b!1066885 res!712040) b!1066884))

(assert (= (and b!1066884 res!712041) b!1066886))

(assert (= (and b!1066887 condMapEmpty!39961) mapIsEmpty!39961))

(assert (= (and b!1066887 (not condMapEmpty!39961)) mapNonEmpty!39961))

(get-info :version)

(assert (= (and mapNonEmpty!39961 ((_ is ValueCellFull!12053) mapValue!39961)) b!1066890))

(assert (= (and b!1066887 ((_ is ValueCellFull!12053) mapDefault!39961)) b!1066888))

(assert (= start!94356 b!1066887))

(declare-fun m!985129 () Bool)

(assert (=> b!1066884 m!985129))

(declare-fun m!985131 () Bool)

(assert (=> start!94356 m!985131))

(declare-fun m!985133 () Bool)

(assert (=> start!94356 m!985133))

(declare-fun m!985135 () Bool)

(assert (=> start!94356 m!985135))

(declare-fun m!985137 () Bool)

(assert (=> b!1066886 m!985137))

(declare-fun m!985139 () Bool)

(assert (=> b!1066886 m!985139))

(declare-fun m!985141 () Bool)

(assert (=> b!1066886 m!985141))

(declare-fun m!985143 () Bool)

(assert (=> mapNonEmpty!39961 m!985143))

(declare-fun m!985145 () Bool)

(assert (=> b!1066885 m!985145))

(check-sat (not b!1066885) (not b_next!21703) (not mapNonEmpty!39961) (not start!94356) (not b!1066884) tp_is_empty!25513 b_and!34461 (not b!1066886))
(check-sat b_and!34461 (not b_next!21703))
