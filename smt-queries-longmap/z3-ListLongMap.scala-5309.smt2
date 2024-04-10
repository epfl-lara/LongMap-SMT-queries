; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71076 () Bool)

(assert start!71076)

(declare-fun b_free!13263 () Bool)

(declare-fun b_next!13263 () Bool)

(assert (=> start!71076 (= b_free!13263 (not b_next!13263))))

(declare-fun tp!46546 () Bool)

(declare-fun b_and!22177 () Bool)

(assert (=> start!71076 (= tp!46546 b_and!22177)))

(declare-fun b!825408 () Bool)

(declare-fun e!459410 () Bool)

(declare-fun e!459415 () Bool)

(declare-fun mapRes!24082 () Bool)

(assert (=> b!825408 (= e!459410 (and e!459415 mapRes!24082))))

(declare-fun condMapEmpty!24082 () Bool)

(declare-datatypes ((V!24965 0))(
  ( (V!24966 (val!7534 Int)) )
))
(declare-datatypes ((ValueCell!7071 0))(
  ( (ValueCellFull!7071 (v!9967 V!24965)) (EmptyCell!7071) )
))
(declare-datatypes ((array!46130 0))(
  ( (array!46131 (arr!22111 (Array (_ BitVec 32) ValueCell!7071)) (size!22532 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46130)

(declare-fun mapDefault!24082 () ValueCell!7071)

(assert (=> b!825408 (= condMapEmpty!24082 (= (arr!22111 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7071)) mapDefault!24082)))))

(declare-fun b!825409 () Bool)

(declare-fun res!562678 () Bool)

(declare-fun e!459413 () Bool)

(assert (=> b!825409 (=> (not res!562678) (not e!459413))))

(declare-datatypes ((array!46132 0))(
  ( (array!46133 (arr!22112 (Array (_ BitVec 32) (_ BitVec 64))) (size!22533 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46132)

(declare-datatypes ((List!15777 0))(
  ( (Nil!15774) (Cons!15773 (h!16902 (_ BitVec 64)) (t!22122 List!15777)) )
))
(declare-fun arrayNoDuplicates!0 (array!46132 (_ BitVec 32) List!15777) Bool)

(assert (=> b!825409 (= res!562678 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15774))))

(declare-fun res!562681 () Bool)

(assert (=> start!71076 (=> (not res!562681) (not e!459413))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71076 (= res!562681 (validMask!0 mask!1312))))

(assert (=> start!71076 e!459413))

(declare-fun tp_is_empty!14973 () Bool)

(assert (=> start!71076 tp_is_empty!14973))

(declare-fun array_inv!17627 (array!46132) Bool)

(assert (=> start!71076 (array_inv!17627 _keys!976)))

(assert (=> start!71076 true))

(declare-fun array_inv!17628 (array!46130) Bool)

(assert (=> start!71076 (and (array_inv!17628 _values!788) e!459410)))

(assert (=> start!71076 tp!46546))

(declare-fun mapNonEmpty!24082 () Bool)

(declare-fun tp!46545 () Bool)

(declare-fun e!459412 () Bool)

(assert (=> mapNonEmpty!24082 (= mapRes!24082 (and tp!46545 e!459412))))

(declare-fun mapRest!24082 () (Array (_ BitVec 32) ValueCell!7071))

(declare-fun mapValue!24082 () ValueCell!7071)

(declare-fun mapKey!24082 () (_ BitVec 32))

(assert (=> mapNonEmpty!24082 (= (arr!22111 _values!788) (store mapRest!24082 mapKey!24082 mapValue!24082))))

(declare-fun b!825410 () Bool)

(declare-fun e!459417 () Bool)

(assert (=> b!825410 (= e!459417 true)))

(declare-datatypes ((tuple2!9972 0))(
  ( (tuple2!9973 (_1!4997 (_ BitVec 64)) (_2!4997 V!24965)) )
))
(declare-fun lt!372637 () tuple2!9972)

(declare-datatypes ((List!15778 0))(
  ( (Nil!15775) (Cons!15774 (h!16903 tuple2!9972) (t!22123 List!15778)) )
))
(declare-datatypes ((ListLongMap!8795 0))(
  ( (ListLongMap!8796 (toList!4413 List!15778)) )
))
(declare-fun lt!372632 () ListLongMap!8795)

(declare-fun lt!372629 () tuple2!9972)

(declare-fun lt!372636 () ListLongMap!8795)

(declare-fun +!1920 (ListLongMap!8795 tuple2!9972) ListLongMap!8795)

(assert (=> b!825410 (= lt!372632 (+!1920 (+!1920 lt!372636 lt!372629) lt!372637))))

(declare-fun lt!372642 () ListLongMap!8795)

(declare-fun lt!372638 () ListLongMap!8795)

(declare-fun lt!372630 () ListLongMap!8795)

(assert (=> b!825410 (and (= lt!372642 lt!372638) (= lt!372630 lt!372638) (= lt!372630 lt!372642))))

(declare-fun lt!372635 () ListLongMap!8795)

(assert (=> b!825410 (= lt!372638 (+!1920 lt!372635 lt!372629))))

(declare-fun lt!372641 () ListLongMap!8795)

(assert (=> b!825410 (= lt!372642 (+!1920 lt!372641 lt!372629))))

(declare-fun zeroValueBefore!34 () V!24965)

(declare-datatypes ((Unit!28291 0))(
  ( (Unit!28292) )
))
(declare-fun lt!372634 () Unit!28291)

(declare-fun zeroValueAfter!34 () V!24965)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!207 (ListLongMap!8795 (_ BitVec 64) V!24965 V!24965) Unit!28291)

(assert (=> b!825410 (= lt!372634 (addSameAsAddTwiceSameKeyDiffValues!207 lt!372641 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34 zeroValueAfter!34))))

(declare-fun e!459416 () Bool)

(assert (=> b!825410 e!459416))

(declare-fun res!562679 () Bool)

(assert (=> b!825410 (=> (not res!562679) (not e!459416))))

(declare-fun lt!372631 () ListLongMap!8795)

(assert (=> b!825410 (= res!562679 (= lt!372631 lt!372635))))

(declare-fun lt!372640 () tuple2!9972)

(assert (=> b!825410 (= lt!372635 (+!1920 lt!372641 lt!372640))))

(assert (=> b!825410 (= lt!372641 (+!1920 lt!372636 lt!372637))))

(assert (=> b!825410 (= lt!372629 (tuple2!9973 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(declare-fun e!459411 () Bool)

(assert (=> b!825410 e!459411))

(declare-fun res!562675 () Bool)

(assert (=> b!825410 (=> (not res!562675) (not e!459411))))

(assert (=> b!825410 (= res!562675 (= lt!372631 (+!1920 (+!1920 lt!372636 lt!372640) lt!372637)))))

(declare-fun minValue!754 () V!24965)

(assert (=> b!825410 (= lt!372637 (tuple2!9973 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(assert (=> b!825410 (= lt!372640 (tuple2!9973 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMap!2547 (array!46132 array!46130 (_ BitVec 32) (_ BitVec 32) V!24965 V!24965 (_ BitVec 32) Int) ListLongMap!8795)

(assert (=> b!825410 (= lt!372630 (getCurrentListMap!2547 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!825410 (= lt!372631 (getCurrentListMap!2547 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!825411 () Bool)

(assert (=> b!825411 (= e!459412 tp_is_empty!14973)))

(declare-fun lt!372633 () ListLongMap!8795)

(declare-fun b!825412 () Bool)

(assert (=> b!825412 (= e!459411 (= lt!372630 (+!1920 (+!1920 lt!372633 (tuple2!9973 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) lt!372637)))))

(declare-fun b!825413 () Bool)

(assert (=> b!825413 (= e!459413 (not e!459417))))

(declare-fun res!562677 () Bool)

(assert (=> b!825413 (=> res!562677 e!459417)))

(assert (=> b!825413 (= res!562677 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!825413 (= lt!372636 lt!372633)))

(declare-fun lt!372639 () Unit!28291)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!536 (array!46132 array!46130 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24965 V!24965 V!24965 V!24965 (_ BitVec 32) Int) Unit!28291)

(assert (=> b!825413 (= lt!372639 (lemmaNoChangeToArrayThenSameMapNoExtras!536 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2426 (array!46132 array!46130 (_ BitVec 32) (_ BitVec 32) V!24965 V!24965 (_ BitVec 32) Int) ListLongMap!8795)

(assert (=> b!825413 (= lt!372633 (getCurrentListMapNoExtraKeys!2426 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!825413 (= lt!372636 (getCurrentListMapNoExtraKeys!2426 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!825414 () Bool)

(declare-fun res!562676 () Bool)

(assert (=> b!825414 (=> (not res!562676) (not e!459413))))

(assert (=> b!825414 (= res!562676 (and (= (size!22532 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22533 _keys!976) (size!22532 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!24082 () Bool)

(assert (=> mapIsEmpty!24082 mapRes!24082))

(declare-fun b!825415 () Bool)

(assert (=> b!825415 (= e!459415 tp_is_empty!14973)))

(declare-fun b!825416 () Bool)

(assert (=> b!825416 (= e!459416 (= lt!372630 (+!1920 (+!1920 lt!372633 lt!372637) lt!372629)))))

(declare-fun b!825417 () Bool)

(declare-fun res!562680 () Bool)

(assert (=> b!825417 (=> (not res!562680) (not e!459413))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46132 (_ BitVec 32)) Bool)

(assert (=> b!825417 (= res!562680 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(assert (= (and start!71076 res!562681) b!825414))

(assert (= (and b!825414 res!562676) b!825417))

(assert (= (and b!825417 res!562680) b!825409))

(assert (= (and b!825409 res!562678) b!825413))

(assert (= (and b!825413 (not res!562677)) b!825410))

(assert (= (and b!825410 res!562675) b!825412))

(assert (= (and b!825410 res!562679) b!825416))

(assert (= (and b!825408 condMapEmpty!24082) mapIsEmpty!24082))

(assert (= (and b!825408 (not condMapEmpty!24082)) mapNonEmpty!24082))

(get-info :version)

(assert (= (and mapNonEmpty!24082 ((_ is ValueCellFull!7071) mapValue!24082)) b!825411))

(assert (= (and b!825408 ((_ is ValueCellFull!7071) mapDefault!24082)) b!825415))

(assert (= start!71076 b!825408))

(declare-fun m!767549 () Bool)

(assert (=> start!71076 m!767549))

(declare-fun m!767551 () Bool)

(assert (=> start!71076 m!767551))

(declare-fun m!767553 () Bool)

(assert (=> start!71076 m!767553))

(declare-fun m!767555 () Bool)

(assert (=> mapNonEmpty!24082 m!767555))

(declare-fun m!767557 () Bool)

(assert (=> b!825410 m!767557))

(declare-fun m!767559 () Bool)

(assert (=> b!825410 m!767559))

(assert (=> b!825410 m!767557))

(declare-fun m!767561 () Bool)

(assert (=> b!825410 m!767561))

(declare-fun m!767563 () Bool)

(assert (=> b!825410 m!767563))

(declare-fun m!767565 () Bool)

(assert (=> b!825410 m!767565))

(declare-fun m!767567 () Bool)

(assert (=> b!825410 m!767567))

(declare-fun m!767569 () Bool)

(assert (=> b!825410 m!767569))

(declare-fun m!767571 () Bool)

(assert (=> b!825410 m!767571))

(declare-fun m!767573 () Bool)

(assert (=> b!825410 m!767573))

(assert (=> b!825410 m!767559))

(declare-fun m!767575 () Bool)

(assert (=> b!825410 m!767575))

(declare-fun m!767577 () Bool)

(assert (=> b!825410 m!767577))

(declare-fun m!767579 () Bool)

(assert (=> b!825413 m!767579))

(declare-fun m!767581 () Bool)

(assert (=> b!825413 m!767581))

(declare-fun m!767583 () Bool)

(assert (=> b!825413 m!767583))

(declare-fun m!767585 () Bool)

(assert (=> b!825412 m!767585))

(assert (=> b!825412 m!767585))

(declare-fun m!767587 () Bool)

(assert (=> b!825412 m!767587))

(declare-fun m!767589 () Bool)

(assert (=> b!825416 m!767589))

(assert (=> b!825416 m!767589))

(declare-fun m!767591 () Bool)

(assert (=> b!825416 m!767591))

(declare-fun m!767593 () Bool)

(assert (=> b!825409 m!767593))

(declare-fun m!767595 () Bool)

(assert (=> b!825417 m!767595))

(check-sat (not b!825416) (not b!825413) (not b!825410) (not b!825409) tp_is_empty!14973 (not b!825412) (not b_next!13263) (not b!825417) (not start!71076) (not mapNonEmpty!24082) b_and!22177)
(check-sat b_and!22177 (not b_next!13263))
