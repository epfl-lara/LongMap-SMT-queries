; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42592 () Bool)

(assert start!42592)

(declare-fun b_free!12027 () Bool)

(declare-fun b_next!12027 () Bool)

(assert (=> start!42592 (= b_free!12027 (not b_next!12027))))

(declare-fun tp!42121 () Bool)

(declare-fun b_and!20507 () Bool)

(assert (=> start!42592 (= tp!42121 b_and!20507)))

(declare-fun b!475173 () Bool)

(declare-fun res!283781 () Bool)

(declare-fun e!278988 () Bool)

(assert (=> b!475173 (=> (not res!283781) (not e!278988))))

(declare-datatypes ((array!30647 0))(
  ( (array!30648 (arr!14741 (Array (_ BitVec 32) (_ BitVec 64))) (size!15093 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30647)

(declare-datatypes ((List!9007 0))(
  ( (Nil!9004) (Cons!9003 (h!9859 (_ BitVec 64)) (t!14981 List!9007)) )
))
(declare-fun arrayNoDuplicates!0 (array!30647 (_ BitVec 32) List!9007) Bool)

(assert (=> b!475173 (= res!283781 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!9004))))

(declare-fun b!475174 () Bool)

(assert (=> b!475174 (= e!278988 false)))

(declare-datatypes ((V!19045 0))(
  ( (V!19046 (val!6772 Int)) )
))
(declare-datatypes ((tuple2!8928 0))(
  ( (tuple2!8929 (_1!4475 (_ BitVec 64)) (_2!4475 V!19045)) )
))
(declare-datatypes ((List!9008 0))(
  ( (Nil!9005) (Cons!9004 (h!9860 tuple2!8928) (t!14982 List!9008)) )
))
(declare-datatypes ((ListLongMap!7841 0))(
  ( (ListLongMap!7842 (toList!3936 List!9008)) )
))
(declare-fun lt!216401 () ListLongMap!7841)

(declare-fun zeroValue!794 () V!19045)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((ValueCell!6384 0))(
  ( (ValueCellFull!6384 (v!9065 V!19045)) (EmptyCell!6384) )
))
(declare-datatypes ((array!30649 0))(
  ( (array!30650 (arr!14742 (Array (_ BitVec 32) ValueCell!6384)) (size!15094 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30649)

(declare-fun minValueAfter!38 () V!19045)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!2093 (array!30647 array!30649 (_ BitVec 32) (_ BitVec 32) V!19045 V!19045 (_ BitVec 32) Int) ListLongMap!7841)

(assert (=> b!475174 (= lt!216401 (getCurrentListMapNoExtraKeys!2093 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun minValueBefore!38 () V!19045)

(declare-fun lt!216400 () ListLongMap!7841)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(assert (=> b!475174 (= lt!216400 (getCurrentListMapNoExtraKeys!2093 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!475175 () Bool)

(declare-fun e!278984 () Bool)

(declare-fun tp_is_empty!13455 () Bool)

(assert (=> b!475175 (= e!278984 tp_is_empty!13455)))

(declare-fun mapIsEmpty!21901 () Bool)

(declare-fun mapRes!21901 () Bool)

(assert (=> mapIsEmpty!21901 mapRes!21901))

(declare-fun b!475176 () Bool)

(declare-fun res!283780 () Bool)

(assert (=> b!475176 (=> (not res!283780) (not e!278988))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30647 (_ BitVec 32)) Bool)

(assert (=> b!475176 (= res!283780 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun mapNonEmpty!21901 () Bool)

(declare-fun tp!42120 () Bool)

(declare-fun e!278987 () Bool)

(assert (=> mapNonEmpty!21901 (= mapRes!21901 (and tp!42120 e!278987))))

(declare-fun mapValue!21901 () ValueCell!6384)

(declare-fun mapRest!21901 () (Array (_ BitVec 32) ValueCell!6384))

(declare-fun mapKey!21901 () (_ BitVec 32))

(assert (=> mapNonEmpty!21901 (= (arr!14742 _values!833) (store mapRest!21901 mapKey!21901 mapValue!21901))))

(declare-fun b!475177 () Bool)

(assert (=> b!475177 (= e!278987 tp_is_empty!13455)))

(declare-fun b!475178 () Bool)

(declare-fun res!283782 () Bool)

(assert (=> b!475178 (=> (not res!283782) (not e!278988))))

(assert (=> b!475178 (= res!283782 (and (= (size!15094 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!15093 _keys!1025) (size!15094 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!475172 () Bool)

(declare-fun e!278986 () Bool)

(assert (=> b!475172 (= e!278986 (and e!278984 mapRes!21901))))

(declare-fun condMapEmpty!21901 () Bool)

(declare-fun mapDefault!21901 () ValueCell!6384)

(assert (=> b!475172 (= condMapEmpty!21901 (= (arr!14742 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6384)) mapDefault!21901)))))

(declare-fun res!283779 () Bool)

(assert (=> start!42592 (=> (not res!283779) (not e!278988))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42592 (= res!283779 (validMask!0 mask!1365))))

(assert (=> start!42592 e!278988))

(assert (=> start!42592 tp_is_empty!13455))

(assert (=> start!42592 tp!42121))

(assert (=> start!42592 true))

(declare-fun array_inv!10636 (array!30647) Bool)

(assert (=> start!42592 (array_inv!10636 _keys!1025)))

(declare-fun array_inv!10637 (array!30649) Bool)

(assert (=> start!42592 (and (array_inv!10637 _values!833) e!278986)))

(assert (= (and start!42592 res!283779) b!475178))

(assert (= (and b!475178 res!283782) b!475176))

(assert (= (and b!475176 res!283780) b!475173))

(assert (= (and b!475173 res!283781) b!475174))

(assert (= (and b!475172 condMapEmpty!21901) mapIsEmpty!21901))

(assert (= (and b!475172 (not condMapEmpty!21901)) mapNonEmpty!21901))

(get-info :version)

(assert (= (and mapNonEmpty!21901 ((_ is ValueCellFull!6384) mapValue!21901)) b!475177))

(assert (= (and b!475172 ((_ is ValueCellFull!6384) mapDefault!21901)) b!475175))

(assert (= start!42592 b!475172))

(declare-fun m!457415 () Bool)

(assert (=> b!475174 m!457415))

(declare-fun m!457417 () Bool)

(assert (=> b!475174 m!457417))

(declare-fun m!457419 () Bool)

(assert (=> mapNonEmpty!21901 m!457419))

(declare-fun m!457421 () Bool)

(assert (=> b!475176 m!457421))

(declare-fun m!457423 () Bool)

(assert (=> start!42592 m!457423))

(declare-fun m!457425 () Bool)

(assert (=> start!42592 m!457425))

(declare-fun m!457427 () Bool)

(assert (=> start!42592 m!457427))

(declare-fun m!457429 () Bool)

(assert (=> b!475173 m!457429))

(check-sat (not b_next!12027) tp_is_empty!13455 (not b!475174) (not mapNonEmpty!21901) (not b!475173) b_and!20507 (not b!475176) (not start!42592))
(check-sat b_and!20507 (not b_next!12027))
