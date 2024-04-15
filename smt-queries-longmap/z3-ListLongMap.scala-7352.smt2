; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93810 () Bool)

(assert start!93810)

(declare-fun b_free!21289 () Bool)

(declare-fun b_next!21289 () Bool)

(assert (=> start!93810 (= b_free!21289 (not b_next!21289))))

(declare-fun tp!75290 () Bool)

(declare-fun b_and!33977 () Bool)

(assert (=> start!93810 (= tp!75290 b_and!33977)))

(declare-fun b!1060943 () Bool)

(declare-fun e!604107 () Bool)

(declare-fun tp_is_empty!25099 () Bool)

(assert (=> b!1060943 (= e!604107 tp_is_empty!25099)))

(declare-fun b!1060944 () Bool)

(declare-fun e!604106 () Bool)

(declare-fun mapRes!39319 () Bool)

(assert (=> b!1060944 (= e!604106 (and e!604107 mapRes!39319))))

(declare-fun condMapEmpty!39319 () Bool)

(declare-datatypes ((V!38601 0))(
  ( (V!38602 (val!12600 Int)) )
))
(declare-datatypes ((ValueCell!11846 0))(
  ( (ValueCellFull!11846 (v!15209 V!38601)) (EmptyCell!11846) )
))
(declare-datatypes ((array!67152 0))(
  ( (array!67153 (arr!32284 (Array (_ BitVec 32) ValueCell!11846)) (size!32822 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67152)

(declare-fun mapDefault!39319 () ValueCell!11846)

(assert (=> b!1060944 (= condMapEmpty!39319 (= (arr!32284 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11846)) mapDefault!39319)))))

(declare-fun b!1060945 () Bool)

(declare-fun res!708556 () Bool)

(declare-fun e!604108 () Bool)

(assert (=> b!1060945 (=> (not res!708556) (not e!604108))))

(declare-datatypes ((array!67154 0))(
  ( (array!67155 (arr!32285 (Array (_ BitVec 32) (_ BitVec 64))) (size!32823 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67154)

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67154 (_ BitVec 32)) Bool)

(assert (=> b!1060945 (= res!708556 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1060946 () Bool)

(declare-fun res!708559 () Bool)

(assert (=> b!1060946 (=> (not res!708559) (not e!604108))))

(declare-datatypes ((List!22550 0))(
  ( (Nil!22547) (Cons!22546 (h!23755 (_ BitVec 64)) (t!31850 List!22550)) )
))
(declare-fun arrayNoDuplicates!0 (array!67154 (_ BitVec 32) List!22550) Bool)

(assert (=> b!1060946 (= res!708559 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22547))))

(declare-fun b!1060947 () Bool)

(declare-fun res!708558 () Bool)

(assert (=> b!1060947 (=> (not res!708558) (not e!604108))))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(assert (=> b!1060947 (= res!708558 (and (= (size!32822 _values!955) (bvadd #b00000000000000000000000000000001 mask!1515)) (= (size!32823 _keys!1163) (size!32822 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!39319 () Bool)

(assert (=> mapIsEmpty!39319 mapRes!39319))

(declare-fun res!708557 () Bool)

(assert (=> start!93810 (=> (not res!708557) (not e!604108))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93810 (= res!708557 (validMask!0 mask!1515))))

(assert (=> start!93810 e!604108))

(assert (=> start!93810 true))

(assert (=> start!93810 tp_is_empty!25099))

(declare-fun array_inv!25026 (array!67152) Bool)

(assert (=> start!93810 (and (array_inv!25026 _values!955) e!604106)))

(assert (=> start!93810 tp!75290))

(declare-fun array_inv!25027 (array!67154) Bool)

(assert (=> start!93810 (array_inv!25027 _keys!1163)))

(declare-fun b!1060948 () Bool)

(assert (=> b!1060948 (= e!604108 false)))

(declare-datatypes ((tuple2!15996 0))(
  ( (tuple2!15997 (_1!8009 (_ BitVec 64)) (_2!8009 V!38601)) )
))
(declare-datatypes ((List!22551 0))(
  ( (Nil!22548) (Cons!22547 (h!23756 tuple2!15996) (t!31851 List!22551)) )
))
(declare-datatypes ((ListLongMap!13965 0))(
  ( (ListLongMap!13966 (toList!6998 List!22551)) )
))
(declare-fun lt!467266 () ListLongMap!13965)

(declare-fun minValue!907 () V!38601)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!38601)

(declare-fun getCurrentListMapNoExtraKeys!3615 (array!67154 array!67152 (_ BitVec 32) (_ BitVec 32) V!38601 V!38601 (_ BitVec 32) Int) ListLongMap!13965)

(assert (=> b!1060948 (= lt!467266 (getCurrentListMapNoExtraKeys!3615 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun zeroValueBefore!47 () V!38601)

(declare-fun lt!467267 () ListLongMap!13965)

(assert (=> b!1060948 (= lt!467267 (getCurrentListMapNoExtraKeys!3615 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapNonEmpty!39319 () Bool)

(declare-fun tp!75289 () Bool)

(declare-fun e!604109 () Bool)

(assert (=> mapNonEmpty!39319 (= mapRes!39319 (and tp!75289 e!604109))))

(declare-fun mapRest!39319 () (Array (_ BitVec 32) ValueCell!11846))

(declare-fun mapValue!39319 () ValueCell!11846)

(declare-fun mapKey!39319 () (_ BitVec 32))

(assert (=> mapNonEmpty!39319 (= (arr!32284 _values!955) (store mapRest!39319 mapKey!39319 mapValue!39319))))

(declare-fun b!1060949 () Bool)

(assert (=> b!1060949 (= e!604109 tp_is_empty!25099)))

(assert (= (and start!93810 res!708557) b!1060947))

(assert (= (and b!1060947 res!708558) b!1060945))

(assert (= (and b!1060945 res!708556) b!1060946))

(assert (= (and b!1060946 res!708559) b!1060948))

(assert (= (and b!1060944 condMapEmpty!39319) mapIsEmpty!39319))

(assert (= (and b!1060944 (not condMapEmpty!39319)) mapNonEmpty!39319))

(get-info :version)

(assert (= (and mapNonEmpty!39319 ((_ is ValueCellFull!11846) mapValue!39319)) b!1060949))

(assert (= (and b!1060944 ((_ is ValueCellFull!11846) mapDefault!39319)) b!1060943))

(assert (= start!93810 b!1060944))

(declare-fun m!979381 () Bool)

(assert (=> b!1060946 m!979381))

(declare-fun m!979383 () Bool)

(assert (=> b!1060948 m!979383))

(declare-fun m!979385 () Bool)

(assert (=> b!1060948 m!979385))

(declare-fun m!979387 () Bool)

(assert (=> start!93810 m!979387))

(declare-fun m!979389 () Bool)

(assert (=> start!93810 m!979389))

(declare-fun m!979391 () Bool)

(assert (=> start!93810 m!979391))

(declare-fun m!979393 () Bool)

(assert (=> mapNonEmpty!39319 m!979393))

(declare-fun m!979395 () Bool)

(assert (=> b!1060945 m!979395))

(check-sat (not start!93810) (not b!1060948) tp_is_empty!25099 (not mapNonEmpty!39319) (not b!1060946) (not b_next!21289) (not b!1060945) b_and!33977)
(check-sat b_and!33977 (not b_next!21289))
