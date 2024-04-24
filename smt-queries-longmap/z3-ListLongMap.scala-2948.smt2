; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41894 () Bool)

(assert start!41894)

(declare-fun b_free!11497 () Bool)

(declare-fun b_next!11497 () Bool)

(assert (=> start!41894 (= b_free!11497 (not b_next!11497))))

(declare-fun tp!40503 () Bool)

(declare-fun b_and!19895 () Bool)

(assert (=> start!41894 (= tp!40503 b_and!19895)))

(declare-fun b!467809 () Bool)

(declare-fun e!273701 () Bool)

(assert (=> b!467809 (= e!273701 true)))

(declare-datatypes ((V!18339 0))(
  ( (V!18340 (val!6507 Int)) )
))
(declare-fun minValueBefore!38 () V!18339)

(declare-fun zeroValue!794 () V!18339)

(declare-fun defaultEntry!841 () Int)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-datatypes ((tuple2!8474 0))(
  ( (tuple2!8475 (_1!4248 (_ BitVec 64)) (_2!4248 V!18339)) )
))
(declare-datatypes ((List!8554 0))(
  ( (Nil!8551) (Cons!8550 (h!9406 tuple2!8474) (t!14502 List!8554)) )
))
(declare-datatypes ((ListLongMap!7389 0))(
  ( (ListLongMap!7390 (toList!3710 List!8554)) )
))
(declare-fun lt!211560 () ListLongMap!7389)

