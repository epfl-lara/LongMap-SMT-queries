; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94896 () Bool)

(assert start!94896)

(declare-fun b_free!22101 () Bool)

(declare-fun b_next!22101 () Bool)

(assert (=> start!94896 (= b_free!22101 (not b_next!22101))))

(declare-fun tp!77767 () Bool)

(declare-fun b_and!34955 () Bool)

(assert (=> start!94896 (= tp!77767 b_and!34955)))

(declare-fun mapIsEmpty!40579 () Bool)

(declare-fun mapRes!40579 () Bool)

(assert (=> mapIsEmpty!40579 mapRes!40579))

(declare-fun b!1073006 () Bool)

(declare-fun e!612950 () Bool)

(declare-fun tp_is_empty!25911 () Bool)

(assert (=> b!1073006 (= e!612950 tp_is_empty!25911)))

(declare-fun res!715696 () Bool)

(declare-fun e!612949 () Bool)

(assert (=> start!94896 (=> (not res!715696) (not e!612949))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94896 (= res!715696 (validMask!0 mask!1515))))

(assert (=> start!94896 e!612949))

(assert (=> start!94896 true))

(assert (=> start!94896 tp_is_empty!25911))

(declare-datatypes ((V!39683 0))(
  ( (V!39684 (val!13006 Int)) )
))
(declare-datatypes ((ValueCell!12252 0))(
  ( (ValueCellFull!12252 (v!15624 V!39683)) (EmptyCell!12252) )
))
(declare-datatypes ((array!68785 0))(
  ( (array!68786 (arr!33086 (Array (_ BitVec 32) ValueCell!12252)) (size!33622 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68785)

(declare-fun e!612953 () Bool)

(declare-fun array_inv!25574 (array!68785) Bool)

(assert (=> start!94896 (and (array_inv!25574 _values!955) e!612953)))

(assert (=> start!94896 tp!77767))

(declare-datatypes ((array!68787 0))(
  ( (array!68788 (arr!33087 (Array (_ BitVec 32) (_ BitVec 64))) (size!33623 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68787)

(declare-fun array_inv!25575 (array!68787) Bool)

(assert (=> start!94896 (array_inv!25575 _keys!1163)))

(declare-fun b!1073007 () Bool)

(declare-fun res!715694 () Bool)

(assert (=> b!1073007 (=> (not res!715694) (not e!612949))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1073007 (= res!715694 (and (= (size!33622 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33623 _keys!1163) (size!33622 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1073008 () Bool)

(declare-fun e!612951 () Bool)

(assert (=> b!1073008 (= e!612951 tp_is_empty!25911)))

(declare-fun b!1073009 () Bool)

(declare-fun res!715695 () Bool)

(assert (=> b!1073009 (=> (not res!715695) (not e!612949))))

(declare-datatypes ((List!23097 0))(
  ( (Nil!23094) (Cons!23093 (h!24302 (_ BitVec 64)) (t!32434 List!23097)) )
))
(declare-fun arrayNoDuplicates!0 (array!68787 (_ BitVec 32) List!23097) Bool)

(assert (=> b!1073009 (= res!715695 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23094))))

(declare-fun mapNonEmpty!40579 () Bool)

(declare-fun tp!77768 () Bool)

(assert (=> mapNonEmpty!40579 (= mapRes!40579 (and tp!77768 e!612950))))

(declare-fun mapValue!40579 () ValueCell!12252)

(declare-fun mapKey!40579 () (_ BitVec 32))

(declare-fun mapRest!40579 () (Array (_ BitVec 32) ValueCell!12252))

(assert (=> mapNonEmpty!40579 (= (arr!33086 _values!955) (store mapRest!40579 mapKey!40579 mapValue!40579))))

(declare-fun b!1073010 () Bool)

(assert (=> b!1073010 (= e!612953 (and e!612951 mapRes!40579))))

(declare-fun condMapEmpty!40579 () Bool)

(declare-fun mapDefault!40579 () ValueCell!12252)

(assert (=> b!1073010 (= condMapEmpty!40579 (= (arr!33086 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12252)) mapDefault!40579)))))

(declare-fun b!1073011 () Bool)

(declare-fun res!715693 () Bool)

(assert (=> b!1073011 (=> (not res!715693) (not e!612949))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68787 (_ BitVec 32)) Bool)

(assert (=> b!1073011 (= res!715693 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1073012 () Bool)

(assert (=> b!1073012 (= e!612949 false)))

(declare-datatypes ((tuple2!16562 0))(
  ( (tuple2!16563 (_1!8292 (_ BitVec 64)) (_2!8292 V!39683)) )
))
(declare-datatypes ((List!23098 0))(
  ( (Nil!23095) (Cons!23094 (h!24303 tuple2!16562) (t!32435 List!23098)) )
))
(declare-datatypes ((ListLongMap!14531 0))(
  ( (ListLongMap!14532 (toList!7281 List!23098)) )
))
(declare-fun lt!475923 () ListLongMap!14531)

(declare-fun minValue!907 () V!39683)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39683)

(declare-fun getCurrentListMapNoExtraKeys!3845 (array!68787 array!68785 (_ BitVec 32) (_ BitVec 32) V!39683 V!39683 (_ BitVec 32) Int) ListLongMap!14531)

(assert (=> b!1073012 (= lt!475923 (getCurrentListMapNoExtraKeys!3845 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!475924 () ListLongMap!14531)

(declare-fun zeroValueBefore!47 () V!39683)

(assert (=> b!1073012 (= lt!475924 (getCurrentListMapNoExtraKeys!3845 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (= (and start!94896 res!715696) b!1073007))

(assert (= (and b!1073007 res!715694) b!1073011))

(assert (= (and b!1073011 res!715693) b!1073009))

(assert (= (and b!1073009 res!715695) b!1073012))

(assert (= (and b!1073010 condMapEmpty!40579) mapIsEmpty!40579))

(assert (= (and b!1073010 (not condMapEmpty!40579)) mapNonEmpty!40579))

(get-info :version)

(assert (= (and mapNonEmpty!40579 ((_ is ValueCellFull!12252) mapValue!40579)) b!1073006))

(assert (= (and b!1073010 ((_ is ValueCellFull!12252) mapDefault!40579)) b!1073008))

(assert (= start!94896 b!1073010))

(declare-fun m!992095 () Bool)

(assert (=> b!1073011 m!992095))

(declare-fun m!992097 () Bool)

(assert (=> start!94896 m!992097))

(declare-fun m!992099 () Bool)

(assert (=> start!94896 m!992099))

(declare-fun m!992101 () Bool)

(assert (=> start!94896 m!992101))

(declare-fun m!992103 () Bool)

(assert (=> b!1073012 m!992103))

(declare-fun m!992105 () Bool)

(assert (=> b!1073012 m!992105))

(declare-fun m!992107 () Bool)

(assert (=> b!1073009 m!992107))

(declare-fun m!992109 () Bool)

(assert (=> mapNonEmpty!40579 m!992109))

(check-sat (not b_next!22101) (not b!1073011) b_and!34955 tp_is_empty!25911 (not start!94896) (not b!1073009) (not mapNonEmpty!40579) (not b!1073012))
(check-sat b_and!34955 (not b_next!22101))
