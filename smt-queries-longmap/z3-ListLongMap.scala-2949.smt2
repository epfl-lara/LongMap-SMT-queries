; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41900 () Bool)

(assert start!41900)

(declare-fun b_free!11503 () Bool)

(declare-fun b_next!11503 () Bool)

(assert (=> start!41900 (= b_free!11503 (not b_next!11503))))

(declare-fun tp!40522 () Bool)

(declare-fun b_and!19901 () Bool)

(assert (=> start!41900 (= tp!40522 b_and!19901)))

(declare-fun b!467881 () Bool)

(declare-fun e!273759 () Bool)

(assert (=> b!467881 (= e!273759 true)))

(declare-datatypes ((V!18347 0))(
  ( (V!18348 (val!6510 Int)) )
))
(declare-fun minValueBefore!38 () V!18347)

(declare-fun zeroValue!794 () V!18347)

(declare-fun defaultEntry!841 () Int)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-datatypes ((tuple2!8478 0))(
  ( (tuple2!8479 (_1!4250 (_ BitVec 64)) (_2!4250 V!18347)) )
))
(declare-datatypes ((List!8559 0))(
  ( (Nil!8556) (Cons!8555 (h!9411 tuple2!8478) (t!14507 List!8559)) )
))
(declare-datatypes ((ListLongMap!7393 0))(
  ( (ListLongMap!7394 (toList!3712 List!8559)) )
))
(declare-fun lt!211597 () ListLongMap!7393)

