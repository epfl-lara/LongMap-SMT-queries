; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20284 () Bool)

(assert start!20284)

(declare-fun b_free!4939 () Bool)

(declare-fun b_next!4939 () Bool)

(assert (=> start!20284 (= b_free!4939 (not b_next!4939))))

(declare-fun tp!17848 () Bool)

(declare-fun b_and!11699 () Bool)

(assert (=> start!20284 (= tp!17848 b_and!11699)))

(declare-fun b!199681 () Bool)

(declare-fun res!94950 () Bool)

(declare-fun e!131048 () Bool)

(assert (=> b!199681 (=> (not res!94950) (not e!131048))))

(declare-datatypes ((array!8819 0))(
  ( (array!8820 (arr!4160 (Array (_ BitVec 32) (_ BitVec 64))) (size!4485 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8819)

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!199681 (= res!94950 (= (select (arr!4160 _keys!825) i!601) k0!843))))

(declare-fun mapNonEmpty!8261 () Bool)

(declare-fun mapRes!8261 () Bool)

(declare-fun tp!17849 () Bool)

(declare-fun e!131045 () Bool)

(assert (=> mapNonEmpty!8261 (= mapRes!8261 (and tp!17849 e!131045))))

(declare-fun mapKey!8261 () (_ BitVec 32))

(declare-datatypes ((V!6041 0))(
  ( (V!6042 (val!2442 Int)) )
))
(declare-datatypes ((ValueCell!2054 0))(
  ( (ValueCellFull!2054 (v!4413 V!6041)) (EmptyCell!2054) )
))
(declare-fun mapRest!8261 () (Array (_ BitVec 32) ValueCell!2054))

(declare-datatypes ((array!8821 0))(
  ( (array!8822 (arr!4161 (Array (_ BitVec 32) ValueCell!2054)) (size!4486 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8821)

(declare-fun mapValue!8261 () ValueCell!2054)

(assert (=> mapNonEmpty!8261 (= (arr!4161 _values!649) (store mapRest!8261 mapKey!8261 mapValue!8261))))

(declare-fun b!199682 () Bool)

(assert (=> b!199682 (= e!131048 (not true))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun zeroValue!615 () V!6041)

(declare-fun defaultEntry!657 () Int)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun minValue!615 () V!6041)

(declare-fun lt!98494 () array!8821)

(declare-datatypes ((tuple2!3634 0))(
  ( (tuple2!3635 (_1!1828 (_ BitVec 64)) (_2!1828 V!6041)) )
))
(declare-datatypes ((List!2554 0))(
  ( (Nil!2551) (Cons!2550 (h!3192 tuple2!3634) (t!7477 List!2554)) )
))
(declare-datatypes ((ListLongMap!2549 0))(
  ( (ListLongMap!2550 (toList!1290 List!2554)) )
))
(declare-fun lt!98497 () ListLongMap!2549)

(declare-fun getCurrentListMap!887 (array!8819 array!8821 (_ BitVec 32) (_ BitVec 32) V!6041 V!6041 (_ BitVec 32) Int) ListLongMap!2549)

(assert (=> b!199682 (= lt!98497 (getCurrentListMap!887 _keys!825 lt!98494 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!98498 () ListLongMap!2549)

(declare-fun lt!98495 () ListLongMap!2549)

(assert (=> b!199682 (and (= lt!98498 lt!98495) (= lt!98495 lt!98498))))

(declare-fun lt!98496 () ListLongMap!2549)

(declare-fun v!520 () V!6041)

(declare-fun +!344 (ListLongMap!2549 tuple2!3634) ListLongMap!2549)

(assert (=> b!199682 (= lt!98495 (+!344 lt!98496 (tuple2!3635 k0!843 v!520)))))

(declare-datatypes ((Unit!5974 0))(
  ( (Unit!5975) )
))
(declare-fun lt!98493 () Unit!5974)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!23 (array!8819 array!8821 (_ BitVec 32) (_ BitVec 32) V!6041 V!6041 (_ BitVec 32) (_ BitVec 64) V!6041 (_ BitVec 32) Int) Unit!5974)

(assert (=> b!199682 (= lt!98493 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!23 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!280 (array!8819 array!8821 (_ BitVec 32) (_ BitVec 32) V!6041 V!6041 (_ BitVec 32) Int) ListLongMap!2549)

(assert (=> b!199682 (= lt!98498 (getCurrentListMapNoExtraKeys!280 _keys!825 lt!98494 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!199682 (= lt!98494 (array!8822 (store (arr!4161 _values!649) i!601 (ValueCellFull!2054 v!520)) (size!4486 _values!649)))))

(assert (=> b!199682 (= lt!98496 (getCurrentListMapNoExtraKeys!280 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!199683 () Bool)

(declare-fun e!131046 () Bool)

(declare-fun tp_is_empty!4795 () Bool)

(assert (=> b!199683 (= e!131046 tp_is_empty!4795)))

(declare-fun b!199684 () Bool)

(declare-fun res!94951 () Bool)

(assert (=> b!199684 (=> (not res!94951) (not e!131048))))

(declare-datatypes ((List!2555 0))(
  ( (Nil!2552) (Cons!2551 (h!3193 (_ BitVec 64)) (t!7478 List!2555)) )
))
(declare-fun arrayNoDuplicates!0 (array!8819 (_ BitVec 32) List!2555) Bool)

(assert (=> b!199684 (= res!94951 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2552))))

(declare-fun b!199685 () Bool)

(declare-fun e!131044 () Bool)

(assert (=> b!199685 (= e!131044 (and e!131046 mapRes!8261))))

(declare-fun condMapEmpty!8261 () Bool)

(declare-fun mapDefault!8261 () ValueCell!2054)

(assert (=> b!199685 (= condMapEmpty!8261 (= (arr!4161 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2054)) mapDefault!8261)))))

(declare-fun b!199686 () Bool)

(assert (=> b!199686 (= e!131045 tp_is_empty!4795)))

(declare-fun mapIsEmpty!8261 () Bool)

(assert (=> mapIsEmpty!8261 mapRes!8261))

(declare-fun b!199687 () Bool)

(declare-fun res!94947 () Bool)

(assert (=> b!199687 (=> (not res!94947) (not e!131048))))

(assert (=> b!199687 (= res!94947 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4485 _keys!825))))))

(declare-fun b!199689 () Bool)

(declare-fun res!94948 () Bool)

(assert (=> b!199689 (=> (not res!94948) (not e!131048))))

(assert (=> b!199689 (= res!94948 (and (= (size!4486 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4485 _keys!825) (size!4486 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!199690 () Bool)

(declare-fun res!94949 () Bool)

(assert (=> b!199690 (=> (not res!94949) (not e!131048))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8819 (_ BitVec 32)) Bool)

(assert (=> b!199690 (= res!94949 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!199688 () Bool)

(declare-fun res!94946 () Bool)

(assert (=> b!199688 (=> (not res!94946) (not e!131048))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!199688 (= res!94946 (validKeyInArray!0 k0!843))))

(declare-fun res!94945 () Bool)

(assert (=> start!20284 (=> (not res!94945) (not e!131048))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20284 (= res!94945 (validMask!0 mask!1149))))

(assert (=> start!20284 e!131048))

(declare-fun array_inv!2713 (array!8821) Bool)

(assert (=> start!20284 (and (array_inv!2713 _values!649) e!131044)))

(assert (=> start!20284 true))

(assert (=> start!20284 tp_is_empty!4795))

(declare-fun array_inv!2714 (array!8819) Bool)

(assert (=> start!20284 (array_inv!2714 _keys!825)))

(assert (=> start!20284 tp!17848))

(assert (= (and start!20284 res!94945) b!199689))

(assert (= (and b!199689 res!94948) b!199690))

(assert (= (and b!199690 res!94949) b!199684))

(assert (= (and b!199684 res!94951) b!199687))

(assert (= (and b!199687 res!94947) b!199688))

(assert (= (and b!199688 res!94946) b!199681))

(assert (= (and b!199681 res!94950) b!199682))

(assert (= (and b!199685 condMapEmpty!8261) mapIsEmpty!8261))

(assert (= (and b!199685 (not condMapEmpty!8261)) mapNonEmpty!8261))

(get-info :version)

(assert (= (and mapNonEmpty!8261 ((_ is ValueCellFull!2054) mapValue!8261)) b!199686))

(assert (= (and b!199685 ((_ is ValueCellFull!2054) mapDefault!8261)) b!199683))

(assert (= start!20284 b!199685))

(declare-fun m!226269 () Bool)

(assert (=> mapNonEmpty!8261 m!226269))

(declare-fun m!226271 () Bool)

(assert (=> start!20284 m!226271))

(declare-fun m!226273 () Bool)

(assert (=> start!20284 m!226273))

(declare-fun m!226275 () Bool)

(assert (=> start!20284 m!226275))

(declare-fun m!226277 () Bool)

(assert (=> b!199682 m!226277))

(declare-fun m!226279 () Bool)

(assert (=> b!199682 m!226279))

(declare-fun m!226281 () Bool)

(assert (=> b!199682 m!226281))

(declare-fun m!226283 () Bool)

(assert (=> b!199682 m!226283))

(declare-fun m!226285 () Bool)

(assert (=> b!199682 m!226285))

(declare-fun m!226287 () Bool)

(assert (=> b!199682 m!226287))

(declare-fun m!226289 () Bool)

(assert (=> b!199688 m!226289))

(declare-fun m!226291 () Bool)

(assert (=> b!199690 m!226291))

(declare-fun m!226293 () Bool)

(assert (=> b!199684 m!226293))

(declare-fun m!226295 () Bool)

(assert (=> b!199681 m!226295))

(check-sat (not b!199690) tp_is_empty!4795 b_and!11699 (not mapNonEmpty!8261) (not b!199682) (not b!199684) (not b_next!4939) (not start!20284) (not b!199688))
(check-sat b_and!11699 (not b_next!4939))
