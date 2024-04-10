; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71156 () Bool)

(assert start!71156)

(declare-fun b_free!13323 () Bool)

(declare-fun b_next!13323 () Bool)

(assert (=> start!71156 (= b_free!13323 (not b_next!13323))))

(declare-fun tp!46728 () Bool)

(declare-fun b_and!22249 () Bool)

(assert (=> start!71156 (= tp!46728 b_and!22249)))

(declare-fun b!826514 () Bool)

(declare-fun res!563415 () Bool)

(declare-fun e!460260 () Bool)

(assert (=> b!826514 (=> (not res!563415) (not e!460260))))

(declare-datatypes ((array!46246 0))(
  ( (array!46247 (arr!22168 (Array (_ BitVec 32) (_ BitVec 64))) (size!22589 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46246)

(declare-datatypes ((List!15819 0))(
  ( (Nil!15816) (Cons!15815 (h!16944 (_ BitVec 64)) (t!22166 List!15819)) )
))
(declare-fun arrayNoDuplicates!0 (array!46246 (_ BitVec 32) List!15819) Bool)

(assert (=> b!826514 (= res!563415 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15816))))

(declare-fun b!826515 () Bool)

(declare-fun e!460265 () Bool)

(assert (=> b!826515 (= e!460265 true)))

(declare-datatypes ((V!25045 0))(
  ( (V!25046 (val!7564 Int)) )
))
(declare-datatypes ((tuple2!10020 0))(
  ( (tuple2!10021 (_1!5021 (_ BitVec 64)) (_2!5021 V!25045)) )
))
(declare-datatypes ((List!15820 0))(
  ( (Nil!15817) (Cons!15816 (h!16945 tuple2!10020) (t!22167 List!15820)) )
))
(declare-datatypes ((ListLongMap!8843 0))(
  ( (ListLongMap!8844 (toList!4437 List!15820)) )
))
(declare-fun lt!374073 () ListLongMap!8843)

(declare-fun lt!374080 () tuple2!10020)

(declare-fun lt!374069 () ListLongMap!8843)

(declare-fun lt!374068 () tuple2!10020)

(declare-fun +!1944 (ListLongMap!8843 tuple2!10020) ListLongMap!8843)

(assert (=> b!826515 (= lt!374069 (+!1944 (+!1944 lt!374073 lt!374068) lt!374080))))

(declare-fun lt!374078 () ListLongMap!8843)

(declare-fun lt!374079 () ListLongMap!8843)

(declare-fun lt!374072 () ListLongMap!8843)

(assert (=> b!826515 (and (= lt!374078 lt!374079) (= lt!374072 lt!374079) (= lt!374072 lt!374078))))

(declare-fun lt!374071 () ListLongMap!8843)

(assert (=> b!826515 (= lt!374079 (+!1944 lt!374071 lt!374068))))

(declare-fun lt!374076 () ListLongMap!8843)

(assert (=> b!826515 (= lt!374078 (+!1944 lt!374076 lt!374068))))

(declare-fun zeroValueBefore!34 () V!25045)

(declare-datatypes ((Unit!28337 0))(
  ( (Unit!28338) )
))
(declare-fun lt!374074 () Unit!28337)

(declare-fun zeroValueAfter!34 () V!25045)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!227 (ListLongMap!8843 (_ BitVec 64) V!25045 V!25045) Unit!28337)

(assert (=> b!826515 (= lt!374074 (addSameAsAddTwiceSameKeyDiffValues!227 lt!374076 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34 zeroValueAfter!34))))

(declare-fun e!460266 () Bool)

(assert (=> b!826515 e!460266))

(declare-fun res!563414 () Bool)

(assert (=> b!826515 (=> (not res!563414) (not e!460266))))

(declare-fun lt!374077 () ListLongMap!8843)

(assert (=> b!826515 (= res!563414 (= lt!374077 lt!374071))))

(declare-fun lt!374075 () tuple2!10020)

(assert (=> b!826515 (= lt!374071 (+!1944 lt!374076 lt!374075))))

(assert (=> b!826515 (= lt!374076 (+!1944 lt!374073 lt!374080))))

(assert (=> b!826515 (= lt!374068 (tuple2!10021 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(declare-fun e!460267 () Bool)

(assert (=> b!826515 e!460267))

(declare-fun res!563411 () Bool)

(assert (=> b!826515 (=> (not res!563411) (not e!460267))))

(assert (=> b!826515 (= res!563411 (= lt!374077 (+!1944 (+!1944 lt!374073 lt!374075) lt!374080)))))

(declare-fun minValue!754 () V!25045)

(assert (=> b!826515 (= lt!374080 (tuple2!10021 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(assert (=> b!826515 (= lt!374075 (tuple2!10021 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))

(declare-datatypes ((ValueCell!7101 0))(
  ( (ValueCellFull!7101 (v!9998 V!25045)) (EmptyCell!7101) )
))
(declare-datatypes ((array!46248 0))(
  ( (array!46249 (arr!22169 (Array (_ BitVec 32) ValueCell!7101)) (size!22590 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46248)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMap!2567 (array!46246 array!46248 (_ BitVec 32) (_ BitVec 32) V!25045 V!25045 (_ BitVec 32) Int) ListLongMap!8843)

(assert (=> b!826515 (= lt!374072 (getCurrentListMap!2567 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!826515 (= lt!374077 (getCurrentListMap!2567 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapIsEmpty!24175 () Bool)

(declare-fun mapRes!24175 () Bool)

(assert (=> mapIsEmpty!24175 mapRes!24175))

(declare-fun b!826516 () Bool)

(declare-fun e!460263 () Bool)

(declare-fun tp_is_empty!15033 () Bool)

(assert (=> b!826516 (= e!460263 tp_is_empty!15033)))

(declare-fun res!563413 () Bool)

(assert (=> start!71156 (=> (not res!563413) (not e!460260))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71156 (= res!563413 (validMask!0 mask!1312))))

(assert (=> start!71156 e!460260))

(assert (=> start!71156 tp_is_empty!15033))

(declare-fun array_inv!17671 (array!46246) Bool)

(assert (=> start!71156 (array_inv!17671 _keys!976)))

(assert (=> start!71156 true))

(declare-fun e!460264 () Bool)

(declare-fun array_inv!17672 (array!46248) Bool)

(assert (=> start!71156 (and (array_inv!17672 _values!788) e!460264)))

(assert (=> start!71156 tp!46728))

(declare-fun mapNonEmpty!24175 () Bool)

(declare-fun tp!46729 () Bool)

(assert (=> mapNonEmpty!24175 (= mapRes!24175 (and tp!46729 e!460263))))

(declare-fun mapKey!24175 () (_ BitVec 32))

(declare-fun mapValue!24175 () ValueCell!7101)

(declare-fun mapRest!24175 () (Array (_ BitVec 32) ValueCell!7101))

(assert (=> mapNonEmpty!24175 (= (arr!22169 _values!788) (store mapRest!24175 mapKey!24175 mapValue!24175))))

(declare-fun b!826517 () Bool)

(declare-fun e!460262 () Bool)

(assert (=> b!826517 (= e!460264 (and e!460262 mapRes!24175))))

(declare-fun condMapEmpty!24175 () Bool)

(declare-fun mapDefault!24175 () ValueCell!7101)

(assert (=> b!826517 (= condMapEmpty!24175 (= (arr!22169 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7101)) mapDefault!24175)))))

(declare-fun b!826518 () Bool)

(assert (=> b!826518 (= e!460262 tp_is_empty!15033)))

(declare-fun b!826519 () Bool)

(assert (=> b!826519 (= e!460260 (not e!460265))))

(declare-fun res!563410 () Bool)

(assert (=> b!826519 (=> res!563410 e!460265)))

(assert (=> b!826519 (= res!563410 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun lt!374067 () ListLongMap!8843)

(assert (=> b!826519 (= lt!374073 lt!374067)))

(declare-fun lt!374070 () Unit!28337)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!554 (array!46246 array!46248 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!25045 V!25045 V!25045 V!25045 (_ BitVec 32) Int) Unit!28337)

(assert (=> b!826519 (= lt!374070 (lemmaNoChangeToArrayThenSameMapNoExtras!554 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2444 (array!46246 array!46248 (_ BitVec 32) (_ BitVec 32) V!25045 V!25045 (_ BitVec 32) Int) ListLongMap!8843)

(assert (=> b!826519 (= lt!374067 (getCurrentListMapNoExtraKeys!2444 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!826519 (= lt!374073 (getCurrentListMapNoExtraKeys!2444 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!826520 () Bool)

(assert (=> b!826520 (= e!460267 (= lt!374072 (+!1944 (+!1944 lt!374067 (tuple2!10021 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) lt!374080)))))

(declare-fun b!826521 () Bool)

(declare-fun res!563409 () Bool)

(assert (=> b!826521 (=> (not res!563409) (not e!460260))))

(assert (=> b!826521 (= res!563409 (and (= (size!22590 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22589 _keys!976) (size!22590 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!826522 () Bool)

(assert (=> b!826522 (= e!460266 (= lt!374072 (+!1944 (+!1944 lt!374067 lt!374080) lt!374068)))))

(declare-fun b!826523 () Bool)

(declare-fun res!563412 () Bool)

(assert (=> b!826523 (=> (not res!563412) (not e!460260))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46246 (_ BitVec 32)) Bool)

(assert (=> b!826523 (= res!563412 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(assert (= (and start!71156 res!563413) b!826521))

(assert (= (and b!826521 res!563409) b!826523))

(assert (= (and b!826523 res!563412) b!826514))

(assert (= (and b!826514 res!563415) b!826519))

(assert (= (and b!826519 (not res!563410)) b!826515))

(assert (= (and b!826515 res!563411) b!826520))

(assert (= (and b!826515 res!563414) b!826522))

(assert (= (and b!826517 condMapEmpty!24175) mapIsEmpty!24175))

(assert (= (and b!826517 (not condMapEmpty!24175)) mapNonEmpty!24175))

(get-info :version)

(assert (= (and mapNonEmpty!24175 ((_ is ValueCellFull!7101) mapValue!24175)) b!826516))

(assert (= (and b!826517 ((_ is ValueCellFull!7101) mapDefault!24175)) b!826518))

(assert (= start!71156 b!826517))

(declare-fun m!769299 () Bool)

(assert (=> b!826519 m!769299))

(declare-fun m!769301 () Bool)

(assert (=> b!826519 m!769301))

(declare-fun m!769303 () Bool)

(assert (=> b!826519 m!769303))

(declare-fun m!769305 () Bool)

(assert (=> start!71156 m!769305))

(declare-fun m!769307 () Bool)

(assert (=> start!71156 m!769307))

(declare-fun m!769309 () Bool)

(assert (=> start!71156 m!769309))

(declare-fun m!769311 () Bool)

(assert (=> b!826514 m!769311))

(declare-fun m!769313 () Bool)

(assert (=> mapNonEmpty!24175 m!769313))

(declare-fun m!769315 () Bool)

(assert (=> b!826522 m!769315))

(assert (=> b!826522 m!769315))

(declare-fun m!769317 () Bool)

(assert (=> b!826522 m!769317))

(declare-fun m!769319 () Bool)

(assert (=> b!826520 m!769319))

(assert (=> b!826520 m!769319))

(declare-fun m!769321 () Bool)

(assert (=> b!826520 m!769321))

(declare-fun m!769323 () Bool)

(assert (=> b!826523 m!769323))

(declare-fun m!769325 () Bool)

(assert (=> b!826515 m!769325))

(declare-fun m!769327 () Bool)

(assert (=> b!826515 m!769327))

(declare-fun m!769329 () Bool)

(assert (=> b!826515 m!769329))

(declare-fun m!769331 () Bool)

(assert (=> b!826515 m!769331))

(declare-fun m!769333 () Bool)

(assert (=> b!826515 m!769333))

(declare-fun m!769335 () Bool)

(assert (=> b!826515 m!769335))

(assert (=> b!826515 m!769325))

(declare-fun m!769337 () Bool)

(assert (=> b!826515 m!769337))

(declare-fun m!769339 () Bool)

(assert (=> b!826515 m!769339))

(declare-fun m!769341 () Bool)

(assert (=> b!826515 m!769341))

(declare-fun m!769343 () Bool)

(assert (=> b!826515 m!769343))

(assert (=> b!826515 m!769331))

(declare-fun m!769345 () Bool)

(assert (=> b!826515 m!769345))

(check-sat (not b!826519) b_and!22249 tp_is_empty!15033 (not start!71156) (not b_next!13323) (not b!826515) (not b!826520) (not b!826522) (not b!826514) (not mapNonEmpty!24175) (not b!826523))
(check-sat b_and!22249 (not b_next!13323))
