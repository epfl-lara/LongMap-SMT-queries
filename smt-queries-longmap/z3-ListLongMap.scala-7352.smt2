; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93818 () Bool)

(assert start!93818)

(declare-fun b_free!21291 () Bool)

(declare-fun b_next!21291 () Bool)

(assert (=> start!93818 (= b_free!21291 (not b_next!21291))))

(declare-fun tp!75295 () Bool)

(declare-fun b_and!34005 () Bool)

(assert (=> start!93818 (= tp!75295 b_and!34005)))

(declare-fun b!1061117 () Bool)

(declare-fun res!708638 () Bool)

(declare-fun e!604217 () Bool)

(assert (=> b!1061117 (=> (not res!708638) (not e!604217))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((V!38603 0))(
  ( (V!38604 (val!12601 Int)) )
))
(declare-datatypes ((ValueCell!11847 0))(
  ( (ValueCellFull!11847 (v!15211 V!38603)) (EmptyCell!11847) )
))
(declare-datatypes ((array!67207 0))(
  ( (array!67208 (arr!32311 (Array (_ BitVec 32) ValueCell!11847)) (size!32847 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67207)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!67209 0))(
  ( (array!67210 (arr!32312 (Array (_ BitVec 32) (_ BitVec 64))) (size!32848 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67209)

(assert (=> b!1061117 (= res!708638 (and (= (size!32847 _values!955) (bvadd #b00000000000000000000000000000001 mask!1515)) (= (size!32848 _keys!1163) (size!32847 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1061118 () Bool)

(declare-fun e!604214 () Bool)

(declare-fun e!604216 () Bool)

(declare-fun mapRes!39322 () Bool)

(assert (=> b!1061118 (= e!604214 (and e!604216 mapRes!39322))))

(declare-fun condMapEmpty!39322 () Bool)

(declare-fun mapDefault!39322 () ValueCell!11847)

(assert (=> b!1061118 (= condMapEmpty!39322 (= (arr!32311 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11847)) mapDefault!39322)))))

(declare-fun res!708639 () Bool)

(assert (=> start!93818 (=> (not res!708639) (not e!604217))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93818 (= res!708639 (validMask!0 mask!1515))))

(assert (=> start!93818 e!604217))

(assert (=> start!93818 true))

(declare-fun tp_is_empty!25101 () Bool)

(assert (=> start!93818 tp_is_empty!25101))

(declare-fun array_inv!25040 (array!67207) Bool)

(assert (=> start!93818 (and (array_inv!25040 _values!955) e!604214)))

(assert (=> start!93818 tp!75295))

(declare-fun array_inv!25041 (array!67209) Bool)

(assert (=> start!93818 (array_inv!25041 _keys!1163)))

(declare-fun mapNonEmpty!39322 () Bool)

(declare-fun tp!75296 () Bool)

(declare-fun e!604218 () Bool)

(assert (=> mapNonEmpty!39322 (= mapRes!39322 (and tp!75296 e!604218))))

(declare-fun mapRest!39322 () (Array (_ BitVec 32) ValueCell!11847))

(declare-fun mapValue!39322 () ValueCell!11847)

(declare-fun mapKey!39322 () (_ BitVec 32))

(assert (=> mapNonEmpty!39322 (= (arr!32311 _values!955) (store mapRest!39322 mapKey!39322 mapValue!39322))))

(declare-fun b!1061119 () Bool)

(declare-fun res!708640 () Bool)

(assert (=> b!1061119 (=> (not res!708640) (not e!604217))))

(declare-datatypes ((List!22509 0))(
  ( (Nil!22506) (Cons!22505 (h!23714 (_ BitVec 64)) (t!31818 List!22509)) )
))
(declare-fun arrayNoDuplicates!0 (array!67209 (_ BitVec 32) List!22509) Bool)

(assert (=> b!1061119 (= res!708640 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22506))))

(declare-fun b!1061120 () Bool)

(declare-fun res!708637 () Bool)

(assert (=> b!1061120 (=> (not res!708637) (not e!604217))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67209 (_ BitVec 32)) Bool)

(assert (=> b!1061120 (= res!708637 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1061121 () Bool)

(assert (=> b!1061121 (= e!604216 tp_is_empty!25101)))

(declare-fun mapIsEmpty!39322 () Bool)

(assert (=> mapIsEmpty!39322 mapRes!39322))

(declare-fun b!1061122 () Bool)

(assert (=> b!1061122 (= e!604218 tp_is_empty!25101)))

(declare-fun b!1061123 () Bool)

(assert (=> b!1061123 (= e!604217 false)))

(declare-fun minValue!907 () V!38603)

(declare-datatypes ((tuple2!15922 0))(
  ( (tuple2!15923 (_1!7972 (_ BitVec 64)) (_2!7972 V!38603)) )
))
(declare-datatypes ((List!22510 0))(
  ( (Nil!22507) (Cons!22506 (h!23715 tuple2!15922) (t!31819 List!22510)) )
))
(declare-datatypes ((ListLongMap!13891 0))(
  ( (ListLongMap!13892 (toList!6961 List!22510)) )
))
(declare-fun lt!467472 () ListLongMap!13891)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!38603)

(declare-fun getCurrentListMapNoExtraKeys!3563 (array!67209 array!67207 (_ BitVec 32) (_ BitVec 32) V!38603 V!38603 (_ BitVec 32) Int) ListLongMap!13891)

(assert (=> b!1061123 (= lt!467472 (getCurrentListMapNoExtraKeys!3563 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun zeroValueBefore!47 () V!38603)

(declare-fun lt!467473 () ListLongMap!13891)

(assert (=> b!1061123 (= lt!467473 (getCurrentListMapNoExtraKeys!3563 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (= (and start!93818 res!708639) b!1061117))

(assert (= (and b!1061117 res!708638) b!1061120))

(assert (= (and b!1061120 res!708637) b!1061119))

(assert (= (and b!1061119 res!708640) b!1061123))

(assert (= (and b!1061118 condMapEmpty!39322) mapIsEmpty!39322))

(assert (= (and b!1061118 (not condMapEmpty!39322)) mapNonEmpty!39322))

(get-info :version)

(assert (= (and mapNonEmpty!39322 ((_ is ValueCellFull!11847) mapValue!39322)) b!1061122))

(assert (= (and b!1061118 ((_ is ValueCellFull!11847) mapDefault!39322)) b!1061121))

(assert (= start!93818 b!1061118))

(declare-fun m!980023 () Bool)

(assert (=> start!93818 m!980023))

(declare-fun m!980025 () Bool)

(assert (=> start!93818 m!980025))

(declare-fun m!980027 () Bool)

(assert (=> start!93818 m!980027))

(declare-fun m!980029 () Bool)

(assert (=> b!1061123 m!980029))

(declare-fun m!980031 () Bool)

(assert (=> b!1061123 m!980031))

(declare-fun m!980033 () Bool)

(assert (=> b!1061119 m!980033))

(declare-fun m!980035 () Bool)

(assert (=> b!1061120 m!980035))

(declare-fun m!980037 () Bool)

(assert (=> mapNonEmpty!39322 m!980037))

(check-sat (not b!1061120) (not mapNonEmpty!39322) (not start!93818) (not b!1061119) (not b_next!21291) tp_is_empty!25101 (not b!1061123) b_and!34005)
(check-sat b_and!34005 (not b_next!21291))
