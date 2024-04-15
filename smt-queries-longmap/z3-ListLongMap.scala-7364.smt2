; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93896 () Bool)

(assert start!93896)

(declare-fun b_free!21361 () Bool)

(declare-fun b_next!21361 () Bool)

(assert (=> start!93896 (= b_free!21361 (not b_next!21361))))

(declare-fun tp!75508 () Bool)

(declare-fun b_and!34057 () Bool)

(assert (=> start!93896 (= tp!75508 b_and!34057)))

(declare-fun mapIsEmpty!39430 () Bool)

(declare-fun mapRes!39430 () Bool)

(assert (=> mapIsEmpty!39430 mapRes!39430))

(declare-fun b!1061797 () Bool)

(declare-fun res!709032 () Bool)

(declare-fun e!604714 () Bool)

(assert (=> b!1061797 (=> (not res!709032) (not e!604714))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((V!38697 0))(
  ( (V!38698 (val!12636 Int)) )
))
(declare-datatypes ((ValueCell!11882 0))(
  ( (ValueCellFull!11882 (v!15245 V!38697)) (EmptyCell!11882) )
))
(declare-datatypes ((array!67294 0))(
  ( (array!67295 (arr!32354 (Array (_ BitVec 32) ValueCell!11882)) (size!32892 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67294)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!67296 0))(
  ( (array!67297 (arr!32355 (Array (_ BitVec 32) (_ BitVec 64))) (size!32893 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67296)

(assert (=> b!1061797 (= res!709032 (and (= (size!32892 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!32893 _keys!1163) (size!32892 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun res!709033 () Bool)

(assert (=> start!93896 (=> (not res!709033) (not e!604714))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93896 (= res!709033 (validMask!0 mask!1515))))

(assert (=> start!93896 e!604714))

(assert (=> start!93896 true))

(declare-fun tp_is_empty!25171 () Bool)

(assert (=> start!93896 tp_is_empty!25171))

(declare-fun e!604720 () Bool)

(declare-fun array_inv!25066 (array!67294) Bool)

(assert (=> start!93896 (and (array_inv!25066 _values!955) e!604720)))

(assert (=> start!93896 tp!75508))

(declare-fun array_inv!25067 (array!67296) Bool)

(assert (=> start!93896 (array_inv!25067 _keys!1163)))

(declare-fun b!1061798 () Bool)

(declare-fun e!604715 () Bool)

(declare-fun e!604716 () Bool)

(assert (=> b!1061798 (= e!604715 e!604716)))

(declare-fun res!709034 () Bool)

(assert (=> b!1061798 (=> res!709034 e!604716)))

(declare-datatypes ((tuple2!16046 0))(
  ( (tuple2!16047 (_1!8034 (_ BitVec 64)) (_2!8034 V!38697)) )
))
(declare-datatypes ((List!22600 0))(
  ( (Nil!22597) (Cons!22596 (h!23805 tuple2!16046) (t!31902 List!22600)) )
))
(declare-datatypes ((ListLongMap!14015 0))(
  ( (ListLongMap!14016 (toList!7023 List!22600)) )
))
(declare-fun lt!467629 () ListLongMap!14015)

(declare-fun contains!6193 (ListLongMap!14015 (_ BitVec 64)) Bool)

(assert (=> b!1061798 (= res!709034 (contains!6193 lt!467629 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun zeroValueBefore!47 () V!38697)

(declare-fun defaultEntry!963 () Int)

(declare-fun minValue!907 () V!38697)

(declare-fun getCurrentListMap!3925 (array!67296 array!67294 (_ BitVec 32) (_ BitVec 32) V!38697 V!38697 (_ BitVec 32) Int) ListLongMap!14015)

(assert (=> b!1061798 (= lt!467629 (getCurrentListMap!3925 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1061799 () Bool)

(declare-fun res!709037 () Bool)

(assert (=> b!1061799 (=> (not res!709037) (not e!604714))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67296 (_ BitVec 32)) Bool)

(assert (=> b!1061799 (= res!709037 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1061800 () Bool)

(declare-fun e!604719 () Bool)

(assert (=> b!1061800 (= e!604720 (and e!604719 mapRes!39430))))

(declare-fun condMapEmpty!39430 () Bool)

(declare-fun mapDefault!39430 () ValueCell!11882)

(assert (=> b!1061800 (= condMapEmpty!39430 (= (arr!32354 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11882)) mapDefault!39430)))))

(declare-fun mapNonEmpty!39430 () Bool)

(declare-fun tp!75509 () Bool)

(declare-fun e!604717 () Bool)

(assert (=> mapNonEmpty!39430 (= mapRes!39430 (and tp!75509 e!604717))))

(declare-fun mapRest!39430 () (Array (_ BitVec 32) ValueCell!11882))

(declare-fun mapKey!39430 () (_ BitVec 32))

(declare-fun mapValue!39430 () ValueCell!11882)

(assert (=> mapNonEmpty!39430 (= (arr!32354 _values!955) (store mapRest!39430 mapKey!39430 mapValue!39430))))

(declare-fun b!1061801 () Bool)

(assert (=> b!1061801 (= e!604719 tp_is_empty!25171)))

(declare-fun b!1061802 () Bool)

(assert (=> b!1061802 (= e!604716 true)))

(declare-fun -!549 (ListLongMap!14015 (_ BitVec 64)) ListLongMap!14015)

(assert (=> b!1061802 (= (-!549 lt!467629 #b0000000000000000000000000000000000000000000000000000000000000000) lt!467629)))

(declare-datatypes ((Unit!34643 0))(
  ( (Unit!34644) )
))
(declare-fun lt!467627 () Unit!34643)

(declare-fun removeNotPresentStillSame!1 (ListLongMap!14015 (_ BitVec 64)) Unit!34643)

(assert (=> b!1061802 (= lt!467627 (removeNotPresentStillSame!1 lt!467629 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1061803 () Bool)

(assert (=> b!1061803 (= e!604714 (not e!604715))))

(declare-fun res!709035 () Bool)

(assert (=> b!1061803 (=> res!709035 e!604715)))

(assert (=> b!1061803 (= res!709035 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!467631 () ListLongMap!14015)

(declare-fun lt!467630 () ListLongMap!14015)

(assert (=> b!1061803 (= lt!467631 lt!467630)))

(declare-fun lt!467628 () Unit!34643)

(declare-fun zeroValueAfter!47 () V!38697)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!633 (array!67296 array!67294 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38697 V!38697 V!38697 V!38697 (_ BitVec 32) Int) Unit!34643)

(assert (=> b!1061803 (= lt!467628 (lemmaNoChangeToArrayThenSameMapNoExtras!633 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3639 (array!67296 array!67294 (_ BitVec 32) (_ BitVec 32) V!38697 V!38697 (_ BitVec 32) Int) ListLongMap!14015)

(assert (=> b!1061803 (= lt!467630 (getCurrentListMapNoExtraKeys!3639 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1061803 (= lt!467631 (getCurrentListMapNoExtraKeys!3639 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1061804 () Bool)

(declare-fun res!709036 () Bool)

(assert (=> b!1061804 (=> (not res!709036) (not e!604714))))

(declare-datatypes ((List!22601 0))(
  ( (Nil!22598) (Cons!22597 (h!23806 (_ BitVec 64)) (t!31903 List!22601)) )
))
(declare-fun arrayNoDuplicates!0 (array!67296 (_ BitVec 32) List!22601) Bool)

(assert (=> b!1061804 (= res!709036 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22598))))

(declare-fun b!1061805 () Bool)

(assert (=> b!1061805 (= e!604717 tp_is_empty!25171)))

(assert (= (and start!93896 res!709033) b!1061797))

(assert (= (and b!1061797 res!709032) b!1061799))

(assert (= (and b!1061799 res!709037) b!1061804))

(assert (= (and b!1061804 res!709036) b!1061803))

(assert (= (and b!1061803 (not res!709035)) b!1061798))

(assert (= (and b!1061798 (not res!709034)) b!1061802))

(assert (= (and b!1061800 condMapEmpty!39430) mapIsEmpty!39430))

(assert (= (and b!1061800 (not condMapEmpty!39430)) mapNonEmpty!39430))

(get-info :version)

(assert (= (and mapNonEmpty!39430 ((_ is ValueCellFull!11882) mapValue!39430)) b!1061805))

(assert (= (and b!1061800 ((_ is ValueCellFull!11882) mapDefault!39430)) b!1061801))

(assert (= start!93896 b!1061800))

(declare-fun m!980095 () Bool)

(assert (=> start!93896 m!980095))

(declare-fun m!980097 () Bool)

(assert (=> start!93896 m!980097))

(declare-fun m!980099 () Bool)

(assert (=> start!93896 m!980099))

(declare-fun m!980101 () Bool)

(assert (=> b!1061802 m!980101))

(declare-fun m!980103 () Bool)

(assert (=> b!1061802 m!980103))

(declare-fun m!980105 () Bool)

(assert (=> b!1061803 m!980105))

(declare-fun m!980107 () Bool)

(assert (=> b!1061803 m!980107))

(declare-fun m!980109 () Bool)

(assert (=> b!1061803 m!980109))

(declare-fun m!980111 () Bool)

(assert (=> b!1061799 m!980111))

(declare-fun m!980113 () Bool)

(assert (=> b!1061804 m!980113))

(declare-fun m!980115 () Bool)

(assert (=> mapNonEmpty!39430 m!980115))

(declare-fun m!980117 () Bool)

(assert (=> b!1061798 m!980117))

(declare-fun m!980119 () Bool)

(assert (=> b!1061798 m!980119))

(check-sat (not b!1061803) b_and!34057 (not b!1061804) (not b_next!21361) (not b!1061798) (not start!93896) (not b!1061802) (not mapNonEmpty!39430) tp_is_empty!25171 (not b!1061799))
(check-sat b_and!34057 (not b_next!21361))
