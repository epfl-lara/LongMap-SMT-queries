; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41924 () Bool)

(assert start!41924)

(declare-fun b_free!11527 () Bool)

(declare-fun b_next!11527 () Bool)

(assert (=> start!41924 (= b_free!11527 (not b_next!11527))))

(declare-fun tp!40594 () Bool)

(declare-fun b_and!19925 () Bool)

(assert (=> start!41924 (= tp!40594 b_and!19925)))

(declare-fun b!468169 () Bool)

(declare-fun res!279833 () Bool)

(declare-fun e!273972 () Bool)

(assert (=> b!468169 (=> (not res!279833) (not e!273972))))

(declare-datatypes ((array!29674 0))(
  ( (array!29675 (arr!14263 (Array (_ BitVec 32) (_ BitVec 64))) (size!14615 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29674)

(declare-datatypes ((List!8573 0))(
  ( (Nil!8570) (Cons!8569 (h!9425 (_ BitVec 64)) (t!14521 List!8573)) )
))
(declare-fun arrayNoDuplicates!0 (array!29674 (_ BitVec 32) List!8573) Bool)

(assert (=> b!468169 (= res!279833 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8570))))

(declare-fun b!468170 () Bool)

(declare-fun e!273974 () Bool)

(declare-fun tp_is_empty!12955 () Bool)

(assert (=> b!468170 (= e!273974 tp_is_empty!12955)))

(declare-fun b!468172 () Bool)

(declare-fun res!279831 () Bool)

(assert (=> b!468172 (=> (not res!279831) (not e!273972))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29674 (_ BitVec 32)) Bool)

(assert (=> b!468172 (= res!279831 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!468173 () Bool)

(declare-fun e!273971 () Bool)

(assert (=> b!468173 (= e!273971 true)))

(declare-datatypes ((V!18379 0))(
  ( (V!18380 (val!6522 Int)) )
))
(declare-fun minValueBefore!38 () V!18379)

(declare-fun zeroValue!794 () V!18379)

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-datatypes ((tuple2!8494 0))(
  ( (tuple2!8495 (_1!4258 (_ BitVec 64)) (_2!4258 V!18379)) )
))
(declare-datatypes ((List!8574 0))(
  ( (Nil!8571) (Cons!8570 (h!9426 tuple2!8494) (t!14522 List!8574)) )
))
(declare-datatypes ((ListLongMap!7409 0))(
  ( (ListLongMap!7410 (toList!3720 List!8574)) )
))
(declare-fun lt!211741 () ListLongMap!7409)

(declare-datatypes ((ValueCell!6134 0))(
  ( (ValueCellFull!6134 (v!8812 V!18379)) (EmptyCell!6134) )
))
(declare-datatypes ((array!29676 0))(
  ( (array!29677 (arr!14264 (Array (_ BitVec 32) ValueCell!6134)) (size!14616 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29676)

(declare-fun getCurrentListMap!2149 (array!29674 array!29676 (_ BitVec 32) (_ BitVec 32) V!18379 V!18379 (_ BitVec 32) Int) ListLongMap!7409)

(assert (=> b!468173 (= lt!211741 (getCurrentListMap!2149 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapNonEmpty!21124 () Bool)

(declare-fun mapRes!21124 () Bool)

(declare-fun tp!40593 () Bool)

(declare-fun e!273976 () Bool)

(assert (=> mapNonEmpty!21124 (= mapRes!21124 (and tp!40593 e!273976))))

(declare-fun mapValue!21124 () ValueCell!6134)

(declare-fun mapKey!21124 () (_ BitVec 32))

(declare-fun mapRest!21124 () (Array (_ BitVec 32) ValueCell!6134))

(assert (=> mapNonEmpty!21124 (= (arr!14264 _values!833) (store mapRest!21124 mapKey!21124 mapValue!21124))))

(declare-fun b!468174 () Bool)

(declare-fun res!279832 () Bool)

(assert (=> b!468174 (=> (not res!279832) (not e!273972))))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(assert (=> b!468174 (= res!279832 (and (= (size!14616 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14615 _keys!1025) (size!14616 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!468175 () Bool)

(assert (=> b!468175 (= e!273976 tp_is_empty!12955)))

(declare-fun b!468171 () Bool)

(declare-fun e!273975 () Bool)

(assert (=> b!468171 (= e!273975 (and e!273974 mapRes!21124))))

(declare-fun condMapEmpty!21124 () Bool)

(declare-fun mapDefault!21124 () ValueCell!6134)

(assert (=> b!468171 (= condMapEmpty!21124 (= (arr!14264 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6134)) mapDefault!21124)))))

(declare-fun res!279834 () Bool)

(assert (=> start!41924 (=> (not res!279834) (not e!273972))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41924 (= res!279834 (validMask!0 mask!1365))))

(assert (=> start!41924 e!273972))

(assert (=> start!41924 tp_is_empty!12955))

(assert (=> start!41924 tp!40594))

(assert (=> start!41924 true))

(declare-fun array_inv!10388 (array!29674) Bool)

(assert (=> start!41924 (array_inv!10388 _keys!1025)))

(declare-fun array_inv!10389 (array!29676) Bool)

(assert (=> start!41924 (and (array_inv!10389 _values!833) e!273975)))

(declare-fun mapIsEmpty!21124 () Bool)

(assert (=> mapIsEmpty!21124 mapRes!21124))

(declare-fun b!468176 () Bool)

(assert (=> b!468176 (= e!273972 (not e!273971))))

(declare-fun res!279830 () Bool)

(assert (=> b!468176 (=> res!279830 e!273971)))

(assert (=> b!468176 (= res!279830 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!211742 () ListLongMap!7409)

(declare-fun lt!211740 () ListLongMap!7409)

(assert (=> b!468176 (= lt!211742 lt!211740)))

(declare-datatypes ((Unit!13648 0))(
  ( (Unit!13649) )
))
(declare-fun lt!211743 () Unit!13648)

(declare-fun minValueAfter!38 () V!18379)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!100 (array!29674 array!29676 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18379 V!18379 V!18379 V!18379 (_ BitVec 32) Int) Unit!13648)

(assert (=> b!468176 (= lt!211743 (lemmaNoChangeToArrayThenSameMapNoExtras!100 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1940 (array!29674 array!29676 (_ BitVec 32) (_ BitVec 32) V!18379 V!18379 (_ BitVec 32) Int) ListLongMap!7409)

(assert (=> b!468176 (= lt!211740 (getCurrentListMapNoExtraKeys!1940 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!468176 (= lt!211742 (getCurrentListMapNoExtraKeys!1940 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (= (and start!41924 res!279834) b!468174))

(assert (= (and b!468174 res!279832) b!468172))

(assert (= (and b!468172 res!279831) b!468169))

(assert (= (and b!468169 res!279833) b!468176))

(assert (= (and b!468176 (not res!279830)) b!468173))

(assert (= (and b!468171 condMapEmpty!21124) mapIsEmpty!21124))

(assert (= (and b!468171 (not condMapEmpty!21124)) mapNonEmpty!21124))

(get-info :version)

(assert (= (and mapNonEmpty!21124 ((_ is ValueCellFull!6134) mapValue!21124)) b!468175))

(assert (= (and b!468171 ((_ is ValueCellFull!6134) mapDefault!21124)) b!468170))

(assert (= start!41924 b!468171))

(declare-fun m!450431 () Bool)

(assert (=> b!468176 m!450431))

(declare-fun m!450433 () Bool)

(assert (=> b!468176 m!450433))

(declare-fun m!450435 () Bool)

(assert (=> b!468176 m!450435))

(declare-fun m!450437 () Bool)

(assert (=> b!468172 m!450437))

(declare-fun m!450439 () Bool)

(assert (=> mapNonEmpty!21124 m!450439))

(declare-fun m!450441 () Bool)

(assert (=> b!468169 m!450441))

(declare-fun m!450443 () Bool)

(assert (=> b!468173 m!450443))

(declare-fun m!450445 () Bool)

(assert (=> start!41924 m!450445))

(declare-fun m!450447 () Bool)

(assert (=> start!41924 m!450447))

(declare-fun m!450449 () Bool)

(assert (=> start!41924 m!450449))

(check-sat (not b!468173) tp_is_empty!12955 (not b!468169) (not b!468176) (not mapNonEmpty!21124) b_and!19925 (not b!468172) (not b_next!11527) (not start!41924))
(check-sat b_and!19925 (not b_next!11527))
