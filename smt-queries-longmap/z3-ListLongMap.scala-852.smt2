; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20212 () Bool)

(assert start!20212)

(declare-fun b_free!4867 () Bool)

(declare-fun b_next!4867 () Bool)

(assert (=> start!20212 (= b_free!4867 (not b_next!4867))))

(declare-fun tp!17633 () Bool)

(declare-fun b_and!11587 () Bool)

(assert (=> start!20212 (= tp!17633 b_and!11587)))

(declare-fun b!198407 () Bool)

(declare-fun e!130382 () Bool)

(declare-fun tp_is_empty!4723 () Bool)

(assert (=> b!198407 (= e!130382 tp_is_empty!4723)))

(declare-fun b!198408 () Bool)

(declare-fun e!130383 () Bool)

(assert (=> b!198408 (= e!130383 (not true))))

(declare-datatypes ((V!5945 0))(
  ( (V!5946 (val!2406 Int)) )
))
(declare-datatypes ((tuple2!3610 0))(
  ( (tuple2!3611 (_1!1816 (_ BitVec 64)) (_2!1816 V!5945)) )
))
(declare-datatypes ((List!2542 0))(
  ( (Nil!2539) (Cons!2538 (h!3180 tuple2!3610) (t!7464 List!2542)) )
))
(declare-datatypes ((ListLongMap!2513 0))(
  ( (ListLongMap!2514 (toList!1272 List!2542)) )
))
(declare-fun lt!97763 () ListLongMap!2513)

(declare-fun lt!97764 () ListLongMap!2513)

(assert (=> b!198408 (and (= lt!97763 lt!97764) (= lt!97764 lt!97763))))

(declare-fun lt!97766 () ListLongMap!2513)

(declare-fun v!520 () V!5945)

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun +!321 (ListLongMap!2513 tuple2!3610) ListLongMap!2513)

