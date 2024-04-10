; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20354 () Bool)

(assert start!20354)

(declare-fun b_free!5013 () Bool)

(declare-fun b_next!5013 () Bool)

(assert (=> start!20354 (= b_free!5013 (not b_next!5013))))

(declare-fun tp!18071 () Bool)

(declare-fun b_and!11759 () Bool)

(assert (=> start!20354 (= tp!18071 b_and!11759)))

(declare-fun b!200862 () Bool)

(declare-fun e!131690 () Bool)

(declare-fun e!131687 () Bool)

(assert (=> b!200862 (= e!131690 e!131687)))

(declare-fun res!95821 () Bool)

(assert (=> b!200862 (=> res!95821 e!131687)))

(declare-fun k0!843 () (_ BitVec 64))

(assert (=> b!200862 (= res!95821 (= k0!843 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((V!6139 0))(
  ( (V!6140 (val!2479 Int)) )
))
(declare-datatypes ((tuple2!3750 0))(
  ( (tuple2!3751 (_1!1886 (_ BitVec 64)) (_2!1886 V!6139)) )
))
(declare-datatypes ((List!2666 0))(
  ( (Nil!2663) (Cons!2662 (h!3304 tuple2!3750) (t!7597 List!2666)) )
))
(declare-datatypes ((ListLongMap!2663 0))(
  ( (ListLongMap!2664 (toList!1347 List!2666)) )
))
(declare-fun lt!99603 () ListLongMap!2663)

(declare-fun lt!99608 () ListLongMap!2663)

(assert (=> b!200862 (= lt!99603 lt!99608)))

(declare-fun lt!99605 () ListLongMap!2663)

(declare-fun lt!99613 () tuple2!3750)

(declare-fun +!374 (ListLongMap!2663 tuple2!3750) ListLongMap!2663)

(assert (=> b!200862 (= lt!99608 (+!374 lt!99605 lt!99613))))

(declare-fun lt!99612 () ListLongMap!2663)

(declare-datatypes ((Unit!6048 0))(
  ( (Unit!6049) )
))
(declare-fun lt!99610 () Unit!6048)

(declare-fun v!520 () V!6139)

(declare-fun zeroValue!615 () V!6139)

(declare-fun addCommutativeForDiffKeys!95 (ListLongMap!2663 (_ BitVec 64) V!6139 (_ BitVec 64) V!6139) Unit!6048)

(assert (=> b!200862 (= lt!99610 (addCommutativeForDiffKeys!95 lt!99612 k0!843 v!520 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun lt!99611 () ListLongMap!2663)

(declare-fun lt!99604 () tuple2!3750)

(assert (=> b!200862 (= lt!99611 (+!374 lt!99603 lt!99604))))

(declare-fun lt!99614 () ListLongMap!2663)

(declare-fun lt!99600 () tuple2!3750)

(assert (=> b!200862 (= lt!99603 (+!374 lt!99614 lt!99600))))

(declare-fun lt!99615 () ListLongMap!2663)

(declare-fun lt!99606 () ListLongMap!2663)

(assert (=> b!200862 (= lt!99615 lt!99606)))

(assert (=> b!200862 (= lt!99606 (+!374 lt!99605 lt!99604))))

(assert (=> b!200862 (= lt!99605 (+!374 lt!99612 lt!99600))))

(declare-fun lt!99601 () ListLongMap!2663)

(assert (=> b!200862 (= lt!99611 (+!374 (+!374 lt!99601 lt!99600) lt!99604))))

(declare-fun minValue!615 () V!6139)

(assert (=> b!200862 (= lt!99604 (tuple2!3751 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(assert (=> b!200862 (= lt!99600 (tuple2!3751 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun mapNonEmpty!8372 () Bool)

(declare-fun mapRes!8372 () Bool)

(declare-fun tp!18070 () Bool)

(declare-fun e!131685 () Bool)

(assert (=> mapNonEmpty!8372 (= mapRes!8372 (and tp!18070 e!131685))))

(declare-datatypes ((ValueCell!2091 0))(
  ( (ValueCellFull!2091 (v!4449 V!6139)) (EmptyCell!2091) )
))
(declare-datatypes ((array!8969 0))(
  ( (array!8970 (arr!4235 (Array (_ BitVec 32) ValueCell!2091)) (size!4560 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8969)

(declare-fun mapRest!8372 () (Array (_ BitVec 32) ValueCell!2091))

(declare-fun mapValue!8372 () ValueCell!2091)

(declare-fun mapKey!8372 () (_ BitVec 32))

(assert (=> mapNonEmpty!8372 (= (arr!4235 _values!649) (store mapRest!8372 mapKey!8372 mapValue!8372))))

(declare-fun b!200863 () Bool)

(declare-fun res!95824 () Bool)

(declare-fun e!131689 () Bool)

(assert (=> b!200863 (=> (not res!95824) (not e!131689))))

(declare-datatypes ((array!8971 0))(
  ( (array!8972 (arr!4236 (Array (_ BitVec 32) (_ BitVec 64))) (size!4561 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8971)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun mask!1149 () (_ BitVec 32))

(assert (=> b!200863 (= res!95824 (and (= (size!4560 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4561 _keys!825) (size!4560 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun res!95823 () Bool)

(assert (=> start!20354 (=> (not res!95823) (not e!131689))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20354 (= res!95823 (validMask!0 mask!1149))))

(assert (=> start!20354 e!131689))

(declare-fun e!131684 () Bool)

(declare-fun array_inv!2787 (array!8969) Bool)

(assert (=> start!20354 (and (array_inv!2787 _values!649) e!131684)))

(assert (=> start!20354 true))

(declare-fun tp_is_empty!4869 () Bool)

(assert (=> start!20354 tp_is_empty!4869))

(declare-fun array_inv!2788 (array!8971) Bool)

(assert (=> start!20354 (array_inv!2788 _keys!825)))

(assert (=> start!20354 tp!18071))

(declare-fun b!200864 () Bool)

(assert (=> b!200864 (= e!131689 (not e!131690))))

(declare-fun res!95825 () Bool)

(assert (=> b!200864 (=> res!95825 e!131690)))

(assert (=> b!200864 (= res!95825 (or (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!657 () Int)

(declare-fun getCurrentListMap!936 (array!8971 array!8969 (_ BitVec 32) (_ BitVec 32) V!6139 V!6139 (_ BitVec 32) Int) ListLongMap!2663)

(assert (=> b!200864 (= lt!99615 (getCurrentListMap!936 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!99602 () array!8969)

(assert (=> b!200864 (= lt!99611 (getCurrentListMap!936 _keys!825 lt!99602 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!200864 (and (= lt!99601 lt!99614) (= lt!99614 lt!99601))))

(assert (=> b!200864 (= lt!99614 (+!374 lt!99612 lt!99613))))

(assert (=> b!200864 (= lt!99613 (tuple2!3751 k0!843 v!520))))

(declare-fun i!601 () (_ BitVec 32))

(declare-fun lt!99609 () Unit!6048)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!49 (array!8971 array!8969 (_ BitVec 32) (_ BitVec 32) V!6139 V!6139 (_ BitVec 32) (_ BitVec 64) V!6139 (_ BitVec 32) Int) Unit!6048)

(assert (=> b!200864 (= lt!99609 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!49 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!310 (array!8971 array!8969 (_ BitVec 32) (_ BitVec 32) V!6139 V!6139 (_ BitVec 32) Int) ListLongMap!2663)

(assert (=> b!200864 (= lt!99601 (getCurrentListMapNoExtraKeys!310 _keys!825 lt!99602 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!200864 (= lt!99602 (array!8970 (store (arr!4235 _values!649) i!601 (ValueCellFull!2091 v!520)) (size!4560 _values!649)))))

(assert (=> b!200864 (= lt!99612 (getCurrentListMapNoExtraKeys!310 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!200865 () Bool)

(declare-fun res!95822 () Bool)

(assert (=> b!200865 (=> (not res!95822) (not e!131689))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8971 (_ BitVec 32)) Bool)

(assert (=> b!200865 (= res!95822 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun mapIsEmpty!8372 () Bool)

(assert (=> mapIsEmpty!8372 mapRes!8372))

(declare-fun b!200866 () Bool)

(declare-fun res!95820 () Bool)

(assert (=> b!200866 (=> (not res!95820) (not e!131689))))

(assert (=> b!200866 (= res!95820 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4561 _keys!825))))))

(declare-fun b!200867 () Bool)

(assert (=> b!200867 (= e!131685 tp_is_empty!4869)))

(declare-fun b!200868 () Bool)

(declare-fun e!131688 () Bool)

(assert (=> b!200868 (= e!131684 (and e!131688 mapRes!8372))))

(declare-fun condMapEmpty!8372 () Bool)

(declare-fun mapDefault!8372 () ValueCell!2091)

(assert (=> b!200868 (= condMapEmpty!8372 (= (arr!4235 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2091)) mapDefault!8372)))))

(declare-fun b!200869 () Bool)

(declare-fun res!95819 () Bool)

(assert (=> b!200869 (=> (not res!95819) (not e!131689))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!200869 (= res!95819 (validKeyInArray!0 k0!843))))

(declare-fun b!200870 () Bool)

(assert (=> b!200870 (= e!131687 true)))

(assert (=> b!200870 (= (+!374 lt!99608 lt!99604) (+!374 lt!99606 lt!99613))))

(declare-fun lt!99607 () Unit!6048)

(assert (=> b!200870 (= lt!99607 (addCommutativeForDiffKeys!95 lt!99605 k0!843 v!520 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!200871 () Bool)

(declare-fun res!95826 () Bool)

(assert (=> b!200871 (=> (not res!95826) (not e!131689))))

(declare-datatypes ((List!2667 0))(
  ( (Nil!2664) (Cons!2663 (h!3305 (_ BitVec 64)) (t!7598 List!2667)) )
))
(declare-fun arrayNoDuplicates!0 (array!8971 (_ BitVec 32) List!2667) Bool)

(assert (=> b!200871 (= res!95826 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2664))))

(declare-fun b!200872 () Bool)

(declare-fun res!95827 () Bool)

(assert (=> b!200872 (=> (not res!95827) (not e!131689))))

(assert (=> b!200872 (= res!95827 (= (select (arr!4236 _keys!825) i!601) k0!843))))

(declare-fun b!200873 () Bool)

(assert (=> b!200873 (= e!131688 tp_is_empty!4869)))

(assert (= (and start!20354 res!95823) b!200863))

(assert (= (and b!200863 res!95824) b!200865))

(assert (= (and b!200865 res!95822) b!200871))

(assert (= (and b!200871 res!95826) b!200866))

(assert (= (and b!200866 res!95820) b!200869))

(assert (= (and b!200869 res!95819) b!200872))

(assert (= (and b!200872 res!95827) b!200864))

(assert (= (and b!200864 (not res!95825)) b!200862))

(assert (= (and b!200862 (not res!95821)) b!200870))

(assert (= (and b!200868 condMapEmpty!8372) mapIsEmpty!8372))

(assert (= (and b!200868 (not condMapEmpty!8372)) mapNonEmpty!8372))

(get-info :version)

(assert (= (and mapNonEmpty!8372 ((_ is ValueCellFull!2091) mapValue!8372)) b!200867))

(assert (= (and b!200868 ((_ is ValueCellFull!2091) mapDefault!8372)) b!200873))

(assert (= start!20354 b!200868))

(declare-fun m!227531 () Bool)

(assert (=> b!200864 m!227531))

(declare-fun m!227533 () Bool)

(assert (=> b!200864 m!227533))

(declare-fun m!227535 () Bool)

(assert (=> b!200864 m!227535))

(declare-fun m!227537 () Bool)

(assert (=> b!200864 m!227537))

(declare-fun m!227539 () Bool)

(assert (=> b!200864 m!227539))

(declare-fun m!227541 () Bool)

(assert (=> b!200864 m!227541))

(declare-fun m!227543 () Bool)

(assert (=> b!200864 m!227543))

(declare-fun m!227545 () Bool)

(assert (=> b!200862 m!227545))

(declare-fun m!227547 () Bool)

(assert (=> b!200862 m!227547))

(declare-fun m!227549 () Bool)

(assert (=> b!200862 m!227549))

(declare-fun m!227551 () Bool)

(assert (=> b!200862 m!227551))

(assert (=> b!200862 m!227549))

(declare-fun m!227553 () Bool)

(assert (=> b!200862 m!227553))

(declare-fun m!227555 () Bool)

(assert (=> b!200862 m!227555))

(declare-fun m!227557 () Bool)

(assert (=> b!200862 m!227557))

(declare-fun m!227559 () Bool)

(assert (=> b!200862 m!227559))

(declare-fun m!227561 () Bool)

(assert (=> b!200870 m!227561))

(declare-fun m!227563 () Bool)

(assert (=> b!200870 m!227563))

(declare-fun m!227565 () Bool)

(assert (=> b!200870 m!227565))

(declare-fun m!227567 () Bool)

(assert (=> b!200871 m!227567))

(declare-fun m!227569 () Bool)

(assert (=> b!200865 m!227569))

(declare-fun m!227571 () Bool)

(assert (=> start!20354 m!227571))

(declare-fun m!227573 () Bool)

(assert (=> start!20354 m!227573))

(declare-fun m!227575 () Bool)

(assert (=> start!20354 m!227575))

(declare-fun m!227577 () Bool)

(assert (=> b!200869 m!227577))

(declare-fun m!227579 () Bool)

(assert (=> b!200872 m!227579))

(declare-fun m!227581 () Bool)

(assert (=> mapNonEmpty!8372 m!227581))

(check-sat (not b!200870) tp_is_empty!4869 b_and!11759 (not b_next!5013) (not b!200865) (not b!200862) (not mapNonEmpty!8372) (not b!200869) (not b!200864) (not start!20354) (not b!200871))
(check-sat b_and!11759 (not b_next!5013))
