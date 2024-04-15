; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20464 () Bool)

(assert start!20464)

(declare-fun b_free!5119 () Bool)

(declare-fun b_next!5119 () Bool)

(assert (=> start!20464 (= b_free!5119 (not b_next!5119))))

(declare-fun tp!18388 () Bool)

(declare-fun b_and!11839 () Bool)

(assert (=> start!20464 (= tp!18388 b_and!11839)))

(declare-fun b!202632 () Bool)

(declare-fun e!132698 () Bool)

(assert (=> b!202632 (= e!132698 true)))

(declare-datatypes ((V!6281 0))(
  ( (V!6282 (val!2532 Int)) )
))
(declare-datatypes ((tuple2!3816 0))(
  ( (tuple2!3817 (_1!1919 (_ BitVec 64)) (_2!1919 V!6281)) )
))
(declare-datatypes ((List!2729 0))(
  ( (Nil!2726) (Cons!2725 (h!3367 tuple2!3816) (t!7651 List!2729)) )
))
(declare-datatypes ((ListLongMap!2719 0))(
  ( (ListLongMap!2720 (toList!1375 List!2729)) )
))
(declare-fun lt!101775 () ListLongMap!2719)

(declare-fun lt!101782 () ListLongMap!2719)

(declare-fun lt!101778 () tuple2!3816)

(declare-fun +!424 (ListLongMap!2719 tuple2!3816) ListLongMap!2719)

(assert (=> b!202632 (= lt!101775 (+!424 lt!101782 lt!101778))))

(declare-fun v!520 () V!6281)

(declare-fun zeroValue!615 () V!6281)

(declare-datatypes ((Unit!6098 0))(
  ( (Unit!6099) )
))
(declare-fun lt!101779 () Unit!6098)

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun lt!101776 () ListLongMap!2719)

(declare-fun addCommutativeForDiffKeys!127 (ListLongMap!2719 (_ BitVec 64) V!6281 (_ BitVec 64) V!6281) Unit!6098)