(assert (=> b!198408 (= lt!97764 (+!321 lt!97766 (tuple2!3611 k0!843 v!520)))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun i!601 () (_ BitVec 32))

(declare-datatypes ((array!8671 0))(
  ( (array!8672 (arr!4085 (Array (_ BitVec 32) (_ BitVec 64))) (size!4411 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8671)

(declare-fun defaultEntry!657 () Int)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun minValue!615 () V!5945)

(declare-datatypes ((ValueCell!2018 0))(
  ( (ValueCellFull!2018 (v!4370 V!5945)) (EmptyCell!2018) )
))
(declare-datatypes ((array!8673 0))(
  ( (array!8674 (arr!4086 (Array (_ BitVec 32) ValueCell!2018)) (size!4412 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8673)

(declare-fun zeroValue!615 () V!5945)

(declare-datatypes ((Unit!5894 0))(
  ( (Unit!5895) )
))
(declare-fun lt!97765 () Unit!5894)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!1 (array!8671 array!8673 (_ BitVec 32) (_ BitVec 32) V!5945 V!5945 (_ BitVec 32) (_ BitVec 64) V!5945 (_ BitVec 32) Int) Unit!5894)

(assert (=> b!198408 (= lt!97765 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!1 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!252 (array!8671 array!8673 (_ BitVec 32) (_ BitVec 32) V!5945 V!5945 (_ BitVec 32) Int) ListLongMap!2513)

(assert (=> b!198408 (= lt!97763 (getCurrentListMapNoExtraKeys!252 _keys!825 (array!8674 (store (arr!4086 _values!649) i!601 (ValueCellFull!2018 v!520)) (size!4412 _values!649)) mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!198408 (= lt!97766 (getCurrentListMapNoExtraKeys!252 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!198409 () Bool)

(declare-fun res!94075 () Bool)

(assert (=> b!198409 (=> (not res!94075) (not e!130383))))

(assert (=> b!198409 (= res!94075 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4411 _keys!825))))))

(declare-fun b!198410 () Bool)

(declare-fun res!94073 () Bool)

(assert (=> b!198410 (=> (not res!94073) (not e!130383))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8671 (_ BitVec 32)) Bool)

(assert (=> b!198410 (= res!94073 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!198411 () Bool)

(declare-fun e!130381 () Bool)

(declare-fun e!130379 () Bool)

(declare-fun mapRes!8153 () Bool)

(assert (=> b!198411 (= e!130381 (and e!130379 mapRes!8153))))

(declare-fun condMapEmpty!8153 () Bool)

(declare-fun mapDefault!8153 () ValueCell!2018)

(assert (=> b!198411 (= condMapEmpty!8153 (= (arr!4086 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2018)) mapDefault!8153)))))

(declare-fun b!198413 () Bool)

(declare-fun res!94077 () Bool)

(assert (=> b!198413 (=> (not res!94077) (not e!130383))))

(assert (=> b!198413 (= res!94077 (and (= (size!4412 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4411 _keys!825) (size!4412 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!8153 () Bool)

(declare-fun tp!17632 () Bool)

(assert (=> mapNonEmpty!8153 (= mapRes!8153 (and tp!17632 e!130382))))

(declare-fun mapKey!8153 () (_ BitVec 32))

(declare-fun mapValue!8153 () ValueCell!2018)

(declare-fun mapRest!8153 () (Array (_ BitVec 32) ValueCell!2018))

(assert (=> mapNonEmpty!8153 (= (arr!4086 _values!649) (store mapRest!8153 mapKey!8153 mapValue!8153))))

(declare-fun b!198414 () Bool)

(declare-fun res!94074 () Bool)

(assert (=> b!198414 (=> (not res!94074) (not e!130383))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!198414 (= res!94074 (validKeyInArray!0 k0!843))))

(declare-fun b!198415 () Bool)

(declare-fun res!94079 () Bool)

(assert (=> b!198415 (=> (not res!94079) (not e!130383))))

(assert (=> b!198415 (= res!94079 (= (select (arr!4085 _keys!825) i!601) k0!843))))

(declare-fun b!198412 () Bool)

(declare-fun res!94078 () Bool)

(assert (=> b!198412 (=> (not res!94078) (not e!130383))))

(declare-datatypes ((List!2543 0))(
  ( (Nil!2540) (Cons!2539 (h!3181 (_ BitVec 64)) (t!7465 List!2543)) )
))
(declare-fun arrayNoDuplicates!0 (array!8671 (_ BitVec 32) List!2543) Bool)

(assert (=> b!198412 (= res!94078 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2540))))

(declare-fun res!94076 () Bool)

(assert (=> start!20212 (=> (not res!94076) (not e!130383))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20212 (= res!94076 (validMask!0 mask!1149))))

(assert (=> start!20212 e!130383))

(declare-fun array_inv!2659 (array!8673) Bool)

(assert (=> start!20212 (and (array_inv!2659 _values!649) e!130381)))

(assert (=> start!20212 true))

(assert (=> start!20212 tp_is_empty!4723))

(declare-fun array_inv!2660 (array!8671) Bool)

(assert (=> start!20212 (array_inv!2660 _keys!825)))

(assert (=> start!20212 tp!17633))

(declare-fun mapIsEmpty!8153 () Bool)

(assert (=> mapIsEmpty!8153 mapRes!8153))

(declare-fun b!198416 () Bool)

(assert (=> b!198416 (= e!130379 tp_is_empty!4723)))

(assert (= (and start!20212 res!94076) b!198413))

(assert (= (and b!198413 res!94077) b!198410))

(assert (= (and b!198410 res!94073) b!198412))

(assert (= (and b!198412 res!94078) b!198409))

(assert (= (and b!198409 res!94075) b!198414))

(assert (= (and b!198414 res!94074) b!198415))

(assert (= (and b!198415 res!94079) b!198408))

(assert (= (and b!198411 condMapEmpty!8153) mapIsEmpty!8153))

(assert (= (and b!198411 (not condMapEmpty!8153)) mapNonEmpty!8153))

(get-info :version)

(assert (= (and mapNonEmpty!8153 ((_ is ValueCellFull!2018) mapValue!8153)) b!198407))

(assert (= (and b!198411 ((_ is ValueCellFull!2018) mapDefault!8153)) b!198416))

(assert (= start!20212 b!198411))

(declare-fun m!224517 () Bool)

(assert (=> b!198408 m!224517))

(declare-fun m!224519 () Bool)

(assert (=> b!198408 m!224519))

(declare-fun m!224521 () Bool)

(assert (=> b!198408 m!224521))

(declare-fun m!224523 () Bool)

(assert (=> b!198408 m!224523))

(declare-fun m!224525 () Bool)

(assert (=> b!198408 m!224525))

(declare-fun m!224527 () Bool)

(assert (=> b!198410 m!224527))

(declare-fun m!224529 () Bool)

(assert (=> mapNonEmpty!8153 m!224529))

(declare-fun m!224531 () Bool)

(assert (=> b!198415 m!224531))

(declare-fun m!224533 () Bool)

(assert (=> start!20212 m!224533))

(declare-fun m!224535 () Bool)

(assert (=> start!20212 m!224535))

(declare-fun m!224537 () Bool)

(assert (=> start!20212 m!224537))

(declare-fun m!224539 () Bool)

(assert (=> b!198414 m!224539))

(declare-fun m!224541 () Bool)

(assert (=> b!198412 m!224541))

(check-sat (not start!20212) (not mapNonEmpty!8153) (not b_next!4867) (not b!198412) tp_is_empty!4723 (not b!198410) (not b!198408) b_and!11587 (not b!198414))
(check-sat b_and!11587 (not b_next!4867))
