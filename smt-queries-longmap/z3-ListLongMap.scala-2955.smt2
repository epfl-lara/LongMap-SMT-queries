; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41952 () Bool)

(assert start!41952)

(declare-fun b_free!11539 () Bool)

(declare-fun b_next!11539 () Bool)

(assert (=> start!41952 (= b_free!11539 (not b_next!11539))))

(declare-fun tp!40632 () Bool)

(declare-fun b_and!19947 () Bool)

(assert (=> start!41952 (= tp!40632 b_and!19947)))

(declare-fun b!468461 () Bool)

(declare-fun res!279981 () Bool)

(declare-fun e!274175 () Bool)

(assert (=> b!468461 (=> (not res!279981) (not e!274175))))

(declare-datatypes ((array!29698 0))(
  ( (array!29699 (arr!14274 (Array (_ BitVec 32) (_ BitVec 64))) (size!14626 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29698)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29698 (_ BitVec 32)) Bool)

(assert (=> b!468461 (= res!279981 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!468463 () Bool)

(declare-fun e!274178 () Bool)

(assert (=> b!468463 (= e!274178 true)))

(declare-datatypes ((V!18395 0))(
  ( (V!18396 (val!6528 Int)) )
))
(declare-datatypes ((tuple2!8500 0))(
  ( (tuple2!8501 (_1!4261 (_ BitVec 64)) (_2!4261 V!18395)) )
))
(declare-datatypes ((List!8579 0))(
  ( (Nil!8576) (Cons!8575 (h!9431 tuple2!8500) (t!14529 List!8579)) )
))
(declare-datatypes ((ListLongMap!7415 0))(
  ( (ListLongMap!7416 (toList!3723 List!8579)) )
))
(declare-fun lt!211930 () ListLongMap!7415)

(declare-fun lt!211928 () tuple2!8500)

(declare-fun minValueBefore!38 () V!18395)

(declare-fun +!1686 (ListLongMap!7415 tuple2!8500) ListLongMap!7415)

(assert (=> b!468463 (= (+!1686 lt!211930 lt!211928) (+!1686 (+!1686 lt!211930 (tuple2!8501 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) lt!211928))))

(declare-fun minValueAfter!38 () V!18395)

(assert (=> b!468463 (= lt!211928 (tuple2!8501 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))

(declare-datatypes ((Unit!13655 0))(
  ( (Unit!13656) )
))
(declare-fun lt!211929 () Unit!13655)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!92 (ListLongMap!7415 (_ BitVec 64) V!18395 V!18395) Unit!13655)

(assert (=> b!468463 (= lt!211929 (addSameAsAddTwiceSameKeyDiffValues!92 lt!211930 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38 minValueAfter!38))))

(declare-fun zeroValue!794 () V!18395)

(declare-fun defaultEntry!841 () Int)

(declare-fun lt!211927 () ListLongMap!7415)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((ValueCell!6140 0))(
  ( (ValueCellFull!6140 (v!8818 V!18395)) (EmptyCell!6140) )
))
(declare-datatypes ((array!29700 0))(
  ( (array!29701 (arr!14275 (Array (_ BitVec 32) ValueCell!6140)) (size!14627 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29700)

(declare-fun getCurrentListMap!2152 (array!29698 array!29700 (_ BitVec 32) (_ BitVec 32) V!18395 V!18395 (_ BitVec 32) Int) ListLongMap!7415)

(assert (=> b!468463 (= lt!211927 (getCurrentListMap!2152 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!211925 () ListLongMap!7415)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(assert (=> b!468463 (= lt!211925 (getCurrentListMap!2152 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!468464 () Bool)

(declare-fun e!274173 () Bool)

(declare-fun tp_is_empty!12967 () Bool)

(assert (=> b!468464 (= e!274173 tp_is_empty!12967)))

(declare-fun mapIsEmpty!21145 () Bool)

(declare-fun mapRes!21145 () Bool)

(assert (=> mapIsEmpty!21145 mapRes!21145))

(declare-fun mapNonEmpty!21145 () Bool)

(declare-fun tp!40633 () Bool)

(declare-fun e!274174 () Bool)

(assert (=> mapNonEmpty!21145 (= mapRes!21145 (and tp!40633 e!274174))))

(declare-fun mapKey!21145 () (_ BitVec 32))

(declare-fun mapRest!21145 () (Array (_ BitVec 32) ValueCell!6140))

(declare-fun mapValue!21145 () ValueCell!6140)

(assert (=> mapNonEmpty!21145 (= (arr!14275 _values!833) (store mapRest!21145 mapKey!21145 mapValue!21145))))

(declare-fun b!468465 () Bool)

(declare-fun e!274176 () Bool)

(assert (=> b!468465 (= e!274176 (and e!274173 mapRes!21145))))

(declare-fun condMapEmpty!21145 () Bool)

(declare-fun mapDefault!21145 () ValueCell!6140)

(assert (=> b!468465 (= condMapEmpty!21145 (= (arr!14275 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6140)) mapDefault!21145)))))

(declare-fun b!468466 () Bool)

(assert (=> b!468466 (= e!274175 (not e!274178))))

(declare-fun res!279982 () Bool)

(assert (=> b!468466 (=> res!279982 e!274178)))

(assert (=> b!468466 (= res!279982 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!211924 () ListLongMap!7415)

(assert (=> b!468466 (= lt!211930 lt!211924)))

(declare-fun lt!211926 () Unit!13655)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!103 (array!29698 array!29700 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18395 V!18395 V!18395 V!18395 (_ BitVec 32) Int) Unit!13655)

(assert (=> b!468466 (= lt!211926 (lemmaNoChangeToArrayThenSameMapNoExtras!103 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1943 (array!29698 array!29700 (_ BitVec 32) (_ BitVec 32) V!18395 V!18395 (_ BitVec 32) Int) ListLongMap!7415)

(assert (=> b!468466 (= lt!211924 (getCurrentListMapNoExtraKeys!1943 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!468466 (= lt!211930 (getCurrentListMapNoExtraKeys!1943 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!468467 () Bool)

(declare-fun res!279979 () Bool)

(assert (=> b!468467 (=> (not res!279979) (not e!274175))))

(assert (=> b!468467 (= res!279979 (and (= (size!14627 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14626 _keys!1025) (size!14627 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!468468 () Bool)

(assert (=> b!468468 (= e!274174 tp_is_empty!12967)))

(declare-fun b!468462 () Bool)

(declare-fun res!279978 () Bool)

(assert (=> b!468462 (=> (not res!279978) (not e!274175))))

(declare-datatypes ((List!8580 0))(
  ( (Nil!8577) (Cons!8576 (h!9432 (_ BitVec 64)) (t!14530 List!8580)) )
))
(declare-fun arrayNoDuplicates!0 (array!29698 (_ BitVec 32) List!8580) Bool)

(assert (=> b!468462 (= res!279978 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8577))))

(declare-fun res!279980 () Bool)

(assert (=> start!41952 (=> (not res!279980) (not e!274175))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41952 (= res!279980 (validMask!0 mask!1365))))

(assert (=> start!41952 e!274175))

(assert (=> start!41952 tp_is_empty!12967))

(assert (=> start!41952 tp!40632))

(assert (=> start!41952 true))

(declare-fun array_inv!10396 (array!29698) Bool)

(assert (=> start!41952 (array_inv!10396 _keys!1025)))

(declare-fun array_inv!10397 (array!29700) Bool)

(assert (=> start!41952 (and (array_inv!10397 _values!833) e!274176)))

(assert (= (and start!41952 res!279980) b!468467))

(assert (= (and b!468467 res!279979) b!468461))

(assert (= (and b!468461 res!279981) b!468462))

(assert (= (and b!468462 res!279978) b!468466))

(assert (= (and b!468466 (not res!279982)) b!468463))

(assert (= (and b!468465 condMapEmpty!21145) mapIsEmpty!21145))

(assert (= (and b!468465 (not condMapEmpty!21145)) mapNonEmpty!21145))

(get-info :version)

(assert (= (and mapNonEmpty!21145 ((_ is ValueCellFull!6140) mapValue!21145)) b!468468))

(assert (= (and b!468465 ((_ is ValueCellFull!6140) mapDefault!21145)) b!468464))

(assert (= start!41952 b!468465))

(declare-fun m!450663 () Bool)

(assert (=> b!468466 m!450663))

(declare-fun m!450665 () Bool)

(assert (=> b!468466 m!450665))

(declare-fun m!450667 () Bool)

(assert (=> b!468466 m!450667))

(declare-fun m!450669 () Bool)

(assert (=> b!468461 m!450669))

(declare-fun m!450671 () Bool)

(assert (=> b!468462 m!450671))

(declare-fun m!450673 () Bool)

(assert (=> mapNonEmpty!21145 m!450673))

(declare-fun m!450675 () Bool)

(assert (=> b!468463 m!450675))

(declare-fun m!450677 () Bool)

(assert (=> b!468463 m!450677))

(declare-fun m!450679 () Bool)

(assert (=> b!468463 m!450679))

(assert (=> b!468463 m!450677))

(declare-fun m!450681 () Bool)

(assert (=> b!468463 m!450681))

(declare-fun m!450683 () Bool)

(assert (=> b!468463 m!450683))

(declare-fun m!450685 () Bool)

(assert (=> b!468463 m!450685))

(declare-fun m!450687 () Bool)

(assert (=> start!41952 m!450687))

(declare-fun m!450689 () Bool)

(assert (=> start!41952 m!450689))

(declare-fun m!450691 () Bool)

(assert (=> start!41952 m!450691))

(check-sat (not b!468462) (not mapNonEmpty!21145) (not b!468466) b_and!19947 (not b_next!11539) (not b!468463) (not start!41952) (not b!468461) tp_is_empty!12967)
(check-sat b_and!19947 (not b_next!11539))