(assert (=> b!202632 (= lt!101779 (addCommutativeForDiffKeys!127 lt!101776 k0!843 v!520 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun b!202633 () Bool)

(declare-fun res!97167 () Bool)

(declare-fun e!132702 () Bool)

(assert (=> b!202633 (=> (not res!97167) (not e!132702))))

(declare-datatypes ((array!9161 0))(
  ( (array!9162 (arr!4330 (Array (_ BitVec 32) (_ BitVec 64))) (size!4656 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9161)

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!202633 (= res!97167 (= (select (arr!4330 _keys!825) i!601) k0!843))))

(declare-fun mapIsEmpty!8531 () Bool)

(declare-fun mapRes!8531 () Bool)

(assert (=> mapIsEmpty!8531 mapRes!8531))

(declare-fun b!202634 () Bool)

(declare-fun res!97168 () Bool)

(assert (=> b!202634 (=> (not res!97168) (not e!132702))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-datatypes ((ValueCell!2144 0))(
  ( (ValueCellFull!2144 (v!4496 V!6281)) (EmptyCell!2144) )
))
(declare-datatypes ((array!9163 0))(
  ( (array!9164 (arr!4331 (Array (_ BitVec 32) ValueCell!2144)) (size!4657 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9163)

(declare-fun mask!1149 () (_ BitVec 32))

(assert (=> b!202634 (= res!97168 (and (= (size!4657 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4656 _keys!825) (size!4657 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!202635 () Bool)

(declare-fun e!132697 () Bool)

(assert (=> b!202635 (= e!132702 (not e!132697))))

(declare-fun res!97171 () Bool)

(assert (=> b!202635 (=> res!97171 e!132697)))

(assert (=> b!202635 (= res!97171 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun lt!101785 () ListLongMap!2719)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6281)

(declare-fun getCurrentListMap!929 (array!9161 array!9163 (_ BitVec 32) (_ BitVec 32) V!6281 V!6281 (_ BitVec 32) Int) ListLongMap!2719)

(assert (=> b!202635 (= lt!101785 (getCurrentListMap!929 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!101784 () array!9163)

(declare-fun lt!101777 () ListLongMap!2719)

(assert (=> b!202635 (= lt!101777 (getCurrentListMap!929 _keys!825 lt!101784 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!101786 () ListLongMap!2719)

(declare-fun lt!101780 () ListLongMap!2719)

(assert (=> b!202635 (and (= lt!101786 lt!101780) (= lt!101780 lt!101786))))

(assert (=> b!202635 (= lt!101780 (+!424 lt!101776 lt!101778))))

(assert (=> b!202635 (= lt!101778 (tuple2!3817 k0!843 v!520))))

(declare-fun lt!101781 () Unit!6098)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!88 (array!9161 array!9163 (_ BitVec 32) (_ BitVec 32) V!6281 V!6281 (_ BitVec 32) (_ BitVec 64) V!6281 (_ BitVec 32) Int) Unit!6098)

(assert (=> b!202635 (= lt!101781 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!88 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!339 (array!9161 array!9163 (_ BitVec 32) (_ BitVec 32) V!6281 V!6281 (_ BitVec 32) Int) ListLongMap!2719)

(assert (=> b!202635 (= lt!101786 (getCurrentListMapNoExtraKeys!339 _keys!825 lt!101784 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!202635 (= lt!101784 (array!9164 (store (arr!4331 _values!649) i!601 (ValueCellFull!2144 v!520)) (size!4657 _values!649)))))

(assert (=> b!202635 (= lt!101776 (getCurrentListMapNoExtraKeys!339 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!202636 () Bool)

(declare-fun res!97169 () Bool)

(assert (=> b!202636 (=> (not res!97169) (not e!132702))))

(assert (=> b!202636 (= res!97169 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4656 _keys!825))))))

(declare-fun b!202637 () Bool)

(declare-fun e!132696 () Bool)

(declare-fun tp_is_empty!4975 () Bool)

(assert (=> b!202637 (= e!132696 tp_is_empty!4975)))

(declare-fun b!202638 () Bool)

(declare-fun e!132701 () Bool)

(assert (=> b!202638 (= e!132701 tp_is_empty!4975)))

(declare-fun mapNonEmpty!8531 () Bool)

(declare-fun tp!18389 () Bool)

(assert (=> mapNonEmpty!8531 (= mapRes!8531 (and tp!18389 e!132696))))

(declare-fun mapKey!8531 () (_ BitVec 32))

(declare-fun mapRest!8531 () (Array (_ BitVec 32) ValueCell!2144))

(declare-fun mapValue!8531 () ValueCell!2144)

(assert (=> mapNonEmpty!8531 (= (arr!4331 _values!649) (store mapRest!8531 mapKey!8531 mapValue!8531))))

(declare-fun b!202639 () Bool)

(declare-fun res!97164 () Bool)

(assert (=> b!202639 (=> (not res!97164) (not e!132702))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9161 (_ BitVec 32)) Bool)

(assert (=> b!202639 (= res!97164 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!202640 () Bool)

(declare-fun res!97165 () Bool)

(assert (=> b!202640 (=> (not res!97165) (not e!132702))))

(declare-datatypes ((List!2730 0))(
  ( (Nil!2727) (Cons!2726 (h!3368 (_ BitVec 64)) (t!7652 List!2730)) )
))
(declare-fun arrayNoDuplicates!0 (array!9161 (_ BitVec 32) List!2730) Bool)

(assert (=> b!202640 (= res!97165 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2727))))

(declare-fun b!202641 () Bool)

(declare-fun e!132699 () Bool)

(assert (=> b!202641 (= e!132699 (and e!132701 mapRes!8531))))

(declare-fun condMapEmpty!8531 () Bool)

(declare-fun mapDefault!8531 () ValueCell!2144)

(assert (=> b!202641 (= condMapEmpty!8531 (= (arr!4331 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2144)) mapDefault!8531)))))

(declare-fun b!202642 () Bool)

(declare-fun res!97170 () Bool)

(assert (=> b!202642 (=> (not res!97170) (not e!132702))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!202642 (= res!97170 (validKeyInArray!0 k0!843))))

(declare-fun b!202643 () Bool)

(assert (=> b!202643 (= e!132697 e!132698)))

(declare-fun res!97166 () Bool)

(assert (=> b!202643 (=> res!97166 e!132698)))

(assert (=> b!202643 (= res!97166 (= k0!843 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!202643 (= lt!101777 lt!101775)))

(declare-fun lt!101783 () tuple2!3816)

(assert (=> b!202643 (= lt!101775 (+!424 lt!101780 lt!101783))))

(assert (=> b!202643 (= lt!101785 lt!101782)))

(assert (=> b!202643 (= lt!101782 (+!424 lt!101776 lt!101783))))

(assert (=> b!202643 (= lt!101777 (+!424 lt!101786 lt!101783))))

(assert (=> b!202643 (= lt!101783 (tuple2!3817 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun res!97172 () Bool)

(assert (=> start!20464 (=> (not res!97172) (not e!132702))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20464 (= res!97172 (validMask!0 mask!1149))))

(assert (=> start!20464 e!132702))

(declare-fun array_inv!2843 (array!9163) Bool)

(assert (=> start!20464 (and (array_inv!2843 _values!649) e!132699)))

(assert (=> start!20464 true))

(assert (=> start!20464 tp_is_empty!4975))

(declare-fun array_inv!2844 (array!9161) Bool)

(assert (=> start!20464 (array_inv!2844 _keys!825)))

(assert (=> start!20464 tp!18388))

(assert (= (and start!20464 res!97172) b!202634))

(assert (= (and b!202634 res!97168) b!202639))

(assert (= (and b!202639 res!97164) b!202640))

(assert (= (and b!202640 res!97165) b!202636))

(assert (= (and b!202636 res!97169) b!202642))

(assert (= (and b!202642 res!97170) b!202633))

(assert (= (and b!202633 res!97167) b!202635))

(assert (= (and b!202635 (not res!97171)) b!202643))

(assert (= (and b!202643 (not res!97166)) b!202632))

(assert (= (and b!202641 condMapEmpty!8531) mapIsEmpty!8531))

(assert (= (and b!202641 (not condMapEmpty!8531)) mapNonEmpty!8531))

(get-info :version)

(assert (= (and mapNonEmpty!8531 ((_ is ValueCellFull!2144) mapValue!8531)) b!202637))

(assert (= (and b!202641 ((_ is ValueCellFull!2144) mapDefault!8531)) b!202638))

(assert (= start!20464 b!202641))

(declare-fun m!229515 () Bool)

(assert (=> mapNonEmpty!8531 m!229515))

(declare-fun m!229517 () Bool)

(assert (=> b!202643 m!229517))

(declare-fun m!229519 () Bool)

(assert (=> b!202643 m!229519))

(declare-fun m!229521 () Bool)

(assert (=> b!202643 m!229521))

(declare-fun m!229523 () Bool)

(assert (=> b!202639 m!229523))

(declare-fun m!229525 () Bool)

(assert (=> b!202633 m!229525))

(declare-fun m!229527 () Bool)

(assert (=> b!202632 m!229527))

(declare-fun m!229529 () Bool)

(assert (=> b!202632 m!229529))

(declare-fun m!229531 () Bool)

(assert (=> b!202640 m!229531))

(declare-fun m!229533 () Bool)

(assert (=> b!202635 m!229533))

(declare-fun m!229535 () Bool)

(assert (=> b!202635 m!229535))

(declare-fun m!229537 () Bool)

(assert (=> b!202635 m!229537))

(declare-fun m!229539 () Bool)

(assert (=> b!202635 m!229539))

(declare-fun m!229541 () Bool)

(assert (=> b!202635 m!229541))

(declare-fun m!229543 () Bool)

(assert (=> b!202635 m!229543))

(declare-fun m!229545 () Bool)

(assert (=> b!202635 m!229545))

(declare-fun m!229547 () Bool)

(assert (=> start!20464 m!229547))

(declare-fun m!229549 () Bool)

(assert (=> start!20464 m!229549))

(declare-fun m!229551 () Bool)

(assert (=> start!20464 m!229551))

(declare-fun m!229553 () Bool)

(assert (=> b!202642 m!229553))

(check-sat tp_is_empty!4975 (not b!202635) (not b!202639) (not start!20464) (not b!202640) (not b!202643) (not b!202642) (not b_next!5119) (not mapNonEmpty!8531) b_and!11839 (not b!202632))
(check-sat b_and!11839 (not b_next!5119))
