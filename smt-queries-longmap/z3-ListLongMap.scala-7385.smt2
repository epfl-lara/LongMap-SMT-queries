; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94308 () Bool)

(assert start!94308)

(declare-fun b_free!21487 () Bool)

(declare-fun b_next!21487 () Bool)

(assert (=> start!94308 (= b_free!21487 (not b_next!21487))))

(declare-fun tp!75893 () Bool)

(declare-fun b_and!34239 () Bool)

(assert (=> start!94308 (= tp!75893 b_and!34239)))

(declare-fun b!1065234 () Bool)

(declare-fun res!710822 () Bool)

(declare-fun e!607131 () Bool)

(assert (=> b!1065234 (=> (not res!710822) (not e!607131))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((V!38865 0))(
  ( (V!38866 (val!12699 Int)) )
))
(declare-datatypes ((ValueCell!11945 0))(
  ( (ValueCellFull!11945 (v!15307 V!38865)) (EmptyCell!11945) )
))
(declare-datatypes ((array!67639 0))(
  ( (array!67640 (arr!32518 (Array (_ BitVec 32) ValueCell!11945)) (size!33055 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67639)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!67641 0))(
  ( (array!67642 (arr!32519 (Array (_ BitVec 32) (_ BitVec 64))) (size!33056 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67641)

(assert (=> b!1065234 (= res!710822 (and (= (size!33055 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33056 _keys!1163) (size!33055 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1065235 () Bool)

(declare-fun e!607128 () Bool)

(declare-fun tp_is_empty!25297 () Bool)

(assert (=> b!1065235 (= e!607128 tp_is_empty!25297)))

(declare-fun b!1065236 () Bool)

(declare-fun e!607130 () Bool)

(assert (=> b!1065236 (= e!607130 tp_is_empty!25297)))

(declare-fun mapNonEmpty!39625 () Bool)

(declare-fun mapRes!39625 () Bool)

(declare-fun tp!75892 () Bool)

(assert (=> mapNonEmpty!39625 (= mapRes!39625 (and tp!75892 e!607128))))

(declare-fun mapRest!39625 () (Array (_ BitVec 32) ValueCell!11945))

(declare-fun mapKey!39625 () (_ BitVec 32))

(declare-fun mapValue!39625 () ValueCell!11945)

(assert (=> mapNonEmpty!39625 (= (arr!32518 _values!955) (store mapRest!39625 mapKey!39625 mapValue!39625))))

(declare-fun b!1065237 () Bool)

(declare-fun res!710821 () Bool)

(assert (=> b!1065237 (=> (not res!710821) (not e!607131))))

(declare-datatypes ((List!22643 0))(
  ( (Nil!22640) (Cons!22639 (h!23857 (_ BitVec 64)) (t!31950 List!22643)) )
))
(declare-fun arrayNoDuplicates!0 (array!67641 (_ BitVec 32) List!22643) Bool)

(assert (=> b!1065237 (= res!710821 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22640))))

(declare-fun b!1065238 () Bool)

(assert (=> b!1065238 (= e!607131 (not true))))

(declare-datatypes ((tuple2!16070 0))(
  ( (tuple2!16071 (_1!8046 (_ BitVec 64)) (_2!8046 V!38865)) )
))
(declare-datatypes ((List!22644 0))(
  ( (Nil!22641) (Cons!22640 (h!23858 tuple2!16070) (t!31951 List!22644)) )
))
(declare-datatypes ((ListLongMap!14047 0))(
  ( (ListLongMap!14048 (toList!7039 List!22644)) )
))
(declare-fun lt!469479 () ListLongMap!14047)

(declare-fun lt!469477 () ListLongMap!14047)

(assert (=> b!1065238 (= lt!469479 lt!469477)))

(declare-fun zeroValueBefore!47 () V!38865)

(declare-datatypes ((Unit!34881 0))(
  ( (Unit!34882) )
))
(declare-fun lt!469478 () Unit!34881)

(declare-fun minValue!907 () V!38865)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!38865)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!676 (array!67641 array!67639 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38865 V!38865 V!38865 V!38865 (_ BitVec 32) Int) Unit!34881)

(assert (=> b!1065238 (= lt!469478 (lemmaNoChangeToArrayThenSameMapNoExtras!676 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3673 (array!67641 array!67639 (_ BitVec 32) (_ BitVec 32) V!38865 V!38865 (_ BitVec 32) Int) ListLongMap!14047)

(assert (=> b!1065238 (= lt!469477 (getCurrentListMapNoExtraKeys!3673 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1065238 (= lt!469479 (getCurrentListMapNoExtraKeys!3673 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1065239 () Bool)

(declare-fun e!607127 () Bool)

(assert (=> b!1065239 (= e!607127 (and e!607130 mapRes!39625))))

(declare-fun condMapEmpty!39625 () Bool)

(declare-fun mapDefault!39625 () ValueCell!11945)

(assert (=> b!1065239 (= condMapEmpty!39625 (= (arr!32518 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11945)) mapDefault!39625)))))

(declare-fun b!1065240 () Bool)

(declare-fun res!710824 () Bool)

(assert (=> b!1065240 (=> (not res!710824) (not e!607131))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67641 (_ BitVec 32)) Bool)

(assert (=> b!1065240 (= res!710824 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun mapIsEmpty!39625 () Bool)

(assert (=> mapIsEmpty!39625 mapRes!39625))

(declare-fun res!710823 () Bool)

(assert (=> start!94308 (=> (not res!710823) (not e!607131))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94308 (= res!710823 (validMask!0 mask!1515))))

(assert (=> start!94308 e!607131))

(assert (=> start!94308 true))

(assert (=> start!94308 tp_is_empty!25297))

(declare-fun array_inv!25202 (array!67639) Bool)

(assert (=> start!94308 (and (array_inv!25202 _values!955) e!607127)))

(assert (=> start!94308 tp!75893))

(declare-fun array_inv!25203 (array!67641) Bool)

(assert (=> start!94308 (array_inv!25203 _keys!1163)))

(assert (= (and start!94308 res!710823) b!1065234))

(assert (= (and b!1065234 res!710822) b!1065240))

(assert (= (and b!1065240 res!710824) b!1065237))

(assert (= (and b!1065237 res!710821) b!1065238))

(assert (= (and b!1065239 condMapEmpty!39625) mapIsEmpty!39625))

(assert (= (and b!1065239 (not condMapEmpty!39625)) mapNonEmpty!39625))

(get-info :version)

(assert (= (and mapNonEmpty!39625 ((_ is ValueCellFull!11945) mapValue!39625)) b!1065235))

(assert (= (and b!1065239 ((_ is ValueCellFull!11945) mapDefault!39625)) b!1065236))

(assert (= start!94308 b!1065239))

(declare-fun m!984211 () Bool)

(assert (=> b!1065237 m!984211))

(declare-fun m!984213 () Bool)

(assert (=> b!1065238 m!984213))

(declare-fun m!984215 () Bool)

(assert (=> b!1065238 m!984215))

(declare-fun m!984217 () Bool)

(assert (=> b!1065238 m!984217))

(declare-fun m!984219 () Bool)

(assert (=> b!1065240 m!984219))

(declare-fun m!984221 () Bool)

(assert (=> start!94308 m!984221))

(declare-fun m!984223 () Bool)

(assert (=> start!94308 m!984223))

(declare-fun m!984225 () Bool)

(assert (=> start!94308 m!984225))

(declare-fun m!984227 () Bool)

(assert (=> mapNonEmpty!39625 m!984227))

(check-sat (not b_next!21487) tp_is_empty!25297 b_and!34239 (not b!1065238) (not mapNonEmpty!39625) (not b!1065240) (not b!1065237) (not start!94308))
(check-sat b_and!34239 (not b_next!21487))