(declare-datatypes ((array!29618 0))(
  ( (array!29619 (arr!14235 (Array (_ BitVec 32) (_ BitVec 64))) (size!14587 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29618)

(declare-datatypes ((ValueCell!6119 0))(
  ( (ValueCellFull!6119 (v!8797 V!18339)) (EmptyCell!6119) )
))
(declare-datatypes ((array!29620 0))(
  ( (array!29621 (arr!14236 (Array (_ BitVec 32) ValueCell!6119)) (size!14588 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29620)

(declare-fun getCurrentListMap!2140 (array!29618 array!29620 (_ BitVec 32) (_ BitVec 32) V!18339 V!18339 (_ BitVec 32) Int) ListLongMap!7389)

(assert (=> b!467809 (= lt!211560 (getCurrentListMap!2140 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!467810 () Bool)

(declare-fun res!279607 () Bool)

(declare-fun e!273703 () Bool)

(assert (=> b!467810 (=> (not res!279607) (not e!273703))))

(declare-datatypes ((List!8555 0))(
  ( (Nil!8552) (Cons!8551 (h!9407 (_ BitVec 64)) (t!14503 List!8555)) )
))
(declare-fun arrayNoDuplicates!0 (array!29618 (_ BitVec 32) List!8555) Bool)

(assert (=> b!467810 (= res!279607 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8552))))

(declare-fun b!467811 () Bool)

(declare-fun e!273704 () Bool)

(declare-fun e!273702 () Bool)

(declare-fun mapRes!21079 () Bool)

(assert (=> b!467811 (= e!273704 (and e!273702 mapRes!21079))))

(declare-fun condMapEmpty!21079 () Bool)

(declare-fun mapDefault!21079 () ValueCell!6119)

(assert (=> b!467811 (= condMapEmpty!21079 (= (arr!14236 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6119)) mapDefault!21079)))))

(declare-fun mapNonEmpty!21079 () Bool)

(declare-fun tp!40504 () Bool)

(declare-fun e!273706 () Bool)

(assert (=> mapNonEmpty!21079 (= mapRes!21079 (and tp!40504 e!273706))))

(declare-fun mapKey!21079 () (_ BitVec 32))

(declare-fun mapRest!21079 () (Array (_ BitVec 32) ValueCell!6119))

(declare-fun mapValue!21079 () ValueCell!6119)

(assert (=> mapNonEmpty!21079 (= (arr!14236 _values!833) (store mapRest!21079 mapKey!21079 mapValue!21079))))

(declare-fun mapIsEmpty!21079 () Bool)

(assert (=> mapIsEmpty!21079 mapRes!21079))

(declare-fun b!467813 () Bool)

(declare-fun tp_is_empty!12925 () Bool)

(assert (=> b!467813 (= e!273706 tp_is_empty!12925)))

(declare-fun b!467814 () Bool)

(assert (=> b!467814 (= e!273702 tp_is_empty!12925)))

(declare-fun b!467815 () Bool)

(declare-fun res!279608 () Bool)

(assert (=> b!467815 (=> (not res!279608) (not e!273703))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29618 (_ BitVec 32)) Bool)

(assert (=> b!467815 (= res!279608 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!467816 () Bool)

(assert (=> b!467816 (= e!273703 (not e!273701))))

(declare-fun res!279609 () Bool)

(assert (=> b!467816 (=> res!279609 e!273701)))

(assert (=> b!467816 (= res!279609 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!211562 () ListLongMap!7389)

(declare-fun lt!211563 () ListLongMap!7389)

(assert (=> b!467816 (= lt!211562 lt!211563)))

(declare-datatypes ((Unit!13630 0))(
  ( (Unit!13631) )
))
(declare-fun lt!211561 () Unit!13630)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-fun minValueAfter!38 () V!18339)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!91 (array!29618 array!29620 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18339 V!18339 V!18339 V!18339 (_ BitVec 32) Int) Unit!13630)

(assert (=> b!467816 (= lt!211561 (lemmaNoChangeToArrayThenSameMapNoExtras!91 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1931 (array!29618 array!29620 (_ BitVec 32) (_ BitVec 32) V!18339 V!18339 (_ BitVec 32) Int) ListLongMap!7389)

(assert (=> b!467816 (= lt!211563 (getCurrentListMapNoExtraKeys!1931 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!467816 (= lt!211562 (getCurrentListMapNoExtraKeys!1931 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!467812 () Bool)

(declare-fun res!279606 () Bool)

(assert (=> b!467812 (=> (not res!279606) (not e!273703))))

(assert (=> b!467812 (= res!279606 (and (= (size!14588 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14587 _keys!1025) (size!14588 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun res!279605 () Bool)

(assert (=> start!41894 (=> (not res!279605) (not e!273703))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41894 (= res!279605 (validMask!0 mask!1365))))

(assert (=> start!41894 e!273703))

(assert (=> start!41894 tp_is_empty!12925))

(assert (=> start!41894 tp!40503))

(assert (=> start!41894 true))

(declare-fun array_inv!10368 (array!29618) Bool)

(assert (=> start!41894 (array_inv!10368 _keys!1025)))

(declare-fun array_inv!10369 (array!29620) Bool)

(assert (=> start!41894 (and (array_inv!10369 _values!833) e!273704)))

(assert (= (and start!41894 res!279605) b!467812))

(assert (= (and b!467812 res!279606) b!467815))

(assert (= (and b!467815 res!279608) b!467810))

(assert (= (and b!467810 res!279607) b!467816))

(assert (= (and b!467816 (not res!279609)) b!467809))

(assert (= (and b!467811 condMapEmpty!21079) mapIsEmpty!21079))

(assert (= (and b!467811 (not condMapEmpty!21079)) mapNonEmpty!21079))

(get-info :version)

(assert (= (and mapNonEmpty!21079 ((_ is ValueCellFull!6119) mapValue!21079)) b!467813))

(assert (= (and b!467811 ((_ is ValueCellFull!6119) mapDefault!21079)) b!467814))

(assert (= start!41894 b!467811))

(declare-fun m!450131 () Bool)

(assert (=> b!467816 m!450131))

(declare-fun m!450133 () Bool)

(assert (=> b!467816 m!450133))

(declare-fun m!450135 () Bool)

(assert (=> b!467816 m!450135))

(declare-fun m!450137 () Bool)

(assert (=> b!467810 m!450137))

(declare-fun m!450139 () Bool)

(assert (=> b!467809 m!450139))

(declare-fun m!450141 () Bool)

(assert (=> mapNonEmpty!21079 m!450141))

(declare-fun m!450143 () Bool)

(assert (=> b!467815 m!450143))

(declare-fun m!450145 () Bool)

(assert (=> start!41894 m!450145))

(declare-fun m!450147 () Bool)

(assert (=> start!41894 m!450147))

(declare-fun m!450149 () Bool)

(assert (=> start!41894 m!450149))

(check-sat (not mapNonEmpty!21079) (not b!467815) (not b!467816) (not start!41894) tp_is_empty!12925 (not b!467810) b_and!19895 (not b_next!11497) (not b!467809))
(check-sat b_and!19895 (not b_next!11497))
