; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41968 () Bool)

(assert start!41968)

(declare-fun b_free!11541 () Bool)

(declare-fun b_next!11541 () Bool)

(assert (=> start!41968 (= b_free!11541 (not b_next!11541))))

(declare-fun tp!40638 () Bool)

(declare-fun b_and!19939 () Bool)

(assert (=> start!41968 (= tp!40638 b_and!19939)))

(declare-fun res!280000 () Bool)

(declare-fun e!274231 () Bool)

(assert (=> start!41968 (=> (not res!280000) (not e!274231))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41968 (= res!280000 (validMask!0 mask!1365))))

(assert (=> start!41968 e!274231))

(declare-fun tp_is_empty!12969 () Bool)

(assert (=> start!41968 tp_is_empty!12969))

(assert (=> start!41968 tp!40638))

(assert (=> start!41968 true))

(declare-datatypes ((array!29715 0))(
  ( (array!29716 (arr!14283 (Array (_ BitVec 32) (_ BitVec 64))) (size!14635 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29715)

(declare-fun array_inv!10312 (array!29715) Bool)

(assert (=> start!41968 (array_inv!10312 _keys!1025)))

(declare-datatypes ((V!18397 0))(
  ( (V!18398 (val!6529 Int)) )
))
(declare-datatypes ((ValueCell!6141 0))(
  ( (ValueCellFull!6141 (v!8818 V!18397)) (EmptyCell!6141) )
))
(declare-datatypes ((array!29717 0))(
  ( (array!29718 (arr!14284 (Array (_ BitVec 32) ValueCell!6141)) (size!14636 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29717)

(declare-fun e!274235 () Bool)

(declare-fun array_inv!10313 (array!29717) Bool)

(assert (=> start!41968 (and (array_inv!10313 _values!833) e!274235)))

(declare-fun b!468546 () Bool)

(declare-fun e!274230 () Bool)

(assert (=> b!468546 (= e!274230 tp_is_empty!12969)))

(declare-fun b!468547 () Bool)

(declare-fun res!280002 () Bool)

(assert (=> b!468547 (=> (not res!280002) (not e!274231))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29715 (_ BitVec 32)) Bool)

(assert (=> b!468547 (= res!280002 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!468548 () Bool)

(declare-fun res!280004 () Bool)

(assert (=> b!468548 (=> (not res!280004) (not e!274231))))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(assert (=> b!468548 (= res!280004 (and (= (size!14636 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14635 _keys!1025) (size!14636 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!468549 () Bool)

(declare-fun res!280003 () Bool)

(assert (=> b!468549 (=> (not res!280003) (not e!274231))))

(declare-datatypes ((List!8668 0))(
  ( (Nil!8665) (Cons!8664 (h!9520 (_ BitVec 64)) (t!14626 List!8668)) )
))
(declare-fun arrayNoDuplicates!0 (array!29715 (_ BitVec 32) List!8668) Bool)

(assert (=> b!468549 (= res!280003 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8665))))

(declare-fun b!468550 () Bool)

(declare-fun e!274232 () Bool)

(declare-fun mapRes!21148 () Bool)

(assert (=> b!468550 (= e!274235 (and e!274232 mapRes!21148))))

(declare-fun condMapEmpty!21148 () Bool)

(declare-fun mapDefault!21148 () ValueCell!6141)

(assert (=> b!468550 (= condMapEmpty!21148 (= (arr!14284 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6141)) mapDefault!21148)))))

(declare-fun b!468551 () Bool)

(declare-fun e!274233 () Bool)

(assert (=> b!468551 (= e!274233 true)))

(declare-datatypes ((tuple2!8582 0))(
  ( (tuple2!8583 (_1!4302 (_ BitVec 64)) (_2!4302 V!18397)) )
))
(declare-datatypes ((List!8669 0))(
  ( (Nil!8666) (Cons!8665 (h!9521 tuple2!8582) (t!14627 List!8669)) )
))
(declare-datatypes ((ListLongMap!7495 0))(
  ( (ListLongMap!7496 (toList!3763 List!8669)) )
))
(declare-fun lt!211936 () ListLongMap!7495)

(declare-fun lt!211934 () tuple2!8582)

(declare-fun minValueBefore!38 () V!18397)

(declare-fun +!1675 (ListLongMap!7495 tuple2!8582) ListLongMap!7495)

(assert (=> b!468551 (= (+!1675 lt!211936 lt!211934) (+!1675 (+!1675 lt!211936 (tuple2!8583 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) lt!211934))))

(declare-fun minValueAfter!38 () V!18397)

(assert (=> b!468551 (= lt!211934 (tuple2!8583 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))

(declare-datatypes ((Unit!13681 0))(
  ( (Unit!13682) )
))
(declare-fun lt!211935 () Unit!13681)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!88 (ListLongMap!7495 (_ BitVec 64) V!18397 V!18397) Unit!13681)

(assert (=> b!468551 (= lt!211935 (addSameAsAddTwiceSameKeyDiffValues!88 lt!211936 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38 minValueAfter!38))))

(declare-fun defaultEntry!841 () Int)

(declare-fun lt!211939 () ListLongMap!7495)

(declare-fun zeroValue!794 () V!18397)

(declare-fun getCurrentListMap!2189 (array!29715 array!29717 (_ BitVec 32) (_ BitVec 32) V!18397 V!18397 (_ BitVec 32) Int) ListLongMap!7495)

(assert (=> b!468551 (= lt!211939 (getCurrentListMap!2189 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!211933 () ListLongMap!7495)

(assert (=> b!468551 (= lt!211933 (getCurrentListMap!2189 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!468552 () Bool)

(assert (=> b!468552 (= e!274231 (not e!274233))))

(declare-fun res!280001 () Bool)

(assert (=> b!468552 (=> res!280001 e!274233)))

(assert (=> b!468552 (= res!280001 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!211938 () ListLongMap!7495)

(assert (=> b!468552 (= lt!211936 lt!211938)))

(declare-fun lt!211937 () Unit!13681)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!114 (array!29715 array!29717 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18397 V!18397 V!18397 V!18397 (_ BitVec 32) Int) Unit!13681)

(assert (=> b!468552 (= lt!211937 (lemmaNoChangeToArrayThenSameMapNoExtras!114 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1934 (array!29715 array!29717 (_ BitVec 32) (_ BitVec 32) V!18397 V!18397 (_ BitVec 32) Int) ListLongMap!7495)

(assert (=> b!468552 (= lt!211938 (getCurrentListMapNoExtraKeys!1934 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!468552 (= lt!211936 (getCurrentListMapNoExtraKeys!1934 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapIsEmpty!21148 () Bool)

(assert (=> mapIsEmpty!21148 mapRes!21148))

(declare-fun mapNonEmpty!21148 () Bool)

(declare-fun tp!40639 () Bool)

(assert (=> mapNonEmpty!21148 (= mapRes!21148 (and tp!40639 e!274230))))

(declare-fun mapRest!21148 () (Array (_ BitVec 32) ValueCell!6141))

(declare-fun mapKey!21148 () (_ BitVec 32))

(declare-fun mapValue!21148 () ValueCell!6141)

(assert (=> mapNonEmpty!21148 (= (arr!14284 _values!833) (store mapRest!21148 mapKey!21148 mapValue!21148))))

(declare-fun b!468553 () Bool)

(assert (=> b!468553 (= e!274232 tp_is_empty!12969)))

(assert (= (and start!41968 res!280000) b!468548))

(assert (= (and b!468548 res!280004) b!468547))

(assert (= (and b!468547 res!280002) b!468549))

(assert (= (and b!468549 res!280003) b!468552))

(assert (= (and b!468552 (not res!280001)) b!468551))

(assert (= (and b!468550 condMapEmpty!21148) mapIsEmpty!21148))

(assert (= (and b!468550 (not condMapEmpty!21148)) mapNonEmpty!21148))

(get-info :version)

(assert (= (and mapNonEmpty!21148 ((_ is ValueCellFull!6141) mapValue!21148)) b!468546))

(assert (= (and b!468550 ((_ is ValueCellFull!6141) mapDefault!21148)) b!468553))

(assert (= start!41968 b!468550))

(declare-fun m!450511 () Bool)

(assert (=> b!468552 m!450511))

(declare-fun m!450513 () Bool)

(assert (=> b!468552 m!450513))

(declare-fun m!450515 () Bool)

(assert (=> b!468552 m!450515))

(declare-fun m!450517 () Bool)

(assert (=> start!41968 m!450517))

(declare-fun m!450519 () Bool)

(assert (=> start!41968 m!450519))

(declare-fun m!450521 () Bool)

(assert (=> start!41968 m!450521))

(declare-fun m!450523 () Bool)

(assert (=> b!468547 m!450523))

(declare-fun m!450525 () Bool)

(assert (=> mapNonEmpty!21148 m!450525))

(declare-fun m!450527 () Bool)

(assert (=> b!468551 m!450527))

(declare-fun m!450529 () Bool)

(assert (=> b!468551 m!450529))

(declare-fun m!450531 () Bool)

(assert (=> b!468551 m!450531))

(declare-fun m!450533 () Bool)

(assert (=> b!468551 m!450533))

(assert (=> b!468551 m!450531))

(declare-fun m!450535 () Bool)

(assert (=> b!468551 m!450535))

(declare-fun m!450537 () Bool)

(assert (=> b!468551 m!450537))

(declare-fun m!450539 () Bool)

(assert (=> b!468549 m!450539))

(check-sat (not b!468549) (not start!41968) tp_is_empty!12969 (not b!468547) (not b!468552) (not mapNonEmpty!21148) (not b_next!11541) (not b!468551) b_and!19939)
(check-sat b_and!19939 (not b_next!11541))
