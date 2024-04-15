; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70076 () Bool)

(assert start!70076)

(declare-fun b_free!12517 () Bool)

(declare-fun b_next!12517 () Bool)

(assert (=> start!70076 (= b_free!12517 (not b_next!12517))))

(declare-fun tp!44266 () Bool)

(declare-fun b_and!21263 () Bool)

(assert (=> start!70076 (= tp!44266 b_and!21263)))

(declare-fun res!556253 () Bool)

(declare-fun e!451412 () Bool)

(assert (=> start!70076 (=> (not res!556253) (not e!451412))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70076 (= res!556253 (validMask!0 mask!1312))))

(assert (=> start!70076 e!451412))

(declare-fun tp_is_empty!14227 () Bool)

(assert (=> start!70076 tp_is_empty!14227))

(declare-datatypes ((array!44651 0))(
  ( (array!44652 (arr!21386 (Array (_ BitVec 32) (_ BitVec 64))) (size!21807 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44651)

(declare-fun array_inv!17195 (array!44651) Bool)

(assert (=> start!70076 (array_inv!17195 _keys!976)))

(assert (=> start!70076 true))

(declare-datatypes ((V!23971 0))(
  ( (V!23972 (val!7161 Int)) )
))
(declare-datatypes ((ValueCell!6698 0))(
  ( (ValueCellFull!6698 (v!9582 V!23971)) (EmptyCell!6698) )
))
(declare-datatypes ((array!44653 0))(
  ( (array!44654 (arr!21387 (Array (_ BitVec 32) ValueCell!6698)) (size!21808 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44653)

(declare-fun e!451409 () Bool)

(declare-fun array_inv!17196 (array!44653) Bool)

(assert (=> start!70076 (and (array_inv!17196 _values!788) e!451409)))

(assert (=> start!70076 tp!44266))

(declare-fun b!814337 () Bool)

(declare-fun e!451413 () Bool)

(assert (=> b!814337 (= e!451413 tp_is_empty!14227)))

(declare-fun b!814338 () Bool)

(declare-fun res!556254 () Bool)

(assert (=> b!814338 (=> (not res!556254) (not e!451412))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44651 (_ BitVec 32)) Bool)

(assert (=> b!814338 (= res!556254 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!814339 () Bool)

(assert (=> b!814339 (= e!451412 (not true))))

(declare-datatypes ((tuple2!9418 0))(
  ( (tuple2!9419 (_1!4720 (_ BitVec 64)) (_2!4720 V!23971)) )
))
(declare-datatypes ((List!15246 0))(
  ( (Nil!15243) (Cons!15242 (h!16371 tuple2!9418) (t!21554 List!15246)) )
))
(declare-datatypes ((ListLongMap!8231 0))(
  ( (ListLongMap!8232 (toList!4131 List!15246)) )
))
(declare-fun lt!364436 () ListLongMap!8231)

(declare-fun lt!364435 () ListLongMap!8231)

(assert (=> b!814339 (= lt!364436 lt!364435)))

(declare-fun zeroValueBefore!34 () V!23971)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun zeroValueAfter!34 () V!23971)

(declare-fun minValue!754 () V!23971)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((Unit!27696 0))(
  ( (Unit!27697) )
))
(declare-fun lt!364437 () Unit!27696)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!289 (array!44651 array!44653 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!23971 V!23971 V!23971 V!23971 (_ BitVec 32) Int) Unit!27696)

(assert (=> b!814339 (= lt!364437 (lemmaNoChangeToArrayThenSameMapNoExtras!289 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2196 (array!44651 array!44653 (_ BitVec 32) (_ BitVec 32) V!23971 V!23971 (_ BitVec 32) Int) ListLongMap!8231)

(assert (=> b!814339 (= lt!364435 (getCurrentListMapNoExtraKeys!2196 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!814339 (= lt!364436 (getCurrentListMapNoExtraKeys!2196 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!814340 () Bool)

(declare-fun e!451411 () Bool)

(assert (=> b!814340 (= e!451411 tp_is_empty!14227)))

(declare-fun b!814341 () Bool)

(declare-fun mapRes!22921 () Bool)

(assert (=> b!814341 (= e!451409 (and e!451411 mapRes!22921))))

(declare-fun condMapEmpty!22921 () Bool)

(declare-fun mapDefault!22921 () ValueCell!6698)

(assert (=> b!814341 (= condMapEmpty!22921 (= (arr!21387 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6698)) mapDefault!22921)))))

(declare-fun mapIsEmpty!22921 () Bool)

(assert (=> mapIsEmpty!22921 mapRes!22921))

(declare-fun b!814342 () Bool)

(declare-fun res!556256 () Bool)

(assert (=> b!814342 (=> (not res!556256) (not e!451412))))

(declare-datatypes ((List!15247 0))(
  ( (Nil!15244) (Cons!15243 (h!16372 (_ BitVec 64)) (t!21555 List!15247)) )
))
(declare-fun arrayNoDuplicates!0 (array!44651 (_ BitVec 32) List!15247) Bool)

(assert (=> b!814342 (= res!556256 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15244))))

(declare-fun mapNonEmpty!22921 () Bool)

(declare-fun tp!44265 () Bool)

(assert (=> mapNonEmpty!22921 (= mapRes!22921 (and tp!44265 e!451413))))

(declare-fun mapKey!22921 () (_ BitVec 32))

(declare-fun mapRest!22921 () (Array (_ BitVec 32) ValueCell!6698))

(declare-fun mapValue!22921 () ValueCell!6698)

(assert (=> mapNonEmpty!22921 (= (arr!21387 _values!788) (store mapRest!22921 mapKey!22921 mapValue!22921))))

(declare-fun b!814343 () Bool)

(declare-fun res!556255 () Bool)

(assert (=> b!814343 (=> (not res!556255) (not e!451412))))

(assert (=> b!814343 (= res!556255 (and (= (size!21808 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21807 _keys!976) (size!21808 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(assert (= (and start!70076 res!556253) b!814343))

(assert (= (and b!814343 res!556255) b!814338))

(assert (= (and b!814338 res!556254) b!814342))

(assert (= (and b!814342 res!556256) b!814339))

(assert (= (and b!814341 condMapEmpty!22921) mapIsEmpty!22921))

(assert (= (and b!814341 (not condMapEmpty!22921)) mapNonEmpty!22921))

(get-info :version)

(assert (= (and mapNonEmpty!22921 ((_ is ValueCellFull!6698) mapValue!22921)) b!814337))

(assert (= (and b!814341 ((_ is ValueCellFull!6698) mapDefault!22921)) b!814340))

(assert (= start!70076 b!814341))

(declare-fun m!755625 () Bool)

(assert (=> start!70076 m!755625))

(declare-fun m!755627 () Bool)

(assert (=> start!70076 m!755627))

(declare-fun m!755629 () Bool)

(assert (=> start!70076 m!755629))

(declare-fun m!755631 () Bool)

(assert (=> b!814342 m!755631))

(declare-fun m!755633 () Bool)

(assert (=> mapNonEmpty!22921 m!755633))

(declare-fun m!755635 () Bool)

(assert (=> b!814338 m!755635))

(declare-fun m!755637 () Bool)

(assert (=> b!814339 m!755637))

(declare-fun m!755639 () Bool)

(assert (=> b!814339 m!755639))

(declare-fun m!755641 () Bool)

(assert (=> b!814339 m!755641))

(check-sat (not b!814339) tp_is_empty!14227 b_and!21263 (not b!814342) (not mapNonEmpty!22921) (not start!70076) (not b_next!12517) (not b!814338))
(check-sat b_and!21263 (not b_next!12517))