(declare-datatypes ((array!29630 0))(
  ( (array!29631 (arr!14241 (Array (_ BitVec 32) (_ BitVec 64))) (size!14593 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29630)

(declare-datatypes ((ValueCell!6122 0))(
  ( (ValueCellFull!6122 (v!8800 V!18347)) (EmptyCell!6122) )
))
(declare-datatypes ((array!29632 0))(
  ( (array!29633 (arr!14242 (Array (_ BitVec 32) ValueCell!6122)) (size!14594 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29632)

(declare-fun getCurrentListMap!2142 (array!29630 array!29632 (_ BitVec 32) (_ BitVec 32) V!18347 V!18347 (_ BitVec 32) Int) ListLongMap!7393)

(assert (=> b!467881 (= lt!211597 (getCurrentListMap!2142 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!467882 () Bool)

(declare-fun res!279650 () Bool)

(declare-fun e!273755 () Bool)

(assert (=> b!467882 (=> (not res!279650) (not e!273755))))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(assert (=> b!467882 (= res!279650 (and (= (size!14594 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14593 _keys!1025) (size!14594 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!467883 () Bool)

(declare-fun res!279654 () Bool)

(assert (=> b!467883 (=> (not res!279654) (not e!273755))))

(declare-datatypes ((List!8560 0))(
  ( (Nil!8557) (Cons!8556 (h!9412 (_ BitVec 64)) (t!14508 List!8560)) )
))
(declare-fun arrayNoDuplicates!0 (array!29630 (_ BitVec 32) List!8560) Bool)

(assert (=> b!467883 (= res!279654 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8557))))

(declare-fun b!467884 () Bool)

(declare-fun e!273758 () Bool)

(declare-fun tp_is_empty!12931 () Bool)

(assert (=> b!467884 (= e!273758 tp_is_empty!12931)))

(declare-fun mapIsEmpty!21088 () Bool)

(declare-fun mapRes!21088 () Bool)

(assert (=> mapIsEmpty!21088 mapRes!21088))

(declare-fun b!467885 () Bool)

(declare-fun e!273756 () Bool)

(declare-fun e!273760 () Bool)

(assert (=> b!467885 (= e!273756 (and e!273760 mapRes!21088))))

(declare-fun condMapEmpty!21088 () Bool)

(declare-fun mapDefault!21088 () ValueCell!6122)

(assert (=> b!467885 (= condMapEmpty!21088 (= (arr!14242 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6122)) mapDefault!21088)))))

(declare-fun b!467886 () Bool)

(assert (=> b!467886 (= e!273755 (not e!273759))))

(declare-fun res!279651 () Bool)

(assert (=> b!467886 (=> res!279651 e!273759)))

(assert (=> b!467886 (= res!279651 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!211596 () ListLongMap!7393)

(declare-fun lt!211598 () ListLongMap!7393)

(assert (=> b!467886 (= lt!211596 lt!211598)))

(declare-datatypes ((Unit!13634 0))(
  ( (Unit!13635) )
))
(declare-fun lt!211599 () Unit!13634)

(declare-fun minValueAfter!38 () V!18347)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!93 (array!29630 array!29632 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18347 V!18347 V!18347 V!18347 (_ BitVec 32) Int) Unit!13634)

(assert (=> b!467886 (= lt!211599 (lemmaNoChangeToArrayThenSameMapNoExtras!93 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1933 (array!29630 array!29632 (_ BitVec 32) (_ BitVec 32) V!18347 V!18347 (_ BitVec 32) Int) ListLongMap!7393)

(assert (=> b!467886 (= lt!211598 (getCurrentListMapNoExtraKeys!1933 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!467886 (= lt!211596 (getCurrentListMapNoExtraKeys!1933 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!467887 () Bool)

(declare-fun res!279653 () Bool)

(assert (=> b!467887 (=> (not res!279653) (not e!273755))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29630 (_ BitVec 32)) Bool)

(assert (=> b!467887 (= res!279653 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun res!279652 () Bool)

(assert (=> start!41900 (=> (not res!279652) (not e!273755))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41900 (= res!279652 (validMask!0 mask!1365))))

(assert (=> start!41900 e!273755))

(assert (=> start!41900 tp_is_empty!12931))

(assert (=> start!41900 tp!40522))

(assert (=> start!41900 true))

(declare-fun array_inv!10372 (array!29630) Bool)

(assert (=> start!41900 (array_inv!10372 _keys!1025)))

(declare-fun array_inv!10373 (array!29632) Bool)

(assert (=> start!41900 (and (array_inv!10373 _values!833) e!273756)))

(declare-fun b!467888 () Bool)

(assert (=> b!467888 (= e!273760 tp_is_empty!12931)))

(declare-fun mapNonEmpty!21088 () Bool)

(declare-fun tp!40521 () Bool)

(assert (=> mapNonEmpty!21088 (= mapRes!21088 (and tp!40521 e!273758))))

(declare-fun mapValue!21088 () ValueCell!6122)

(declare-fun mapKey!21088 () (_ BitVec 32))

(declare-fun mapRest!21088 () (Array (_ BitVec 32) ValueCell!6122))

(assert (=> mapNonEmpty!21088 (= (arr!14242 _values!833) (store mapRest!21088 mapKey!21088 mapValue!21088))))

(assert (= (and start!41900 res!279652) b!467882))

(assert (= (and b!467882 res!279650) b!467887))

(assert (= (and b!467887 res!279653) b!467883))

(assert (= (and b!467883 res!279654) b!467886))

(assert (= (and b!467886 (not res!279651)) b!467881))

(assert (= (and b!467885 condMapEmpty!21088) mapIsEmpty!21088))

(assert (= (and b!467885 (not condMapEmpty!21088)) mapNonEmpty!21088))

(get-info :version)

(assert (= (and mapNonEmpty!21088 ((_ is ValueCellFull!6122) mapValue!21088)) b!467884))

(assert (= (and b!467885 ((_ is ValueCellFull!6122) mapDefault!21088)) b!467888))

(assert (= start!41900 b!467885))

(declare-fun m!450191 () Bool)

(assert (=> b!467886 m!450191))

(declare-fun m!450193 () Bool)

(assert (=> b!467886 m!450193))

(declare-fun m!450195 () Bool)

(assert (=> b!467886 m!450195))

(declare-fun m!450197 () Bool)

(assert (=> start!41900 m!450197))

(declare-fun m!450199 () Bool)

(assert (=> start!41900 m!450199))

(declare-fun m!450201 () Bool)

(assert (=> start!41900 m!450201))

(declare-fun m!450203 () Bool)

(assert (=> b!467883 m!450203))

(declare-fun m!450205 () Bool)

(assert (=> b!467887 m!450205))

(declare-fun m!450207 () Bool)

(assert (=> mapNonEmpty!21088 m!450207))

(declare-fun m!450209 () Bool)

(assert (=> b!467881 m!450209))

(check-sat (not b!467886) (not mapNonEmpty!21088) (not b!467881) (not start!41900) (not b_next!11503) tp_is_empty!12931 (not b!467887) (not b!467883) b_and!19901)
(check-sat b_and!19901 (not b_next!11503))
