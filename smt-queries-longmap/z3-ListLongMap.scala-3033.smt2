; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42558 () Bool)

(assert start!42558)

(declare-fun b_free!12007 () Bool)

(declare-fun b_next!12007 () Bool)

(assert (=> start!42558 (= b_free!12007 (not b_next!12007))))

(declare-fun tp!42061 () Bool)

(declare-fun b_and!20461 () Bool)

(assert (=> start!42558 (= tp!42061 b_and!20461)))

(declare-fun b!474691 () Bool)

(declare-fun res!283532 () Bool)

(declare-fun e!278664 () Bool)

(assert (=> b!474691 (=> (not res!283532) (not e!278664))))

(declare-datatypes ((array!30599 0))(
  ( (array!30600 (arr!14717 (Array (_ BitVec 32) (_ BitVec 64))) (size!15070 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30599)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30599 (_ BitVec 32)) Bool)

(assert (=> b!474691 (= res!283532 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun res!283531 () Bool)

(assert (=> start!42558 (=> (not res!283531) (not e!278664))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42558 (= res!283531 (validMask!0 mask!1365))))

(assert (=> start!42558 e!278664))

(declare-fun tp_is_empty!13435 () Bool)

(assert (=> start!42558 tp_is_empty!13435))

(assert (=> start!42558 tp!42061))

(assert (=> start!42558 true))

(declare-fun array_inv!10700 (array!30599) Bool)

(assert (=> start!42558 (array_inv!10700 _keys!1025)))

(declare-datatypes ((V!19019 0))(
  ( (V!19020 (val!6762 Int)) )
))
(declare-datatypes ((ValueCell!6374 0))(
  ( (ValueCellFull!6374 (v!9049 V!19019)) (EmptyCell!6374) )
))
(declare-datatypes ((array!30601 0))(
  ( (array!30602 (arr!14718 (Array (_ BitVec 32) ValueCell!6374)) (size!15071 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30601)

(declare-fun e!278661 () Bool)

(declare-fun array_inv!10701 (array!30601) Bool)

(assert (=> start!42558 (and (array_inv!10701 _values!833) e!278661)))

(declare-fun b!474692 () Bool)

(declare-fun e!278662 () Bool)

(declare-fun mapRes!21871 () Bool)

(assert (=> b!474692 (= e!278661 (and e!278662 mapRes!21871))))

(declare-fun condMapEmpty!21871 () Bool)

(declare-fun mapDefault!21871 () ValueCell!6374)

(assert (=> b!474692 (= condMapEmpty!21871 (= (arr!14718 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6374)) mapDefault!21871)))))

(declare-fun b!474693 () Bool)

(declare-fun res!283533 () Bool)

(assert (=> b!474693 (=> (not res!283533) (not e!278664))))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(assert (=> b!474693 (= res!283533 (and (= (size!15071 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!15070 _keys!1025) (size!15071 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!21871 () Bool)

(declare-fun tp!42060 () Bool)

(declare-fun e!278660 () Bool)

(assert (=> mapNonEmpty!21871 (= mapRes!21871 (and tp!42060 e!278660))))

(declare-fun mapRest!21871 () (Array (_ BitVec 32) ValueCell!6374))

(declare-fun mapKey!21871 () (_ BitVec 32))

(declare-fun mapValue!21871 () ValueCell!6374)

(assert (=> mapNonEmpty!21871 (= (arr!14718 _values!833) (store mapRest!21871 mapKey!21871 mapValue!21871))))

(declare-fun b!474694 () Bool)

(assert (=> b!474694 (= e!278662 tp_is_empty!13435)))

(declare-fun b!474695 () Bool)

(declare-fun res!283530 () Bool)

(assert (=> b!474695 (=> (not res!283530) (not e!278664))))

(declare-datatypes ((List!9032 0))(
  ( (Nil!9029) (Cons!9028 (h!9884 (_ BitVec 64)) (t!14997 List!9032)) )
))
(declare-fun arrayNoDuplicates!0 (array!30599 (_ BitVec 32) List!9032) Bool)

(assert (=> b!474695 (= res!283530 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!9029))))

(declare-fun b!474696 () Bool)

(assert (=> b!474696 (= e!278660 tp_is_empty!13435)))

(declare-fun b!474697 () Bool)

(assert (=> b!474697 (= e!278664 false)))

(declare-fun zeroValue!794 () V!19019)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((tuple2!8970 0))(
  ( (tuple2!8971 (_1!4496 (_ BitVec 64)) (_2!4496 V!19019)) )
))
(declare-datatypes ((List!9033 0))(
  ( (Nil!9030) (Cons!9029 (h!9885 tuple2!8970) (t!14998 List!9033)) )
))
(declare-datatypes ((ListLongMap!7873 0))(
  ( (ListLongMap!7874 (toList!3952 List!9033)) )
))
(declare-fun lt!216107 () ListLongMap!7873)

(declare-fun minValueAfter!38 () V!19019)

(declare-fun getCurrentListMapNoExtraKeys!2119 (array!30599 array!30601 (_ BitVec 32) (_ BitVec 32) V!19019 V!19019 (_ BitVec 32) Int) ListLongMap!7873)

(assert (=> b!474697 (= lt!216107 (getCurrentListMapNoExtraKeys!2119 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun minValueBefore!38 () V!19019)

(declare-fun lt!216106 () ListLongMap!7873)

(assert (=> b!474697 (= lt!216106 (getCurrentListMapNoExtraKeys!2119 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapIsEmpty!21871 () Bool)

(assert (=> mapIsEmpty!21871 mapRes!21871))

(assert (= (and start!42558 res!283531) b!474693))

(assert (= (and b!474693 res!283533) b!474691))

(assert (= (and b!474691 res!283532) b!474695))

(assert (= (and b!474695 res!283530) b!474697))

(assert (= (and b!474692 condMapEmpty!21871) mapIsEmpty!21871))

(assert (= (and b!474692 (not condMapEmpty!21871)) mapNonEmpty!21871))

(get-info :version)

(assert (= (and mapNonEmpty!21871 ((_ is ValueCellFull!6374) mapValue!21871)) b!474696))

(assert (= (and b!474692 ((_ is ValueCellFull!6374) mapDefault!21871)) b!474694))

(assert (= start!42558 b!474692))

(declare-fun m!456521 () Bool)

(assert (=> start!42558 m!456521))

(declare-fun m!456523 () Bool)

(assert (=> start!42558 m!456523))

(declare-fun m!456525 () Bool)

(assert (=> start!42558 m!456525))

(declare-fun m!456527 () Bool)

(assert (=> b!474697 m!456527))

(declare-fun m!456529 () Bool)

(assert (=> b!474697 m!456529))

(declare-fun m!456531 () Bool)

(assert (=> b!474691 m!456531))

(declare-fun m!456533 () Bool)

(assert (=> mapNonEmpty!21871 m!456533))

(declare-fun m!456535 () Bool)

(assert (=> b!474695 m!456535))

(check-sat (not mapNonEmpty!21871) (not b!474697) (not b!474691) (not b!474695) (not b_next!12007) (not start!42558) b_and!20461 tp_is_empty!13435)
(check-sat b_and!20461 (not b_next!12007))
