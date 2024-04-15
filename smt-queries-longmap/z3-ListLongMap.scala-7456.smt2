; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94638 () Bool)

(assert start!94638)

(declare-fun b_free!21913 () Bool)

(declare-fun b_next!21913 () Bool)

(assert (=> start!94638 (= b_free!21913 (not b_next!21913))))

(declare-fun tp!77194 () Bool)

(declare-fun b_and!34707 () Bool)

(assert (=> start!94638 (= tp!77194 b_and!34707)))

(declare-fun mapIsEmpty!40288 () Bool)

(declare-fun mapRes!40288 () Bool)

(assert (=> mapIsEmpty!40288 mapRes!40288))

(declare-fun mapNonEmpty!40288 () Bool)

(declare-fun tp!77195 () Bool)

(declare-fun e!610667 () Bool)

(assert (=> mapNonEmpty!40288 (= mapRes!40288 (and tp!77195 e!610667))))

(declare-datatypes ((V!39433 0))(
  ( (V!39434 (val!12912 Int)) )
))
(declare-datatypes ((ValueCell!12158 0))(
  ( (ValueCellFull!12158 (v!15527 V!39433)) (EmptyCell!12158) )
))
(declare-fun mapRest!40288 () (Array (_ BitVec 32) ValueCell!12158))

(declare-fun mapKey!40288 () (_ BitVec 32))

(declare-fun mapValue!40288 () ValueCell!12158)

