; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94138 () Bool)

(assert start!94138)

(declare-fun b_free!21361 () Bool)

(declare-fun b_next!21361 () Bool)

(assert (=> start!94138 (= b_free!21361 (not b_next!21361))))

(declare-fun tp!75509 () Bool)

(declare-fun b_and!34093 () Bool)

(assert (=> start!94138 (= tp!75509 b_and!34093)))

(declare-fun b!1063277 () Bool)

(declare-fun e!605668 () Bool)

(declare-fun tp_is_empty!25171 () Bool)

(assert (=> b!1063277 (= e!605668 tp_is_empty!25171)))

(declare-fun b!1063278 () Bool)

(declare-fun res!709626 () Bool)

(declare-fun e!605665 () Bool)

(assert (=> b!1063278 (=> (not res!709626) (not e!605665))))

(declare-datatypes ((V!38697 0))(
  ( (V!38698 (val!12636 Int)) )
))
(declare-datatypes ((ValueCell!11882 0))(
  ( (ValueCellFull!11882 (v!15242 V!38697)) (EmptyCell!11882) )
))
(declare-datatypes ((array!67391 0))(
  ( (array!67392 (arr!32396 (Array (_ BitVec 32) ValueCell!11882)) (size!32933 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67391)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!67393 0))(
  ( (array!67394 (arr!32397 (Array (_ BitVec 32) (_ BitVec 64))) (size!32934 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67393)

(assert (=> b!1063278 (= res!709626 (and (= (size!32933 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!32934 _keys!1163) (size!32933 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1063279 () Bool)

(declare-fun e!605663 () Bool)

(assert (=> b!1063279 (= e!605663 tp_is_empty!25171)))

(declare-fun mapNonEmpty!39430 () Bool)

(declare-fun mapRes!39430 () Bool)

(declare-fun tp!75508 () Bool)

(assert (=> mapNonEmpty!39430 (= mapRes!39430 (and tp!75508 e!605663))))

(declare-fun mapRest!39430 () (Array (_ BitVec 32) ValueCell!11882))

(declare-fun mapKey!39430 () (_ BitVec 32))

(declare-fun mapValue!39430 () ValueCell!11882)

(assert (=> mapNonEmpty!39430 (= (arr!32396 _values!955) (store mapRest!39430 mapKey!39430 mapValue!39430))))

(declare-fun b!1063280 () Bool)

(declare-fun res!709625 () Bool)

(assert (=> b!1063280 (=> (not res!709625) (not e!605665))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67393 (_ BitVec 32)) Bool)

(assert (=> b!1063280 (= res!709625 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1063281 () Bool)

(declare-fun e!605666 () Bool)

(assert (=> b!1063281 (= e!605666 true)))

(declare-datatypes ((tuple2!15962 0))(
  ( (tuple2!15963 (_1!7992 (_ BitVec 64)) (_2!7992 V!38697)) )
))
(declare-datatypes ((List!22549 0))(
  ( (Nil!22546) (Cons!22545 (h!23763 tuple2!15962) (t!31852 List!22549)) )
))
(declare-datatypes ((ListLongMap!13939 0))(
  ( (ListLongMap!13940 (toList!6985 List!22549)) )
))
(declare-fun lt!468342 () ListLongMap!13939)

(declare-fun -!550 (ListLongMap!13939 (_ BitVec 64)) ListLongMap!13939)

(assert (=> b!1063281 (= (-!550 lt!468342 #b0000000000000000000000000000000000000000000000000000000000000000) lt!468342)))

(declare-datatypes ((Unit!34775 0))(
  ( (Unit!34776) )
))
(declare-fun lt!468344 () Unit!34775)

(declare-fun removeNotPresentStillSame!1 (ListLongMap!13939 (_ BitVec 64)) Unit!34775)

(assert (=> b!1063281 (= lt!468344 (removeNotPresentStillSame!1 lt!468342 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapIsEmpty!39430 () Bool)

(assert (=> mapIsEmpty!39430 mapRes!39430))

(declare-fun b!1063282 () Bool)

(declare-fun e!605662 () Bool)

(assert (=> b!1063282 (= e!605665 (not e!605662))))

(declare-fun res!709624 () Bool)

(assert (=> b!1063282 (=> res!709624 e!605662)))

(assert (=> b!1063282 (= res!709624 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!468345 () ListLongMap!13939)

(declare-fun lt!468343 () ListLongMap!13939)

(assert (=> b!1063282 (= lt!468345 lt!468343)))

(declare-fun zeroValueBefore!47 () V!38697)

(declare-fun lt!468346 () Unit!34775)

(declare-fun minValue!907 () V!38697)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!38697)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!636 (array!67393 array!67391 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38697 V!38697 V!38697 V!38697 (_ BitVec 32) Int) Unit!34775)

(assert (=> b!1063282 (= lt!468346 (lemmaNoChangeToArrayThenSameMapNoExtras!636 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3633 (array!67393 array!67391 (_ BitVec 32) (_ BitVec 32) V!38697 V!38697 (_ BitVec 32) Int) ListLongMap!13939)

(assert (=> b!1063282 (= lt!468343 (getCurrentListMapNoExtraKeys!3633 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1063282 (= lt!468345 (getCurrentListMapNoExtraKeys!3633 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1063283 () Bool)

(declare-fun res!709627 () Bool)

(assert (=> b!1063283 (=> (not res!709627) (not e!605665))))

(declare-datatypes ((List!22550 0))(
  ( (Nil!22547) (Cons!22546 (h!23764 (_ BitVec 64)) (t!31853 List!22550)) )
))
(declare-fun arrayNoDuplicates!0 (array!67393 (_ BitVec 32) List!22550) Bool)

(assert (=> b!1063283 (= res!709627 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22547))))

(declare-fun res!709628 () Bool)

(assert (=> start!94138 (=> (not res!709628) (not e!605665))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94138 (= res!709628 (validMask!0 mask!1515))))

(assert (=> start!94138 e!605665))

(assert (=> start!94138 true))

(assert (=> start!94138 tp_is_empty!25171))

(declare-fun e!605664 () Bool)

(declare-fun array_inv!25116 (array!67391) Bool)

(assert (=> start!94138 (and (array_inv!25116 _values!955) e!605664)))

(assert (=> start!94138 tp!75509))

(declare-fun array_inv!25117 (array!67393) Bool)

(assert (=> start!94138 (array_inv!25117 _keys!1163)))

(declare-fun b!1063284 () Bool)

(assert (=> b!1063284 (= e!605662 e!605666)))

(declare-fun res!709623 () Bool)

(assert (=> b!1063284 (=> res!709623 e!605666)))

(declare-fun contains!6246 (ListLongMap!13939 (_ BitVec 64)) Bool)

(assert (=> b!1063284 (= res!709623 (contains!6246 lt!468342 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun getCurrentListMap!3972 (array!67393 array!67391 (_ BitVec 32) (_ BitVec 32) V!38697 V!38697 (_ BitVec 32) Int) ListLongMap!13939)

(assert (=> b!1063284 (= lt!468342 (getCurrentListMap!3972 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1063285 () Bool)

(assert (=> b!1063285 (= e!605664 (and e!605668 mapRes!39430))))

(declare-fun condMapEmpty!39430 () Bool)

(declare-fun mapDefault!39430 () ValueCell!11882)

(assert (=> b!1063285 (= condMapEmpty!39430 (= (arr!32396 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11882)) mapDefault!39430)))))

(assert (= (and start!94138 res!709628) b!1063278))

(assert (= (and b!1063278 res!709626) b!1063280))

(assert (= (and b!1063280 res!709625) b!1063283))

(assert (= (and b!1063283 res!709627) b!1063282))

(assert (= (and b!1063282 (not res!709624)) b!1063284))

(assert (= (and b!1063284 (not res!709623)) b!1063281))

(assert (= (and b!1063285 condMapEmpty!39430) mapIsEmpty!39430))

(assert (= (and b!1063285 (not condMapEmpty!39430)) mapNonEmpty!39430))

(get-info :version)

(assert (= (and mapNonEmpty!39430 ((_ is ValueCellFull!11882) mapValue!39430)) b!1063279))

(assert (= (and b!1063285 ((_ is ValueCellFull!11882) mapDefault!39430)) b!1063277))

(assert (= start!94138 b!1063285))

(declare-fun m!982393 () Bool)

(assert (=> b!1063281 m!982393))

(declare-fun m!982395 () Bool)

(assert (=> b!1063281 m!982395))

(declare-fun m!982397 () Bool)

(assert (=> mapNonEmpty!39430 m!982397))

(declare-fun m!982399 () Bool)

(assert (=> b!1063282 m!982399))

(declare-fun m!982401 () Bool)

(assert (=> b!1063282 m!982401))

(declare-fun m!982403 () Bool)

(assert (=> b!1063282 m!982403))

(declare-fun m!982405 () Bool)

(assert (=> b!1063284 m!982405))

(declare-fun m!982407 () Bool)

(assert (=> b!1063284 m!982407))

(declare-fun m!982409 () Bool)

(assert (=> b!1063280 m!982409))

(declare-fun m!982411 () Bool)

(assert (=> b!1063283 m!982411))

(declare-fun m!982413 () Bool)

(assert (=> start!94138 m!982413))

(declare-fun m!982415 () Bool)

(assert (=> start!94138 m!982415))

(declare-fun m!982417 () Bool)

(assert (=> start!94138 m!982417))

(check-sat (not b!1063283) (not start!94138) (not b!1063280) (not b!1063282) (not b!1063284) (not b!1063281) (not mapNonEmpty!39430) tp_is_empty!25171 b_and!34093 (not b_next!21361))
(check-sat b_and!34093 (not b_next!21361))
