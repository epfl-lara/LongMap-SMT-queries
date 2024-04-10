; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42432 () Bool)

(assert start!42432)

(declare-fun b_free!11907 () Bool)

(declare-fun b_next!11907 () Bool)

(assert (=> start!42432 (= b_free!11907 (not b_next!11907))))

(declare-fun tp!41755 () Bool)

(declare-fun b_and!20363 () Bool)

(assert (=> start!42432 (= tp!41755 b_and!20363)))

(declare-fun b!473456 () Bool)

(declare-fun res!282809 () Bool)

(declare-fun e!277764 () Bool)

(assert (=> b!473456 (=> (not res!282809) (not e!277764))))

(declare-datatypes ((array!30425 0))(
  ( (array!30426 (arr!14632 (Array (_ BitVec 32) (_ BitVec 64))) (size!14984 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30425)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30425 (_ BitVec 32)) Bool)

(assert (=> b!473456 (= res!282809 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!473457 () Bool)

(declare-fun e!277766 () Bool)

(assert (=> b!473457 (= e!277766 true)))

(declare-datatypes ((V!18885 0))(
  ( (V!18886 (val!6712 Int)) )
))
(declare-datatypes ((tuple2!8844 0))(
  ( (tuple2!8845 (_1!4433 (_ BitVec 64)) (_2!4433 V!18885)) )
))
(declare-datatypes ((List!8926 0))(
  ( (Nil!8923) (Cons!8922 (h!9778 tuple2!8844) (t!14896 List!8926)) )
))
(declare-datatypes ((ListLongMap!7757 0))(
  ( (ListLongMap!7758 (toList!3894 List!8926)) )
))
(declare-fun lt!215160 () ListLongMap!7757)

(declare-fun lt!215157 () tuple2!8844)

(declare-fun minValueBefore!38 () V!18885)

(declare-fun +!1731 (ListLongMap!7757 tuple2!8844) ListLongMap!7757)

(assert (=> b!473457 (= (+!1731 lt!215160 lt!215157) (+!1731 (+!1731 lt!215160 (tuple2!8845 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) lt!215157))))

(declare-fun minValueAfter!38 () V!18885)

(assert (=> b!473457 (= lt!215157 (tuple2!8845 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))

(declare-datatypes ((Unit!13944 0))(
  ( (Unit!13945) )
))
(declare-fun lt!215164 () Unit!13944)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!140 (ListLongMap!7757 (_ BitVec 64) V!18885 V!18885) Unit!13944)

(assert (=> b!473457 (= lt!215164 (addSameAsAddTwiceSameKeyDiffValues!140 lt!215160 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38 minValueAfter!38))))

(declare-fun lt!215158 () ListLongMap!7757)

(declare-fun zeroValue!794 () V!18885)

(assert (=> b!473457 (= lt!215160 (+!1731 lt!215158 (tuple2!8845 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794)))))

(declare-fun lt!215162 () ListLongMap!7757)

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((ValueCell!6324 0))(
  ( (ValueCellFull!6324 (v!9003 V!18885)) (EmptyCell!6324) )
))
(declare-datatypes ((array!30427 0))(
  ( (array!30428 (arr!14633 (Array (_ BitVec 32) ValueCell!6324)) (size!14985 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30427)

(declare-fun getCurrentListMap!2260 (array!30425 array!30427 (_ BitVec 32) (_ BitVec 32) V!18885 V!18885 (_ BitVec 32) Int) ListLongMap!7757)

(assert (=> b!473457 (= lt!215162 (getCurrentListMap!2260 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!215161 () ListLongMap!7757)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(assert (=> b!473457 (= lt!215161 (getCurrentListMap!2260 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!473458 () Bool)

(declare-fun e!277768 () Bool)

(declare-fun e!277765 () Bool)

(declare-fun mapRes!21715 () Bool)

(assert (=> b!473458 (= e!277768 (and e!277765 mapRes!21715))))

(declare-fun condMapEmpty!21715 () Bool)

(declare-fun mapDefault!21715 () ValueCell!6324)

(assert (=> b!473458 (= condMapEmpty!21715 (= (arr!14633 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6324)) mapDefault!21715)))))

(declare-fun b!473459 () Bool)

(declare-fun tp_is_empty!13335 () Bool)

(assert (=> b!473459 (= e!277765 tp_is_empty!13335)))

(declare-fun res!282807 () Bool)

(assert (=> start!42432 (=> (not res!282807) (not e!277764))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42432 (= res!282807 (validMask!0 mask!1365))))

(assert (=> start!42432 e!277764))

(assert (=> start!42432 tp_is_empty!13335))

(assert (=> start!42432 tp!41755))

(assert (=> start!42432 true))

(declare-fun array_inv!10554 (array!30425) Bool)

(assert (=> start!42432 (array_inv!10554 _keys!1025)))

(declare-fun array_inv!10555 (array!30427) Bool)

(assert (=> start!42432 (and (array_inv!10555 _values!833) e!277768)))

(declare-fun mapNonEmpty!21715 () Bool)

(declare-fun tp!41754 () Bool)

(declare-fun e!277767 () Bool)

(assert (=> mapNonEmpty!21715 (= mapRes!21715 (and tp!41754 e!277767))))

(declare-fun mapValue!21715 () ValueCell!6324)

(declare-fun mapKey!21715 () (_ BitVec 32))

(declare-fun mapRest!21715 () (Array (_ BitVec 32) ValueCell!6324))

(assert (=> mapNonEmpty!21715 (= (arr!14633 _values!833) (store mapRest!21715 mapKey!21715 mapValue!21715))))

(declare-fun mapIsEmpty!21715 () Bool)

(assert (=> mapIsEmpty!21715 mapRes!21715))

(declare-fun b!473460 () Bool)

(declare-fun res!282810 () Bool)

(assert (=> b!473460 (=> (not res!282810) (not e!277764))))

(assert (=> b!473460 (= res!282810 (and (= (size!14985 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14984 _keys!1025) (size!14985 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!473461 () Bool)

(assert (=> b!473461 (= e!277767 tp_is_empty!13335)))

(declare-fun b!473462 () Bool)

(declare-fun res!282811 () Bool)

(assert (=> b!473462 (=> (not res!282811) (not e!277764))))

(declare-datatypes ((List!8927 0))(
  ( (Nil!8924) (Cons!8923 (h!9779 (_ BitVec 64)) (t!14897 List!8927)) )
))
(declare-fun arrayNoDuplicates!0 (array!30425 (_ BitVec 32) List!8927) Bool)

(assert (=> b!473462 (= res!282811 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8924))))

(declare-fun b!473463 () Bool)

(assert (=> b!473463 (= e!277764 (not e!277766))))

(declare-fun res!282808 () Bool)

(assert (=> b!473463 (=> res!282808 e!277766)))

(assert (=> b!473463 (= res!282808 (or (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!215163 () ListLongMap!7757)

(assert (=> b!473463 (= lt!215158 lt!215163)))

(declare-fun lt!215159 () Unit!13944)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!234 (array!30425 array!30427 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18885 V!18885 V!18885 V!18885 (_ BitVec 32) Int) Unit!13944)

(assert (=> b!473463 (= lt!215159 (lemmaNoChangeToArrayThenSameMapNoExtras!234 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2054 (array!30425 array!30427 (_ BitVec 32) (_ BitVec 32) V!18885 V!18885 (_ BitVec 32) Int) ListLongMap!7757)

(assert (=> b!473463 (= lt!215163 (getCurrentListMapNoExtraKeys!2054 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!473463 (= lt!215158 (getCurrentListMapNoExtraKeys!2054 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (= (and start!42432 res!282807) b!473460))

(assert (= (and b!473460 res!282810) b!473456))

(assert (= (and b!473456 res!282809) b!473462))

(assert (= (and b!473462 res!282811) b!473463))

(assert (= (and b!473463 (not res!282808)) b!473457))

(assert (= (and b!473458 condMapEmpty!21715) mapIsEmpty!21715))

(assert (= (and b!473458 (not condMapEmpty!21715)) mapNonEmpty!21715))

(get-info :version)

(assert (= (and mapNonEmpty!21715 ((_ is ValueCellFull!6324) mapValue!21715)) b!473461))

(assert (= (and b!473458 ((_ is ValueCellFull!6324) mapDefault!21715)) b!473459))

(assert (= start!42432 b!473458))

(declare-fun m!455513 () Bool)

(assert (=> b!473457 m!455513))

(declare-fun m!455515 () Bool)

(assert (=> b!473457 m!455515))

(declare-fun m!455517 () Bool)

(assert (=> b!473457 m!455517))

(assert (=> b!473457 m!455513))

(declare-fun m!455519 () Bool)

(assert (=> b!473457 m!455519))

(declare-fun m!455521 () Bool)

(assert (=> b!473457 m!455521))

(declare-fun m!455523 () Bool)

(assert (=> b!473457 m!455523))

(declare-fun m!455525 () Bool)

(assert (=> b!473457 m!455525))

(declare-fun m!455527 () Bool)

(assert (=> b!473462 m!455527))

(declare-fun m!455529 () Bool)

(assert (=> b!473463 m!455529))

(declare-fun m!455531 () Bool)

(assert (=> b!473463 m!455531))

(declare-fun m!455533 () Bool)

(assert (=> b!473463 m!455533))

(declare-fun m!455535 () Bool)

(assert (=> b!473456 m!455535))

(declare-fun m!455537 () Bool)

(assert (=> mapNonEmpty!21715 m!455537))

(declare-fun m!455539 () Bool)

(assert (=> start!42432 m!455539))

(declare-fun m!455541 () Bool)

(assert (=> start!42432 m!455541))

(declare-fun m!455543 () Bool)

(assert (=> start!42432 m!455543))

(check-sat (not b!473463) b_and!20363 (not start!42432) (not b!473456) (not b_next!11907) (not mapNonEmpty!21715) tp_is_empty!13335 (not b!473457) (not b!473462))
(check-sat b_and!20363 (not b_next!11907))