(declare-datatypes ((array!68362 0))(
  ( (array!68363 (arr!32878 (Array (_ BitVec 32) ValueCell!12158)) (size!33416 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68362)

(assert (=> mapNonEmpty!40288 (= (arr!32878 _values!955) (store mapRest!40288 mapKey!40288 mapValue!40288))))

(declare-fun b!1069908 () Bool)

(declare-fun tp_is_empty!25723 () Bool)

(assert (=> b!1069908 (= e!610667 tp_is_empty!25723)))

(declare-fun b!1069909 () Bool)

(declare-fun res!713821 () Bool)

(declare-fun e!610672 () Bool)

(assert (=> b!1069909 (=> (not res!713821) (not e!610672))))

(declare-datatypes ((array!68364 0))(
  ( (array!68365 (arr!32879 (Array (_ BitVec 32) (_ BitVec 64))) (size!33417 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68364)

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68364 (_ BitVec 32)) Bool)

(assert (=> b!1069909 (= res!713821 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun res!713819 () Bool)

(assert (=> start!94638 (=> (not res!713819) (not e!610672))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94638 (= res!713819 (validMask!0 mask!1515))))

(assert (=> start!94638 e!610672))

(assert (=> start!94638 true))

(assert (=> start!94638 tp_is_empty!25723))

(declare-fun e!610669 () Bool)

(declare-fun array_inv!25440 (array!68362) Bool)

(assert (=> start!94638 (and (array_inv!25440 _values!955) e!610669)))

(assert (=> start!94638 tp!77194))

(declare-fun array_inv!25441 (array!68364) Bool)

(assert (=> start!94638 (array_inv!25441 _keys!1163)))

(declare-fun b!1069910 () Bool)

(declare-fun e!610668 () Bool)

(assert (=> b!1069910 (= e!610669 (and e!610668 mapRes!40288))))

(declare-fun condMapEmpty!40288 () Bool)

(declare-fun mapDefault!40288 () ValueCell!12158)

(assert (=> b!1069910 (= condMapEmpty!40288 (= (arr!32878 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12158)) mapDefault!40288)))))

(declare-fun b!1069911 () Bool)

(declare-fun e!610670 () Bool)

(assert (=> b!1069911 (= e!610670 true)))

(declare-fun defaultEntry!963 () Int)

(declare-fun minValue!907 () V!39433)

(declare-fun zeroValueBefore!47 () V!39433)

(declare-datatypes ((tuple2!16470 0))(
  ( (tuple2!16471 (_1!8246 (_ BitVec 64)) (_2!8246 V!39433)) )
))
(declare-datatypes ((List!22998 0))(
  ( (Nil!22995) (Cons!22994 (h!24203 tuple2!16470) (t!32320 List!22998)) )
))
(declare-datatypes ((ListLongMap!14439 0))(
  ( (ListLongMap!14440 (toList!7235 List!22998)) )
))
(declare-fun lt!472684 () ListLongMap!14439)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-fun getCurrentListMap!4051 (array!68364 array!68362 (_ BitVec 32) (_ BitVec 32) V!39433 V!39433 (_ BitVec 32) Int) ListLongMap!14439)

(assert (=> b!1069911 (= lt!472684 (getCurrentListMap!4051 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1069912 () Bool)

(declare-fun res!713822 () Bool)

(assert (=> b!1069912 (=> (not res!713822) (not e!610672))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(assert (=> b!1069912 (= res!713822 (and (= (size!33416 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33417 _keys!1163) (size!33416 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1069913 () Bool)

(declare-fun res!713820 () Bool)

(assert (=> b!1069913 (=> (not res!713820) (not e!610672))))

(declare-datatypes ((List!22999 0))(
  ( (Nil!22996) (Cons!22995 (h!24204 (_ BitVec 64)) (t!32321 List!22999)) )
))
(declare-fun arrayNoDuplicates!0 (array!68364 (_ BitVec 32) List!22999) Bool)

(assert (=> b!1069913 (= res!713820 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22996))))

(declare-fun b!1069914 () Bool)

(assert (=> b!1069914 (= e!610668 tp_is_empty!25723)))

(declare-fun b!1069915 () Bool)

(assert (=> b!1069915 (= e!610672 (not e!610670))))

(declare-fun res!713823 () Bool)

(assert (=> b!1069915 (=> res!713823 e!610670)))

(assert (=> b!1069915 (= res!713823 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun lt!472685 () ListLongMap!14439)

(declare-fun lt!472683 () ListLongMap!14439)

(assert (=> b!1069915 (= lt!472685 lt!472683)))

(declare-datatypes ((Unit!35058 0))(
  ( (Unit!35059) )
))
(declare-fun lt!472682 () Unit!35058)

(declare-fun zeroValueAfter!47 () V!39433)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!818 (array!68364 array!68362 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39433 V!39433 V!39433 V!39433 (_ BitVec 32) Int) Unit!35058)

(assert (=> b!1069915 (= lt!472682 (lemmaNoChangeToArrayThenSameMapNoExtras!818 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3824 (array!68364 array!68362 (_ BitVec 32) (_ BitVec 32) V!39433 V!39433 (_ BitVec 32) Int) ListLongMap!14439)

(assert (=> b!1069915 (= lt!472683 (getCurrentListMapNoExtraKeys!3824 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1069915 (= lt!472685 (getCurrentListMapNoExtraKeys!3824 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (= (and start!94638 res!713819) b!1069912))

(assert (= (and b!1069912 res!713822) b!1069909))

(assert (= (and b!1069909 res!713821) b!1069913))

(assert (= (and b!1069913 res!713820) b!1069915))

(assert (= (and b!1069915 (not res!713823)) b!1069911))

(assert (= (and b!1069910 condMapEmpty!40288) mapIsEmpty!40288))

(assert (= (and b!1069910 (not condMapEmpty!40288)) mapNonEmpty!40288))

(get-info :version)

(assert (= (and mapNonEmpty!40288 ((_ is ValueCellFull!12158) mapValue!40288)) b!1069908))

(assert (= (and b!1069910 ((_ is ValueCellFull!12158) mapDefault!40288)) b!1069914))

(assert (= start!94638 b!1069910))

(declare-fun m!987847 () Bool)

(assert (=> b!1069915 m!987847))

(declare-fun m!987849 () Bool)

(assert (=> b!1069915 m!987849))

(declare-fun m!987851 () Bool)

(assert (=> b!1069915 m!987851))

(declare-fun m!987853 () Bool)

(assert (=> start!94638 m!987853))

(declare-fun m!987855 () Bool)

(assert (=> start!94638 m!987855))

(declare-fun m!987857 () Bool)

(assert (=> start!94638 m!987857))

(declare-fun m!987859 () Bool)

(assert (=> b!1069909 m!987859))

(declare-fun m!987861 () Bool)

(assert (=> b!1069911 m!987861))

(declare-fun m!987863 () Bool)

(assert (=> b!1069913 m!987863))

(declare-fun m!987865 () Bool)

(assert (=> mapNonEmpty!40288 m!987865))

(check-sat (not b!1069915) (not b!1069911) (not b_next!21913) (not b!1069913) (not b!1069909) b_and!34707 tp_is_empty!25723 (not start!94638) (not mapNonEmpty!40288))
(check-sat b_and!34707 (not b_next!21913))
