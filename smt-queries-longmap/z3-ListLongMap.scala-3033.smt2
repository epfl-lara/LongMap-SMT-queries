; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42574 () Bool)

(assert start!42574)

(declare-fun b_free!12009 () Bool)

(declare-fun b_next!12009 () Bool)

(assert (=> start!42574 (= b_free!12009 (not b_next!12009))))

(declare-fun tp!42066 () Bool)

(declare-fun b_and!20489 () Bool)

(assert (=> start!42574 (= tp!42066 b_and!20489)))

(declare-fun b!474983 () Bool)

(declare-fun e!278849 () Bool)

(assert (=> b!474983 (= e!278849 false)))

(declare-datatypes ((V!19021 0))(
  ( (V!19022 (val!6763 Int)) )
))
(declare-datatypes ((tuple2!8922 0))(
  ( (tuple2!8923 (_1!4472 (_ BitVec 64)) (_2!4472 V!19021)) )
))
(declare-datatypes ((List!8997 0))(
  ( (Nil!8994) (Cons!8993 (h!9849 tuple2!8922) (t!14971 List!8997)) )
))
(declare-datatypes ((ListLongMap!7835 0))(
  ( (ListLongMap!7836 (toList!3933 List!8997)) )
))
(declare-fun lt!216346 () ListLongMap!7835)

(declare-fun zeroValue!794 () V!19021)

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!30615 0))(
  ( (array!30616 (arr!14725 (Array (_ BitVec 32) (_ BitVec 64))) (size!15077 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30615)

(declare-datatypes ((ValueCell!6375 0))(
  ( (ValueCellFull!6375 (v!9056 V!19021)) (EmptyCell!6375) )
))
(declare-datatypes ((array!30617 0))(
  ( (array!30618 (arr!14726 (Array (_ BitVec 32) ValueCell!6375)) (size!15078 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30617)

(declare-fun minValueAfter!38 () V!19021)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!2090 (array!30615 array!30617 (_ BitVec 32) (_ BitVec 32) V!19021 V!19021 (_ BitVec 32) Int) ListLongMap!7835)

(assert (=> b!474983 (= lt!216346 (getCurrentListMapNoExtraKeys!2090 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun minValueBefore!38 () V!19021)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun lt!216347 () ListLongMap!7835)

(assert (=> b!474983 (= lt!216347 (getCurrentListMapNoExtraKeys!2090 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!474984 () Bool)

(declare-fun e!278852 () Bool)

(declare-fun tp_is_empty!13437 () Bool)

(assert (=> b!474984 (= e!278852 tp_is_empty!13437)))

(declare-fun b!474985 () Bool)

(declare-fun e!278850 () Bool)

(declare-fun mapRes!21874 () Bool)

(assert (=> b!474985 (= e!278850 (and e!278852 mapRes!21874))))

(declare-fun condMapEmpty!21874 () Bool)

(declare-fun mapDefault!21874 () ValueCell!6375)

(assert (=> b!474985 (= condMapEmpty!21874 (= (arr!14726 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6375)) mapDefault!21874)))))

(declare-fun b!474986 () Bool)

(declare-fun e!278851 () Bool)

(assert (=> b!474986 (= e!278851 tp_is_empty!13437)))

(declare-fun res!283671 () Bool)

(assert (=> start!42574 (=> (not res!283671) (not e!278849))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42574 (= res!283671 (validMask!0 mask!1365))))

(assert (=> start!42574 e!278849))

(assert (=> start!42574 tp_is_empty!13437))

(assert (=> start!42574 tp!42066))

(assert (=> start!42574 true))

(declare-fun array_inv!10624 (array!30615) Bool)

(assert (=> start!42574 (array_inv!10624 _keys!1025)))

(declare-fun array_inv!10625 (array!30617) Bool)

(assert (=> start!42574 (and (array_inv!10625 _values!833) e!278850)))

(declare-fun b!474987 () Bool)

(declare-fun res!283674 () Bool)

(assert (=> b!474987 (=> (not res!283674) (not e!278849))))

(assert (=> b!474987 (= res!283674 (and (= (size!15078 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!15077 _keys!1025) (size!15078 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!474988 () Bool)

(declare-fun res!283672 () Bool)

(assert (=> b!474988 (=> (not res!283672) (not e!278849))))

(declare-datatypes ((List!8998 0))(
  ( (Nil!8995) (Cons!8994 (h!9850 (_ BitVec 64)) (t!14972 List!8998)) )
))
(declare-fun arrayNoDuplicates!0 (array!30615 (_ BitVec 32) List!8998) Bool)

(assert (=> b!474988 (= res!283672 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8995))))

(declare-fun b!474989 () Bool)

(declare-fun res!283673 () Bool)

(assert (=> b!474989 (=> (not res!283673) (not e!278849))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30615 (_ BitVec 32)) Bool)

(assert (=> b!474989 (= res!283673 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun mapNonEmpty!21874 () Bool)

(declare-fun tp!42067 () Bool)

(assert (=> mapNonEmpty!21874 (= mapRes!21874 (and tp!42067 e!278851))))

(declare-fun mapKey!21874 () (_ BitVec 32))

(declare-fun mapValue!21874 () ValueCell!6375)

(declare-fun mapRest!21874 () (Array (_ BitVec 32) ValueCell!6375))

(assert (=> mapNonEmpty!21874 (= (arr!14726 _values!833) (store mapRest!21874 mapKey!21874 mapValue!21874))))

(declare-fun mapIsEmpty!21874 () Bool)

(assert (=> mapIsEmpty!21874 mapRes!21874))

(assert (= (and start!42574 res!283671) b!474987))

(assert (= (and b!474987 res!283674) b!474989))

(assert (= (and b!474989 res!283673) b!474988))

(assert (= (and b!474988 res!283672) b!474983))

(assert (= (and b!474985 condMapEmpty!21874) mapIsEmpty!21874))

(assert (= (and b!474985 (not condMapEmpty!21874)) mapNonEmpty!21874))

(get-info :version)

(assert (= (and mapNonEmpty!21874 ((_ is ValueCellFull!6375) mapValue!21874)) b!474986))

(assert (= (and b!474985 ((_ is ValueCellFull!6375) mapDefault!21874)) b!474984))

(assert (= start!42574 b!474985))

(declare-fun m!457271 () Bool)

(assert (=> b!474983 m!457271))

(declare-fun m!457273 () Bool)

(assert (=> b!474983 m!457273))

(declare-fun m!457275 () Bool)

(assert (=> mapNonEmpty!21874 m!457275))

(declare-fun m!457277 () Bool)

(assert (=> b!474988 m!457277))

(declare-fun m!457279 () Bool)

(assert (=> b!474989 m!457279))

(declare-fun m!457281 () Bool)

(assert (=> start!42574 m!457281))

(declare-fun m!457283 () Bool)

(assert (=> start!42574 m!457283))

(declare-fun m!457285 () Bool)

(assert (=> start!42574 m!457285))

(check-sat (not mapNonEmpty!21874) (not start!42574) (not b!474983) b_and!20489 (not b_next!12009) (not b!474988) tp_is_empty!13437 (not b!474989))
(check-sat b_and!20489 (not b_next!12009))
