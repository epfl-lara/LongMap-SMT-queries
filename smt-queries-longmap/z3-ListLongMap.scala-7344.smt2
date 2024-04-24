; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94004 () Bool)

(assert start!94004)

(declare-fun b_free!21241 () Bool)

(declare-fun b_next!21241 () Bool)

(assert (=> start!94004 (= b_free!21241 (not b_next!21241))))

(declare-fun tp!75145 () Bool)

(declare-fun b_and!33965 () Bool)

(assert (=> start!94004 (= tp!75145 b_and!33965)))

(declare-fun b!1061919 () Bool)

(declare-fun e!604698 () Bool)

(assert (=> b!1061919 (= e!604698 false)))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((V!38537 0))(
  ( (V!38538 (val!12576 Int)) )
))
(declare-datatypes ((tuple2!15886 0))(
  ( (tuple2!15887 (_1!7954 (_ BitVec 64)) (_2!7954 V!38537)) )
))
(declare-datatypes ((List!22470 0))(
  ( (Nil!22467) (Cons!22466 (h!23684 tuple2!15886) (t!31771 List!22470)) )
))
(declare-datatypes ((ListLongMap!13863 0))(
  ( (ListLongMap!13864 (toList!6947 List!22470)) )
))
(declare-fun lt!467838 () ListLongMap!13863)

(declare-datatypes ((ValueCell!11822 0))(
  ( (ValueCellFull!11822 (v!15182 V!38537)) (EmptyCell!11822) )
))
(declare-datatypes ((array!67167 0))(
  ( (array!67168 (arr!32285 (Array (_ BitVec 32) ValueCell!11822)) (size!32822 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67167)

(declare-fun minValue!907 () V!38537)

(declare-datatypes ((array!67169 0))(
  ( (array!67170 (arr!32286 (Array (_ BitVec 32) (_ BitVec 64))) (size!32823 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67169)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!38537)

(declare-fun getCurrentListMapNoExtraKeys!3595 (array!67169 array!67167 (_ BitVec 32) (_ BitVec 32) V!38537 V!38537 (_ BitVec 32) Int) ListLongMap!13863)

(assert (=> b!1061919 (= lt!467838 (getCurrentListMapNoExtraKeys!3595 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun zeroValueBefore!47 () V!38537)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-fun lt!467837 () ListLongMap!13863)

(assert (=> b!1061919 (= lt!467837 (getCurrentListMapNoExtraKeys!3595 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun res!708861 () Bool)

(assert (=> start!94004 (=> (not res!708861) (not e!604698))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94004 (= res!708861 (validMask!0 mask!1515))))

(assert (=> start!94004 e!604698))

(assert (=> start!94004 true))

(declare-fun tp_is_empty!25051 () Bool)

(assert (=> start!94004 tp_is_empty!25051))

(declare-fun e!604696 () Bool)

(declare-fun array_inv!25032 (array!67167) Bool)

(assert (=> start!94004 (and (array_inv!25032 _values!955) e!604696)))

(assert (=> start!94004 tp!75145))

(declare-fun array_inv!25033 (array!67169) Bool)

(assert (=> start!94004 (array_inv!25033 _keys!1163)))

(declare-fun b!1061920 () Bool)

(declare-fun res!708862 () Bool)

(assert (=> b!1061920 (=> (not res!708862) (not e!604698))))

(assert (=> b!1061920 (= res!708862 (and (= (size!32822 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!32823 _keys!1163) (size!32822 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!39247 () Bool)

(declare-fun mapRes!39247 () Bool)

(assert (=> mapIsEmpty!39247 mapRes!39247))

(declare-fun mapNonEmpty!39247 () Bool)

(declare-fun tp!75146 () Bool)

(declare-fun e!604694 () Bool)

(assert (=> mapNonEmpty!39247 (= mapRes!39247 (and tp!75146 e!604694))))

(declare-fun mapRest!39247 () (Array (_ BitVec 32) ValueCell!11822))

(declare-fun mapValue!39247 () ValueCell!11822)

(declare-fun mapKey!39247 () (_ BitVec 32))

(assert (=> mapNonEmpty!39247 (= (arr!32285 _values!955) (store mapRest!39247 mapKey!39247 mapValue!39247))))

(declare-fun b!1061921 () Bool)

(declare-fun res!708860 () Bool)

(assert (=> b!1061921 (=> (not res!708860) (not e!604698))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67169 (_ BitVec 32)) Bool)

(assert (=> b!1061921 (= res!708860 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1061922 () Bool)

(declare-fun res!708859 () Bool)

(assert (=> b!1061922 (=> (not res!708859) (not e!604698))))

(declare-datatypes ((List!22471 0))(
  ( (Nil!22468) (Cons!22467 (h!23685 (_ BitVec 64)) (t!31772 List!22471)) )
))
(declare-fun arrayNoDuplicates!0 (array!67169 (_ BitVec 32) List!22471) Bool)

(assert (=> b!1061922 (= res!708859 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22468))))

(declare-fun b!1061923 () Bool)

(assert (=> b!1061923 (= e!604694 tp_is_empty!25051)))

(declare-fun b!1061924 () Bool)

(declare-fun e!604695 () Bool)

(assert (=> b!1061924 (= e!604695 tp_is_empty!25051)))

(declare-fun b!1061925 () Bool)

(assert (=> b!1061925 (= e!604696 (and e!604695 mapRes!39247))))

(declare-fun condMapEmpty!39247 () Bool)

(declare-fun mapDefault!39247 () ValueCell!11822)

(assert (=> b!1061925 (= condMapEmpty!39247 (= (arr!32285 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11822)) mapDefault!39247)))))

(assert (= (and start!94004 res!708861) b!1061920))

(assert (= (and b!1061920 res!708862) b!1061921))

(assert (= (and b!1061921 res!708860) b!1061922))

(assert (= (and b!1061922 res!708859) b!1061919))

(assert (= (and b!1061925 condMapEmpty!39247) mapIsEmpty!39247))

(assert (= (and b!1061925 (not condMapEmpty!39247)) mapNonEmpty!39247))

(get-info :version)

(assert (= (and mapNonEmpty!39247 ((_ is ValueCellFull!11822) mapValue!39247)) b!1061923))

(assert (= (and b!1061925 ((_ is ValueCellFull!11822) mapDefault!39247)) b!1061924))

(assert (= start!94004 b!1061925))

(declare-fun m!981295 () Bool)

(assert (=> b!1061919 m!981295))

(declare-fun m!981297 () Bool)

(assert (=> b!1061919 m!981297))

(declare-fun m!981299 () Bool)

(assert (=> b!1061922 m!981299))

(declare-fun m!981301 () Bool)

(assert (=> start!94004 m!981301))

(declare-fun m!981303 () Bool)

(assert (=> start!94004 m!981303))

(declare-fun m!981305 () Bool)

(assert (=> start!94004 m!981305))

(declare-fun m!981307 () Bool)

(assert (=> mapNonEmpty!39247 m!981307))

(declare-fun m!981309 () Bool)

(assert (=> b!1061921 m!981309))

(check-sat b_and!33965 tp_is_empty!25051 (not b_next!21241) (not b!1061922) (not start!94004) (not mapNonEmpty!39247) (not b!1061919) (not b!1061921))
(check-sat b_and!33965 (not b_next!21241))
