; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42570 () Bool)

(assert start!42570)

(declare-fun b_free!12019 () Bool)

(declare-fun b_next!12019 () Bool)

(assert (=> start!42570 (= b_free!12019 (not b_next!12019))))

(declare-fun tp!42096 () Bool)

(declare-fun b_and!20509 () Bool)

(assert (=> start!42570 (= tp!42096 b_and!20509)))

(declare-fun res!283724 () Bool)

(declare-fun e!278887 () Bool)

(assert (=> start!42570 (=> (not res!283724) (not e!278887))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42570 (= res!283724 (validMask!0 mask!1365))))

(assert (=> start!42570 e!278887))

(declare-fun tp_is_empty!13447 () Bool)

(assert (=> start!42570 tp_is_empty!13447))

(assert (=> start!42570 tp!42096))

(assert (=> start!42570 true))

(declare-datatypes ((array!30618 0))(
  ( (array!30619 (arr!14726 (Array (_ BitVec 32) (_ BitVec 64))) (size!15078 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30618)

(declare-fun array_inv!10700 (array!30618) Bool)

(assert (=> start!42570 (array_inv!10700 _keys!1025)))

(declare-datatypes ((V!19035 0))(
  ( (V!19036 (val!6768 Int)) )
))
(declare-datatypes ((ValueCell!6380 0))(
  ( (ValueCellFull!6380 (v!9062 V!19035)) (EmptyCell!6380) )
))
(declare-datatypes ((array!30620 0))(
  ( (array!30621 (arr!14727 (Array (_ BitVec 32) ValueCell!6380)) (size!15079 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30620)

(declare-fun e!278886 () Bool)

(declare-fun array_inv!10701 (array!30620) Bool)

(assert (=> start!42570 (and (array_inv!10701 _values!833) e!278886)))

(declare-fun b!475027 () Bool)

(declare-fun e!278888 () Bool)

(assert (=> b!475027 (= e!278888 tp_is_empty!13447)))

(declare-fun mapIsEmpty!21889 () Bool)

(declare-fun mapRes!21889 () Bool)

(assert (=> mapIsEmpty!21889 mapRes!21889))

(declare-fun mapNonEmpty!21889 () Bool)

(declare-fun tp!42097 () Bool)

(declare-fun e!278889 () Bool)

(assert (=> mapNonEmpty!21889 (= mapRes!21889 (and tp!42097 e!278889))))

(declare-fun mapRest!21889 () (Array (_ BitVec 32) ValueCell!6380))

(declare-fun mapKey!21889 () (_ BitVec 32))

(declare-fun mapValue!21889 () ValueCell!6380)

(assert (=> mapNonEmpty!21889 (= (arr!14727 _values!833) (store mapRest!21889 mapKey!21889 mapValue!21889))))

(declare-fun b!475028 () Bool)

(declare-fun res!283727 () Bool)

(assert (=> b!475028 (=> (not res!283727) (not e!278887))))

(declare-datatypes ((List!8910 0))(
  ( (Nil!8907) (Cons!8906 (h!9762 (_ BitVec 64)) (t!14876 List!8910)) )
))
(declare-fun arrayNoDuplicates!0 (array!30618 (_ BitVec 32) List!8910) Bool)

(assert (=> b!475028 (= res!283727 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8907))))

(declare-fun b!475029 () Bool)

(assert (=> b!475029 (= e!278887 false)))

(declare-fun zeroValue!794 () V!19035)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((tuple2!8852 0))(
  ( (tuple2!8853 (_1!4437 (_ BitVec 64)) (_2!4437 V!19035)) )
))
(declare-datatypes ((List!8911 0))(
  ( (Nil!8908) (Cons!8907 (h!9763 tuple2!8852) (t!14877 List!8911)) )
))
(declare-datatypes ((ListLongMap!7767 0))(
  ( (ListLongMap!7768 (toList!3899 List!8911)) )
))
(declare-fun lt!216388 () ListLongMap!7767)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-fun minValueAfter!38 () V!19035)

(declare-fun getCurrentListMapNoExtraKeys!2106 (array!30618 array!30620 (_ BitVec 32) (_ BitVec 32) V!19035 V!19035 (_ BitVec 32) Int) ListLongMap!7767)

(assert (=> b!475029 (= lt!216388 (getCurrentListMapNoExtraKeys!2106 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun minValueBefore!38 () V!19035)

(declare-fun lt!216389 () ListLongMap!7767)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(assert (=> b!475029 (= lt!216389 (getCurrentListMapNoExtraKeys!2106 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!475030 () Bool)

(declare-fun res!283725 () Bool)

(assert (=> b!475030 (=> (not res!283725) (not e!278887))))

(assert (=> b!475030 (= res!283725 (and (= (size!15079 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!15078 _keys!1025) (size!15079 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!475031 () Bool)

(assert (=> b!475031 (= e!278886 (and e!278888 mapRes!21889))))

(declare-fun condMapEmpty!21889 () Bool)

(declare-fun mapDefault!21889 () ValueCell!6380)

(assert (=> b!475031 (= condMapEmpty!21889 (= (arr!14727 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6380)) mapDefault!21889)))))

(declare-fun b!475032 () Bool)

(assert (=> b!475032 (= e!278889 tp_is_empty!13447)))

(declare-fun b!475033 () Bool)

(declare-fun res!283726 () Bool)

(assert (=> b!475033 (=> (not res!283726) (not e!278887))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30618 (_ BitVec 32)) Bool)

(assert (=> b!475033 (= res!283726 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(assert (= (and start!42570 res!283724) b!475030))

(assert (= (and b!475030 res!283725) b!475033))

(assert (= (and b!475033 res!283726) b!475028))

(assert (= (and b!475028 res!283727) b!475029))

(assert (= (and b!475031 condMapEmpty!21889) mapIsEmpty!21889))

(assert (= (and b!475031 (not condMapEmpty!21889)) mapNonEmpty!21889))

(get-info :version)

(assert (= (and mapNonEmpty!21889 ((_ is ValueCellFull!6380) mapValue!21889)) b!475032))

(assert (= (and b!475031 ((_ is ValueCellFull!6380) mapDefault!21889)) b!475027))

(assert (= start!42570 b!475031))

(declare-fun m!457533 () Bool)

(assert (=> mapNonEmpty!21889 m!457533))

(declare-fun m!457535 () Bool)

(assert (=> b!475029 m!457535))

(declare-fun m!457537 () Bool)

(assert (=> b!475029 m!457537))

(declare-fun m!457539 () Bool)

(assert (=> b!475033 m!457539))

(declare-fun m!457541 () Bool)

(assert (=> start!42570 m!457541))

(declare-fun m!457543 () Bool)

(assert (=> start!42570 m!457543))

(declare-fun m!457545 () Bool)

(assert (=> start!42570 m!457545))

(declare-fun m!457547 () Bool)

(assert (=> b!475028 m!457547))

(check-sat (not b!475028) (not b!475029) (not mapNonEmpty!21889) (not b_next!12019) b_and!20509 tp_is_empty!13447 (not start!42570) (not b!475033))
(check-sat b_and!20509 (not b_next!12019))
