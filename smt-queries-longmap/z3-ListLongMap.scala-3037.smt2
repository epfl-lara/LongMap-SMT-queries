; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42598 () Bool)

(assert start!42598)

(declare-fun b_free!12033 () Bool)

(declare-fun b_next!12033 () Bool)

(assert (=> start!42598 (= b_free!12033 (not b_next!12033))))

(declare-fun tp!42139 () Bool)

(declare-fun b_and!20513 () Bool)

(assert (=> start!42598 (= tp!42139 b_and!20513)))

(declare-fun res!283817 () Bool)

(declare-fun e!279033 () Bool)

(assert (=> start!42598 (=> (not res!283817) (not e!279033))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42598 (= res!283817 (validMask!0 mask!1365))))

(assert (=> start!42598 e!279033))

(declare-fun tp_is_empty!13461 () Bool)

(assert (=> start!42598 tp_is_empty!13461))

(assert (=> start!42598 tp!42139))

(assert (=> start!42598 true))

(declare-datatypes ((array!30659 0))(
  ( (array!30660 (arr!14747 (Array (_ BitVec 32) (_ BitVec 64))) (size!15099 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30659)

(declare-fun array_inv!10642 (array!30659) Bool)

(assert (=> start!42598 (array_inv!10642 _keys!1025)))

(declare-datatypes ((V!19053 0))(
  ( (V!19054 (val!6775 Int)) )
))
(declare-datatypes ((ValueCell!6387 0))(
  ( (ValueCellFull!6387 (v!9068 V!19053)) (EmptyCell!6387) )
))
(declare-datatypes ((array!30661 0))(
  ( (array!30662 (arr!14748 (Array (_ BitVec 32) ValueCell!6387)) (size!15100 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30661)

(declare-fun e!279029 () Bool)

(declare-fun array_inv!10643 (array!30661) Bool)

(assert (=> start!42598 (and (array_inv!10643 _values!833) e!279029)))

(declare-fun b!475235 () Bool)

(declare-fun e!279031 () Bool)

(declare-fun mapRes!21910 () Bool)

(assert (=> b!475235 (= e!279029 (and e!279031 mapRes!21910))))

(declare-fun condMapEmpty!21910 () Bool)

(declare-fun mapDefault!21910 () ValueCell!6387)

(assert (=> b!475235 (= condMapEmpty!21910 (= (arr!14748 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6387)) mapDefault!21910)))))

(declare-fun b!475236 () Bool)

(assert (=> b!475236 (= e!279031 tp_is_empty!13461)))

(declare-fun b!475237 () Bool)

(declare-fun res!283816 () Bool)

(assert (=> b!475237 (=> (not res!283816) (not e!279033))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30659 (_ BitVec 32)) Bool)

(assert (=> b!475237 (= res!283816 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!475238 () Bool)

(declare-fun res!283818 () Bool)

(assert (=> b!475238 (=> (not res!283818) (not e!279033))))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(assert (=> b!475238 (= res!283818 (and (= (size!15100 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!15099 _keys!1025) (size!15100 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!475239 () Bool)

(declare-fun e!279030 () Bool)

(assert (=> b!475239 (= e!279030 tp_is_empty!13461)))

(declare-fun mapNonEmpty!21910 () Bool)

(declare-fun tp!42138 () Bool)

(assert (=> mapNonEmpty!21910 (= mapRes!21910 (and tp!42138 e!279030))))

(declare-fun mapKey!21910 () (_ BitVec 32))

(declare-fun mapRest!21910 () (Array (_ BitVec 32) ValueCell!6387))

(declare-fun mapValue!21910 () ValueCell!6387)

(assert (=> mapNonEmpty!21910 (= (arr!14748 _values!833) (store mapRest!21910 mapKey!21910 mapValue!21910))))

(declare-fun b!475240 () Bool)

(assert (=> b!475240 (= e!279033 false)))

(declare-datatypes ((tuple2!8932 0))(
  ( (tuple2!8933 (_1!4477 (_ BitVec 64)) (_2!4477 V!19053)) )
))
(declare-datatypes ((List!9011 0))(
  ( (Nil!9008) (Cons!9007 (h!9863 tuple2!8932) (t!14985 List!9011)) )
))
(declare-datatypes ((ListLongMap!7845 0))(
  ( (ListLongMap!7846 (toList!3938 List!9011)) )
))
(declare-fun lt!216419 () ListLongMap!7845)

(declare-fun zeroValue!794 () V!19053)

(declare-fun defaultEntry!841 () Int)

(declare-fun minValueAfter!38 () V!19053)

(declare-fun getCurrentListMapNoExtraKeys!2095 (array!30659 array!30661 (_ BitVec 32) (_ BitVec 32) V!19053 V!19053 (_ BitVec 32) Int) ListLongMap!7845)

(assert (=> b!475240 (= lt!216419 (getCurrentListMapNoExtraKeys!2095 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun minValueBefore!38 () V!19053)

(declare-fun lt!216418 () ListLongMap!7845)

(assert (=> b!475240 (= lt!216418 (getCurrentListMapNoExtraKeys!2095 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapIsEmpty!21910 () Bool)

(assert (=> mapIsEmpty!21910 mapRes!21910))

(declare-fun b!475241 () Bool)

(declare-fun res!283815 () Bool)

(assert (=> b!475241 (=> (not res!283815) (not e!279033))))

(declare-datatypes ((List!9012 0))(
  ( (Nil!9009) (Cons!9008 (h!9864 (_ BitVec 64)) (t!14986 List!9012)) )
))
(declare-fun arrayNoDuplicates!0 (array!30659 (_ BitVec 32) List!9012) Bool)

(assert (=> b!475241 (= res!283815 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!9009))))

(assert (= (and start!42598 res!283817) b!475238))

(assert (= (and b!475238 res!283818) b!475237))

(assert (= (and b!475237 res!283816) b!475241))

(assert (= (and b!475241 res!283815) b!475240))

(assert (= (and b!475235 condMapEmpty!21910) mapIsEmpty!21910))

(assert (= (and b!475235 (not condMapEmpty!21910)) mapNonEmpty!21910))

(get-info :version)

(assert (= (and mapNonEmpty!21910 ((_ is ValueCellFull!6387) mapValue!21910)) b!475239))

(assert (= (and b!475235 ((_ is ValueCellFull!6387) mapDefault!21910)) b!475236))

(assert (= start!42598 b!475235))

(declare-fun m!457463 () Bool)

(assert (=> b!475241 m!457463))

(declare-fun m!457465 () Bool)

(assert (=> start!42598 m!457465))

(declare-fun m!457467 () Bool)

(assert (=> start!42598 m!457467))

(declare-fun m!457469 () Bool)

(assert (=> start!42598 m!457469))

(declare-fun m!457471 () Bool)

(assert (=> mapNonEmpty!21910 m!457471))

(declare-fun m!457473 () Bool)

(assert (=> b!475240 m!457473))

(declare-fun m!457475 () Bool)

(assert (=> b!475240 m!457475))

(declare-fun m!457477 () Bool)

(assert (=> b!475237 m!457477))

(check-sat (not b_next!12033) (not b!475240) (not mapNonEmpty!21910) (not start!42598) (not b!475241) b_and!20513 (not b!475237) tp_is_empty!13461)
(check-sat b_and!20513 (not b_next!12033))
